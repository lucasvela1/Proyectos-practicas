program tp2ej7;

{ Escribir un procedimiento que lea una cadena de CARACTERES y devuelva el conjunto
que contiene a todas sus LETRAS mayúsculas.}

uses crt;

type
Tmayus = set of char;

var 
conj,mayus:Tmayus;
texto: String;
i:byte;
e:char; 

BEGIN
conj:=[];
mayus:=['A'..'Z'];
writeln('Ingrese un texto');	
readln(texto);
for i:=1 to length(texto) do
  if texto[i] in mayus then
    conj:= conj+[texto[i]];
write ('Las mayusculas que aparecieron fueron: ');
for e in conj do write(e,', ');
readln;
END.

