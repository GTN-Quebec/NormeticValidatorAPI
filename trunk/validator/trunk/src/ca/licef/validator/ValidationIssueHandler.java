package ca.licef.validator;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.Enumeration;
import java.util.ResourceBundle;
import java.util.Stack;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import licef.StringUtil;

import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

public class ValidationIssueHandler implements ErrorHandler {

    public ValidationIssueHandler( ValidationIssue.ValidationType type, ValidationReport report ) {
        this( type, report, null, null );
    }

    public ValidationIssueHandler( ValidationIssue.ValidationType type, ValidationReport report, ResourceBundle bundle ) {
        this( type, report, bundle, null );
    }

    public ValidationIssueHandler( ValidationIssue.ValidationType type, ValidationReport report, ResourceBundle bundle, String lom ) {
        this.type = type;
        this.report = report;
        this.bundle = bundle;
        this.lom = lom;
    }

    public void error( SAXParseException e ) throws SAXException {
        ValidationIssue error = new ValidationIssue( type, ValidationIssue.Severity.ERROR, e.getLineNumber(), e.getColumnNumber(), e.getMessage() );
        //decorateIssue( error, e );
        report.append( error );
    }

    public void fatalError( SAXParseException e ) throws SAXException {
        ValidationIssue error = new ValidationIssue( type, ValidationIssue.Severity.FATAL_ERROR, e.getLineNumber(), e.getColumnNumber(), e.getMessage() );
        //decorateIssue( error, e );
        report.append( error );
    }

    public void warning( SAXParseException e ) throws SAXException {
        ValidationIssue error = new ValidationIssue( type, ValidationIssue.Severity.WARNING, e.getLineNumber(), e.getColumnNumber(), e.getMessage() );
        //decorateIssue( error, e );
        report.append( error );
    }

    private void decorateIssue( ValidationIssue issue, SAXParseException saxException ) {
        if( bundle == null )
            return;

        boolean isMatchingSpecialPattern = false;
        String value = null;
        String pattern = null;
        String type = null;
        String attribute = null;
        Pattern vocabErrorPattern = Pattern.compile( "cvc-datatype-valid.1.2.3: '(.*?)'.*union.*'(.*)'.*" );
        Matcher vocabErrorMatcher = vocabErrorPattern.matcher( saxException.getMessage() );
System.out.println( "mes="+saxException.getMessage() );        
        if( vocabErrorMatcher.find() ) {
            isMatchingSpecialPattern = true;
            value = vocabErrorMatcher.group( 1 );
            type = vocabErrorMatcher.group( 2 );
System.out.println( "Match!! value=" + value + " type="+type );                
        }
        if( !isMatchingSpecialPattern ) {
            Pattern patternErrorPattern = Pattern.compile( "cvc-pattern-valid: .* '(.*?)' .*facet-valid.*pattern.*'(.*?)'.*'(.*?)'.*" );
            Matcher patternErrorMatcher = patternErrorPattern.matcher( saxException.getMessage() );
            if( patternErrorMatcher.find() ) {
                isMatchingSpecialPattern = true;
                value = patternErrorMatcher.group( 1 );
                pattern = patternErrorMatcher.group( 2 );
                type = patternErrorMatcher.group( 3 );
                attribute = type;
    System.out.println( "Match!! value=" + value + " pattern=" + pattern + " type="+type );                
            }
        }

        if( isMatchingSpecialPattern ) {
//            Object[] locationData = getLocationData( saxException.getLineNumber(), saxException.getColumnNumber() );
//System.out.println( "locationData="+locationData );
//if( locationData != null ) {
//    System.out.println( "locationData[0]=" + locationData[ 0 ] + " locationData[1]=" + locationData[ 1 ] );
//    if( locationData[ 0 ] != null )
//        System.out.println( StringUtil.join( (Object[])locationData[ 0 ], '/' ) );
//}


            String[] fields = getFields( saxException.getLineNumber(), saxException.getColumnNumber() );
System.out.println( "fields="+fields+" attribute="+attribute );                    
            if( fields != null ) {

                String field = fields[ 0 ];
                String parentField = fields[ 1 ];
System.out.println( "fields=" + parentField + "/" + field );
                String key = StringUtil.capitalize( parentField ) + StringUtil.capitalize( field );
                if( "".equals( value ) ) {
                    key = "Empty" + key;
                    if( attribute != null && !attribute.equals( field ) && !attribute.equals( "DateTimeString" ) )
                        issue.setKind( "P2" + StringUtil.capitalize( attribute ) );
                    else
                        issue.setKind( "E2" + StringUtil.capitalize( field ) );
                }
                else {
                    key = "Wrong" + key;
                    if( attribute != null && !attribute.equals( field ) && !attribute.equals( "DateTimeString" ) ) 
                        issue.setKind( "P3"+ StringUtil.capitalize( attribute ) );
                    else 
                        issue.setKind( "E3"+ StringUtil.capitalize( field ) );
                }
                if( attribute != null && !attribute.equals( field ) && !attribute.equals( "DateTimeString" ) )
                    key = key + StringUtil.capitalize( attribute );

System.out.println( "key="+key );                    

                if( bundleContainsKey( key ) ) {
                //if( bundle.containsKey( key ) ) {
                    String localeMetadataString = bundle.getString( key );
                    String[] localeMetadata = localeMetadataString.split( "\\|" );

                    issue.setAlternateMessage( localeMetadata[ 0 ] );
                    if( localeMetadata.length >= 2 )
                        issue.setExplanation( localeMetadata[ 1 ] );
                    if( localeMetadata.length >= 3 )
                        issue.setRelatedFieldNumber( localeMetadata[ 2 ] );
                    if( localeMetadata.length >= 4 )
                        issue.setReference( localeMetadata[ 3 ] );
                    if( localeMetadata.length >= 5 )
                        issue.setLexicalField( localeMetadata[ 4 ] );
                }
            }
        }
    }

