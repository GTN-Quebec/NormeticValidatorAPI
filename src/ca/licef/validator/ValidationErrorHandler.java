package ca.licef.validator;

import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

public class ValidationErrorHandler implements ErrorHandler {

    public ValidationErrorHandler( ValidationError.ValidationType type, ValidationReport report ) {
        this.type = type;
        this.report = report;
    }

    public void error( SAXParseException e ) throws SAXException {
        ValidationError error = new ValidationError( type, ValidationError.Severity.ERROR, e.getLineNumber(), e.getColumnNumber(), e.getMessage() );

        report.append( error );
    }

    public void fatalError( SAXParseException e ) throws SAXException {
        ValidationError error = new ValidationError( type, ValidationError.Severity.FATAL_ERROR, e.getLineNumber(), e.getColumnNumber(), e.getMessage() );
        report.append( error );
    }

    public void warning( SAXParseException e ) throws SAXException {
        ValidationError error = new ValidationError( type, ValidationError.Severity.WARNING, e.getLineNumber(), e.getColumnNumber(), e.getMessage() );
        report.append( error );
    }

    private ValidationError.ValidationType  type;
    private ValidationReport                report;

}

