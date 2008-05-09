package ca.licef.validator;

import java.io.Serializable;

public class ValidationError implements Serializable {

    public enum ValidationType {
        UNKOWN,
        XSD,
        RNG,
        SCH
    }
    
    public enum Severity {
        UNKNOWN,
        WARNING,
        ERROR,
        FATAL_ERROR
    }

    public ValidationError() {
    }

    public ValidationError( String message ) {
        this.message = message;
    }

    public ValidationError( int line, int column, String message ) {
        this.line = line;
        this.column = column;
        this.message = message;
    }

    public ValidationError( ValidationType validationType, Severity severity, String message ) {
        this.validationType = validationType;
        this.severity = severity;
        this.message = message;
    }

    public ValidationError( ValidationType validationType, Severity severity, int line, int column, String message ) {
        this.validationType = validationType;
        this.severity = severity;
        this.line = line;
        this.column = column;
        this.message = message;
    }

    public int getLine() {
        return( line );
    }

    public int getColumn() {
        return( column );
    }

    public String getMessage() {
        return( message );
    }

    public String getAlternateMessage() {
        return( alternateMessage );
    }

    public void setAlternateMessage( String alternateMessage ) {
        this.alternateMessage = alternateMessage;
    }

    public Severity getSeverity() {
        return( severity );
    }

    public ValidationType getValidationType() {
        return( validationType );
    }

    public String toString() {
        StringBuffer str = new StringBuffer();
        str.append( message );
        if( line != -1 && column != -1 )
            str.append( " [" ).append( line ).append( "," ).append( column ).append( "]" );
        return( str.toString() );
    }

    private int line = -1;
    private int column = -1;
    private String message; // Original message in English given from a low-level validator.
    private String alternateMessage; // Translated message and/or interpretation of the original message in English.
    private Severity severity = Severity.UNKNOWN;
    private ValidationType validationType = ValidationType.UNKOWN;

}
