{semana2teo1}
program semana2teo1ej2;
const
	CORTE = 0;
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
	new(nuevo); nuevo^.ele:= elemento; nuevo^.sig:= nil;
	if (pri = nil) then
		pri:= nuevo
	else
		nuevo^.sig:= pri;
	pri:=nuevo;
end;

procedure leerEnteros(var pri:listaEnteros);
var
	x:integer;
begin
	write('ingrese valor entero'); readln(x);
	while ( x <> CORTE) do begin
		agregarAdelante(pri, x);
		readln(x);
	end;
end;

(*Modulo recursivo, imprimir digitos*)
procedure descomponerImprimir(digito:integer);
var
	numero:integer;
begin
	if (digito <> 0) then begin
		numero:= digito mod 10;
		digito:= digito div 10;
		descomponerImprimir(digito);
		write(numero, ' ');
	end;
end;

(*Modulo recursivo, avanzar en la lista*)
procedure recorrerLista(pri:listaEnteros);
begin
	if (pri <> nil) then begin
		descomponerImprimir(pri^.ele);
		writeln('');
		writeln(' -  -  -  - ');
		recorrerLista(pri^.sig);
	end;
end;

VAR
	pri:listaEnteros;
BEGIN
	pri:= nil;
	leerEnteros(pri);
	recorrerLista(pri);
END.

