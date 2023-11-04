program parcial;
type
    subMes: 1..12;
    subUbi: 1..4;
    ticket = record
        codigo: integer;
        dni: integer;
        mes: subMes;
        ubicacion: subUbi;
    end;
    lista = ^nodo;
    nodo = record
        dato: ticket;
        sig: lista;
    end;
        
    vecCosto = array[subUbi] of real; // SE DISPONE
    vecMes = array[subMes] of real;

    infoEvento = record
        cod: integer;
        cantTickets: integer;
    end;

    listaE = ^nodoE;
    nodoE = record
        dato: infoEvento;
        sig: listaE;
    end;

procedure cargarLista(var l: lista); //SE DISPONE

procedure cargarVector(var vc: vecCosto); //SE DISPONE

procedure inicializarVector(var v: vecMes); 
var
    i: subMes;
begin
    for i:= 1 to 12 do
        v[i]:= 0;
end;

procedure procesarLista(l: lista; vc: vecCosto; v: vecMes; var l2: listaE);
var
    mesMax1: real;
    eventoActual, cantTickets: integer;
begin
    while(l<> nil) do
        begin
            eventoActual:= l^.dato.codigo;
            cantTickets:= 0;
                while(l<>nil) and (eventoActual:= l^.dato.codigo) do
                    begin
                        cantTickets:= cantTickets + 1;
                        v[l^.dato.mes]:= v[l^.dato.mes] + vc[l^.dato.ubicacion];
                        l:= l^.sig;
                    end;
                agregarAdelante(l2, eventoActual, cantTickets);
        end;
        calcularMaximo(v, mesMax1);
        write(mesMax1);
end;

procedure agregarAdelante(var l: listaE; cod, cantTickets: integer);
var
    aux: listaE;
begin
    new(aux); 
    aux^.dato.cod := cod; 
    aux^.dato.cantTickets:= cantTickets;
    aux^.sig:= nil;
    if(l = nil) then l:= aux
    else begin
        aux^.sig:= l;
        l:= aux;
    end;
end;

procedure calcularMaximo(v: vecMes, var mesMax1: real);
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
    vc: vecCosto;
    v: vecMes;
    l2: listaE;
begin
    cargarLista(l); //SE DISPONE
    cargarVector(vc); //SE DISPONE
    inicializarVector(v); 
    procesarLista(l, vc, v, l2);
end;
    
