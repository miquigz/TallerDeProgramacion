{miquigz}
program semana2Ej6;
const
	dimF = 20;
type
	indice = -1..dimF;
	vEnteros = array[1..dimF]of integer;

procedure cargarVectorORDENADO(vec:vEnteros); //se dispone
begin 
end;
{procedure cargarVector(var vec:vEnteros);
var
	i, num:integer;
begin
	for i:=1 to dimF do begin
		writeln('Ingrese numero');
		readln(num);
		vec[i]:= num;
	end;
end;}

procedure busquedaDicotomica(vec:vEnteros; ini,fin:indice; dato:integer; var pos:indice);
begin
	pos:= (ini + fin) div 2;
	while (ini <= fin) and (dato <> vec[pos]) do begin
		if (dato < vec[pos]) then
			fin:= pos - 1
		else
			ini:= pos + 1;
		pos:= (ini + fin) div 2;
	end;
	if (ini <= fin) and (dato = vec[pos])then
		writeln('Encontre el dato en la posicion:', pos)
	else
		pos:= -1;
end;

(*Programa principal*)
VAR
	vec:vEnteros;
	ini,fin,pos:indice;
	dato:integer;
BEGIN
	cargarVectorORDENADO(vec); //se dispone
	ini:=1;
	fin:=dimF;
	writeln('Ingrese dato a buscar'); readln(dato);
	busquedaDicotomica(vec,ini,fin,dato,pos);
END.
