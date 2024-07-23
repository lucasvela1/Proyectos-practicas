program Tp2Ej3;

uses crt;
var 
i,palabras : byte;
cadena: String; 

BEGIN
palabras:=1;
writeln('Ingrese la cadena');
readln (cadena); 	
for i:=1 to (length(cadena)) do
  if (cadena[i]=' ') then
    palabras:=palabras+1;
if cadena[i]=' ' then
 palabras:=palabras-1;    
writeln ('Hay:',palabras, 'palabras.');
readln;    
END.

