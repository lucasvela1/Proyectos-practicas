
import java.util.ArrayList;

public class Materia{
    private String nombre;
    private byte cuatrimestre;
    private byte notaPromocion;
    private boolean optativa;
    private byte notaTotal;
    ArrayList<Materia> correlativas = new ArrayList<>();

    public String getNombre(){
        return this.nombre;
    }

    public void setNombre(String nombre){
        this.nombre=nombre;
    }

    public void setCuatrimestre(byte cuatrimestre){
        this.cuatrimestre=cuatrimestre;
    }

    public byte getCuatrimestre(){
        return this.cuatrimestre;
    }

    public ArrayList<Materia> getCorrelativas(){
        return correlativas;
    }

    public void addCorrelativa(Materia materia){
        this.correlativas.add(materia);
    }

    public byte getNotaPromocion() {
        return notaPromocion;
    }

    public void setNotaPromocion(byte notaPromocion) {
        this.notaPromocion = notaPromocion;
    }

    public boolean isOptativa() {
        return optativa;
    }

    public void setOptativa(boolean optativa) {
        this.optativa = optativa;
    }

    public byte getNotaTotal() {
        return notaTotal;
    }

    public void setNotaTotal(byte notaTotal) {
        this.notaTotal = notaTotal;
    }
}