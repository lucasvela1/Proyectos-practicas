import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.*;

public class VentanaAgregarPlan extends JFrame{
    private JTextField campoNombre;
    private JTextField campoOptativas;
    private JButton botonConfirmar = new JButton("Confirmar");
    private JButton botonCancelar = new JButton("Cancelar");
    private JButton botonAgregarMateria = new JButton("Agregar Materia");
    private JRadioButton radioA, radioB, radioC, radioD, radioE;
    private ButtonGroup grupoTipos;
    private PlanDeEstudio nuevoPlan;


    public VentanaAgregarPlan(JFrame VentanaCarreras){
        this.setTitle("Agregar Plan");
        this.setSize(800,350);
        this.setLayout(new BorderLayout());
        nuevoPlan= new PlanDeEstudio();

        JPanel panelSuperior= new JPanel();
        panelSuperior.add(new JLabel("Agregue los datos del plan de estudio"));
        JPanel panelCentral= new JPanel(new GridLayout(5, 3, 10, 10));
        panelCentral.add(new JLabel("Nombre plan (EJ Plan ingenieria mecanica)"));
        campoNombre= new JTextField(20);
        panelCentral.add(campoNombre);
        panelCentral.add(new JLabel("Cantidad de optativas requeridas"));
        campoOptativas=new JTextField(2);
        panelCentral.add(campoOptativas);
        panelCentral.add(new JLabel("Cargar materias del 1er cuatrimestre al último"));
        panelCentral.add(botonAgregarMateria);
        panelCentral.add(new JLabel("Seleccione el tipo de plan de correlatividad"));

        JPanel panelTipos= new JPanel (new FlowLayout(FlowLayout.LEFT));

        radioA=new JRadioButton("A");
        radioB=new JRadioButton("B");
        radioC=new JRadioButton("C");
        radioD=new JRadioButton("D");
        radioE=new JRadioButton("E");

        grupoTipos= new ButtonGroup();
        grupoTipos.add(radioA);
        grupoTipos.add(radioB);
        grupoTipos.add(radioC);
        grupoTipos.add(radioD);
        grupoTipos.add(radioE);

        panelTipos.add(radioA);
        panelTipos.add(radioB);
        panelTipos.add(radioC);
        panelTipos.add(radioD);
        panelTipos.add(radioE);
 
        panelCentral.add(panelTipos);
        this.add(panelCentral,BorderLayout.CENTER);
        
        

        JPanel panelInferior=new JPanel(new FlowLayout(FlowLayout.CENTER,10,10));
        panelInferior.add(botonConfirmar);
        panelInferior.add(botonCancelar);
        this.add(panelInferior, BorderLayout.SOUTH);
        
        botonAgregarMateria.addActionListener(new ActionListener() {
           @Override
           public void actionPerformed(ActionEvent e) {
              VentanaAgregarMateria ventanaMateria = new VentanaAgregarMateria(VentanaAgregarPlan.this, nuevoPlan);
              ventanaMateria.setVisible(true);
            }
         });

         botonConfirmar.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e){
                String nombrePlan=campoNombre.getText().trim();
                byte optativasRequeridas= Byte.valueOf(campoOptativas.getText());
                char tipoSeleccionado = getTipoSeleccionado();
                if (tipoSeleccionado == ' ') {
                    JOptionPane.showMessageDialog(null, "Por favor, seleccione un tipo de plan.", "Error", JOptionPane.ERROR_MESSAGE);
                    return;
                }
                if (nombrePlan.isEmpty()){
                    JOptionPane.showMessageDialog(null, "Por favor, ingrese un nombre para el plan", "Error", JOptionPane.ERROR_MESSAGE);
                } else {
                    nuevoPlan.setNombrePlan(nombrePlan);
                    nuevoPlan.setCantidadOptativasNecesarias(optativasRequeridas);
                    nuevoPlan.setTipoCorrelatividad(tipoSeleccionado);
                    DatosGlobales.listaPlanes.add(nuevoPlan);
                    JOptionPane.showMessageDialog(null, "Plan de estudios agregado exitosamente", "Exito", JOptionPane.INFORMATION_MESSAGE);
                    dispose();
                }
                
            }
        });
        

        

        botonCancelar.addActionListener(e -> dispose());
        this.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                VentanaCarreras.setVisible(true); // Vuelve a mostrar la ventana de opciones
                dispose(); // Cierra la ventana actual
            }
        });
    }

    private char getTipoSeleccionado(){
        if (radioA.isSelected()) return 'A';
        if (radioB.isSelected()) return 'B';
        if (radioC.isSelected()) return 'C';
        if (radioD.isSelected()) return 'D';
        if (radioE.isSelected()) return 'E';
        return ' ';
    }
}