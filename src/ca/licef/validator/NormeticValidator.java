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
import javax.xml.transform.Source;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.URIResolver;
import javax.xml.transform.stream.StreamSource;

import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

public class NormeticValidator {

    public NormeticValidator() {
    }

    public boolean validate( File lom ) throws IOException, FileNotFoundException, TransformerConfigurationException, TransformerException, SAXException {
        FileReader fileReader = new FileReader( lom );
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

    public boolean validate( String lom ) throws IOException, TransformerConfigurationException, TransformerException, SAXException {
        report = new ValidationReport();

        XsdValidator xsdValidator = new XsdValidator();
        xsdValidator.setLocale( locale );
        boolean isValid = xsdValidator.validate( lom );

        report.append( xsdValidator.getReport().getErrors() );

        if( !isValid )
            return( false );

        //RelaxNgValidator rngValidator = new RelaxNgValidator(); 
        //rngValidator.setLocale( locale );
        //isValid = rngValidator.validate( lom );

        // Temporary.  Not needed to add the errors found by RelaxNG.
        // However, we may use this info to use location error data (line, col) 
        // for some mandatory elements to improve userfriendliness.
        //report.append( rngValidator.getReport().getErrors() );

        //if( !isValid )
        //    return( false );

        SchematronValidator schValidator = new SchematronValidator();
        schValidator.setLocale( locale );
        isValid = schValidator.validate( lom );

        report.append( schValidator.getReport().getErrors() );
        return( isValid );
    }

    public ValidationReport getReport() {
        return( report );
    }

    public static void main( String[] args ) throws Exception {
        String lomFilename = null;
        String language = null;

        for( int i = 0; i < args.length; i++ ) {
            if( "-lom".equals( args[ i ] ) )
                lomFilename = args[ ++i ];
            else if( "-lang".equals( args[ i ] ) )
                language = args[ ++i ];
        }

        File lomFile = new File( lomFilename );

        NormeticValidator validator = new NormeticValidator();
        if( "fr".equals( language ) )
            validator.setLocale( Locale.FRENCH );
        try {
            boolean isValid = validator.validate( lomFile );
            ValidationReport report = validator.getReport();
            System.out.println( report );
        }
        catch( SAXException e ) {
            // Ignore the exception for now.  It's been written in the report anyway.
        }

        System.exit( 0 );
    }

    private Locale              locale = Locale.ENGLISH;
    private ValidationReport    report;

}
