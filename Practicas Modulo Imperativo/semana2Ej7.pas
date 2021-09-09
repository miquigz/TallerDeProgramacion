{miquigz}
program semana2Ej7;

procedure equivalenteBinario(numero:integer; binario:string);
begin
	if (numero <> 0) then
		binario:= binario + 'awsda';
end;

procedure equivalenteBinario(numero:integer);
begin
	if (numero < 2) then begin
		equivalente:= numero;
end;



VAR
	binario:string;
	numero:integer;

BEGIN
	binario:= '';
	numero:=12;
	equivalenteBinario(numero, binario);
	writeln(binario);
END.
