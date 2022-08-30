program clase2;

procedure descomponerRecu(num:integer);
var
  dig : integer;
begin
  
  if (num <> 0) then begin
    dig := num mod 10;
    descomponerRecu(num div 10);
    writeln(dig);
    end;
end;  
      


procedure leerrecursivo (var aux:integer);

begin
  writeln('Escribe un num ');
  readln(aux);
  if (aux <> 0) then begin
    descomponerRecu(aux);
    leerrecursivo(aux);
    end;
  end;




VAR
	aux: integer;
	
BEGIN
	
	leerrecursivo(aux);

END.

{
procedure descomponer (num:integer
var
  aux,dig : integer;
begin
  aux:= num;
  while (aux <> 0) do begin
    dig := aux mod 10;
    aux := aux div 10;
    

end;}
