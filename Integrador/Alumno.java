import java.util.ArrayList;


public class Alumno{
    private String nombre;
    private Carrera carrera;
    private byte edad;
    private long documento;
    private ArrayList<Materia> materiasAnotadas = new ArrayList<Materia>();
    private ArrayList<Materia> materiasAprobadas = new ArrayList<Materia>();
    private ArrayList<Materia> materiasHabilitadas = new ArrayList<Materia>();
    private byte optativasAprobadas;


    public void setNombre(String nombre){
        this.nombre=nombre;
    }

    public void setEdad(byte edad){
        this.edad=edad;
    }

    public void setDocumento(long documento){
        this.documento=documento;
    }

    public void setCarrera(Carrera carrera){
        this.carrera=carrera;
    }
    
    public Carrera getCarrera(){
        return this.carrera;
    }

    public String getNombre(){
        return this.nombre;
    }

    public byte getEdad(){
        return this.edad;
    }

    public long getDocumento(){
        return this.documento;
    }

    public ArrayList<Materia> getMateriasAnotadas(){
        return materiasAnotadas;
    }

    public ArrayList<Materia> getMateriasAprobadas(){
        return materiasAprobadas;
    }

    public ArrayList<Materia> getMateriasHabilitadas(){
        return materiasHabilitadas;
    }
    
    public void addMateriaAnotada(Materia materia){
        if (!this.materiasAnotadas.contains(materia) && !this.materiasAprobadas.contains(materia) && !this.materiasAprobadas.contains(materia)){
        this.materiasAnotadas.add(materia);
        }
    }

    public void cargarNotaParcial(byte nota, Materia materia){
        if (nota>=materia.getNotaPromocion()){
            this.materiasAprobadas.add(materia);
            if (materia.isOptativa()){
                this.optativasAprobadas++;
            }
            this.materiasHabilitadas.remove(materia);
            this.materiasAnotadas.remove(materia);
        }else if (nota>=4){
            if (!this.materiasHabilitadas.contains(materia)){
            this.materiasHabilitadas.add(materia);
            }
        }
    }

    public void cargarNotaFinal(byte nota, Materia materia){
        if (nota>=4){
            if (this.materiasHabilitadas.contains(materia)){
                this.materiasHabilitadas.remove(materia);
            }
            this.materiasAprobadas.add(materia);
            if (materia.isOptativa()){
                this.optativasAprobadas++;
            }
            this.materiasAnotadas.remove(materia);
        }
    }

    public boolean seRecibio(Carrera carrera){
        PlanDeEstudio planEstudio=carrera.getPlan();
        for (Materia m:planEstudio.materias){
            if (!m.isOptativa() && !this.materiasAprobadas.contains(m)){
                return false;
            }
        }
        return (this.optativasAprobadas >= planEstudio.getCantidadOptativasNecesarias());
    }

    /*public double promedio(){
        double suma=0;
        for (Materia m : this.materiasAprobadas) {
            suma+=m.getNotaTotal();
        }
        return (suma/(this.materiasAprobadas.size()));
    }*/

    @Override
    public String toString() {
       return this.nombre; 
}
}