public class Carrera{
    private String nombre;
    private PlanDeEstudio plan;

    public void setNombre(String nombre){
        this.nombre=nombre;
    }

    public String getNombre(){
        return this.nombre;
    }

    public void setPlan(PlanDeEstudio plan){
        this.plan=plan;
    }

    public PlanDeEstudio getPlan(){
        return plan;
    }
}