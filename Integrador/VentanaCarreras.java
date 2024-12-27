
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class VentanaCarreras extends JFrame{

    //Elementos de la ventana
    private JComboBox<String> comboCarreras;
    private static JButton botonAgregarCarrera = new JButton("Agregar carrera");
    private static JButton botonAgregarPlan =new JButton("Agregar plan de estudios");
    private JComboBox<String> comboPlanes;


    public VentanaCarreras(JFrame ventanaOpciones) {
        //Configuración de la ventana
        this.setTitle("Gestión de Carreras");
        this.getContentPane().setBackground(Color.ORANGE);
        this.setLayout(new BorderLayout());
        
        //Configuración del combobox
        comboCarreras= new JComboBox<>();
        comboCarreras.setBounds(100, 100, 150, 30);
        cargarCarrerasCombo();
        this.getContentPane().add(comboCarreras, BorderLayout.NORTH);

        //Panel con botones en el margen inferior, con fondo gris oscuro.
        JPanel panelBotonesInferior= new JPanel();
        panelBotonesInferior.setBackground(Color.DARK_GRAY);
        panelBotonesInferior.setLayout(new FlowLayout(FlowLayout.CENTER, 10, 10));
        this.getContentPane().add(panelBotonesInferior, BorderLayout.SOUTH);
        botonAgregarCarrera.setBackground(Color.CYAN);
        botonAgregarPlan.setBackground(Color.CYAN);
        panelBotonesInferior.add(botonAgregarCarrera, BorderLayout.SOUTH);
        panelBotonesInferior.add(botonAgregarPlan, BorderLayout.SOUTH);
        
        botonAgregarCarrera.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e){
                agregarCarrera();
            }
        });


        botonAgregarPlan.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e){
                agregarPlan();
            }
        });

        // Agregar listener para el cierre de la ventana
        this.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                ventanaOpciones.setVisible(true); // Vuelve a mostrar la ventana de opciones
                dispose(); // Cierra la ventana actual
            }
        });
    }

    public void agregarCarrera(){
       VentanaAgregarCarrera ventanaAgregarCarrera = new VentanaAgregarCarrera(this);
       ventanaAgregarCarrera.setVisible(true);
       this.setVisible(false);
    }

    public void agregarPlan(){

    }

    private void cargarCarrerasCombo(){
    comboPlanes.removeAllItems();
    for (Carreras carrera: DatosGlobales.listaCarreras){
        comboCarreras.addItem(carrera);
    }
   }
}