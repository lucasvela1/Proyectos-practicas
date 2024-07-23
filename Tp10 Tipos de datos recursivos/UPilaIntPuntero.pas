//Ejercicio 1 y 2 del TP 10

unit UPilaIntPuntero;

interface

type

Telemento=integer;
Tpila= ^Tnodo;
Tnodo= record
   info:Telemento;
   sig:Tpila;
   end;

procedure crear (var pila:Tpila);
procedure meter(var pila:Tpila; e:Telemento);
procedure sacar (var pila:Tpila;var e:Telemento);
function vacia(pila:Tpila):boolean;   
procedure borrar (var pila:Tpila);

implementation

procedure crear (var pila:Tpila);
begin
pila:=Nil;
end;

procedure meter(var pila:tpila;e:Telemento);
var
aux:Tpila;
begin
new(aux);
aux^.info:=e;
aux^.sig:=pila;
pila:=aux;
end;

procedure sacar (var pila:Tpila; var e:Telemento);
var
aux:Tpila;
begin
e:=pila^.info;
aux:=pila;
pila:=pila^.sig;
dispose(aux);
end;

function vacia(pila:Tpila):boolean;
begin
vacia:=pila=nil;
end;

procedure borrar (var pila:Tpila);
var
aux:Tpila;
begin
while pila<>nil do
  begin
    aux:=pila;
    pila:=pila^.sig;
    dispose(aux);
  end;  
end;
	
END.

//Ejercicio 3: La cabeza tendrá nil
