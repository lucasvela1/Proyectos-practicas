{TDa de un tipo de Pila}

unit UpilaPuntero;

interface

const
  N = 100;

type
  Tlista = ^Tnodo;
  Tnodo = record
    info: integer;
    hi, hd: Tlista;
  end;

  Tpila = record
    vector: array [1..N] of Tlista;
    puntero: longint;
  end;

procedure init(var pila: Tpila);
procedure agregar(var pila: Tpila; elemento: Tlista);
function cantidad(pila: Tpila): Longint;
procedure obtener(var pila: Tpila; var elemento: Tlista);
function estavacia(pila: Tpila): boolean;
function estallena(pila: Tpila): boolean;

implementation

procedure init(var pila: Tpila);
begin
  pila.puntero := 0;
end;

procedure agregar(var pila: Tpila; elemento: Tlista);
begin
  if not estallena(pila) then
  begin
    pila.puntero := pila.puntero + 1;
    pila.vector[pila.puntero] := elemento;
  end
  else
    writeln('Error: la pila está llena.');
end;

function cantidad(pila: Tpila): Longint;
begin
  cantidad := pila.puntero;
end;

procedure obtener(var pila: Tpila; var elemento: Tlista);
begin
  if not estavacia(pila) then
  begin
    elemento := pila.vector[pila.puntero];
    pila.puntero := pila.puntero - 1;
  end
  else
    writeln('Error: la pila está vacía.');
end;

function estavacia(pila: Tpila): boolean;
begin
  estavacia := pila.puntero = 0;
end;

function estallena(pila: Tpila): boolean;
begin
  estallena := pila.puntero = N;
end;

end.

