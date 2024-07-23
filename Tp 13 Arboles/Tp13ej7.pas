{7.- Escribir un procedimiento NO recursivo, ANTEPASADO, que imprima los antepasados
de un nodo dado cuyo campo INFO tenga el valor NUM. (NUM sólo se encuentra UNA vez
en el árbol). No imprimir NUM. RAÍZ no está vacío, y suponer
a) el nodo está;
b) el nodo puede no estar.
Use la siguiente cabecera de procedimiento: PROCEDURE ANTEPASADO ( RAÍZ : PTR ; NUM : INTEGER ) ;}


program Tp13Ej7;

uses crt,UpilaPuntero;

type
Telemento=integer;

var 
arbol:Tlista;
i:integer;

procedure iniciar (var arbol:Tlista);
begin
arbol:=nil;
end;

function crearNodo (elemento:Telemento):Tlista;
var
aux:Tlista;
begin 
  new (aux);
  aux^.info:=elemento;
  aux^.hi:=nil;
  aux^.hd:=nil;
  crearNodo:=aux;
end;

procedure agregarnodo (var arbol:Tlista; elemento:Telemento);
begin 
  if arbol=nil then 
     arbol:=crearNodo(elemento)
  else
    if arbol^.info<elemento then
       agregarnodo(arbol^.hd,elemento)
    else
       agregarnodo(arbol^.hi,elemento);      
end;

procedure antepasado (raiz:Tlista;num:integer);
var
pila:Tpila;
begin 
  init(pila);
  if raiz<>nil then
     begin
       while (raiz<>nil) and (raiz^.info<>num) do
        begin
          agregar(pila,raiz);
          if raiz^.info>=num then 
              raiz:=raiz^.hi
          else
              raiz:=raiz^.hd;    
        end;      
       if raiz=nil then
          writeln('No se encontro el numero')
       else
          while not estavacia(pila) do
            begin
              obtener(pila,raiz);
              writeln(raiz^.info);
            end;    
     end;
end;

BEGIN
iniciar (arbol);
for i:=1 to 10 do
  agregarnodo(arbol,i);
antepasado(arbol,5); //Devuelve 4-3-2-1
antepasado(arbol,11); //No deberia encontrarse
antepasado(arbol,4);
END.

