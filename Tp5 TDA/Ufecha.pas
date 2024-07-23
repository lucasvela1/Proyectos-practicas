{Escriba un TDA para manipular fechas. Se debe poder iniciar una fecha pasando los
argumentos año, mes y día.
- Incorpore al TDA la posibilidad de retornar la fecha en distintos formatos (ej para
el 24 de marzo de 2020):
- Formato corto DD/MM = 24/03
- Formato largo DD/MM/AAAA = 24/03/2020}

Unit Ufecha;

interface 

//uses (si quiero usar otros TDA dentro de este lo declaro aqui

type Tfecha = Record
       d,m,a:integer;
       end;

procedure IiniciarF(var fecha:Tfecha; d,m,a:integer);

procedure IwriteFc (fecha:Tfecha);

procedure IimpFl(fecha:Tfecha);

implementation 

procedure IiniciarF (var fecha:Tfecha; d,m,a:integer);
begin
 fecha.d:=d;
 fecha.m:=m;
 fecha.a:=a;
end;

procedure IwriteFc (fecha: Tfecha);
begin
  write (fecha.d,'/',fecha.m);
end;

procedure IimpFl (fecha: Tfecha);
begin
 if fecha.d<10 then
   if fecha.m<10 then
      write (0,fecha.d,'/',0,fecha.m,'/',fecha.a)
   else 
      write (0,fecha.d ,'/', fecha.m,'/',fecha.a)
 else
   if fecha.m<10 then
      write (fecha.d,'/',0,fecha.m,'/',fecha.a)
   else 
      write (fecha.d,'/',fecha.m,'/',fecha.a);          
end;




end.
