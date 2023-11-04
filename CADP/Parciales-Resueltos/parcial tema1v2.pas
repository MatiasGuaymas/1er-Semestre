{La cátedra de CADP necesita un programa para generar el listado de alumnos ingresantes que
rendirán el parcial. Para ello, la cátedra DISPONE de un listado con todos alumnos que ingresaron
este año a la facultad. De cada alumno se conoce su DNI, nombre y apellido, nota obtenida en
curso de ingreso (entre 4 y 10), turno (entre 1 y 4) y si estuvo presente o ausente en cada una de
las 12 clases de práctica.

a) Realizar un módulo que reciba la información de los alumnos y retorne una nueva estructura de
datos que contenga sólo aquellos alumnos que podrán rendir el parcial. Para poder rendir el
parcial, los alumnos deben contar con al menos 8 asistencias en las 12 clases de práctica.

b) Realizar un módulo que reciba la estructura de datos generada en el inciso anterior, e
IMPRIMA en pantalla:

1) Apellido y nombre y el DNI de los alumnos que hayan obtenido nota 8 o superior en el
ingreso
2) Turno con mayor cantidad de alumnos en condiciones de rendir el examen.
3) Cantidad de alumnos que no posean ningún dígito cero en su DNI.
NOTA: Implementar el programa principal.}
* 

program parcial;
const
	lim : 12;
type

	turno = 1..4;
	
	mark = 1..10;
	
	vt = array[turno] of integer;
	
	vec = array[1..lim] of boolean;
	
	alumno = record
		dni : integer;
		nom : string;
		ap : string;
		nota : mark;
		tur : turno;
		asist : vec;
		end;
		
	lista = ^nodo;
	
	nodo = record
		a : alumno;
		sig : lista;
		end;
		
function cumple (a : alumno) : boolean
var
	cont, i : integer;
begin
	cont := 0;
	for i := 1 to lim do
		begin
			if(a.asist[i] = true) then
				cont := cont + 1;
		end;
	cumple:= cont >= 8;
end;

procedure agregar (var l : lista, a : alumno);
var
	aux : lista;
begin
	new(aux); aux := nil; aux^.a := a;
	if (l = nil)then l := aux;
	else
		begin
			aux^.sig := l;
			l := aux;
		end;
end;
						
			
procedure cargarvector(var v : vt);
var
	i : integer
begin
	for i := 1 to 4 do
		v[i] := 0;
end;
			
			

procedure generarlista(l : lista, var pri : lista)
var
begin
	pri := nil;
	while(l<>nil)do 
		begin
			if (cumple(l^.a)) then
				agregar(pri, l^.a);
			l := l^.sig;
		end;
end;


function maximo (v : vt) : turno;
var
	i,max, cont : integer;
begin
	cont := 0;
	max := -1;
	for i := 1 to 4 do
		if (v[i]> max)then
			begin
				max := v[i];
				cont := i;
			end;
		maximo := cont;
end;
	

function sinceros(num : integer) : boolean;
var
	dig : integer;
	ok : boolean;
begin
	ok := false;
	while (num <> 0) and (not ok) do
		begruein
			dig := num mod 10
				if (dig = 0) then
					ok := t;
				else
					num := num div 10;
		end;
	sinceros := ok;
end;
	
	
procedure procesar (l: lista) 	
var
	v : vt;
	cant : integer;
begin
	while(l<>nil)do begin
		if (l^.a.nota >= 8)then
			write(l^.a.nom, l^.a.ap, l^.a.dni);
		v[l^.a.tur]:= v[l^.a.tur] + 1;
		if(sinceros(l^.a.dni))then
			cant := cant+1;
		l := l^.sig;
		end;
	write(maximo(v));
	write(cant);
end;
	

var
	pri,l : lista
begin
	cargarlista(l) //se dispone
	new(pri);
	generarlista(l, pri);
	procesar(pri);
end.