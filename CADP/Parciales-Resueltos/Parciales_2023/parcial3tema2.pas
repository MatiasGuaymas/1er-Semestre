program parcial;
type
    subEquipo: 1..20;
    nota: 0..10;
    subFechas: 1..18;
    jugador = record
        codigo: integer;
        apellido_nombre: string;
        equipo: subEquipo;
        nacimiento: integer;
        calificacion: vecCal;
    end;
    vecCal = array[subFechas] of nota;
    vecEquipo = array[subEquipo] of integer;

    lista= ^nodo;
    nodo = record
        dato: jugador;
        sig: lista;
    end;

procedure cargarLista(var l: lista); // SE DISPONE

procedure inicializarVector(v: vecEquipo);
var
    i: subEquipo;
begin
    for i:= 1 to 20 do v[i] := 0;
end;

procedure procesarLista(l : lista; v: vecEquipo); 
var
    prom, min1, min2: real;
    minCod1, minCod2: integer;
begin
    min1:= 999;
    min2:= 999;
    while(l<>nil) do
        prom:= 0;
        begin
            if(cumple(l^.dato.nacimiento)) then
                v[l^.dato.equipo] := v[l^.dato.equipo] + 1;
            if(cumpleFechas(l^.dato.calificacion)) then
                begin
                    calcularPromedio(l^.dato.calificacion, prom);
                    procesarMinimos(min1, min2, minCod1, minCod2, l^.dato.codigo, prom);
                end;
        end;
    informarMenores(v);
    write(minCod1, minCod2);
end;

function cumple(d: integer): boolean;
var
    edad: integer;
begin
    edad:= 2022 - d;
    cumple:= (edad < 30);
end;

function cumpleFechas(vc: vecCal): boolean;
var
    i: subFechas;
    fechas: integer;
begin
    fechas:= 0;
    for i:= 1 to 18 do
        if(v[i] > 0 ) then
            fechas:= fechas + 1;
    cumpleFechas:= fechas > 9;
end;

procedure calcularPromedio(v: vecCal; var prom: real);
var
    i: subFechas;
    fechas, suma: integer;
begin
    suma:= 0
    for i:= 1 to 18 do
        begin
            if(v[i] > 0) then
                suma:= suma + v[i];
                fechas:= fechas + 1;
        end;
    prom:= suma / fechas;
end;

procedure procesarMinimos(var min1, min2: real; var minCod1, minCod2: integer; code: integer; prom: real);
begin
    if(prom < min1) then
        min2:= min1;
        min1:= prom;
        minCod2:= minCod1;
        minCod1:= code
    else if (prom < min2) begin
        min2:= prom;
        minCod2:= code;
    end;
end;

procedure informarMenores(v: vecEquipo);
var
    i:subEquipo;
begin
    for i:= 1 to 20 do begin
        write(v[i]);
    end;
end;
var
    l: lista;
    v: vecEquipo;
begin
    cargarLista(l); // SE DISPONE
    inicializarVector(v);
    procesarLista(l, v);
end;