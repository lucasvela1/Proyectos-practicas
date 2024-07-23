{5.- Un árbol binario de búsqueda está ordenado de acuerdo con el número de estudiantes.
Imprimir los nombres de todas las mujeres ordenadas desde el nro. más pequeño al mayor.
(Procedimiento recursivo)}


program Tp13Ej5;



uses crt;

type
PTRA = ^NODOA;
TIPOSEXO = (MASCULINO , FEMENINO);
CADENA = STRING [20];
Telemento=Record
   APELLIDO,NOMBRE:CADENA;
   NUMID:INTEGER ;
   SEXO:TIPOSEXO;
   PROM:REAL;
   end;
   
NODOA = RECORD
info:Telemento;
IZQUIER , DERECHO : PTRA
END;

var
arbol:PTRA;
registro:Telemento;

procedure iniciar (var arbol:PTRA);
begin
  arbol:=nil;
end;

function crearNodo (elemento:Telemento):PTRA;
var
aux:PTRA;
begin
  new(aux);
  aux^.info.APELLIDO:=elemento.APELLIDO;
  aux^.info.NOMBRE:=elemento.NOMBRE;
  aux^.info.NUMID:=elemento.NUMID;
  aux^.info.SEXO:=elemento.SEXO;
  aux^.info.PROM:=elemento.PROM;
  aux^.IZQUIER:=nil;
  aux^.DERECHO:=nil;
  crearNodo:=aux;
end;


procedure agregar (var arbol:PTRA;elemento:Telemento);
begin
   if arbol=nil then
      arbol:=crearNodo(elemento)
   else
     if arbol^.info.NUMID>=elemento.NUMID then
        agregar(arbol^.IZQUIER,elemento)
     else 
        agregar(arbol^.DERECHO,elemento);              
end;

procedure ImprimeAscendenteMujeres(arbol:PTRA);
begin
  if arbol<>nil then
   begin
    ImprimeAscendenteMujeres(arbol^.IZQUIER);
    if arbol^.info.SEXO=FEMENINO then
      writeln(arbol^.info.NOMBRE);
    ImprimeAscendenteMujeres(arbol^.DERECHO);
   end; 
end;

BEGIN
iniciar(arbol);		
registro.NOMBRE:='SANDRA';
registro.NUMID:=2;
registro.SEXO:=FEMENINO;
registro.PROM:=6;
registro.apellido:='MALENA';
agregar(arbol,registro);
registro.NOMBRE:='MARCELO';
registro.NUMID:=1;
registro.SEXO:=masculino;
agregar(arbol,registro);
registro.NOMBRE:='LUCIA';
registro.NUMID:=3;
registro.SEXO:=FEMENINO;
agregar(arbol,registro);
ImprimeAscendenteMujeres(arbol);
END.

