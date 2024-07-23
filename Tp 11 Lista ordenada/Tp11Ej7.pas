{7-Escribir un procedimiento para insertar un Nodo y otro para poder borrar un Nodo dado,
en una lista doblemente enlazada ordenada por un campo Clave. Son datos la información
para el Nodo a agregar o borrar, y si debe empezar a recorrerse por la cabeza o por el fin
de la lista}


program Tp11ej7;

uses crt;

type
Telemento=integer;
TlistaDoble=^Tnodo;
Tnodo=record
    info:Telemento;
    clave:integer;
    sig,ant:TlistaDoble;
    end;


Tdoble=record
   cabeza, fin:Tlistadoble;
   end;


var
listadoble:Tdoble;


procedure insertar (var lista:Tdoble;elemento:Telemento; clave:integer; cabezal:boolean);
var
actual,aux,anterior:TlistaDoble;
begin
new(aux);
aux^.clave:=clave;
aux^.info:=elemento;
aux^.sig:=nil;
aux^.ant:=nil;
if (lista.cabeza=nil) then
  begin
   lista.cabeza:=aux;
   lista.fin:=aux;
  end
else  
 begin
 if cabezal then 
   actual:=lista.cabeza
 else
   actual:=lista.fin;

while (actual<>nil) and ((cabezal and (actual^.clave<clave)) or ((not cabezal) and  (actual^.clave>clave))) do
  begin
    if cabezal then 
       actual:=actual^.sig
    else 
       actual:=actual^.ant;   
  end; 

if actual=nil then  //llego al final.
   if cabezal then 
     begin
      aux^.ant:=lista.fin;
      lista.fin^.sig:=aux;
      lista.fin:=aux;
     end   
   else
     begin
       aux^.sig:=lista.cabeza;
       lista.cabeza^.ant:=aux;
       lista.cabeza:=aux;
     end
else
   begin
     anterior:=actual^.ant;
     aux^.sig:=actual;
     aux^.ant:=anterior;
     actual^.ant:=aux;
     if anterior<>nil then
       anterior^.sig:=aux
     else
       lista.cabeza:=aux;  
   end;   
 end;  
end;    
      
procedure eliminar (var lista:Tdoble; clave:integer; cabezal:boolean);
var
actual:TlistaDoble;
begin
  if lista.cabeza<>nil then
     begin
       if cabezal then
          actual:=lista.cabeza
       else
          actual:=lista.fin;
       while (actual<>nil) and (clave <>actual^.clave) do
         if cabezal then
            actual:=actual^.sig
         else
            actual:=actual^.ant;
       if actual<>nil then
          begin
             if actual^.ant<>nil then
                actual^.ant^.sig:=actual^.sig
             else
                lista.cabeza:=actual^.sig;
             if actual^.sig<>nil then
               actual^.sig^.ant:=actual^.ant
             else
               lista.fin:=actual^.ant;      
          end;              
       dispose(actual);   
     end;
end;

procedure listarLista(lista: Tdoble);
var
  actual: TlistaDoble;
begin
  actual := lista.cabeza;  
  while actual <> nil do
  begin
    writeln(actual^.info);
    actual := actual^.sig;
  end;
end;

BEGIN
listadoble.cabeza:=nil;
listadoble.fin:=nil;
insertar(listadoble,1,2, true);
insertar(listadoble,3,1, false);
listarLista(listadoble);
eliminar(listadoble,1,false);
listarLista(listadoble);		
END.