    /*
     * The method ResourceBundle.containsKey() is only available since JRE 1.6.
     * As we must use JRE 1.5, here is temporary implementation.
     */
    private boolean bundleContainsKey( String key ) {
        for( Enumeration e = bundle.getKeys(); e.hasMoreElements(); ) {
            String k = (String)e.nextElement();
            if( k.equals( key ) )
                return( true );
        }
        return( false );
    }

    private Object[] getLocationData( int lineNumber, int columnNumber ) {
System.out.println( "getLocationData lineNumber="+lineNumber+" columnNumber="+columnNumber );        
        String xpath;
        String field;
        String attribute;

        int index = getIndexOfLocation( lineNumber, columnNumber );
System.out.println( "indexOfLocation="+index );        
        if( index == -1 )
            return( null );

        String truncatedLom = lom.substring( 0, index ); 
        //String parentField = getParentField( truncatedLom.substring( 0, indexOfOpeningTag ), new Stack() );
        String parentField = getParentField( truncatedLom, new Stack() );
return( new Object[] { parentField, null } );
//        String truncatedLom = lom.substring( 0, index ); 
//        int indexOfOpeningTag = truncatedLom.lastIndexOf( "<", truncatedLom.length() - 1 );
//        if( indexOfOpeningTag == -1 )
//            return( null );
//
//        int indexOfPreviousTagClosingMark = truncatedLom.indexOf( ">", indexOfOpeningTag );
//        if( indexOfPreviousTagClosingMark == -1 )
//            return( null );
//
//        String currentTag = truncatedLom.substring( indexOfOpeningTag, indexOfPreviousTagClosingMark + 1 );
//System.out.println( "#"+ currentTag + "#" );
//
//        Pattern emptyTagPattern = Pattern.compile( "<\\b(.+?)\b.*/>" );
//        Matcher tagMatcher = emptyTagPattern.matcher( currentTag );
//        if( tagMatcher.find() ) {
//            String emptyTag = tagMatcher.group( 1 );
//System.out.println( "Matched empty tag="+emptyTag );
//            field = tagMatcher.group( 1 );
//            //indexOfOpeningTag = truncatedLom.lastIndexOf( "<", indexOfOpeningTag - 1 );
//        }
//        else {
//System.out.println( "else1" );            
//            Pattern openingTagPattern = Pattern.compile( "<\\b(.+?)\\b.*>" );
//            Matcher openingTagMatcher = openingTagPattern.matcher( currentTag );
//            if( openingTagMatcher.find() ) {
//                field = openingTagMatcher.group( 1 );
//System.out.println( "Matched opening tag=" + field);
//            }
//            else {
//System.out.println( "else2" );                
//                Pattern closingTagPattern = Pattern.compile( "</\\b(.+?)\\b.*>" );
//                Matcher closingTagMatcher = closingTagPattern.matcher( currentTag );
//System.out.println( "before find" );                
//                if( closingTagMatcher.find() ) {
//System.out.println( "after find" );                    
//                    field = closingTagMatcher.group( 1 );
//                    indexOfOpeningTag = truncatedLom.lastIndexOf( "<", indexOfOpeningTag - 1 );
//System.out.println( "Matched closing tag="+field+" indexOfOpeningTag=" + indexOfOpeningTag );                    
//                }
//                else {
//System.out.println( "Oops!" );                    
//                    return( null );
//                }
//            }
//        }
//
//        String parentField = getParentField( truncatedLom.substring( 0, indexOfOpeningTag ), new Stack() );
//        if( parentField == null )
//            return( null );
//
//        return( new String[] { field, parentField } );
//        return( null );
    }

