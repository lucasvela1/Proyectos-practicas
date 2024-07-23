{2-Implemente las 4 funciones de hash más utilizadas (mostradas en la teoría) y luego
visualice, por medio de una tabla, los valores que retorna c/una. Utilice como clave 20
valores aleatorios comprendidos entre el 1.000.000 y 1.999.999}


program Tp12Ej2;

uses crt;


const
max=1000;

type
vector=array [1..max] of integer;

var 
tabla:vector;


function modulo (numero:longint):integer;
begin
   modulo:=(numero mod max)+1;
end;

procedure iniciar (var tabla:vector);
var
i:integer;
begin
  for i:=1 to max do
    tabla[i]:=-1;
end;

procedure agregar (numero:longint; var tabla:vector);
var
  i: integer;
begin
  i:=0;
  while tabla[modulo(numero + i)] <> -1 do
    i:=i+1;
  tabla[modulo(numero+i)]:=numero;          
end;


function buscar (numero:longint; tabla:vector):integer;
var
  i: integer;
begin
  i:=0;
  while (tabla[modulo(numero+1)]<>numero) and (tabla[modulo(numero+1)] <> -1) do
    i:=i+1;
  if tabla[modulo(numero+i)] = numero then
    buscar:= modulo(numero+i)
  else
    buscar:= -1; // Devuelve -1 si no se encuentra el número
end;

BEGIN
iniciar(tabla);
agregar(101,tabla);
writeln ('Guardado en posicion: ' , buscar(101,tabla));
writeln ('Numero guardado en posicion 102: ', tabla[102]);	
END.

