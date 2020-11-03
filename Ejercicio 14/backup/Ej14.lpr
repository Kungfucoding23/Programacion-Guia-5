{14. En una estación de peaje hay N cabinas por donde pasan varios vehículos. Desde un archivo
se lee la siguiente información:
• Número de cabina
• Tipo de vehículo (1=auto, 2=moto, 3=camioneta, 4=camión, 5=colectivo)
• Hora (0..23)
Las tarifas son: moto= $ 15, auto y camioneta=$ 30, camión=$70, colectivo=$90.
Si la hora está entre 10 y 18 sufre un incremento del %10.
Calcular e informar
a) cuántos vehículos atendió cada una de las N cabinas
b) Cuál fue la que más importe recaudó. }
program Ej14;
Uses
    crt;
const
  cantElem = 30;

type
  TVC = array[1..cantElem] of byte;
  TVI = array[1..cantElem] of real;
Procedure start(var Cant: TVC; var Imp: TVI); //incializo los dos vectores
var
  i: byte;
begin
  for i:= 1 to cantElem do
  begin
    Cant[i]:= 0;
    Imp[i]:= 0;
  end;
end;
Procedure lectura(var Cant: TVC; var Imp: TVI; var cabina, N: byte);
const
  incremento = 0.1;
var
  arch: text;
  vehiculo, hora: byte;
  tarifa: real;
begin
  N:= 1;
  assign(arch, 'datos.txt'); reset(arch);
  while not eof(arch) do
  begin
    tarifa:= 0;
    read(arch, cabina, vehiculo, hora);
    case vehiculo of
    1: tarifa:= 30;
    2: tarifa:= 15;
    3: tarifa:= 30;
    4: tarifa:= 70;
    5: tarifa:= 90;
    end;
    case hora of
    10..18: tarifa:= tarifa + (tarifa*incremento);
    end;
    Imp[cabina]:= Imp[cabina] + tarifa;
    Cant[cabina]:= Cant[cabina] + 1;
    N:= N + 1;
    readln(arch); //bajo de linea en el archivo
  end;
  close(arch);
end;
//inciso a)
Procedure show(Cant: TVC; Imp: TVI; N: byte);
var
  i: byte;
begin
  for i:= 1 to N do
      writeln('La cabina ',i,' atendio ',Cant[i],' vehiculos. Recaudo $',Imp[i]:2:1);
  writeln();
end;
//Inciso b) cual recaudo mas
Function masImp(Imp: TVI; N: byte) : byte;
var
  i, k: byte;
  maxImp: real;
begin
  maxImp:= 0;
  k:= 1;
  for i:= 1 to N do
  begin
    if Imp[i] > maxImp then
    begin
      maxImp:= Imp[i];
    end;
  end;
  while (k <= N) and (Imp[k] <> maxImp) do
        k:= k + 1;
  if k <= N then  //lo encontro
     masImp:= k
     else
       masImp:= 0;
end;
//Programa principal
var
  Cant: TVC;
  Imp: TVI;
  cabina, N: byte;
begin
  start(Cant, Imp);
  lectura(Cant, Imp, cabina, N);
  show(Cant, Imp, N);
  writeln('La cabina que mas recaudo es la ', masImp(Imp, N));
  writeln();
  readln();
end.

