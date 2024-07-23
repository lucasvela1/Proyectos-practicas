{ Un árbol binario de búsqueda contiene valores enteros en el campo INFO de cada nodo.
Escribir una función SUMACUADRADO que devuelva la suma de los cuadrados de los
valores del árbol}


program Tp13Ej6;

uses crt;

type
Tlista=^Tnodo;
Telemento=integer;

Tnodo=record
  info:Telemento;
  hi,hd:Tlista;
  end;

var 
arbol:Tlista;
i:integer;

procedure iniciar (var arbol:Tlista);
begin
arbol:=nil;
end;

function crearNodo (elemento:Telemento):Tlista;
var
aux:Tlista;
begin 
  new (aux);
  aux^.info:=elemento;
  aux^.hi:=nil;
  aux^.hd:=nil;
  crearNodo:=aux;
end;

procedure agregar (var arbol:Tlista; elemento:Telemento);
begin 
  if arbol=nil then 
     arbol:=crearNodo(elemento)
  else
    if arbol^.info<elemento then
       agregar(arbol^.hd,elemento)
    else
       agregar(arbol^.hi,elemento);      
end;

function sumaCuadrado(arbol:Tlista):Telemento;
begin
  if arbol<>nil then
        sumaCuadrado:=((arbol^.info)*arbol^.info)+sumaCuadrado(arbol^.hd)+sumaCuadrado(arbol^.hi)
  else
    sumaCuadrado:=0;  
end;

BEGIN
iniciar(arbol);	
for i:=1 to 10 do
  agregar(arbol,i);
writeln('La suma es: ',sumaCuadrado(arbol));  	
END.

