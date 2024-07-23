{Programa para probar los TDAs 3,4 y 5}


program Prueba345;

uses crt,Ufechayhora;


var
d,m,a:integer;
h,mi:byte;
completo:TfechayH;

BEGIN
writeln('Ingrese el dia');
readln(d);
writeln('Ingrese el mes (en numero)');
readln(m);
writeln('Ingrese el anio');	
readln(a);
writeln('Ingrese la hora');
readln(h);
writeln('Ingrese los minutos');
readln(mi);
clrscr;
iniciar (completo,d,m,a,h,mi);
write('Fecha corta sin hora: ');IwriteCsinH(completo); 
writeln;
write('Fecha corta con hora: '); IwriteCconH(completo);
writeln;
write('Fecha larga sin hora: '); IwriteLsinH(completo);
writeln;
write('Fecha larga con hora meridiana: '); IwriteLconH(completo);
writeln;
END.

