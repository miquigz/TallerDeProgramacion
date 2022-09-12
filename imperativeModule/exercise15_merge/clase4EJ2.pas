{
2.	Un cine posee la lista de películas que proyectará durante el mes de octubre. De cada película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. Implementar un programa que contenga:
a.	Un módulo que lea los datos de películas y los almacene ordenados por código de película y agrupados por código de género, en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de película -1. 
b.	Un módulo que reciba la estructura generada en el punto a y retorne una estructura de datos donde estén todas las películas almacenadas ordenadas por código de película.}
program clase4ej2;
const
	dimF = 8;
	valorGrande = 999;
type
	peli = record
		cod:integer;
		prom:real;
	end;

	listaPeli = ^nodo;
	nodo = record
		ele:peliGuardar;
		sig:listaPeli;
	end;

//Punto A
procedure leerPeli(var pel:peli);
begin
	writeln('Ingrese codigo de pelicula');
	readln(pel.cod);
	if (pel.cod <> -1) then begin
		writeln('Ingrese promedio de pelicula');
		readln(pel.prom);
	end;
end;

procedure inicializarListas(var vec:vListas);
var	i:integer;
begin
	for i:=1 to dimF do
		vec[i]:= nil;
end;

procedure insertarOrdenado(var pri:listaPeli; pel:peli);
var
	nuevo, act, ant:listaPeli;
begin
	new(nuevo); nuevo^.ele:= pel;
	act:= pri; ant:= pri;
	while (act <> nil AND pri^.ele.cod < act^.ele.cod) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = ant )then
		pri:= nuevo
	else
		ant^.sig:= nuevo;
	nuevo^.sig:= act;
end;

procedure cargarPeli(var vec:vLista);
var
	pel:peli;
	genero:integer;
begin
	leerPeli(pel, genero);
	while (pel.cod <> -1 ) do begin
		insertarOrdenado(vec[genero], pel);
		leerPeli(pel, genero);
	end;
end;

//Punto B
procedure minimo(var vec:vLista; var peliMin:peli; );
var
	i, indice:integer;
begin
	peliMin.cod:= valorGrande;
	for i:=1 to dimF do begin
		if (vec[i] <> nil ) then
			if (vec[i]^.ele.cod <= peliMin.cod ) then begin
				indice:= i;
				peliMin:= vec[i]^.ele;
			end;
	end;
	if (peliMin.cod <> valorGrande ) then
		vec[indice]:= vec[indice]^.sig;
end;

procedure agregarAtras(var pri:listaPeli; pel:peli );
var
	nuevo, act:listaPeli;
begin
	new(nuevo); nuevo^.ele:= pel; nuevo^.sig:= nil
	if (pri <> nil) begin
		act:= pri;
		while (act^.sig <> nil) do
			act:= act^.sig;
		act^.sig:= nuevo;
	end else
		pri:= nuevo;
end;

procedure merge(vec:vLista; var pri:listaPeli);
var
	pelMin:peli;
begin
	pri:= nil;
	minimo(vec,pelMin);
	while(peliMin.cod <> valorGrande )do begin
		insertarAtras(pri, peliMin);
		minimo(vec, pelMin);
	end;
end;

//Programa Principal
VAR
	vec:vLista;
	pri:listaPeli;
BEGIN
	inicializarListas(vec);
	cargarPeli(vec);
	merge(vec, pri);
END.
