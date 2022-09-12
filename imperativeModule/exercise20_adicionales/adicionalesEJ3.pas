{
3.- Un supermercado requiere el procesamiento de sus productos. De cada producto se conoce código, rubro (1..10), stock y precio unitario. Se pide:
a)	Generar una estructura adecuada que permita agrupar los productos por rubro. A su vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo más eficiente posible. La lectura finaliza con el código de producto igual a -1..
b)	Implementar un módulo que reciba la estructura generada en a), un rubro y un código de producto y retorne si dicho código existe o no para ese rubro.
c)	Implementar un módulo que reciba la estructura generada en a), y retorne, para cada rubro, el código y stock del producto con mayor código.
d)	Implementar un módulo que reciba la estructura generada en a), dos códigos y retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores ingresados.
}
program adicionalesEJ3;
const
	dimF = 10;
type
	subRubo	= 1..dimF;
	
	producto = record
		cod:integer;
		stock:integer;
		precio:real;
	end;

	arbProductos = ^nodo;
	nodo = record
		ele:producto;
		HI:arbProductos;
		HD:arbProductos;
	end;
	
	vecArbol = array[subRubro]of arbProductos; 
	
	//Punto C
	prodMax = record
		cod:integer;
		stock:integer;
	end;
	
	vecMaximos = array[subRubro] of prodMax;
	
//Punto A
procedure leerProducto(var prod:producto; var rubro:subRubro);
begin
	//leer
end;

procedure inicializarVec(var vec:vecArbol);
var i:integer;
begin
	for i:=1 to dimF do
		vec[i]:= nil;
end;

procedure arbolRecu(var arb:arbProductos; prod:producto);
begin
	if (arb = nil) then begin
		new(arb); arb^.ele:= prod; arb^.HI:= nil; arb^.HD:= nil;
	end else if (arb^.ele.codigo > prod.cod) then
		arbolRecu(arb^.HI, prod)
	else
		arbolRecu(arb^.HD, prod);
end;

procedure cargarArboles(var vec:vecArbol);
var
	rubro:integer;
begin
	leerProducto(prod, rubro);
	while( prod.cod <> -1) do begin
		arbolRecu(vec[rubro], prod);
		leerProducto(prod, rubro);
	end;
end;

//Punto B
procedure hallarCod(vec:vecArbol; rubro:subRubro; cod:integer; var existe:boolean);
begin
	if (vec[rubro] <> nil) then begin
		if (vec[rubro]^.ele.cod = cod) then
			existe:= true;
		else if (vec[rubro]^.ele.cod > cod) then
			hallarCod(vec, rubro, cod, existe)
		else if (vec[rubro]^.ele.cod < cod) then
			hallarCod(vec, rubro, cod, existe);
	end;
end;
//Punto C
procedure inicializarVecMaximos(var vecM:vecMaximos);
var i:integer
begin
	for i:= 1 to dimF do
		vec[i]:= -999;
end;

procedure mayorCodRecu(arb:arbProductos; var prodM;prodMax);
begin
	if (arb^.HD <> nil)then begin
		mayorCodRecu(arb^.HD, vecM);
	end;
	if (arb^.HD = nil) then begin
		prodM.cod:= arb^.ele.cod;
		prodM.stock:= arb^.ele.stock;
	end;
end;

procedure hallarMaximosCod(vec:vecArbol; var vecMaxi:vecMaximos);
var i:integer;
begin
	for i:=1 to dimF do
		mayorCodRecu(vec[i], vecMaxi[i]);
end;

procedure imprimirMaxCod(vecMaxi:vecMaximos);
var i:integer;
begin
	for i:= 1 to dimF do
		writeln('en el rubro:',i, 'el codigo max:', vecMaxi[i].cod,' stck:',vecMaxi[i].stock);
end;

//Punto D
procedure entreXYrecu(arb:arbProductos; x:integer; y:integer; var cantEntre:integer);
begin
	if (arb <> nil) then begin
		if ( (arb^.ele.cod >= x) AND (arb^.ele.cod <= y) ) then begin
			cantEntre:= cantEntre + 1;
			entreXYrecu(arb^.HI, x, y, cantEntre);
			entreXYrecu(arb^.HD, x, y, cantEntre);
		end else if (arb^.ele.cod < x) then
			entreXYrecu(arb^.HD, x, y, cantEntre);
		end else if (arb^.ele.cod > y) then
			entreXYrecu(arb^.HI, x, y, cantEntre);
		end;
	end;
end;

procedure entreXY(vec:vecArbol);
var
	x, y, cantEntre, i:integer;
begin
	writeln('Ingrese valor x'); readln(x);
	writeln('Ingrese valor y'); readln(y);
	for i:= 1 to dimF do begin
		cantEntre:= 0;
		entreXYrecu(vec[i], x, y, cantEntre);
		writeln('La cantidad de valors entre:', x,' y ', y,' es:', cantEntre);
	end;
end;

//Programa Principal
VAR
	vec:vecArbol;
	existe:boolean;
	cod:integer;
	rubro:subRubro;
	vecM:vecMaximos;
BEGIN
	inicializarVec(vec);
	cargarArboles(vec);
	//Punto B
	writeln('Ingrese un valor entre 1 y 10 (rubro)'); readln(rubro);
	writeln('Ingrese codigo a buscar'); readln(cod);
	existe:= false;
	hallarCod(vec, rubro, cod, existe);
	if (existe)then
		writeln('Valor hallado, (codigo)');
	else
		writeln('Codigo de producto no hallado');
	//Punto C
	inicializarVecMaximos(vecM);
	hallarMaximosCod(vec, vecM);
	imprimirMaxCod(vecM);
	//Punto D
	entreXY(vec);
END.
