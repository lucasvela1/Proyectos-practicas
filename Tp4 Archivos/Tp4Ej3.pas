{Generar un archivo con los datos personales de los clientes de un comercio. Estos datos
son: Nombre, Dirección, Teléfono, Tope de Crédito.
a) Realizar un subprograma que reciba el archivo generado e imprima su contenido.
b) Actualizar el archivo anteriormente generado aumentando en un 20 % el tope de
crédito.}

program tp4ej3;

uses crt;

type
Tclientes=record
  nombre: String;
  direccion:String;
  tope,telefono: Longint; 
  end;
  
Tarchivo = file of Tclientes;
  
var 
archi:Tarchivo;
sn:char;


procedure verificarArchivo (var archi:Tarchivo);
var
pudoabrir:boolean;
begin
{$I-}
 Assign (archi,'Ej3.dat');
 Reset(archi); 
{$I+}
 pudoabrir := (Ioresult=0);
 if pudoabrir then
   close (archi)
 else 
   rewrite (archi);  
end;


procedure CargaArchivo (var archi:Tarchivo);
var
eleccion:char;
carga:Tclientes;
begin
reset (archi);
writeln('Carga de archivo, para cancelar ingrese Z');
readln (eleccion);
eleccion:= upcase(eleccion);
while eleccion <>'Z' do
  begin
   clrscr;
   writeln ('Ingrese nombre de la persona');
   readln(carga.nombre);
   writeln('Ingrese el tope de la persona');
   readln(carga.tope);
   writeln('Ingrese la direccion de la persona');
   readln(carga.direccion);
   writeln('Ingrese el telefono de la persona');
   readln(carga.telefono);
   write(archi,carga);
   writeln('¿Desea cargar otra persona? Pulse Z para negar');
   readln (eleccion);
   eleccion:= upcase(eleccion);
  end; 
close (archi); 
end;

procedure ActualizarTope (var archi:Tarchivo);
var
carga:Tclientes;
i:byte;
begin
  reset (archi);
  i:=0;
  while not eof (archi) do
    begin
      read (archi,carga);
      seek(archi,i);
      i:=i+1;
      carga.tope:=carga.tope + ((carga.tope*20)div 100);
      write (archi, carga);
    end;
  close(archi);  
end;

procedure Listar(var archi:Tarchivo);
var
contenido: Tclientes;
begin
  reset(archi);
  while not eof (archi) do
    begin
     read(archi,contenido);
     write ('Nombre:', contenido.nombre); write ('   Tope: ',contenido.tope); write ('    Direccion:',contenido.direccion); writeln('    Telefono:',contenido.telefono);
    end; 
end;

BEGIN
verificarArchivo(archi);	
writeln ('Quiere cargar archivos? (S)i,(N)o');
readln (sn);
sn:=upcase(sn);
if sn='S' then
  CargaArchivo(archi);	
writeln ('Actualizar tope en un 20%? (S)i (N)o');  
readln (sn);
sn:=upcase(sn);
if sn='S' then
 ActualizarTope(archi);
Listar(archi);  
END.

