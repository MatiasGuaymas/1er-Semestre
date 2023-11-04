program procesos;

//**********************************CREAR O CARGAR**********************************
procedure crear(var l: lista);
begin
    l:= nil;
end;

procedure cargarListaWhile(var l: lista)
begin
    l:= nil;
    leerDatos(d);
    while(d.campo1 <> -1000) do
        begin
            agregarAdelante(l, d);
            leerDatos(d)
        end;
end;

procedure cargarListaRepeat(var l: lista)
begin
    l:= nil;
    d: registro;
    repeat
        begin
            leerDatos(d);
            agregarAdelante(l, d);
        end;
    until (d.code = 1000)
end;

procedure generarLista(var pri: lista, l:lista);
begin
    while(l<>nil) do
        begin
            if(l^.dato.campo <> condicion) then
                insertar(pri, l^.dato);
        end;
    end;
end;


//**********************************AGREGAR**********************************
procedure agregarAdelante(var l: lista, d: dato);
var
    aux: lista
begin
    new(aux); aux^.sig:= nil; aux^.d=d;
    if (l = nil) then l:= aux
    else
    begin
        aux^.sig:= l;
        l:= aux;
    end;
end;

procedure agregarAtras(var l: lista, d: dato);
var
    aux, ult: lista;
begin
    new (aux); aux^.sig:= nil; aux^.d=d;
    if(l = nil) then l:= aux;
    else
    begin
        ult:= l;
        while(ult^.sig <> nil) do
            ult:=ult^.sig;
        ult^.sig:= aux;
    end;
end;

procedure insertar (Var l: lista; valor:integer);
Var
    act,ant,aux:listaE;
Begin
    new (aux); aux^.elem:= valor; aux^.sig:=nil;
    if (l = nil) then     l:= aux
    else begin
        act:= l; ant:=l;
        while (act <> nil) and (act^.elem < aux^.elem) do   
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

//**********************************ELIMINAR**********************************

procedure eliminar(var l:lista; num:integer);
var
    ant, act: lista;
begin
    act:= l
    while(act <> l) and (act^.dato < num) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if(act <> nil) then
        if (act = l) then
            l:= l^.sig
        else
            ant^.sig:= act^.sig;
        dispose(act);
end;

//**********************************LECTURA**********************************
procedure leerDatos(var d:dato);
begin
    read(d.campo1);
    read(d.campo2);
    read(d.campo3);
end;

procedure leerVector(var v:vectorX);
var
    i:subRango;
begin
    for i:= 1 to constante do readln(v[i]);
end;

//**********************************INICIALIZAR VECTOR**********************************
procedure inicializarVector (var v:vectorContador);
var
    i:subRango;
begin
    for i:= 1 to constante do v[i] := 0;
end;

//**********************************MAXIMOS Y MINIMOS VECTORES**********************************
procedure minimosVec(var minmes1, minmes2 : integer, v : vec);
var
	i,min1, min2: integer;
begin
	min1 := 99999; min2 := 99999;
	for i := 1 to lim do
		begin
			if(v[i] < min1)then
				begin
					min2 := min1;
					min1 := v[i];
					minmes2 := minmes1;
					minmes1 := i;
				end;
			else(v[i] < min2)then
				begin
					min2 := v[i];
					minmes2 := i;
				end;
		end;
end;

function maximo(v: vector_turnos) : rango_turnos;
var
    i, max_turno: rango_turnos;
    maxAlumnos : integer;
begin
    maxAlumnos := -1;
    for i := 1 to cant_turnos do 
        if(v[i] > maxAlumnos) then
        begin
            maxAlumnos := v[i];
            max_turno := i;
        end;
    maximo := max_turno;
end;

//**********************************MAXIMOS Y MINIMOS LISTA**********************************

procedure maximosLista (l : lista, var codemax1, codemax2 : integer)
var
    max1, max2 : integer;
begin
    max1:= -999; max2 := -999;
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

//**********************************PROCEDIMIENTOS UTILES**********************************

procedure verificarPresentes(v: vector_evaluaciones, var presentes, aprobados: integer);
var
    i:subRango;
begin
    presentes:= 0;
    aprobados:= 0;
    for i:= 1 to constante do
        if(v[i]= 0) then
        begin
            presentes:= presentes + 1;
            if(v[i] = 6) then
                aprobados:= aprobados+1
        end;
end;


