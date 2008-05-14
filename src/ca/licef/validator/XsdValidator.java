package ca.licef.validator;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.Locale;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;
import javax.xml.XMLConstants;

import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

class XsdValidator {

    public XsdValidator() {
    }

    public void setLocale( Locale locale ) {
        this.locale = locale;
        Locale.setDefault( locale );
    }

    public Locale getLocale() {
        return( this.locale );
    }

    public boolean validate( String lom ) throws SAXException, IOException {
        report = new ValidationReport();

        Validator validator = getValidator();
        //System.out.println( "prop flocale=" + validator.getProperty( "fLocale" ) );
        validator.setErrorHandler( new ValidationIssueHandler( ValidationIssue.ValidationType.XSD, report ) );
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

    private Validator getValidator() throws SAXException {
        if( validator == null ) {
            SchemaFactory schemafactory = SchemaFactory.newInstance( XMLConstants.W3C_XML_SCHEMA_NS_URI );

            String prefix = "/schemas/xsd/";
            Source[] xsdSources = new Source[] {
                new StreamSource( getClass().getResourceAsStream( prefix + "lomStrict.xsd" ) ),
                new StreamSource( getClass().getResourceAsStream( prefix + "common/anyElement.xsd" ) ),
                new StreamSource( getClass().getResourceAsStream( prefix + "unique/strict.xsd" ) ),
                new StreamSource( getClass().getResourceAsStream( prefix + "vocab/strict.xsd" ) ),
                new StreamSource( getClass().getResourceAsStream( prefix + "normetic/vocabValues.xsd" ) ),
                new StreamSource( getClass().getResourceAsStream( prefix + "extend/strict.xsd" ) ),
                new StreamSource( getClass().getResourceAsStream( prefix + "common/dataTypes.xsd" ) ),
                new StreamSource( getClass().getResourceAsStream( prefix + "common/elementNames.xsd" ) ),
                new StreamSource( getClass().getResourceAsStream( prefix + "common/elementTypes.xsd" ) ),
                new StreamSource( getClass().getResourceAsStream( prefix + "common/rootElement.xsd" ) ),
                new StreamSource( getClass().getResourceAsStream( prefix + "common/vocabValues.xsd" ) ),
                new StreamSource( getClass().getResourceAsStream( prefix + "common/vocabTypes.xsd" ) )
            };

            Schema schema = schemafactory.newSchema( xsdSources );
            validator = schema.newValidator();
        }
        return( validator );
    }

    private Locale              locale = Locale.ENGLISH;
    private ValidationReport    report;
    private Validator           validator;

}
