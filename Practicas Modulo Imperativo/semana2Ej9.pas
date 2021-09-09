{miquigz}
program semana2Ej9;
type 
	arbol = ^nodo;
	nodo = record
		ele:string;
		LS:arbol;
		RS:arbol;
	end;


procedure generarArbol(var a:arbol; nombre:string);
begin
	if (a = nil) then begin
		new(a); a^.RS:= nil; a^.LS:= nil; a^.ele:= nombre;
	end
	else if (a^.ele < nombre) then
		generarArbol(a^.LS, nombre)
	else
		generarArbol(a^.RS, nombre);
end;

procedure leerNombres(var a:arbol);
var
	nombre:string;
begin
	writeln('ingrese nombre'); readln(nombre);
	while (nombre <> 'ZZZ') do begin
		generarArbol(a, nombre);
		writeln('ingrese nombre'); readln(nombre);
	end;
end;

function buscarNombre(a:arbol; nombre:string):boolean;
begin
	if (a = nil) then
		encontre:false
	else if (nombre > )



end;


(*Programa Principal*)
VAR
	

BEGIN
	
	
END.
