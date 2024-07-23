{Una sección de un ministerio distribuye números para la atención del público, con un
máximo de 50 números y luego comienza a atender. Suponga que todas las personas que retiran
número se quedan en la cola hasta que los atienden.
Para cada persona se conoce la siguiente información:
* nombre y apellido
* tiempo requerido para su atención (generado de manera aleatoria).
Sabiendo que se atiende 90 minutos, simular el proceso de atención, hasta que la suma de los
tiempos de atención supere los 90 minutos disponibles. Informar:
a) el número de personas atendidas
b) la cantidad de personas que quedaron sin atender
c) el nombre de la última persona atendida y el de la primera sin atender (si existe).}


program tp7ej3;

uses crt,Ucolaenteros;

var
cola:Tcola;

procedure cargar (var cola:Tcola);
var
i:integer;
aux:Telemento;
begin
  Randomize;
  init(cola);
  for i:=1 to 50 do
    begin
       aux.nombre:='A';
       aux.apellido:='A';
       aux.tiempo:=random(10)+1;
       push(cola, aux);
    end;
end;


procedure atiende (cola:Tcola);
var
atendidos,tiempot:integer;
aux:Telemento;
begin
   atendidos:=0;
   tiempot:=0;
   while (tiempot<=90) and (not estavacia(cola)) do
     begin
       atendidos:=atendidos+1;  //se podría guardar en una pila aquellos que ya fueron atendidos, consultar si esto esta bien o es necesaria la pila
       aux:=pop(cola);
       tiempot:=tiempot+aux.tiempo;
     end;
   writeln ('Fueron atendidas: ', atendidos,' personas');
   writeln ('Faltaron atender: ', 50-atendidos,' personas');
   writeln('La ultima persona atendida fue: ',aux.nombre,' ',aux.apellido);
   if (not estavacia(cola)) then
     begin
       aux:= pop(cola);
       writeln('La primera persona que falto en ser atendida fue: ',aux.nombre,' ',aux.apellido);
     end;   
end;

BEGIN
cargar(cola);
atiende(cola);	
END.

