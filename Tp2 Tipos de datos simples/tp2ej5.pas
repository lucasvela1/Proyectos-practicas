program Tp2Ej5;

{5 - Escribir un esquema y programa que inicialice con valores enteros a cuatro conjuntos : C1,
C2 , C3 , C4 y calcule
C1 union C2 -- C1 - C2 -- C3 union C2 union C1
C2 interseccion C1 -- C1 union C2 interseccion C3}

uses crt;

type
Tenteros = set of byte;

var 
i : byte;
c1,c2,c3,c4,d1,d2,d3,d4,d5: Tenteros;

BEGIN
clrscr;	
c1:=[1,2,3,4,5,8,40];
c2:=[1..10];
c3:=[9,12,14,15];
c4:=[4..19];
d1:= c1+c2;
d2:=c1-c2;
d3:=c3+c2+c1;
d4:=c2*c1;
d5:=c1+c2*c3;

write('C1: ');
for i in c1 do write (i, '; ');
writeln;
write('C2: ');
for i in c2 do write (i, '; ');
writeln;
write('C3: ');
for i in c3 do write (i, '; ');
writeln;
write('C4: ');
for i in c4 do write (i, '; ');
writeln;


write('C1 union C2: ');
for i in d1 do write (i, '; ');
writeln;
write('C1 - C2: ');
for i in d2 do write (i, '; ');
writeln;
write('C3 union C2 union C1:');
for i in d3 do write (i, '; ');
writeln;
write('C2 interseccion C1:');
for i in d4 do write (i, '; ');
writeln;
write('C1 union C2 interseccion C3:');
for i in d5 do write (i, '; ');
writeln;

readln;	
END.

