{Ej3. Se tiene un archivo que contiene una cadena de caracteres en cada línea formada por letras
y dígitos (ambos) finalizada con un punto.
Se pide leerlo y generar dos vectores paralelos, uno contendrá las cadenas formada por las
letras y el otro las cadenas formadas por los números. }
program Vectores_Ej3;
type
  st10 = string[10];
  tv = array[1..10] of st10;
procedure separaCadenas(var Vletras, Vnros: tv; var n: byte);
var
  arch: text;
  car: char;
begin
  assign(arch, 'datos.txt'); reset(arch);
  n:= 0;
  while not eof(arch) do
  begin
    n:= n + 1;
    Vletras[n]:= '';
    Vnros[n]:= '';
    read(arch, car);
    while car <> '.' do
    begin
      if car in['0'..'9'] then
         Vnros[n]:= Vnros[n] + car
         else
           Vletras[n]:= Vletras[n] + car;
      readln(arch, car);
    end;
    readln(arch);
  end;
  close(arch);
end;
Procedure Muestra(Vletras, Vnros: tv; n: byte);
var
  i: byte;
begin
  for i:= 1 to n do
      writeln(Vletras[i]:15, Vnros[i]:10);
end;
var
  n: byte;
  Vletras, Vnros: tv;
begin
  separaCadenas(Vletras, Vnros, n);
  Muestra(Vletras, Vnros, n);
  readln();
end.

