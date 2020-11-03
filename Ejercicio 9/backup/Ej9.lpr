{9. Dado un archivo de números enteros no nulos, almacenar en un arreglo A aquellos que sean
ascendentes. A partir de A generar B con la misma cantidad de elementos de A pero poniendo
ceros en aquellas componentes simétricas donde la simétrica derecha no sea múltiplo de la
izquierda. Escribir ambos arreglos.
Ejemplo: Archivo : 5, 7, 1, 12, 15, -10, 10, 24, -25, 26, 50, 13
A = (5, 7, 12, 15, 24, 26, 50)  B= (5, 0, 12, 15, 24, 0, 50)
}
program Ej9;
type
  TV = array[1..100] of integer;
Procedure leeA(var A: TV; var N: integer); // lee el primer vector con los elementos ascendentes
var
  arch: text;
  n1, n2: integer;
begin
  N:= 1;
  assign(arch, 'datos.txt'); reset(arch);
  read(arch, n1);
  A[N]:= n1;
  while not eof(arch) do
  begin
    read(arch, n2);
    if n2 > n1 then
    begin
      n:= n + 1;
      A[N]:= n2;
      n1:= n2;
    end;
  end;
  close(arch);
end;
// muestra el vector A
Procedure showA(A: TV; N: integer);
var
  i: byte;
begin
  for i:= 1 to n do
  begin
    write(A[i],' ');
  end;
  writeln();
end;
// Crea el arreglo B con los multiplos de los simetricos
Procedure vecB(A: TV; N: integer; var B: TV);
var
  i: integer;
begin
  For i:=1 to ((N div 2) + 1) do
   begin
   if (A[(N-i+1)] mod A[i] = 0) then
      begin
      B[i]:=A[i];
      B[(N-i+1)]:=A[(N-i+1)];
      end
   else
       begin
       B[i]:=0;
       B[(N-i+1)]:=0;
       end;
   end;
end;
// Muestro el arreglo B
Procedure showB(B: TV; N: integer);
var
  i: byte;
begin
  for i:= 1 to N do
   write(B[i],' ');
end;

var
  A, B: TV;
  n: integer;
begin
  leeA(A, N);
  showA(A, N);
  vecB(A, N, B);
  showB(B, N);
  readln();
end.

