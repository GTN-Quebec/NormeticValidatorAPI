package ca.licef.validator;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.StringReader;
import java.util.Locale;

import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.thaiopensource.util.PropertyMapBuilder;
import com.thaiopensource.validate.ValidateProperty;
import com.thaiopensource.validate.ValidationDriver;

class RelaxNgValidator {

    public RelaxNgValidator() {
    }

    public void setLocale( Locale locale ) {
        this.locale = locale;
    }

    public Locale getLocale() {
        return( this.locale );
    }

    public boolean validate( String lom ) throws org.xml.sax.SAXException, IOException {
        report = new ValidationReport();

        PropertyMapBuilder propMapBuilder = new PropertyMapBuilder();
        ValidateProperty.ERROR_HANDLER.put( propMapBuilder, new ValidationErrorHandler( ValidationError.ValidationType.RNG, report ) );
        ValidationDriver validator = new ValidationDriver( propMapBuilder.toPropertyMap() );
        String prefix = "/schemas/rng/";
        InputSource rngSource = new InputSource( getClass().getResourceAsStream( prefix + "normetic.rng" ) );
        if( !validator.loadSchema( rngSource ) )
            throw( new IOException( "Could not load RelaxNG schema.  Validation was not performed." ) );

        StringReader stringReader = new StringReader( lom );
        BufferedReader lomReader = new BufferedReader( stringReader );
        try {
            validator.validate( new InputSource( lomReader ) );
        }
        catch( SAXException e ) {
            // Ignore instances of SAXException as they have already been handled by ValidationErrorHandler.
        }

        return( report.getErrorCount() == 0 );
    }

    public ValidationReport getReport() {
        return( report );
    }

    private Locale              locale = Locale.ENGLISH;
    private ValidationReport    report;

}
