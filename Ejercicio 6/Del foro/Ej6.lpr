program Ej6;

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
         Vec[N]:=Vec[N]+Car; // arma las palabras en vec[N]
         Read(arch,Car);
        end;
      end
     else
      Read(arch,Car); // si termina la palabra lee el siguiente caracter que comenzara en la siguiente hasta llegar al punto final
    end;
   Close(arch);
 end;
// encuentra la longitud de la palabra mas larga
Function Longitud(N:byte;Vec:TVS):byte;
 var
   i,MaxLong:byte;
 begin
   MaxLong:=Length(Vec[1]); // le asigno a mazlong la longitud de la primer palabra leida en la primer posicion del vector
   For i:=2 to N do  //entonces desde la segunda palabra busco si hay alguna mayor
    If Length(Vec[i])>MaxLong then
     MaxLong:=Length(Vec[i]);   //si la encuentra sobreescribe el valor de MaxLong
   Longitud:=MaxLong;
 end;
//busca la palabra que aparece antes en el diccionario
{procedure OrdenAlfabetico(Var Vecpal:TV;Var ContPal:word);
var
  i,j:byte;
  menor,mayor:string;
begin
     for i:=1 to contpal do
     begin
          for j:=1 to (contpal-1) do
          begin
               if vecpal[j]<vecpal[j+1]then
               begin
                    mayor:=vecpal[j+1];menor:=vecpal[j];
               end
               else
               begin
                    menor:=vecpal[j+1];mayor:=vecpal[j];
               end;
               vecpal[j]:=menor;vecpal[j+1]:=mayor;
          end;
     end;

end;}
Function PalAntes(N:byte;Vec:TVS):string;
 var
  i:byte;
  Antes:string;
 begin
   Antes:=Upcase(Vec[1]); // a antes le doy la primer palabra
   For i:=2 to N do
    begin
    If Upcase(Vec[i])<Upcase(Antes) then // si encuentra una que venga antes reemplza el valor
     Antes:=Vec[i];
    end;
   PalAntes:=Antes;  // no entiendo xq muestra solo la letra a!!!!!!!!!!!!
 end;
// encuentra la frecuencia de cada letra
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
       Pal[w]:=Upcase(Pal[w]);  // lee los caracteres y si son iguales los suma en vecont armando otro vector
       VecCont[Pal[w]]:=VecCont[Pal[w]]+1;
      end;
    end;
 end;
// muestra el vector
Procedure MuestraVecSt(N:byte;Vec:TVS);
 var
  i:byte;
 begin
   For i:=1 to N do
    Write(Vec[i]:15);
   Writeln();
 end;
// muestra la frecuencia
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
begin               // programa principal
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
