package ca.licef.validator;

import java.io.Serializable;

public class ErrorEntry implements Serializable {

    public ErrorEntry( ValidationError error ) {
        this.error = error;
    }

    public String getSeverityIcon() {
        if( error.getSeverity() == ValidationError.Severity.WARNING )
            return( "ALERT_DEGRADED_LARGE" );
        else
            return( "ALERT_ERROR_LARGE" );
    }

    public String getLocation() {
        if( error.getLine() != -1 && error.getColumn() != -1 )
            return( "Line " + error.getLine() + ", Column " + error.getColumn() + ": " );
        else
            return( null );
    }

    public String getMessage() {
        return( error.getMessage() );
    }

    public String getContext() {
        return( null );
    }

    public String getDetails() {
        return( null );
    }

    private ValidationError error;

}
