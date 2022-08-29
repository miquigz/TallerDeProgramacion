{3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama, 
* 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. 
Implementar un programa modularizado que:
a. Lea los datos de películas y los almacene por orden de llegada y agrupados por código de género, en una estructura de datos adecuada.
*  La lectura finaliza cuando se lee el código de la película -1. 
b. Una vez almacenada la información, genere un vector que guarde, para cada género,
*  el código de película con mayor puntaje obtenido entre todas las críticas.
c. Ordene los elementos del vector generado en b) por puntaje utilizando
*  alguno de los dos métodos vistos en la teoría. 
d. Luego de ordenar el vector, muestre el código de película con mayor
*  puntaje y el código de película con menor puntaje.
}
program p1ej3;
const
	dimF = 8;
type
	subGenero = 1..8;
	peli = record
		//codGenero:integer; No Va, esta en el i del vec.
		cod:integer;
		puntaje:real;
	end;

	listaPelis = ^nodo;
	nodo = record
		ele:peli;
		sig: listaPelis;
	end;

	vecLista = array [1..dimF] of listaPelis;
	vecCodigos = array [1..dimF] of peli;


// INICIALIZO LISTAS EN NIL
procedure incializarListas(var vec:vecLista);
var i:integer;
begin
	for i:=1 to dimF do begin
		vec[i]:= nil;
	end;
end;

//INICIALIZO VECTOR MAXIMOS
procedure inicializarlo(var vecMaxi:vecCodigos);
var
	i:integer;
begin
	for i:=1 to dimF do
		vecMaxi[i].puntaje:= -999;
end;

//Modulo AgregarAdelante
procedure agregarAdelante(var pri:listaPelis; pelic:peli);
var
	nuevo:listaPelis;
begin
	new(nuevo); nuevo^.ele:= pelic; nuevo^.sig:= pri;
end;

//Leer registro y subrango
procedure leerPeliYgenero(var pelicula:peli; var codGenero:integer);
begin
	writeln('ingrese codgenero de pelicula');
	readln(codGenero);
	if (codGenero <> -1) then begin
		writeln('ingrese CODIGO DE peli');
		readln(pelicula.cod);
		writeln('ingrese puntaje');
		readln(pelicula.puntaje);
	end;
end;

//CARGO VECTOR DE LISTAS
procedure cargarVecListas(var vec:vecLista; var vecMaxi:vecCodigos);
var
	pelic:peli;
	codGenero:integer;
begin
	leerPeliYgenero(pelic, codGenero);
	while (codGenero <> -1) do begin
		agregarAdelante(vec[codGenero], pelic);
		leerPeliYgenero(pelic, codGenero);
	end;
end;

//Cargo vector Maximos
procedure cargarMaximos(vLista:vecLista; var vecMaxi:vecCodigos);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		while (vLista[i] <> nil)do begin
			if(vLista[i]^.ele.puntaje > vecMaxi[i].puntaje)then begin
				vecMaxi[i].puntaje:= vLista[i]^.ele.puntaje;//Almaceno en el maximoActual en vector.
				vecMaxi[i].cod:= vLista[i]^.ele.cod; //Almaceno cod en vector
			end;
			vLista[i]:= vLista[i]^.sig;
		end;
	end;
end;

//Ordenamiento vector maximos
procedure ordenarSeleccion(var vec:vecCodigos);
var
	i, j, pos:subGenero;
	ele:peli;
begin
	for i:=1 to dimF-1 do begin
		pos:= i;
		for j:= i+1 to dimF do
			if (vec[j].puntaje > vec[pos].puntaje) then
				pos:= j;
		ele:= vec[pos];
		vec[pos]:= vec[i];
		vec[i]:= ele;
	end;
end;	

	
//Prog principal.	
VAR
	vecListas:vecLista;
	vecMaxi:vecCodigos;
BEGIN
	
	incializarListas(vecListas);
	inicializarlo(vecMaxi);
	cargarVecListas(vecListas, vecMaxi);
	cargarMaximos(vecListas, vecMaxi);
	ordenarSeleccion(vecMaxi);
	writeln(vecMaxi[1].cod,';El codigo de genero con menor puntaje');
	writeln(vecMaxi[dimF].cod,';El codigo de genero con mayor puntaje');
END.
