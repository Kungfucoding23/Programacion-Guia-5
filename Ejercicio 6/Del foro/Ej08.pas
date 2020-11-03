program Ej08;

Uses
 Crt;

Const
  CantElem=20;

Type
  TVR=array [1..CantElem] of real;
  TVB=array [1..CantElem] of byte;

Procedure InicializaVec(var Vec2:TVB);
 var
  i:byte;
 begin
   For i:=1 to CantElem do
    Vec2[i]:=0;
 end;

Procedure Lectura(var N:byte; var Vec:TVR);
 var
  arch:text;
 begin
   Assign(arch,'Ej08arch.txt');
   Reset(arch);
   While not eof (arch) do
    begin
      N:=N+1;
      Read(arch,Vec[N]);
    end;
   Close(arch);
 end;

Procedure GeneraVec2(N:byte;Vec:TVR; var M:byte; var Vec2:TVB);
 var
  i:byte;
 begin
   M:=1;
   For i:=1 to N do
    begin
     Vec2[M]:=Vec2[M]+1;
     If (i<N) and (Vec[i+1]<>Vec[i]) then
      M:=M+1;
    end;
 end;

Procedure MuestraVec(M:byte;Vec2:TVB);
 var
  i:byte;
 begin
   For i:=1 to M do
    Write(Vec2[i]:5);
 end;

Var
 N,M:byte;
 Vec:TVR;
 Vec2:TVB;

begin
  ClrScr;
  InicializaVec(Vec2);
  Lectura(N,Vec);
  GeneraVec2(N,Vec,M,Vec2);
  MuestraVec(M,Vec2);
  Readln();
end.
