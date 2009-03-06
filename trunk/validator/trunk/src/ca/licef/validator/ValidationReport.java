package ca.licef.validator;

import java.io.Serializable;
import java.util.Enumeration;
import java.util.ListIterator;
import java.util.Vector;

public class ValidationReport implements Serializable {

    public ValidationReport() {
    }

    public void append( String string ) {
        items.addElement( string );
    }

    public void append( ValidationReport report ) {
        items.addElement( report );
    }

    public void append( ValidationIssue issue ) {
        items.addElement( issue );
    }

    public void append( ValidationIssue[] items ) {
        for( int i = 0; i < items.length; i++ )
            append( items[ i ] );
    }

    public int getIssueCount() {
        int count = 0;
        for( Enumeration e = items.elements(); e.hasMoreElements(); ) {
            Object item = e.nextElement();
            if( item instanceof ValidationIssue )
                count++;
            else if( item instanceof ValidationReport ) {
                ValidationReport report = (ValidationReport)item;
                count += report.getIssueCount();
            }
        }
        return( count );
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
        for( Enumeration e = items.elements(); e.hasMoreElements(); ) {
            Object item = e.nextElement();
            if( item instanceof ValidationIssue ) {
                ValidationIssue issue = (ValidationIssue)item;
                if( issue.getSeverity() == severity )
                    count++;
            }
            else if( item instanceof ValidationReport ) {
                ValidationReport report = (ValidationReport)item;
                count += report.getIssueCount( severity );
            }
        }
        return( count );
    }

    public ValidationIssue[] getIssues() {
        Vector issues = new Vector();
        for( Enumeration e = items.elements(); e.hasMoreElements(); ) {
            Object item = e.nextElement();
            if( item instanceof ValidationIssue )
                issues.addElement( item );
            else if( item instanceof ValidationReport ) {
                ValidationReport report = (ValidationReport)item;
                ValidationIssue[] reportIssues = report.getIssues();
                for( int i = 0; i < reportIssues.length; i++ )  
                    issues.addElement( reportIssues[ i ] );
            }
        }
        ValidationIssue[] array = new ValidationIssue[ issues.size() ];
        return( (ValidationIssue[])issues.toArray( array ) );
    }

    public String toString() {
        StringBuilder str = new StringBuilder();
        for( Enumeration e = items.elements(); e.hasMoreElements(); ) {
            Object item = e.nextElement();
            if( item instanceof ValidationIssue ) {
                ValidationIssue issue = (ValidationIssue)item;
                str.append( issue.toString() );
                str.append( "\n" );
            }
            else if( item instanceof ValidationReport ) {
                ValidationReport report = (ValidationReport)item;
                str.append( report.toString() );
            }
            else if( item instanceof String ) 
                str.append( item.toString() );
        }
        return( str.toString() );
    }

    private Vector items = new Vector();

}
