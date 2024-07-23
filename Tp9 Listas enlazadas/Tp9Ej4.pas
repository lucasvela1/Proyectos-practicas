{Un polinomio de la forma:
A . Xn + B . Xn-1 + ... + G
Se almacena en una lista encadenada, para lo que se van leyendo sucesivamente los pares
coeficiente-exponente ( (A,n) , (B,n-1) , .... , (G,0) ).
Cada elemento de la lista tiene los dos valores numéricos indicados y un puntero al
siguiente nodo:
a- Escribir un procedimiento que lea los datos de la forma indicada y los almacene en la
lista.
b- Escribir una función que devuelva el valor del polinomio guardado en la lista, para un
valor A para la indeterminada X (EVALUAPOLIN (PUNTERO , X) ).}


program Tp9ej4;

uses crt;

type 

Tpoli=^Tnodo;
Tnodo= record
  coeficiente,exponente:integer;
  sig:Tpoli;
 end; 

var 
poli:Tpoli;
valor:integer;

procedure CrearNodo (var aux:Tpoli; x,y:integer);
begin
 new(aux);
 aux^.coeficiente:=x;
 aux^.exponente:=y;
 aux^.sig:=nil;
end;

procedure leer (var poli:Tpoli);
var
coe,expo:integer;
eleccion:char;
aux:Tpoli;
begin
 eleccion:='a';
 while eleccion<>'N' do
  begin
   write('Ingrese el exponente: ');
   readln(expo);
   write('Ingrese el coeficiente: ');
   readln(coe);
   write('Seguir ingresando?(Si),(N)o: ');
   readln(eleccion);
   eleccion:=upcase(eleccion);
   CrearNodo(aux,coe,expo);
   aux^.sig:=poli;
   poli:=aux;
  end; 
end;

function EvaluaPoli(poli:Tpoli;x:integer):real;
var
mul,i:integer;
begin
EvaluaPoli:=0;
while poli<>nil do
  begin
   mul:=1;
   if poli^.exponente =1 then 
      mul:=x
   else   
     for i:=1 to poli^.exponente do 
        mul:=mul*x;
    EvaluaPoli:=EvaluaPoli+(poli^.coeficiente*mul);
    poli:=poli^.sig;
  end;
end;


BEGIN
clrscr;
leer(poli);	
write('Elija el valor x a analizar: ');
readln(valor);
writeln('El resultado del polinomio es: ',EvaluaPoli(poli,valor):4:2);
END.

