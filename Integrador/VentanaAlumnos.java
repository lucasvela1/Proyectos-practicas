
import java.awt.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class VentanaAlumnos extends JFrame{
        public VentanaAlumnos(JFrame ventanaOpciones) {
        this.setTitle("Gestión de Alumnos");
        this.getContentPane().setBackground(Color.CYAN);
        this.setLayout(new FlowLayout());
        this.add(new JLabel("Ventana de Gestión de Alumnos"));

        // Agregar listener para el cierre de la ventana
        this.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                ventanaOpciones.setVisible(true); // Vuelve a mostrar la ventana de opciones
                dispose(); // Cierra la ventana actual
            }
        });
    }
}