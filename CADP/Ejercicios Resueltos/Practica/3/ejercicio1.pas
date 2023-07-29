{a. Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e informe
la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que no debe
procesarse. Nota: utilizar el módulo leer.
b. Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe también el
nombre del alumno con mejor promedio.}

program Registros;
type
    str20 = string[20];
    alumno = record
        codigo : integer;
        nombre : str20;
        promedio : real;
end;
procedure leer(var alu : alumno);
begin
    writeln('Ingrese el codigo del alumno');
    read(alu.codigo);
    if (alu.codigo <> 0) then begin
        writeln('Ingrese el nombre del alumno'); read(alu.nombre);
        writeln('Ingrese el promedio del alumno'); read(alu.promedio);
end;
end;
var
a : alumno;
cantLeidos: integer;
maxProm: real;
maxAlumno: str20;
begin
    maxProm:= -1;
	cantLeidos:= 0;
	leer(a);
	while (a.codigo <> 0) do begin
		if (a.promedio > maxProm) then begin
			maxProm:= a.promedio;
			maxAlumno:= a.nombre;
			end;
		cantLeidos:= cantLeidos +1;
		leer(a);
	end;
	writeln('La cantidad de alumnos leidos es: ',cantLeidos); 		// INCISO A
	writeln('El alumno con mejor promedio es: ',maxAlumno);		// INCISO B
end.
