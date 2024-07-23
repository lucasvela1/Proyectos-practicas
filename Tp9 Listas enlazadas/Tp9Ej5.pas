{Dada una lista apuntada por LISTAEMP :
TYPE
CADENA = STRING [20] ;
PTR = ^ NODO ;
NODO = RECORD
NOMBRE : CADENA ;
NROEMP : INTEGER ;
CODIGODPTO : CHAR ;
HRSEMANA : INTEGER ;
SALARIO : REAL ;
SIG : PTR
END;
VAR
LISTAEMP : PTR ;
Escribir un procedimiento para suprimir de la lista a todos los empleados que trabajen
menos de 40 hs. por semana (HRSEMANA)}


program Tp9ej5;

uses crt;

type
cadena=string [20];
ptr=^nodo;
nodo=record
  nombre:cadena;
  nroemp:integer;
  codigodpto:char;
  hrsemana:integer;
  salario:real;
  sig:ptr;
  end;

var
listaemp:ptr;

procedure CrearNodo(var aux:ptr;i:byte);
begin
new(aux);
aux^.nombre:='asdwqe';
aux^.salario:=100000;
aux^.hrsemana:=i*10;
aux^.codigodpto:='A';
aux^.nroemp:=i;
end;

procedure cargarlista(var listaemp:ptr);
var
aux:ptr;
i:byte;
begin
for i:=1 to 10 do
  begin 
     crearnodo(aux,i);
     aux^.sig:=listaemp;
     listaemp:=aux;
  end;
end;


procedure suprimir(var listaemp: ptr);
var
    actual, anterior, siguiente: ptr;
begin
    actual := listaemp;
    anterior := nil;

    while actual <> nil do
    begin
        siguiente := actual^.sig; // Guardamos el siguiente nodo antes de eliminar actual

        if actual^.hrsemana < 40 then
        begin
            if anterior = nil then
            begin
                // Eliminamos el primer nodo
                listaemp := siguiente;   //Si estamos borrando el primer nodo, hacemos avanzar la lista original
                dispose(actual);
            end
            else
            begin
                // Eliminamos un nodo intermedio
                anterior^.sig := siguiente;
                dispose(actual);
            end;
        end
        else
            anterior := actual; // Avanzamos al siguiente nodo
        actual := siguiente; // Avanzamos al siguiente nodo
    end;
end;

procedure mostrarLista(listaemp:ptr);
begin
while listaemp<>nil do
 begin
  writeln('Empleado: ', listaemp^.nroemp,'  Horas semanales: ',listaemp^.hrsemana);
  listaemp:=listaemp^.sig;
 end; 
end;

BEGIN
cargarlista(listaemp);
suprimir(listaemp);		
mostrarLista(listaemp);
END.

