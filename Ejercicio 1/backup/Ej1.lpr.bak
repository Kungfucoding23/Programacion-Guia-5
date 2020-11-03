{1. Dado un arreglo A de N elementos reales, calcular y mostrar:
 a) La suma de sus elementos.
 b) Los elementos que se encuentran en posiciones pares.
 c) El máximo y el mínimo elemento.
 d) Generar un arreglo B con los elementos de A permutado ( B[1]=A[N], B[2]=A[N-1] H
B[N]=A[1] ).}
program Ej1;
uses
    crt;
type
  vec = array[1..100] of integer;
var
  n: integer;
  A, B: vec;
  op: char;

//Ingreso y guardo los elementoos del vector/arreglo
Procedure LeeVector(var A: vec; var n: integer );
var
  i: byte;
begin
  writeln('Ingrese la cantidad de elementos <= 100'); readln(n);
  for i:= 1 to n do
  begin
    writeln('Ingrese el elemento ',i); readln(A[i]); // lee el elemento y lo guarda en su respectiva posicion
  end;
end;
//Sumo sus elementos
Function suma(var A: vec; var n: integer) : integer;
var
  i, sum: byte;
begin
  clrscr();
  sum:= 0;
  for i:= 1 to n do
  begin
    sum:= sum + A[i];
  end;
  suma:= sum;
end;
//Muestro los elementos que se encuentran en poosiciones pares
Procedure posPares(A: vec; n: integer);
var
  i: byte;
begin
  clrscr();
  i:= 2; // inicializo en la primer posicion par
  while i <= n do
  begin
    writeln(A[i] : 5); // Recorre el arreglo moviendose de a pares y los muestra
    i:= i + 2;
  end;
end;
// Maximo y minimo elemento
Procedure minMax(A: vec; n: integer);
var
  i, min, max: byte;
begin
  clrscr();
  min:= A[1];
  max:= A[1];
  for i:= 2 to n do
  begin
    //minimo
    if A[i] < min then
       min:= A[i];
    //maximo
    if A[i] > max then
       max:= A[i];
  end;
  writeln('El maximo elemento es: ', max);
  writeln('El minimo elemento es: ', min);
end;
// generar un arreglo B con los elementos de A permutado
Procedure generaB(A, B: vec; n: integer);
var
  i: byte;
begin
  clrscr();
  for i:= 1 to n do
  begin
    B[i]:= A[n];
    A[n]:= A[n - i];
    writeln(B[i]);
  end;
end;
//menu
Procedure menu (var op: char);
begin
  writeln('=========================================');
  writeln('a) Suma de sus elementos');
  writeln('b) Elementos en posiciones pares');
  writeln('c) Maximo y minimo elemento');
  writeln('d) Generar arreglo permutado de A');
  writeln('s) Salir');
  writeln('=========================================');
  repeat
     writeln('Ingrese la operacion que desea realizar'); readln(op);
     op:= upcase(op);
  until ('A' <= op) and (op <= 'S');
  clrscr();
end;
//programa principal
begin
  LeeVector(A, n);
  repeat
     menu(op);
     case op of
          'A': writeln('La suma de sus elementos es: ',suma(A, n));
          'B': posPares(A, n);
          'C': minMax(A, n);
          'D': generaB(A, B, n);
          'S': writeln('Saliendo...');
          else
            writeln('Opcion no valida');
     end;
  until op = 'S';
  readln();
end.

