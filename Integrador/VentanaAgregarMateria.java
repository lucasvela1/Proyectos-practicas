import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;

public class VentanaAgregarMateria extends JFrame {
    private JTextField campoNombre;
    private JTextField campoCuatrimestre;
    private JTextField campoNotaPromocion;
    private JCheckBox checkOptativa;
    private JList<Materia> listaCorrelativas;
    private JButton botonConfirmar = new JButton("Agregar Materia");
    private JButton botonCancelar = new JButton("Cancelar");
    private PlanDeEstudio plan;

    public VentanaAgregarMateria(JFrame parent, PlanDeEstudio plan) {
        this.plan = plan;

        this.setTitle("Agregar Materia");
        this.setSize(400, 300);
        this.setLayout(new BorderLayout());

        JPanel panelCentral = new JPanel(new GridLayout(5, 2, 10, 10));
        panelCentral.add(new JLabel("Nombre de la materia:"));
        campoNombre = new JTextField(20);
        panelCentral.add(campoNombre);

        panelCentral.add(new JLabel("Cuatrimestre:"));
        campoCuatrimestre = new JTextField(5);
        panelCentral.add(campoCuatrimestre);

        panelCentral.add(new JLabel("Nota de promoción:"));
        campoNotaPromocion = new JTextField(5);
        panelCentral.add(campoNotaPromocion);

        panelCentral.add(new JLabel("Es optativa:"));
        checkOptativa = new JCheckBox();
        panelCentral.add(checkOptativa);

        panelCentral.add(new JLabel("Correlativas (puedes elegir varias):"));
        listaCorrelativas = new JList<>(plan.materias.toArray(new Materia[0]));
        listaCorrelativas.setSelectionMode(ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);
        JScrollPane scrollPane = new JScrollPane(listaCorrelativas);
        panelCentral.add(scrollPane);


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
                    JOptionPane.showMessageDialog(null, "Por favor, ingrese un nombre para la materia.", "Error", JOptionPane.ERROR_MESSAGE);
                    return;
                }

                try {
                    byte cuatrimestre = Byte.parseByte(campoCuatrimestre.getText().trim());
                    byte notaPromocion = Byte.parseByte(campoNotaPromocion.getText().trim());
                    boolean optativa = checkOptativa.isSelected();

                    panelCentral.add(new JLabel("Correlativas (puedes elegir varias):"));
                    listaCorrelativas = new JList<>(plan.materias.toArray(new Materia[0]));
                    listaCorrelativas.setSelectionMode(ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);
                    JScrollPane scrollPane = new JScrollPane(listaCorrelativas);
                    panelCentral.add(scrollPane);

                    Materia nuevaMateria = new Materia();
                    nuevaMateria.setNombre(nombre);
                    nuevaMateria.setCuatrimestre(cuatrimestre);
                    nuevaMateria.setNotaPromocion(notaPromocion);
                    nuevaMateria.setOptativa(optativa);

        

                    for (Materia correlativa : listaCorrelativas.getSelectedValuesList()) {
                        nuevaMateria.addCorrelativa(correlativa);
                    }

                    plan.addMateria(nuevaMateria);
                    actualizarListaCorrelativas(nuevaMateria);
                    JOptionPane.showMessageDialog(null, "Materia agregada exitosamente.", "Éxito", JOptionPane.INFORMATION_MESSAGE);
                    dispose();

                } catch (NumberFormatException ex) {
                    JOptionPane.showMessageDialog(null, "Por favor, ingrese valores válidos para el cuatrimestre y nota de promoción.", "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        });

        botonCancelar.addActionListener(e -> dispose());
    }

    private void actualizarListaCorrelativas(Materia nuevaMateria) {
        // Agregar la nueva materia a la lista de correlativas
        DefaultListModel<Materia> modelo = new DefaultListModel<>();
        for (Materia materia : plan.materias) {
            modelo.addElement(materia);
        }
        listaCorrelativas.setModel(modelo);
    }


}