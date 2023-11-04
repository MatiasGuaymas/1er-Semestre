procedure crear(var l:lista);
begin
    l:= nil;
end;

procedure cargarListaWhile(var l:lista);
begin
    l:= nil
    leer(a);
    while(a.cod <> -1) do
    begin
        agregarAdelante(l, a);
        leer(a);
    end;
end;

procedure cargarListaWhile(var l:lista);
begin
    l:= nil
    repeat
        begin
            leer(a);
            agregarAtras(l, a);
        end;
    until (a.cod = 1000)
end;


procedure generarLista(var pri: lista, l:lista);
begin
    while(l<>nil) do
        begin
            if(l^.dato.campo <> -1) then
                insertar(pri, l^.dato);
        end;
end;

procedure agregarAdelante(var l: lista, a: alumno);
var
    aux:lista;
begin
    new(aux); aux^.sig = nil; aux^d = a;
    if (l = nil) then l:= aux;
    else
    begin
        aux^.sig= l;
        l:= aux;
    end;
end;

procedure agregarAtras(var l:lista, a: alumno);
var
    aux, ult: lista;
begin
    new(aux); aux^.sig := nil; aux^.d = a;
    if (l = nil) then l:= aux
    else 
    begin
        ult:= l;
        while(ult^.sig <> nil) do
            ult:= ult^.sig
        ult^.sig := aux;
    end
end;

procedure insertar(var l: lista, a:alumno);
var
    act, ant, aux: lista;
begin
    new(aux); aux^.sig:= nil; aux^.d := a;
    if(l = nil) then l:= aux;
    else begin
        ant:= l; act:= l;
        while(act<>nil) and (act^.elem < aux^.elem) do
            begin
                ant:= act;
                act:= act^.sig;
            end;
    end;
    if (act = l) then
        begin 
            aux^.sig:= l; l:= aux;
        end;
    else
        begin
            ant^.sig:= aux; aux^.sig:= act
        end;
end;

procedure eliminar(var l:lista, num:integer);
var
    ant, act: lista;
begin
    act:= l;
    while(act <> l) and (act^.dato <> num) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if(act <> nil) then
        if(act = l) then
            l:= l^.sig;
        else
            ant^.sig:= act^.sig;
        dispose(act);
end;

procedure leerCampos(var d:dato);
begin
    readln(d.nombre);
    readln(d.apellido);
    readln(d.entero);
end;

procedure leerVector(var v: vector);
var
    i: subrango
begin
    for i:= 1 to 1000 do
        readln(v[i]);
end;

procedure inicializarVector(var v: vector);
var
    i:subrango;
begin
    for i:= 1 to 1000 do 
        v[i] := 0
end;

procedure minVec (var minmes1, minmes2 : integer, v:vec);
var
    i: subrango;
    min1, min2: integer;
begin
    min1:= 99999;
    min2:= 99999;
    for i:= 1 to 1000 do
        begin
            if(v[i] < min1) then
                begin
                    min2:= min1;
                    min1:= v[i];
                    minmes2:= minmes1;
                    minmes1:= i;
                end;
            else (v[i] < min2) then
                begin
                    min2:= v[i];
                    minmes2:= i;
                end;
        end;
end;

function maximo(v: vector_turnos) ; rango_turnos;
var
    i, max_turno: rango_turnos;
    maxAlumnos: integer;
begin
    maxAlumnos:= -1;
    for i:= 1 to 1000 do
        begin
            if(v[i] > maxAlumnos) then
                maxAlumnos:= v[i];
                max_turno:= i
        end;
    maximo:= max_turno;
end;

procedure maximosLista (l: lista, var codemax1, codemax2: integer);
var
    max1, max2: integer;
begin
    max1:= -1;
    max2:= -1;
    aux:= l^.e
    while(l <> nil) do
        begin
            if(aux.cant > max1) then
            begin
                max2:= max1;
                max1:= aux.cant;
                codemax2:= codemax1;
                codemax1:= aux.codigo;
            end;
            else 
                begin
                    if (aux.cant > max2) then
                        begin
                            max2:= aux.cant;
                            codemax2:= aux.codigo;
                        end;
                end;  
        end;
end;

function cumpleCondicion(ingreso, presentes: integer): boolean;
begin
    cumpleCondicion:= (ingreso = 2020) and (presentes >= 6);
end;

function suma_digitos(num: integer); integer;
var
    suma: integer;
begin
    suma:= 0;
    while(num<>0) do
    begin
        suma:= suma + num MOD 10;
        num:= num DIV 10;
    end;
    suma_digitos:= suma;
end;

function esta (l: lista): boolean;
var
    ok: boolean;
begin
    ok:= false;
    while(l<> nil) and not(ok) do
        begin
            if(l^.e.codigo = 100) do
                ok:= true;
            else
                l:= l^.sig;
        end;
    esta:= ok
end;

function maspares(num: integer): boolean;
var
    dig, impar, par;
begin
    impar:= 0;
    par:= 0;
    while(num <> 0) dato
        begin
            dig:= num mod 10;
            if((dig div 2) = 0) then
                par:= par+1
            else
                impar:= impar+1;
            num:= num div 10;
        end;
    maspares:= (par > impar);
end;

function tiene_ceros(num: integer): boolean;
var
    encontreCero: boolean;
    dig: integer;
begin
    encontreCero:= false;
    if(num <> 0) and (not encontreCero) do
    begin
        dig:= num MOD 10;
        if(dig = 0) then
            encontreCero:= true;
        else 
            num:= num div 10;
    end;
    tiene_ceros:= encontreCero;
end;

procedure procesarViajes(l: litaviajes; v: vectorCostos; var l2: listaTrenes, v2: vectorRecaudaciones);
var
    trenActual, cantViajes, cantPasajeros: max;
    costo: real;
    tren: infoTren;
begin
    while(l <> nil) then
        trenActual:= L^.dato.tren;
        cantPasajeros:= 0;
        cantViajes:= 0;
        while(l <> nil) and (trenActual = L^.dato.tren) then begin
            cantViajes:= cantViajes + 1;
            cantPasajeros:= cantPasajeros + L^.dato.pasajeros;
            costo:= v[L^.dato.destino] * cantPasajeros;
            v2[L2^.dato.mes] := v2[L2^.dato.mes] + costo;
            L:= L^.sig;
        end;
        infoTren.tren:= trenActual;
        infoTren.cant:= cantViajes;
        agregarAdelante(L2, infoTren);
end;

procedure insertar (var l: lista; d: dato);
var
    aux, ant, act: lista;
begin
    new(aux); aux^.dato:= d; aux^.sig:= nil;
    if(l = nil) then l:= aux
    else begin
        ant:= l; act:= l;
        while(act <> nil) and (act^.dato.titulo < aux^.dato.titulo) do
            begin
                ant:= act;
                act:= act^.sig;
            end;
        if(act = l) then begin
            aux^.sig:= l;
            l:= aux
            end
        else begin
            ant^.sig:= aux; aux^.sig:= act;
        end;
    end;
end;

