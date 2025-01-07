
import java.lang.reflect.Array;
import java.util.ArrayList;

public class PlanDeEstudio{
   private String nombrePlan; 
   private byte cantidadMaterias;
   private byte cantidadCuatrimestres;
   private byte cantidadOptativasNecesarias;
   private char tipoCorrelatividad;
   ArrayList<Materia> materias = new ArrayList<Materia>();

   public void setCantidadOptativasNecesarias(byte cantidad){
      this.cantidadOptativasNecesarias=cantidad;
   }

   public byte getCantidadOptativasNecesarias(){
       return this.cantidadOptativasNecesarias;
   }

   public void setTipoCorrelatividad(char tipo){
        this.tipoCorrelatividad=Character.toUpperCase(tipo);
   }

   public char getTipoCorrelatividad(){
      return this.tipoCorrelatividad;
   }

   public byte getCaantidadCuatrimestres(){
        return this.cantidadCuatrimestres;
   }

   public void addMateria(Materia materia){
       this.cantidadMaterias++;
       this.materias.add(materia);
   }



   private boolean aproboCuatrimestres(Alumno alumno,byte cuatrimestre, Materia materiaevaluada){
       for (Materia m: materias){
         if ((m.getCuatrimestre()-materiaevaluada.getCuatrimestre()<0) && (m.getCuatrimestre()-materiaevaluada.getCuatrimestre()>=-cuatrimestre)){
            if (!alumno.getMateriasAprobadas().contains(m)){
                return false;
            }
         }
       }
       return true;
   }

   public boolean puedeAnotarse(Alumno alumno, Materia materia){
       if (materia.getCorrelativas().isEmpty()){
         return true;
       }
       switch (getTipoCorrelatividad()) {

           case 'A' : for (Materia correlativa : materia.getCorrelativas()){
              if (!alumno.getMateriasHabilitadas().contains(correlativa) && !alumno.getMateriasAprobadas().contains(correlativa)){
                return false;
              }
           }
           return true;

           case 'B' : for (Materia correlativa : materia.getCorrelativas()){
              if (!alumno.getMateriasAprobadas().contains(correlativa)){
                return false;
              }
           }
           return true;

           case 'C' : for (Materia correlativa: materia.getCorrelativas()){
               if (!alumno.getMateriasHabilitadas().contains(correlativa) && !alumno.getMateriasAprobadas().contains(correlativa)){
                 return false;
               }
            }
            return (aproboCuatrimestres(alumno,(byte)5, materia));

           case 'D' : for (Materia correlativa: materia.getCorrelativas()){
               if (!alumno.getMateriasHabilitadas().contains(correlativa) && !alumno.getMateriasAprobadas().contains(correlativa)){
                 return false;
               }
            }
            return (aproboCuatrimestres(alumno, (byte) 3, materia));

           case 'E' : for (Materia correlativa: materia.getCorrelativas()){
               if (!alumno.getMateriasAprobadas().contains(correlativa)){
                 return false;
               }
            }
            return (aproboCuatrimestres(alumno, (byte) 3, materia));

            default: return false;
        }
   }

    public String getNombrePlan() {
        return nombrePlan;
    }

    public void setNombrePlan(String nombrePlan) {
        this.nombrePlan = nombrePlan;
    }

    @Override
    public String toString() {
       return this.nombrePlan; 
}

}