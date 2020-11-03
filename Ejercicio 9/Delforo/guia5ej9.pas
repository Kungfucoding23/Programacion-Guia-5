{Dado un archivo de números enteros no nulos, almacenar en un arreglo A aquellos que sean
ascendentes. A partir de A generar B con la misma cantidad de elementos de A pero poniendo
ceros en aquellas componentes simétricas donde la simétrica derecha no sea múltiplo de la
izquierda. Escribir ambos arreglos.
Ejemplo: Archivo : 5, 7, 1, 12, 15, -10, 10, 24, -25, 26, 50, 13
A = (5, 7, 12, 15, 24, 26, 50)  B= (5, 0, 12, 15, 24, 0, 50)}
program guia5ej9;
type
  TV=array[1..100] of integer;
 procedure LeerV(VAR V:TV;VAR N:integer);    {lee el primer vector}
 var
   arch:text;
   n1,n2:integer;
begin
  N:=1;
  assign (arch,'ej9.txt');
  reset(arch);
  read(Arch,n1);
  V[N]:=n1;
  while not eof (arch) do
  begin
   read(arch,n2);
   if  N2>N1 then
      begin
      N:=N+1;
      V[N]:=n2;
      n1:=n2;
      end;
  end;
  close(arch);
end;
procedure mostrarV(V:TV; N:integer);          {muestro mi primer vector}
var
  i:integer;
begin
  For i:=1 to N do
    write(V[i],' ');
end;
Procedure multiplosV (V:TV;N:INTEGER; VAR W:TV);   {calculo cuales son los multiplos de los simetricos}
var
  i:integer;
begin
   For i:=1 to (N div 2) do
    begin
    if (V[(N-i+1)] mod V[i] = 0) then
       begin
       W[i]:=V[i];
       W[(N-i+1)]:=V[(N-i+1)];
       end
    else
        begin
        W[i]:=0;
        W[(N-i+1)]:=0;
        end;
    end;
end;
procedure MostrarW(W:TV;N:INTEGER); {muestro W}
var
  i:integer;
  begin
    for i:=1 to N do
     write(W[i],' ');
  end;

var
  V,W:TV;
  N:INTEGER;
begin
   leerV(V,N);
   Writeln('el vector v es ');mostrarV(V,N);
   multiplosV(V,N,W);
   writeln();
   writeln('el vector w es ');MostrarW(W,N);
   readln();
end.

