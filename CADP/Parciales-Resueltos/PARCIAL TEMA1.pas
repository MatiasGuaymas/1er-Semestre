{La cátedra de CADP necesita un programa para generar el listado de alumnos ingresantes que
rendirán el parcial. Para ello, la cátedra DISPONE de un listado con todos alumnos que ingresaron
este año a la facultad. De cada alumno se conoce su DNI, nombre y apellido, nota obtenida en
curso de ingreso (entre 4 y 10), turno (entre 1 y 4) y si estuvo presente o ausente en cada una de
las 12 clases de práctica.

a) Realizar un módulo que reciba la información de los alumnos y retorne una nueva estructura de
datos que contenga sólo aquellos alumnos que podrán rendir el parcial. Para poder rendir el
parcial, los alumnos deben contar con al menos 8 asistencias en las 12 clases de práctica.

b) Realizar un módulo que reciba la estructura de datos generada en el inciso anterior, e
IMPRIMA en pantalla:

1) Apellido y nombre y el DNI de los alumnos que hayan obtenido nota 8 o superior en el
ingreso
2) Turno con mayor cantidad de alumnos en condiciones de rendir el examen.
3) Cantidad de alumnos que no posean ningún dígito cero en su DNI.
NOTA: Implementar el programa principal.}

program ejercicio1;
const
    cant_clases = 12;
    cant_turnos = 4;
type
    rango_notas = 4..10;
    rango_turnos = 1..cant_turnos;
    rango_clases = 1..cant_clases;
    vector_clases = array[rango_clases] of boolean;
    alumno = record
        dni: integer;
        nombre_apellido: string;
        nota: rango_notas;
        turno: rango_turnos;
        asistencias: vector_clases;
    end;
    lista = ^nodo;
    nodo = record
        dato: alumno;
        sig: lista;
    end;
    vector_turnos = array[rango_turnos] of integer;

procedure agregarAdelante(var L: lista, a: alumno);
var
    aux: lista;
begin
    new(aux); 
    aux^.dato= a; 
    aux^.sig := L;
    L:= aux;
end;
function cumple_condicion(asistencias: vector_clases);
var
    i, cant: integer;
begin
    cant := 0;
    for i:= 1 to cant_clases do
        if(asistencias[i]) then
            cant := cant + 1;
    cumple_condicion:= (cant >= 8);
end;
procedure procesarAlumnos(lista_alumnos: lista, var lista_rinden: lista);
var
    aux: alumno;
begin
    lista_rinden := nil;
    while(lista_alumnos <> nil) dato
    begin
        aux:= lista_alumnos^.dato;
        if(cumple_condicion(aux.asistencias)) then
            agregarAdelante(lista_rinden; aux);
        lista_alumnos: lista_alumnos^.sig;
    end;
end;
procedure inicializarVector(var v: vector_turnos);
var
    i: rango_turnos;
begin
    for i:= 1 to cant_turnos do
        v[i] := 0;
end;
function maximo(v: vector_turnos) : rango_turnos;
var
    i, max_turno: rango_turnos;
    maxAlumnos : integer;
begin
    maxAlumnos := -1;
    for i := 1 to cant_turnos do 
        if(v[i] > maxAlumnos) then
        begin
            maxAlumnos := v[i];
            max_turno := i;
        end;
    maximo := max_turno;
end;
function tiene_ceros(num : integer): boolean;
var 
    encontreCero : boolean;
    dig: integer;
begin   
    encontreCero := false;
    while(num <> 0) and (not encontreCero) do
    begin
        dig:= num MOD 10;
        if(dig = 0) then
            encontreCero := true;
        else
            num:= num DIV 10;
    end;
    tiene_ceros:= encontreCero;
end;
procedure procesar_e_Imprimir(L: lista);
var 
    turnos: vector_turnos;
    cantAlumnos: integer;
begin
    inicializarVector(turnos);
    cantAlumnos:= 0;
    while(L <> nil) do
    begin
        if(L^.dato.nota >= 8) then
            writeLn(L^.dato.nombre_apellido, L^.dato.DNI);
        turnos[L^.dato.turno] := turnos[L^.dato.turno] + 1;
        if(tiene_ceros(L^.dato.dni) = false) then
            cantAlumnos:= cantAlumnos + 1;
        L:= L^.sig;
    end;
    writeLn(maximo(turnos));
    writeLn(cantAlumnos);
end;
var
    L1, L2: lista;
begin
    cargarAlumnos(L1); //Se dispone
    procesarAlumnos(L1, L2);
    procesar_e_Imprimir(L2);
end;

