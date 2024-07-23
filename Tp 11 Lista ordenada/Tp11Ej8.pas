{8- Suponga tener un archivo, con los datos de los empleados de una empresa. Entren los que
se destacan:
DNI - Apellido y Nombre – Tipo de profesión
Se desea generar una estructura Dinámica, que permita ser recorrida o buscar
información por distintos atributos (en este caso cualquiera de los tres anteriores).
Grafique y defina las estructuras de datos que considere más convenientes. Justifique.}


program Tp11ej8;

uses crt;

type
Telemento=record
    Dni:longint;
    Emp,prof:String;
    end;
    
Tlista=^Tnodo;
Tnodo=record
   info:Telemento;
   sig,listaDni,listaEmp,listaProf:Tlista;
   end;


var
lista:Tlista;
registro:Telemento;

procedure ordenaProfesion (var lista,nuevo:Tlista);
var
  actual, anterior: Tlista;
begin
  actual := lista;
  anterior := nil;

  while (actual <> nil) and (actual^.info.Prof < nuevo^.info.Prof) do
  begin
    anterior := actual;
    actual := actual^.listaProf;
  end;

  if anterior = nil then
  begin
    nuevo^.listaProf := lista;
    lista := nuevo;
  end
  else
  begin
    nuevo^.listaProf := actual;
    anterior^.listaProf := nuevo;
  end;
end;

procedure ordenaDni (var lista,nuevo:Tlista);
var
  actual, anterior: Tlista;
begin
  actual := lista;
  anterior := nil;

  while (actual <> nil) and (actual^.info.Dni < nuevo^.info.Dni) do
  begin
    anterior := actual;
    actual := actual^.listaDni;
  end;

  if anterior = nil then
  begin
    nuevo^.listaDni := lista;
    lista := nuevo;
  end
  else
  begin
    nuevo^.listaDni := actual;
    anterior^.listaDni := nuevo;
  end;
end;

procedure ordenaEmpleado (var lista,nuevo:Tlista);
var
  actual, anterior: Tlista;
begin
  actual := lista;
  anterior := nil;

  while (actual <> nil) and (actual^.info.Emp < nuevo^.info.Emp) do
  begin
    anterior := actual;
    actual := actual^.listaEmp;
  end;

  if anterior = nil then
  begin
    nuevo^.listaEmp := lista;
    lista := nuevo;
  end
  else
  begin
    nuevo^.listaEmp := actual;
    anterior^.listaEmp := nuevo;
  end;
end;

procedure InsertarNodo (var lista:Tlista;elemento:Telemento);
var
nuevo:Tlista;
begin
   new(nuevo);
   nuevo^.info:=elemento;
   nuevo^.sig:=nil;
   nuevo^.listaDni:=nil;
   nuevo^.listaProf:=nil;
   nuevo^.listaEmp:=nil;
  
   if lista=nil then 
        begin 
           lista:=nuevo;
        end          
   else
      begin
         ordenaProfesion(lista,nuevo);
         ordenaEmpleado(lista,nuevo);
         ordenaDni(lista,nuevo);
      end;     
end;                                                                                                                                              

procedure listar (lista:Tlista);
begin
while lista<>nil do
  begin
     write(lista^.info.dni,' ',lista^.info.prof,' ',lista^.info.emp);
     lista:=lista^.sig;
  end;
  writeln;
end;

BEGIN
new(lista);
lista^.sig:=nil;
with registro do
  begin
  dni:=4001124;
  emp:='sofia';
  prof:='Maestro';
  end;
insertarNodo(lista,registro);	
listar(lista);
END.

