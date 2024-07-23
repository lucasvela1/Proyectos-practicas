//Realice las declaraciones necesarias para poder implementar una Cola, cuyo
//contenido son los datos personales de un grupo de empleados de una empresa,
//utilizando punteros


//ejercicio 6 y 7


unit UColaIntPuntero;

interface

type

Telemento=integer;
     
Tlista= ^Tnodo;
Tcola= record
   cab,fin:Tlista;
   end;
Tnodo= record
   info:Telemento;
   sig:Tlista;
   end;

procedure crear (var cola:Tcola);
procedure meter(var cola:Tcola; e:Telemento);
procedure sacar (var cola:Tcola;var e:Telemento);
function vacia(cola:Tcola):boolean;   
procedure borrar (var cola:Tcola);

implementation

procedure crear (var cola:Tcola);
begin
cola.cab:=Nil;
cola.fin:=nil;
end;

procedure meter(var cola:tcola;e:Telemento);
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

procedure sacar (var cola:Tcola; var e:Telemento);
var
aux:Tlista;
begin
e:=cola.cab^.info;
aux:=cola.cab;
cola.cab:=cola.cab^.sig;
if cola.cab=nil then
  cola.fin:=nil;
dispose(aux);
end;

function vacia(cola:Tcola):boolean;
begin
vacia:=cola.fin=nil;
end;

procedure borrar (var cola:Tcola);
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

//Ejercicio 8: La cola.cab y cola.fin apuntanta a nil.
