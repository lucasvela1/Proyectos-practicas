import java.util.ArrayList;

//Clase para guardar los datos usados en el programa.

public class DatosGlobales{
    public static ArrayList<PlanDeEstudio> listaPlanes= new ArrayList<>();
    public static ArrayList<Carrera> listaCarreras=new ArrayList<>();
    public static ArrayList<Alumno> listaAlumnos=new ArrayList<>();


    public static void generarPrueba(){
        PlanDeEstudio planPrueba= new PlanDeEstudio();
        planPrueba.setCantidadOptativasNecesarias((byte) 1);
        planPrueba.setTipoCorrelatividad('A');
        Materia m1=new Materia();
        m1.setCuatrimestre((byte) 1);
        m1.setNombre("Matematica 1");
        byte notaPromocion= (byte) 7;
        m1.setNotaPromocion(notaPromocion);
        Materia m2=new Materia();
        m2.setNombre("Matematica 2");
        m2.addCorrelativa(m1);
        m2.setNotaPromocion(notaPromocion);
        m2.setCuatrimestre((byte) 2);
        Materia m3= new Materia();
        m3.setCuatrimestre((byte) 2);
        m3.setNombre("Algebra");
        m3.setNotaPromocion(notaPromocion);
        Materia m4=new Materia();
        m4.setNombre("Calculo 1");
        m4.setCuatrimestre((byte) 3);
        m4.setNotaPromocion(notaPromocion);
        m4.addCorrelativa(m3);
        m4.setOptativa(true);
        planPrueba.addMateria(m1);
        planPrueba.addMateria(m2);
        planPrueba.addMateria(m3);
        planPrueba.addMateria(m4);
        Carrera carreraPrueba = new Carrera();
        carreraPrueba.setNombre("Carrera de prueba");
        carreraPrueba.setPlan(planPrueba);
        listaPlanes.add(planPrueba);
        listaCarreras.add(carreraPrueba);
        Alumno a1= new Alumno();
        a1.setCarrera(carreraPrueba);
        a1.setDocumento(40001169);
        a1.setEdad((byte)27);
        a1.setNombre("Lucas");
        listaAlumnos.add(a1);
        a1.cargarNotaParcial( (byte) 8 , m1);
    }

}