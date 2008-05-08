package ca.licef.validator;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Locale;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.URIResolver;
import javax.xml.transform.sax.SAXSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import org.xml.sax.InputSource;
import org.xml.sax.XMLReader;
import net.sf.saxon.Configuration;
import net.sf.saxon.FeatureKeys;
import net.sf.saxon.PreparedStylesheet;
import net.sf.saxon.TransformerFactoryImpl;
import net.sf.saxon.value.UntypedAtomicValue;

class SchematronValidator {

    public SchematronValidator( ) {
    }

    public void setLocale( Locale locale ) {
        this.locale = locale;
    }

    public Locale getLocale() {
        return( this.locale );
    }

    protected void finalize() throws Throwable {
        for( Enumeration e = hSchXslStyleSheet.elements(); e.hasMoreElements(); ) {
            File schXslStyleSheet = (File)e.nextElement();
            if (!schXslStyleSheet.delete()) 
                System.err.println("Could not delete temporary file: " + schXslStyleSheet);
        }
    }

    public boolean validate( String lom ) throws IOException, TransformerConfigurationException, TransformerException {
        isOptionalPhaseRequired = false;
        report = new ValidationReport();

        String[] phases = new String[] {
            "MandatoryCategories",
            "MandatoryElements",
            "ConditionalMandatoryElements",
            "ConditionalMandatoryElements.2", // Optional phase.
            "Vocabularies",
            "LanguageAttributes",
            "RecommendedElements"
        };

        boolean isValid = true;

        for (int i = 0; i < phases.length; i++) {
            if( !"ConditionalMandatoryElements.2".equals( phases[ i ] ) || isOptionalPhaseRequired ) {
                isValid = validatePhase( lom, phases[ i ] );
                //if( !isValid )
                //    return( false );
            }
        }

        return( isValid );
    }

    public ValidationReport getReport() {
        return( report );
    }

    private File getSchematronValidatorStylesheet( String phase ) throws IOException, TransformerConfigurationException, TransformerException {
        File schXslStyleSheet = (File)hSchXslStyleSheet.get( phase );
        if( schXslStyleSheet == null ) {
            Configuration config = new Configuration();
            config.setAllNodesUntyped(true);

            TransformerFactoryImpl factory = new TransformerFactoryImpl(config);
            factory.setURIResolver( 
                new URIResolver() {
                    public Source resolve( String href, String base ) {
                        return( new StreamSource( getClass().getResourceAsStream( "/schematron/" + href ) ) );
                    }
                }
            );

            // Test this later if needed - FB
            //factory.setAttribute( FeatureKeys.SOURCE_PARSER_CLASS, "org.apache.xerces.parsers.SAXParser" ); // -x org.apache.xerces.parsers.SAXParser

            // w0 : Configuration.RECOVER_SILENTLY
            // w1 : Configuration.RECOVER_WITH_WARNINGS
            // w2 : Configuration.DO_NOT_RECOVER
            factory.setAttribute(FeatureKeys.RECOVERY_POLICY, new Integer(Configuration.RECOVER_WITH_WARNINGS)); // -w1

            PreparedStylesheet sheet = null;

            XMLReader styleParser = config.getStyleParser();

            Source styleSource = new SAXSource(styleParser, new InputSource( getClass().getResourceAsStream( "/schematron/iso_schematron_text.xsl" ) ) );

            sheet = (PreparedStylesheet) factory.newTemplates(styleSource);

            if (styleParser != null)
                config.reuseStyleParser(styleParser); // pointless, because the Configuration won't be used again; but we want to set a good example

            XMLReader sourceParser = config.getSourceParser();
            Source sourceInput = new SAXSource( sourceParser, new InputSource( getClass().getResourceAsStream( "/schemas/sch/normetic.sch" ) ) );

            Transformer instance = sheet.newTransformer();
            instance.setParameter( "phase", new UntypedAtomicValue( phase ) );

            schXslStyleSheet = File.createTempFile("schValidor", ".xsl");

            Result result = new StreamResult(schXslStyleSheet.toURI().toString());

            instance.transform(sourceInput, result);

            hSchXslStyleSheet.put( phase, schXslStyleSheet );
        }
        return( schXslStyleSheet );
    }

