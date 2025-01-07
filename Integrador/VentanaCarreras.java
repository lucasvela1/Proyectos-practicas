
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.Comparator;
import java.util.List;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

public class VentanaCarreras extends JFrame{

    //Elementos de la ventana
    private JTextArea areaMaterias;
    private JComboBox<Carrera> comboCarreras;
    private static JButton botonAgregarCarrera = new JButton("Agregar carrera");
    private static JButton botonAgregarPlan = new JButton("Agregar plan de estudios");

    public VentanaCarreras(JFrame ventanaOpciones) {
        this.setTitle("Gestión de Carreras");
        this.getContentPane().setBackground(Color.ORANGE);
        this.setLayout(new BorderLayout());

        //ComboBox para carreras, arriba de todo
        comboCarreras = new JComboBox<>();
        actualizarComboCarreras();
        this.getContentPane().add(comboCarreras, BorderLayout.NORTH);


        //Panel central con la lista de materias ordenadas por cuatrimestres.
        areaMaterias=new JTextArea();
        areaMaterias.setEditable(false);
        areaMaterias.setFont(new Font("Monospaced", Font.PLAIN, 12));
        this.getContentPane().add(new JScrollPane(areaMaterias), BorderLayout.CENTER);


        //Panel inferior con botones
        JPanel panelBotonesInferior = new JPanel();
        panelBotonesInferior.setBackground(Color.DARK_GRAY);
        panelBotonesInferior.setLayout(new FlowLayout(FlowLayout.CENTER, 10, 10));
        panelBotonesInferior.add(botonAgregarCarrera);
        panelBotonesInferior.add(botonAgregarPlan);
        this.getContentPane().add(panelBotonesInferior, BorderLayout.SOUTH);

        //Acción para agregar carrera
        botonAgregarCarrera.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                VentanaAgregarCarrera ventanaAgregarCarrera = new VentanaAgregarCarrera(VentanaCarreras.this);
                ventanaAgregarCarrera.setVisible(true);
            }
        });

        botonAgregarPlan.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                VentanaAgregarPlan ventanaAgregarPlan = new VentanaAgregarPlan(VentanaCarreras.this);
                ventanaAgregarPlan.setVisible(true);
            }
        });

        comboCarreras.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e){
                Carrera carreraSeleccionada= (Carrera) comboCarreras.getSelectedItem();
                if (carreraSeleccionada !=null){
                    mostrarMateriasPorCuatrimestre(carreraSeleccionada);
                }
            }
        });

        //Listener para cierre
        this.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                ventanaOpciones.setVisible(true);
                dispose();
            }
        });
    }

    public void actualizarComboCarreras() {
        comboCarreras.removeAllItems(); // Limpia el combo box
        for (Carrera carrera : DatosGlobales.listaCarreras) {
            comboCarreras.addItem(carrera);
        }
    }

    private void mostrarMateriasPorCuatrimestre(Carrera carrera){
        areaMaterias.setText("");
        PlanDeEstudio plan=carrera.getPlan();
        List<Materia> materias=plan.materias;
        materias.sort(Comparator.comparingInt(Materia::getCuatrimestre));
        int cuatrimestreActual=-1;
        for  (Materia materia: materias){
            if (materia.getCuatrimestre() != cuatrimestreActual){
                cuatrimestreActual=materia.getCuatrimestre();
                areaMaterias.append("\nCuatrimestre"+cuatrimestreActual+":\n");
            }
            StringBuilder detalle = new StringBuilder( " - " + materia.getNombre() +" (Nota promoción: " + materia.getNotaPromocion() + ")");
            if (materia.isOptativa()){
                detalle.append(" (Optativa)");
            }
            areaMaterias.append(detalle+ "\n");
            if (!materia.getCorrelativas().isEmpty()){
                areaMaterias.append("  Correlativas: ");
                for (Materia correlativa: materia.getCorrelativas()){
                    areaMaterias.append(correlativa.getNombre()+", ");
                }
                areaMaterias.setText(areaMaterias.getText().replaceAll(", $", ""));
                areaMaterias.append("\n");
            }
        }
    }
}