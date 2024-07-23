{Hacer un programa que lea dos cadenas de caracteres separadas por un blanco, y determine
a través del uso de colas si ambas cadenas son iguales.}


program tp7ej1;

uses crt,UBicola;

var
cadena:String;
cola:Tcola;

procedure ingresa (var cadena:String;var cola:Tcola);
var
i:integer;
begin
writeln('Ingrese las dos cadenas separadas por un espacio');
readln(cadena);
for i:=1 to length(cadena) do
    pushback(cola,cadena[i]);   //Agrego elementos desde la derecha
clrscr;    
end;


function igualdad (cola:Tcola):boolean;
begin
igualdad:=true;
  while ((peekback(cola)<>' ') or (peekfront(cola)<>' ')) and (igualdad) do
    if popfront(cola)<>popback(cola) then
       igualdad:=false;        
end;

BEGIN
init(cola);	
ingresa(cadena,cola);	
if igualdad(cola) then
  writeln('Ambas cadenas son iguales')
else
  writeln('Las cadenas difieren');  	
END.

