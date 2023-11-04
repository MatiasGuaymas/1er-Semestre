program parcial;
type
    mesSubrango: 1..12;
    codSubRango: 1..20;
    viaje = record
        codigo: integer;
        mes: mesSubrango;
        cantPasajeros: integer;
        codigo: codSubRango;
    end;

    lista = ^nodo;
    nodo = record
        dato: viaje;
        sig: lista;
    end;

    infoTren = record
        cod: integer;
        cantViajes: integer;
    end;

    listaT = ^nodoT
    nodoT = record
        dato: infoTren;
        sig: listaT;
    end;

    vecMes = array[mesSubrango] of real; 
    vecCiudad = array[codSubRango] of real; // DISPONGO DE ESTE VECTOR

procedure cargarLista(var l: lista); // SE DISPONE
procedure cargarVector(var v: vecCiudad) // SE DISPONE

procedure inicializarVector(var vc: vecMes);
var
    i: mesSubrango;
begin
    for i:= 1 to 12 do
        v[i]:= 0;
end;

procedure procesarLista(l: lista; vc: vecMes; v: vecCiudad; var l2: listaT);
var
    cantViajes, trenActual, cantPasajeros: integer;
    mesMax1: real;
begin
    while(l <> nil) do 
        begin
            trenActual:= l^.dato.codigo;
            cantViajes:= 0;
            cantPasajeros:= 0;
            while(l <> nil) and (trenActual = l^.dato.codigo) do 
                begin
                    cantViajes:= cantViajes + 1;
                    cantPasajeros:= cantPasajeros + L^.dato.cantPasajeros;
                    vc[l^.dato.mes] := vc[l^.dato.mes] + (cantPasajeros * v[l^.dato.codigo]);
                    l:= l^.sig;
                end;
            agregarAdelante(l2, trenActual, cantViajes);
        end;
    calcularMaximo(vc, mesMax1);
    write(mesMax1);
end;

procedure agregarAdelante(var l: listaT; cod, cantViajes: integer);
var
    aux: listaT;
begin
    new(aux); 
    aux^.dato.cod := cod; 
    aux^.dato.cantViajes:= cantViajes;
    aux^.sig:= nil;
    if(l = nil) then l:= aux
    else begin
        aux^.sig:= l;
        l:= aux;
    end;
end;

procedure calcularMaximo(vc: vecMes, var mesMax1: real);
var
    i: mesSubrango;
    max1: real;
begin
    max1:= -1;
    for i: 1 to 12 do
        if(v[i] > max1) then
            max1:= v[i];
            mesMax1:= i;
end;

var
    l: lista;
    vc: vecMes;
    v: vecCiudad;
    l2: listaT;
begin
    cargarLista(l) // SE DISPONE;
    cargarVector(v) // SE DISPONE;
    inicializarVector(vc);
    l2:= nil;
    procesarLista(l, vc, v, l2);
end;
