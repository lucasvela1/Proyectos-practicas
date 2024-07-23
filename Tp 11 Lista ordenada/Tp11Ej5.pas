{5- Suponiendo que las declaraciones para NODO del ejercicio "1" incluyen el campo ANT, de
tipo PTR y la lista es doblemente enlazada con un nodo cabecera y un nodo final, escribir
un procedimiento para insertar un nodo empleado en la lista, ordenada por nro. de
empleado.}


program Tp11ej5;

type
  TEmpleado = record
    nro: integer;  // Número de empleado
    nombre: string[50];  // Nombre del empleado (u otros datos)
  end;

  PNodo = ^Nodo;
  Nodo = record
    info: TEmpleado;
    sig: PNodo;
    ant: PNodo;
  end;

  TLista = record
    cabecera: PNodo;
    final: PNodo;
  end;

procedure inicializarLista(var lista: TLista);
begin
  new(lista.cabecera);
  new(lista.final);
  
  lista.cabecera^.sig := lista.final;
  lista.cabecera^.ant := nil;
  
  lista.final^.sig := nil;
  lista.final^.ant := lista.cabecera;
end;

procedure insertarEnOrden(var lista: TLista; empleado: TEmpleado);
var
  nuevo, actual: PNodo;
begin
  new(nuevo);
  nuevo^.info := empleado;
  
  actual := lista.cabecera^.sig;
  
  // Encontrar la posición correcta para insertar el nuevo nodo
  while (actual <> lista.final) and (actual^.info.nro < empleado.nro) do
    actual := actual^.sig;
  
  // Insertar el nuevo nodo en la lista
  nuevo^.sig := actual;
  nuevo^.ant := actual^.ant;
  
  actual^.ant^.sig := nuevo;
  actual^.ant := nuevo;
end;


procedure listarLista(lista: TLista);
var
  actual: PNodo;
begin
  actual := lista.cabecera^.sig;
  
  while actual <> lista.final do
  begin
    writeln('Nro de empleado: ', actual^.info.nro, ' - Nombre: ', actual^.info.nombre);
    actual := actual^.sig;
  end;
end;


var
  lista: TLista;
  empleado: TEmpleado;
begin
  inicializarLista(lista);

  // Ingresar empleados de prueba
  empleado.nro := 5;
  empleado.nombre := 'Juan Perez';
  insertarEnOrden(lista, empleado);

  empleado.nro := 3;
  empleado.nombre := 'Ana Lopez';
  insertarEnOrden(lista, empleado);

  empleado.nro := 8;
  empleado.nombre := 'Carlos Ramirez';
  insertarEnOrden(lista, empleado);

  // Listar empleados para verificar el orden
  listarLista(lista);
end.
