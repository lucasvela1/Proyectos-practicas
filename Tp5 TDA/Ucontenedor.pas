{Escribir un TDA tipo contenedor. El propósito es poder almacenar una cantidad de
elementos arbitraria Por simplimplicidad considere que pueden almacenarse hasta
1.000.000 de elementos enteros.
El TDA-Contenedor deberá permitir las siguientes operaciones:
- iniciar : deja en un estado inicial al contenedor.
- agregar: agrega un elemento entero al contenedor.
- cantidad: retorna la cantidad de elementos del contenedor.
- obtener: retorna el elemento que se encuentra en una determinada posición}

Unit Ucontenedor;


     
interface

type
Tconte = record
   vector: array [1..1000000] of integer;   //Se podría poner de 1 a N, poniendo N como una constante que cambie dependiendo las necesidades. Y se podría hacer un TipoElemento de integer que pueda cambiar también de misma forma
   posicion: longint;  
   end;
     

procedure iniciar(var conte:Tconte);

procedure agregar(var conte:Tconte; elemento:integer);

function cantidad(conte:Tconte):Longint;

function obtener(conte:Tconte;posicion:longint):integer;


implementation

procedure iniciar(var conte:Tconte);
begin
conte.posicion:=0;
end;

procedure agregar(var conte:Tconte; elemento:integer);
begin
conte.posicion:=conte.posicion+1;
conte.vector[conte.posicion]:=elemento;
end;

function cantidad(conte:Tconte): Longint;
begin
cantidad:= conte.posicion;
end;

function obtener(conte:Tconte;posicion:longint):integer;
begin	
obtener:= conte.vector[posicion];	
end;


END.

