program lab15_3;
type
  PNode = ^TNode;
  TNode = record
    data: integer;
    next: PNode;
  end;

var
  Head, p: PNode;
  i: integer;

begin
  Randomize; 
  New(Head);
  p := Head;
  p^.data := Random(100); 
  WriteLn('Список элементов:');
  Write(p^.data, ' ');
  for i := 1 to 10 do
  begin
    New(p^.next);
    p := p^.next;
    p^.data := Random(100); 
    Write(p^.data, ' ');
  end;
  p^.next := nil;
  Writeln();
  WriteLn('Четные элементы:');
  p := Head;
  while p <> nil do
  begin
    if p^.data mod 2 = 0 then
      Write(p^.data, ' ');
    p := p^.next;
  end;
end.

