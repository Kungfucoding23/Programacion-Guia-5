{16. Una empresa de autos de alquiler grabó en cada línea del archivo la patente del vehículo y el
total recaudado en el día. Se pide leer los datos en dos arreglos paralelos e Informar:
 a) El promedio recaudado por auto.
 b) Las patentes de los vehículos que superaron en la recaudación en X pesos (X es dato).
 c) La patente del que recaudó menos.
}
program Ej16;
Uses
    crt;
const
  cantElem = 10;
type
  TVP = array[1..cantElem] of string;
  TVR = array[1..cantElem] of word;
Procedure start(var P: TVP; var R: TVR);
var
   i: byte;
begin
  for i:= 1 to cantElem do
  begin
    P[i]:= '';
    R[i]:= 0;
  end;
end;

Procedure lectura(var P: TVP; var R: TVR; var N: byte);
var
  arch: text;
  car: char;
begin
  N:= 1;
  assign(arch, 'datos.txt'); reset(arch);
  while not eof(arch) do
  begin
    read(arch, car);
    while car <> ' ' do
    begin
      P[N]:= P[N] + car;
      read(arch, car);
    end;
    read(arch, R[N]);
    N:= N + 1;
  end;
  close(arch);
end;
Procedure show(P: TVP; R: TVR; N: byte);
var
  i: byte;
begin
  for i:= 1 to N - 1 do
      write(P[i],' ');
  writeln();
  for i:= 1 to N - 1 do
      write(R[i],' ');
end;
//Inciso a)
Function Promedio(R: TVR; N: byte) : real;
var
  i: byte;
  suma: word;
begin
  suma:= 0;
  for i:= 1 to N - 1 do
  begin
    suma:= suma + R[i];
  end;
  Promedio:= suma/(N - 1);
end;
//Inciso b)
Procedure findPatente(var x: integer; R: TVR; P: TVP; N: byte);
var
  i: byte;
begin
  writeln('=========================================');
  writeln('Ingrese el monto x'); readln(x);
  clrscr();
  writeln('Los vehiculos que superaron $',x, ' son:');
  for i:= 1 to N do
  begin
    if R[i] > x then
       writeln(P[i],' ');
  end;
end;
//Inciso c)
Function patMenos(P: TVP; R: TVR; N: byte): byte;
var
  i, pos: byte;
  menor: word;
begin
  menor:= 65000;
  //encuentra menor valor recaudado
  for i:= 1 to N - 1 do
  begin
    if R[i] < menor then
    begin
      menor:= R[i];
      pos:= i;
    end;
  end;
  patMenos:= pos;
end;

//Programa principal
var
   P: TVP;
   R: TVR;
   N: byte;
   x: integer;
begin
  start(P, R);
  lectura(P, R, N);
  show(P, R, N);
  writeln();
  writeln('El promedio recaudado por auto es: $', Promedio(R, N):2:2);
  findPatente(x, R, P, N);
  writeln('=====================================================');
  writeln('La patente que recaudo menos es : ', P[patMenos(P, R, N)]);
  readln();
end.

