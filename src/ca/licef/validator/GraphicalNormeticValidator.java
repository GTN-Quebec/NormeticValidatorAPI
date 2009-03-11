package ca.licef.validator;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import org.xml.sax.SAXException;

public class GraphicalNormeticValidator {

    public final static int MARGIN = 8;

    public GraphicalNormeticValidator() {
        frame = new JFrame();
        frame.setDefaultCloseOperation( JFrame.EXIT_ON_CLOSE );
        frame.setSize( 800, 600 );

        panelMain = new JPanel( new BorderLayout( MARGIN, MARGIN ) );

        panelInput = new JPanel( new GridLayout( 0, 1, MARGIN, MARGIN ) );

        panelLocation = new JPanel( new BorderLayout( MARGIN, MARGIN ) );

        labelLocation = new JLabel();
        fieldLocation = new JTextField();
        buttonLocation = new JButton( "..." );
        buttonLocation.addActionListener(
            new ActionListener() {
                public void actionPerformed( ActionEvent e ) {
                    askLocation();
                }
            }
        );

        panelLocation.add( BorderLayout.WEST, labelLocation );
        panelLocation.add( BorderLayout.CENTER, fieldLocation );
        panelLocation.add( BorderLayout.EAST, buttonLocation );

        panelValidationConsole = new JPanel( new BorderLayout() );

        panelOptions = new JPanel( new BorderLayout() );
        labelOptions = new JLabel();

        panelValidationTypes = new JPanel( new FlowLayout( FlowLayout.RIGHT, MARGIN, 0 ) );
        checkboxIsXSDEnabled = new JCheckBox();
        checkboxIsXSDEnabled.setSelected( true );
        checkboxIsSchematronEnabled = new JCheckBox();
        checkboxIsSchematronEnabled.setSelected( true );

        panelValidationTypes.add( checkboxIsXSDEnabled );
        panelValidationTypes.add( checkboxIsSchematronEnabled );

        panelOptions.add( BorderLayout.WEST, labelOptions );
        panelOptions.add( BorderLayout.CENTER, panelValidationTypes );

        buttonValidate = new JButton();
        buttonValidate.addActionListener(
            new ActionListener() {
                public void actionPerformed( ActionEvent e ) {
                    validate();
                }
            }
        );
        panelValidationConsole.add( BorderLayout.WEST, panelOptions ); 
        panelValidationConsole.add( BorderLayout.EAST, buttonValidate );

        panelInput.add( panelLocation );
        panelInput.add( panelValidationConsole );

        panelReport = new JPanel( new BorderLayout( MARGIN, MARGIN ) );        
        labelReport = new JLabel();
        textAreaReport = new JTextArea();
        textAreaReport.setEditable( false );
        scrollPaneReport = new JScrollPane( textAreaReport );

        panelReportConsole = new JPanel( new FlowLayout( FlowLayout.RIGHT, 0, 0 ) );
        buttonClearReport = new JButton();
        buttonClearReport.addActionListener(
            new ActionListener() {
                public void actionPerformed( ActionEvent e ) {
                    clearReport();
                }
            }
        );
        panelReportConsole.add( buttonClearReport );

        panelReport.add( BorderLayout.NORTH, labelReport );
        panelReport.add( BorderLayout.CENTER, scrollPaneReport );
        panelReport.add( BorderLayout.SOUTH, panelReportConsole );

        panelMain.setBorder( BorderFactory.createEmptyBorder( MARGIN, MARGIN, MARGIN, MARGIN ) );
        panelMain.add( BorderLayout.NORTH, panelInput ); 
        panelMain.add( BorderLayout.CENTER, panelReport ); 
        frame.setContentPane( panelMain );
    }

    public static void main( String[] args ) {
        String language = null;

        for( int i = 0; i < args.length; i++ ) {
            if( "-lang".equals( args[ i ] ) )
                language = args[ ++i ];
        }
 
        GraphicalNormeticValidator validator = new GraphicalNormeticValidator();
        if( "fr".equals( language ) )
            validator.setLocale( Locale.FRENCH );
        else
            validator.setLocale( Locale.ENGLISH );
        validator.setVisible( true );
    }

