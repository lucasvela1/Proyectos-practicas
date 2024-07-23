{2)Realice un procedimiento ORDEN que reciba una LISTA y un parámetro ASCENDENTE que
vale verdadero si se quiere ordenar la lista ascendentemente y falso si se desea ordenar
descendentemente. Use una lista desordenada}


program Tp11ej2;

uses crt;

type
Telemento=integer;
Tlista=^Tnodo;
Tnodo= record
    info:Telemento;
    sig:Tlista;
    end;
    
    
var
l1:Tlista;
eleccion:boolean;


procedure cargar (var lista:Tlista);
var
aux:Tlista;
i:integer;
begin
  for i:=1 to 10 do
      begin
        new(aux);
        aux^.info:=i;
        aux^.sig:=nil;
        aux^.sig:=lista;
        lista:=aux;
      end;
end;

procedure insertarasc (var lista:Tlista; elemento:Telemento);
var
  aux, nuevo: Tlista;
begin
  new(nuevo);
  nuevo^.info := elemento;
  if (lista = nil) or (lista^.info > elemento) then
  begin
    nuevo^.sig := lista;
    lista := nuevo;
  end
  else
  begin
    aux := lista;
    while (aux^.sig <> nil) and (aux^.sig^.info < elemento) do
      aux := aux^.sig;
    nuevo^.sig := aux^.sig;
    aux^.sig := nuevo;
  end;
end;

procedure insertardes(var lista:Tlista;elemento:Telemento);
var
aux,nuevo:Tlista;
begin
new(nuevo);
nuevo^.info:=elemento;
if (lista=nil) or (lista^.info<elemento) then
  begin
    nuevo^.sig:=lista;
    lista:=nuevo;
  end
else
 begin
    aux := lista;
    while (aux^.sig <> nil) and (aux^.sig^.info > elemento) do
      aux := aux^.sig;
    nuevo^.sig := aux^.sig;
    aux^.sig := nuevo;
  end;
end;

procedure ordenar (var lista:Tlista; ascendencia:boolean);
var
aux,actual:Tlista;
begin
aux:=nil;
while lista<>nil do
    begin
      actual:=lista;
      lista:=lista^.sig;
      actual^.sig:=nil;
      if ascendencia then
        insertarasc(aux,actual^.info)
      else 
        insertardes(aux,actual^.info);
      dispose(actual);  
      end; 
lista:=aux;      
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

BEGIN
cargar(l1);
write('Lista original: ');
listar(l1);
eleccion:=true;
write('Lista ascendente: ');
ordenar(l1,eleccion);	
listar(l1);
eleccion:=false;
write('Lista descendente: ');
ordenar(l1,eleccion);
listar(l1);
END.

