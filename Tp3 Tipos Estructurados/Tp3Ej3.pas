{La mediana de un arreglo de números es el elemento M tal que la mitad de los números en
el arreglo son menores o iguales a M, y la otra mitad son mayores o iguales a M. Si el arreglo
tiene un número par de elementos, la mediana es el promedio entre los números M1 y M2
tales que la mitad de los restantes son mayores o iguales a M1 y la mitad menores o iguales
a M2. Escribir un programa en Pascal que acepte un arreglo de números y retorne la
MEDIANA}


program tp3ej3;

uses crt;

const 
M=8;

var 
i : byte;
vector: array [1..M] of integer;
m1,m2: integer;
promedio:real;

BEGIN
for i:=1 to M do	
  vector[i]:=i;
for i:=1 to (M-1) do
 if vector [i]>vector[i+1] then
    vector[i]:=vector[i+1];
if (M mod 2) = 0 then
  begin
   promedio:= (vector[M div 2]+vector[(M div 2)+1])/2;
   writeln ('La mediana es par, y su promedio es:', promedio:4:2);
  end 
else
    writeln('La mediana es impar y es:', (vector[M div 2]+1));
readln;          
END.

