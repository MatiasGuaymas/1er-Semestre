program parcial;
type
    subRango: 1..5;
    sesion = record
        titulo: string;
        nombre: string;
        genero: subRango;
        cantVisualizaciones: integer;
    end;
    lista = ^nodo;
    nodo = record
        dato: sesion;
        sig: lista;
    end;
    vectorCont: array [subRango] of integer;

var
    l:lista;
    v: vectorCont;
begin
    l:= nil;
    inicializar(v);
    cargarLista(l);
    procesarLista(l, v);

function paresImpares(num : integer): boolean;
var
    impares, pares: integer;
begin
    impares:= 0;
    pares:= 0;
    while (num <> 0) do
        begin
            digit:= num mod 10
            if( digit mod 2= 0) then
                pares:= pares + 1;
                else impares:= impares + 1;
            num:= num div 10;
        end;
    paresImpares:= (pares = impares);
end;

procedure obtenerMaximos(v : vector_generos; var cod1, cod2 : subRango);
var
    max1, max2: integer;
    i: subRango;
begin
    max1:= -1;
    max2:= -1;
    for i := 1 to 5 do begin
        if (v[i] > max1) then begin
            max2:= max1;
            max1:= v[i];
            cod2:= cod1;
            cod1:= i;   
        end
        else if (v[i] > max2) then begin
            max2:= v[i];
            cod1:= i
        end;
    end;
end;

function cumple(s: sesion) : boolean;
begin
    cumple:= (s.genero = 2) and (paresImpares(s.cantVisualizaciones));
end;

procedure procesarLista(l: lista, var v: vectorCont);
var
    cant: integer;
begin
    cant:= 0
    while (l <> nil) do begin
        v[l^.dato.genero] := v[l^.dato.genero] + l^.dato.cantVisualizaciones;
        if(cumple(l^.dato)) then
            cant:= cant + 1;
        l:= l^.sig;
        writeln(cant);
end;

procedure insertar(var l: lista; s: sesion);
var
    actual, anterior, nuevo: lista;
begin
    new(nuevo); nuevo^.dato:= s; nuevo^.sig:= nil;
    if(l = nil) then l:= nuevo;
    else begin
        actual:= l; anterior:= l;
        while(actual <> nil) and (actual^.dato < nuevo^.dato) do
            begin
                anterior:= actual;
                actual:= actual^.sig;
            end;
    end;
    if (actual = l) then
        begin
            nuevo^.sig:= l; l:= nuevo;
        end
        begin
            anterior^.sig:= nuevo; nuevo^.sig:= actual;
        end;
end;

procedure inicializar(var v: vectorCont);
var
    i: subRango;
begin
    for i: 1 to 5 do
        v[i] := 0;
end;

procedure cargarLista(var l: lista);
var
    s:sesion;
begin
    repeat
        leerSesion(s);
        insertar(l, s)
    until (s.artista = 'Peso Pluma');
end;

procedure leerSesion(var s: sesion);
begin
    read(s.titulo);
    read(s.nombre);
    read(s.genero);
    read(s.cantVisualizaciones);
end;

