{Un TDA para colas basicas}

unit Ucolaenteros;

interface

const
N=100;

type

Telemento=integer;
{Telemento = record
    nombre:String;
    apellido:String;
    tiempo:Integer;
    end;}


Tcola = record
   vector: array [1..N] of Telemento;
   primero:longint;
   ultimo:longint;
   cantidadd:longint;
   end;

procedure init(var cola:Tcola);

procedure push(var cola:Tcola; elemento:Telemento);

function cantidad(cola:Tcola):Longint;

function pop(var cola:Tcola):Telemento;
	
function estavacia(cola:Tcola):boolean;

function estallena(cola:Tcola):boolean;

function peek(cola:Tcola):Telemento;

implementation

procedure init(var cola:Tcola);
begin
cola.primero:=1;
cola.ultimo:=0;
cola.cantidadd:=0;
end;

procedure push(var cola:Tcola; elemento:Telemento);
begin
cola.ultimo:=(cola.ultimo mod N)+1;
cola.vector[cola.ultimo]:=elemento;
cola.cantidadd:=cola.cantidadd+1;
end;

function cantidad(cola:Tcola):Longint;
begin
cantidad:=cola.cantidadd;
end;

function pop(var cola:Tcola):Telemento;
begin	
pop:= cola.vector[cola.primero];	
cola.primero:=(cola.primero mod N)+1;
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

function peek(cola:Tcola):Telemento;
begin
peek:=cola.vector[cola.primero];
end;	
	
END.

