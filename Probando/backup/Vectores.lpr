{Practica de vectores }
{A continuación se desarrolla un programa que utilizando funciones y procedimientos para
cada ítem:
a. Lee un arreglo de enteros
b. Calcula la suma de sus elementos
c. Cuenta la cantidad de componentes pares
d. Imprime las componentes que se encuentran en ubicaciones pares
e. Imprime el mínimo
f. Genera un segundo arreglo con los múltiplos de K (dato entero) y l}
program Vectores;
uses
    crt;
Type
  TV = array[1..100] of integer;
var
  N, M, K: integer;
  A, B: TV;
  op: char;
Procedure LeeVector(var A: TV; var N: integer); // lee el arreglo de enteros
var
  i: integer; //Variable local
begin
  writeln('Ingrese la cantidad de elementos del vector <= 100'); readln(N);
  for i:=1 to N do
  begin
    writeln('Ingrese el elemento'); readln(A[i]);
    clrscr();
  end;
end;
Function Suma (A: TV; N: integer) : integer; // calcula la suma de sus elementos
var
  i, sum : integer;
begin
  sum:= 0;
  for i:= 1 to N do
      sum:= sum + A[i];
  Suma:= sum;
end;
Function CuentaPares(A: TV; N: integer) : integer; // cuenta los pares
var
  i, cont: integer;
begin
  cont:= 0;
  for i:= 1 to N do
      if not odd(A[i]) then // Si no es impar entonces...
         cont:= cont + 1;
  CuentaPares:= cont;
end;
Procedure EscPosPares( A: TV; N: integer ); // Imprime las componentes que se encuentran en ubicaciones pares
var
  i: integer;
begin
  i:= 2;
  while i <= N do
  begin
    writeln(A[i] : 5);
    i:= i + 2;
  end;
end;
//Imprime el minimo
Function Minimo (A: TV; N: integer) : integer;
var
  i, min: integer;
begin
  min:= A[1]; // ubico el minimo en la posicion 1
  for i:= 2 to N do
      if A[i] < min then // si es menor al minimo entonces...
         min:= A[i]; // sobreescribo la variable min con el menor encontrado
  Minimo:= min;
end;
// genera un segundo arreglo con los multiplos de K (dato entero)  y lo escribe
Procedure GeneraOtro (A: TV; N, K: integer; var B: TV; var M: integer);
var
  i: integer;
begin
  M:= 0;
  for i:= 1 to N do
      if A[i] mod K = 0 then // si el resto es 0 entonces k es multiplo de i
      begin
        M:= M + 1;
        B[M]:= A[i];
      end;
end;
Procedure EscVector (V: TV; L: integer);
var
  i: integer;
begin
  for i:= 1 to L do
      writeln(V[i] : 5 );
end;
// Permite elegir por medio de un menú el/los proceso/s descriptos
Procedure Menu (var op: char);
begin
  Writeln('Menu de opciones');
  Writeln('b - Suma los elementos del arreglo');
  Writeln('c - Cuenta los elementos pares');
  Writeln('d - Imprime los elementos de las posiciones pares');
  Writeln('e - Calcula el mínimo');
  Writeln('f - Genera un arreglo con los elementos múltiplos de K');
  Writeln('g - Salir');
  Repeat
    Writeln(' Ingrese su opcion'); Readln(op);
    clrscr();
  Until ( 'b' <= Op) and ( Op <= 'g');
end;
// las variables globales estan declaradas al principio
begin
  LeeVector(A, N);
  writeln(A[1]);
  repeat
  Menu(op);
  case op of
     'b': writeln('La suma de los elementos del arreglo es:', Suma(A, N));
     'c': writeln('La cantidad de elementos pares del arreglo es:', CuentaPares(A, N));
     'd': begin
          writeln('Elementos de las posiciones pares del arreglo'); EscPosPares ( A , N );
          end;
     'e': writeln('El mínimo del arreglo es:', Minimo(A, N));
     'f': begin
          Write ('Ingrese un valor de K para seleccionar los múltiplos de K'); Readln(K);
          GeneraOtro (A , N, K, B, M );
          writeln('Elementos de múltiplos de ' , K ); EscVector(B, M);
          end;
  end; {case}
  until op = 'g';
end.

