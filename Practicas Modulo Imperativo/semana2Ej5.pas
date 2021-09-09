program semana2Ej5;
const
	dimF = 5; //es 20
type
	vEnteros = array[1..dimF] of integer;
(*A*)
procedure cargarVector(var vec:vEnteros);
var
	i, num:integer;
begin
	for i:=1 to dimF do begin
		writeln('Ingrese numero');
		readln(num);
		vec[i]:= num;
	end;
end;
(*B*)
procedure maximo(vec:vEnteros; var max:integer; var i:integer);
begin
	if (i+1 < dimF) then begin
		i:=i+1;
		if (vec[i] > max) then
			max:= vec[i];
		maximo(vec, max, i);
	end;
end;
(*C*)
procedure sumaVector(vec:vEnteros; var suma:integer; var i:integer);
begin
	if (i < dimF) then begin
		i:= i+1;
		suma:= vec[i] + suma;
		sumaVector(vec, suma, i);
	end;
end;
(*Prog principal*)
VAR
	vec:vEnteros;
	max,i, suma:integer;
BEGIN
	cargarVector(vec);
	i:=0;
	maximo(vec, max, i);
	writeln('el max del vector fue:', max);
	i:=0; suma:=0;
	sumaVector(vec, suma, i);
	writeln('La suma total fue:', suma);
END.
