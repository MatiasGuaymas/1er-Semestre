program parcial;
type
    subCod: 1000..2500;
    viaje = record
        codigo: subCod;
        anio: integer;
        cantPasajeros: integer;
        ciudad: string;
    end;
    lista = ^nodo;
    nodo = record
        dato: viaje;
        sig: lista;
    end;

    vecCapacidad = array[subCod] of integer; //SE DISPONE

procedure cargarLista(var l: lista); //SE DISPONE
procedure cargarVector(var v: vecCapacidad); // SE DISPONE

procedure procesarLista(l: lista, v: vecCapacidad; var totalPasajeros, cantViajes: vecCapacidad; var l2: lista);
var
    codMax: subCod;
begin
    inicializarVectores(totalPasajeros, cantViajes);
    while(l<> nil) do
        begin
            cantViajes[l^.dato.codigo] := cantViajes[l^.dato.codigo] + 1;
            totalPasajeros[l^.dato.codigo] := totalPasajeros[l^.dato.codigo] + l^.dato.cantPasajeros;
            if(cumple(l^.dato, v)) then
                agregarAdelante(l2, l^.dato);
            L:= l^.sig;
        end;
    calcularMaximo(cantViajes, codMax);
    write(codMax);
end;

procedure calcularMaximo(v: cantViajes; var codMax: subCod);
var
    i: subCod;
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

function cumple(v: viaje; vc: vecCapacidad);
begin
    cumple:= (v.anio MOD 10 = 0) and (v.ciudad = 'Punta Cana') and (v.cantPasajeros < vc[v.codigo]);
end;

procedure inicializarVectores(var totalPasajeros, cantViajes: vecCapacidad);
var
    i: subCod;
begin
    for i:= 1000 to 2500 do
        totalPasajeros[i]:= 0;
        cantViajes[i]:= 0;
end;

var
    l, l2: lista;
    v, totalPasajeros, cantViajes: vecCapacidad;
begin
    cargarLista(l); //SE DISPONE
    cargarVector(v); //SE DISPONE
    l2:= nil;
    procesarLista(l, v, totalPasajeros, cantViajes, l2);
end;