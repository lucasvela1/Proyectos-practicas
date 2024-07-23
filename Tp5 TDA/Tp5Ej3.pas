
Unit Ufecha;

interface 

type Tfecha = Record
       dia,mes,a:word;
       end;

procedure  Iiniciar( fecha:Tfecha; d,m,a:word);

procedure Iwrite (fecha:Tfecha);

procedure IimpFc(fecha:Tfecha);

implementation 

procedure Iiniciar (var fecha:Tfecha;d,m,a:word);
begin
 fecha.d:=d;
 fecha.m:=m;
 fecha.a:=a;
end;

procedure Iwrite (fecha: Tfecha);
begin
end;

procedure IimpFc (fecha: Tfecha);
begin
 if fecha.d<10 then
   if fecha.m<10 then
      write (0,fecha.d,'-',0,fecha.m)
   else 
      write (0,fecha.d ,'-', fecha.m)
 else
   if fecha.m<10 then
      write (fecha.d,'-',0,fecha.m)
   else 
      write (fecha.d,'-'fecha.m);          
end;


uses crt;

var i : byte;

end.