    private int getIndexOfLocation( int locationLineNumber, int locationColumnNumber ) {
System.out.println( "lineNumber and colNomber="+locationLineNumber+","+locationColumnNumber );        
        int index = -1;
        BufferedReader reader = new BufferedReader( new StringReader( lom ) );
        try {
            for( int lineNumber = 0; lineNumber < locationLineNumber - 1; lineNumber++ ) {
                String line = reader.readLine();
                if( line == null )
                    break;
                index += line.length() + 1; // Add 1 for newline characters.
System.out.println( "line="+line+ " length="+line.length() + " index="+index );

            }
            index += locationColumnNumber;
        }
        catch( IOException ignoreUnreadableLine ) {
            // Should never happen but get out of the loop (just in case).
        }
        finally {
            try {
                reader.close();
            }
            catch( IOException ignore ) {
            }
        }
        return( index );
    }

    private String buildPathRec( String truncatedLom, Stack visitedElements ) {
//System.out.println( "buildPathRec visitedElements="+visitedElements );        
////System.out.println( "truncatedLom=@"+truncatedLom+"@");
//        int indexOfPreviousTag = truncatedLom.lastIndexOf( "<", truncatedLom.length() - 1 );
////System.out.println( "indexOfPreviousTag="+indexOfPreviousTag );        
//        if( indexOfPreviousTag == -1 )
//            return( null );
//
//        int indexOfPreviousTagClosingMark = truncatedLom.indexOf( ">", indexOfPreviousTag );
//        Pattern emptyTagPattern = Pattern.compile( "<\\b(.+?)\b.*/>" );
//        Matcher tagMatcher = emptyTagPattern.matcher( truncatedLom.substring( indexOfPreviousTag, indexOfPreviousTagClosingMark + 1 ) );
//        if( tagMatcher.find() ) {
//            String emptyTag = tagMatcher.group( 1 );
////System.out.println( "Matched empty tag="+emptyTag );
//            return( buildPathRec( truncatedLom.substring( indexOfPreviousTag ), visitedElements ) );
//        }
//
//        Pattern closingTagPattern = Pattern.compile( "</\\b(.+?)\\b.*>" );
//        Matcher closingTagMatcher = closingTagPattern.matcher( truncatedLom.substring( indexOfPreviousTag, indexOfPreviousTagClosingMark + 1 ) );
//        if( closingTagMatcher.find() ) {
//            String closingTag = closingTagMatcher.group( 1 );
////System.out.println( "Matched closing tag="+closingTag );            
//            
//            visitedElements.push( closingTag );
//            return( buildPathRec( truncatedLom.substring( 0, indexOfPreviousTag ), visitedElements ) );
//        }
//       
//        Pattern openingTagPattern = Pattern.compile( "<\\b(.+?)\\b.*>" );
////System.out.println( "@"+truncatedLom.substring( indexOfPreviousTag, indexOfPreviousTagClosingMark + 1 )+"@" );        
//        Matcher openingTagMatcher = openingTagPattern.matcher( truncatedLom.substring( indexOfPreviousTag, indexOfPreviousTagClosingMark + 1 ) );
//        if( openingTagMatcher.find() ) {
//            String openingTag = openingTagMatcher.group( 1 );
////System.out.println( "Matched opening tag="+openingTag );            
//            if( visitedElements.isEmpty() )
//                return( openingTag );
//            String lastVisitedTag = (String)visitedElements.pop();
//            if( !openingTag.equals( lastVisitedTag ) )
//                throw new RuntimeException( "Unexpected last visited tag.  Error in buildPathRec() method." );
//            return( buildPathRec( truncatedLom.substring( 0, indexOfPreviousTag  ), visitedElements ) );
//        }
        return( null );
    }

