program semana1Ej3;
const
	corte = 0;
	dimF = 8;
type
	subRubro = 1..dimF;
	
	producto = record
		cod:integer;
		codRubro:subRubro;
		precio:Real
	end;

	listaProductos = ^nodo;
	nodo = record
		ele:producto;
		sig:listaProductos;
	end;
	
	vProductos = array[subRubro]of listaProductos;
	
	vRubro3 = array[1..30]of producto;
	
		
	//almacenar los productos ordenados por cod.
	//y agrupados por rubro.
	
	
procedure leerProductos(var vec:vProductos;);	
var
	i:subRubro;
	nuevo:listaProductos;
	prod:producto;
begin
	write('ingrese cod, codRubro, precio'); readln(prod.cod); readln(prod.codRubro); readln(prod.precio);
	new(nuevo); nuevo^.ele:=prod; nuevo^.sig:=nil;
	while (prod.precio <> 0) do begin
		if (vec[prod.codRubro] = nil) then
			vec[prod.codRubro]:= nuevo
		else
			nuevo^.sig:= vec[prod.codRubro];
		vec[prod.codRubro]:= nuevo;
		write('ingrese cod, codRubro, precio'); readln(prod.cod); readln(prod.codRubro); readln(prod.precio);
	end;
	imprimirVec(vec);
end;

procedure imprimirVec(vec:vProductos);
var

begin
	for i:=1 to dimF do begin
		while (vec[i] <> nil) do begin
			writeln('Codigo, rubro, y precio:', vec[i].cod, ' - ', vec[i].codRubro, ' - ', vec[i].precio); 
			vec[i]:= vec[i]^.sig;
		end;
	end;
end;
	
procedure cargarvRubro3(var vecR:vRubro3; var dimL:integer; vec:vProductos);
begin
	dimL:= 0;
	while (v[3] <> nil) and (dimL < 30) do begin
		dimL:= dimL+1;
		vecR[dimL]:= vec[3]^.ele;
		vec[3]:= vec[3]^.sig;
	end;
end;
	
	
	
VAR

BEGIN
	
	
END.

