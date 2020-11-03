{12. En una archivo de texto se ha grabado por cada línea, una cadena (es una clave encriptada
que puede contener letras, números y caracteres espaciales como &, $, #, etc, siempre termina
en letra ), luego uno o más blancos y tres números separados por blancos, por ultimo uno o más
blancos y una letra . Ejemplo:
mU&1#hT34*A 80 40 30 P
Se pide cargar tres arreglos paralelos :
• VClave contendrá las claves sin los caracteres especiales, que registren en su
encriptación hasta tres caracteres especiales (las claves que tengan más de tres invalidan
la información de la línea, que no se almacena)
• VProm almacena el promedio de los tres números
• VCar almacena el caracter que esta al final de la línea, siempre que no coincida con la
última letra de la clave, en cuyo caso invalida la información de la línea, que no se
almacena)
Mostrar los arreglos generados. y luego para una letra y una clave que ingresan por teclado::
a) Para la letra ingresada, calcular e informar la clave de máximo promedio
b) Para la clave ingresada, informar el promedio y la letra asociada (puede no existir)
}
program Ej12;
uses
    crt;
const
  cant = 20;
  cantNum = 3;
type
  TVS = array[1..cant] of string;
  TVR = array[1..cant] of real;
  TVC = array[1..cant] of char;
Procedure lectura(var VC: TVS; var P: TVR; var C: TVC; var N: byte);
var
  arch: text;
  car, ultLetra: char;
  clave: string;
  i, carEsp: byte;
  num, suma: integer;
begin
  assign(arch, 'datos.txt'); reset(arch);
  N:= 0;
  while not eof(arch) do
  begin
    read(arch, car);
    clave:= '';
    carEsp:= 0;
    suma:= 0;
    while car <> ' ' do
    begin
      case car of
      'A'..'Z','a'..'z': begin
                         clave:= clave + car;
                         ultLetra:= car;
                         end;
      '0'..'9': clave:= clave + car;
      else
        carEsp:= carEsp + 1;
      end;
      read(arch, car);
    end;
    if carEsp <= 3 then //solo si hay 3 o menos car especiales guardo los datos
    begin
      for i:= 1 to cantNum do
      begin
        read(arch, num);
        suma:= suma + num;
      end;
      read(arch, car);
      while car = ' ' do
      begin
        read(arch, car);
      end;
      if car <> ultLetra then  // si el ultimo caracter leido no es igual a la ultima letra guardo los datos
      begin
        N:= N + 1;
        VC[N]:= clave;
        P[N]:= suma/cantNum;
        C[N]:= car;
      end;
    end;
    readln(arch); // bajo de linea en el archivo
  end;
  close(arch);
end;
Procedure show(VC: TVS; P: TVR; C: TVC; N: byte);
var
  i: byte;
begin
  for i:= 1 to N do
      writeln(VC[i],' ');
  writeln();
  for i:= 1 to N do
      writeln(P[i]:2:1,' ');
  writeln();
  for i:= 1 to N do
      writeln(C[i],' ');
end;
Function posMaxProm(letra: char; N: byte; C: TVC; P: TVR) : byte;
var
  i: byte;
  maxProm: real;
begin
  maxProm:= 0;
  posMaxProm:= 0;
  for i:= 1 to N do
  begin
    if (C[i] = letra) and (P[i] > maxProm) then
    begin
      maxProm:= P[i];
      posMaxProm:= i;
    end;
  end;
end;
Procedure infoClaveMax(N: byte; C: TVC; VC: TVS; P: TVR);
var
  i: byte;
  letra: char;
begin
  writeln('Ingrese una letra'); readln(letra);
  letra:= upcase(letra);
  if posMaxProm(letra, N, C, P) <> 0 then
     writeln('Para la letra ',letra,' La clave es: ',VC[posMaxProm(letra, N, C, P)],' y su promedio es: ', P[posMaxProm(letra, N, C, P)]:2:1)
     else
       writeln('No se encontro la letra ingresada');

end;
Function posClaveIng(clave: string; N: byte; C: TVC; VC: TVS; P: TVR) : byte;
var
  i: byte;
begin
  i:= 1;
  while (i <= N) and (clave <> VC[i]) do
        i:= i + 1;
  if i <= N then
     posClaveIng:= i
     else
       posClaveIng:= 0;
end;
Procedure infoClaveIng(N: byte; C: TVC; VC: TVS; P: TVR);
var
  i: byte;
  clave: string;
begin
  writeln('Ingrese una clave'); readln(clave);
  if posClaveIng(clave, N, C, VC, P) <> 0 then
     writeln('El promedio de la clave ', clave,' es: ', P[posClaveIng(clave, N, C, VC, P)]:2:1,' y su letra asociada es: ', C[posClaveIng(clave, N, C, VC, P)])
     else
       writeln('La clave ingresada no existe');
end;

var
  VC: TVS;
  P: TVR;
  C: TVC;
  N: byte;
begin
  lectura(VC, P, C, N);
  show(VC, P, C, N);
  infoClaveMax(N, C, VC, P);
  infoClaveIng(N, C, VC, P);
  readln();
end.
