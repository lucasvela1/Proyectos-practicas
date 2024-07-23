{El TDA de una Bicola}


unit UBicola;

interface

const
N=100;

type

Telemento=integer;

Tcola = record
   vector: array [1..N] of Telemento;
   primero:longint;
   ultimo:longint;
   cantidadd:longint;
   end;

procedure init(var cola:Tcola);

procedure pushback(var cola:Tcola; elemento:Telemento);

procedure pushfront(var cola:Tcola; elemento:Telemento);

function cantidad(cola:Tcola):Longint;

function popfront(var cola:Tcola):Telemento;

function popback(var cola:Tcola):Telemento;
	
function estavacia(cola:Tcola):boolean;

function estallena(cola:Tcola):boolean;

function peekfront(cola:Tcola):Telemento;

function peekback(cola:Tcola):Telemento;

implementation

procedure init(var cola:Tcola);
begin
cola.primero:=1;
cola.ultimo:=N;
cola.cantidadd:=0;
end;

procedure pushback(var cola:Tcola; elemento:Telemento);
begin
cola.ultimo:=(cola.ultimo mod N)+1;
cola.vector[cola.ultimo]:=elemento;
cola.cantidadd:=cola.cantidadd+1;
end;

procedure pushfront(var cola:Tcola; elemento:Telemento);
begin
cola.primero:=cola.primero-1;
if cola.primero<1 then cola.primero:= N;
cola.cantidadd:=cola.cantidadd+1;
cola.vector[cola.primero]:=elemento;
end;

function cantidad(cola:Tcola):Longint;
begin
cantidad:=cola.cantidadd;
end;

function popfront(var cola:Tcola):Telemento;
begin	
popfront:= cola.vector[cola.primero];	
cola.primero:=(cola.primero mod N)+1;
cola.cantidadd:=cola.cantidadd-1;
end;

function popback(var cola:Tcola):Telemento;
begin
  popback:=cola.vector[cola.ultimo];
  cola.ultimo:=(cola.ultimo mod N)-1;
  if cola.ultimo<1 then cola.ultimo:=N;
  cola.cantidadd:=cola.cantidadd-1;
end;

function estavacia (cola:Tcola):boolean;
begin
estavacia:=cola.cantidadd=0; 
end;

function estallena (cola:Tcola):boolean;
begin
estallena:= cola.cantidadd=N;
end;     

function peekfront(cola:Tcola):Telemento;
begin
peekfront:=cola.vector[cola.primero];
end;	

function peekback(cola:Tcola):Telemento;
begin
peekback:=cola.vector[cola.ultimo];
end;	
END.