    public void setVisible( boolean isVisible ) {
        frame.setVisible( true );
    }

    public void setLocale( Locale locale ) {
        this.locale = locale;

        ResourceBundle bundle = ResourceBundle.getBundle( getClass().getName(), locale );
        frame.setTitle( bundle.getString( "Title" ) );
        labelLocation.setText( bundle.getString( "SpecifyLocation" ) );
        labelReport.setText( bundle.getString( "ValidationReport" ) );
        buttonClearReport.setText( bundle.getString( "ClearReport" ) );
        labelOptions.setText( bundle.getString( "TypesOfValidation" ) );
        checkboxIsXSDEnabled.setText( bundle.getString( "ValidationTypeXSD" ) );
        checkboxIsSchematronEnabled.setText( bundle.getString( "ValidationTypeSchematron" ) );
        buttonValidate.setText( bundle.getString( "LaunchValidation" ) );
        strError = bundle.getString( "Error" );
        msgLocationNotFound = bundle.getString( "MsgLocationNotFound" );
        msgNoValidationTypeSpecified = bundle.getString( "MsgNoValidationTypeSpecified" );
    }

    public Locale getLocale() {
        return( locale );
    }

    public void validate() {
        File location = new File( fieldLocation.getText() );
        if( !location.exists() ) {
            JOptionPane.showMessageDialog( frame,  msgLocationNotFound, strError,JOptionPane.ERROR_MESSAGE );
            return;
        }

        if( !checkboxIsXSDEnabled.isSelected() && !checkboxIsSchematronEnabled.isSelected() ) {
            JOptionPane.showMessageDialog( frame,  msgNoValidationTypeSpecified, strError,JOptionPane.ERROR_MESSAGE );
            return;
        }

        NormeticValidator validator = new NormeticValidator();
        validator.setLocale( locale );
        if( !checkboxIsXSDEnabled.isSelected() )
            validator.setXSDValidationEnabled( false );
        if( !checkboxIsSchematronEnabled.isSelected() )
            validator.setSchematronValidationEnabled( false );
        try {
            ValidationReport report = validator.validate( location );
            textAreaReport.setText( report.toHumanReadableString() );
        }
        catch( SAXException e ) {
            // Ignore the exception for now.  It's been written in the report anyway.
        }
        catch( Exception e ) {
            JOptionPane.showMessageDialog( frame,  e.toString(), strError,JOptionPane.ERROR_MESSAGE );
        }
    }

    public void clearReport() {
        textAreaReport.setText( "" );
    }

    public void askLocation() {
        File defaultLocation = new File( fieldLocation.getText() );
        if( defaultLocation.exists() )
            defaultLocation = new File( defaultLocation.getParent() );

        JFileChooser fileChooser = new JFileChooser( defaultLocation );
        fileChooser.setFileSelectionMode( JFileChooser.FILES_AND_DIRECTORIES );
        int result = fileChooser.showOpenDialog( frame );
        if( result == JFileChooser.APPROVE_OPTION )
            fieldLocation.setText( fileChooser.getSelectedFile().toString() );
    }

    private Locale locale = Locale.ENGLISH;

    private String strError = null;
    private String msgLocationNotFound = null;
    private String msgNoValidationTypeSpecified = null;

    private JFrame frame;
    private JPanel panelMain;
    private JPanel panelInput;
    private JPanel panelLocation;
    private JPanel panelReport;

    private JLabel labelLocation;
    private JTextField fieldLocation;
    private JButton buttonLocation;

    private JPanel panelValidationConsole;
    private JPanel panelOptions;
    private JLabel labelOptions;
    private JPanel panelValidationTypes;
    private JCheckBox checkboxIsXSDEnabled;
    private JCheckBox checkboxIsSchematronEnabled;
    private JButton buttonValidate;

    private JLabel labelReport;
    private JScrollPane scrollPaneReport;
    private JTextArea textAreaReport;
    private JPanel panelReportConsole;
    private JButton buttonClearReport;

}
