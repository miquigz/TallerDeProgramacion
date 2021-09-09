{
* Realice un modulo que genere y devuelva un arreglo de enteros. 
* La carga del arreglo debe realizarse hasta que se lee el numero 
* 0 o se hayan leido 20 numeros.
* 
* (*Realice un modulo que reciba un arreglo y un valor num, y de ser posible elimne del arreglo el valor num*)
* }
program TeoriaClase1;
const
	dimF = 20;
type	
	
	indice = 0..dimF;
	vNums = array[1..dimF] of integer;
	listaEnteros = ^nodo;
	nodo = record
		ele:integer;
		sig:listaEnteros;
	end;

(*Modulo 1*)
procedure cargarVec(var vec:vNums; var dimL:indice);
var
	i:indice;
	parar:boolean;
	num:integer;
begin
	i:=0;
	parar:= false;
	while (parar = false) AND (i < 20) do begin
		writeln('ingrese num');
		readln(num);
		if (num <> 0) then begin
			i:= i + 1;
			vec[i]:= num;
		end else
			parar:= true;
	end;
	dimL:= i;
end;

(*Modulo 2*)
procedure imprimirVec(vec:vNums; dimL:indice);
var
	i:indice;
begin
	for i:=1 to dimL do 
		writeln(vec[i]);
end;

(*Modulo 3*)
procedure eliminarNum(var vec:vNums; dimL:indice; num:integer);
var
	i, p:indice;
begin
	for i:=1 to dimL do begin
		if (vec[i] = num) then
			p:= i;
	end;
	if (p <> 0) then begin
		for i:= p to dimL-1 do 
			vec[i]:= vec[i+1];
		dimL:= dimL-1;
	end;
end;

(*Modulo 4*)
procedure agregarAtras(var pri, ult:listaEnteros; num:integer);
var
	nuevo:listaEnteros;
begin
	new(nuevo); nuevo^.ele:= num; nuevo^.sig:= nil;
	if (pri = nil) then begin
		pri:= nuevo;
		ult:= nuevo;
	end
	else begin
		ult^.sig:= nuevo; //guardo la pos anterior.
		ult:= nuevo;
	end;
end;

procedure generarLista(var pri:listaEnteros; var ult:listaEnteros);
var
	num:integer;
begin
	num:= 0;
	while (num <> 15) do begin
		num:= random(16);
		agregarAtras(pri, ult, num);
	end;
end;


//principal.
VAR
	vec:vNums;
	dimL:indice;
	pri, ult:listaEnteros;
	num:integer;
	
BEGIN
	cargarVec(vec, dimL);
	writeln('ingrese numero a eliminar'); readln(num);
	eliminarNum(vec, dimL, num);
	generarLista(pri, ult);
END.
