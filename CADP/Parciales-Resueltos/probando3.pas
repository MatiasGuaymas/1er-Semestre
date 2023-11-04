program ejparcial;
const
	LIM = 5;
type
	
	NUMALUMNO = 0..LIM;
	
	CODEMATERIA = 300..356;
	
	NOTAFINAL = 0..10;
	
	alumno = record
		num : NUMALUMNO;
		materia : CODEMATERIA;
		nota : NOTAFINAL;
		end;
	
	examen = record
		nota : NOTAFINAL;
		materia : CODEMATERIA;
		end;
	
	
	lis = ^nodo;
	
	nodo = record
		sig : lis;
		dato : examen;
		end;
	
	
	vec = array[1..LIM] of lis;
	
	vecpromedio = array[1..LIM] of real;
		
procedure leer(var a : alumno);
begin
	writeln('ingrese codigo de alumno');
	readln(a.num);
	a.materia := random(57) + 300;
	a.nota := random(11);
end;


procedure agregaradelante(var l : lis; e : examen);
var
	aux : lis;
begin
	new(aux); aux^.sig := nil; aux^.dato := e;
	if(l = nil) then
		l := aux
	else
		begin
			aux^.sig := l;
			l := aux;
		end;
end;

procedure inicializarvector(var v : vec);
var
	i : integer;
begin
	for i := 1 to LIM do
		begin
			v[i] := nil;
		end;
end;

procedure cargarvector(var v : vec);
var
	a : alumno;
	aux : examen;
begin
	leer(a);
	while(a.num <> 0) do
		begin
			aux.nota := a.nota;
			aux.materia := a.materia;
			agregaradelante(v[a.num], aux);
			leer(a);
		end;
end;

procedure imprimirlistas(l : lis);
begin
	while(l <> nil) do
		begin
			writeln(l^.dato.materia);
			writeln(l^.dato.nota);
			l := l^.sig;
		end;
end;


procedure imprimir(v : vec);
var 
	i : integer;
begin
	for i := 1 to LIM do
		begin
			imprimirlistas(v[i]);
		end;
end;


function sacarpromedio(l : lis) : real;
var
	total, cant : integer;
begin
	cant := 0;
	total := 0;
	while(l <> nil) do
		begin
			cant := cant + 1;
			total := total + l^.dato.nota;
			l := l^.sig;
		end;
	sacarpromedio := total div cant;
end;

procedure inicializarvectorpromedio(var v : vecpromedio);
var
	i : integer;
begin
	for i := 1 to LIM do
		v[i] := 0;
end;

procedure promedio(v : vec; var vecp : vecpromedio; var diml : integer);
begin
	if(diml < LIM) then
		begin
			diml := diml + 1;
			vecp[diml] := sacarpromedio(v[diml]);
			promedio(v, vecp, diml);
		end;
end;

procedure imprimirpromedios(v : vecpromedio);
var
	i : integer;
begin
	for i := 1 to LIM do
		writeln(v[i]:0:2);
end;


var
	v : vec;
	vecp : vecpromedio;
	diml : integer;
begin
    randomize;
	inicializarvector(v);
	cargarvector(v);
	imprimir(v);
	inicializarvectorpromedio(vecp);
	diml := 0;
	promedio(v, vecp, diml);
	imprimirpromedios(vecp);
end.