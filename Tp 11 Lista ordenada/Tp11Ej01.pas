{Escribir un programa en Pascal que forme una lista simplemente encadenada y ordenada
de enteros positivos que se van leyendo. El proceso finaliza con un entero negativo.
Escriba el procedimiento que imprima lista anterior.}


program Tp11Ej1;

uses crt;

type
Telemento=integer;
Tpuntero=^nodo;

nodo=record
  info:Telemento;
  sig:Tpuntero;
  end;

var
lista:Tpuntero;
i,elemento:Telemento;



procedure insertarEnOrden(lista:Tpuntero;elemento:Telemento);
var aux:Tpuntero;
begin
new(aux);
aux^.info:=elemento;
while (lista^.sig<>nil) and (lista^.sig^.info<elemento) do 
   lista:=lista^.sig;
 aux^.sig:=lista^.sig;
 lista^.sig:=aux;    
end;

procedure insertaradelante (var lista:Tpuntero; elemento:Telemento);
var aux:Tpuntero;
begin
  new (aux);
  aux^.info:=elemento;
  aux^.sig:=lista;
  lista:=aux;
end;

procedure insertar(var lista:Tpuntero;elemento:Telemento);
begin
  if (lista=nil) or (lista^.info>elemento) then
      insertaradelante(lista,elemento)
  else
      insertarEnOrden(lista,elemento);
end; 

procedure listar (lista:Tpuntero);
begin
while lista<>nil do
  begin
     writeln(lista^.info);
     lista:=lista^.sig;
  end;
end;


BEGIN	
for i:=1 to 10 do
  insertar(lista,i);	
listar(lista);  
END.

