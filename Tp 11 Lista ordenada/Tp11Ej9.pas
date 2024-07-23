{Grafique y codifique las declaraciones, que a su criterio son las más eficientes, y que
permitan soportar la información para poder resolver el siguiente problema:
Un Universidad que tiene alrededor de 4000, alumnos de posgrado, les ofrece el dictado
de 1500 cursos electivos. Los alumnos, en función de sus intereses podrán elegir cursar
uno, varios o ninguno de ellos.
Se desea:
• Dado un alumno informar que en que cursos se ha inscripto.
• Dado un curso, que alumnos participan del mismo}


program Tp11Ej9;

uses crt;


type

Talumno=String;
Tcurso=String;
//En un caso donde haya más información se pone un record con más info.

TlistaAlumnos=^TnodoAlumno;
TlistaCursos=^TnodoCurso;
Tmulti=^TnodoMulti;

TnodoAlumno=record
   info:Talumno;
   sig:TListaAlumnos;
   multi:Tmulti;
   end;
TnodoCurso=record
    info:Tcurso;
    sig:TlistaCursos;
    multi:Tmulti;
    end;   
TnodoMulti=record
   alumno:TlistaAlumnos;
   curso:TlistaCursos;
   sigAlumno,sigCurso:Tmulti;
   end;

   


procedure agregarAlumno (var lista:TlistaAlumnos; alumno:Talumno); 
var
aux, actual:TlistaAlumnos;
begin
   new(aux);
   aux^.info:=alumno;
   aux^.sig:=nil;
   aux^.multi:=nil;
   if lista=nil then
      lista:=aux
   else
     begin
        if aux^.info<lista^.info then
          begin
            aux^.sig:=lista;
            lista:=aux;
          end
        else
           begin
             actual:=lista;
             while (actual^.info<aux^.info) and (actual^.sig<>nil) do
                actual:=actual^.sig;
             aux^.sig:=actual^.sig;
             actual^.sig:=aux;   
           end; 
     end;   
end;


procedure insertarCurso (var lista:TlistaCursos; curso:Tcurso);
var
aux, actual:TlistaCursos;
begin
   new(aux);
   aux^.info:=curso;
   aux^.sig:=nil;
   aux^.multi:=nil;
   if lista=nil then
      lista:=aux
   else
     begin
        if lista^.info>aux^.info then
           begin
              aux^.sig:=lista;
              lista:=aux;
           end
        else
          begin
            actual:=lista;
            while (actual^.sig<>nil) and (actual^.info<aux^.info) do
               actual:=actual^.sig;
            aux^.sig:=actual^.sig;
            actual^.sig:=aux;      
          end;   
     end;   
end;

function buscarAlumno(lista:TlistaAlumnos;info:Talumno):TlistaAlumnos;
begin
  while (lista<>nil) and (lista^.info<>info) do
     lista:=lista^.sig;
  buscarAlumno:=lista;   
end;

function buscarCurso(lista:TlistaCursos;info:Tcurso):TlistaCursos;
begin
  while (lista<>nil) and (lista^.info<>info) do
     lista:=lista^.sig;
  buscarCurso:=lista;   
end;


procedure enlazar (listaAlum:TlistaAlumnos; listaCur:TlistaCursos);
var
aux,actual:Tmulti;
begin
    if (listaAlum<>nil) and (listaCur<>nil) then
      begin
         new (aux);
         aux^.alumno:=listaAlum;
         aux^.curso:=listaCur;
         aux^.sigCurso:=nil;
         aux^.sigAlumno:=nil;
         if listaAlum^.multi=nil then 
            listaAlum^.multi:=aux
         else
          begin
           if aux^.curso^.info<listaAlum^.multi^.curso^.info then
              begin
                 aux^.sigCurso:=listaAlum^.multi;
                 listaAlum^.multi:=aux;
              end
           else
            begin
              actual:=listaAlum^.multi;
              while (actual^.sigCurso<>nil) and (actual^.sigCurso^.curso^.info<aux^.curso^.info) do
                 actual:=actual^.sigCurso;
              aux^.sigCurso:=actual^.sigCurso;
              actual^.sigCurso:=aux;   
            end;
          end;     
         if listaCur^.multi=nil then
            listaCur^.multi:=aux
         else
          begin
            if aux^.alumno^.info<listaCur^.multi^.alumno^.info then
              begin
               aux^.sigAlumno:=listaCur^.multi;
               listaCur^.multi:=aux;
              end
            else 
              begin
                actual:=listaCur^.multi;
                while (actual^.sigAlumno<>nil)and(aux^.alumno^.info>actual^.sigAlumno^.alumno^.info) do
                  actual:=actual^.sigAlumno;
                aux^.sigAlumno:=actual^.sigAlumno;
                actual^.sigAlumno:=aux;  
              end;  
          end;           
      end
end;

BEGIN
	
	
END.

