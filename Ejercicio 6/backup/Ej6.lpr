{6. Escriba un programa que lea una frase (secuencia de caracteres separadas por espacio,
coma, punto) y desarrolle subprogramas para informar:
a) El número de palabras que contiene.
b) La longitud de la palabra más larga.
c) De todas las palabras, la que aparece antes en el diccionario.
d) La frecuencia de cada letra (mayúscula o minúscula) que aparece en el texto. }
program Ej6;
type
  st25 = string[25];
  vec = array[1..50] of st25;
var
   v: vec;
Procedure leeArchivo(var v: vec);
var
   arch: text;
   palabra: string;
   car: char;
   cont: byte;
begin
  cont:= 0;
  assign(arch, 'datos.txt'); reset(arch);
  while not eof(arch) do
  begin
    read(arch,car);
    if car = '' then
    read(arch, palabra);
    cont:= cont + 1;
    writeln(car,palabra);
  end;
  close(arch);
  writeln('hay ',cont,' palabras');
end;
begin
  leeArchivo(v);
  readln();
end.

