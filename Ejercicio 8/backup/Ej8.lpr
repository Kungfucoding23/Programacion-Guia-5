{8. Dado un arreglo V de N elementos ordenados en forma ascendente con componentes
repetidas, generar W con la frecuencia de los elementos de V.
Ejemplo: N=10; V=(2,2,3,3,3,3,7,9,9,9)  W=(2,4,1,3) }
program Ej8;
const
  todos = 9;
type
  TV = array[1..todos] of byte;

Procedure startVec(var v, w: TV);  // inicializa el vector
var
  i: byte;
begin
  for i:= 1 to todos do
  begin
      v[i]:= 0;
      w[i]:= 0;
  end;

end;

Procedure leeArchivo(var v: TV);                 //lee en el vector los numeros del archivo
var
  arch: text;
  i: byte;
begin

  assign(arch, 'datos.txt'); reset(arch);
  for i:= 1 to todos do
      read(arch, v[i]);

  close(arch);
end;

Procedure show(v: TV);         // lo muestra
var
  i: byte;
begin
  leeArchivo(v);
  for i:= 1 to todos do
      write(v[i],' ');
  writeln();
end;

Procedure frecW(v: TV; var w: TV);
var
  i, k, cont: byte;
begin
  startVec(v, w);
  leeArchivo(v);
  k:= 1;                                       // if ((a mod 2 = 0) or (a mod 7 = 0)) and ((a mod 2 = 0) and (a mod 7 = 0)) then
  cont:= 1;                                      // esto es para el ejercicio 15 e de discreta
  for i:= 1 to todos do
  begin
      if v[i] = v[i + 1] then
        cont:= cont + 1
        else
        begin
          w[cont]:= cont;
          write(w[cont] : 2);
          cont:= 1;
          //k:= k + 1;
        end;
  end;
  //for i:= 1 to k do
    //  write(w[k]:2);
end;

var
  v, w: TV;

begin
  startVec(v, w);
  leeArchivo(v);
  show(v);
  frecW(v, w);
  readln();
end.

