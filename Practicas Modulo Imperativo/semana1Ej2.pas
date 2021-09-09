program semana1EJ2;
const
	dimF=8;
type
	subGen= -1..dimF;
	
	peli = record
		codPeli:integer;
		cod:subGen;
		puntaje:real;
		//dni:longint;
	end;
	
	listaPelis = ^nodo;
	nodo = record
		ele:peli;
		sig:listaPelis;
	end;
	
	codMax = record
		codPeli:integer;
		puntaje:real;
	end;
	
	vGeneros = array[1..dimF]of listaPelis;
	vMaximos = array[1..dimF]of codMax;

(*A*)	
procedure leerPelis(var vec:vGeneros);
var
	nuevo:listaPelis;
	pel:peli;
begin
	new(nuevo); readln(pel.codPeli); readln(pel.cod); readln(pel.puntaje);
	nuevo^.sig:= nil; nuevo^.ele:= pel;
	while (pel.cod <> -1)do begin
		if (vec[pel.cod] = nil) then
			vec[pel.cod]:= nuevo
		else
			nuevo^.sig:= vec[pel.cod];
		vec[pel.cod]:= nuevo;
		new(nuevo); readln(pel.cod); readln(pel.puntaje);
		nuevo^.sig:= nil; nuevo^.ele:= pel;
	end;
end;



(*B*)
procedure maximos(var vecMAX:vMaximos; codActual:integer; valorActual:real; indice:integer);
begin 
	if (valorActual > vecMAX[indice].puntaje) then begin
		vecMAX[indice].codPeli:= codActual;
		vecMax[indice]:= valorActual;
	end;
end;
procedure inicializarVec(var vec:vMaximos);
var i:integer;
begin
	for i:=1 to dimF do
		vecMAX[i]:= -99;
end;

(*B*)
procedure recorrerVec(vec:vGeneros; var vecMAX:vCodMayor);
var
	i:subGen;
begin
	inicializarVec(vecMAX);	
	for i:=1 to dimF do begin
		while (vec[i] <> nil) do
			maximo(vecMAX ,vec[i]^.codPeli , vec[i]^.ele.puntaje, vec[i]^.ele.cod);
	end;
end;

(*C*)
procedure ordenarInsercion(var vecMAX:vMaximos);
var
	i, j:integer;
	actual:codMax;
begin
	for i:=2 to dimF do begin
		actual:= vecMAX[i];
		j:= i-1;
		while ((j > 0) and (vecMAX[j].puntaje > actual.puntaje)) do begin
			vec[j+1]:= vec[j];
			j:= j-1;
		end;
		vecMAX[j+1]:= actual; //j+1 es igual a 2, si no entre al while.
end;
VAR
	vec:vGeneros;
	vecMAX:vMaximos;

BEGIN
	leerPelis(vec);
	recorrerVec(vec, vecMAX);
	(*D*)
	writeln(vecMAX[1].codPeli);
END.

