{5. Dado un archivo de enteros, leerlos en un arreglo, obtener el promedio de todos los números
divisores del máximo y con ellos armar otro arreglo. Mostrar ambos arreglos.}
program Ej5;
uses
    crt;
type
  vec = array[1..20] of integer;
var
  v, p: vec;
  n: integer;
  cont: byte;
Procedure leeArreglo(var v: vec; var n: integer; var cont: byte);
var
  i: byte;
  arch: text;
begin
  cont:= 0;
  i:= 1;
  assign(arch, 'datos.txt'); reset(arch);
  while not eof(arch) do
  begin
    read(arch, n);
    if n <> 0 then   //cuenta los elementos del archivo distintos de cero
    begin
       cont:= cont + 1;
       v[i]:= n;
       i:= i + 1;
    end;
  end;
  close(arch);
  writeln('El arreglo del archivo es: ');
  for i:= 1 to cont do
      write(v[i],' ');
end;
Procedure divisores(var v, p: vec; var cont: byte; var n: integer);
var
  i, k, divisores: byte;
  arch: text;
  max, suma: integer;
  promedio: real;
begin
  i:= 1;
  k:= 1;
  divisores:= 0;
  suma:= 0;
  promedio:= 0;
  max:= v[1];
  assign(arch, 'datos.txt'); reset(arch);
  for i:= 1 to cont do
  begin
    read(arch, n);
    // Encuentra el maximo
    if n > max then
       max:= n;
  end;//for
  close(arch);
  for i:= 1 to cont do
  begin
    if max mod v[i] = 0 then
    begin
       p[k]:= v[i];
       k:= k + 1;
       divisores:= divisores + 1;
    end;
  end;
  writeln(); //dejo un espacio
  writeln('El maximo es: ', max); //hasta aca anda bien
  writeln('Hay ',divisores,' divisores: ');
  for k:= 1 to divisores do
  begin
    suma:= suma + p[k];
    write(p[k],' '); // escribe el arreglo de divisores
  end;
  promedio:= suma/divisores;
  writelb();// espacio
  writeln('El promedio es: ',promedio:2:2);
end;
begin
  leeArreglo(v, n, cont);
  divisores(v, p, cont, n);
  readln();
end.

