program untitled;
CONST
	dimF= 300;
	corte = -1;
TYPE
	
	oficina = record
		cod:integer;
		dni:integer;
		valor:real;
	end;
	indice = 0..dimF;
	vOficinas = array[1..dimF] of oficina;
	
(*Modulo de Carga*)
procedure cargarVec(var vec:vOficinas; var dimL:indice;);
var
	ofi:oficina;
begin
	dimL:= 0;
	writeln(''); readln(ofi.cod); readln(ofi.dni); readln(ofi.valor);
	while (ofi.cod <> corte) and (dimL < dimF) do begin
		dimL:= dimL + 1;
		vec[dimL]:= ofi;
		writeln(''); readln(ofi.cod); readln(ofi.dni); readln(ofi.valor);
	end;
end;

procedure
var
	i, p, j:indice;
	actual:oficina;
begin
	for i:=1 to dimL-1; do begin
		p:=i;
		for j:= i+1 to dimL do
			if (vec[j].cod < vec[p].cod) then
				p:=j;
		actual:= vec[p];
		vec[p]:= vec[i];
		vec[i]:= actual;

endl

(*Ordenar mediante Insercion*)
procedure ordenarVector(var vec:vOficinas; dimL:indice);
var
	i, j:indice;
	actual:integer;
begin
	for i:=2 to dimL do begin
		actual:= vec[i].cod;
		j:= j-1;
		while ((j > 0) and(vec[i].cod > actual)) do begin
			vec[j+1].cod:= vec[j].cod;
		end;
		vec[j+1].cod:= actual;
	end;
end;

(*Programa Principal*)
VAR
	vec:vOficinas;
	dimL:indice;
BEGIN
	cargarVec(vec, dimL);
	ordenarVector(vec, dimL);
END.
