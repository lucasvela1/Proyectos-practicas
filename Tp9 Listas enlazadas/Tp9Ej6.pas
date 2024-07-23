{Dada una lista que contenga la siguiente información por nodo:
NOMBRE - EDAD - SEXO - SIG
Construir un procedimiento que cree dos listas, una por cada sexo.  
}


program Tp9ej6;

uses crt;

type
ptr=^nodo;
nodo=record
  nombre:string;
  edad:byte;
  sexo:char;
  sig:ptr;
  end;
  
var
lista,mujeres,varones:ptr;


procedure crearnodo(var aux:ptr; nombre:string;edad:byte);
begin
new(aux);
aux^.nombre:=nombre;
aux^.edad:=edad;
aux^.sig:=nil;
end;

procedure creaListas (var mujeres,varones:ptr; lista:ptr);
var
aux:ptr;
begin
  new(varones);
  new(mujeres);
  while lista<>nil do
    begin
      if lista^.sexo='M' then
         begin 
           crearnodo(aux,lista^.nombre,lista^.edad);
           aux^.sig:=varones;
           varones:=aux;
         end
      else if lista^.sexo='F' then
        begin
          crearnodo(aux,lista^.nombre,lista^.edad); 
          aux^.sig:=mujeres;
          mujeres:=aux;
        end;  
      lista:=lista^.sig;  
    end;
end;  


BEGIN	
creaListas(mujeres,varones,lista);	
END.

