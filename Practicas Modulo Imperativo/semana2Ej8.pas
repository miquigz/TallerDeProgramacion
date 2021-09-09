{miquigz}
program semana2Ej8;
const
	CORTE = 0;
type
	
	arbol = ^nodo;
	nodo = record
		ele:integer;
		LS:arbol;
		RS:arbol;
	end;
(*A*)
procedure cargarArbol(var a:arbol; num:integer);
begin
	if (a = nil) then begin
		new(a); a^.RS:= nil; a^.LS:= nil; a^.ele:= num;
	end
	else if (num < a^.ele) then
		cargarArbol(a^.LS)
	else
		cargarArbol(a^.RS);
end;
	
procedure leerNumeros(var a:arbol);
var
	num:integer
begin
	writeln('ingrese num'); readln(num);
	while (num <> CORTE) do begin
		cargarArbol(a, num);
		writeln('ingrese num'); readln(num);
	end;
end;
(*B*) //CAMBIAR
procedure maximo(a:arbol; var max:integer); //cambiar SOLO HAY QUE RECORRER.
begin
	if (a <> nil) then begin
		if (a^.RS <> nil) then begin
			if (a^.ele > max) then
				max:= a^.ele;
			maximo(a^.RS, max);
		end;
		else if (a^.)
			max:= a^.ele;
	end;
end;

procedure minimo(a:arbol; var min:integer);
begin
	if (a <> nil) then begin
		if (a^.ele < min) then
			min:=a^.ele;
		minimo(a^.LS, min);
	end;
end;

procedure recorrer(a:arbol; var cantEle:integer);
begin
	if (a <> nil) then begin
		recorrer(a^.LS);
		cantEle:= cantEle + 1;
		recorrer(a^.RS);
	end;
end;

procedure informarCreciente(a:arbol);
begin
	if (a <> nil) then begin
		informar(a^.LS);
		writeln(a^.ele);
		informar(a^.RS);
	end;		
end;

procedure informarDecreciente(a:arbol);
begin
	if (a <> nil) then begin
		informar(a^.RS);
		writeln(a^.ele);
		informar(a^.LS);
	end;		
end;

(*Principal*)
VAR
	a:arbol;
	max, min,cantEle:integer
BEGIN
	max:=-55; min:=999; cantEle:=0;
	a:=nil;
	leerNumeros(a);
	maximo(a,max);
	minimo(a,min);
	recorrer(a, cantEle);
	informarCreciente(a);
	informarDecreciente(a);
END.

