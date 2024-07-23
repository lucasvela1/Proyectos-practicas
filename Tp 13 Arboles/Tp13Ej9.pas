{9.- Dado una lista de alumnos, simplemente encadenada, ordenada alfabéticamente; generar
una nueva ordenada por Nro. de documento. (Utilizar un árbol binario de búsqueda; si hay
duplicados, darlos de baja).}


program Tp13Ej9;

uses crt;

type
Telemento=record
   nombre:String;
   dni:longint;
   end;
   
Tlista=^Tnodolista;
Tnodolista=record
   info:Telemento;
   sig:Tlista;
   end;
Tarbol=^Tnodoarbol;
Tnodoarbol=record
   info:Telemento;
   hi,hd:Tarbol;
   end;



var 
arbol:Tarbol;
lista:Tlista;
elemento:Telemento;

procedure iniciar (var arbol:Tarbol; var lista:Tlista);
begin
 arbol:=nil;
 lista:=nil;
end;

procedure insertarDelante (var lista:Tlista; elemento:Telemento);
var
aux:Tlista;
begin
  new(aux);
  aux^.info.dni:=elemento.dni;
  aux^.info.nombre:=elemento.nombre;
  aux^.sig:=lista;
  lista:=aux;
end;

procedure insertarEnOrden (lista:Tlista;elemento:Telemento);
var
aux,actual:Tlista;
begin 
   new(aux);
   aux^.info.nombre:=elemento.nombre;
   aux^.info.dni:=elemento.dni;
       actual:=lista;
       while (actual^.info.nombre>elemento.nombre) and (actual^.sig<>nil) do
          actual:=actual^.sig;
       aux^.sig:=actual^.sig;
       actual^.sig:=aux;   
end;

procedure agregarLista (var lista:Tlista; elemento:Telemento);
begin
  if (lista=nil) or (lista^.info.nombre>elemento.nombre) then
     insertarDelante(lista,elemento)
  else
     insertarEnOrden(lista,elemento);   
end;


function crearNodo(elemento:Telemento):Tarbol;
var
aux:Tarbol;
begin
  new(aux);
  aux^.info.nombre:=elemento.nombre;
  aux^.info.dni:=elemento.dni;
  aux^.hd:=nil;
  aux^.hi:=nil;
  crearNodo:=aux;
end;

function existeEnArbol(arbol:Tarbol;elemento:Telemento):boolean;
begin
  existeEnArbol:=false;
  while (arbol<>nil) and (not existeEnArbol) do
     if arbol^.info.dni=elemento.dni then
        existeEnArbol:=true
     else
        if arbol^.info.dni>elemento.dni then 
          arbol:=arbol^.hi
        else
          arbol:=arbol^.hd;               
end;

procedure insertarEnArbol (var arbol:Tarbol;elemento:Telemento);
begin
  if arbol=nil then
     arbol:=crearNodo(elemento)  
  else if not existeEnArbol(arbol, elemento) then
   begin
    if arbol^.info.dni>elemento.dni then
       insertarEnArbol(arbol^.hi,elemento)
    else 
       insertarEnArbol (arbol^.hd, elemento);          
   end;    
end;

procedure insertarArbol(var arbol: Tarbol; lista: Tlista);
begin
  while lista <> nil do
  begin
    insertarEnArbol(arbol, lista^.info);
    lista := lista^.sig;
  end;
end;

procedure mostrarLista(lista:Tlista);
begin
  while lista<>nil do
    begin
      writeln ('Nombre: ',lista^.info.nombre, ' Dni: ',lista^.info.dni);
      lista:=lista^.sig;
    end;  
end;

procedure mostrarArbol(arbol:Tarbol);
begin
  if arbol<>nil then
   begin
    mostrarArbol(arbol^.hi);
    writeln('Nombre: ',arbol^.info.nombre,' Dni: ',arbol^.info.dni);
    mostrarArbol(arbol^.hd);
   end; 
end;


BEGIN		
iniciar(arbol,lista);
elemento.nombre:='Sandra';
elemento.dni:=4000140;
agregarLista(lista,elemento);
elemento.nombre:='Sandra';
elemento.dni:=4000140;
agregarLista(lista,elemento);
elemento.nombre:='Sandra';
elemento.dni:=4000140;
agregarLista(lista,elemento);
elemento.nombre:='Martha';
elemento.dni:=4000144;
agregarLista(lista,elemento);
elemento.nombre:='Carlos';
elemento.dni:=4001234;
agregarLista(lista,elemento);
elemento.nombre:='Ramiro';
elemento.dni:=4002143;
agregarLista(lista,elemento);
insertarArbol(arbol,lista);
writeln('Lista: ');
mostrarLista(lista);
writeln('Arbol: ');
mostrarArbol(arbol);
END.

