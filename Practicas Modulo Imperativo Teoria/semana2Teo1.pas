{Semana 2, Teoria.}
program sem2teo1;
type
	
	listaEnteros = ^nodo;
	
	nodo = record
		ele:integer;
		sig:listaEnteros;
	end;

procedure agregarAdelante(var pri:listaEnteros; elemento:integer);
var
	nuevo:listaEnteros;
begin
	new(nuevo); nuevo^.sig:= nil; nuevo^.ele:= elemento;
	if (pri = nil) then
		pri:=nuevo
	else
		nuevo^.sig:= pri;
	pri:= nuevo;
end;

procedure leerValores(var pri:listaEnteros);
var
	x, limite:integer;
begin
	limite:= 0;
	while (limite < 7) do begin
		limite:= limite + 1;
		write('Ingrese VALOR X'); readln(x);
		agregarAdelante(pri, x);
	end;
end;

(*Modulo recursivo*)
procedure imprimirLista(pri:listaEnteros);
begin
	if (pri <> nil) then begin
		writeln(pri^.ele);
		//pri:= pri^.sig;
		imprimirLista(pri^.sig);
	end;
end;

VAR
	pri:listaEnteros;

BEGIN
	pri:=nil;
	leerValores(pri);
	imprimirLista(pri);
END.

