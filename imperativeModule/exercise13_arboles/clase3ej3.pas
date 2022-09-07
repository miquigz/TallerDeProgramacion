{3.	Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y almacene en una estructura de datos sólo a aquellos alumnos que posean año de ingreso posterior al 2010. De cada alumno se lee legajo, DNI y año de ingreso. La estructura generada debe ser eficiente para la búsqueda por número de legajo. 
b. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro. 
c. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo esté comprendido entre dos valores que se reciben como parámetro. 
d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar.}
program clase3ej3;
type
	alumnos = record
		legajo:integer;
		dni:integer;
		anio:integer; //Anio de ingreso
	end;
	
	arbolAlumnos = ^nodo;
	nodo = record
		ele:alumnos;
		HI:arbolAlumnos;
		HD:arbolAlumnos;
	end;
	
//Punto A
procedure leerAlumnos(var alu:alumnos);
begin
	writeln('Ingrese legajo');
	readln(alu.legajo);
	writeln('Ingrese dni');
	readln(alu.dni);
	writeln('Ingrese anio');
	readln(alu.anio);
end;

procedure arbolRecu(var arb:arbolAlumnos; alu:alumnos);
begin
	if (arb = nil) then begin
		new(arb); arb^.ele:= alu; arb^.HI:= nil; arb^.HD:= nil;
	end else if (arb^.ele.legajo > alu.legajo) then begin
		arbolRecu(arb^.HI, alu);
	end else begin
		arbolRecu(arb^.HD, alu);
	end;
end;

//Punto A
procedure cargarArbol(var arb:arbolAlumnos);
var
	alu:alumnos;
begin
	leerAlumnos(alu);
	while (alu.cod <> 0) do begin
		if (alu.anio > 2010) then
			arbolRecu(arb, alu);
		leerAlumnos(alu);
	end;
end;

//Punto B
procedure informarMenores(arb:arbolAlumnos; menorA:integer); 
begin
	if (arb <> nil) then begin
		if (arb^.ele.legajo > menorA) then begin
			informarMenores(arb^.HI, menorA);
		end else if (arb^.ele.legajo < menorA) then begin
			informarMenores(arb^.HI, menorA);
			writeln('EL legajo es menor al ingresado:', arb^.ele.legajo, ' ,legajo ingresado:', menorA);
			writeln('DNI y anio de ingreso del legajo menor', arb^.ele.dni, arb^.ele.anio);
			informarMenores(arb^.HD, menorA);
		end;
	end;
end;

//Punto C
procedure informarEntre(arb:arbolAlumnos; x:integer; y:integer);
begin
	if (arb <> nil) then begin
		if ( (arb^.ele.legajo > x) AND (arb^.ele.legajo < y) )then begin
			informarEntre(arb^.HI, x, y);
			writeln('DNI y anio de ingreso del alumno con legajo entre: ', x ' y ', y, arb^.ele.dni,' ', arb^.ele.anio);
			informarEntre(arb^.HD, x, y);
		end else if (arb^.ele.legajo < x) then begin
			informarEntre(arb^.HD, x, y);
		end else (arb^.ele.legajo > y) then begin
			informarEntre(arb^.HI, x, y);
		end;	
	end;
end;

//Punto D
procedure dniMax(arb:arbolAlumnos; var maxDNI:integer);
begin
	if (arb <> nil)then begin
		dniMax(arb^.HI, maxDNI);
		if (arb^.ele.DNI > maxDNI)then
			maxDNI:= arb^.ele.DNI;
		dniMax(arb^.HD, maxDNI);
	end;
end;
//Punto E
procedure legajosImpar(arb:arbolAlumnos; var cantImpar:integer);
begin
	if (arb <> nil) then begin
		legajosImpar(arb^.HI, cantImpar);
		if ( (arb^.ele.legajo mod 2 ) = 1) then
			cantImpar:= cantImpar + 1;
		legajosImpar(arb^.HD, cantImpar);
	end;
end;

//Prog Principal
VAR
	arb:arbolAlumnos;
	cantImpar, maxDNI, x, y, menorA:integer
BEGIN
	//A
	cargarArbol(arb);
	//B
	menorA:= 50;
	informarMenores(arb, menorA);
	//C
	x:= 20;
	y:= 50;
	informarEntre(arb, x, y);
	//D
	maxDNI:= -99;
	dniMax(arb, maxDNI);
	//E
	cantImpar:= 0;
	legajosImpar(arb, cantImpar);
END.

