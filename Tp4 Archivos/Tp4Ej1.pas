{a) verificar la existencia del archivo, si no existe, crearlo
b) Cargar el archivo con 20 entradas de números enteros.
c) Listar el contenido del archivo.}


program tp4ej1;

uses crt;

type
TipoArchivo = file of integer;
TipoPosicion = 0..MaxInt; //Representa el maximo integer
 
var 
archi:TipoArchivo;
posicion: TipoPosicion;
i : byte;

procedure verificarArchivo (var archi:TipoArchivo);
var
pudoabrir:boolean;
begin
{$I-}
 Assign (archi,'Ej1.dat');
 Reset(archi); 
{$I+}
 pudoabrir := (Ioresult=0);
 if pudoabrir then
   close (archi)
 else 
   rewrite (archi);  
end;


procedure Cargar (var archi:TipoArchivo);
var
i:integer;
begin
reset (archi);
for i:=1 to 20 do
write (archi,i);
close (archi);
end;

procedure Listar (var archi:TipoArchivo);
var
i,contenido:integer;
begin
reset (archi);
while not (eof(archi)) do
begin
   read(archi,contenido);
   write (contenido,' ');
 end;
{for i:=1 to (filesize(archi)) do           //Se puede usar cualquiera de las opciones.
 begin
   read(archi,contenido);
   write (contenido,' ');
 end; } 
close (archi); 
end;

BEGIN
verificarArchivo(archi);	
Cargar(archi);
Listar(archi);
END.

