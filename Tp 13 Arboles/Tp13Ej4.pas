{Un árbol binario de búsqueda contiene información sobre una clase. Está ordenada por el
promedio (PROM) y se quiere imprimir una lista con los promedios desde el mayor al más
bajo, para mostrar la situación de la clase.
Escribir un procedimiento para imprimir el promedio y nombre del estudiante SIN
MODIFICAR EL ÁRBOL NI REORDENAR SUS DATOS.}


program Tp13Ej4;

uses crt;

type 

Telemento=real;

Tlista=^Tnodo;

Tnodo=record
   info:Telemento;
   hi,hd:Tlista;
   end;

var 
arbol:Tlista;

procedure iniciar (var arbol:Tlista);
begin
  arbol:=nil;
end;

function crearNodo (elemento:Telemento):Tlista;
var
nodo:Tlista;
begin
new(nodo);
nodo^.info:=elemento;
nodo^.hd:=nil;
nodo^.hi:=nil;
crearNodo:=nodo;
end;


//agregar de manera iterativa
{procedure agregar (var arbol:Tlista; elemento:Telemento);
var
aux,padre:Tlista;
begin
if arbol=nil then 
    arbol:=crearNodo(elemento)
else 
   begin
      aux:=arbol;
      padre:=nil;
      while aux<>nil do
      begin
         padre:=aux;
         if elemento<aux^.info then
           aux:=aux^.hi
         else  
          aux:=aux^.hd;
      end;
      if elemento<padre^.info then
        padre^.hi:=crearNodo(elemento)   
      else
        padre^.hd:=crearNodo(elemento);
   end;     
end;}

//Agregar de manera recursiva
procedure agregar (var arbol:Tlista; elemento:Telemento);
begin
  if arbol=nil then
     arbol:=crearNodo(elemento)
  else
     if elemento>=arbol^.info then
        agregar(arbol^.hd,elemento)
     else
        agregar(arbol^.hi,elemento);      
end;

procedure mostrarDescendente(arbol:Tlista);  //Derecha Nodo Izquierda
begin
   if arbol<>nil then
      begin
        mostrarDescendente(arbol^.hd);
        writeln(arbol^.info:4:2);
        mostrarDescendente(arbol^.hi);
      end;
end;


procedure mostrarAscendente (arbol:Tlista);
begin
  if arbol<>nil then
     begin
       mostrarAscendente(arbol^.hi);
       writeln(arbol^.info:4:2);
       mostrarDescendente(arbol^.hd);
     end;
end;

BEGIN
iniciar(arbol);	
agregar (arbol,9.5);
agregar (arbol, 8);
agregar (arbol,6);
agregar (arbol, 5.5);
agregar (arbol, 10);
writeln ('De manera descendente: ');	
mostrarDescendente(arbol);
writeln ('De manera ascendente: ');
mostrarAscendente(arbol);
END.

