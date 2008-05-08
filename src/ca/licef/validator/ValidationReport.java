package ca.licef.validator;

import java.util.Enumeration;
import java.util.ListIterator;
import java.util.Vector;

public class ValidationReport {

    public ValidationReport() {
    }

    public void append( ValidationError error ) {
        errors.addElement( error );
    }

    public void append( ValidationError[] errors ) {
        for( int i = 0; i < errors.length; i++ )
            append( errors[ i ] );
    }

    public int getErrorCount() {
        return( errors.size() );
    }

    public ValidationError[] getErrors() {
        ValidationError[] array = new ValidationError[ errors.size() ];
        return( (ValidationError[])errors.toArray( array ) );
    }

    public String toString() {
        StringBuilder str = new StringBuilder();
        for( ListIterator it = errors.listIterator(); it.hasNext(); ) {
            ValidationError error = (ValidationError)it.next();
            str.append( error.toString() );
            str.append( "\n" );
        }
        return( str.toString() );
    }

    private Vector<ValidationError> errors = new Vector<ValidationError>();

}
