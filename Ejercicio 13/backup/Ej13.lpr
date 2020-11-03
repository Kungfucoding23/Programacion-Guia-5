{13. Leer un conjunto de números enteros, determinar cuántos terminan con 0, 1, 2,.....9 }
program Ej13;
const
  cant = 10;
type
  TV = array[1..cant] of integer;
Procedure Inicializa(var V: TV);
var
  i: byte;
begin
  for i:= 0 to 9 do
      V[i]:= 0;
end;
Procedure terminanCon(var V: TV);
var
  arch: text;
  num, w: integer;
begin
  assign(arch, 'datos.txt'); reset(arch);
  while not eof(arch) do
  begin
    read(arch, num);
    w:= (num mod 10); // en w guardo el resto de dividir por 10
    V[w]:= V[w] + 1;  //
  end;
  close(arch);
end;
Procedure show(V: TV);
var
  i: byte;
begin
  for i:= 0 to 9 do
      writeln('Los numeros que terminan con ',i,' son ',V[i]);
end;

var
  V: TV;
begin
  Inicializa(V);
  terminanCon(V);
  show(V);
  readln();
end.

