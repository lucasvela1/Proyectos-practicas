{7- Desde el registro del automotor lo contratan para realizar mejoras al sistema que ya
poseen. El mismo cuenta con la información de sus patentes en un archivo, de las cuales se sabe la identificación (AA-000-AA ej.), fecha de alta, número de chasis, marca
de auto, modelo y año. El requerimiento que realizan es para mejorar las búsquedas por medio de la identificación de la patente.
Proponga una estructura y las operaciones que de soporte al requerimiento.
Implemente la carga de la estructura, la búsqueda de una patente y el detalle en caso
de encontrarla.}


program Tp12Ej7;

uses crt;

const
N=1000;

type
Telemento=record
  identificacion:String;
  fecha:integer;
  chasis:integer;
  marca:string;
  modelo:String;
  anio:integer;
  end;
  
Tlista=^Tnodo;
Tnodo= record
  info:Telemento;
  sig:Tlista;
  end;
Tvector=array[1..N]of Tlista;

var 
tabla:Tvector;


procedure iniciar (var tabla:Tvector);
var
i:integer;
begin
  for i:=1 to 1000 do 
    tabla[i]:=nil;
end;

function Hash(elemento:integer):integer;
begin 
    Hash:=(elemento mod N)+1;
end;

procedure insertar(var tabla:Tvector; elemento:Telemento);
var
actual,nuevo:Tlista;
indice:integer;
begin
  indice:=Hash(elemento.chasis);
  new(nuevo);
  nuevo^.info:=elemento;
  nuevo^.sig:=nil;
  if tabla[indice]=nil then
     tabla[indice]:=nuevo
  else
      begin
        actual:=tabla[indice];
        while (actual^.sig<>nil) and (actual^.sig^.info.chasis>elemento.chasis) do
          actual:=actual^.sig;
        nuevo^.sig:=actual^.sig;
        actual^.sig:=nuevo;  
      end;  
end;

procedure detalles (tabla:Tvector;chasis:integer); 
var
indice:integer;
aux:Tlista;
encontrado:boolean;
begin
   indice:=Hash(chasis);
   if tabla[indice]=nil then
      writeln('No se ha encontrado la patente')
   else
      begin
        encontrado:=false;
        aux:=tabla[indice];
        while (aux<>nil) and (not encontrado) do
           if aux^.info.chasis=chasis then 
             begin
               encontrado:=true;
               writeln('Numero de chasis: ',aux^.info.chasis);
             end
           else
             aux:=aux^.sig;  
      end;  
end;

BEGIN
iniciar(tabla);		
END.

