program clase2ej3;
type




	

	listaNums = ^nodo;	
	nodo = record
		ele:integer;
		sig:listaNums;
	
	end;
	
	
procedure cargarListaRecu(var pri:listaNums);
var
	nuevo:listaNums;
	num:integer;
begin
	num:= random(10);
	if (num <> 0)then begin
		cargarListaRecu(pri);
		new(nuevo);
		nuevo^.ele:= num;
		nuevo^.sig:= pri;
		pri:=nuevo;
	end
	else if (num = 0) then
		pri:= nil;
end;

procedure maxiRecu(pri:listaNums;var max:integer);
begin
  if (pri <> nil) then begin
    if (pri^.ele > max) then 
      max := pri^.ele;
    maxiRecu(pri^.sig,max);  
    end;
      
end;


procedure minimoRecu(pri:listaNums ;var min:integer);
begin
  if (pri <> nil) then begin
    if (pri^.ele < min) then 
      min := pri^.ele;
    minimoRecu(pri^.sig,min);  
    end;
      
end;

procedure estaElNum(pri:listaNums; num:integer; var esta:boolean);
begin
	if ((pri <> nil) AND (num <> pri^.ele))then begin
		estaElNum(pri^.sig, num, esta);
	end
	else if (pri <> nil) then
		esta:=true;
end;


VAR
	pri:listaNums;
	min,max : integer;
	esta: boolean;
BEGIN
	esta:= false;
	Randomize;
	min := 99;
	max := -99;
	cargarListaRecu(pri);
	minimoRecu(pri,min);
	maxiRecu(pri,max);
	writeln('EL MAXIMO ES: ',max);
	writeln('EL MINIMO ES: ',min);
	estaElNum(pri, 7, esta);
	writeln('ESTA ESTA? : ',esta);
END.

