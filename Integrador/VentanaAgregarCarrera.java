import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.*;


public class VentanaAgregarCarrera extends JFrame{

    private JTextField campoNombre;
    private JComboBox<String> comboPlanes;
    private JButton botonConfirmar = new JButton("Confirmar");
    private JButton botonCancelar = new JButton("Cancelar");

    public VentanaAgregarCarrera(JFrame VentanaCarreras){
        this.setTitle("Agregar carrera");
        this.setSize(400,200);
        this.setLayout(new BorderLayout());


        JPanel panelSuperior = new JPanel();
        panelSuperior.add(new JLabel("Ingrese el nombre de la carrera y seleccione su plan de estudio"));
        this.add(panelSuperior, BorderLayout.NORTH);

        JPanel panelCentral= new JPanel(new GridLayout(2,2,10,10));
        panelCentral.add(new JLabel("Nombre de la carrera:"));
        campoNombre= new JTextField(20);
        panelCentral.add(campoNombre);
        panelCentral.add(new JLabel("Plan de estudios:"));
        comboPlanes= new JComboBox<>();
        cargarPlanesCombo();
        panelCentral.add(comboPlanes);
        this.add(panelCentral,BorderLayout.CENTER);

        JPanel panelInferior = new JPanel(new  FlowLayout(FlowLayout.CENTER,10,10));
        panelInferior.add(botonConfirmar);
        panelInferior.add(botonCancelar);
        this.add(panelInferior, BorderLayout.SOUTH);

        botonConfirmar.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e){
                String nombreCarrera=
                PlanDeEstudio planEstudio= 
            }
        });


         this.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                VentanaCarreras.setVisible(true); // Vuelve a mostrar la ventana de opciones
                dispose(); // Cierra la ventana actual
            }
        });
   }

   private void cargarPlanesCombo(){
    comboPlanes.removeAllItems();
    for (PlanDeEstudio plan: DatosGlobales.listaPlanes){
        comboPlanes.addItem(plan);
    }
   }


   

}