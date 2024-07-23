program invertircola;

uses crt,Ucolaenteros;

var 
i : Telemento;
cola:Tcola;

procedure invertircola (var cola:Tcola);   //De esta forma si esta vacía no se rompe.
var
e:Telemento;  
begin
if not estavacia(cola) then 
 begin
  e:=pop(cola);
  invertircola(cola);
  push(cola,e);
 end;
end;   
{begin
e:=pop(cola);
if estavacia(cola) then
  push(cola,e)
else
 begin
 invertircola(cola);   
 push(cola,e);
 end;
end;} 

procedure mostrarcola (pila:Tcola);
begin
while not (estavacia(cola)) do
  writeln(pop(cola));
end;

BEGIN
init(cola);	
for i:=1 to 10 do
 push(cola,i);
invertircola(cola); 
mostrarcola(cola); 	
END.

