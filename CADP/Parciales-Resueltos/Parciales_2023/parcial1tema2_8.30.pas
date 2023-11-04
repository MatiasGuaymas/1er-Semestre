program parcial;
type
    subNum: 1000..2500;
    subMes: 1..12;
    viaje = record
        codigo: integer;
        numero: subNum;
        mes: subMes;
        cantVendidos: integer;
        dni: integer;
    end;
    lista = ^nodo;
    nodo = record
        dato: viaje;
        sig: lista;
    end;
    vecCapacidad = array[subNum] of integer; //SE DISPONE

procedure cargarLista(var l: lista); // SE DISPONE
procedure cargarVector(var vc: vecCapacidad); // SE DISPONE

procedure procesarLista(l: lista; vc: vecCapacidad; var vecViajes, vecVendidos: vecCapacidad; var l2: lista);
var
    numMax: subNum;
begin
    inicializarVectores(vecViajes, vecVendidos);
    while(l<>nil) do
        begin
            vecViajes[l^.dato.codigo]:= vecViajes[l^.dato.codigo] + 1;
            vecVendidos[l^.dato.codigo] := vecVendidos[l^.dato.codigo] + l^.dato.cantVendidos;
            if(cumple(l^.dato, vc)) then
                agregarAdelante(l2, l^.dato);
            l:= l^.sig;
        end;
    maximo(vecViajes, numMax);
    write(numMax);
    promedio(vecViajes, vecVendidos);
end;

procedure promedio(v: vecViajes; vc: vecVendidos);
var
    i: subCod;
begin
    for i:= 1000 to 2500 do
        write('Para el avion', i, 'el promedio de pasajeros es: ', calcular(v[i], vc[i]));
end;

function calcular(viajes, pasajeros: num);
begin
    if(viajes > 0) then
        calcular:= pasajeros/viajes
    else
        calcular:= 0;
end;

procedure maximo(v: vecViajes; var codMax: subNum);
var
    i: subNum;
    max: integer;
begin
    max:= -1;
    for i:= 1000 to 2500 do
        if(v[i] > max) then
            begin
                max:= v[i];
                codMax:= i;
            end;
end;

procedure agregarAdelante(var l: lista; v: viaje);
var
    aux: lista;
begin
    new(aux); 
    aux^.dato := v;
    aux^.sig:= nil;
    if(l = nil) then l:= aux
    else begin
        aux^.sig:= l;
        l:= aux;
    end;
end;

procedure inicializarVectores(var v, vc: vecViajes);
var
    i: subNum;
begin
    for i:= 1000 to 2500 begin
        v[i]:= 0;
        vc[i] := 0;
    end;
end;

function cumple(v: viaje; vc: vecCapacidad);
begin
    cumple:= (v.mes = 2) and (v.dni MOD 10 = 0) and (v.cantVendidos < vc[v.codigo]);
end;

var
    l, l2: lista;
    vc, vecViajes, vecVendidos: vecCapacidad;
begin
    cargarLista(l); // SE DISPONE
    cargarVector(vc); //SE DISPONE
    l2:= nil;
    procesarLista(l, vc, vecViajes, vecVendidos, l2 );
end.
