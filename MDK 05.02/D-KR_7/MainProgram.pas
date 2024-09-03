program MainProgram;

uses crt, StaticLs;

var
  choice, punkt: integer;
  ch: integer;

begin
  repeat
    ClrScr;
    writeln('1. Двусвязный список на статической памяти');
    writeln('2. Выход');
    readln(ch);
    case ch of
      1: StaticL;
      2: Exit
    end;
  until ch = 2;
end.
