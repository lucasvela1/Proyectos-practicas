{11) Realice un procedimiento que permita invertir los elementos de una Cola, para:
a) Cola No circular
b) Cola circular.}


program Tp10Ej11b;

uses crt,UBicolaPuntero;


var
cola:TBicola;

procedure invertirBicola (cola:TBicola);
var
aux:TBicola;
elemento:Telemento;
begin
crear(aux);
while not vacia(cola) do
  begin
    sacar(cola,elemento);
    meter(aux,elemento);
  end;
cola:=aux;  
end;


BEGIN
crear(cola);	
invertirBicola(cola);	
END.

