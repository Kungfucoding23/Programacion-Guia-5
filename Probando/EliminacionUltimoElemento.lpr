program EliminacionEinsercion;
uses
    crt;
type
  TV = array[1..20] of integer;
var
  V: TV;
  N: byte;
  pos: byte;
  X: integer;
Procedure ingresaVec(var V: TV; N: byte);
var
  i: byte;
begin
  for i:= 1 to N do
  begin
    writeln('Ingrese el elemento ',i); readln(V[i]);
  end;
  clrscr();
end;

Procedure Elimina(var V: TV; var N: byte; pos: byte);
var
  i: byte;
begin
  for i:= pos + 1 to N do
      V[i - 1]:= V[i];
  N:= N - 1;
end;
Procedure inserta(var V: TV; var N: byte; pos: byte; X: integer);
var
  i: byte;
begin
  for i:= N downto pos do
      V[i + 1]:= V[i]; // corre los elementos hacia la derecha
  V[pos]:= X;
  N:= N + 1;
end;

Procedure show(V: TV; N: byte);
var
  i: byte;
begin
  for i:= 1 to N do
      write(V[i],' ');
end;
begin
  writeln('Ingrese la cantidad de elementos que tendra el arreglo'); readln(N);
  writeln('Ingrese la posicion que desea eliminar'); readln(pos);
  ingresaVec(V, N);
  writeln('El arreglo ingresado es: ');
  show(V, N);
  writeln();
  Elimina(V, N, pos);
  writeln('Eliminando el elemento...');
  writeln('===========================================');
  show(V, N);
  writeln();
  writeln('===========================================');
  writeln('Ingrese el elemento que desea ingresar en la posicion ingresada'); readln(X);
  inserta(V, N, pos, X);
  writeln('====================');
  show(V, N);
  readln();

end.

