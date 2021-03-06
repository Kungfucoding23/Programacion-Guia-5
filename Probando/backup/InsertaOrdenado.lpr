program InsertaOrdenado;
type
  TV = array[1..50] of integer;
var
  V: TV;
  N: byte;
  X: integer;
Procedure ingresaVector(var V: TV; var N: byte);
var
  i: byte;
begin
  for i:= 1 to N do
  begin
    writeln('Ingrese el elemento ',i); readln(V[i]);
  end;
end;

Procedure insertaOrdenado(var V: TV; var N: byte; X: integer);
var
  j: byte;
begin
  j:= N;
  while (j > 0) and (V[j] > X) do
  begin
    V[j + 1]:= V[j];
    j:= j - 1;
  end;
  V[j + 1]:= X;
  N:= N + 1;
end;
Procedure show(V: TV; N: byte);
var
  i: byte;
begin
  for i:= 1 to N do
      write(V[i]:2:2,' ');
end;
begin
  writeln('Ingrese la cantidad de elementos'); readln(N);
  ingresaVector(V, N);
  show(V, N);
  writeln();
  writeln('Ingrese el elemento que desea ingresar'); readln(X);
  insertaOrdenado(V, N, X);
  writeln();
  show(V, N);
  writeln();
  writeln('==========================');
  readln();
end.

