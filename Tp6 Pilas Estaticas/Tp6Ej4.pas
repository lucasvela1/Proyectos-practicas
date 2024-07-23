{Definir un procedimiento que reciba una pila de enteros ordenada de menor a mayor y un
valor N y que devuelva la pila a la cual se agrega el valor N, de forma tal que la misma
quede ordenada. Discuta la estructura auxiliar a utilizar}


program tp6ej4;

uses crt,Upilaenteros;

const
N=10000;

var
vector:array [1..N] of integer;
pila:Tpila;
i,x:integer;

BEGIN
iniciar(pila);	
for i:=100 downto 1 do
 agregar(pila,i);	
writeln('Ingrese valor a agregar');
readln(x); 	
i:=1;
vector[i]:=obtener(pila);
while x>vector[i] do
  begin
    i:=i+1;
    vector[i]:=obtener(pila);
  end;
agregar(pila,x);
for i:=i-1 downto 1 do
  agregar(pila,vector[i]);
while not(estavacia(pila)) do
write(obtener(pila),' ');      
END.

