package ca.licef.validator;

import java.io.Serializable;
import java.util.Enumeration;
import java.util.ListIterator;
import java.util.Vector;

public class ValidationReport implements Serializable {

    public ValidationReport() {
    }

    public void append( ValidationIssue issue ) {
        issues.addElement( issue );
    }

    public void append( ValidationIssue[] issues ) {
        for( int i = 0; i < issues.length; i++ )
            append( issues[ i ] );
    }

    public int getIssueCount() {
        return( issues.size() );
    }

    public int getWarningCount() {
        return( getIssueCount( ValidationIssue.Severity.WARNING ) );
    }

    public int getErrorCount() {
        return( getIssueCount( ValidationIssue.Severity.ERROR ) );
    }

    public int getFatalErrorCount() {
        return( getIssueCount( ValidationIssue.Severity.FATAL_ERROR ) );
    }

    public int getIssueCount( ValidationIssue.Severity severity ) {
        int count = 0;
        for( Enumeration e = issues.elements(); e.hasMoreElements(); ) {
            ValidationIssue issue = (ValidationIssue)e.nextElement();
            if( issue.getSeverity() == severity )
                count++;
        }
        return( count );
    }

    public ValidationIssue[] getIssues() {
        ValidationIssue[] array = new ValidationIssue[ issues.size() ];
        return( (ValidationIssue[])issues.toArray( array ) );
    }

    public String toString() {
        StringBuilder str = new StringBuilder();
        for( ListIterator it = issues.listIterator(); it.hasNext(); ) {
            ValidationIssue issue = (ValidationIssue)it.next();
            str.append( issue.toString() );
            str.append( "\n" );
        }
        return( str.toString() );
    }

    private Vector<ValidationIssue> issues = new Vector<ValidationIssue>();

}
