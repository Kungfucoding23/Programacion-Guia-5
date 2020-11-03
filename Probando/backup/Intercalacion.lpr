program Intercalacion;
const
  cant = 20;
type
  TV = array[1..cant] of integer;
Procedure leeParalelos(var V1, V2: TV; var N1, N2: byte);
var
  arch: text;
begin
  N1:= 1;
  N2:= 1;
  assign(arch, 'Intercalacion.txt'); reset(arch);
  while not eof(arch) do
  begin
    repeat
      read(arch, V1[N1]);
      N1:= N1 + 1;
    until eoln(arch);
    repeat
      read(arch, V2[N2]);
      N2:= N2 + 1;
    until eoln(arch);
  end;

  close(arch);
end;
Procedure show(V: TV; N: byte);
var
  i, w: byte;
begin
  for i:= 1 to N do
      write(V[i],' ');
  writeln();
  writeln('===============================');
end;
Procedure Intercala(V1, V2: TV; N1, N2: byte; var V3: TV; var N3: byte);
var
  t, i, j: byte;
begin
  i:= 1; j:= 1; N3:= 0;
  while (i <= N1) and (j <= N2) do
  begin
    N3:= N3 + 1;
    if V1[i] < V2[j] then
    begin
      V3[N3]:= V1[i]; i:= i + 1;
    end
    else
        if V1[i] > V2[j] then
        begin
          V3[N3]:= V2[j]; j:= j + 1;
        end
        else
            begin
              V3[N3]:= V1[i];
              i:= i + 1; j:= j + 1;
            end;
  end;//while
  // En caso de que un arreglo termine antes que el otro
  // hago un for que va a empezar desde la ultima posicion guardada que es 'i'
  for t:= i to N1 do // este es el for para V1 si fuese el mas grande
  begin
    N3:= N3 + 1;
    V3[N3]:= V1[t];
  end;
  for t:= j to N2 do // y este para V2..
  begin
    N3:= N3 + 1;
    V3[N3]:= V2[t];
  end;
end;

Procedure find(var pos: byte; V3: TV; N3: byte; x: integer);
var
  i: byte;
begin
  i:= 1;
  while (i <= N3) and (x <> V3[i]) do
        i:= i + 1;
  if i <= N3 then // significa que lo encontro
     pos:= i
     else
       pos:= 0;
end;
Procedure Delete(var V3: TV; var N3: byte; pos: byte);
var
  i: byte;
begin
  for i:= pos + 1 to N3 do
      V3[i - 1]:= V3[i];
  N3:= N3 - 1;
end;

Procedure SacaCeros(var V3: TV; var N3: byte; x: integer; pos: byte);
var
  i: byte;
begin
  i:= 0;
  repeat
    find(pos, V3, N3, x);
    if pos <> 0 then
    begin
      Delete(V3, N3, pos);
      i:= i + 1;
    end;
  until i = 2;
end;


var
  V1, V2, V3: TV;
  N1, N2, N3, pos: byte;
  x: integer;
begin
  x:= 0;
  leeParalelos(V1, V2, N1, N2);
  show(V1, N1);
  show(V2, N2);
  Intercala(V1,V2, N1, N2, V3, N3);
  writeln('Vector intercalado con V1 y V2:');
  writeln();
  show(V3, N3);
  writeln();
  //quiero que encuentre si tiene ceros y los elimine
  writeln('Saco los ceros: ');
  SacaCeros(V3, N3, x, pos);
  show(V3, N3);
  readln();
end.

