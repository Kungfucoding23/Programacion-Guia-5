program Ej06;

Uses
 Crt;

Const
  CantElem=60;

Type
  TVS=array [1..CantElem] of string;
  TVB=array ['A'..'Z'] of byte;

Procedure InicializaVec(Var VecCont:TVB);
 var
  i:char;
 begin
   For i:='A' to 'Z' do
    VecCont[i]:=0;
 end;

Procedure Lectura(Var N:byte;Var Vec:TVS);
 var
   arch:text;
   Car:char;
 begin
   Assign(arch,'Ej06arch.txt');
   Reset(arch);
   N:=0;
   Read(arch,Car);
   While not eof (arch) do
    begin
     If (Car<>' ') and (Car<>',') and (Car<>'.') then
      begin
       N:=N+1;
       While (not eof (arch)) and (Car<>' ') and (Car<>',') and (Car<>'.') do
        begin
         Vec[N]:=Vec[N]+Car;
         Read(arch,Car);
        end;
      end
     else
      Read(arch,Car);
    end;
   Close(arch);
 end;

Function Longitud(N:byte;Vec:TVS):byte;
 var
   i,MaxLong:byte;
 begin
   MaxLong:=Length(Vec[1]);
   For i:=2 to N do
    If (Length(Vec[i])>MaxLong) then
     MaxLong:=Length(Vec[i]);
   Longitud:=MaxLong;
 end;

Function PalAntes(N:byte;Vec:TVS):string;
 var
  i:byte;
  Antes:string;
 begin
   Antes:=Upcase(Vec[1]);
   For i:=2 to N do
    begin
    If (Upcase(Vec[i])<Upcase(Antes)) then
     Antes:=Vec[i];
    end;
   PalAntes:=Antes;
 end;

Procedure FrecuenciaLetra(N:byte;Vec:TVS; var VecCont:TVB);
 var
  i,w:byte;
  Pal:string;
 begin
   For i:=1 to N do
    begin
     Pal:=Vec[i];
     For w:=1 to Length(Pal) do
      begin
       Pal[w]:=Upcase(Pal[w]);
       VecCont[Pal[w]]:=VecCont[Pal[w]]+1;
      end;
    end;
 end;

Procedure MuestraVecSt(N:byte;Vec:TVS);
 var
  i:byte;
 begin
   For i:=1 to N do
    Write(Vec[i]:15);
   Writeln();
 end;

Procedure MuestraVecFrec(VecCont:TVB);
 var
  i:char;
 begin
   For i:='A' to 'Z' do
    Writeln('La frecuencia de la letra ',i,' es: ',VecCont[i]);
 end;

Var
  N:byte;
  Vec:TVS;
  VecCont:TVB;
begin
  ClrScr;
  InicializaVec(VecCont);
  Lectura(N,Vec);
  MuestraVecSt(N,Vec);
  Writeln('La frase contiene: ',N,' palabras');
  Writeln('La palabra mas larga tiene: ',Longitud(N,Vec),' caracteres');
  Writeln('La palabra que esta antes en el diccionario es: ',PalAntes(N,Vec));
  FrecuenciaLetra(N,Vec,VecCont);
  MuestraVecFrec(VecCont);
  Readln();
end.
