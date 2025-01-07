
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.ArrayList;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

public class VentanaAlumnos extends JFrame{
    
    private JTextArea areaAlumno;
    private JComboBox<Alumno> comboAlumnos;
    private static JButton botonAgregarAlumno = new JButton("Agregar Alumno");
    private static JButton botonColocarNotaParcial= new JButton("Agregar nota parcial");
    private static JButton botonColocarNotaFinal= new JButton("Agregar nota final");
    private static JButton botonAnotarAMateria= new JButton("Anotar a materia");


        public VentanaAlumnos(JFrame ventanaOpciones) {
            this.setTitle("Gestión de Alumnos");
            this.getContentPane().setBackground(Color.CYAN);
            this.setLayout(new BorderLayout());
            this.add(new JLabel("Ventana de Gestión de Alumnos"));

            //Panel superior con el comboBox
            comboAlumnos=new JComboBox<>();
            actualizarComboAlumnos();
            this.getContentPane().add(comboAlumnos, BorderLayout.NORTH);

            //Panel central con la informacion del alunno
            areaAlumno=new JTextArea();
            areaAlumno.setEditable(false);
            areaAlumno.setFont(new Font("Monospaced", Font.PLAIN, 12));
            this.getContentPane().add(new JScrollPane(areaAlumno), BorderLayout.CENTER);


            //Panel inferior con los botones

            JPanel panelInferior= new JPanel();
            panelInferior.setBackground(Color.DARK_GRAY);
            panelInferior.setLayout(new FlowLayout(FlowLayout.CENTER,5,5));
            panelInferior.add(botonAgregarAlumno);
            panelInferior.add(botonColocarNotaFinal);
            panelInferior.add(botonColocarNotaParcial);
            panelInferior.add(botonAnotarAMateria);
            this.getContentPane().add(panelInferior,BorderLayout.SOUTH);

            botonAnotarAMateria.addActionListener(new ActionListener(){
                @Override
                public void actionPerformed(ActionEvent e){
                  Alumno alumnoSeleccionado= (Alumno) comboAlumnos.getSelectedItem();
                  if (alumnoSeleccionado==null){
                    JOptionPane.showMessageDialog(VentanaAlumnos.this,"Debe seleccionar un alumno antes de anotarlo", "Error", JOptionPane.ERROR_MESSAGE);
                  } else{
                    PlanDeEstudio plan = alumnoSeleccionado.getCarrera().getPlan();
                    ArrayList<Materia> materiasDisponibles =new ArrayList<>();
                    for (Materia materia: plan.materias){
                        if (plan.puedeAnotarse(alumnoSeleccionado, materia) && !alumnoSeleccionado.getMateriasAnotadas().contains(materia) && !alumnoSeleccionado.getMateriasAprobadas().contains(materia)){
                           materiasDisponibles.add(materia); 
                        }
                    }
                    if (materiasDisponibles.isEmpty()){
                        JOptionPane.showMessageDialog(VentanaAlumnos.this, "No hay materias disponibles para anotarse", "Informacion", JOptionPane.INFORMATION_MESSAGE);
                    } else{
                        Materia materiaSeleccionada= (Materia) JOptionPane.showInputDialog(VentanaAlumnos.this, "Seleccione una materia para anotar al alumno", "Anotar a materia", JOptionPane.QUESTION_MESSAGE,null,materiasDisponibles.toArray(),materiasDisponibles.get(0));       
                        if (materiaSeleccionada !=null){
                            alumnoSeleccionado.addMateriaAnotada(materiaSeleccionada);
                            JOptionPane.showMessageDialog(VentanaAlumnos.this,"El alumno fue anotado exitosamente a la materia"+ materiaSeleccionada.getNombre(),"Exito", JOptionPane.INFORMATION_MESSAGE);
                            actualizarAreaTexto(alumnoSeleccionado);
                        }
                    }
                  }

                }
            });


            comboAlumnos.addActionListener(new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent e) {
        Alumno alumnoSeleccionado = (Alumno) comboAlumnos.getSelectedItem();
        actualizarAreaTexto(alumnoSeleccionado);
    }
});

            botonColocarNotaParcial.addActionListener(new ActionListener(){
                @Override
                public void actionPerformed(ActionEvent e){
                    Alumno alumnoSeleccionado = (Alumno) comboAlumnos.getSelectedItem();
                    if (alumnoSeleccionado==null){
                        JOptionPane.showMessageDialog(VentanaAlumnos.this,"Debe seleccionar un alumno antes de anotarlo", "Error", JOptionPane.ERROR_MESSAGE);
                    }else{
                        ArrayList<Materia> materiasAnotadas=alumnoSeleccionado.getMateriasAnotadas();
                        if (materiasAnotadas.isEmpty()){
                            JOptionPane.showMessageDialog(VentanaAlumnos.this, "El alumno no esta anotado a ninguna materia", "Informacion", JOptionPane.INFORMATION_MESSAGE);
                        } else {
                            Materia materiaSeleccionada = (Materia) JOptionPane.showInputDialog(VentanaAlumnos.this, "Seleccione una materia para asignar la nota parcial", "Agregar nota parcial", JOptionPane.QUESTION_MESSAGE,null, materiasAnotadas.toArray(), materiasAnotadas.get(0));
                            if (materiaSeleccionada !=null){
                                String notaStr= JOptionPane.showInputDialog(VentanaAlumnos.this, "Ingrese la nota parcial (0-10):", "Agregar nota parcial", JOptionPane.PLAIN_MESSAGE);
                                try {
                                    byte nota= Byte.parseByte(notaStr);
                                    if (nota <0 || nota>10){
                                        throw new NumberFormatException();
                                    }
                                    alumnoSeleccionado.cargarNotaParcial(nota, materiaSeleccionada);
                                    JOptionPane.showMessageDialog(VentanaAlumnos.this, "Nota parcial cargada exitosamente", "Exito", JOptionPane.INFORMATION_MESSAGE);
                                    actualizarAreaTexto(alumnoSeleccionado);
                                } catch (NumberFormatException ex) {
                                     JOptionPane.showMessageDialog(VentanaAlumnos.this,"Debe ingresar una nota válida entre 0 y 10.", "Error", JOptionPane.ERROR_MESSAGE);
                            }
                        }
                    }
                }
            }}
            );

            botonAgregarAlumno.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                VentanaAgregarAlumno ventanaAgregarAlumno= new VentanaAgregarAlumno(VentanaAlumnos.this);
                ventanaAgregarAlumno.setVisible(true);
            }
        });

            botonColocarNotaFinal.addActionListener(new ActionListener(){
                @Override
                public void actionPerformed(ActionEvent e){
                    Alumno alumnoSeleccionado = (Alumno) comboAlumnos.getSelectedItem();
                    if (alumnoSeleccionado==null){
                        JOptionPane.showMessageDialog(VentanaAlumnos.this,"Debe seleccionar un alumno antes de anotarlo", "Error", JOptionPane.ERROR_MESSAGE);
                    }else{
                        ArrayList<Materia> materiasAnotadas=alumnoSeleccionado.getMateriasAnotadas();
                        if (materiasAnotadas.isEmpty()){
                            JOptionPane.showMessageDialog(VentanaAlumnos.this, "El alumno no esta anotado a ninguna materia", "Informacion", JOptionPane.INFORMATION_MESSAGE);
                        } else {
                            Materia materiaSeleccionada = (Materia) JOptionPane.showInputDialog(VentanaAlumnos.this, "Seleccione una materia para asignar la nota final", "Agregar nota final", JOptionPane.QUESTION_MESSAGE,null, materiasAnotadas.toArray(), materiasAnotadas.get(0));
                            if (materiaSeleccionada !=null){
                                String notaStr= JOptionPane.showInputDialog(VentanaAlumnos.this, "Ingrese la nota final (0-10):", "Agregar nota final", JOptionPane.PLAIN_MESSAGE);
                                try {
                                    byte nota= Byte.parseByte(notaStr);
                                    if (nota <0 || nota>10){
                                        throw new NumberFormatException();
                                    }
                                    alumnoSeleccionado.cargarNotaFinal(nota, materiaSeleccionada);
                                    JOptionPane.showMessageDialog(VentanaAlumnos.this, "Nota final cargada exitosamente", "Exito", JOptionPane.INFORMATION_MESSAGE);
                                    actualizarAreaTexto(alumnoSeleccionado);
                                } catch (NumberFormatException ex) {
                                     JOptionPane.showMessageDialog(VentanaAlumnos.this,"Debe ingresar una nota válida entre 0 y 10.", "Error", JOptionPane.ERROR_MESSAGE);
                            }
                        }
                    }
                }
            }}
            );


            // Agregar listener para el cierre de la ventana
            this.addWindowListener(new WindowAdapter() {
               @Override
               public void windowClosing(WindowEvent e) {
                  ventanaOpciones.setVisible(true); // Vuelve a mostrar la ventana de opciones
                  dispose(); // Cierra la ventana actual
                }
            });
        }


        private void actualizarAreaTexto(Alumno alumnoSeleccionado) {
           if (alumnoSeleccionado == null) {
             areaAlumno.setText("Seleccione un alumno para ver su información.");
             return;
            }
    
    StringBuilder texto = new StringBuilder();
    texto.append("Alumno: ").append(alumnoSeleccionado.getNombre()).append("\n");
    texto.append("Documento: ").append(alumnoSeleccionado.getDocumento()).append("\n");
    texto.append("Edad: ").append(alumnoSeleccionado.getEdad()).append("\n\n");
    
    texto.append("Materias Anotadas:\n");
    for (Materia materia : alumnoSeleccionado.getMateriasAnotadas()) {
        texto.append("- ").append(materia.getNombre()).append(" (anotada)").append("\n");
    }

    texto.append("\nMaterias Habilitadas:\n");
    for (Materia materia : alumnoSeleccionado.getMateriasHabilitadas()) {
        texto.append("- ").append(materia.getNombre()).append(" (habilitada)").append("\n");
    }

    texto.append("\nMaterias Aprobadas:\n");
    for (Materia materia : alumnoSeleccionado.getMateriasAprobadas()) {
        texto.append("- ").append(materia.getNombre()).append(" (aprobada, Nota: ").append(materia.getNotaTotal()).append(")").append("\n");
    }

    texto.append("\nMaterias Disponibles para Anotarse:\n");
    PlanDeEstudio plan = alumnoSeleccionado.getCarrera().getPlan();
    for (Materia materia : plan.materias) {
        if (plan.puedeAnotarse(alumnoSeleccionado, materia)
                && !alumnoSeleccionado.getMateriasAnotadas().contains(materia)
                && !alumnoSeleccionado.getMateriasAprobadas().contains(materia)) {
            texto.append("- ").append(materia.getNombre()).append("\n");
        }
    }
    if (alumnoSeleccionado.seRecibio(alumnoSeleccionado.getCarrera())){
        texto.append("\nEl alumno se ha recibido\n");
    }
    
    areaAlumno.setText(texto.toString());
}



        
  public void actualizarComboAlumnos(){
            comboAlumnos.removeAllItems();
            for (Alumno alumno: DatosGlobales.listaAlumnos){
                comboAlumnos.addItem(alumno);
            }
        }
}