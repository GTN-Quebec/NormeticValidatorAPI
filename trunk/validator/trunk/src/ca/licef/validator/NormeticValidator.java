package ca.licef.validator;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.StringWriter;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.xml.transform.Source;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.URIResolver;
import javax.xml.transform.stream.StreamSource;

import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

public class NormeticValidator {

    public static final String VALIDATION_STATUS_OK = "Ok";
    public static final String VALIDATION_STATUS_OK_WITH_WARNINGS = "OkWithWarnings";
    public static final String VALIDATION_STATUS_INVALID = "Invalid";

    public NormeticValidator() {
    }

    public ValidationReport validateFolder( File lomFolder ) throws IOException, FileNotFoundException, TransformerConfigurationException, TransformerException, SAXException, ValidatorException {
        if( !lomFolder.exists() )
            throw( new ValidatorException( "Folder not found: " + lomFolder ) );
            
        if( !lomFolder.isDirectory() )
            throw( new ValidatorException( "Folder is not a directory: " + lomFolder ) );

        ValidationReport report = new ValidationReport();
        File controlFile = new File( lomFolder, "control.txt" );
        BufferedReader reader = null;
        Pattern fileLinePattern = Pattern.compile( "file:\\s*([.A-Za-z0-9_-]+?)\\s+expectedResult:\\s*(.+)" );
        Pattern folderLinePattern = Pattern.compile( "folder:\\s*([.A-Za-z0-9_-]+)" );
        try {
            FileReader fileReader = new FileReader( controlFile );
            String line = null;
            reader = new BufferedReader( fileReader );
            while( ( line = reader.readLine() ) != null ) {
                int indexOfSharp = line.indexOf( "#" );
                if( indexOfSharp != -1 )
                    line = line.substring( 0, indexOfSharp );

                Matcher fileLineMatcher = fileLinePattern.matcher( line );
                if( fileLineMatcher.find() ) {
                    String fileToValidate = fileLineMatcher.group( 1 );
                    String expectedResult = fileLineMatcher.group( 2 );
                    File childLomFile = new File( lomFolder, fileToValidate );
                    report.append( strTest + ( testCount + 1 ) + " - " + strValidatingLom + childLomFile + "\n\n" );
                    if( !childLomFile.exists() )
                        throw( new ValidatorException( "File to validate '" + childLomFile + "' not found.  Error in control file of directory:" + lomFolder ) );
                    ValidationReport childLomFileReport = validate( childLomFile );
                    report.append( childLomFileReport );
                    String actualResult = getValidationStatus( childLomFileReport );
                    boolean isPassed = isValidationOk( expectedResult, actualResult );
                    testCount++;
                    if( !isPassed )
                        failedTestCount++;
                    report.append( "\n" );
                    report.append( strExpectedResult + expectedResult );
                    report.append( "\n" );
                    report.append( strActualResult + actualResult );
                    report.append( "\n" );
                    report.append( strIsTestValid + ( isPassed ? strTrue : strFalse ) );
                    report.append( "\n\n\n\n" );
                }
                else {
                    Matcher folderLineMatcher = folderLinePattern.matcher( line );
                    if( folderLineMatcher.find() ) {
                        String folderToValidate = folderLineMatcher.group( 1 );
                        File childLomFolder = new File( lomFolder, folderToValidate );  
                        report.append( strValidatingFolder + childLomFolder + "\n\n" );
                        ValidationReport childLomFolderReport = validateFolder( childLomFolder );
                        report.append( childLomFolderReport );
                    }
                }
            }
        }
        catch( FileNotFoundException fnfe ) {
            throw( new ValidatorException( "Control file not found in directory: " + lomFolder ) );
        }
        catch( Exception e ) {
            ValidatorException validatorException = new ValidatorException( "An exception occurred when processing control file: " + controlFile );
            validatorException.initCause( e );
            throw( validatorException );
        }
        finally {
            try {
                if( reader != null )
                    reader.close();
            }
            catch( IOException e ) {
                e.printStackTrace();
            }
        }
        return( report );
    }

    public ValidationReport validate( File location ) throws IOException, FileNotFoundException, TransformerConfigurationException, TransformerException, SAXException, ValidatorException {
        if( location.isDirectory() )
            return( validateFolder( location ) );

        FileReader fileReader = new FileReader( location );
        BufferedReader lomReader = new BufferedReader( fileReader );
        StringWriter lomString = new StringWriter();
        BufferedWriter lomWriter = new BufferedWriter( lomString );
        String line = null;
        while( ( line = lomReader.readLine() ) != null ) {
            lomString.write( line );
            lomString.write( "\n" );
        }

        return( validate( lomString.toString() ) );
    }

