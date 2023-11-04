program parcial;
type
    subNota: 4..10;
    subTurno: 1..4;
    subAsist: 1..12;
    vecAsist = array[subAsist] of boolean;

    alumno = record
        dni: integer;
        nombre_apellido: string;
        nota: subNota;
        turno: subTurno;
        asistencias: vecAsist;
    end;

    lista = ^nodo;
    nodo = record
        dato: alumno;
        sig: lista;
    end;

    vecTurnos = array[subTurno] of integer;

procedure cargarLista(var l: lista); //SE DISPONE

procedure procesarAlumnos(l: lista; var l2: lista);
var
    aux: alumno;
begin
    while(l<>nil) do
        begin
            aux:= l^.dato;
            if(cumple_condicion(aux.asistencias)) then
                agregarAdelante(l2, aux);
            l:= l^.sig;
        end;
end;

function cumple_condicion(a: vecAsist) : boolean;
var
    i: subAsist;
    cant: integer;
begin
    cant:= 0
    for i:= 1 to 12 do
        if(a[i]) then
            cant:= cant + 1 
    cumple_condicion:= (cant >= 8);
end;

procedure agregarAdelante(var l: lista; a: alumno);
var
    aux: lista;
begin
    new(aux); 
    aux^.dato := a;
    aux^.sig:= nil;
    if(l = nil) then l:= aux
    else begin
        aux^.sig:= l;
        l:= aux;
    end;
end;

procedure procesar_e_imprimir(l: lista);
var
    turno: vecTurnos;
    turnoMax: subTurno;
    cantAlumnos, alumnosMas8: integer;
begin
    cantAlumnos:= 0
    inicializarVector(turno);
    while(l<>nil) do
        begin
            if(l^.dato.nota >= 8) then
                write(l^.dato.nombre_apellido, l^.dato.dni);
            turno[l^.dato.turno]:= turno[l^.dato.turno] + 1;
            if(sinCeros(l^.dato.dni)) then
                cantAlumnos:= cantAlumnos + 1;
            l:= l^.sig
        end;
    calcularMaximo(turno, turnoMax);
    write(turnoMax);
    write(cantAlumnos);
end;

function sinCeros(num : integer) : boolean;
var
	dig : integer;
	ok : boolean;
begin
	while(num<>0) do
        dig:= num MOD 10;
        if(dig = 0) then
            ok:= false;
        else
            ok:= true;
            num div 10;
    sinceros:= ok;
end;

procedure calcularMaximo(v: vecTurnos; var turnoMax: subTurno);
var
    i: subTurno;
    max: integer;
begin
    max:= -1
    for i:= 1 to 4 do
        begin
            if(v[i] > max) then
                begin
                    max:= v[i];
                    turnoMax:= i;
                end;
        end;
end;

procedure inicializarVector(v: vecTurnos);
var
    i: subTurno;
begin
    for i:= 1 to 4 do  
        v[i]:= 0;
end;

var
    l, l2: lista;
begin
    cargarLista(l); // SE DISPONE
    l2:= nil;
    procesarAlumnos(l, l2);
    procesar_e_imprimir(l2);
end;