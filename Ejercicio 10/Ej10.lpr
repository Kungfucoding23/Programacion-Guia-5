{10. Dado un arreglo A, generar dos arreglos paralelos B y C donde B contiene la suma de los
elementos de A que están entre dos negativos y C la cantidad que se sumó. Mostrarlos.
Ejemplo:
A=(3, 5, -1, 3, 8, 2, -5, 2, 10, -4, -8, 4, 6, 7,-3, 11, 2)  B=(13, 12, 0, 17) C=(3, 2, 0, 3) }
program Ej10;
type
  TV = array[1..50] of integer;
  TVC = array[1..50] of byte;

Procedure startBC(var B: TV; var C: TVC);
var
  i: byte;
begin
  for i:= 1 to 50 do
  begin
    B[i]:= 0;
    C[i]:= 0;
  end;
end;
Procedure paralelos(var B: TV; var C: TVC; var N: integer);
var
  i: byte;
  arch: text;
  n1, n2, n3: integer;
begin
  startBC(B, C);
  N:= 1;
  assign(arch, 'datos.txt'); reset(arch);
  read(arch, n1);
  while not eof(arch) do
  begin
    if n1 < 0 then
       n2:= n1
       else
         read(arch, n2);
    if n2 < 0 then
    begin
    read(arch, n3);
    while n3 > 0 do
    begin
             B[N]:= B[N] + n3; // Guarda la suma
             C[N]:= C[N] + 1;  // Cuenta los elementos
             read(arch, n3);
    end;
    //write(B[N],' ');
    N:= N + 1;
    n1:= n3;
    end;
  end;
  close(arch);
end;
procedure showBC(B: TV; C: TVC; N: integer);
var
  i: byte;
begin
  for i:= 1 to (N - 2) do
  begin
    write(B[i],' ');
  end;
  writeln();
  for i:= 1 to (N - 2) do
  begin
    write(C[i], ' ');
  end;
end;
var
  B: TV;
  C: TVC;
  N: integer;
begin
  startBC(B, C);
  paralelos(B, C, N);
  showBC(B, C, N);
  readln();
end.

