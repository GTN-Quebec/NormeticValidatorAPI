package ca.licef.validator;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.Enumeration;
import java.util.ResourceBundle;
import java.util.Stack;
import java.util.Vector;
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
        if( decorateIssue( error, e ) )
            report.append( error );
    }

    public void fatalError( SAXParseException e ) throws SAXException {
        ValidationIssue error = new ValidationIssue( type, ValidationIssue.Severity.FATAL_ERROR, e.getLineNumber(), e.getColumnNumber(), e.getMessage() );
        if( decorateIssue( error, e ) )
            report.append( error );
    }

    public void warning( SAXParseException e ) throws SAXException {
        ValidationIssue error = new ValidationIssue( type, ValidationIssue.Severity.WARNING, e.getLineNumber(), e.getColumnNumber(), e.getMessage() );
        if( decorateIssue( error, e ) )
            report.append( error );
    }

    /*
     * Add additional metadata to handle error better.
     * @return <tt>true</tt> if the error may be handled normally.  <tt>false</tt> if the error must be ignored/filtered.
     */
    private boolean decorateIssue( ValidationIssue issue, SAXParseException saxException ) {
        if( bundle == null )
            return( true );

        boolean isMatchingSpecialPattern = false;
        String value = null;
        String pattern = null;
        String type = null;
        String attribute = null;

//System.out.println( "mes="+saxException.getMessage() );        
        if( !isMatchingSpecialPattern ) {
            if( saxException.getMessage().startsWith( "cvc-elt.1:" ) ) {
                isMatchingSpecialPattern = true;
                issue.setExplanation( bundle.getString( "cvc-elt.1_Explanation" ) );
                return( true ); 
            }
        }
        if( !isMatchingSpecialPattern ) {
            if( saxException.getMessage().startsWith( "cvc-attribute.3:" ) ||
                saxException.getMessage().startsWith( "cvc-complex-type.2.2:" ) ) {
                isMatchingSpecialPattern = true;
                // If the location has already been handled before, we can skip this error
                // as it doesn't add any more interesting value.
                if( handledLocations.contains( saxException.getLineNumber() + "," + saxException.getColumnNumber() ) )
                    return( false );
            }
        }
        if( !isMatchingSpecialPattern ) {
            Pattern vocabErrorPattern = Pattern.compile( "cvc-datatype-valid.1.2.1: '(.*?)' .* '(.*)'\\." );
            Matcher vocabErrorMatcher = vocabErrorPattern.matcher( saxException.getMessage() );
            if( vocabErrorMatcher.find() ) {
                isMatchingSpecialPattern = true;
                value = vocabErrorMatcher.group( 1 );
                type = vocabErrorMatcher.group( 2 );
            }
        }
        if( !isMatchingSpecialPattern ) {
            Pattern vocabErrorPattern = Pattern.compile( "cvc-datatype-valid.1.2.3: '(.*?)' .*union.*'(.*)'\\." );
            Matcher vocabErrorMatcher = vocabErrorPattern.matcher( saxException.getMessage() );
            if( vocabErrorMatcher.find() ) {
                isMatchingSpecialPattern = true;
                value = vocabErrorMatcher.group( 1 );
                type = vocabErrorMatcher.group( 2 );
            }
        }
        if( !isMatchingSpecialPattern ) {
            Pattern patternErrorPattern = Pattern.compile( "cvc-pattern-valid: .* '(.*?)' .*facet-valid.*pattern.* '(.*?)' .*'(.*?)'\\." );
            Matcher patternErrorMatcher = patternErrorPattern.matcher( saxException.getMessage() );
            if( patternErrorMatcher.find() ) {
                isMatchingSpecialPattern = true;
                value = patternErrorMatcher.group( 1 );
                pattern = patternErrorMatcher.group( 2 );
                type = patternErrorMatcher.group( 3 );
                attribute = type;
            }
        }

        if( isMatchingSpecialPattern ) {
            String path = getPath( saxException.getLineNumber(), saxException.getColumnNumber() );
            int pathDepth = getDepth( path );

//System.out.println( "path=" + path + " attribute="+attribute );                    
            if( path != null ) {
                String[] pathItem = StringUtil.split( path, '/' );
                String field = pathItem[ pathItem.length - 1 ];
                StringBuilder key = new StringBuilder();
                for( int i = 0; i < pathItem.length; i++ )
                    key.append( StringUtil.capitalize( pathItem[ i ] ) );
                if( "".equals( value ) ) {
                    key.insert( 0, "Empty" );
                    if( attribute != null && !attribute.equals( field ) && !attribute.equals( "DateTimeString" ) && !attribute.equals( "DurationString" ) )
                        issue.setKind( "P2" + StringUtil.capitalize( attribute ) );
                    else 
                        issue.setKind( "E2" + StringUtil.capitalize( field ) );
                        //issue.setKind( ( pathDepth > 3 ? "SE" : "E" ) + "2" + StringUtil.capitalize( field ) );
                }
                else {
                    key.insert( 0, "Wrong" );
                    if( attribute != null && !attribute.equals( field ) && !attribute.equals( "DateTimeString" ) && !attribute.equals( "DurationString" ) ) 
                        issue.setKind( "P3"+ StringUtil.capitalize( attribute ) );
                    else 
                        issue.setKind( "E3"+ StringUtil.capitalize( field ) );
                        //issue.setKind( ( pathDepth > 3 ? "SE" : "E" ) + "3"+ StringUtil.capitalize( field ) );
                }
                if( attribute != null && !attribute.equals( field ) && !attribute.equals( "DateTimeString" ) && !attribute.equals( "DurationString" ) )
                    key.append( StringUtil.capitalize( attribute ) );

//System.out.println( "key="+key+" found?=" + bundleContainsKey( key.toString() ) );                    
                if( bundleContainsKey( key.toString() ) ) {
                    String localeMetadataString = bundle.getString( key.toString() );
                    String[] localeMetadata = localeMetadataString.split( "\\|" );
                    
                    issue.setAlternateMessage( localeMetadata[ 0 ] );
                    if( localeMetadata.length >= 2 ) {
                        String explanation = localeMetadata[ 1 ];
                        if( explanation.indexOf( "$VALUE" ) != -1 && value != null )
                            explanation = explanation.replaceAll( "\\$VALUE", value );
                        issue.setExplanation( explanation );
                    }
                    if( localeMetadata.length >= 3 )
                        issue.setRelatedFieldNumber( localeMetadata[ 2 ] );
                    if( localeMetadata.length >= 4 )
                        issue.setReference( localeMetadata[ 3 ] );
                    if( localeMetadata.length >= 5 )
                        issue.setLexicalField( localeMetadata[ 4 ] );

                    handledLocations.addElement( saxException.getLineNumber() + "," + saxException.getColumnNumber() );
                }
            }
        }
        return( true );
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

    private String getPath( int lineNumber, int columnNumber ) {
        int index = getIndexOfLocation( lineNumber, columnNumber );
//System.out.println( "getPath lineNumber="+lineNumber+" columnNumber="+columnNumber+ "indexOfLocation="+index );        
        if( index == -1 )
            return( null );

        String truncatedLom = lom.substring( 0, index ); 
//System.out.println( "truncatedLom=@"+truncatedLom+"@" );        
        return( buildPathRec( truncatedLom, new Stack(), true ) );
    }

    private int getIndexOfLocation( int locationLineNumber, int locationColumnNumber ) {
        int index = -1;
//System.out.println( "LENGTH="+lom.length() );        
        BufferedReader reader = new BufferedReader( new StringReader( lom ) );
        try {
            for( int lineNumber = 0; lineNumber < locationLineNumber - 1; lineNumber++ ) {
                String line = reader.readLine();
                if( line == null )
                    break;
                index += line.length();
                // The line delimiter may vary whether the lom is uploaded or typed in the input field.
                // Possible values are "\r\n", "\r" or "\n".  
                // The loop is probably not very efficient but it will do for now.
                while( lom.charAt( index ) != '\n' )
                    index++;
//System.out.println( "line=@"+line+"@ length="+(line.length()+1) +" index="+index+ " chatAtIndex=@"+ lom.charAt( index )+"@"  );                
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

    private String buildPathRec( String truncatedLom, Stack visitedElements, boolean isFirstTag ) {
//System.out.println( "buildPathRec visitedElements="+visitedElements );        
//System.out.println( "truncatedLom=@"+truncatedLom+"@");
        int indexOfPreviousTag = truncatedLom.lastIndexOf( "<", truncatedLom.length() - 1 );
//System.out.println( "indexOfPreviousTag="+indexOfPreviousTag );        
        if( indexOfPreviousTag == -1 || truncatedLom.charAt( indexOfPreviousTag + 1 ) == '?' )
            return( "" );

        int indexOfPreviousTagClosingMark = truncatedLom.indexOf( ">", indexOfPreviousTag );

        String currentTagString = truncatedLom.substring( indexOfPreviousTag, indexOfPreviousTagClosingMark + 1 );
//System.out.println( "currentTag="+currentTagString );

        Pattern commentPattern = Pattern.compile( "<!--.*-->" );
        Matcher commentMatcher = commentPattern.matcher( currentTagString );
        if( commentMatcher.find() ) {
            return( buildPathRec( truncatedLom.substring( 0, indexOfPreviousTag ), visitedElements, false ) );
        }

        Pattern selfClosingTagPattern = Pattern.compile( "<\\b(.+?)\\b.*/>" );
        Matcher tagMatcher = selfClosingTagPattern.matcher( currentTagString );
        if( tagMatcher.find() ) {
            String selfClosingTag = tagMatcher.group( 1 );
//System.out.println( "Matched empty tag="+selfClosingTag );
            return( buildPathRec( truncatedLom.substring( 0, indexOfPreviousTag ), visitedElements, false ) + ( isFirstTag ? "/" + selfClosingTag : "" ) );
        }

        Pattern closingTagPattern = Pattern.compile( "</\\b(.+?)\\b.*>" );
        Matcher closingTagMatcher = closingTagPattern.matcher( currentTagString );
        if( closingTagMatcher.find() ) {
            String closingTag = closingTagMatcher.group( 1 );
//System.out.println( "Matched closing tag="+closingTag );            
            
            visitedElements.push( closingTag );
            return( buildPathRec( truncatedLom.substring( 0, indexOfPreviousTag ), visitedElements, isFirstTag ) );
        }
       
        Pattern openingTagPattern = Pattern.compile( "<\\b(.+?)\\b.*>" );
//System.out.println( "@"+truncatedLom.substring( indexOfPreviousTag, indexOfPreviousTagClosingMark + 1 )+"@" );        
        Matcher openingTagMatcher = openingTagPattern.matcher( currentTagString );
        if( openingTagMatcher.find() ) {
            String openingTag = openingTagMatcher.group( 1 );
//System.out.println( "Matched opening tag="+openingTag );            
            if( visitedElements.isEmpty() ) {
                return( buildPathRec( truncatedLom.substring( 0, indexOfPreviousTag), visitedElements, false ) + "/" + openingTag );
            }
            String lastVisitedTag = (String)visitedElements.pop();
            if( !openingTag.equals( lastVisitedTag ) )
                throw new RuntimeException( "Unexpected last visited tag <" + lastVisitedTag + ">.  Error in buildPathRec() method." );
            return( buildPathRec( truncatedLom.substring( 0, indexOfPreviousTag ), visitedElements, false ) + ( isFirstTag ? "/" + openingTag : "" ) );
        }
        return( null );
    }

    private int getDepth( String path ) {
        int slashCount = 0;
        for( int i = 0; i < path.length(); i++ ) {
            if( path.charAt( i ) == '/' )
                slashCount++;
        }
        return( slashCount );
    }

    private ValidationIssue.ValidationType  type;
    private ValidationReport                report;
    private ResourceBundle                  bundle;
    private Vector                          handledLocations = new Vector();
    private String                          lom;

    //private static final String[] exceptionalAttributeType = {
    //    "DateTimeString",
    //    "DurationString"
    //};

}