//**********************************FUNCIONES UTILES**********************************
function cumpleCondicion(ingreso, presentes: integer): boolean;
begin
    cumpleCondicion:= (ingreso = 2020) and (presentes = constante);
end;

function promedio(dato1, dato2: integer): real;
begin
    promedio:= (dato1 / dato2);
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

//**********************************FUNCIONES CON DIGITOS**********************************

function maspares( num : integer): boolean;
var
	dig,impar,par : integer;
begin
	impar:= 0;
	par:= 0;
	while(num <> 0)do
		begin
			dig := num mod 10;
			if ((dig mod 2) = 0) then
				par := par + 1;
			else
				impar := impar + 1;
			num := num div 10;
		end;
	maspares := (par>impar);
end;	

function tiene_ceros(num : integer): boolean;
var 
    encontreCero : boolean;
    dig: integer;
begin   
    encontreCero := false;
    while(num <> 0) and (not encontreCero) do
    begin
        dig:= num MOD 10;
        if(dig = 0) then
            encontreCero := true;
        else
            num:= num DIV 10;
    end;
    tiene_ceros:= encontreCero;
end;

function suma_digitos(num: integer): integer;
var
    suma: integer;
begin 
    suma:= 0;
    while(num <> 0) do
        begin
            suma:= suma + (num MOD 10);
            num:= num DIV 10;
        end;   
    suma_digitos:= suma;
end;

//**********************************PROCESAR**********************************

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

procedure procesar (l : lista; var v : vec; var prom : real);
var
	actual : string;
	total, sum : real;
	cant : integer;
begin
	cant := 0;
	while(l <> nil) do
		begin
			actual := l^.c.nom;
			total := 0;
			while(actual = l^.c.nom) do
				begin
					total := l^.c.monto + total;
					v[l^.c.meses] := v[l^.c.meses] + 1;
					if(l^.c.meses = 9)then
						begin
							cant := cant + 1;
							sum := sum + l^.c.monto;
						end;
					l := l^.sig;
				end;
				if(total > 45000) then
					write(actual);
		end;
	prom := sum / cant;
end;

procedure procesar_e_Imprimir(L: lista);
var 
    turnos: vector_turnos;
    cantAlumnos: integer;
begin
    inicializarVector(turnos);
    cantAlumnos:= 0;
    while(L <> nil) do
    begin
        if(L^.dato.nota >= 8) then
            writeLn(L^.dato.nombre_apellido, L^.dato.DNI);
        turnos[L^.dato.turno] := turnos[L^.dato.turno] + 1;
        if(tiene_ceros(L^.dato.dni) = false) then
            cantAlumnos:= cantAlumnos + 1;
        L:= L^.sig;
    end;
    writeLn(maximo(turnos));
    writeLn(cantAlumnos);
end;

procedure procesarViajes (L: listaviajes; v: vectorCostos; var L2: listaTrenes; v2: vectorRecaudaciones);
var
    trenActual, cantViajes, cantPasajeros: integer;
    costo: real;
    tren: infoTren;
begin
    while(L <> nil) then
        trenActual:= L^.dato.tren;
        cantViajes:= 0;
        cantPasajeros:= 0;
        while(L<> nil) and (trenActual = L^.dato.tren) do begin
            cantViajes:= cantViajes+1;
            cantPasajeros:= cantPasajeros + L^.dato.pasajeros;
            costo:= v[L^.dato.destino] * L^.dato.pasajeros;
            v2[L^.dato.mes] := v2[L^.dato.mes] + costo;
            L:= L^.sig;
        end;
        infoTren.tren:= TrenActual;
        infoTren.cant:= cantPasajeros;
        agregarAdelante(L2, infoTren);
end;

procedure procesarSinCorte(L: lista, V:vectorcapacidad; var viajesPorAvion, totalPasajeros: vectorCapacidad, var puntaCana: lista);
var
    avion: codigoAvion;
begin
    puntaCana:= nil;
    inicializarVectores(viajesPorAvion, totalPasajeros);
    while(L <> nil) then
        avion:= L^.dato.avion;
        viajesPorAvion[avion]:= viajesPorAvion[avion] + 1;
        totalPasajeros[avion] := totalPasajeros[avion] + L^.dato.pasajeros;
        if(cumple(L^.dato, v)) then
            agregarAdelante(puntaCana, L^.dato);
        L:= L^.sig;
end;