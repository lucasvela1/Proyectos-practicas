{Escribir un programa en Pascal que:
a) Lea por fila los elementos reales de una matriz de N x M, que se sabe que es rala, y
que al menos la mitad de sus elementos son nulos, y
b) Efectúe la transformación para almacenarla en una matriz de 3 columnas
c) Imprima la matriz original a partir de la compactada.}


program tp3ej8;

uses crt;


const

N=4;
M=5;

type
Tmatriz =array [1..N,1..M] of real;

var 
j,i : byte;
matriz,matrizrala,a:Tmatriz;
nonulos:integer;

procedure CargaMatriz(var matrizrala:Tmatriz);
begin
for i:=1 to N do
 for j:=1 to M do
   readln(matrizrala[i,j]);
end;

procedure Conversion (Var matriz,matrizrala:Tmatriz; nonulos:integer);
var
contador:integer;
begin
nonulos:=0;
for i:=1 to N do
  for j:=1 to M do
    if matrizrala[i,j]<>0 then
      nonulos:=nonulos+1;
SetLength(matriz,nonulos+1,3);
matriz[1,1]:=N;
matriz[1,2]:=M;
matriz[1,3]:=nonulos;     
contador:=2;
for i:=1 to N do
  for j:=1 to M do
   if matrizrala[i,j]<>0 then
    begin
      matriz[contador,1]:=i;
      matriz[contador,2]:=j;
      matriz[contador,3]:=matriz[i,j];
      contador:=contador+1;
    end;  
end;

procedure MuestraMatriz (a:Tmatriz;nonulos:integer);
begin
for i:=1 to (nonulos+2) do
 begin
  writeln;
  for j:=1 to 3 do
    write (a[i,j],' |');
 end;   
writeln; 
end;

BEGIN
CargaMatriz (matrizrala);
Conversion (matriz,matrizrala,nonulos);		
MuestraMatriz(matriz,nonulos);
END.

