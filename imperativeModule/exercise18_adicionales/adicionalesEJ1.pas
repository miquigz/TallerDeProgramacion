program adicionalesEJ1;
const
	dimF = 300;
type
	oficina = record
		cod:integer;
		dni:integer;
		valor:real;
	end;

	vOficinas = array [1..dimF] of oficina;
	
procedure leerOficina(var ofi:oficina );
begin
	// sel ee
end;

procedure cargarOfi(var vec:vOficinas; var dimL:integer);
var
	ofi:oficina;
begin
	dimL:= 0;
	leerOficina(ofi);
	while (dimL < dimF) do begin
		dimL:= dimL + 1;
		vec[dimL]:= ofi; 
		leerOficina(ofi);	
	end;
end;

procedure ordenarSeleccion(var vec:vOficinas;  dimL:integer );
var
	i,j, pos:integer;
	ele:oficina;
begin
	for i:=1 to dimL-1 do begin
		pos:= i;
		for j:= i+1 to dimL do
			if (vec[j].cod < vec[pos].cod) then
				pos:= j;
		ele:= vec[pos];
		vec[pos]:= vec[i];
		vec[i]:= ele;			
	end;
end;

procedure buscarDico(var vec:vOficinas; dimL:integer; valorBuscar:integer; var ok:boolean);
var 
    pri, ult, medio: integer;
begin
	ok:= false;
	pri:= 1;  ult:= dimL;  medio:= (pri + ult ) div 2 ;
	while  ( pri < = ult ) and ( valorBuscar <> vec[medio].cod) do begin
		if ( valorBuscar < vec[medio].cod ) then 
			ult:= medio - 1 ;
		else
			pri:= medio+1 ;
		medio:= ( pri + ult ) div 2 ;
	end;
	if (pri <= ult) and (valorBuscar = vec[medio].cod) then //salgo del while
		ok:=true;
		writeln('DNI Del propetario de la ofi', vec[medio].dni); 
end;

//inicializar expensas
//inicializar indice
//despues de llamar a este modulo,llamas a expensas con write
procedure expensasRecu(vec:vOficinas; var indice:integer;  var expensas:integer; dimL:integer);
begin
	if (indice <= dimL) then begin
		expensas:= vec[indice].valor + expensas;
		expensasRecu(vec, indice+1, expensas, dimL)
	
	end;

end;
{
Procedure buscarDico(var vec: números; dimL: integer; 
bus: integer; var ok : boolean);
var 
    pri, ult, medio : integer;
begin
     ok:= false;
     pri:= 1 ;  ult:= dimL;  medio := (pri + ult ) div 2 ;

     While  ( pri < = ult ) and ( bus <> vec[medio]) do 
       begin
         if ( bus < vec[medio] ) then 
           ult:= medio -1 ;
         else pri:= medio+1 ;
         medio := ( pri + ult ) div 2 ;
       end;
     if (pri <=ult) and (bus = vec[medio]) then ok:=true; 
  end;
}


VAR

BEGIN
	
	
END.

