program Ej12;

Uses
 Crt;

Const
  CantElem=20;
  CANTNUM=3;

Type
  TVS=array [1..CantElem] of string;
  TVR=array [1..CantElem] of real;
  TVC=array [1..CantElem] of char;

Procedure Lectura(var N:byte; var VClave:TVS; var VProm:TVR; var VCar:TVC);
 var
  arch:text;
  Car,UltLetra:char;
  Contra:string;
  ContEsp,i:byte;
  Num,Suma,Promedio:real;
 begin
   Assign(arch,'Ej12arch.txt');
   Reset(arch);
   Read(arch,Car);
   N:=0;
   While not eof (arch) do
    begin
     Contra:='';
     ContEsp:=0;
     Suma:=0;
     While (Car<>' ') do
      begin
       Case (Car) of
        'A'..'Z','a'..'z': begin
                            Contra:=Contra+Car;
                            UltLetra:=Car;           {solamente guardo el caracter si es letra}
                           end;
        '0'..'9': Contra:=Contra+Car;
        else
          ContEsp:=ContEsp+1;
        end;
       Read(arch,Car);
      end;
     If (ContEsp<=3) then                 {solamente si hay 3 caracteres especiales o menos, guardo los datos correspondientes}
      begin
       For i:=1 to CANTNUM do
        begin
         Read(arch,Num);
         Suma:=Suma+Num;
        end;
       Promedio:=Suma/CANTNUM;
       Read(arch,Car);
       While (Car=' ') do
        Read(arch,Car);
       If (Car<>UltLetra) then
        begin
         N:=N+1;
         VClave[N]:=Contra;
         VProm[N]:=Promedio;
         VCar[N]:=Car;
        end;
      end;
     Readln(arch);              {bajo de linea en el archivo}
     Read(arch,Car);            {leo el nuevo caracter}
    end;
   Close(arch);
 end;

Function PosMaxProm(Letra:char;N:byte;VProm:TVR;VCar:TVC):byte;     {devuelve la posicion de la clave de maximo promedio}
 var                                                                {o 0 si no se encontro, de acuerdo a la letra ingresada}
  i:byte;
  MaxProm:real;
 begin
  PosMaxProm:=0;
  MaxProm:=0;
  For i:=1 to N do
   If (VCar[i]=Letra) and (VProm[i]>MaxProm) then
    begin
     PosMaxProm:=i;
     MaxProm:=VProm[i];
    end;
 end;

Procedure InfoMaxProm(N:byte;VClave:TVS;VProm:TVR;VCar:TVC);     {devuelve la clave de maximo promedio}
 var
  Letra:char;
  Pos:byte;
 begin
  Writeln('Ingrese una letra para hallar la clave de maximo promedio');
  Read(Letra);
  Pos:=PosMaxProm(Letra,N,VProm,VCar);
  If (Pos<>0) then
   Writeln('La clave de maximo promedio para la letra: ',Letra,' es: ',VClave[Pos])
  else
   Writeln('No se encontro la letra ingresada');
 end;

Function PosInfoClave(Clave2:string;N:byte;VClave:TVS):byte;       {devuelve la posicion de la clave ingresada}
 var                                                                {o 0 si no la encontro}
  i:byte;
 begin
  PosInfoClave:=0;
  i:=1;
  While (i<=N) and (Clave2<>VClave[i]) do
   begin
    PosInfoClave:=i;
    i:=i+1;
   end;
 end;

Procedure InfoClave(N:byte;VClave:TVS;VProm:TVR;VCar:TVC);
 var
 Clave2:string;
 PosInfo:byte;
 begin
  Writeln('Ingrese una clave para saber su promedio y la letra asociada');
  Readln(Clave2);
  PosInfo:=PosInfoClave(Clave2,N,VClave);
  If (PosInfo<>0) then
   Writeln('Clave: ',VClave[PosInfo]:6,'Promedio: ',VProm[PosInfo]:6:2,'Letra asociada: ',VCar[PosInfo])
  else
   Writeln('No se encontro la clave ingresada');
 end;

Procedure MuestraStr(N:byte;VClave:TVS);
 var
  i:byte;
 begin
  For i:=1 to N do
   Write(VClave[i]:10);
  Writeln();
 end;

Procedure MuestraR(N:byte;VProm:TVR);
 var
  i:byte;
 begin
  For i:=1 to N do
   Write(VProm[i]:10:2);
  Writeln();
 end;

Procedure MuestraC(N:byte;VCar:TVC);
 var
  i:byte;
 begin
  For i:=1 to N do
   Write(VCar[i]:10);
  Writeln();
 end;

Var
 VClave:TVS;
 VProm:TVR;
 VCar:TVC;
 N:byte;

begin
 ClrScr;
 Lectura(N,VClave,VProm,VCar);
 MuestraStr(N,VClave);
 MuestraR(N,VProm);
 MuestraC(N,VCar);
 InfoMaxProm(N,VClave,VProm,VCar);
 InfoClave(N,VClave,VProm,VCar);
 Readln();
end.

