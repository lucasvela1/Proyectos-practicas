{Realice un procedimiento iterativo y uno recursivo que devuelva el resultado de la suma
de una lista de enteros.}


program Tp9ej1;

uses crt;

type
Tpuntero = ^Tnodo;

 Tnodo = record
    info: integer;
    sig:Tpuntero;
    end;

var
lista:Tpuntero;
resultado: integer;

procedure CrearNodo (var aux:Tpuntero; elemento:integer);
begin
 new(aux);
 aux^.info:=elemento;
 aux^.sig:=nil;
end;

procedure CargarLista (var lista:Tpuntero);
var
i:integer;
aux:Tpuntero;
begin
 new(lista);
 lista^.info:=1;
  for i:=1 to 10 do
    begin
     CrearNodo(aux,i);
     aux^.sig:=lista;
     lista:=aux;
    end;   
end;


procedure SumaIterativa (lista:Tpuntero; var resultado:integer);
begin
resultado:=0;
while lista <> nil do 
  begin
    resultado:=resultado+lista^.info;
    lista:=lista^.sig;
  end;
end;

procedure SumaRecursiva (lista:Tpuntero; var resultado:integer);
begin
if lista^.sig=nil then
   resultado:=lista^.info
else
  begin
  SumaRecursiva(lista^.sig,resultado);
  resultado:=resultado+lista^.info;    
  end;
end;


BEGIN
clrscr;
CargarLista(lista);
SumaIterativa(lista,resultado);	
writeln('El resultado iterativo es: ',resultado);	
resultado:=0;
SumaRecursiva(lista,resultado);
writeln('El resultado recursivo es: ',resultado);
END.

