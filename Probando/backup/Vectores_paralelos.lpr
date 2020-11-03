{Ej2. El siguiente programa lee el nombre y la edad de N personas , calcula e imprime:
a. Listado de nombres de las personas de mas de X años.
b. Porcentaje de las personas mayores de edad sobre el total.
c. Obtener un arreglo que contenga los nombres de las personas con edad entre
E1 y E2.
}
program Vectores_paralelos;
type
  st25 = string[25];
  TVnom = array[1..50] of st25;
  TVedad = array[1..50] of byte;
var
  Vnom, per: TVnom;
  Vedad: TVedad;
  K, X, E1, E2, N: byte;
Procedure leeParalelo(var Vnom: TVnom; var Vedad: TVedad; var N: byte);
var
  i: byte; {variable local}
begin
  writeln('Ingrese N');
  readln(N);
  for i:= 1 to N do
  begin
    writeln('Ingrese el nombre');
    readln(Vnom[i]);  {leo el nombre y la edad ingresadas}
    writeln('Ingrese la edad');
    readln(Vedad[i]);
  end;
end;
Procedure Listado(Vnom: TVnom; Vedad: TVedad; N,X: byte);
var        {lee las edades mayores e imprime sus nombres}
  i: byte;
begin
  for i:= 1 to N do
      if Vedad[i] > X then
         writeln(Vnom[i]);
end;
Function Porcen(Vedad: TVedad; N: byte) : real;
var
  i, cont: byte;
begin
  cont:= 0;
  for i:= 1 to N do
      if Vedad[i] >= 21 then // si es mayor de edad los cuenta
         cont:= cont + 1;
  Porcen:= cont*100/N;
end;
Procedure Personas(Vnom: TVnom; Vedad: TVedad; E1, E2, N: byte; var per: TVnom; var k: byte);
var
  i: byte;     {crea un arreglo con los nombres de las personas con edades entre E1 y E2}
begin
  K:= 0;
  for i:= 1 to N do
      if (Vedad[i] >= E1) and (Vedad[i] <= E2) then
      begin
        K:= K + 1;
        per[K]:= Vnom[i];
      end;
end;
Procedure EscribeVec(V: TVnom; M: byte);
var
  i: byte;    {muestra los nombres del vector de los nombres}
begin
  for i:= 1 to M do
      writeln(V[i]);
end;
//Programa principal
begin
  leeParalelo(Vnom, Vedad, N);
  writeln('Ingrese edad minima para listado de nombresa'); readln(X);
  Listado(Vnom, Vedad, N, X);
  writeln('El porcentaje de personas mayores de edad es: ', Porcen(Vedad, N));
  writeln('Ingrese intervalo para nuevo arreglo'); readln(E1, E2);
  Personas(Vnom, Vedad, E1, E2, N, per, K);
  EscribeVec(Per, K);
end.

