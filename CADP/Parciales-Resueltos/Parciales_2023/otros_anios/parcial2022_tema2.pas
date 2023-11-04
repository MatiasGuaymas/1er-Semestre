program parcial;
type
    subMes: 1..12;
    compra= record
        monto: real;
        mes: subMes;
        cantKilos: real;
        nombre: string;
    end;

    lista = ^nodo;
    nodo = record
        dato: compra;
        sig: lista;
    end;

    vecMes = array[subMes] of integer;

procedure cargarLista(var l:lista);
var
    c:compra;
begin
    l:= nil;
    repeat
        leerCompra(c);
        insertar(l, c);
    until (c.cantKilos = 100);
end; 

procedure leerCompra(var c: compra);
begin
    read(c.monto);
    read(c.mes);
    read(cantKilos);
    read(c.nombre);
end;

procedure insertar(l: lista; c: compra);
var
    ant, act, aux: lista;
begin
    new(aux); aux^.sig:= nil; aux^.dato:= c;
    if(l = nil) then l:= aux
    else begin
        ant:= l;
        act:= l;
        while(act <> nil) and (act^.dato.nombre < aux^.dato.nombre) do
            begin
                ant:= act;
                act:= act^.sig;
            end;
        if(act = l) then
            aux^.sig:= l; l:= aux
        else begin
            ant^.sig:= aux; aux^.sig:= act;
        end;
end;

procedure procesarLista(l: lista; var v: vecMes);
var
    cantCompras: integer;
    minMes1, minMes2: subMes;
    actual: string;
    total, suma: real;
begin
    inicizalizarVector(v);
    cantCompras:= 0;
    while(l<>nil) do
    begin
        actual:= l^.dato.nombre;
        total:= 0;
        while(l<>nil) and (actual = l^.dato.nombre) do
            begin
                total:= total + l^.dato.monto;
                v[l^.dato.mes] := v[l^.dato.mes] + 1;
                if(l^.dato.mes = 9) then
                    cantCompras:= cantCompras + 1;
                    suma:= suma + l^.dato.monto;
                l:= l^.sig;
            end;
        if(total > 45000) then
            write(actual);
    end;
    calcularMinimos(v, minMes1, minMes2);
    write(minMes1, minMes2); 
    write(suma/cantCompras);
end;

procedure calcularMinimos(v: vecMes, var minMes1, minMes2: subMes);
var
    min1, min2: integer;
    i: subMes;
begin
    min1:= 99999;
    min2:= 99999;
    for i:= 1 to 12 do
        begin
            if(v[i] < min1) then
                begin
                    min2:= min1;
                    min1:= v[i];
                    minMes2:= minMes1;
                    minMes1:= i;
                end
                else if (v[i] < min2) then
                begin
                    min2:= v[i];
                    minMes2:= i;
                end;
        end;
end;

procedure inicizalizarVector(var v: vecMes);
var
    i: subMes;
begin
    for i:= 1 to 12 do
        v[i] := 0;
end;

var
    l:lista;
    v: vecMes;
begin
    cargarLista(l);
    procesar_e_informar(l, v);
end;