program PracticaSemana2Ejercicio4;
const
	CORTE = -1;
type

	listaEnteros = ^nodo;
	nodo = record
		ele:integer;
		sig:listaEnteros;
	end;
(*a*)
procedure cargarLista(VAR pri:listaEnteros); 
var
	nuevo:listaEnteros;
	elemento:integer;
begin
	writeln('ingrese entero'); readln(elemento);
	while (elemento <> CORTE) do begin
		new(nuevo); nuevo^.sig:= nil; nuevo^.ele:= elemento;
		if (pri = nil) then
			pri:=nuevo
		else
			nuevo^.sig:= pri;
		pri:=nuevo;
		writeln('ingrese entero'); readln(elemento);
	end;
end;
(*b*)
procedure minimo(pri:listaEnteros; var min:integer);
begin
	if (pri <> nil) then begin
		if (pri^.ele < min)then
			min:= pri^.ele;
		minimo(pri^.sig, min);
	end;
end;
(*c*)
procedure maximo(pri:listaEnteros; var max:integer);
begin
	if (pri <> nil) then begin
		if (pri^.ele > max) then
			max:= pri^.ele;
		maximo(pri^.sig, max);
	end;
end;
(*D*)
procedure encontrarValor(pri:listaEnteros; valor:integer; var encontre:boolean);
begin
	if (pri <> nil) AND (encontre = false) then begin
		if (pri^.ele = valor)then
			encontre:=true;
		encontrarValor(pri^.sig, valor, encontre);
	end;
end;
(*Principal*)
VAR
	pri:listaEnteros;
	min, max:integer;
	valor:integer;
	encontre:boolean;
BEGIN
	pri:=nil;
	min:= 999;
	max:= -99;
	cargarLista(pri);
	minimo(pri, min);
	maximo(pri, max);
	encontre:=false;
	writeln('Ingrese un valor a encontrar'); readln(valor);
	encontrarValor(pri, valor, encontre);
	writeln('El valor min:', min, 'El valor max:', max);
	writeln('Encontre el valor:', encontre);
END.
