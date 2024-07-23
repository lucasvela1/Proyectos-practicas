{9)Realice las declaraciones necesarias para poder implementar una Cola CIRCULAR,
cuyo contenido son los datos personales de un grupo de empleados de una empresa,
utilizando punteros.}

unit UBicolaPuntero;

interface

type

Telemento=record
     nombre:String;
     edad:integer;
     numeroTel,dni:longint;
     end;
     
Tlista= ^Tnodo;
TBicola= record
   cab,fin:Tlista;
   end;
Tnodo= record
   info:Telemento;
   sig:Tlista;
   end;

procedure crear (var cola:TBicola);
procedure meter(var cola:TBicola; e:Telemento);
procedure sacar (var cola:TBicola;var e:Telemento);
function vacia(cola:TBicola):boolean;   
procedure borrar (var cola:TBicola);

implementation

procedure crear (var cola:TBicola);
begin
cola.cab:=Nil;
cola.fin:=nil;
end;

procedure meter(var cola:TBicola;e:Telemento);
var
aux:Tlista;
begin
new(aux);
aux^.info:=e;
aux^.sig:=nil;
if cola.fin=nil then 
  cola.cab:=aux
else
  cola.fin^.sig:=aux;  
cola.fin:=aux;
end;

procedure sacar (var cola:TBicola; var e:Telemento);
var
aux:Tlista;
begin
if cola.fin<> nil then
 begin 
   aux:=cola.fin^.sig;
   e:=aux^.info;
   cola.cab:=cola.cab^.sig;
   dispose(aux);
 end;  
end;

function vacia(cola:TBicola):boolean;
begin
vacia:=cola.fin=nil;
end;


procedure borrar (var cola:TBicola);
var
aux:Tlista;
begin
while cola.cab<>nil do
  begin
    aux:=cola.cab;
    cola.cab:=cola.cab^.sig;
    dispose(aux);
  end;  
end;
	
END.

{10) Enuncie ventajas y desventajas de la implementación circular versus la no circular. La ventaja de la cola circular es que jamás va a estar llena, a lo sumo, sobreescribe viejos datos. }
