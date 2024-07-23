{1.- Escriba un TDA que permita el uso de fracciones. La funcionalidad mínima que debe
aportar es:
- Iniciar: iniciar una fracción a partir de un numerador y un denominador entero.
- Sumar: retornar la suma de dos fracciones.
- Restar: retornar la resta de dos fracciones.
- Imprimir: visualiza en pantalla la fracción.
2- Modifique el ejercicio anterior para que no sea el TDA el encargado de imprimir, sino
que sea responsabilidad de quien lo utilice.}


unit Ufracciones;

interface

type
Tfraccion = record 
   num,den:integer;
   end;

procedure iniciar(var f:Tfraccion;numerador,denominador:integer);

function sumar(f1,f2:Tfraccion):Tfraccion;

function restar(f1,f2:Tfraccion):Tfraccion;

procedure imprimir(f:Tfraccion); //Para el ejercicio 2 se comenta esto

implementation

procedure simplificar (var f:Tfraccion);
var
dmc,temp,a,b:integer;
begin
a:= f.num;
b:= f.den;
while b<>0 do
  begin
    temp:=b;
    b:= a mod b;
    a:= temp;
  end;
  dmc:=a;
  f.num:= f.num div dmc;
  f.den:= f.den div dmc;
end;

procedure iniciar (var f:Tfraccion;numerador,denominador:integer);
begin
  f.num:=numerador;
  f.den:= denominador;
  if denominador = 0 then 
    writeln ('El denominador no puede ser cero')
  else 
    simplificar (f);  
end;

function sumar(f1,f2:Tfraccion):Tfraccion;	
begin
 sumar.num:= (f1.num*f2.den)+(f2.num*f1.den);
 sumar.den:= (f1.den*f2.den);
 simplificar (sumar);
end;

function restar (f1,f2:Tfraccion):Tfraccion;
begin
 restar.num:= (f1.num*f2.den)-(f2.num*f1.den);
 restar.den:= (f1.den*f2.den);
 simplificar(restar);
end;

procedure imprimir(f:Tfraccion);    //para el ejercicio 2 se comenta este procedimiento
begin 
 write(f.num,'/',f.den);
end;
	
END.

