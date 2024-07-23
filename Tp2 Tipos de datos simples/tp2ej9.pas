program tp2ej9;
{Escribir un programa que detecte todas las letras que NO están en una línea de texto y las
visualice en orden alfabético.}

uses crt;

type
Tletras = set of char;

var
texto: String;
letras,letrasno: Tletras;
i:byte;
e:char;

BEGIN
letras:= ['A'..'Z','a'..'z'];
letrasno:= [];
writeln ('Ingrese el texto');
readln(texto);
for i:=1 to length(texto) do
  if (texto[i] in letras) then
    letrasno:=letrasno+[texto[i]];
letrasno:=letras-letrasno;    
write ('Las letras que no estan presentes son, en orden alfabetico:');
for e in letrasno do write(e,',');
readln;    
END.

