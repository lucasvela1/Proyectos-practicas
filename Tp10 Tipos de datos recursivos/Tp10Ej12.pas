{12)Suponga tener armada una Cola dinámica, con datos de personas que están en un
banco. (Los datos son nro. de cliente y si es cliente preferencial o no). Le han pedido
que, a partir de cola anterior, genere una nueva donde las clientes preferenciales
pasen delante de la cola. (Siempre deberá tener en cuenta el orden en que cada tipo
de cliente llegó a la Cola).}


program Tp10Ej12;

uses crt,UcolaPunteroEj12;

var
colapri:Tcola;


procedure CargaColas (var colapri:Tcola);
var
i:integer;
aux:Telemento;
cola,colaaux:Tcola;
begin
crear(colapri);
crear(cola);
crear(colaaux);
for i:=1 to 20 do 
  begin
   aux.preferencial:=(i mod 2)=0;
   aux.nrocliente:=i;
   meter(cola,aux);   
  end;
 while not vacia(cola) do 
  begin
   sacar(cola,aux);
     if aux.preferencial then
      meter(colapri,aux)
     else
      meter(colaaux,aux);
  end;
 while not vacia(colaaux) do
   begin
      sacar(colaaux,aux);
      meter(colapri,aux);
   end;        
end;

procedure Recorre (colapri:Tcola);
var
e:Telemento;
begin
   while not vacia(colapri) do
     begin
      sacar(colapri,e);
      writeln('Cliente: ',e.nrocliente);
     end;
end;

BEGIN
CargaColas(colapri);	
Recorre(colapri);	
END.

