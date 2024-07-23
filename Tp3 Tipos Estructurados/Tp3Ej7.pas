{Escribir un programa en Pascal que lea una matriz cuadrada de enteros y la descomponga
en dos matrices, una simétrica B y otra antisimétrica C tales que:
B[I,J] = ( A[I,J] + A[J,I]) / 2 = B[J,I] 
C[I,J] = (A[I,J] - A[J,I]) / 2 = -C[J,I]
Imprimir las tres matrices}


program tp3Ej7;

uses crt;

const
N = 4;

type
Tmatriz = array [1..N,1..N] of integer;

var 
i,j : byte;
matriz,a,b,c:Tmatriz;

procedure CargaMatriz (var a:Tmatriz);
begin
 for i:=1 to N do
  for j:=1 to N do
    begin
     clrscr;
     writeln('Ingrese elemento en la posicion:',i,',',j);
     readln(a[i,j]);
    end;
 clrscr;    
end;    

procedure Descomposicion (var b,c:Tmatriz; a:Tmatriz);
begin
 for i:=1 to N do
   for j:=1 to N do
     b[i,j]:=((a[i,j]+a[j,i])div 2);
 for i:=1 to N do
   for j:=1 to N do
     c[i,j]:=((a[i,j]-a[j,i])div 2);    
end;

procedure MuestraMatriz (matriz:Tmatriz);
begin
for i:=1 to N do
 begin
  writeln;
  for j:=1 to N do
    write (matriz[i,j],' |');
 end;   
writeln; 
end;    

procedure MuestraAlReves (matriz:Tmatriz);
begin
 for i:=1 to N do
  begin
    writeln;
    for j:=1 to N do
      write (matriz[j,i],' |');
  end;
writeln;
end;
      

procedure MuestraAlRevesNegada (matriz:Tmatriz);
begin
 for i:=1 to N do
  begin
    writeln;
    for j:=1 to N do
      write (-(matriz[j,i]),' |');
  end;
writeln;
end;

BEGIN
CargaMatriz(a);	
Descomposicion(b,c,a);
writeln('La matriz A es:');
MuestraMatriz(a);
readln;
writeln('La matriz B es:');
MuestraMatriz(b);
readln;
writeln('La matriz B invertida es:');
MuestraAlReves(b);
readln;
writeln('La matriz C es:');
MuestraMatriz(c);
writeln;
readln;
writeln('La matriz C invertida y negada es:');
MuestraAlRevesNegada (c);
readln;
END.

