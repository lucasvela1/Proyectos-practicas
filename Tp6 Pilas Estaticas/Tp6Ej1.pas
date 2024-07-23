{Escriba un programa que lea una sucesión de números enteros, que finaliza con 0, y los
imprima en orden inverso.}


program tp6j1;

uses crt,Upilaenteros;

var 

miPila:Tpila;

procedure ingresa (var miPila:Tpila);
var
aux:integer;
begin
  iniciar(miPila);
  aux:=1;
  while aux<>0 do
     begin
       writeln ('Ingrese enteros, ingrese 0 para terminar');
       readln(aux);
       agregar(miPila,aux);
     end;  
end;

procedure muestra (var miPila:Tpila);
begin
  while not (estavacia(miPila)) do
    write(obtener(miPila),' ');
end;

BEGIN
ingresa(miPila);
clrscr;	
muestra(miPila);	
END.

