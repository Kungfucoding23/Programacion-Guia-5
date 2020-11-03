{1er Parcial}
program SantinAlejandro;
uses
    crt;
const
  cant = 20;
type
  TVS = array[1..cant] of string;
  TVB = array[1..cant] of word;
// leo el archivo
Procedure inicia(var Vtitulo, Vtipo: TVS; var VMG, VNMG, VNOT: TVB);
var
  i: byte;
begin
  for i:=1 to cant do
  begin
    Vtitulo[i]:= '';
    Vtipo[i]:= '';
    VMG[i]:= 0;
    VNMG[i]:= 0;
    VNOT[i]:= 0;
  end;
end;

Procedure lectura(var Vtitulo, Vtipo: TVS; var VMG, VNMG, VNOT: TVB; var N: byte; x: byte);
var
  arch: text;
  car: char;
begin
  N:= 1;
  writeln('Ingrese la cantidad x entre Me gusta y No me gusta que debe superar la pelicula'); readln(x);
  assign(arch, 'Respuestas.txt'); reset(arch);
  while not eof(arch) do
  begin
    read(arch, car);
    repeat
      Vtitulo[N]:= Vtitulo[N] + car;
      read(arch, car);
    until car = '"';
    writeln(Vtitulo[N],' ');
    //read(arch, car);
    read(arch, car);
    read(arch, car);
    read(arch, car);
    while car <> ' ' do
    begin
      Vtipo[N]:= Vtipo[N] + car;
      read(arch, car);
    end;
    writeln(Vtipo[N],' ');
    read(arch, VMG[N], VNMG[N], VNOT[N]);
    if (VMG[N] + VNMG[N] > x) then // solo si las calificaciones superan x se incrementa N en 1
    begin
      N:= N + 1;
    end
       else
           N:= 1; // sino vuelve a sobreescribir la posicion 1
    readln(arch); // bajo de linea en el archivo
  end;
  close(arch);
end;
Procedure ordena(VMG: TVB; N: byte);
var
  aux: byte;
  i, k, tope: byte;
begin
  tope:= N;
  repeat
    k:= 0;
    for i:= 1 to tope - 1 do
    begin
      if VMG[i] > VMG[i + 1] then
      begin
        aux:= VMG[i]; VMG[i]:= VMG[i + 1]; VMG[i + 1]:= aux;
        k:= i;
      end;
    end;
    tope:= k;
  until k <= 1;
end;

var
  Vtipo, Vtitulo: TVS;
  VMG, VNMG, VNOT: TVB;
  N ,x: byte;
begin
  inicia(Vtitulo, Vtipo, VMG, VNMG, VNOT);
  lectura(Vtitulo, Vtipo, VMG, VNMG, VNOT, N, x);
  readln();
end.

