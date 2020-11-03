{4. Se pide compactar un arreglo (eliminar los ceros que contiene) generando otro arreglo.}
program Ej4;
uses
    crt;
type
  vec = array[1..100] of integer;
var
  V, C: vec;
  n: integer;
Procedure leeVector(var V: vec; var n: integer);
var
  i: byte;
begin
  writeln('Ingrese la cantidad de elementos <= 100'); readln(n);
  for i:= 1 to n do
  begin
    writeln('Ingrese el elemento ',i); readln(V[i]);
  end;
end;
Procedure elimina(var V: vec; var n: integer);
var
  i, k, cont: byte;
  c: vec;
begin
  cont:= 0;
  k:= 1;
  i:= 1;
  while (i < n) do
  begin
       while k <= (n - cont) do
       begin
            if (V[i] <> 0) then
            begin
                 C[k]:= V[i];
                 k:= k + 1;
            end
            else
            cont:= cont + 1; // cuenta los ceros
            i:= i + 1;
       end;
       for k:= 1 to (n - cont) do
            writeln(C[k] : 5);
  end;
end;
begin
  leeVector(V, n);
  clrscr();
  elimina(V, n);
  readln();
end.

