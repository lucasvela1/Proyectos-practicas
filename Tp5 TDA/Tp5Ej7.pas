{Realizar un programa que permita al usuario guardar las temperaturas que se produjeron
durante un cierto periodo. El usuario puede solicitar un informe que visualice cúal fue la
mayor, la menor y el promedio de las temperaturas registradas.}


program tp5ej7;

uses crt,Ucontenedor;


var 
temperaturas: Tconte;
max,min,temp,sum:integer;
i:longint;
promedio:real;


BEGIN
writeln('Ingrese las temperaturas dia por dia, ingrese "-200" para terminar');	
iniciar(temperaturas);
readln(temp);
while temp<>-200 do
 begin
  agregar(temperaturas,temp);	
  readln(temp);
 end;
max:=-100;
min:=999;
sum:=0;
for i:=1 to cantidad(temperaturas) do
  begin
    sum:=sum+obtener(temperaturas,i);
    if obtener(temperaturas,i)>max then 
      max:=obtener(temperaturas,i);
    if obtener(temperaturas,i)<min then
      min:=obtener(temperaturas,i);    
  end;
clrscr;
writeln('La menor temperatura registrada fue: ',min);
writeln('La mayor temperatura registrada fue: ',max);
writeln('El promedio de temperatura fue de :', (sum/cantidad(temperaturas)):4:2);      
END.

