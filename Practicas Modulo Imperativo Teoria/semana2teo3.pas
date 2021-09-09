{semana2teo3}
program semana2teo3ej1;
CONST
	CORTE = 58;
type

	arbol = ^nodo;
	
	nodo = record
		ele:integer;
		LS:arbol;
		RS:arbol;
	end;
	
	
procedure crearArbol(var A:arbol; num:integer);
begin
	if (A = nil) then begin
		new(A); A^.ele:= num; A^.LS:=nil; A^.RS:=nil;
	end
	else if (num < A^.ele) then
		crearArbol(A^.LS, num)
	else
		crearArbol(A^.RS, num);
end;

procedure leer(VAR A:arbol);
var
	num:integer;
begin
	A:=nil;
	write('Ingrese num'); readln(num);
	while (num <> CORTE) do begin
		crearArbol(A, num);
		write('Ingrese num'); readln(num);
	end;
end;
(*teo3ej2*)
procedure imprimirArbol(A:arbol);
begin
	if (A <> nil) THEN BEGIN
		imprimirArbol(A^.LS);
		writeln(A^.ele);
		imprimirArbol(A^.RS);
	end;
end;

(*teo3ej3*)
procedure multiplicarArbol(A:arbol);
begin
	if (A <> nil) THEN BEGIN
		multiplicarArbol(A^.LS);
		A^.ele:= A^.ele * 2;
		multiplicarArbol(A^.RS);
	end;
end;

(*ej4*)
procedure maximo(var max:integer; elemento:integer);
begin
	if (elemento > max) then
		max:= elemento;
end;

procedure recorrerArbol(a:arbol; var max:integer);
begin
	if (a <> nil) then begin
		recorrerArbol(a^.RS, max);
		maximo(max, A^.ele);
	end;
	

end;
(*PROG PRINCIPAL*)
VAR
	a:arbol;
	max:integer;
BEGIN
	max:= -55;
	leer(a);
	imprimirArbol(a);
	multiplicarArbol(a);
	recorrerArbol(a, max);
	writeln('EL MAXIMO FUE: ', max);
END.
