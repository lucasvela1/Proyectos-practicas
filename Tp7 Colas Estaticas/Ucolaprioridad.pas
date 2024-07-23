{Un TDA para colas con prioridad usando colas}

unit Ucolaprioridad;



interface

uses Ucolaenteros;

const
N=100;

type
   
Tcolas = array [1..5] of Tcola;  

procedure initcolas(var cola:Tcolas);

procedure pushprio(var cola:Tcolas;elemento:Telemento);

function popprio(var cola:Tcolas):Telemento;



implementation

procedure initcolas(var cola:Tcolas);
var
i:integer;
begin
for i:=1 to 5 do
   init(cola[i]);
end;

procedure pushprio(var cola:Tcolas;elemento:Telemento);
begin
  case elemento of 
  1:  push(cola[1],elemento);
  2:  push(cola[2],elemento);
  3:  push(cola[3],elemento);
  4:  push(cola[4],elemento);
  5:  push(cola[5],elemento);
  end;
end;


function popprio(var cola:Tcolas):Telemento;
begin
  if estavacia(cola[1]) then 
   begin 
     if estavacia(cola[2]) then
       begin
        if estavacia(cola[3]) then
          begin
            if estavacia(cola[4]) then 
              popprio:=pop(cola[5])
            else 
              popprio:=pop(cola[4]);
          end    
        else 
          popprio:=pop(cola[3]);
       end   
     else 
         popprio:=pop(cola[2]);
   end      
  else
    popprio:=pop(cola[1]);   
end;
	
	
END.

