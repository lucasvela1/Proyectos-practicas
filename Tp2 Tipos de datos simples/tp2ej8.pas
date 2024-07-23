program tp2ej8;

{Escribir un programa que encuentre el conjunto de todas las vocales y el conjunto de todas
las consonantes de una línea de texto dada}

uses crt;

type
Tletras = set of char;


var
vocales,consonantes,conjv,conjc:Tletras;
texto: String;
e:char;
i:byte;

BEGIN
conjv:= [];
conjc:= [];
vocales:= ['a','e','i','o','u','A','E','I','O','U'];
consonantes:= ['a'..'z','A'..'Z'];
consonantes:= consonantes-vocales;
clrscr;
writeln('Ingrese un texto');	
readln(texto);
for i:=1 to (length(texto)) do
  if texto[i] in vocales then conjv:=conjv+[texto[i]]
  else if texto[i] in consonantes then conjc:=conjc+[texto[i]];
write ('Vocales encontradas: ');
for e in conjv do write (e,',');
writeln;
write ('Consonantes encontradas: ');
for e in conjc do write (e,',');
readln; 
END.

