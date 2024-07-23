{Dadas las siguientes declaraciones
TYPE
TPUNTERO = ^INTEGER;
VAR
P, Q : TPUNTERO;
a- Escriba un procedimiento en Pascal para intercambiar los valores de los
apuntadores P y Q, de tal modo que después que el procedimiento se efectúe,
P apuntará al elemento al cual Q apuntaba antes y viceversa.
b- Escriba un procedimiento en Pascal que haga que P apunte al mismo elemento
al que Q apunta, y se deshaga del elemento al que P apuntaba anteriormente.
c- Escriba un procedimiento en Pascal que produzca una nueva variable, con P
apuntando hacia ella y con el mismo contenido del elemento al que Q apunta}


program Tp8ej1;

uses crt;

type

Tpuntero=^integer;

var 
P,Q: Tpuntero;

{A}procedure intercambio (var P,Q:Tpuntero);
var
aux:Tpuntero;
begin
aux:=P;
P:=Q;
Q:=aux;
end;

{B}procedure deshace (var P:Tpuntero;Q:Tpuntero);
begin
dispose(P); //No se hace new luego porque no pide lugar nuevo
P:=Q;
end;

{C}procedure creaVariable(var P:Tpuntero;Q:Tpuntero);
begin
new(P);
P^:=Q^;
end;

//En punteros si no paso por referencia el puntero, aún así puedo cambiar su contenido ¡No el puntero en sí, pero su contenido!


BEGIN
clrscr;
new(P);
new(Q);
P^:=1;
Q^:=2;
writeln('En inicio: ',P^,' ', Q^);
intercambio(P,Q);	
writeln('Intercambiados: ',P^,' ',Q^);
deshace(P,Q);	
writeln('Deshaciendose del valor de P: ',P^,' ',Q^);
creaVariable(P,Q);
writeln('Creando la variable: ',P^,' ',Q^);
END.

