program ejercicio1;
const
    cant_clases = 12;
    cant_turnos = 4;
type
    rango_notas = 4..10;
    rango_turnos = 1..cant_turnos;
    rango_clases = 1..cant_clases;
    vector_clases = array[rango_clases] of boolean;
    alumno = record
        dni: integer;
        nombre_apellido: string;
        nota: rango_notas;
        turno: rango_turnos;
        asistencias: vector_clases;
    end;
    lista = ^nodo;
    nodo = record
        dato: alumno;
        sig: lista;
    end;
    vector_turnos = array[rango_turnos] of integer;


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

program primeraFecha;
type
    rangoMeses = 1..12;
    rangoCiudades = 1..20;

    viaje = record
        tren: integer;
        mes: rangoMeses;
        pasajeros: integer;
        destino: rangoCiudades;
    end;
    listaViajes = ^nodoViajes;
    nodoViajes = record
        dato: viaje;
        sig: listaViajes;
	vectorCostos = array[rangoCiudades] of real;

    infoTren = record
        tren: integer;
        cant: integer;
    listaTrenes = ^nodoTren;
    nodoTren = record;
        dato: infoTren;
        sig: listaTrenes;
    end;
    vectorRecaudaciones = array[rangoMeses] of real;