program DKR2_Zad2;
var
  str: string;
  w, l, i: integer;
  iL: boolean;
begin
  writeln('Введите строку:');
  readln(str);
  w := 0;
  l := 0;
  iL := false;
  for i := 1 to length(str) do
  begin
    if (str[i] in ['а'..'я', 'А'..'Я']) then
    begin
      if not iL then
      begin
        iL := true;
        inc(w);
      end;
      inc(l);
    end
    else
    begin
      iL := false;
    end;
  end;
  writeln('Число слов в строке: ', w);
  writeln('Число букв в строке: ', l);
end.