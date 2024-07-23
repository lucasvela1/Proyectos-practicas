{Se desea mantener la siguiente información relativa a los alumnos de la Universidad
Nacional de Tierra del Fuego:
• Apellido y Nombres
• Legajo
• Domicilio
• Teléfono
• Código de la Carrera (entero entre 1 y 15)
• Cantidad de Materias aprobadas
• Fecha de Ingreso
• Baja (0/1)
Sobre esta información, se desean realizar las siguientes operaciones:
a) Asociar al archivo un índice de acceso directo (Legajo, posición). Tener en cuenta
dicha estructura para desarrollar las siguientes operaciones.
b) Incorporar un nuevo alumno verificando que ya no estuviese cargado.
c) Dar de baja lógicamente a un alumno determinado.
d) Proponga una manera de recuperar el espacio generado por estas bajas lógicas.
e) Mostrar por pantalla la información sobre un alumno particular, a partir de un
número de legajo.
f) Modificar la dirección y/o teléfono de un alumno en caso de cambio de domicilio}


program tp4ej6;

uses crt;

type
Talumnos = record 
  apellido,nombre,domicilio: String;
  telefono: longint;
  legajo,codigoc,fechaI,cantA:integer;
  baja: byte;
  end;

Tvector = array [0..1000] of integer;

TipoArchivo = file of Talumnos;


var
alumnos:Tvector;
archi:TipoArchivo;
elije:char;


procedure verificarArchivo (var archi:Tipoarchivo);
var
pudoabrir:boolean;
begin
{$I-}
 Assign (archi,'AlumnosEj6.dat');
 Reset(archi); 
{$I+}
 pudoabrir := (Ioresult=0);
 if pudoabrir then
   close (archi)
 else 
   rewrite (archi);  
end;


procedure cargadatos (var archi:TipoArchivo; var alumnos:Tvector);
var
alumaux:Talumnos;
i:integer;
eleccion:char;
begin
rewrite(archi);
reset(archi);
i:=0;
eleccion:='S';
while eleccion<>'N' do
 begin
  clrscr;
  i:=i+1;
  writeln('Ingrese nombre del alumno');
  readln (alumaux.nombre);
  writeln('Ingrese apellido del alumno');
  readln(alumaux.apellido);
  writeln('Ingrese domicilio del alumno');
  readln(alumaux.domicilio);
  writeln('Ingrese legajo del alumno');
  readln(alumaux.legajo);
  writeln('Ingrese telefono del alumno');
  readln(alumaux.telefono);
  writeln('Ingrese codigo de carrera');
  readln(alumaux.codigoc);
  writeln('Ingrese fecha de ingreso');
  readln(alumaux.fechaI);
  writeln('Ingrese cantidad de materias aprobadas');
  readln(alumaux.cantA);
  writeln('De baja? 0/1');
  readln(alumaux.baja);
  alumnos[i]:=alumaux.legajo;
  write(archi,alumaux);
  writeln('Desea cargar datos? (S)i, (N)o');
  readln(eleccion);
  eleccion:=Upcase(eleccion);
 end;
if i<>0 then 
 alumnos[0]:=i; 
end;

procedure cargavector (var archi:TipoArchivo; var alumnos:Tvector);
var
i:integer;
alumaux:Talumnos;
begin
  reset(archi);
  i:=0;
  while not eof(archi) do
    begin  
      i:=i+1;
      read(archi,alumaux);
      alumnos[i]:=alumaux.legajo;
    end;
  alumnos[0]:=i;
end;      

function esta (alumnos:Tvector):integer;
var
aux,i:integer;
begin
 i:=1;
 esta:=-1;
 writeln('Ingrese el legajo del alumno a buscar');
 readln (aux);
 while ((i<=alumnos[0]) and (esta=0)) do
 begin 
   if alumnos[i]=aux then
     esta:=i-1
   else
     i:=i+1;  
 end;
end;

procedure agregaAlumno(var archi:TipoArchivo; var alumnos:Tvector);
var
alumaux:Talumnos;
siesta:integer;
begin
{encontrado:=false;
writeln('Ingrese el legajo del alumno');
readln(alumaux.legajo);
i:=1;
while ((i<=alumnos[0]) and (not encontrado)) do
 begin 
   if alumnos[i]=alumaux.legajo then
     encontrado:=true
   else
     i:=i+1;
 end;}
siesta:=esta(alumnos); 
if siesta<>-1 then
  writeln('El alumno ya existe')
