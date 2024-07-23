{Diseñe y codifique en Pascal un programa que dado un vector de N elementos imprima sus
elementos en orden inverso. No debe generarse otro vector.}


program tp3ej1;

uses crt;

Const 

N =10;

var 
vector : array [1..N] of integer;
i : byte;

BEGIN
for i:=1 to N do
 begin	
  vector[i] := i;
  write (vector[i],' ');
 end; 
writeln; 
for i:=N downto 1 do
 write (vector[i],' '); 	
END.