    private String getParentField( String truncatedLom, Stack visitedElements ) {
System.out.println( "getParentField visitedElements="+visitedElements );        
System.out.println( "truncatedLom=@"+truncatedLom+"@");
        int indexOfPreviousTag = truncatedLom.lastIndexOf( "<", truncatedLom.length() - 1 );
System.out.println( "indexOfPreviousTag="+indexOfPreviousTag );        
        if( indexOfPreviousTag == -1 )
            return( null );

        int indexOfPreviousTagClosingMark = truncatedLom.indexOf( ">", indexOfPreviousTag );
        Pattern emptyTagPattern = Pattern.compile( "<\\b(.+?)\b.*/>" );
        Matcher tagMatcher = emptyTagPattern.matcher( truncatedLom.substring( indexOfPreviousTag, indexOfPreviousTagClosingMark + 1 ) );
        if( tagMatcher.find() ) {
            String emptyTag = tagMatcher.group( 1 );
System.out.println( "Matched empty tag="+emptyTag );
            return( getParentField( truncatedLom.substring( indexOfPreviousTag ), visitedElements ) );
        }

        Pattern closingTagPattern = Pattern.compile( "</\\b(.+?)\\b.*>" );
        Matcher closingTagMatcher = closingTagPattern.matcher( truncatedLom.substring( indexOfPreviousTag, indexOfPreviousTagClosingMark + 1 ) );
        if( closingTagMatcher.find() ) {
            String closingTag = closingTagMatcher.group( 1 );
System.out.println( "Matched closing tag="+closingTag );            
            
            visitedElements.push( closingTag );
            return( getParentField( truncatedLom.substring( 0, indexOfPreviousTag ), visitedElements ) );
        }
       
        Pattern openingTagPattern = Pattern.compile( "<\\b(.+?)\\b.*>" );
//System.out.println( "@"+truncatedLom.substring( indexOfPreviousTag, indexOfPreviousTagClosingMark + 1 )+"@" );        
        Matcher openingTagMatcher = openingTagPattern.matcher( truncatedLom.substring( indexOfPreviousTag, indexOfPreviousTagClosingMark + 1 ) );
        if( openingTagMatcher.find() ) {
            String openingTag = openingTagMatcher.group( 1 );
System.out.println( "Matched opening tag="+openingTag );            
            if( visitedElements.isEmpty() )
                return( openingTag );
            String lastVisitedTag = (String)visitedElements.pop();
            if( !openingTag.equals( lastVisitedTag ) )
                throw new RuntimeException( "Unexpected last visited tag.  Error in getParentField() method." );
            return( getParentField( truncatedLom.substring( 0, indexOfPreviousTag  ), visitedElements ) );
        }
        return( null );
    }