    public void setLocale( Locale locale ) {
        this.locale = locale;

        ResourceBundle bundle = ResourceBundle.getBundle( getClass().getName(), locale );
        strValidatingFolder = bundle.getString( "ValidatingFolder" );
        strValidatingLom = bundle.getString( "ValidatingLom" );
        strExpectedResult = bundle.getString( "ExpectedResult" );
        strActualResult = bundle.getString( "ActualResult" );
        strIsTestValid = bundle.getString( "IsTestValid" );
        strTest = bundle.getString( "Test" );
        strTrue = bundle.getString( "True" );
        strFalse = bundle.getString( "False" );
    }

    public Locale getLocale() {
        return( this.locale );
    }

    public boolean isXSDValidationEnabled() {
        return( isXSDEnabled );
    }

    public void setXSDValidationEnabled( boolean isXSDValidationEnabled ) {
        isXSDEnabled = isXSDValidationEnabled;
    }

    public boolean isSchematronValidationEnabled() {
        return( isSchematronEnabled );
    }

    public void setSchematronValidationEnabled( boolean isSchematronValidationEnabled ) {
        isSchematronEnabled = isSchematronValidationEnabled;
    }

    public ValidationReport validate( String lom ) throws IOException, TransformerConfigurationException, TransformerException, SAXException {
        ValidationReport report = new ValidationReport();

        boolean isValid = true;

        if( isValid && isXSDEnabled ) {
            XsdValidator xsdValidator = new XsdValidator();
            xsdValidator.setLocale( locale );
            isValid = xsdValidator.validate( lom );

            report.append( xsdValidator.getReport().getIssues() );
        }

        //if( isValid ) {
        //    RelaxNgValidator rngValidator = new RelaxNgValidator(); 
        //    rngValidator.setLocale( locale );
        //    isValid = rngValidator.validate( lom );

        //    // Temporary.  Not needed to add the errors found by RelaxNG.
        //    // However, we may use this info to use location error data (line, col) 
        //    // for some mandatory elements to improve userfriendliness.
        //    report.append( rngValidator.getReport().getIssues() );
        //}

        if( isValid && isSchematronEnabled ) {
            SchematronValidator schValidator = new SchematronValidator();
            schValidator.setLocale( locale );
            isValid = schValidator.validate( lom );
            report.append( schValidator.getReport().getIssues() );
        }

        return( report );
    }

    public int getTestCount() {
        return( testCount );
    }

    public int getFailedTestCount() {
        return( failedTestCount );
    }

    public static void main( String[] args ) throws Exception {
        String locationParam = null;
        String languageParam = null;
        boolean isXSDEnabled = true;
        boolean isSchematronEnabled = true;

        for( int i = 0; i < args.length; i++ ) {
            if( "-location".equals( args[ i ] ) )
                locationParam = args[ ++i ];
            else if( "-lang".equals( args[ i ] ) )
                languageParam = args[ ++i ];
            else if( "-noXSD".equals( args[ i ] ) )
                isXSDEnabled = false;
            else if( "-noSCH".equals( args[ i ] ) )
                isSchematronEnabled = false;
        }

        if( !isXSDEnabled && !isSchematronEnabled )
            throw( new ValidatorException( "Cannot launch the validation as no validation are enabled." ) );

        NormeticValidator validator = new NormeticValidator();
        if( "fr".equals( languageParam ) )
            validator.setLocale( Locale.FRENCH );
        if( !isXSDEnabled )
            validator.setXSDValidationEnabled( false );
        if( !isSchematronEnabled )
            validator.setSchematronValidationEnabled( false );

        if( locationParam != null ) {
            File location = new File( locationParam );

            try {
                ValidationReport report = validator.validate( location );
                System.out.println( report.toHumanReadableString() );
            }
            catch( SAXException e ) {
                // Ignore the exception for now.  It's been written in the report anyway.
            }
        }

        System.exit( 0 );
    }

