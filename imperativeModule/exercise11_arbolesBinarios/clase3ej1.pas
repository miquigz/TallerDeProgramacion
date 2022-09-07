{
1.	Escribir un programa que:
a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como parámetro y que : 
i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que retorne dicho valor.
ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo recursivo que retorne dicho socio.
iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que retorne dicho valor.
iv. Aumente en 1 la edad de todos los socios.
v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.
viii. Informe el promedio de edad de los socios. Debe invocar a un módulo recursivo que retorne dicho promedio.
ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo número de socio se encuentra entre los dos valores ingresados. Debe invocar a un módulo recursivo que reciba los dos valores leídos y retorne dicha cantidad.
x. Informe los números de socio en orden creciente. 
xi. Informe los números de socio pares en orden decreciente. 
}
program clase3Ejer1;
type

	socios = record
		num:integer;
		name:string;
		edad:integer;
	end;
	
	arbolSocios = ^nodo;
	nodo = record
		ele:socios;
		HI:arbolSocios;
		HD:arbolSocios;
	end;

procedure arbolRecursivo(var arbol:arbolSocios; socio:socios);
begin
	if (arbol = nil) then begin // si es raiz o llegue a una hoja de alguna rama, entonces inserto, y pongo mis subnodos en nil.
		new(arbol); arbol^.ele:= socio; arbol^.HI:= nil; arbol^.HD:= nil;
	end else if (socio.num < arbol^.ele.num) then begin //importante reservar memoria en el primer if, ya q los subnodos estan en nil, si es que estan vacios.
		arbolRecursivo(arbol^.HI, socio);  
	end else begin
		arbolRecursivo(arbol^.HD, socio);
	end;
end;

procedure leerSocio(var socio:socios);
begin
	writeln('Escriba el num de socio');
	readln(socio.num);
	if (socio.num <> 0) then begin
		writeln('Escriba el nombre de socio');
		readln(socio.name);
		writeln('Escriba la edad del socio');
		readln(socio.edad);
	end;
end;

procedure cargarArbol(var arbol:arbolSocios);
var
	socio:socios;
begin
	leerSocio(socio);
	while (socio.num <> 0) do begin
		arbolRecursivo(arbol, socio);
		leerSocio(socio);
	end;

end;	

procedure masLongevo(eleActual:socios; var maxEdadSocio:socios);
begin
	if (eleActual > maxEdadSocio.edad) then
		maxEdadSocio:= eleActual;
end;

procedure socioMasChico(arbol:arbolSocios; var minCodSocio);
begin
	if (arbol^.HI = nil) then begin
		minCodSocio:= arbol^.ele;
	end else if (arbol <> nil)then begin
		recorrerArbol(arbol^.HI, minCodSocio);
	end;
end;

procedure socioMasGrande(arbol:arbolSocios; var maxCodSocio);
begin
	if (arbol^.HD = nil) then begin
		maxCodSocio:= arbol^.ele;
	end else if (arbol <> nil)then begin
		recorrerArbol(arbol^.HD, maxCodSocio);
	end;
end;

procedure recorrerArbol(arbol:arbolSocios; var maxEdadSocio:socios);
begin
	if (arbol <> nil)then begin
		recorrerArbol(arbol^.HI, maxEdadSocio);
		masLongevo(arbol^.ele, maxEdadSocio);
		recorrerArbol(arbol^.HD, maxEdadSocio);
	end;
end;
//Punto IV
procedure aumentarEdad(var arbol:arbolSocios);
begin
	if (arbol <> nil)then begin
		aumentarEdad(arbol^.HI);
		arbol^.ele.edad:= arbol^.ele.edad + 1;
		aumentarEdad(arbol^.HD);
	end;
end;
//Punto V
procedure buscarValor(arbol:arbolSocios; valor:integer; var esta:boolean;);
begin
	if ((arbol <> nil) OR (NOT esta)) then begin
		buscarValor(arbol^.HI, valor, esta);
		esta:= (arbol^.ele.cod = valor);
		buscarValor(arbol^.HD, valor, esta);
	end;
end;
//Punto VI
procedure buscarNombre(arbol:arbolSocios; nombre:string; var esta:boolean);
begin
	if ((arbol <> nil) OR (NOT esta))then begin
		buscarNombre(arbol^.HI, nombre, esta);
		esta:= arbol^.ele.name = nombre;
		buscarNombre(arbol^.HD, nombre, esta);
	end;
end; 

//Punto VII
procedure cantidadSocios(arbol:arbolSocios; var cantTotal:integer;);
begin
	if( arbol <> nil)then begin
		cantidadSocios(arbol^.HI, cantTotal);
		cantTotal:= cantTotal + 1;	
		cantidadSocios(arbol^.HD, cantTotal);
	end;
end;
//Punto VIII
procedure sumaTotalEdades(arbol:arbolSocios; var sumaEdades:integer);
begin
	if (arbol <> nil)then begin
		sumaTotalEdades(arbol^.HI, sumaEdades);
		sumaEdades:= sumaEdades + arbol^.ele.edad;
		sumaTotalEdades(arbol^.HI, sumaEdades);
	end;
end;
//Punto IX
procedure estanEntre(arbol:arbolSocios; var cantEntre:integer; x:integer; y:integer);
begin
	if (arbol <> nil) then begin
		estanEntre(arbol^.HI, cantEntre, x, y);
		if ( (arbol^.ele.num > x) AND (arbol^.ele.num < y) ) then
			cantEntre:= cantEntre + 1;
		estanEntre(arbol^.HD, cantEntre, x, y);
	end;
end;
//Punto X
procedure imprimirArbol(arbol:arbolSocios);
begin
	if (arbol <> nil) then begin
		imprimirArbol(arbol^.HI);
		writeln(arbol^.ele.num, ' ', arbol^.ele.edad, ' ', arbol^.ele.name); writeln;
		imprimirArbol(arbol^.HD);
	end;
end;

//Punto XI
function esPar(valor:integer):boolean;
begin
	if ( (valor mod 2) = 0)then
		esPar:= true;
end;

procedure imprimirArbol(arbol:arbolSocios);
begin
	if (arbol <> nil) then
		imprimirArbol(arbol^.HD);
		if (esPar(arbol^.ele.num))then
			writeln(arbol^.ele.num);
		imprimirArbol(arbolHI);
	end;
end;

//programa principal.
VAR
	arbol, arbEdad:arbolSocios;
	sumaEdades, cantTotal, cantEntre:integer;
	maxEdadSocio, minCodSocio, maxCodSocio:socios;
BEGIN
	sumaEdades:= 0;
	cantEntre:= 0;
	cantTotal:= 0;
	arbol:= nil;
	arbEdad:= nil;
	cargarArbol(arbol);
	imprimirArbol(arbol);
	socioMasChico(arbol, minCodSocio); //cod Socio
	socioMasGrande(arbol, maxCodSocio); //cod Socio
	recorrerArbol(arbol, maxEdadSocio);
	writeln('El socio mas longevo es: ', maxEdadSocio.name, ' con anios; ',maxEdadSocio.edad, ' numsocio: ', maxEdadSocio.num);
	
END.
