{Escribir la declaración de un registro que tenga una parte variante para cuatro figuras
geométricas: TRIÁNGULO, RECTÁNGULO, CUADRADO y CIRCULO. Para el TRIÁNGULO se debe almacenar el valor de los tres lados; para el RECTÁNGULO el de su base y su altura;
para el CUADRADO, el de su lado; y para el CIRCULO su radio.
Escribir un programa en Pascal que lea una letra T (TRIÁNGULO), R (RECTÁNGULO), C
(CUADRADO) y X (CIRCULO); y a continuación calcule el área

NOTAS
AREA DE TRIÁNGULO: [ p(p-a)(p-b)(p-c) ]1/2 p=(a+b+c)/2
AREA DE RECTÁNGULO : base x altura
AREA DE CUADRADO : lado2
AREA DE CIRCULO : π x radio2}


program tp3ej9;

uses crt;

const
pi = 3.14;

type
TRecFigura = record
  area: real;
  case eleccion: char of
     'T': (lados: array [1..3] of real);
     'R': (base, altura: real);
     'C': (lado:real);
     'X': (radio: real);
  end;   

var
figura:TRecFigura;
eleccion:char;

procedure CalculaArea (figura:TRecFigura);
var
p:real;
begin
with figura do
  begin
   case eleccion of
    'T':
      begin 
       writeln('Ingrese valor del lado 1');
       readln(lados[1]);
       writeln('Ingrese valor del lado 2');
       readln(lados[2]);
       writeln('Ingrese valor del lado 3');
       readln(lados[3]);
       p:=(lados[1]+lados[2]+lados[3])/2;
       area := sqrt(p * (p - lados[1]) * (p - lados[2]) * (p - lados[3]));
      end;
    'R':
      begin  
       writeln('Ingrese longitud de la base');
       readln(base);
       writeln('Ingrese longitud de la altura');
       readln(altura);
       area:=base*altura;
      end;
    'C':
      begin
       writeln('Ingrese longitud del lado');
       readln(lado);
       area:=lado*lado;
      end;
    'X':
      begin
        writeln ('Ingrese el radio');
        readln(radio);
        area:=pi*radio*radio;
      end;
   end;    
  end;              
 writeln('El area es:', figura.area:4:2); 
end;

BEGIN
eleccion:='a';
while ((figura.eleccion <>'T') and (figura.eleccion <>'R') and (figura.eleccion <>'C') and (figura.eleccion <>'X')) do
 begin
  clrscr;
  writeln ('Ingrese la figura: T (TRIANGULO), R (RECTANGULO), C (CUADRADO) y X (CIRCULO)');
  readln(figura.eleccion);
  figura.eleccion:= Upcase(figura.eleccion);  
 end;
 CalculaArea (figura);
END.