    private boolean isValidationOk( String expectedResult, String actualResult ) {
        String expectedStatus = expectedResult;
        int indexOfExpectedIssueListDelimiter = expectedStatus.indexOf( "[" );
        if( indexOfExpectedIssueListDelimiter != -1 )
            expectedStatus = expectedStatus.substring( 0, indexOfExpectedIssueListDelimiter );

        String actualStatus = actualResult;
        int indexOfActualIssueListDelimiter = actualStatus.indexOf( "[" );
        if( indexOfActualIssueListDelimiter != -1 )
            actualStatus = actualStatus.substring( 0, indexOfActualIssueListDelimiter );

        if( !expectedStatus.equals( actualStatus ) )
            return( false );

        String expectedIssueList = expectedResult.substring( indexOfExpectedIssueListDelimiter + 1, 
            indexOfExpectedIssueListDelimiter != -1 ? expectedResult.indexOf( "]" ) : expectedResult.length() );
        String[] expectedIssues = expectedIssueList.split( "," );

        String actualIssueList = actualResult.substring( indexOfActualIssueListDelimiter + 1, 
            indexOfActualIssueListDelimiter != -1 ? actualResult.indexOf( "]" ) : actualResult.length() );
        String[] actualIssues = actualIssueList.split( "," );

        // This could be optimized.  We could sort the issues for example.
        expectedIssue:
        for( int i = 0; i < expectedIssues.length; i++ ) {
            String expectedIssue = expectedIssues[ i ];
            String expectedIssueKind = null;
            String expectedIssueFieldNumber = null;
            int indexOfExpectedIssueFieldNumberDelimiter = expectedIssue.indexOf( "(" );
            if( indexOfExpectedIssueFieldNumberDelimiter == -1 )
                expectedIssueKind = expectedIssue;
            else {
                expectedIssueKind = expectedIssue.substring( 0, indexOfExpectedIssueFieldNumberDelimiter );
                expectedIssueFieldNumber = expectedIssue.substring( indexOfExpectedIssueFieldNumberDelimiter + 1, expectedIssue.indexOf( ")" ) );
            }
            for( int j = 0; j < actualIssues.length; j++ ) {
                String actualIssue = actualIssues[ j ];
                String actualIssueKind = null;
                String actualIssueFieldNumber = null;
                int indexOfActualIssueFieldNumberDelimiter = actualIssue.indexOf( "(" );
                if( indexOfActualIssueFieldNumberDelimiter == -1 )
                    actualIssueKind = actualIssue;
                else {
                    actualIssueKind = actualIssue.substring( 0, indexOfActualIssueFieldNumberDelimiter );
                    actualIssueFieldNumber = actualIssue.substring( indexOfActualIssueFieldNumberDelimiter + 1, actualIssue.indexOf( ")" ) );
                }

                if( !expectedIssueKind.equals( actualIssueKind ) )
                    continue;

                if( ( expectedIssueFieldNumber == null && actualIssueFieldNumber != null ) ||
                    ( expectedIssueFieldNumber != null && ( actualIssueFieldNumber == null || !expectedIssueFieldNumber.equals( actualIssueFieldNumber ) ) ) )
                        continue;
                // If we reach this point, this means that the expectedIssue has been found in the actualIssueList
                // so we get out of the inner loop to handle next exptectedIssue.
                break expectedIssue;
            }
            return( false ); // The expected issue has not been found among the actual issue list, so the validation has failed.
        }
        // All the expected issues have been found in the actual issue list so success!
        return( true );
    }

    private String getValidationStatus( ValidationReport report ) {
        if( report.getIssueCount() == 0 )
            return( VALIDATION_STATUS_OK );

        StringBuilder str = new StringBuilder();
        if( report.getErrorCount() > 0 || report.getFatalErrorCount() > 0 )
            str.append( VALIDATION_STATUS_INVALID );
        else
            str.append( VALIDATION_STATUS_OK_WITH_WARNINGS );

        String issueDelimiter = "";
        ValidationIssue[] issues = report.getIssues();
        boolean isDelimiterDisplayed = false;
        for( int i = 0; i < issues.length; i++ ) {
            ValidationIssue issue = issues[ i ];
            if( issue.getKind() != null ) {
                if( !isDelimiterDisplayed ) {
                    str.append( "[" );
                    isDelimiterDisplayed = true;
                }

                str.append( issueDelimiter ); 
                str.append( issue.getKind() );
                if( issue.getRelatedFieldNumber() != null )
                    str.append( "(" ).append( issue.getRelatedFieldNumber() ).append( ")" );
                issueDelimiter = ",";
            }
        }
        if( isDelimiterDisplayed )
            str.append( "]" );
        return( str.toString() );
    }

    private Locale      locale = Locale.ENGLISH;
    private boolean     isXSDEnabled = true;
    private boolean     isSchematronEnabled = true;

    private int     testCount = 0; 
    private int     failedTestCount = 0;

    private String  strValidatingFolder;
    private String  strTest;
    private String  strValidatingLom;
    private String  strExpectedResult;
    private String  strActualResult;
    private String  strIsTestValid;
    private String  strTrue;
    private String  strFalse;

}
