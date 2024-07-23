{Leer una cadena de caracteres y determinar si es un palíndrome (Frase que se lee igual de
izquierda a derecha que de derecha a izquierda , como por ejemplo : DABALE ARROZ A LA
ZORRA EL ABAD )}


program tp6ej3;

uses crt,Upilachar;

var
cadena:Tpilachar;
palabra:String;

procedure cargaPalabra(var cadena:Tpilachar; var palabra:String);
var
i:integer;
begin
  iniciar(cadena);
  writeln('Ingrese la palabra');
  readln(palabra);
  for i:=1 to length(palabra) do
      if palabra[i]<>' ' then
         agregar(cadena,palabra[i]);
end;

function palindrome (cadena:Tpilachar; palabra:String): boolean;
var
i:integer;
begin
palindrome:=true;
i:=1;
while (not estavacia(cadena)) and palindrome do
  begin
    if obtener(cadena)<>palabra[i] then
       palindrome:=false
    else 
       i:=i+1;     
  end;
end;

  
BEGIN
cargaPalabra(cadena,palabra);
if palindrome(cadena,palabra) then		
  writeln('Si')
else
  writeln('No');  
END.

