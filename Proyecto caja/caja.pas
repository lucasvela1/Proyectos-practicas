program CajaNegra;
uses crt;

type 
Espejo = record
    Lado: char;
    Encontrado: boolean;
    end;
    
    Matriz = array [1..10, 1..10] of Espejo;


var
caja : Matriz;
tutorial:boolean;

procedure GeneraCaja (var caja:Matriz);
var
  i, j, espejos: integer;
begin
  Randomize;
  espejos := 0;

  // Inicializa la matriz con espacios en blanco
  for i := 1 to 10 do
    for j := 1 to 10 do
      caja[i,j].Lado:=' ';

  // Coloca 5 espejos en posiciones aleatorias
  while espejos < 5 do
  begin
    i:=Random(10) + 1;
    j:=Random(10) + 1;
   //Verifica que la casilla tenga un espacio vacío para no poner un espejo sobre otro
    begin
      if Random(2) = 0 then
        caja[i,j].Lado:='/'
      else
        caja[i,j].Lado:='\';
      espejos:=espejos+1;
      caja[i,j].Encontrado:=false;
    end;
  end;
end;

procedure MuestraCaja(caja:Matriz);
var
i,j:integer;
Begin
 write(' ');
 for i:=1 to 10 do
     write (' ',(9+i));
 writeln;
 for i:=10 downto 1 do
  begin
    write(i-1,'| ');
    for j:=1 to 10 do
      if (caja[i,j].Encontrado)and ((caja[i,j].Lado='/') or (caja[i,j].Lado='\'))then
       write (caja[i,j].Lado , '| ')
      else 
        if (caja[i,j].Lado='0') then
          write(caja[i,j].Lado,'| ')  //Esto es para mostrar un recorrido por si se necesita probar}
        else 
         write (' | '); 
    writeln (30-i);
  end;
  write(' ');
  for i:=1 to 10 do
   write (' ',(40-i));
  writeln; 
end;

procedure Disparo (var caja:Matriz; var tutorial:boolean);
var
terminado,izquierda,derecha,arriba,abajo:boolean;
numerodis,posx,posy,coorsale:integer;
begin
terminado:=false;
posx:=1;
posy:=1;
izquierda:=false;
derecha:=false;
arriba:=false;
abajo:=false;
writeln ('Ingrese numero del que disparar');
readln (numerodis);
while numerodis>39 do
 begin
   writeln ('El numero debe estar entre 0 y 39');
   readln (numerodis);
 end;
 if (numerodis >= 0) and (numerodis <=9) then 
  begin
   izquierda:=true; //El disparo sale de la izquierda
   posx:= 1;
   posy:=1+numerodis;
  end 
else
   if (numerodis >=10) and (numerodis <=19) then
      begin
       arriba:=true; //El disparo sale de arriba
       posy:=10;
       posx:=numerodis-9;
      end 
   else
       if (numerodis >=20) and (numerodis <=29) then
        begin
         derecha:=true;  //El disparo sale de la derecha
         posy:=30-numerodis;
         posx:=10;
        end
       else
        begin
         abajo:=true;  //El disparo sale de abajo
         posy:=1;
         posx:=40-numerodis;
        end; 
While not (terminado) do
 begin
    while (izquierda and ((caja[posy,posx].Lado =' ') or (caja[posy,posx].Lado ='0')) and (posx<=10)) do
       begin
        //writeln('[',posy,',',posx,']');
        if tutorial then
          caja[posy,posx].Lado :='0'; //Va marcando el recorrido
        posx:=posx+1;
       end;
    while (derecha and (caja[posy,posx].Lado =' ') and (posx>=1)) do
       begin
        //writeln('[',posy,',',posx,']');
        if tutorial then
          caja[posy,posx].Lado :='0'; //Va marcando el recorrido
        posx:=posx-1;
       end; 
    while (arriba and (caja[posy,posx].Lado =' ') and (posy>=0)) do
       begin
        //writeln('[',posy,',',posx,']');
        if tutorial then
          caja[posy,posx].Lado :='0'; //Va marcando el recorrido
        posy:=posy-1;
       end; 
    while (abajo and (caja[posy,posx].Lado =' ') and (posy<=10)) do
       begin
        //writeln('[',posy,',',posx,']'); 
        if tutorial then
          caja[posy,posx].Lado :='0'; //Va marcando el recorrido
        posy:=posy+1;
       end; 
   if ((caja[posy,posx].Lado ='/') or (caja[posy,posx].Lado ='\')) then
    if (caja[posy,posx].Lado ='/') then
      if izquierda then
        begin
          izquierda:=false;
          abajo:=true;
          posy:=posy+1;
        end
      else
          if derecha then
          begin
            derecha:=false;
            arriba:=true;
            posy:=posy-1;
           end
          else
           if abajo then
             begin 
              abajo:=false;
              izquierda:=true;
              posx:=posx+1;
             end
           else
            begin
             arriba:=false;
             derecha:=true;
             posx:=posx-1;
            end 
    else
         if izquierda then
        begin
          izquierda:=false;
          arriba:=true;
          posy:=posy-1;
        end
      else
          if derecha then
           begin
            derecha:=false;
            abajo:=true;
            posy:=posy+1;
           end
          else
           if abajo then
             begin 
              abajo:=false;
              derecha:=true;
              posx:=posx-1;
             end
           else
            begin
             arriba:=false;
             izquierda:=true;
             posx:=posx+1;
            end                    
   else
    begin
     terminado:=true;
     if posx>10 then
        coorsale:=30-posy 
     else
       if posx<1 then
        coorsale:=posy-1
       else
         if posy>10 then
           coorsale:=9+posx
         else
           coorsale:=40-posx;        
             
     writeln('El laser salio por el casillero: ',coorsale);
    end; 
 end;
end;

procedure menu (var caja:Matriz; var tutorial:boolean);
var
seleccion,posicion:char;
i,j,cantdisparos,posx,posy,estimaciones,encontrados,maxdisparos: integer;
begin
 seleccion:='a';
 while seleccion<>'S' do
  begin
    writeln ('Bienvenido al juego de la caja negra de Lucas Vela. Quiere (J)ugar, ver la (A)yuda o (S)alir?');
    readln (seleccion);
    seleccion:=UpCase(seleccion);
    if seleccion='A' then 
      begin  
       writeln('En el juego usted debe ingresar el numero de lado del que quiera que salga el disparo laser.'); 
       writeln('El laser recorrera de una pared hasta su contraria a menos que encuentre un espejo (/) o (\)');
       writeln('que modificara la trayectoria del laser dependiendo de como haya rebotado, ejemplo:');
       writeln('si venia de la izquierda y golpea un espejo / comenzara a subir hasta salir por la pared superior a');
       writeln('menos que golpe otro espejo, Usted conocera la pared por la que sale el laser, y con dicha informacion');
       writeln('debera adivinar donde hay espejos. Cada disparo e intento de adivinar cuesta puntos.');
       writeln('Cuando quiera advinar solo basta con poner "E" durante el juego y colocar luego');
       writeln('la pared "X", luego la pared "Y" por ultimo si el espejo estaba a la izquierda \ o derecha /');
       writeln;
      end 
    else
      if seleccion='J' then 
          begin 
           while (seleccion <>'T') and (seleccion <>'F') and (seleccion <>'D') do
            begin
              tutorial:=false;
           	  writeln ('Elegir nivel de dificultad: (T)utorial,(F)acil,(D)ificil.');
           	  writeln ( 'El tutorial muestra las posiciones de los espejos y el recorrido del laser.');
           	  writeln ('El tutorial solo es demostrativo, no se pueden estimar espejos, es para ver su funcionamiento.');
           	  writeln ('En facil y dificil lo que varia son la cantidad de disparos disponibles 20 y 10 respectivamente');
           	  readln (seleccion);
           	  clrscr;
           	  seleccion:=UpCase(seleccion);
           	  GeneraCaja(caja);
           	  if seleccion = 'T' then
           	   begin
           	    for i:=1 to 10 do
           	     for j:=1 to 10 do
           	      if (caja[i,j].Lado='/') or (caja[i,j].Lado='\') then
           	       begin
           	        caja[i,j].Encontrado:=true;
           	        cantdisparos:=9000;
           	        tutorial:=true;
           	        maxdisparos:=9000;
           	       end; 
           	   end   
           	  else
           	    if seleccion='F' then
           	      begin
           	       maxdisparos:=20;
           	       cantdisparos:=20;
           	      end 
           	    else
           	     if seleccion='D' then
           	      begin
           	       maxdisparos:=10;
           	       cantdisparos:=10;
           	      end;   
           	end;                 
           	  MuestraCaja(caja);
           	  estimaciones:=0;
           	  encontrados:=0;     
           	  while (seleccion <>'R') and (encontrados<>5) do
           	    begin 
           	      writeln ('Desea (D)isparar,(E)stimar pocision de espejo, (V)er pantalla, (P)untuacion o (R)endirte. Le quedan:',cantdisparos,' disparos.');
           	      writeln ('Espejos encontrados:',encontrados);
           	      readln(seleccion);
           	      seleccion:=UpCase(seleccion);
           	      if seleccion='D' then
           	        if cantdisparos=0 then
           	          writeln ('No le quedan más disparos, debe adivinar con lo que sabe la pocision de los espejos o rendirse')
           	        else 
           	          begin             	          
           	            Disparo(caja,tutorial); 
           	            cantdisparos:=cantdisparos-1;
           	            if tutorial then
           	              begin
           	                MuestraCaja(caja);
           	                for i:=1 to 10 do
           	                 for j:=1 to 10 do
           	                   if (caja[i,j].Lado = '0') then
           	                     caja[i,j].Lado:=' ';
           	              end;       
           	          end
           	      else
           	       if seleccion='E' then
           	        begin       	  
           	         writeln('Ingrese la posicion X (10-19 o 39-30)');
           	         readln (posx);
           	         writeln ('Ingrese la posicion Y (0-9 o 20-20)');
           	         readln (posy);
           	         posicion:='A';
           	         while ((posicion<>'D') and (posicion<>'I')) do
           	          begin
           	            writeln('Ingrese si esta a la (I)zquierda \ o (D)erecha /');
           	            readln (posicion); 
           	            posicion:=UpCase(posicion);
           	          end;  
           	         if posicion='D' then
           	          posicion:='/'
           	         else 
           	          posicion:='\';
           	         if posx>29 then
           	           posx:=40-posx
           	         else
           	           posx:=posx-9;
           	         if posy>9 then 
           	           posy:=30-posy
           	         else
           	           posy:=1+posy;        
           	         if caja[posy,posx].Lado=posicion then
           	          begin
           	           if caja[posy,posx].Encontrado then
           	             writeln ('Ya ha encontrado ese espejo')
           	           else
           	            begin  
           	              estimaciones:=estimaciones+1;
           	              writeln ('Ha encontrado un espejo!');
           	              caja[posy,posx].Encontrado:=true;
           	              encontrados:=encontrados+1;
           	              if encontrados=5 then
           	                writeln ('Ha encontrado todos los espejos!');
           	            end;  
           	          end
           	         else
           	          begin
           	            estimaciones:=estimaciones+1;           	          
           	            writeln ('No se ha encontrado ningun espejo, o esta al reves');     
           	          end;  
           	        end
           	       else              
           	        if seleccion='V' then
           	          MuestraCaja(caja)
           	        else 
           	          if seleccion='P' then
           	            writeln('Puntuacion total (menos mejor)=', (maxdisparos-cantdisparos)+estimaciones)    
           	    end;    
           	  writeln ('Ha encontrado ',encontrados,' espejos y su puntuacion fue de:',maxdisparos-cantdisparos+estimaciones);  
          
          end; 	    
  end;
end;

BEGIN
	clrscr;
	writeln;
	menu (caja,tutorial);
END.
