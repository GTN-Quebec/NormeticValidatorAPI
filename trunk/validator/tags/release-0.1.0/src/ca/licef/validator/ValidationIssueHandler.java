package ca.licef.validator;

import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

public class ValidationIssueHandler implements ErrorHandler {

    public ValidationIssueHandler( ValidationIssue.ValidationType type, ValidationReport report ) {
        this.type = type;
        this.report = report;
    }

    public void error( SAXParseException e ) throws SAXException {
        ValidationIssue error = new ValidationIssue( type, ValidationIssue.Severity.ERROR, e.getLineNumber(), e.getColumnNumber(), e.getMessage() );

        report.append( error );
    }

    public void fatalError( SAXParseException e ) throws SAXException {
        ValidationIssue error = new ValidationIssue( type, ValidationIssue.Severity.FATAL_ERROR, e.getLineNumber(), e.getColumnNumber(), e.getMessage() );
        report.append( error );
    }

    public void warning( SAXParseException e ) throws SAXException {
        ValidationIssue error = new ValidationIssue( type, ValidationIssue.Severity.WARNING, e.getLineNumber(), e.getColumnNumber(), e.getMessage() );
        report.append( error );
    }

    private ValidationIssue.ValidationType  type;
    private ValidationReport                report;

}

