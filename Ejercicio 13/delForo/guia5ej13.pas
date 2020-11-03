program guia5ej13;
type
  TV=array[1..100] of integer;
Procedure Vector0(VAR V:TV;N:integer);
var
  i:byte;
begin
  for i:=1 to N do
      v[i]:=0;
end;
procedure LeerN(VAR v:TV; n:integer);
var
  num,i,w:integer;
begin
  for i:=1 to N do
  begin
    Writeln('Ingrese el nro');
    readln(num);
    W:=(num mod 10);
    V[w]:=V[W]+1;
  end;
end;
Procedure MostrarCont(V:TV);
var
  i:byte;
begin
   for i:=1 to 9 do
   Writeln('Los nros q terminan en ',i, ' son ',V[i]);
end;
var
  V:TV;
  N:integer;
begin
  Writeln('ingrese la cantidad de numeros');
  readln(N);
  Vector0(V,n);
  LeerN(V,n);
  Mostrarcont(V);
  readln();
end.

