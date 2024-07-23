{Cómo debería declararse la matriz A y cuál sería su contenido después de ejecutarse el
siguiente segmento de programa:
FOR I:=1 TO 10 DO
FOR J:= 1 TO 10 DO
A[I,J]:= I=J;}


program tp3ej6;

uses crt;

const
N = 10;

type
Tmatriz = array [1..N,1..N] of boolean; //Tiene que declararse como una matriz cuadrada, porque el for marca como true los elementos de la diagonal principal.

var 
i,j : byte;
A : Tmatriz;

BEGIN
for i:=1 to N do
  for j:=1 to N do
    A[i,j]:= (i=j);   	
END.

