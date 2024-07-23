{5- Escribir un TDA para manipular fecha y hora. Utilice las unidades que ya tiene para generar
esta nueva.
- Incorpore al TDA la posibilidad de retornar la fecha y la hora en distintos formatos (ej
para las 24/03/2020 15:30hs):
- corto sin hora DD/MM = 24/03
- largo sin hora DD/MM/AAAA = 24/03/2020
- corto con hora DD/MM – HH:mm = 24/03 - 15:30
- largo con hora meridiana DD/MM/AAAA – HH:mm:aa = 24/03/2020 - 3:30 PM}


unit UfechaYhora;

interface

uses Ufecha,Uhora;

type TfechayH = record
     fecha:Tfecha;
     hora:Thora;
     end;

procedure iniciar (var fechahora:TfechayH; d,m,a:integer; h,mi:byte);     

procedure IwriteCsinH (fechahora:TfechayH);

procedure IwriteCconH (fechahora:TfechayH);

procedure IwriteLsinH (fechahora:TfechayH);

procedure IwriteLconH (fechahora:TfechayH);


implementation


procedure iniciar (var fechahora:TfechayH; d,m,a:integer; h,mi:byte);     
var
Fecha: Tfecha;
Hora:Thora;
begin
IiniciarF (Fecha,d,m,a);
iniciarH (Hora,h,mi);
fechahora.fecha:=Fecha;
fechahora.hora:=Hora;
end;


procedure IwriteCsinH (fechahora:TfechayH);
begin
IwriteFc(fechahora.fecha);
end;


procedure IwriteCconH (fechahora:TfechayH);
begin
 IwriteFc(fechahora.fecha); write('-');IwriteHc(fechahora.hora);
end;


procedure IwriteLsinH (fechahora:TfechayH);
begin
 IimpFl(fechahora.fecha);
end;


procedure IwriteLconH (fechahora:TfechayH);	
begin
 IimpFl(fechahora.fecha); write('-');IwriteHm(fechahora.hora);
end;

END.

