{Dadas dos pilas de enteros llamadas Operando1 y Operando2 y una pila de caracteres que
contiene solo '*', '+', '-', '/', recorrer las pilas de números sacando un número por vez de cada
una y un operador de la pila de caracteres e imprimir el resultado de la operación.}


program tp6ej2;

uses crt,Upilachar,Upilaenteros;

var 
op1,op2 : Tpila;
ope:Tpilachar;

procedure carga (var op1,op2:Tpila;Var ope:Tpilachar);
var
auxoperadores:integer;
auxchar:char;
begin
  iniciar(op1);
  iniciar(op2);
  Upilachar.iniciar(ope);
  auxoperadores:=1;
  auxchar:=',';
  while auxoperadores<>0 do
     begin  
       writeln('Ingrese los primeros operadores, sale con 0');
       readln(auxoperadores);
       agregar(op1,auxoperadores);
     end;
  auxoperadores:=1;   
  while auxoperadores<>0 do
     begin     
       writeln('Ingrese los segundos operadores, sale con 0');
       readln(auxoperadores);
       agregar(op2,auxoperadores);
     end;
  while auxchar<>'#' do 
     begin     
       writeln('Ingrese la operacion *,+,-,/, sale con #');
       readln(auxchar);
       Upilachar.agregar(ope,auxchar);
     end; 
end;


procedure muestra (op1,op2:Tpila;ope:Tpilachar);
var
aux1,aux2:integer;
begin
  while (not estavacia(op1)) and (not Upilachar.estavacia(ope)) and (not estavacia(op2))do
     begin
        aux1:=obtener(op1);
        aux2:=obtener(op2);
        case Upilachar.obtener(ope) of
           '+': writeln (aux1,'+',aux2,'=',aux1+aux2);
           '-': writeln (aux1,'-',aux2,'=',aux1-aux2);
           '/': writeln (aux1,'/',aux2,'=',aux1 div aux2);
           '*': writeln (aux1,'*',aux2,'=',aux1*aux2);
           end;
     end;
end;

BEGIN
carga(op1,op2,ope);	
muestra(op1,op2,ope);	
END.

