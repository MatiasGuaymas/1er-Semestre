program parcial;
const
	lim : 20;
type
	categ = 1..lim;
	
	categoria = record
		nom : string
		precio : real;
		end;
		
	vec = array[categ] of categoria;
	
	vcat = array[categ] of integer;
	
	
	compra = record
		dni : integer;
		cat : categ;
		cantk : integer;
		end;
		
	lista = ^nodo;
	
	nodo = record
		c : categ;
		sig : lista;
		end;
		
procedure leer(var c : compra);
begin
	read(c.dni);
	read(c.cat);
	read(c.cantk);`
end;
		
procedure cargarvector(var v : vt);
var
	i : integer
begin
	for i := 1 to 4 do
		v[i] := 0;
end;
		
		
procedure insertar(var l : lista, c : compra);
var
	aux, ant, act : lista;
begin
	new(aux); aux := nil; aux^.c := a;
	if(l = nil) then l := aux;
	else
		begin
			act := l;
			ant := l;
			while(act <> nil) and (act^.c.dni < aux^.c.dni) do 
				begin
					ant := act
					act := act^.sig;
				end;
			if(act = l) then
				begin
					aux^.sig := l;
					l := aux;
				end;
			else
				begin
					ant^.sig := aux;
					aux^.sig := act;
				end;
		end;
end;
		
		
procedure cargarlista(var l : lista);
var
	a : compra;
begin
	l := nil;
	leer(a);
	while (a.dni <> -1) do
		begin
			insertar(l, a);
			leer(a);
		end;
end;


function 5pares (num : integer): boolean
var
	cant : integer
begin
	cant := 0;
	while(num<>0) and (cant < 5) do
		begin
			if((num mod 10)mod 2 <> 0) then
					cant:= cant + 1;
			num := num div 10;
		end;
	if(cant >= 5) then
		5pares := true;
	else
		5pares := false;
end;
	
	
	

procedure procesar(v : vec; l : lista var mindni : integer; var vc : vcat; var cant : integer)
var
	actual : integer;
	min, sum : real;
begin
	min := 99999;
	while(l<>nil) do 
		begin
			actual := l^.c.dni;
			while(actual := l^.c.dni) do 
				begin
					sum:= v[l^.c.cat].precio * l^.c.cantk;
					vc[l^.c.cat]:=vc[l^.c.cat] + 1;
					if(5pares(l^.c.dni))then
						cant := cant +1;
				end;
			if(sum < min) then
				mindni := actual;
		end;
end;
		
		
		
var
	v : vec;
	l : lista;
	vc : vcat;
	cant, mindni : integer;
begin
	new(l);
	cargarcat(v);
	cargarvector(vc);
	cargarlista(l);
	procesar(v, l, mindni, vc, cant);
end;