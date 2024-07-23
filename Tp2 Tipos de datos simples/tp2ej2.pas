program tp2ej2  ;

uses crt;
var 
cadena1,cadena2 : String[16];
cadenacon: String[32];
i:integer;

BEGIN
writeln('ingrese la cadena 1');
readln(cadena1);
writeln('Ingrese la cadena 2');	
readln (cadena2);
cadenacon:=cadena1+cadena2;
writeln ('La cadena concatenada es: ',cadenacon);
for i:=length(cadenacon) downto 1 do
    if (cadenacon[i]=' ') then
      delete(cadenacon,i,1);
writeln('Sin blancos intermedios: ',cadenacon);
readln;     
END.

