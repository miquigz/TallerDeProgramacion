{ 2.	Escribir un programa que:
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de producto 0. Un producto puede estar en más de una venta. 
* Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. Cada nodo del árbol debe contener el código de producto y la cantidad total vendida.
    Nota: El módulo debe retornar los dos árboles.
b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.
c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.
}
program clase3ej2;
type

	ventas = record
		cod:integer;
		fecha:string;
		cant:integer;
	end;
	
	ventaTotal = record
		cod:integer;
		cantTotal:integer;
	end;

	arbolVentas = ^nodo;
	nodo = record
		ele:ventas;
		HI:arbolVentas;
		HD:arbolVentas;
	end;
	
	arbolVentasTotales = ^nodo2;
	nodo2 = record
		ele:ventaTotal;
		HI:arbolVentasTotales;
		HD:arbolVentasTotales;
	end;
	
	
//Punto a)
procedure leerVenta(var venta:ventas);
begin
	writeln('Ingrese cod de venta');
	readln(venta.cod);
	if (venta.cod <> 0 ) then begin
		writeln('Ingrese fecha de venta');
		readln(venta.fecha);
		writeln('Ingrese cantidad de ventas vendidas');
		readln(venta.cant);	
	end;
end;

//Punto i
procedure arbolRecu(var arbolVentas; venta:ventas;);
begin
	if (arbolVentas = nil) then begin
		new(arbolVentas); arbolVentas^.ele:= venta; arbol^.HI:= nil;  arbol^.HD:= nil;
	end else if (ventas.cod < arbol^.ele.cod) then begin
		arbolRecu(arbol^.HI, venta);
	end else begin
		arbolRecu(arbol^.HD, venta);
	end;
end;

//Punto a)ii
procedure arbolRecu2(var arb2:arbolVentasTotales; venta:ventas);
begin
	if ( (arb2 <> nil) AND (arb2^.ele.cod = venta.cod) )then // "mergeo" y junto las ventas.
		arb2^.ele.cantTotal:= arb2^.ele.cantTotal + venta.cant;
	else if (arb2 = nil) then begin //Reservo memoria, asigno ele, e inicializo hijos.
		new(arb2); arb2^.ele.cantTotal:= venta.cant; arb2^.ele.cod:= venta.cod;
	end else if (arb2^.ele.cod > venta.cod) then begin
		arbolRecu2(arb2^.HI, venta);
	end else begin
		arbolRecul2(arb2^.HD, venta);
	end;
end;
//Punto a), i) , ii)
procedure generarArbol(var arbol:arbolVentas; var arb2:arbolVentasTotales);
var
	venta:ventas;
begin
	leerVenta(venta);
	while (venta.cod <> 0) do begin
		arbolRecu(arbolVentas, venta);
		arbolRecu2(arb2, venta);
		leerVenta(venta);
	end;
end;

//Punto B
procedure cantProductosA1(arb:arbolVentas; cod:integer; var totalUnidades:integer);
begin
	if (arb^.ele.cod = cod) then begin
		totalUnidades:= totalUnidades + arb^.ele.cant;
	end else if (arb^.ele.cod > cod) then begin
		cantProductosA1(arb^.HI, cod, totalUnidades);
	end else if (arb^.ele.cod < cod)then begin
		cantProductosA1(arb^.HD, cod, totalUnidades);
	end;
end;

//Punto C
procedure cantProductosA2(arb2:arbolVentasTotales; cod:integer; var totalUnidades2:integer);
begin
	if (arb2^.ele.cod = cod) then begin
		totalUnidades2:= arb2^.ele.cantTotal;
	end else if (arb2^.ele.cod > cod) then begin
		cantProductosA2(arb2^.HI, cod, totalUnidades2);
	end else begin
		cantProductosA2(arb2^.HD, cod, totalUnidades2);
	end;
end;

//Programa Principal
VAR
	arb2:arbolVentasTotales;
	arbol:arbolVentas;
	totalUnidades2, totalUnidades, cod:integer;
BEGIN
	totalUnidades2:= 0;
	totalUnidades:= 0;
	//Punto a)
	generarArbol(arbol, arb2);
	//Punto B y C
	writeln('Ingrese un codigo');
	readln(cod);
	cantProductosA1(arbol, cod, totalUnidades);
	cantProductosA2(arb2, cod, totalUnidades2);
	writeln('La cantidad de ventas total vendida fue:', totalUnidades);
	writeln('La cantidad de ventas total vendida fue:', totalUnidades2);
END.