    private boolean validatePhase( String lom, String phase ) throws FileNotFoundException, IOException, TransformerConfigurationException, TransformerException {
        Configuration config = new Configuration();
        config.setAllNodesUntyped(true);

        TransformerFactoryImpl factory = new TransformerFactoryImpl(config);
        factory.setURIResolver( 
            new URIResolver() {
                public Source resolve( String href, String base ) {
                    return( new StreamSource( getClass().getResourceAsStream( "/schemas/sch/" + href ) ) );
                }
            }
        );

        // Test this later if needed - FB
        //factory.setAttribute( FeatureKeys.SOURCE_PARSER_CLASS, "org.apache.xerces.parsers.SAXParser" ); // -x org.apache.xerces.parsers.SAXParser

        // w0 : Configuration.RECOVER_SILENTLY
        // w1 : Configuration.RECOVER_WITH_WARNINGS
        // w2 : Configuration.DO_NOT_RECOVER
        factory.setAttribute(FeatureKeys.RECOVERY_POLICY, new Integer(Configuration.RECOVER_WITH_WARNINGS)); // -w1

        PreparedStylesheet sheet = null;
        InputSource styleInputSource = new InputSource(new FileInputStream( getSchematronValidatorStylesheet( phase ) ) );
        XMLReader styleParser = config.getStyleParser();
        Source styleSource = new SAXSource(styleParser, styleInputSource);

        sheet = (PreparedStylesheet) factory.newTemplates(styleSource);

        if (styleParser != null)
            config.reuseStyleParser(styleParser); // pointless, because the Configuration won't be used again; but we want to set a good example

        StringReader stringReader = new StringReader( lom );
        BufferedReader lomReader = new BufferedReader( stringReader );
        InputSource lomInputSource = new InputSource( lomReader );
        XMLReader sourceParser = config.getSourceParser();
        Source sourceInput = new SAXSource(sourceParser, lomInputSource);

        Transformer instance = sheet.newTransformer();

        StringWriter reportStringWriter = new StringWriter();
        BufferedWriter reportWriter = new BufferedWriter( reportStringWriter );
        Result result = new StreamResult( reportWriter );
        instance.transform(sourceInput, result);

        String textReport = reportStringWriter.toString();
        if( textReport.length() > 0 )
            writeTextReport( textReport );

        return( reportStringWriter.toString().length() == 0 );
    }

    private void writeTextReport( String textReport ) {
        String[] lines = textReport.split( "\n" );
        for( int l = 0; l < lines.length; l++ ) {
            int indexOfColon = lines[ l ].indexOf( ":" );
            if( indexOfColon != -1 ) {
                String errorLabel = lines[ l ].substring( 0, indexOfColon );
                // If we detect that phase 2 is required, we set the flag and skip the signal error.
                if( errorLabel.indexOf( "Phase2Required" ) != -1 )
                    isOptionalPhaseRequired = true;
                else {
                    int indexOfRecommended = errorLabel.indexOf( "Recommended" );
                    ValidationError.Severity errorSeverity  = ( indexOfRecommended == -1 ? 
                        ValidationError.Severity.ERROR : ValidationError.Severity.WARNING );
                    ValidationError error = new ValidationError( ValidationError.ValidationType.SCH, errorSeverity, lines[ l ] );
                    report.append( error );
                }
            }
        }
    }

    private Locale              locale = Locale.ENGLISH;
    private ValidationReport    report;
    private Hashtable           hSchXslStyleSheet = new Hashtable();
    private boolean             isOptionalPhaseRequired;

}
