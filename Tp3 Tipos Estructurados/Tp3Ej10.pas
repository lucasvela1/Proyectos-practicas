{Realizar un programa en Pascal, para resolver el siguiente problema:
El casino de la ciudad de Necochea decide llevar a cabo un estudio estadístico sobre
ingresos-egresos efectuados durante el receso de invierno a fin de tener una proyección
de lo que podrá ocurrir durante la temporada estival.
Durante las vacaciones de invierno el casino abre solamente 10 mesas de ruleta y tres
de punto y banca. el seguimiento se lleva a cabo durante tres fines de semana
consecutivos (se tiene en cuenta viernes, sábado y Domingo). De cada mesa se dispone
de la siguiente información:
nombre de los croupier (tres por mesa)
monto en pesos correspondiente a la cantidad de fichas que posee la mesa al:
1) abrir el casino
2) cerrar el casino
monto máximo pagado en una jugada en la mesa.
Se desea guardar toda la información en la memoria de una computadora con la
estructura más adecuada, obtener e imprimir:
a) El o los días en que el casino ganó más.
b) El o los días en que el casino perdió más.
c) El fin de semana en el que casino ganó más.
d) En promedio cuánto gana por día el casino y cuáles fueron los días en el que el casino
ganó menos que el promedio diario.
e) Dado un día que se ingresa por el teclado, imprimir el máximo ganado en una sola
jugada por los apostadores en las mesas de punto y banca y el nombre de los
croupier que estaban en la mesa.}


program tp3Ej10;

uses crt;

type
Tmesa = record 
  croupier: string;
  FichasF,FichasA,FichasC,Montomax: integer;
  end;
  
   
var
ruleta: array [1..10, 1..9] of Tmesa;
banca: array [1..3,1..9] of Tmesa;


procedure CargaDatos (var ruleta, banca:Tmesa);
var
i,j:byte;
begin
   for i:=1 to 10 do
      for j:=1 to 9 do
         begin 
           ruleta.croupier[i,j]='Ben';
           ruleta.FichasA[i,j]:= i;
           ruleta.FichasC[i,j]:= j;
           ruleta.Montomax[i,j]:= 200;
         end;
   for i:=1 to 3 do
     for j:=1 to 9 do
         begin 
           ruleta.croupier[i,j]='Ben';
           ruleta.FichasA[i,j]:= i;
           ruleta.FichasC[i,j]:= j;
           ruleta.Montomax[i,j]:= 200;
         end;   
end;

BEGIN
clrscr;
CargaDatos(ruleta,banca);	
END.

