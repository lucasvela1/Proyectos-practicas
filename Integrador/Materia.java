
import java.util.ArrayList;

public class Materia{
    private String nombre;
    private byte cuatrimestre;
    private byte notaPromocion;
    private boolean optativa;
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
        if (materia != null && !correlativas.contains(materia)) {
           correlativas.add(materia);
        }
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


    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(nombre);
        return sb.toString();
    }


}