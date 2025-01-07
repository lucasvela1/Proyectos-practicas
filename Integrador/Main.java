import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;

public class Main extends JFrame{
    public static JButton botonEntrada = new JButton("Ingresar");
    public static JLabel titulo= new JLabel("Integrador de Lucas Vela, gestor de carreras y alumnos");
    public static void main(String[] args) {
        DatosGlobales.generarPrueba();
        Main ventanaPrincipal= new Main();
        ventanaPrincipal.setSize(500,500);
        ventanaPrincipal.setVisible(true);
        ventanaPrincipal.setTitle("Gestor de carreras y alumnos.");
        ventanaPrincipal.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        ventanaPrincipal.setLayout(new FlowLayout());
        ventanaPrincipal.getContentPane().add(botonEntrada);
        ventanaPrincipal.getContentPane().add(titulo);
        titulo.setFont(new Font("Arial", Font.BOLD, 17));
        titulo.setForeground(Color.YELLOW);
        titulo.setHorizontalAlignment(SwingConstants.CENTER);
        botonEntrada.setPreferredSize(new Dimension(300,150));
        ventanaPrincipal.getContentPane().setBackground(Color.BLACK);
        botonEntrada.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e){
                buttonClick(ventanaPrincipal);
            }
        });
    }
    public static void buttonClick(JFrame ventanaPrincipal){
       VentanaOpciones ventanaOpciones = new VentanaOpciones();
       ventanaOpciones.setSize(500, 500);
       ventanaOpciones.setVisible(true);
       ventanaOpciones.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
       ventanaPrincipal.dispose();
    }
}