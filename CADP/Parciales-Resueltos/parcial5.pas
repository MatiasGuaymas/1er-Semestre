program parcial;
const
	lim : 100;
type
	
	sub = 1..5;
	
	sub2 = 1..lim;
	
	evento = record
		nom : string;
		tipo : sub;
		lugar : string;
		cantmax : integer;
		costo : real;
		end;
		
		
	vc = array[1..lim]of integer;
	
	vec = array[1..lim] of evento;
	
	venta = record
		codigo : integer;
		num : sub2;
		dni : integer;
		cant : integer;
		end;
		
	lista = ^nodo;
	
	nodo = record
		v : venta;
		sig : lista;
		end;
		
procedure leer(var a : venta);
begin
	read(a.codigo);
	read(a.num);
	read(a.dni);
	read(a.cant);
end;

procedure inicializarvector(var v : vt);
var
	i : integer
begin
	for i := 1 to 4 do
		v[i] := 0;
end;

procedure agregar(var l : lista; a : venta);
var
	aux, ult : lista;
begin
	new(aux); aux^.sig := nil; aux^.v := a;
	if(l = nil)then l := aux;
	else
		begin
			ult := l;
			while(ult^.sig <> nil) do
				ult := ult^.sig;
			ult^.sig := aux;
		end;
end;

procedure cargarlista(var l: lista)
var
	a : venta
begin
	leer(a);
	while(a.codigo <> -1) do
		begin
			agregar(l, a);
			leer(a);
		end;
end;

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

procedure minimos(var min1, min2 : integer, v : vc);
var
	i, m1, m2 : integer;
begin
	m1, m2 := 999;
	for i ;= 1 to lim do
		begin
			if (m1 < v[i])then
				begin
					m2 := m1;
					m1 := v[i];
					min2 := min1;
					min1:= i;
				end;
			else
				begin
					if (m2 < v[i])then
						begin
							m2 := v[i];
							min2 := i;
						end;
				 end;
		end;
end;


procedure procesar (l : lista; v : vec; var vcont : vc; var cant : integer; var ok : boolean)
var
	sum : integer;
begin
	while(l<>nil)do
		begin
			vcont[l^.v.num]:= (l^.v.cant * v[l^.v.num].costo)+ vcont[l^.v.num];
			if(maspares(l^.v.dni)) and (v[l^.v.num].tipo = 3) then
				cant := cant + 1;
			if(l^.v.num = 50) then
				sum := l^.v.cant + suma;
		end;
	if(suma = v[50].cantmax) then
		ok := true;
end;

var
	l : lista
	v : vec;
	vcont : vc;
	cant, min1, min2 : integer;
	ok : boolean
begin
	cant := 0;
	ok := false;
	l := nil;
	cargarvector(v);//SE DISPONE
	cargarlista(l);
	incializarvector(vcont);
	procesar(l, v, vcont, cant, ok);
	minimos(min1, min2, vcont);
	write(min1, min2);
	write(ok);
	write(cant);
end.