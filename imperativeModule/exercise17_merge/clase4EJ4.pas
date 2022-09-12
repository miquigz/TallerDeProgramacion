{4.	Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las entradas vendidas. Se desea procesar la información de una semana. Implementar un programa que:
a.	Genere 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de 1 a 7), código de la obra, asiento y monto. La lectura finaliza con el código de obra igual a 0. Las listas deben estar ordenadas por código de obra de forma ascendente. 
b.	Genere una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista debe estar ordenada por código de obra de forma ascendente.}
program clase3EJ4;
const
	dimF = 7;
type
	subSemana = 1..dimF;
	
	entrada = record
		cod:integer;
		asiento:integer;
		monto:real;
	end;
	
	entradaAcu = record
		cod:integer;
		cantTotal:integer;
	end;
	
	listaEntradas = ^nodo;
	
	nodo = record
		ele:entrada;
		sig:listaEntradas;
	end;
	
	vListas = array[subSemana] of listaEntradas;

//PUNTO A
procedure leerEntrada(var entr:entrada; var dia:subSemana);
begin
	writeln('Ingrese cod de obra');
	readln(entr.cod);
	if (entr.cod <> 0) then begin
		writeln('Ingrese asiento:');
		entr.asiento:= Random (100) + 100;
		write('Asiento:', entr.asiento);
		writeln('Ingrese Monto:');
		entr.asiento:= Random (500) + 100;
		write('Monto:', entr.monto);
		writeln('Ingrese DIA');
		readln(dia);
	end;
end;

procedure inicializarVec(var vec:vListas );
var
	i:integer;
begin
	for i:= 1 to dimF do
		vec[i]:= nil;
end;

procedure insertarOrdenado(var pri:listaEntradas; vent:venta);
var
	act, ant, nuevo:listaEntradas;
begin
	new(nuevo); nuevo^.ele:= vent; //cargamos nuevo
	act:= pri;
	while (act <> nil) do begin //recorrer
		ant:= act;
		act:= act^.sig;
	end;
	if (act = pri)then //caso 1, lista vacia
		pri:= nuevo
	else //casos contrarios
		ant^.sig:= nuevo;
	nuevo^.sig:= act;
end;
//						PUNTO A
procedure cargarLista(var vec:vListas);
var
	dia:integer;
	entradaAux:entrada;
begin
	leerEntrada(entradaAux, dia);
	while (entradaAux.cod <> 0 ) do begin
		insertarOrdenado(vec[dia], vent);
		leerEntrada(entradaAux, dia);
	end;
end;

//Punto B
procedure minimo(vec:vListas; entradaMin:entrada);
var
	i, indice:integer;
begin
	entradaMin.cod:= valorGrande;
	for i:= 1 to dimF do begin
		while (vec[i]^.ele.cod <= entradaMin.cod ) do begin
			indice:= i;
			entradaMin:= vec[i]^.ele;
		end;
	end;
	if (entradaMin.cod <> valorGrande) then
		vec[indice]:= vec[indice]^.sig;
end;

procedure mergeAcumulador(vec:vListas; var pri:listaEntradas);
var
	entradaMin:entrada;
	act:entradaAcu;
begin
	entradaMin.cod:= valorGrande;
	pri:= nil;
	minimo(vec, entradaMin);
	while (entradaMin.cod <> valorGrande) do begin
		act.cod:= entradaMin.cod; act.cantTotal:= 0;
		while (entradaMin.cod = act.cod ) do begin
			act.cantTotal:= act.cantTotal + 1;
			minimo(vec, entradaMin);
		end;
		insertarAtras(pri, act);
	end;
end;

VAR
	vec:vListas;
	pri:listaEntradas;
BEGIN
	Randomize;
	inicializarVec(vec);
	cargarLista(vec);
	mergeAcumulador(vec, pri);
END.
