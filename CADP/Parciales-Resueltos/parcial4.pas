program parcialito;
const
    lim : 23
type
    sub = 1..23;

    estancia = record
        codigo : integer;
        localidad : string;
        prov : sub;
        cant : integer;
        end;

    lista = ^nodo;

    nodo = record
        e : estancia;
        sig : lista;
        end;

procedure leer(var e : estancia)
begin
    leer(e.codigo);
    leer(e.localidad);
    leer(e.prov);
    leer(e.cant);
end;

procedure agregar(var l  : lista; a : estancia);
var
    aux : lista
begin
    new(aux); aux^.sig:= nil; aux^.c := a;
    if(l = nil) then l := aux;
    else
        begin
            aux^.sig := l;
            l := aux;
        end;
end;

procedure cargarlista(var l : lista);
var
    a : estancia;
begin
    l := nil;
    leer(a);
    while(a.codigo <> 0) do
        begin
            agregar(l, a);
            leer(a);
        end;
end;

function esta (l : lista) : boolean
var
    ok : boolean;
begin
    ok := false;
    while(l<>nil) and (not ok) do
        begin
            if(l^.e.codigo = 234) then
                ok := true;
            else
                l := l^.sig;
        end;
    esta :=  ok;
end;


procedure maximos (l : lista var codemax1, codemax2 : integer)
var
    max1, max2 : integer;
begin
    max1, max2 := -999;
    while(l<>nil) do
        begin
            if(l^.e.cant > max1)then
                begin
                    max2 := max1;
                    max1:= l^.e.cant;
                    codemax2 := codemax1;
                    codemax1 := l^.e.codigo;
                end;
            else
                begin
                    if (l^.e.cant > max2) then
                        begin
                            max2 := l^.e.cant;
                            codemax2 := l^.e.codigo;
                        end;
                end;
        end;
end;

var
    l : lista;
    max1, max2 : integer
begin
    max1,max2 := 0;
    cargarlista(l);
    write(esta(l));
    maximos(l, max1, max2);
end.