
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class VentanaCarreras extends JFrame{
    public VentanaCarreras(JFrame ventanaOpciones) {
        this.setTitle("Gestión de Carreras");
        this.getContentPane().setBackground(Color.ORANGE);
        this.setLayout(new FlowLayout());
        this.add(new JLabel("Ventana de Gestión de Carreras"));

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