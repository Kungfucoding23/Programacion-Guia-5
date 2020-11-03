{3. Dado un arreglo y un número K, cambiar todas las ocurrencias de K por 0}
program Ej3;
uses
    crt;
type
  vec = array[1..100] of integer;
var
  V: vec;
  k, n: integer;
  i: byte;
begin
  writeln('Ingrese la cantidad de elementos del vector <= 100'); readln(n);
  for i:= 1 to n do
  begin
    writeln('Ingrese el elemento ',i); readln(V[i]);
  end;
  for i:= 1 to n do
      write(V[i] : 2);
  writeln('Ingrese el valor de k '); readln(k);
  for i:= 1 to n do
  begin
    if V[i] = k then
       V[i]:= 0;
  end;
  for i:= 1 to n do
  begin
    write(V[i], ' ');
  end;
  readln();
end.

