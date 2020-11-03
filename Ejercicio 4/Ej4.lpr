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
  while (i < n) do  //while que funciona como un for
  begin
       while k <= (n - cont) do  //mientras que k sea menor a el total de numeros sin los ceros
       begin
            if (V[i] <> 0) then  // si es distinto de cero en el vector C guardo la posicion
            begin
                 C[k]:= V[i];
                 k:= k + 1;  // avanza de posicion en k
            end
            else
            cont:= cont + 1; // cuenta los ceros
            i:= i + 1;   // avanza de posicion en i
       end;
       for k:= 1 to (n - cont) do
            write(C[k],' ');   // muestro el arreglo sin ceros
  end;
end;
begin
  leeVector(V, n);
  clrscr();
  elimina(V, n);
  readln();
end.

