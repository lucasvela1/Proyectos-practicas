
import java.util.ArrayList;

public class PlanDeEstudio{
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
       return switch (String.valueOf(getTipoCorrelatividad())) {
           case "A" -> alumno.getMateriasHabilitadas().contains(materia);
           case "B" -> alumno.getMateriasAprobadas().contains(materia);
           case "C" -> (alumno.getMateriasHabilitadas().contains(materia)) && (aproboCuatrimestres(alumno,(byte)5, materia));
           case "D" -> (alumno.getMateriasHabilitadas().contains(materia))&&(aproboCuatrimestres(alumno, (byte) 3, materia));
           case "E" -> (alumno.getMateriasAprobadas().contains(materia)) && (aproboCuatrimestres(alumno, (byte) 3, materia));
           default -> false;
       };
   }

}