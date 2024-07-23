{6- Suponga tener en la memoria de su computadora una lista dinámica, simplemente
encadenada, que contiene los datos personales de los alumnos de un curso de programación y las notas correspondientes (valores enteros entre 0 y 100). La lista está
ordenada por DNI de los alumnos.
Realizar un procedimiento, que a partir de la lista anterior obtenga dos listados donde
figure:
NOTA CANTIDAD DE VECES QUE SE OBTIENE
Uno deberá estar ordenado por nota de menor a mayor, y el otro de mayor a menor. Su
procedimiento podrá usar solo estructuras dinámicas, y ser eficiente.}


program Tp11ej6;

uses crt;

type
  TAlumno = record
    DNI: Integer;
    Nota: Integer;
    Nombre: String[50]; // por ejemplo
  end;

  PAlumno = ^TNodeAlumno;
  TNodeAlumno = record
    Data: TAlumno;
    Next: PAlumno;
  end;
  
  
  type
  TNotaCount = record
    Nota: Integer;
    Cantidad: Integer;
  end;

  PNotaCount = ^TNodeNotaCount;
  TNodeNotaCount = record
    Data: TNotaCount;
    Next: PNotaCount;
  end;


var
  ListaAlumnos: PAlumno;
  
procedure ContarNotas(ListaAlumnos: PAlumno; var ListaNotas: PNotaCount);
var
  Current: PAlumno;
  CurrentNota, NewNota: PNotaCount;
begin
  ListaNotas := nil;
  Current := ListaAlumnos;
  while Current <> nil do
  begin
    // Buscar si la nota ya está en la lista de notas
    CurrentNota := ListaNotas;
    while (CurrentNota <> nil) and (CurrentNota^.Data.Nota <> Current^.Data.Nota) do
      CurrentNota := CurrentNota^.Next;

    if CurrentNota = nil then
    begin
      // Crear un nuevo nodo para la nueva nota
      New(NewNota);
      NewNota^.Data.Nota := Current^.Data.Nota;
      NewNota^.Data.Cantidad := 1;
      NewNota^.Next := ListaNotas;
      ListaNotas := NewNota;
    end
    else
    begin
      // Incrementar la cantidad para la nota existente
      CurrentNota^.Data.Cantidad := CurrentNota^.Data.Cantidad + 1;
    end;

    Current := Current^.Next;
  end;
end;

procedure OrdenarLista(var Lista: PNotaCount; Ascendente: Boolean);
var
  Sorted, Current, Next, Temp: PNotaCount;
begin
  Sorted := nil;
  while Lista <> nil do
  begin
    Current := Lista;
    Lista := Lista^.Next;
    if Sorted = nil then
    begin
      Current^.Next := nil;
      Sorted := Current;
    end
    else if (Ascendente and (Current^.Data.Nota < Sorted^.Data.Nota)) or 
            (not Ascendente and (Current^.Data.Nota > Sorted^.Data.Nota)) then
    begin
      Current^.Next := Sorted;
      Sorted := Current;
    end
    else
    begin
      Next := Sorted;
      while (Next^.Next <> nil) and 
            ((Ascendente and (Next^.Next^.Data.Nota < Current^.Data.Nota)) or 
            (not Ascendente and (Next^.Next^.Data.Nota > Current^.Data.Nota))) do
        Next := Next^.Next;
      Current^.Next := Next^.Next;
      Next^.Next := Current;
    end;
  end;
  Lista := Sorted;
end;


procedure ListarNotas(Lista: PNotaCount);
var
  Current: PNotaCount;
begin
  Current := Lista;
  while Current <> nil do
  begin
    WriteLn('Nota: ', Current^.Data.Nota, ' - Cantidad: ', Current^.Data.Cantidad);
    Current := Current^.Next;
  end;
end;


procedure GenerarListados(ListaAlumnos: PAlumno);
var
  ListaNotas, ListaAscendente, ListaDescendente: PNotaCount;
begin
  ContarNotas(ListaAlumnos, ListaNotas);

  // Clonar la lista de notas para ordenarlas de ambas formas
  ListaAscendente := ListaNotas;
  ListaDescendente := ListaNotas;

  OrdenarLista(ListaAscendente, True);
  OrdenarLista(ListaDescendente, False);

  // Listar las notas ordenadas de menor a mayor
  WriteLn('Notas ordenadas de menor a mayor:');
  ListarNotas(ListaAscendente);

  // Listar las notas ordenadas de mayor a menor
  WriteLn('Notas ordenadas de mayor a menor:');
  ListarNotas(ListaDescendente);
end;



begin
  GenerarListados(ListaAlumnos);
end.
