{Usando las operaciones básicas de pilas y colas, escribir un algoritmo que invierta los
elementos de una cola .}


program tp7ej2;

uses crt,UBicola,Upilaenteros;

var
cola:Tcola;

procedure carga (var cola:Tcola);
var
aux:integer;
begin
  aux:=0;
  while aux<>-9999 do
   begin
    clrscr;
    writeln('Ingrese elementos enteros, ingrese -9999 para dejar de cargar');
    readln(aux);
    if aux<>-9999 then
      pushback(cola,aux);
   end; 
end;

procedure invierte (var cola:Tcola);
var
pila:Tpila;
begin
  iniciar(pila);
  while (not UBicola.estavacia(cola)) do
    agregar(pila, popfront(cola));
  while (not Upilaenteros.estavacia(pila)) do
    pushback(cola,obtener(pila));  
end;

procedure muestra (cola:Tcola);
begin
while (not UBicola.estavacia(cola)) do
  write(popfront(cola),' ');
end;

BEGIN
init(cola);
carga(cola);
invierte(cola);
muestra(cola);	
END.

