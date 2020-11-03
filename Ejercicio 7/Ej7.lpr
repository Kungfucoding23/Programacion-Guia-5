{7. Escriba un programa que realice la suma de dos números positivos muy grandes (de 10 cifras,
por ejemplo)}
{datos.txt
7 8 9
9 9 9 9 9
}
program Ej7;
const
  max = 20;
type
  TV = array[1..max] of byte;


                    //variable de entrada // variables de salida
Procedure strToVec(linea: string; var VN: TV; var n: byte);
var
  i: byte;
  code: integer;
begin
  n:= length(linea); // tomo la cantidad de elementos que tiene el arreglo que coincidira con la longitud de la linea
  for i:= 1 to n do
      val(linea[i], VN[i], code); // la funcion val convierte un char a su representacion numerica
end;

Procedure leerNros(var VN1, VN2: TV; var N, M: byte);
var
  linea: string;
  arch: text;
begin
  assign(arch, 'datos.txt'); reset(arch);

  readln(arch, linea); // LEE EL NUMERO COMO UN STRING
  strToVec(linea, VN1, N);

  readln(arch, linea);
  strToVec(linea, VN1, N);

  close(arch);
end;
               //variables de entrada     //variables de salida
Procedure suma(VN1, VN2: TV; N, M: byte; var VN3: TV; var W: byte);
var
  result, sobra: byte;
begin
  W:= 0;
  sobra:= 0;

  while (N > 0) or (M > 0) do
  begin
    result:= sobra;

    if N > 0 then
    begin
      result:= result + VN1[N];
      N:= N - 1;
    end;

    if M > 0 then
    begin
      result:= result + VN2[M];
      M:= M - 1;
    end;

    W:= W + 1;
    VN3[W]:= result mod 10;
    sobra:= result div 10;
  end;

  if sobra > 0 then
  begin
    W:= W + 1;
    VN3[W]:= sobra;
  end;

end;
// como el resultado quedo invertido lo muestro con un down to
Procedure show(VN: TV; W: byte);
var
  i: byte;
begin
  for i:= W downto 1 do
  begin
    write(VN[i] : 1);
  end;
end;

var
  VN1, VN2, VN3: TV; // vectores primer y segundo numero y resultado
  N, M, W: byte;
begin
  leerNros(VN1, VN2, N, M);
  suma(VN1, VN2, N, M, VN3, W);
  show(VN3, W);
  readln();
end.

