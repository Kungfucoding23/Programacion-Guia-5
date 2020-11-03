{15. Se pide compactar un arreglo, como en el ejercicio 4, sin usar estructura auxiliar.
}
program Ej15;
Uses
    crt;
const
  cantElem = 50;
type
  TV = array[1..cantElem] of integer;

Procedure lectura(var A: TV; var N: byte);
var
  arch: text;
begin
  N:= 1;
  assign(arch, 'datos.txt'); reset(arch);
  while not eof(arch) do
  begin
    read(arch, A[N]);
    N:= N + 1;
  end;
  close(arch);
end;
Procedure show(V: TV; N: byte);
var
  i: byte;
begin
  for i:= 1 to N do
      write(V[i],' ');
  writeln();
end;

// encuentra los ceros del arreglo A
Procedure findCeros(var ceros: byte; A: TV; N: byte);
var
  i: byte;
begin
  ceros:= 0;
  for i:= 1 to N do
  begin
    if A[i] = 0 then
       ceros:= ceros + 1;
  end;
  writeln('hay ',ceros,' ceros');
end;
Procedure find(var pos: byte; A: TV; N: byte);
var
  i: byte;
begin
  i:= 1;
  //busca el cero
  while (i <= N) and (0 <> A[i]) do
        i:= i + 1;
  if i <= N then // encontro el cero
     pos:= i
     else
       pos:= 0;
end;
Procedure Delete(var A: TV; var N: byte; pos: byte);
var
  i: byte;
begin
  for i:= pos + 1 to N do
      A[i - 1]:= A[i];
  N:= N - 1;
end;

Procedure compactaA(var A: TV; var N: byte; pos, ceros: byte);
var
   i: byte;
begin
  i:= 0;
  repeat
    find(pos, A, N);
    if pos <> 0 then
    begin
      Delete(A, N, pos);
      i:= i + 1;
    end;
  until i = ceros;
end;

// Programa principal
var
   A: TV;
   N, ceros, pos: byte;
begin
  lectura(A, N);
  show(A, N);
  findCeros(ceros, A, N);
  compactaA(A, N, pos, ceros);
  show(A, N);
  readln();
end.

