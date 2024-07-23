program tp3ej6;
{ - Dadas las siguientes declaraciones:
TYPE
BASE = 1..50 ;  CONJ = SET OF BASE ;
VAR
A , B : CONJ ;		
Escribir un programa en Pascal para generar los conjuntos A y B de la siguiente manera:
A : múltiplos de 6;
B : complemento de A con respecto a BASE}

uses crt;

Type

BASE = 1..50;
CONJ = set of BASE;

var
a,b,c:CONJ;
i:byte;

BEGIN	
c:= [1..50];	
a:= [];	
for i:=1  to 8 do a:=a+[6*i];
write ('Elementos de A (multiplos de 6):');
for i in a do write (i, ';');
b:=c-a;
writeln;
write ('Elementos de B (Complemento de A respecto a Base):');
for i in b do write (i,';');
readln;
END.

