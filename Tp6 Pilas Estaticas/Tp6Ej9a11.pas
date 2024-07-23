{9.- Dado una expresión matemática en notación prefija, que finaliza con un punto (.), en la que
puede encontrarse números enteros positivos y operadores matemáticos realizar una función
que evalúe dicha expresión.

10.- Dado una expresión matemática en notación postfija, que finaliza con un punto (.), en la
que puede encontrarse números enteros positivos y operadores matemáticos realizar una
función que evalúe dicha expresión.

11.- Dado una expresión matemática en notación infija, realizar una función para convertirla
en notación postfija.}


program Tp6ej9a11;

uses crt,Upilaenteros,Upilachar;

var
eleccion:char;
expresion:String;
pila:Tpila;


function EvaluaPostfija(expresion:String;pila:Tpila):integer;
var
codigo,operando1,operando2,i:integer;
begin
i:=1;
while expresion[i]<>'.' do
  begin
    if expresion[i] in ['0'..'9'] then
     begin	
      Val(expresion[i],operando1,codigo);
      Upilaenteros.agregar(pila,operando1);
     end 
    else
      begin
        operando1:=Upilaenteros.obtener(pila);
        operando2:=Upilaenteros.obtener(pila);
        case expresion[i] of
        '+': operando1:=operando1+operando2;
        '-': operando1:=operando1-operando2;
        '/': operando1:=operando1 div operando2;
        '*': operando1:=operando1*operando2;
        end;
        Upilaenteros.agregar(pila,operando1);
      end;  
    i:=i+1;  
  end; 
EvaluaPostfija:=Upilaenteros.obtener(pila);  
end;

function EvaluaPrefija(expresion:String;pila:Tpila):integer;
var
codigo,operando1,operando2,i:integer; //Necesito la variable codigo para Val PREGUNTAR SI NECESARIA
begin
i:=length(expresion)-1;
while 1<=i do
  begin
    if expresion[i] in ['0'..'9'] then
      begin
       Val(expresion[i],operando1,codigo);
       Upilaenteros.agregar(pila,operando1);
      end 
    else  
     begin
      operando1:=Upilaenteros.obtener(pila);
      operando2:=Upilaenteros.obtener(pila); 
      case expresion[i] of
        '+': operando1:=operando1+operando2;
        '-': operando1:=operando1-operando2;
        '/': operando1:=operando1 div operando2;
        '*': operando1:=operando1*operando2;
        end;  
      Upilaenteros.agregar(pila,operando1);  
     end; 
    i:=i-1; 
  end;
EvaluaPrefija:=Upilaenteros.obtener(pila);  
end;

function precedencia (op:char):integer;
begin
  case op of
    '+', '-': precedencia := 1;
    '*', '/': precedencia := 2;
  else
    precedencia := 0;
  end;
end;

function InfijaAPostfija(var expresion:String):String;
var
i:integer;
expresion2:String;
pila2:Tpilachar;
begin 
Upilachar.iniciar(pila2);
expresion2:=''; //Inicia en vacio, da problemas para operar luego con la postfija conseguida
i:=1;
//De a+b a ab+
while (expresion[i]<>'.')and(i<=length(expresion))do
  begin
     if expresion[i] in ['+','/','-','*'] then
      begin
       while (not Upilachar.estavacia(pila2))and (precedencia(peek(pila2)) >= precedencia(expresion[i])) do
        expresion2:=expresion2+Upilachar.obtener(pila2);
        Upilachar.agregar(pila2,expresion[i]); 
      end 
     else
       expresion2:=expresion2+expresion[i];   
  i:=i+1;     
  end;
while (not Upilachar.estavacia(pila2)) do
  expresion2:=expresion2+Upilachar.obtener(pila2);
expresion2:=expresion2+'.';  
delete(expresion2,0,1);    
InfijaAPostfija:=expresion2; 
end;

procedure Carga (var eleccion:char);
begin
writeln('Que desea cargar? Infija a postfija(I)? Prefija (P)? Postfija (O)?');
readln(eleccion);
eleccion:=Upcase(eleccion);
writeln('Ingrese la expresion, termina en punto(.)');
readln(expresion);
end;

BEGIN
carga(eleccion);	
Upilaenteros.iniciar(pila);
clrscr;
case eleccion of
'I': writeln('La funcion en postfija es: ',InfijaAPostfija(expresion), ' y da de resultado: ',EvaluaPostfija(InfijaAPostfija(expresion),pila));
'P': writeln('La expresion da de resultado: ', EvaluaPrefija(expresion,pila));
'O': writeln('La expresion da de resultado: ', EvaluaPostfija(expresion,pila));
end;

END.

