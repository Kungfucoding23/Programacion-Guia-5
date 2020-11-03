{17. Una planta de silos registra el ingreso de camiones de sus clientes con cereal, por cada uno
se tiene:
• Cliente
• Patente del camión
• Tipo de cereal ( 1-trigo, 2-girasol, 3-soja, 4-maiz )
• Toneladas
Se pide que lea los datos desde un archivo y mediante un menú de opciones iterativo calcule e
informe:
a) Porcentaje de toneladas de cada cereal respecto del total.
b) Dada una patente, si es que existe, decir qué tipo de cereal transporta, las toneladas y a qué
cliente pertenece.
c) Generar un arreglo con los clientes que transportaron más de X peso ordenado
alfabéticamente. }
program Ej17;
Uses
    crt;
const
  cantElem = 20;
type
  TVS = array[1..cantElem] of string;
  TVT = array[1..cantElem] of word;
Procedure start(var VCliente, VPat: TVS);
var
  i: byte;
begin
  for i:= 1 to cantElem do
  begin
    VCliente[i]:= '';
    VPat[i]:= '';
  end;
end;

Procedure lectura(var VCliente, VPat: TVS; var VTipo, VTon: TVT; var N: byte);
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
      VCliente[N]:= VCliente[N] + car;
      read(arch, car);
    end;
    read(arch, car);
    while car <> ' ' do
    begin
      VPat[N]:= VPat[N] + car;
      read(arch, car);
    end;
    read(arch, VTipo[N], VTon[N]);
    N:= N + 1;
    readln(arch); // bajo de linea en el archivo
  end;
  close(arch);
end;
Procedure show(VCliente, VPat: TVS; VTipo, VTon: TVT; N: byte);
var
  i: byte;
begin
  for i:= 1 to N - 1 do
      write(VCliente[i],' ');
  writeln();
  for i:= 1 to N  do
      write(VPat[i],' ');
  writeln();
  for i:= 1 to N - 1 do
      write(VTipo[i],' ');
  writeln();
  for i:= 1 to N - 1 do
      write(VTon[i],' ');
  writeln();
end;
Procedure orden(var VPat: TVS; N: byte);
var
  aux: string;
  i, k, tope: byte;
begin
  tope:= N;
  repeat
    k:= 0;
    for i:=1 to tope - 1 do
    begin
      if VPat[i] > VPat[i + 1] then
      begin
        aux:= VPat[i]; VPat[i]:= VPat[i + 1]; VPat[i + 1]:= aux;
        k:= i;
      end;
    end;
    tope:= k;
  until k <= 1;
end;

var
  VCliente, VPat: TVS;
  VTipo, VTon: TVT;
  N: byte;
begin
  start(VCliente, VPat);
  lectura(VCliente, VPat, VTipo, VTon, N);
  show(VCliente, VPat, VTipo, VTon, N);
  orden(VPat, N);
  show(VCliente, VPat, VTipo, VTon, N);
  readln();
end.

