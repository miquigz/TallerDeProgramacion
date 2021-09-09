{semana2teo2}
{Modificar algoritmo de impresion preOrden, para que sume todos los nodos del arbol.}
program semana2teo2;
const
	CORTE = -1;
type
	arbol=^nodo;
	nodo=record
		ele:integer;
		LS:arbol;//leftSon
		RS:arbol;//RightSon
	end;
	
procedure crearArbol(var A:arbol; num:integer);
begin
	if (A=nil)then begin
		new(A);
		A^.ele:=num; A^.RS:= nil; A^.LS:= nil;
	end
	else if(num < A^.ele) then
		crearArbol(A^.LS, num)
	else
		crearArbol(A^.RS, num);
end;

procedure enOrden(a:arbol; var sumaTotal:integer);
begin
	if(a <> nil) then begin
		enOrden(a^.LS, sumaTotal);
		sumaTotal:= a^.ele + sumaTotal;
		enOrden(a^.RS, sumaTotal);
	end;
end;

VAR
	A:arbol;
	sumaTotal, num:integer;
BEGIN
	sumaTotal:=0;
	A:=nil;
	write('Ingrese num'); readln(num);
	while (num <> corte) do begin
		crearArbol(A, num);
		write('Ingrese num'); readln(num);
	end;
	enOrden(A, sumaTotal);
	writeln('La suma es: ', sumaTotal);
END.
