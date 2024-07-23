{La MODA de un arreglo es el elemento que aparece más veces en el arreglo. Si distintos
elementos son repetidos con la misma frecuencia máxima, no hay moda. Escribir un
programa en Pascal que acepte un arreglo e imprima su MODA o un mensaje si no la hay.}


program tp3ej4;

uses crt;

const
N = 10;

Type
Tvector = array [1..N] of byte;
Tenteros = set of byte;

var 
vector: Tvector;


procedure CargaVector(var vector: Tvector);
var
i:byte;
begin
for i:=1 to N do
  vector[i]:=i;
end;


function Moda (vector:Tvector):byte;
var
j,i,max,analizando,modaactual,aux:byte;
repetidos: Tenteros;
begin
max:=0;
repetidos:=[];
modaactual:=0;
for j:=1 to N do 
 begin
  aux:=0; 
  if not(vector[j] in repetidos) then
   begin
    analizando:=vector[j];   
   for i:=1 to N do
      if (vector[i] = analizando) then
        aux:=aux+1;       
   end;     
  if aux>max then     
   begin
    max:=aux;
    modaactual:=vector[j];
   end 
  else
   if aux=max then
    modaactual:=0;  
  repetidos:=repetidos+[vector[j]];  
 end;  
Moda:=modaactual; 
end;


BEGIN
CargaVector(vector);	
if (Moda(vector) = 0) then
  writeln('No hay moda')
else
  writeln ('La moda es el elemento:', Moda(vector));
readln;    
END.