    private String[] getFields( int lineNumber, int columnNumber ) {
System.out.println( "getFields lineNumber="+lineNumber+" columnNumber="+columnNumber );        
        String parentField = null;
        String field = null;

        int index = getIndexOfLocation( lineNumber, columnNumber );
System.out.println( "indexOfLocation="+index );        
        if( index == -1 )
            return( null );

        String truncatedLom = lom.substring( 0, index ); 
        int indexOfOpeningTag = truncatedLom.lastIndexOf( "<", truncatedLom.length() - 1 );
        if( indexOfOpeningTag == -1 )
            return( null );

        int indexOfPreviousTagClosingMark = truncatedLom.indexOf( ">", indexOfOpeningTag );
        if( indexOfPreviousTagClosingMark == -1 )
            return( null );

        String currentTag = truncatedLom.substring( indexOfOpeningTag, indexOfPreviousTagClosingMark + 1 );
System.out.println( "#"+ currentTag + "#" );

        Pattern emptyTagPattern = Pattern.compile( "<\\b(.+?)\b.*/>" );
        Matcher tagMatcher = emptyTagPattern.matcher( currentTag );
        if( tagMatcher.find() ) {
            String emptyTag = tagMatcher.group( 1 );
System.out.println( "Matched empty tag="+emptyTag );
            field = tagMatcher.group( 1 );
            //indexOfOpeningTag = truncatedLom.lastIndexOf( "<", indexOfOpeningTag - 1 );
        }
        else {
System.out.println( "else1" );            
            Pattern openingTagPattern = Pattern.compile( "<\\b(.+?)\\b.*>" );
            Matcher openingTagMatcher = openingTagPattern.matcher( currentTag );
            if( openingTagMatcher.find() ) {
                field = openingTagMatcher.group( 1 );
System.out.println( "Matched opening tag=" + field);
            }
            else {
System.out.println( "else2" );                
                Pattern closingTagPattern = Pattern.compile( "</\\b(.+?)\\b.*>" );
                Matcher closingTagMatcher = closingTagPattern.matcher( currentTag );
System.out.println( "before find" );                
                if( closingTagMatcher.find() ) {
System.out.println( "after find" );                    
                    field = closingTagMatcher.group( 1 );
                    indexOfOpeningTag = truncatedLom.lastIndexOf( "<", indexOfOpeningTag - 1 );
System.out.println( "Matched closing tag="+field+" indexOfOpeningTag=" + indexOfOpeningTag );                    
                }
                else {
System.out.println( "Oops!" );                    
                    return( null );
                }
            }
        }

        parentField = getParentField( truncatedLom.substring( 0, indexOfOpeningTag ), new Stack() );
        if( parentField == null )
            return( null );

        return( new String[] { field, parentField } );
    }

    private String getParentElement( String element, int lineNumber, int columnNumber ) {
        int index = getIndexOfLocation( lineNumber, columnNumber );
        if( index == -1 )
            return( null );

        String truncatedLom = lom.substring( 0, index ); 

        int indexOfOpeningTag = truncatedLom.lastIndexOf( "<" + element );
        if( indexOfOpeningTag == -1 )
            return( null );

        truncatedLom = truncatedLom.substring( 0, indexOfOpeningTag );
        int indexOfParentOpeningTag = truncatedLom.lastIndexOf( "<" );
        if( indexOfParentOpeningTag == -1 )
            return( null );

        int indexOfParentOpeningTagEnd = truncatedLom.lastIndexOf( ">" );
        if( indexOfParentOpeningTagEnd == -1 )
            return( null );

        return( truncatedLom.substring( indexOfParentOpeningTag + 1, indexOfParentOpeningTagEnd ) );
    }

    private ValidationIssue.ValidationType  type;
    private ValidationReport                report;
    private ResourceBundle                  bundle;
    private String                          lom;

    //private static final String[] vocabFields = {
    //    "structure",
    //    "aggregationLevel",
    //    "source"
    //};

}

