program dkr2_zad1;

var
  arr: array[1..10] of integer;
  sum, i: integer;

begin
  sum := 0;
  for i := 1 to 10 do
  begin
    readln(arr[i]);
  end;
  for i := 2 to 10 step 2 do
  begin
    sum := sum + arr[i];
  end;
  writeln('Сумма элементов на четных позициях: ', sum);
end.