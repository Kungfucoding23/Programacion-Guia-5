{11. De una competencia de atletismo se tienen los siguientes datos del lanzamiento de jabalina:
 Nombre del competidor (ordenado ascendentemente por este dato)
 1º lanzamiento
 2º lanzamiento
Se pide:
a) Cuántos superaron con el 2º lanzamiento el 1º
b) Nombre del que registró mejor marca.
c) Dado el Nombre de un atleta, informar la marca que realizó en ambos lanzamientos.
d) Generar un nuevo arreglo con los participantes que pasaron a la semifinal (aquellos que
superaron una marca X establecida en el 1º ó 2º lanzamiento). Mostrar ambos arreglos.
}
program Ej11;
Uses
    crt;
const
  cant = 20;
type
  TVS = array[1..cant] of string;
  TVR = array[1..cant] of real;
Procedure Lectura(var N:byte; var Nom:TVS; var L1, L2:TVR);
 var
  arch:text;
  Car:char;
  Nombre:string;
 begin
   Assign(arch,'datos.txt'); Reset(arch);
   Read(arch,Car);
   While not eof (arch) do
    begin
      Nombre:='';
      N:=N+1;
      While (Car<>' ') do // lee el nombre
       begin
        Nombre:=Nombre+Car;
        Read(arch,Car);
       end;
      Nom[N]:=Nombre; // guardo el nombre en la posicion N del vector
      Readln(arch, L1[N], L2[N]); // leo los lanzamientos
      Read(arch,Car); // y este p que?
    end;
   Close(arch);
 end;
// a) cuenta cuantos superaron el primer lanzamiento con el segundo
Function superaLan(N:byte; L1, L2:TVR) : byte;
 var
  i, Cont: byte;
 begin
   Cont:= 0;
   For i:= 1 to N do
    If (L2[i] > L1[i]) then
     Cont:= Cont + 1;
   superaLan:= Cont;
 end;

//b) nombre del que registro la mejor marca
Function mejorMarca(N: byte; L1, L2: TVR) : byte;
 var
  i: byte;
  MaxMarca: real;
 begin
   MaxMarca:= 0;
   mejorMarca:= 0;
   For i:= 1 to N do
    begin
      if (L1[i] > MaxMarca) then
       begin
        MaxMarca:= L1[i];
        mejorMarca:= i;
       end;
      If (L2[i] > MaxMarca) then
       begin
        MaxMarca:= L2[i];
        mejorMarca:= i;
       end;
    end;
 end;

// c) dado el nombre de un atleta, informar...  esta funcion ubica la posicion del nombre ingresado si es que existe
Function buscaNom(N: byte; Nom: TVS; nombre: string) : byte;
var
 i: byte;
begin
  buscaNom:= 0;
  i:= 1;
  while (i <= N) and (nombre <> Nom[i]) do  // si lo encuentra la segunda condicion resulta falsa y sale del ciclo while en la posicion i donde lo encontro
        i:= i + 1;
  if i <= N then
   buscaNom:= i // si no termino de leer el arreglo significa que lo encontro y guardo la posicion
   else
    buscaNom:= 0; // si no lo encontro guardo un cero
end;

// d) generar arreglo con losparticipantes que pasaron a la semifinal
Procedure generaSemi(var M: byte; var VSemi: TVS; marca: real; Nom: TVS; L1, L2: TVR; N: byte);
var
 i: byte;
begin
  M:= 0;
  for i:= 1 to N do
  begin
    if (L1[i] > marca) or (L2[i] > marca) then
    begin
     M:= M + 1;
     Vsemi[M]:= Nom[i];
    end;
  end;
end;

Procedure showVec(Nom: TVS; N: byte);
var
 i: byte;
begin
  for i:= 1 to N do
      write(Nom[i]:10);
  writeln();
end;

var
 Nom, Vsemi: TVS;
 L1, L2: TVR;
 N, pos, M: byte;
 marca: real;
 nombre: string;

Begin
  Lectura(N, Nom, L1, L2);
  writeln('La cantidad que superaron el primer lanzamiento es: ', superaLan(N, L1, L2));  // inciso a)
  writeln('El nombre del que registro la mejor marca es: ', Nom[mejorMarca(N, L1, L2)]); // inciso b)
  writeln('Ingrese el nombre del atleta que busca'); readln(nombre); // c)
  pos:= buscaNom(N, Nom, nombre);
  if pos <> 0 then
     writeln('Competidor: ',Nom[pos]:5,' 1er lanzamiento: ',L1[pos]:6:2,' 2do lanzamiento: ',L2[pos]:6:2)
  else
   Writeln('Competidor no encontrado');
  Writeln('Ingrese marca a superar para determinar los semifinalistas');Readln(Marca);
  generaSemi(M, VSemi, marca, Nom, L1, L2, N);
  writeln('Participantes: ');
  showVec(Nom, N);
  Writeln('Semifinalistas: ');
  showVec(VSemi, M);
  Readln();
end.

