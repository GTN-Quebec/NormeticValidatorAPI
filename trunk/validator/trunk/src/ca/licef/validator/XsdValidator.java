package ca.licef.validator;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.net.MalformedURLException;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;
import javax.xml.XMLConstants;

import org.xml.sax.SAXException;

class XsdValidator {

    public XsdValidator() {
    }

    public void setLocale( Locale locale ) {
        this.locale = locale;
        Locale.setDefault( locale ); // Required because we use the error messages that are embedded in the JRE.
        bundle = ResourceBundle.getBundle( getClass().getName(), locale );
    }

    public Locale getLocale() {
        return( this.locale );
    }

    public boolean validate( String lom ) throws SAXException, IOException {
        report = new ValidationReport();

        Validator validator = getValidator();
        //System.out.println( "prop flocale=" + validator.getProperty( "fLocale" ) );
        validator.setErrorHandler( new ValidationIssueHandler( ValidationIssue.ValidationType.XSD, report, bundle, lom ) );

        StringReader stringReader = new StringReader( lom );
        BufferedReader lomReader = new BufferedReader( stringReader );
        Source lomSource = new StreamSource( lomReader ); 
        try {
            validator.validate( lomSource );
        }
        catch( SAXException e ) {
            // Ignore instances of SAXException as they have already been handled by ValidationIssueHandler.
        }

        return( report.getErrorCount() == 0 );
    }

    public ValidationReport getReport() {
        return( report );
    }

    private Validator getValidator() throws SAXException, MalformedURLException {
        if( validator == null ) {
            SchemaFactory schemafactory = SchemaFactory.newInstance( XMLConstants.W3C_XML_SCHEMA_NS_URI );

            String prefix = "/schemas/xsd/";
            Schema schema = schemafactory.newSchema( getClass().getResource( prefix+"lomStrict.xsd") );
            validator = schema.newValidator();
        }
        return( validator );
    }

    private Locale              locale = Locale.ENGLISH;
    private ResourceBundle      bundle;
    private ValidationReport    report;
    private Validator           validator;

}
