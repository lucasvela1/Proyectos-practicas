{Diseñe y codifique en Pascal un programa que lea un número entero y cargue cada dígito
como elemento de un vector.}


program tp3ej2;

uses crt;

var
vector : array [1..5] of integer;
entero,aux: integer;
i : byte;

BEGIN
writeln ('Ingrese el entero');	
readln (entero);
aux:= entero;
for i:=5 downto 1 do	
  begin
    vector[i] := (aux mod 10);
    aux:= (aux div 10);
  end;
writeln ('Entero: ', entero); 
write ('Mostrado en sus espacios de vector:' ); 
for i:=1 to 5 do
  write (vector[i],' ');
readln;      
END.

