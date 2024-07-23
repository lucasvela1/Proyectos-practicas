{TDa de un tipo de Pila}

Unit Upila;




interface 

const
N=1000000;

type

Telemento=integer;

Tpila = record
   vector: array [1..N] of Telemento;
   puntero:longint;
   end;

procedure iniciar(var pila:Tpila);

procedure agregar(var pila:Tpila; elemento:Telemento);

function cantidad(pila:Tpila):Longint;

function obtener(pila:Tpila):Telemento;
	
function estavacia(pila:Tpila):boolean;

function estallena(pila:Tpila):boolean;

implementation

procedure iniciar(var pila:Tpila);
begin
pila.puntero:=0; //Porque incremento y luego agego en agregar. No hay ventaja en 1 o 0
end;

procedure agregar(var pila:Tpila; elemento:Telemento);
begin
pila.puntero:=pila.puntero+1;
pila.vector[pila.puntero]:=elemento;
end;

function cantidad(pila:Tpila): Longint;
begin
cantidad:= pila.puntero;
end;

function obtener(pila:Tpila):Telemento;
begin	
obtener:= pila.vector[pila.puntero];	
pila.puntero:=pila.puntero-1;
end;


function estavacia (pila:Tpila):boolean;
begin
estavacia:=pila.puntero=0; 
end;

function estallena (pila:Tpila):boolean;
begin
estallena:= pila.puntero=N;
end;     

	
END.