else
  begin
    alumnos[0]:=alumnos[0]+1;
    writeln('Ingrese nombre del alumno');
    readln (alumaux.nombre);
    writeln('Ingrese apellido del alumno');
    readln(alumaux.apellido);
    writeln('Ingrese domicilio del alumno');
    readln(alumaux.domicilio);
    writeln('Ingrese telefono del alumno');
    readln(alumaux.telefono);
    writeln('Ingrese codigo de carrera');
    readln(alumaux.codigoc);
    writeln('Ingrese fecha de ingreso');
    readln(alumaux.fechaI);
    writeln('Ingrese cantidad de materias aprobadas');
    readln(alumaux.cantA);
    alumaux.baja:=0;   
    alumnos[alumnos[0]]:=alumaux.legajo;
    seek(archi,alumnos[0]);
    write(archi,alumaux);      
  end;  
end;

procedure darBaja(var archi:TipoArchivo; var alumnos:Tvector);
var
alumaux: Talumnos;
siesta:integer;
begin
{encontrado:=false;
writeln ('Ingrese legajo del alumno a dar de baja');
readln(alumaux.legajo);
i:=1;
while ((i<=alumnos[0]) and (not encontrado)) do
 begin 
   if alumnos[i]=alumaux.legajo then
     encontrado:=true
   else
     i:=i+1;  
 end;}    
siesta:=esta(alumnos); 
if siesta<>-1 then
  begin
  seek(archi,siesta); 
  alumaux.baja:=1;
  write(archi,alumaux);
  alumnos[siesta]:=1;
  end
else
  writeln('El alumno ingresado no existe');  
end;





procedure mostrar (var archi:TipoArchivo; alumnos:Tvector);
var
encontrado:boolean;
alumaux:Talumnos;
siesta:integer;
begin
  {i:=1;
  encontrado:=false;
  writeln('Ingrese legajo del alumno a buscar');
  readln(alumaux.legajo);
  while ((i<=alumnos[0]) and (not encontrado)) do
 begin 
   if alumnos[i]=alumaux.lewritelngajo then
     encontrado:=true
   else
     i:=i+1;  
 end;}     
siesta:=esta(alumnos); 
if siesta<>-1 then
  begin
    seek(archi,siesta);
    read(archi,alumaux);
    writeln('Nombre y apellido:', alumaux.nombre,' ',alumaux.apellido);
    writeln('Direccion: ', alumaux.domicilio);
    writeln('Telefono: ', alumaux.telefono);
    writeln('Materias aprobadas: ', alumaux.cantA);
    writeln('Fecha de inscripcion: ', alumaux.fechaI);
    writeln('Legajo: ',alumaux.legajo);
    writeln('Codigo de carrera: ',alumaux.codigoc);
    writeln('De baja?',alumaux.baja);
  end
else
 writeln('No se ha encontrado un alumno con ese legajo');    
end;




procedure GeneraNuevo(var archi:TipoArchivo; var alumnos:Tvector);
var
auxiliar:TipoArchivo;
alumaux:Talumnos;
i:integer;
begin
i:=0;
Assign (auxiliar,'Auxiliar.dat');
rewrite(auxiliar);
reset(auxiliar);
while not eof(archi) do
 begin
   read(archi,alumaux);
   if alumaux.baja=0 then
    begin
     write(auxiliar,alumaux);
     i:=i+1;
     alumnos[i]:=alumaux.legajo;
     end;    
 end;
close(archi);
erase(archi);
close(auxiliar);
rename (auxiliar, 'AlumnosEj6.dat');
end;

BEGIN
clrscr;
verificarArchivo(archi);
writeln ('Desea crear un nuevo archivo? (S)i,(N)o');
readln(elije);
elije:=Upcase(elije);
if elije='S' then
   cargadatos(archi,alumnos);	
cargavector(archi,alumnos);
writeln('Desea agregar un alumno? (S)i,(N)o');
readln (elije);
elije:=Upcase(elije);
while elije='S' do
  begin	
    agregaAlumno(archi,alumnos);
    writeln('Desea agregar un alumno? (S)i,(N)o');
    readln (elije);
    elije:=Upcase(elije);
  end; 
writeln('Desea dar de baja un alumno? (S)i,(N)o');
readln (elije);
elije:=Upcase(elije);   
while elije='S' do
  begin
    darBaja(archi,alumnos);
    writeln('Desea dar de baja un alumno? (S)i,(N)o');
    readln (elije);
    elije:=Upcase(elije);
  end;  
writeln('Quiere ver la informacion de un alumno?(S)i,(N)o');
readln (elije);
elije:=Upcase(elije);
while elije='S' do
  begin
    clrscr;
    mostrar(archi,alumnos);
    writeln('Quiere ver la informacion de un alumno?(S)i,(N)o');
    readln (elije);
    elije:=Upcase(elije);
  end;    
writeln('Desea generar un nuevo archivo sin los alumnos dados de baja? (S)i,(N)o');
readln(elije);
elije:=Upcase(elije);
  if elije='S' then
   GeneraNuevo(archi,alumnos);
close(archi);   
END.

