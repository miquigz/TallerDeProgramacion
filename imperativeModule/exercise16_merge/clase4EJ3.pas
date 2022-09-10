{3.	Implementar un programa que procese la información de las ventas de productos de una librería que tiene 4 sucursales. De cada venta se lee fecha de venta, código del producto vendido, código de sucursal y cantidad vendida. El ingreso de las ventas finaliza cuando se lee el código de sucursal 0. Implementar un programa que:
a.	Almacene las ventas ordenadas por código de producto y agrupados por sucursal, en una estructura de datos adecuada.
b.	Contenga un módulo que reciba la estructura generada en el punto a y retorne una estructura donde esté acumulada la cantidad total vendida para cada código de producto.
}
program clase4ej3;
const
	dimF = 4;
type
	subSucu = 1..dimF;
	venta = record
		fecha:string;
		cod:integer;
		cant:integer;
	end;
	
	listaVentas = ^nodo;
	nodo = record
		ele:venta;
		sig:listaVentas;
	end;	
	vecVentas = array[subSucu] of listaVentas;
	
procedure leerVenta(var vent:venta; var sucu:integer);
begin
	//leer registro
end;

procedure inicializarVec();
begin
	//poner nil incializar
end;

procedure insertarOrdenado(var pri:listaVentas; vent:venta );
var
	nuevo, act, ant;
begin
	new(nuevo); nuevo^.ele:= vent;
	act:= pri;
	while (act <> nil AND act^.ele.cod < vent.cod ) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = pri)then
		pri:= nuevo
	else
		ant^.sig:= nuevo;
	nuevo^.sig:= act;
end;

procedure cargarVenta(var vec:vecVentas);
var
	sucu:integer;
	vent:venta;
begin
	leerVenta(vent, sucu);
	while (sucu <> 0) do begin
		insertarOrdenado(vec[sucu], vent);
		leerVenta(vent, sucu);
	end;
end;

procedure agregarAtras(var pri:listaVentas; vent:venta);
var
	nuevo, act:listaVentas;
begin
	new(nuevo); nuevo^.ele:= vent; nuevo^.sig:= nil;
	if (pri <> nil ) then begin
		act:= pri;
		while (act^.sig <> nil) do
			act:= act^.sig;
		act^.sig:= nuevo;
	end else
		pri:= nuevo;
end;

procedure mergeAcumulador(vec:vecVentas; var pri:listaVentas);
var
	minAux:venta;
begin
	pri:= nil;
	minAux.cod:= valorGrande;
	while (minAux.cod <> valorGrande)do begin
		act:= minAux;
		while (minAux.cod = act.cod )do begin
			act.cant:= act.cant + minAux.cant;
			minimo();
		end;
		agregarAtras(pri, act);
	end;
end;





VAR

BEGIN
	
	
END.

