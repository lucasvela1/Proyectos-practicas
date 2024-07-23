{Escribir una FUNCIÓN de tipo puntero que explore una lista en busca de un entero dado y
devuelva NIL si el entero no se encuentra en la lista o el puntero al nodo donde está el
entero buscado.
La función deberá considerar que la lista puede estar vacía y terminar la búsqueda cuando
aparezca el primer entero igual al buscado (o al terminar de recorrer la lista si es que no
está ese elemento).
Implemente una versión iterativa y otra recursiva. Compare las ventajas y desventajas de
ambas implementacione}


program Tp9ej2;

uses crt;

type
Tpuntero = ^Tnodo;

 Tnodo = record
    info: integer;
    sig:Tpuntero;
    end;

var
aux,lista:Tpuntero;
elemento:integer;

procedure CrearNodo (var aux:Tpuntero; elemento:integer);
begin
 new(aux);
 aux^.info:=elemento;
 aux^.sig:=nil;
end;

procedure CargarLista (var lista:Tpuntero);
var
i:integer;
aux:Tpuntero;
begin
 new(lista);
 lista^.info:=1;
  for i:=1 to 10 do
    begin
     CrearNodo(aux,i);
     aux^.sig:=lista;
     lista:=aux;
    end;   
end;

function BuscaIterativa(lista:Tpuntero;elemento:integer):Tpuntero;
begin
new (BuscaIterativa);
BuscaIterativa:=nil;
while (lista<>nil) and (BuscaIterativa=nil) do
 begin
   if lista^.info=elemento then
     BuscaIterativa:=lista
   else
     lista:=lista^.sig;  
 end;
end;

function BuscaRecursiva (lista:Tpuntero;elemento:integer):Tpuntero;
begin
if lista^.info=elemento then
   BuscaRecursiva:=lista
else
   if lista=nil then
     BuscaRecursiva:=nil
   else
     BuscaRecursiva:=BuscaRecursiva(lista^.sig,elemento);      
end;

BEGIN
CargarLista(lista);	
writeln('Ingrese elemento a buscar ');
readln(elemento);
aux:=BuscaIterativa(lista,elemento);	 //Los write devuelven error si el puntero apunta a Nil, pero sirve para verificar lo pedido nomas.
writeln ('Elemento: ', aux^.info);
aux:=BuscaRecursiva(lista,elemento);
writeln ('Elemento: ', aux^.info);
END.

