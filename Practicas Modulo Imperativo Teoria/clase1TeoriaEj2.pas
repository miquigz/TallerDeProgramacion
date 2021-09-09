program clase1TeoriaEj2;
const
	dimF = 20;
	corte = -1;
type
	participante = record
		cod:integer;
		edad:integer;
	end;
	
	indice = 0..dimF;
	
	vParticipantes = array[1..dimF]of participante;

(**)	
procedure leerParticipantes(var vec:vParticipantes; var dimL:indice);
var
	parti:participante;
begin
	dimL:=0;
	write('ingrese participante'); readln(parti.cod); readln(parti.edad);
	while (dimL < dimF) AND (num <> corte) do begin
		dimL:= dimL + 1;
		vec[dimL]:= participante;
		write('ingrese participante'); readln(parti.cod); readln(parti.edad);
	end;
end;

(**)
procedure imprimirVector(vec:vParticipantes; dimL:indice);
var
	i:indice;
begin
	for i:=1 to dimL do begin
		writeln(vec[i].cod);
		writeln(vec[i].edad);
	end;
end;
(*insercion*)
procedure ordenarVector(vec:vParticipantes; var vecOrdenado:vParticipantes; var dimL:indice);
var
	i, j:indice;
	actual:integer;
begin
	for i:=2 to dimL do begin
		actual:= vec[i].edad; //actual edad, actual es 16
		j:= i-1; // j es i 1, supongamos que 17
		while (j > 0) AND (vec[j].edad > actual) do begin //j es mayor q actual
			vec[j+1].edad:= vec[j].edad; //por ende, vec[2]:= es igual a 17(Ya que es mayor q 16)
			j:= j-1; //disminuyo j, j pasa a ser 1.
		end;
		v[j+1].edad:= actual; //aca guardo el actual, que vendria a ser vec[2]:= 16;
	end;//si no se cumpliese la condicion, no pasaria nada, y seguiria el for recorriendo.
	// notemos, que j se disminuye al entrar al while (y en el primer for siempre). Si entra al while
// se disminuye 2 veces, por ende, el actual lo guardamos siempre, si no entra al while lo guardamos en la pos actual.
	vecOrdenado:= vec;
end;

procedure recorrer(var vecOrdenado:vParticipantes; var dimL:indice;);
var
	i:indice;
begin
	for i:=1 to dimL do begin
		if (vec[i].edad >= 20) AND ( vec[i].edad <= 22) then
			eliminarNum(vec, dimL, i);
	end;
end;


(*Modulo 3*) //si le pasaba un num:integer integer no me va a andar.
procedure eliminarNum(var vec:vNums; var dimL:indice; num:indice); //el num es el indice q recibe este modulo
var
	i:indice;
begin
	for i:= num to dimL-1 do begin
		vec[i]:= vec[i+1];
		dimL:= dimL-1;
	end;
end;

procedure insertarOrdenado(vecOrdenado:vParticipantes; dimL:indice; var pri:listaParticipantes;);
var
	i:indice;
	nuevo, ant, act:listaParticipantes;
begin
	new(nuevo); nuevo^.sig:= nil; nuevo^.ele.edad:= vec[i]; nuevo^.ele.cod:= vec[i];
	
	while ();
	
	if (pri = nil) then
		pri:=nuevo
	else
		pri^.sig:=
		
		
end;







VAR

BEGIN
	
	
END.

