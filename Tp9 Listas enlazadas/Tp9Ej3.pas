{Escribir un programa en Pascal que genere una lista de NODOS que contengan los 20
primeros términos de la serie de Fibonacci.
Escribir luego una función que devuelva el primer elemento de la serie que sea mayor que
un número N dado.}


program Tp9ej3;

uses crt;

type
Tpuntero = ^Tnodo;

 Tnodo = record
    info: integer;
    sig:Tpuntero;
    end;

var
lista:Tpuntero;
elemento:integer;

procedure CrearNodo (var aux:Tpuntero; x:integer);
begin
 new(aux);
 aux^.info:=x;
 aux^.sig:=nil;
end;

procedure CargarLista (var lista:Tpuntero);
var
resultado,i:integer;
aux:Tpuntero;
begin
 new(lista);
 lista:=nil;
 CrearNodo(aux,0);
 aux^.sig:=lista;
 lista:=aux;
 CrearNodo(aux,1);
 aux^.sig:=lista;
 lista:=aux;
 for i:=1 to 18 do
   begin
     resultado:=lista^.info+lista^.sig^.info;
     CrearNodo(aux,resultado);
     aux^.sig:=lista;
     lista:=aux;
   end; 
end;

function BuscarMayor (lista:Tpuntero; elemento:integer):integer;
begin
  BuscarMayor:=0;
  while (lista<>nil) do
   begin                            //averiguar si existe forma más eficiente en vez de tener que recorrer toda la lista.
    if lista^.info>elemento then
      BuscarMayor:=lista^.info;
    lista:=lista^.sig;  
   end;   
end;

procedure Listar (lista:Tpuntero);
begin
while lista<>nil do 
 begin
  write(lista^.info,' ');
  lista:=lista^.sig;
 end;
end;  

BEGIN
clrscr;
CargarLista(lista);
writeln('Ingrese elemento');
readln(elemento);
writeln('El primer elemento mayor es (cero si no se encontro ninguno): ',BuscarMayor(lista,elemento));		
Listar(lista);
dispose(lista);
END.

