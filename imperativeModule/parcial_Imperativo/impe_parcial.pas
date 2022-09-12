{				Parcial - Modulo Imperativo -
Se requiere implementar un programa para administrar una impresora de red, la que almacenará en
su memoria datos estadísticos sobre impresiones realizadas por los usuarios. Se pide:

a) Leer información de impresiones (nombre del documento, páginas, tamaño en KB, nombre del
Usuario) y generar una estructura eficiente para la búsqueda por usuario, que guarde para cada
usuario la cantidad total de documentos impresos, la cantidad total de páginas impresas y el
nombre del último documento impreso. La lectura es en orden temporal y finaliza con tamaño O

A partir de la estructura generada en a), realice módulos independientes para:

b) Obtener la información del usuario que imprimió más documentos en total.

c) Generar una estructura con los últimos documentos impresos de los usuarios con nombre
comprendido entre dos valores, sabiendo que como máximo son 20. La estructura debe guardar

nombre de usuario y su último documento impreso, y quedar ordenada por nombre de usuario.

El programa debe invocar a los módulos realizados, mostrar las estructuras generadas e información obtenida.}
program parcialIMPERATIVO;
const
	dimF = 20;
type
	impresiones = record
		name:string;
		pages:integer;
		kb:integer;
		user:string;
	end;

	listaImpresiones = ^nodoList;
	nodoList = record
		ele:impresiones;
		sig:listaImpresiones;
	end;
		

	usuarioImpre = record
		user:string;
		docTotal:integer;
		pagesTotal:integer;
		ultDoc:string;
	end;

	arbolUserImpre = ^nodo;
	
	nodo = record
		ele:usuarioImpre;
		HI:arbolUserImpre;
		HD:arbolUserImpre;
	end;

	ultimosDocs = record
		name:string;
		user:string;
	end;

	vecDocumentos = array[1..dimF]of ultimosDocs;

//Punto A
procedure leerImpresiones(var impre:impresiones);
begin
	//leer registro
end;

procedure insertarOrdenado(var pri:listaImpresiones; impre:impresiones);
var
	act, nuevo, ant:listaImpresiones;
begin
	new(nuevo); nuevo^.ele:= impre;
	act:= pri;
	while (act <> nil) AND (act^.ele.user < impre.user) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = pri) then
		pri:=nuevo
	else
		ant^.sig:= nuevo;
	nuevo^.sig:= act;
end;

procedure arbolRecu(var arb:arbolUserImpre; usuarioImpresion:usuarioImpre);
begin
	if (arb = nil)then begin
		new(arb); arb^.ele:= user; arb^.HI:= nil; arb^.HD:= nil;
	end else if (arb^.ele.user > usuarioImpresion.user) then begin
		arbolRecu(arb^.HI, usuarioImpresion)
	end else if (arb^.ele.user < usuarioImpresion.user)then
		arbolRecu(arb^.HD, usuarioImpresion);
	end;
end;

procedure cargarArbol(var arb:arbolUserImpre);
var
	impre:impresiones;
	userImpre:usuarioImpre;
	pri:listaImpresiones;
begin
	pri:= nil;
	leerImpresiones(impre);
	while (impre.tam <> 0) do begin
		insertarOrdenado(pri, impre); //Inserto ordenado por usuario
		leerImpresiones(impre);
	end;
	
	while (pri <> nil) do begin
		usuarioImpre.user:= pri^.ele.user;
		usuarioImpre.docTotal:= 0; usuarioImpre.pagesTotal:= 0;
		while (usarioImpre = pri^.ele.user) do begin //Aprovechando la lista ordenada, hacemos un corte de control por user.
			usuarioImpre.docTotal:= usuarioImpre.docTotal + 1;
			usuarioImpre.pagesTotal:= usuarioImpre.pagesTotal + pri^.ele.pages;
			usuarioImpre.ultimoDoc:= pri^.ele.name; //Ultimo valor, sera el nombre del documento.
			pri:= pri^.sig; //IMPORTANTE avanzar en la lista.
		end;
		arbolRecu(arb, usuarioImpre); //Cargamos con la totalidad de impresiones del userActual(usuarioImpre).
	end;
end;
//Punto B

procedure maxDocumentos(arb:arbolUserImpre; var maxDoc:usuarioImpre);
begin
	if (arb <> nil)then begin
		if (arb^.ele.docTotal > maxDoc.docTotal)then
			maxDoc:= arb^.ele;
		maxDocumentos(arb^.HI, maxDoc);
		maxDocumentos(arb^.HI, maxDoc);
	end;
end;

//Punto C

//DimL inicializada en 0
procedure cargarVecENTREXY(arb:arbolUserImpre; var vec:vecDocumentos; var dimL:integer; x:string; y:string);
begin
	if ( (arb <> nil) AND (dimL < 20) ) then begin
		if ( (arb^.ele.ultimoDoc > x) AND (arb^.ele.ultimoDoc < y) )then begin
			dimL:= dimL + 1;
			vec[dimL].user:= arb^.ele.user; vec[dimL].name:= arb^.ele.ultDoc;
			cargarVecENTREXY(arb^.HI, vec, dimL, x, y)
			cargarVecENTREXY(arb^.HD, vec, dimL, x, y)
		end
		else if (arb^.ele.ultimoDoc < x) then
			cargarVecENTREXY(arb^.HD, vec, dimL, x, y)
		else if (arb^.ele.ultimoDoc > y) then
			cargarVecENTREXY(arb^.HI, vec, dimL, x, y);		
	end; 
end;

//Programa Principal
VAR
	maxDoc:usuarioImpre;
	arb:arbolUserImpre;
	dimL:integer;
	vec:vecDocumentos;
BEGIN
	//Punto A
	cargarArbol(arb);
	//Punto B
	maxDoc.docTotal:= -99;
	maxDocumentos(arb, maxDoc);
	//Punto C
	dimL:= 0;
	x:= 'c'; y:= 't';
	cargarVecENTREXY(arb, vec, dimL, x, y);
END.
