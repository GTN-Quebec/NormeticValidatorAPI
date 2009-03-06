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
        Pattern fileLinePattern = Pattern.compile( "file:\\s*([.A-Za-z0-9_-]+?)\\s+expectedResult:\\s*(\\w+)" );
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
                    System.out.println( "fileToValidate=" + fileToValidate + " expectedResult=" + expectedResult );
                    File childLomFile = new File( lomFolder, fileToValidate );
                    report.append( "Validating lom: " + childLomFile + "\n\n" );
                    ValidationReport childLomFileReport = validate( childLomFile );
                    report.append( childLomFileReport.toString() );
                    String actualResult = getValidationStatus( childLomFileReport );
                    report.append( "\nExpected result: " + expectedResult + " vs Actual result: " + actualResult + "\n\n" );
                }
                else {
                    Matcher folderLineMatcher = folderLinePattern.matcher( line );
                    if( folderLineMatcher.find() ) {
                        String folderToValidate = folderLineMatcher.group( 1 );
                        File childLomFolder = new File( lomFolder, folderToValidate );  
                        report.append( "Validating folder: " + childLomFolder + "\n\n" );
                        ValidationReport childLomFolderReport = validateFolder( childLomFolder );
                        report.append( childLomFolderReport );
                    }
                }
            }
        }
        catch( FileNotFoundException fnfe ) {
            throw( new ValidatorException( "Control file not found in directory: " + lomFolder ) );
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

        if( isXSDEnabled ) {
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
                System.out.println( report );
            }
            catch( SAXException e ) {
                // Ignore the exception for now.  It's been written in the report anyway.
            }
        }

        System.exit( 0 );
    }

    private String getValidationStatus( ValidationReport report ) {
        if( report.getIssueCount() == 0 )
            return( VALIDATION_STATUS_OK );
        if( report.getErrorCount() > 0 || report.getFatalErrorCount() > 0 )
            return( VALIDATION_STATUS_INVALID );
        return( VALIDATION_STATUS_OK_WITH_WARNINGS );
    }

    private Locale              locale = Locale.ENGLISH;
    private boolean             isXSDEnabled = true;
    private boolean             isSchematronEnabled = true;

}
