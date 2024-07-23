{ Escriba un TDA para manipular el tiempo. Se debe poder iniciar una hora pasando los
argumentos hora, minutos y segundos.
- Incorpore al TDA la posibilidad de retornar la hora en distintos formatos (ej para
las 15:30hs):
- Formato corto HH:mm = 15:30
- Formato meridiano hh:mm aa = 3:00 PM}


unit Uhora;

interface

type 
Thora = record
   hora,minutos:byte;
   meridiano:String [2];
   end;
 
procedure iniciarH (var hora:Thora;h,m:byte);

procedure IwriteHc (hora:Thora);

procedure IwriteHm (hora:Thora);

implementation 

procedure iniciarH (var hora:Thora;h,m:byte);
begin
hora.hora:=h;
hora.minutos:=m;
if ((hora.hora>=12)and(hora.hora <= 23)) then 
  hora.meridiano:='PM'
else 
  hora.meridiano:='AM';    
end;

procedure IwriteHc(hora:Thora);
begin
 if hora.hora=24 then
   hora.hora:=0;
  write (hora.hora,':',hora.minutos);
end;

procedure IwriteHm(hora:Thora);
begin
if (hora.meridiano='PM') and (not(hora.hora=12)) then
  hora.hora:=hora.hora-12
  else if hora.hora=24 then
      begin
        hora.hora:=12;
        hora.meridiano:='AM';
      end;  
write (hora.hora,':',hora.minutos,' ',hora.meridiano);  
end; 
   
END.

