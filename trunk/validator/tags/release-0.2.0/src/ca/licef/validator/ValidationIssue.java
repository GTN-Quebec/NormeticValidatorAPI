package ca.licef.validator;

import java.io.Serializable;

public class ValidationIssue extends Object implements Serializable {

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

    public ValidationIssue() {
    }

    public ValidationIssue( String message ) {
        this.message = message;
    }

    public ValidationIssue( int line, int column, String message ) {
        this.line = line;
        this.column = column;
        this.message = message;
    }

    public ValidationIssue( ValidationType validationType, Severity severity, String message ) {
        this.validationType = validationType;
        this.severity = severity;
        this.message = message;
    }

    public ValidationIssue( ValidationType validationType, Severity severity, int line, int column, String message ) {
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

    public String getKind() {
        return( kind );
    }

    public void setKind( String kind ) {
        this.kind = kind;
    }

    public String getRelatedFieldNumber() {
        return( relatedFieldNumber );
    }

    public void setRelatedFieldNumber( String relatedFieldNumber ) {
        this.relatedFieldNumber = relatedFieldNumber;
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

    public String getExplanation() {
        return( explanation );
    }

    public void setExplanation( String explanation ) {
        this.explanation = explanation;
    }

    public String getLexicalField() {
        return( lexicalField );
    }

    public void setLexicalField( String lexicalField ) {
        this.lexicalField = lexicalField;
    }

    public String getReference() {
        return( reference );
    }

    public void setReference( String reference ) {
        this.reference = reference;
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

    public String toHumanReadableString() {
        StringBuffer str = new StringBuffer();
        if( kind != null ) {
            str.append( kind );
            if( relatedFieldNumber != null )
                str.append( "(" ).append( relatedFieldNumber ).append( ")" );
            str.append( ":" );
        }
        str.append( alternateMessage != null ? alternateMessage : message );
        if( explanation != null )
            str.append( explanation );
        if( line != -1 && column != -1 )
            str.append( " [" ).append( line ).append( "," ).append( column ).append( "]" );
        return( str.toString() );
    }

    private int line = -1;
    private int column = -1;
    private String kind; // As defined in Validation_09-02-25-couriel.xls.  May contain value like E1, E2, E3, E4, P1, P2, etc.
    private String relatedFieldNumber; // As defined in Validation_09-02-25-courriel.xls.  May contain a field number (like 1.2). 
    private String message; // Original message in English given from a low-level validator.
    private String alternateMessage; // Translated message and/or interpretation of the original message in English.
    private String explanation; // As defined in Validation_09-02-25-courriel.xls for the column Explication.
    private Severity severity = Severity.UNKNOWN;
    private ValidationType validationType = ValidationType.UNKOWN;
    private String lexicalField;
    private String reference;

}
