{2. Dado un archivo de enteros, se pide cargar en un vector V sólo los elementos impares y en
otro vector W, los pares, ignorando si hubiese algún cero.}
program Ej2;
type
  vec = array[1..100] of integer;
var
  V, W: vec;
  n, cont: integer;
  arch: text;
Procedure imp(V: vec; cont: integer);
var
  arch: text;
  i: byte;
  num: integer;
begin
   assign(arch, 'datos.txt'); reset(arch);
   read(arch, num);
   for i:= 1 to cont do
   begin
     read(arch, num);
     if num mod 2 <> 0 then
     begin
        V[i]:= num;
        write(V[i],' ');
     end;
   end;
   close(arch);
end;
Procedure par (W: vec; cont: integer);
var
  arch: text;
  i: byte;
  num: integer;
begin
   assign(arch, 'datos.txt'); reset(arch);
   read(arch, num);
   for i:= 1 to cont do
   begin
     read(arch, num);
     if num mod 2 = 0 then
     begin
        W[i]:= num;
        write(W[i],' ');
     end;
   end;
   close(arch);
end;
begin
  cont:= 0;
  assign(arch, 'datos.txt'); reset(arch);
  read(arch, n);
  //lee la cantidad de elementos del archivo
  while not eof(arch)do
  begin
    if n <> 0 then
       cont:= cont + 1;
    read(arch, n);
  end;
  close(arch);
  writeln('El arreglo de impares es: ');
  write('(');
  imp(V, cont);
  writeln(')');
  writeln('==================================');
  writeln('El arreglo de pares es: ');
  write('(');
  par(W, cont);
  write(')');
  readln();
end.

