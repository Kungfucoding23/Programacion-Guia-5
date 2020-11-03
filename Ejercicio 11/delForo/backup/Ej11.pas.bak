program Ej11;

Uses
 Crt;

Const
  CantElem=20;

Type
  TVS=array [1..CantElem] of string;
  TVR=array [1..CantElem] of real;

Procedure Lectura(var N:byte; var VecNom:TVS; var VecLan1,VecLan2:TVR);
 var
  arch:text;
  Car:char;
  Nombre:string;
 begin
   Assign(arch,'Ej11arch.txt');
   Reset(arch);
   Read(arch,Car);
   While not eof (arch) do
    begin
      Nombre:='';
      N:=N+1;
      While (Car<>' ') do
       begin
        Nombre:=Nombre+Car;
        Read(arch,Car);
       end;
      VecNom[N]:=Nombre;
      Readln(arch,VecLan1[N],VecLan2[N]);
      Read(arch,Car);
    end;
   Close(arch);
 end;

Function SuperaLan(N:byte;VecLan1,VecLan2:TVR):byte;
 var
  i,Cont:byte;
 begin
   Cont:=0;
   For i:=1 to N do
    If (VecLan2[i]>VecLan1[i]) then
     Cont:=Cont+1;
   SuperaLan:=Cont;
 end;

Function PosMaxMarca(N:byte;VecLan1,VecLan2:TVR):byte;
 var
  i:byte;
  MaxMarca:real;
 begin
   MaxMarca:=0;
   PosMaxMarca:=0;
   For i:=1 to N do
    begin
      If (VecLan1[i]>MaxMarca) then
       begin
        MaxMarca:=VecLan1[i];
        PosMaxMarca:=i;
       end;
      If (VecLan2[i]>MaxMarca) then
       begin
        MaxMarca:=VecLan2[i];
        PosMaxMarca:=i;
       end;
    end;
 end;

Function BuscaNom(N:byte;VecNom:TVS;Nombre:string):byte;    {busca el nombre ingresado y devuelve la posicion}
 var
  i:byte;
 begin
   BuscaNom:=0;
   i:=1;
   While (i<=N) and (Nombre>=VecNom[i]) do
    begin
      If (VecNom[i]=Nombre) then
       BuscaNom:=i;
      i:=i+1;
    end;
 end;

Procedure GeneraVecSemi(Marca:real;N:byte;VecNom:TVS;VecLan1,VecLan2:TVR;var M:byte;var VecSemi:TVS);
 var
  i:byte;
 begin
  M:=0;
  For i:=1 to N do
   If (VecLan1[i]>=Marca) or (VecLan2[i]>=Marca) then
    begin
     M:=M+1;
     VecSemi[M]:=VecNom[i];
    end;
 end;

Procedure MuestraVecSt(N:byte;VecNom:TVS);
 var
  i:byte;
 begin
  For i:=1 to N do
   Write(VecNom[i]:10);
  Writeln();
 end;

Var
  VecNom,VecSemi:TVS;
  VecLan1,VecLan2:TVR;
  N,Pos,M:byte;
  Nombre:string;
  Marca:real;

begin
  ClrScr;
  Lectura(N,VecNom,VecLan1,VecLan2);
  Writeln(SuperaLan(N,VecLan1,VecLan2),' competidores superaron con el 2do lanzamiento al 1ero');   {inciso a}
  Writeln('El competidor que registro la mejor marca es: ',VecNom[PosMaxMarca(N,VecLan1,VecLan2)]);  {inciso b}
  Writeln('Ingrese el nombre del competidor del cual desea saber los lanzamientos');    {inciso c}
  Readln(Nombre);
  Pos:=BuscaNom(N,VecNom,Nombre);
  If (Pos<>0) then
   Writeln('Competidor: ',VecNom[Pos]:5,' 1er lanzamiento: ',VecLan1[Pos]:6:2,' 2do lanzamiento: ',VecLan2[Pos]:6:2)
  else
   Writeln('Competidor no encontrado');
  Writeln('Ingrese marca a superar para determinar los semifinalistas');Readln(Marca);
  GeneraVecSemi(Marca,N,VecNom,VecLan1,VecLan2,M,VecSemi);
  Writeln('Participantes: ');
  MuestraVecSt(N,VecNom);
  Writeln('Semifinalistas: ');
  MuestraVecSt(M,VecSemi);
  Readln();
end.
