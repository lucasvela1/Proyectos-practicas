{TDa de un tipo de Pila}

Unit Upilachar;




interface 

const
N=1000000;

type

Telemento=char;

Tpilachar = record
   vector: array [1..N] of Telemento;
   puntero:longint;
   end;

procedure iniciar(var pila:Tpilachar);

procedure agregar(var pila:Tpilachar; elemento:Telemento);

function cantidad(pila:Tpilachar):Longint;

function obtener(var pila:Tpilachar):Telemento;
	
function estavacia(pila:Tpilachar):boolean;

function estallena(pila:Tpilachar):boolean;

function peek(pila:Tpilachar):Telemento;

implementation

procedure iniciar(var pila:Tpilachar);
begin
pila.puntero:=0; //Porque incremento y luego agego en agregar. No hay ventaja en 1 o 0
end;

procedure agregar(var pila:Tpilachar; elemento:Telemento);
begin
pila.puntero:=pila.puntero+1;
pila.vector[pila.puntero]:=elemento;
end;

function cantidad(pila:Tpilachar): Longint;
begin
cantidad:= pila.puntero;
end;

function obtener(var pila:Tpilachar):Telemento;
begin	
obtener:= pila.vector[pila.puntero];	
pila.puntero:=pila.puntero-1;
end;


function estavacia (pila:Tpilachar):boolean;
begin
estavacia:=pila.puntero=0; 
end;

function estallena (pila:Tpilachar):boolean;
begin
estallena:= pila.puntero=N;
end;     

function peek(pila:Tpilachar):Telemento;
begin
peek:=pila.vector[pila.puntero];
end;
	
END.

