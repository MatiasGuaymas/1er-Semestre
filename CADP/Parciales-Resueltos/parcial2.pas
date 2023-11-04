program parcialrecu;
const
	lim : 12;
type
	
	mes= 1..12;
	
	vec = array[mes]of integer;
	
	compra = record
		monto : real;
		meses : mes;
		cantk : integer;
		nom : string;
		end;
		
	lista = ^nodo;
	
	nodo = record
		c : compras
		sig : lista;
		end;
		
		
procedure leer(var a : compra);
begin
	read(a.monto);
	read(a.meses);
	read(a.cantk);
	read(a.nom);
end;

procedure insertar(var l : lista, a : compra);
var
	aux, ant, act : lista;
begin
	new(aux); aux := nil; aux^.c := a;
	if(l = nil) then l := aux;
	else
		begin
			act := l;
			ant := l;
			while(act <> nil) and (act^.c.nom < aux^.c.nom) do 
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
	repeat
		leer(a)
		insertar(l, a);
	until(a.cantk = 100);
end;


procedure cargarvector(var v : vt);
var
	i : integer
begin
	for i := 1 to 4 do
		v[i] := 0;
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

procedure minimos(var minmes1, minmes2 : integer, v : vec)
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

var
	l : lista
	minmes1, minmes2 : integer
	prom : real;
	v : vec;
begin
	new(l);
	minmes1 := 0; minmes2 := 0;
	prom := 0;
	cargarvector(v);
	cargarlista(l);
	procesar(l,v,prom)
	minimos(minmes1, minmes2, v);
	write(minmes1, minmes2);
	write(prom);
end.