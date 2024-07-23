{En una biblioteca, los socios son almacenados usando como función de Hashing la que
devuelve las tres últimas cifras del nro. de documento y como estrategia para tratar las
colisiones direccionamiento cerrado. Asuma que la cantidad de socios no puede superar
los 1000.
a) Declare la estructura de datos que permitirá realizar el armado y posterior
utilización.
b) Genere una función para almacenar un nuevo socio.
c) Genere un subprograma que permita imprimir la cantidad de sinónimos que tiene
un determinado socio.
d) Genere un subprograma que permita imprimir por orden alfabético esos sinónimos.}


program Tp12ej3;

uses crt;

const
Max=1000;

type

Telemento=record
   dni:longint;
   nombre:String;
   end;
Tlista=^Tnodo;
Tnodo=record
   info:Telemento;
   sig:Tlista;
   end;
      
vector= array [1..Max] of Tlista;

var
tabla:vector;
socio:Telemento;

procedure iniciar(var tabla:vector);
var
i:integer;
begin
  for i:=1 to Max do
    tabla[i]:=nil;
end;

function Hash (dni:longint):integer;
begin
  Hash:=(dni mod Max)+1;
end;

procedure agregar(var tabla:vector; socio:Telemento);
var
i:integer;
actual,nuevo:Tlista;
begin
  i:=Hash(socio.dni);
  new(nuevo);
  nuevo^.info:=socio;
  nuevo^.sig:=nil;
  if (tabla[i]=nil)or(tabla[i]^.info.nombre>socio.nombre) then
    begin
     nuevo^.sig:=tabla[i];
     tabla[i]:=nuevo;
    end 
  else    
    begin
      actual:=tabla[i];
      while (actual^.sig<>nil) and (actual^.sig^.info.nombre<socio.nombre) do
        actual:=actual^.sig;
      nuevo^.sig:=actual^.sig;
      actual^.sig:=nuevo;
    end;
end;

function buscar (tabla:vector; socio:Telemento):boolean;
var
i:integer;
actual:Tlista;
begin
  i:=Hash(socio.dni);
  buscar:=false;
  if tabla[i]<>nil then
   begin
     actual:=tabla[i];
     while (actual<>nil) and (not buscar) do 
       if actual^.info.dni=socio.dni then
          buscar:=true
       else
          actual:=actual^.sig;   
   end;  
end;

procedure listarSinonimos (tabla:vector; socio:Telemento);
var
i:integer;
actual:Tlista;
begin
  if (not buscar(tabla,socio)) then 
     writeln('El socio no existe')
  else
    begin   
       i:=Hash(socio.dni);
       actual:=tabla[i];
       while actual<>nil do
         begin
            if actual^.info.dni<>socio.dni then
               writeln('Socio: ',actual^.info.nombre,'  Dni: ',actual^.info.dni);
            actual:=actual^.sig;   
         end;
    end;    
end;


BEGIN
iniciar(tabla);
socio.dni:= 40012313;
socio.nombre:='Carlos';	
agregar(tabla,socio);	
socio.dni:=43245313;
socio.nombre:='Sancho';
agregar(tabla,socio);
socio.dni:=44412313;
socio.nombre:='Maria';
agregar(tabla,socio);
socio.dni:=43212313;
socio.nombre:='Pedro';
agregar(tabla,socio);
socio.dni:= 400112313;
socio.nombre:='Zapata';	
agregar(tabla,socio);
socio.dni:= 40012313;
socio.nombre:='Carlos';
listarSinonimos(tabla,socio);
END.

