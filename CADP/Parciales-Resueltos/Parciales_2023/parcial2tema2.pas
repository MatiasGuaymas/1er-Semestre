program parcial;
type
    subrango: 1..5;
    sesion = record
        titulo: string;
        nombre: string;
        genero: subrango;
        estreno: integer;
        cantReproducciones: integer;
    end;

    lista = ^nodo;
    nodo = record
        dato: sesion;
        sig: lista;
    end;

    vectorCont = array[subRango] of integer;

procedure cargarLista(var l: lista); //SE DISPONE
procedure inicializarVector(var vc: vectorCont);
var
    i: subRango
begin
    for i:= 1 to 5 do v[i]:= 0;
end;

procedure procesarLista(l: lista; var vc: vectorCont; var codmin1, codmin2: subrango, var l2: lista);
begin
    while(l<>nil) do
        begin
            vc[l^.dato.genero]:= vc[l^.dato.genero] + L^.dato.cantReproducciones;
            if (evaluarCondicion(l^.dato.genero, l^.dato.cantReproducciones)) then
                insertar(l2, l^.dato);
            L:= L^.sig;
        end;
    evaluarMinimos(vc, codmin1, codmin2);
end;

function evaluarCondicion(g: subrango; num: integer): boolean;
begin
   evaluarCondicion:= (g=1) or (g=3) and (verificarDigitos(num));
end;

function verificarDigitos(num: integer) : boolean;
var
    dig, suma: integer;
begin
    suma:= 0
    while(num <> 0) do#
        Begin
            dig:= num mod 10;
            suma:= suma + dig;
            num:= num DIV 10;
        end;
    verificarDigitos:= ((suma MOD 5) = 0)
end;

procedure evaluarMinimos(vc: vectorCont, var codmin1, codmin2: subrango);
var
    min1, min2: integer;
    i: subRango;
begin
    min1:= 99999;
    min2:= 99999;
    for i:= 1 to 5 do
        begin
            if(v[i] < min1) then
                min2:= min1;
                min1:= v[i];
                codmin2:= codmin1;
                codmin1:= i
            else if (v[i] < min2) then
                min2:= v[i];
                codmin2:= i;
        end;
end;

procedure insertar (Var l: lista; s:sesion);
Var
    act,ant,aux:lista;
Begin
    new (aux); aux^.dato:= s; aux^.sig:=nil;
    if (l = nil) then     l:= aux
    else begin
        act:= l; ant:=l;
        while (act <> nil) and (act^.dato.estreno < aux^.dato.estreno) do   
            begin
                ant:=act;
                act:= act^.sig;
            end;
    end;
    if (act = l) then 
        begin
            aux^.sig:= l;   l:= aux;
        end;
    else
        begin
            ant^.sig:= aux;   aux^.sig:= act;
        end;
End;

procedure recorrerLista(l: lista);
var
    cantSesiones, totalReproducciones: integer;
begin
    while(l <> nil) do
        begin
        estrenoActual:= l^.dato.estreno;
        cantSesiones:= 0;
        totalReproducciones:= 0
        while(l <> nil) and (estrenoActual = l^.dato.estreno) do 
            begin
                cantSesiones:= cantSesiones + 1;
                totalReproducciones:= totalReproducciones + L^.dato.cantReproducciones;
                l:= l^.sig;
            end;
            write(estrenoActual, cantSesiones, totalReproducciones);
        end;
end;

var
    l: lista;
    vc: vectorCont;
    codmin1, codmin2: subrango;
begin
    cargarLista(l); //SE DISPONE
    inicializarVector(vc);
    l2:= nil;
    procesarLista(l, vc, codmin1, codmin2, l2);
    write(codmin1, codmin2);
    recorrerLista(l2);
End.