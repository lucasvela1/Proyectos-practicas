{3- Escribir un procedimiento para suprimir un nodo de una lista doblemente enlazada, lineal,
cuyo apuntador apunta a cualquier nodo de la lista, no necesariamente a un extremo.}


program Tp11ej3;

uses crt;

type
Telemento=integer;
Tlista=^Tnodo;
Tnodo=record
    info:Telemento;
    sig,ant:Tlista;
    end;

var
l1:Tlista;

procedure insertarEnOrden (var lista:Tlista;elemento:Telemento);
var
actual,aux:Tlista;
begin
  new(aux);
  aux^.info := elemento;
  if (lista = nil) or (lista^.info > elemento) then
  begin
    aux^.sig := lista;
    if lista<>nil then
      lista^.ant:=aux;
    lista := aux;
  end
  else
  begin
     actual:=lista;
     while (actual^.sig<>nil) and (actual^.sig^.info<elemento) do 
        actual:=actual^.sig;
     aux^.sig:=actual^.sig;
     if actual^.sig<>nil then
        actual^.sig^.ant:=aux;   
     actual^.sig:=aux;
     aux^.ant:=actual;    
  end;   
end;  

procedure Cargar (var lista:Tlista);
var
i:integer;
begin
   for i:=1 to 10 do
     insertarEnOrden(lista,i);  
end;

procedure listar (lista:Tlista);
begin
while lista<>nil do
  begin
     write(lista^.info,' ');
     lista:=lista^.sig;
  end;
  writeln;
end;

procedure Eliminar (var lista:Tlista; elemento:Telemento);
var
aux:Tlista;
begin
aux:=lista;
if elemento<aux^.info then
   while (aux<>nil) and (elemento<aux^.info) do
     aux:=aux^.ant
else if elemento>aux^.info then
   while (aux<>nil) and (elemento>aux^.info) do
    aux:=aux^.sig;
if (aux<>nil) and (aux^.info=elemento) then
  begin
    if aux^.ant<>nil then 
       aux^.ant^.sig:=aux^.sig;
    if aux^.sig<>nil then
       aux^.sig^.ant:=aux^.ant;
    if lista=aux then
       if lista^.ant<>nil then
          lista:=lista^.ant
       else if lista^.sig<>nil then
          lista:=lista^.sig
         else lista:=nil;
    dispose(aux);                
  end
else writeln('Elemento no encontrado');     
end;

BEGIN
cargar(l1);	
listar(l1);
Eliminar(l1,1);
Eliminar(l1,3);
listar(l1);	
END.

