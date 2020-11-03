{Ej4. En un edificio de N pisos, se desea evaluar el uso del ascensor en relación a la cantidad de
personas y al piso al cual se dirigen. Para ello durante una día se ha grabado en cada línea del
archivo cada parada del ascensor: Piso, Cantidad (de personas que bajan en dicho piso).
Se pide leer los datos del archivo para informar:
a. Para cada piso el promedio de personas que bajaron en dicho piso.
b. Cuál fue el piso con más paradas (no importa la cantidad de personas).
Es necesario utilizar un contador de paradas y un acumulador de personas para cada piso.
Se implementan dos arreglos enteros, un contador de paradas y un acumulador de personas.
El piso “trabaja” como índice seleccionando la componente que será incrementada y acumulada.}
program Ej4_paradas;
type
  tv = array [1..50] of word;
procedure IniciaV(var v: tv);
var
  i: byte;
begin
  for i:= 1 to 50 do {se incicializa todo el arreglo en cero}
      v[i]:= 0;
end;
Procedure contabiliza(var personas, paradas: tv);
var
  piso, cant: byte;
  arch: text;
begin
  IniciaV(personas); IniciaV(paradas);
  assign(arch, 'datosEj4.txt'); reset(arch);
  while not eof(arch) do
  begin
    readln(arch, piso, cant);   //piso es indice de los dos arreglos
    paradas[piso]:= paradas[piso] + 1;
    personas[piso]:= personas[piso] + cant;
  end;
  close(arch);
end;
procedure promedio(personas, paradas: tv; n: byte);
var
  i: byte;
begin
  writeln('Piso    -     Promedio de personas por viaje');
  for i:= 1 to n do
      if paradas[i] <> 0 then
         writeln(i:3, personas[i] div paradas[i]:12)
         else
           writeln(i:3, 0:12);
end;
Function maxPiso (v: tv; n: byte) : byte;
var
  i, pos: byte;
begin
  pos:= 1;
  for i:= 2 to n do {si la posicion supera 1 sobrescribo la variable pos}
      if v[i] > v[pos] then
         pos:= i;
  maxPiso:= pos; {guardo en maxPiso el piso que tuvo mas paradas}
end;
//Programa principal
var
  personas, paradas: tv;
  n: byte;
begin
  writeln('Ingrese la cantidad de pisos'); readln(n);
  contabiliza(personas, paradas);
  promedio(personas, paradas, n);
  writeln('EL piso con mas paradas fue el ', maxPiso(paradas, n));
  readln();
end.

