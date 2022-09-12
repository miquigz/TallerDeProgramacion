{2.- Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la información de los autos en venta.
Implementar un programa que:
a)	Genere un árbol binario de búsqueda ordenado por patente identificatoria del auto en venta. Cada nodo del árbol debe contener patente, año de fabricación (2010..2018), la marca y el modelo.
b)	Invoque a un módulo que reciba el árbol generado en a) y una marca y retorne la cantidad de autos de dicha marca que posee la agencia. Mostrar el resultado. 
c)	Invoque a un módulo que reciba el árbol generado en a) y retorne una estructura con la información de los autos agrupados por año de fabricación.
d)	Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el año de fabricación del auto con dicha patente. Mostrar el resultado. }
program clase5EJ2;
type
	subAnio = 2010..2018;
	
	rAuto = record
		patente:integer;
		anio:subAnio; //Anio de fabricacion
		marca:string;
		modelo:string;
	end;

	//Se dispone de la informacion de los autos en venta
	//por lo tanto, dispongo de una lista.
	
	listaAutos = ^nodoLista;
	nodoLista = record
		ele:rAuto;
		sig:listaAutos;
	end;

	arbolBinario = ^nodo;
	nodo = record
		ele:auto;
		HI:arbolBinario;
		HD:arbolBinario;
	end;

//Punto A
procedure arbolRecu(var arb:arbolBinario; auto:rAuto);
begin
	if (pri = nil)then begin
		new(pri); pri^.ele:= auto; pri^.HI:= nil; pri^.HD:= nil;
	end else if (pri^.ele.patente < auto.patente)then begin
		arbolRecu(pri^.HD, auto);
	end else if (pri^.ele.patente > auto.patente) then begin
		arbolRecu(pri^.HI, auto);
	end;
end;

procedure cargarArbol(pri:listaAutos; var arb:arbolBinario);
begin
	while (pri <> nil) do begin
		arbolRecu(arb ,pri^.ele);
		pri:= pri^.sig;
	end;
end;

//Punto B
procedure cantMarca(arb:arbolBinario; var cantMarca:integer; marca:string);
begin
	if (arb <> nil) then begin
		if (arb^.ele.marca = marca) then
			cantMarca:= cantMarca + 1;
		cantMarca(arb^.HI, cantMarca, marca);
		cantMarca(arb^.HD, cantMarca, marca);
	end;
end;
//Punto C
procedure insertarOrdenado(var pri2:listaAutos; auto:rAuto);
var
	act, ant, nuevo:listaAutos;
begin
	new(nuevo); nuevo^.ele:= auto;
	act:= pri2;
	while (act <> nil) AND (act^.ele.anio < auto.anio) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = pri2) then
		pri2:= nuevo
	else
		ant^.sig:= nuevo;
	nuevo^.sig:= act;
end;

procedure ordenFabricacion(arb:arbolBinario; var pri2:listaAutos);
begin
	if (arb <> nil)then begin
		insertarOrdenado(pri2, arb^.ele);
		ordenFabricacion(arb^.HI, pri2);
		ordenFabricacion(arb^.HD, pri2);
	end;
end;
//Punto D
procedure hallarPatente(arb:arbolBinario; patente:integer; var anioFabri:integer);
begin
	if (arb <> nil)then begin
		if (arb^.ele.patente = patente) then
			anioFabri:= arb^.ele.anio;
		else if (arb^.ele.patente > patente ) then
			hallarPatente(arb^.HI, patente, anioFabri);
		else
			hallarPatente(arb^.HD, patente, anioFabri);
	end;
end;

//Programa Principal.
VAR
	pri, pri2:listaAutos;
	arb:arbolBinario;
	cantMarca, patente, anioFabri:integer;
	marca:string;
BEGIN
	pri:= nil;
	cargarLista(pri); //se dispone
	cargarArbol(pri, arb);
	//Punto B
	writeln('Ingrse marca a buscar');
	readln(marca);
	cantMarca:= 0;
	cantMarca(arb, cantMarca, marca);
	writeln('La agencia posee con la: ', marca, ' un total de: ', cantMarca);
	//Punto C
	pri2:= nil;
	ordenFabricacion(arb, pri2);
	//Punto D
	writeln('Ingrse patente a buscar');
	readln(patente);
	anioFabri:= 0;
	hallarPatente(arb, patente, anioFabri);
	if (anioFabri <> 0)then
		writeln('El anio de fabricacion de la patente es:', anioFabri);
	else
		writeln('Patente no encontrada');
END.
