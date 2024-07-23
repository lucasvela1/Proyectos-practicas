{11) Realice un procedimiento que permita invertir los elementos de una Cola, para:
a) Cola No circular
b) Cola circular.}


program Tp10ej11a;

uses crt,UColaIntPuntero;


var 
lista:Tcola;

procedure invertirNoCircular(lista:Tcola);
var
aux:Telemento;
begin
if not vacia(lista) then
  begin
     sacar(lista,aux);
     invertirNoCircular(lista);
  end;
meter(lista,aux);     
end;

BEGIN
invertirNoCircular(lista)	
END.

