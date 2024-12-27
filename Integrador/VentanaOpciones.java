import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;

public class VentanaOpciones extends JFrame{

    public static JButton botonAlumnos= new JButton("Gestionar Alumnos");
    public static JButton botonCarreras= new JButton("Gestionar Carreras");

    public VentanaOpciones(){
        this.setTitle("Elección de gestión");
        botonAlumnos.setPreferredSize(new Dimension(350,100));
        botonCarreras.setPreferredSize(new Dimension(350,100));
        botonAlumnos.setBackground(Color.GREEN);
        botonCarreras.setBackground(Color.GREEN);
        this.setLayout(new BoxLayout(getContentPane(), BoxLayout.Y_AXIS));
        this.getContentPane().setBackground(Color.BLACK);
        this.getContentPane().add(Box.createVerticalGlue()); 
        this.getContentPane().add(botonAlumnos);
        this.getContentPane().add(Box.createVerticalGlue());
        this.getContentPane().add(botonCarreras);
        this.getContentPane().add(Box.createVerticalGlue());
        botonAlumnos.setAlignmentX(Component.CENTER_ALIGNMENT);
        botonCarreras.setAlignmentX(Component.CENTER_ALIGNMENT);
        botonAlumnos.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed (ActionEvent e){
                abrirVentanaAlumnos();
            }
        });
         botonCarreras.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed (ActionEvent e){
                abrirVentanaCarreras();
            }
        });
    }
    public void abrirVentanaAlumnos(){
        VentanaAlumnos ventanaAlumnos= new VentanaAlumnos(this);
        ventanaAlumnos.setSize(500,500);
        ventanaAlumnos.setVisible(true);
        this.setVisible(false);
    }

    public void abrirVentanaCarreras(){
        VentanaCarreras ventanaCarreras= new VentanaCarreras(this);
        ventanaCarreras.setSize(500,500);
        ventanaCarreras.setVisible(true);
        this.setVisible(false);
    }
}