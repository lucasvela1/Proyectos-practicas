import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;

public class VentanaAgregarAlumno extends JFrame {
    private JTextField campoNombre;
    private JTextField campoDNI;
    private JTextField campoEdad;
    private JComboBox<Carrera> comboCarreras;
    private JButton botonConfirmar = new JButton("Agregar Alumno");
    private JButton botonCancelar = new JButton("Cancelar");

    public VentanaAgregarAlumno (JFrame VentanaAlumnos){
        this.setTitle("Agregar alumno");
        this.setSize(400,300);
        this.setLayout(new BorderLayout());

        JPanel panelCentral = new JPanel(new GridLayout(5,2,10,10));
        panelCentral.add(new JLabel("Nombre del alumno:"));
        campoNombre= new JTextField(20);
        panelCentral.add(campoNombre);

        panelCentral.add(new JLabel("Dni del alumno:"));
        campoDNI=new JTextField(10);
        panelCentral.add(campoDNI);

        panelCentral.add(new JLabel("Edad del alumno:"));
        campoEdad= new JTextField(2);
        panelCentral.add(campoEdad);

        panelCentral.add(new JLabel("Carrera:"));
        comboCarreras= new JComboBox<>();
        cargarCarrerasCombo();
        panelCentral.add(comboCarreras);
        this.add(panelCentral, BorderLayout.CENTER);




        JPanel panelInferior = new JPanel(new FlowLayout(FlowLayout.CENTER, 10, 10));
        panelInferior.add(botonConfirmar);
        panelInferior.add(botonCancelar);
        this.add(panelInferior, BorderLayout.SOUTH);

        botonConfirmar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String nombre = campoNombre.getText().trim();
                if (nombre.isEmpty()) {
                    JOptionPane.showMessageDialog(null, "Por favor, ingrese un nombre para el alumno.", "Error", JOptionPane.ERROR_MESSAGE);
                    return;
                }

                try {
                    byte edad = Byte.parseByte(campoEdad.getText().trim());
                    long documento = Long.parseLong(campoDNI.getText().trim());
                    Carrera carrera= (Carrera) comboCarreras.getSelectedItem();

                    Alumno nuevoAlumno= new Alumno();
                    nuevoAlumno.setNombre(nombre);
                    nuevoAlumno.setEdad(edad);
                    nuevoAlumno.setDocumento(documento);
                    nuevoAlumno.setCarrera(carrera);
                    DatosGlobales.listaAlumnos.add(nuevoAlumno);


                    JOptionPane.showMessageDialog(null, "Alumno agregado exitosamente.", "Éxito", JOptionPane.INFORMATION_MESSAGE);
                    ((VentanaAlumnos) VentanaAlumnos).actualizarComboAlumnos();
                    dispose();

                } catch (NumberFormatException ex) {
                    JOptionPane.showMessageDialog(null, "Por favor, ingrese valores válidos para el Dni y la edad.", "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        });

        botonCancelar.addActionListener(e -> dispose());
    }
    



    private void cargarCarrerasCombo(){
        comboCarreras.removeAllItems();
        for (Carrera carreras: DatosGlobales.listaCarreras){
            comboCarreras.addItem(carreras);
        }
    }

}