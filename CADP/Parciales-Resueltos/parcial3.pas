program parcialreducido;
const
    lim : 26;
type

    sub : 1..26;

    categoria = record
        nom : string;
        codigo : sub;
        precio : real;
        end;

    vc = array[sub] of real;

    vec = array[sub] of categoria;

    compra = record
        dni : integer;
        cat : sub;
        cantk: integer;
        end;

    lista = ^nodo;

    nodo = record
        c : compra;
        sig : lista;
        end;

procedure leer (var c : categoria);
begin
    read(c.nom);
    read(c.codigo);
    read(c.precio);
end;

procedure cargarvector(var v : vec);
var
    a : categoria;
    i : integer;
begin
    for i := 1 to lim;
        begin
            leer(a);
            v[i] := a;
        end;
end;

procedure inicializarv(var v : vc);
var
    i : integer;
begin
    for i := 1 to lim do
        v[i] := 0;
end;


procedure procesar(l : lista; v : vec; var dnimax : integer; var vcont : vc);
var
    max, actual, cont : integer;
begin
    max := -999
    while(l <> nil) do
        begin
            actual := l^.c.dni;
            cont := 0;
             while(l <> nil) and (actual = l^.c.dni;)do
                begin
                    cont := cont + 1;
                    vcont[l^.c.cat] := vcont[l^.c.cat] + 1;
                end;
            if(cont > max) then
                begin
                    max := cont;
                    dnimax := actual;
                end;
        end;
end;

var
    l : lista;
    v : vec;
    vcont : vc;
    dni : integer;
begin
    dni := 0;
    cargalista(l) //se dispone
    inicializarv(vcont);
    cargarvector(v);
    procesar(l,v,dni,vcont);
end.