{a) Permitir la carga de números, puede utilizar un valor específico para terminar.
b) Listar los elementos del archivo.
c) Buscar un elemento en el archivo e indicar que posición que ocupa dentro del
mismo o -1 en caso de no estar.
1. suponiendo un archivo desordenado.
2. suponiendo el archivo ordenado en forma creciente. En ambos casos se
considera que no hay registros repetidos dentro del archivo.
d) Localizar el elemento de mayor valor dentro del archivo (los elementos no están
ordenados) e imprimirlo junto con la posición que ocupa.
e) Generar otro archivo, ArchiPares, con los elementos pares de Archi.}


program tp4ej2;

uses crt;

Type
TipoArchivo = file of Integer;

Var
archipar,archi : TipoArchivo;

procedure verificarArchivo (var archi:TipoArchivo);
var
pudoabrir:boolean;
begin
{$I-}
 Assign (archi,'Ej2.dat');
 Reset(archi); 
{$I+}
 pudoabrir := (Ioresult=0);
 if pudoabrir then
   close (archi)
 else 
   rewrite (archi);  
end;

procedure CargaArchivo (var archi:TipoArchivo);
var
i:integer;
begin
reset (archi);
writeln('Ingrese los elementos uno por uno, ingrese 9999 para terminar');
readln(i);
while i<>9999 do
 begin
  write(archi,i);
  readln (i);
 end; 
close (archi); 
end;


procedure Listar (var archi:TipoArchivo);
var
contenido:integer;
begin
reset (archi);
while not (eof(archi)) do
begin
   read(archi,contenido);
   write (contenido,' ');
 end;
writeln; 
close (archi); 
end;


procedure Busca (var archi:TipoArchivo);
var
elemento,i,tamano,elementoA:integer;
ordinalidad:char;
encontrado:boolean;
begin
reset(archi);
encontrado:=false;
writeln ('El archivo es (D)esordenado u (O)rdenado?');
readln(ordinalidad);
ordinalidad:=Upcase(ordinalidad);
if ordinalidad='D' then
 begin
   write('Ingrese elemento a buscar');
   readln (elemento);
   while (not eof(archi)) and (not encontrado) do
     begin
       read(archi,i);
       if i=elemento then 
        encontrado:=true;
     end;
   if encontrado then
     writeln ('El elemento esta en la posicion: ',(filepos(archi)-1))
   else 
     writeln ('El elemento no se ha encontrado');
 end
else
 begin
   write ('Ingrese el elemento a buscar');
   readln(elemento);
   tamano:=filesize(archi);
   tamano:=tamano div 2;
   seek(archi,tamano);
   read(archi,elementoA);
   if elemento>elementoA then
        while not (eof(archi)) and (not encontrado) do
          begin 
            read(archi,elementoA);
            if elemento=elementoA then
              begin
               encontrado:=true;
                writeln('El elemento esta en la posicion: ', (filepos(archi)-1));
              end; 
          end
   else 
    if elemento<elementoA then
     begin
      seek(archi,0);
      for i:=0 to tamano do
          begin 
            read(archi,elementoA);
            if elemento=elementoA then
             begin
              encontrado:=true;
              writeln('El elemento esta en la posicion: ', (filepos(archi)-1));
             end; 
          end
    end      
    else  
     begin
      encontrado:= true; 
      writeln('El elemento esta en la posicion: ', (filepos(archi)-1));
     end; 
  if encontrado=false then
    writeln('No se ha encontrado el elemento');   
 end;                         
close(archi); 
end;


procedure MayorElemento (var archi:TipoArchivo);
var
posaux,elemento,aux:integer;
begin
aux:=0;
reset(archi);
while not eof(archi) do
 begin
  read(archi,elemento);
  if elemento>aux then
   begin
    aux:=elemento;
    posaux:=filepos(archi)-1;
   end; 
 end;
writeln('El mayor elemento es:',aux,' y su posicion es la:',posaux);
end;


procedure GeneraPares (var archipar,archi:TipoArchivo);
var
elemento:integer;
begin
assign (archipar,'Ej2pares.dat');
rewrite(archipar);
reset(archipar);
reset(archi);
while not eof(archi) do 
 begin 
   read(archi,elemento);
   if ((elemento mod 2) =0) then
     write (archipar, elemento);
 end;    
close (archi);
close (archipar);
end;

procedure ListarPares (var archipar:TipoArchivo);
var
contenido:integer;
begin
reset (archipar);
write('Pares: ');
while not (eof(archipar)) do
begin
   read(archipar,contenido);
   write (contenido,' ');
 end; 
close (archipar); 
end;


BEGIN
verificarArchivo(archi);
CargaArchivo(archi);
Listar(archi);	
Busca(archi);
GeneraPares(archipar,archi);
MayorElemento(archi);
ListarPares(archipar);
END.

