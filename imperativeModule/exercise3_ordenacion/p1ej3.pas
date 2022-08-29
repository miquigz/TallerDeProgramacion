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
	vectoReal = array [1..dimF] of real;


// INICIALIZO LISTAS EN NIL
procedure incializarListas(var vec:vecLista);
var i:integer;
begin
	for i:=1 to dimF do begin
		vec[i]:= nil;
	end;
end;

//INICIALIZO VECTOR MAXIMOS
procedure inicializarlo(var vecMaxi:vectoReal);
var
	i:integer;
begin
	for i:=1 to dimF do
		vecMaxi[i]:= -999;
end;

//Modulo AgregarAdelante
procedure agregarAdelante(var pri:listaPelis; pelic:peli);
var
	nuevo:listaPelis;
begin
	new(nuevo); nuevo^.ele:= pelic; nuevo^.sig:= pri;
end;

//Leer registro y subrango
procedure leerPeliYgenero(var pelicula:peli; var codGenero:subGenero);
begin
	writeln('ingrese peli');
	readln(pelicula.cod);
	writeln('ingrese puntaje');
	readln(pelicula.puntaje);
	writeln('ingrese codgenero');
	readln(codGenero);
end;

//CARGO VECTOR DE LISTAS
procedure cargarVec(var vec:vecLista; var vecMaxi:vectoReal);
var
	pelic:peli;
	codGenero:subGenero;
begin
	leerPeliYgenero(pelic, codGenero);
	while (vec[codGenero]^.ele.cod <> -1) do begin
		agregarAdelante(vec[codGenero], pelic);
		leerPeliYgenero(pelic, codGenero);
	end;
end;
	
procedure cargarMaximos(vLista:vecLista; var vecMaxi:vectoReal);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		while (vLista[i] <> nil)do begin
			if(vLista[i]^.ele.puntaje > vecMaxi[i])then
				vecMaxi[i]:= vLista[i]^.ele.puntaje;
			vLista[i]:= vLista[i]^.sig;
		end;
	end;
end;
	
procedure ordenarInsercion(var vecMaximos:vectoReal);
var
	i, j:subGenero;
	act:real;
begin
	for i:=2 to dimF do begin
		act:= vecMaximos[i];
		j:= i-1; //empiezo a consultar desde el principio.
		while ((j > 0) AND (vecMaximos[j] > act)) do begin
			writeln('El cod actual es:', act);
			writeln('El codigo en el while de j es:', vecMaximos[j]);
			writeln('El valor de J es :', j);
			
			vecMaximos[j+1]:= vecMaximos[j]; //VOY HACIENDO LUGAR.
			j:= j - 1; //Voy BAJANDO EN EL VECTOR, PORQ DISMINUYO J
		end;
		vecMaximos[j+1]:= act;
	end;
	writeln(vecMaximos[1],';El codigo de genera con menor puntaje');
	writeln(vecMaximos[dimF],';El codigo de genera con mayor puntaje');
end;	

	
//Prog principal.	
VAR
	vecListas:vecLista;
	vecMaxi:vectoReal;
BEGIN
	
	incializarListas(vecListas);
	inicializarlo(vecMaxi);
	cargarVecListas(vecListas, vecMaxi);
	cargarMaximos(vecListas, vecMaxi);
	ordenarInsercion(vecMaxi);
END.
