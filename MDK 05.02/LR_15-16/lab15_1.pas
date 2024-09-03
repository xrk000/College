program lab15_1;
var
  i: Integer;
  i_ptr: ^Integer;

begin
  i := 2;
  i_ptr := @i;
  writeln('Значение по адресу, на который указывает i_ptr: ', i_ptr^);
end.