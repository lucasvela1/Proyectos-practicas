{Utilizando sólo operaciones de pila realizar un algoritmo que:
• Invierta una pila
• Dada una pila y un valor llamado LÍMITE, devuelva otras dos pilas, en una de las
cuales se han introducido los valores menores que el LÍMITE, y en la otra los
valores mayores o iguales al LÍMITE. (La pila inicial debe desaparecer liberando
la memoria que ocupaba)
• Cambie todos los elementos de la Pila iguales a X por Y, sin modificar el resto de
la Pila.
Nota: analice para cada caso la conveniencia de una implementación estática y una
dinámica}


program Tp10Ej5;

uses UpilaIntPuntero;

var
pila1,pila2,pila:Tpila;
x,y,limite:Telemento;

procedure invertir (var pila:Tpila);
var
aux:Tpila;
e:Telemento;
begin
crear(aux);
while not vacia(pila) do
  begin
    sacar(pila,e);
    meter(aux,e);
  end;
 pila:=aux; 
end;

procedure crea2pilas(var pila,pila1,pila2:Tpila;limite:Telemento);
var
e:Telemento;
begin
crear(pila1);
crear(pila2);
while not vacia(pila) do
  begin
   sacar(pila,e);
   if e>limite then
     meter(pila1,e)
   else
     meter(pila2,e);  
  end;
end;

procedure intercambiar (var pila:Tpila;x,y:Telemento);
var
aux:Tpila;
e:Telemento;
begin
  while not vacia(pila) do
    begin
     sacar(pila,e);
     if (e=x) then
       e:=y;
     meter(aux,e);
    end;   
  while aux<>nil do
    begin
      sacar(aux,e);
      meter(pila,e);
    end;    
end;


BEGIN
invertir(pila);		
limite:=5;
crea2pilas(pila,pila1,pila2,limite);
x:=0;
y:=1;
intercambiar(pila,x,y);
END.

