program obratniyporyadok;

type
  PNode = ^Node;
  Node = record
    data: integer;
    next: PNode;
  end;

var
  Head, p: PNode;
  FInput, FOutput: Text;
  num, i: integer;

procedure AddFirst(var Head: PNode; num: integer);
var
  NewNode: PNode;
begin
  New(NewNode);
  NewNode^.data := num;
  NewNode^.next := Head;
  Head := NewNode;
end;

begin
  Randomize; 
  Assign(FInput, 'input2.txt');
  Rewrite(FInput);
  for i := 1 to 10 do
  begin
    num := Random(100); 
    WriteLn(FInput, num);
  end;
  Close(FInput);

  Assign(FInput, 'input2.txt');
  Reset(FInput);
  Head := nil;
  while not EOF(FInput) do
  begin
    Readln(FInput, num);
    AddFirst(Head, num);
  end;
  Close(FInput);

  Assign(FOutput, 'output2.txt');
  Rewrite(FOutput);
  p := Head;
  while p <> nil do
  begin
    WriteLn(FOutput, p^.data);
    p := p^.next;
  end;
  Close(FOutput);
  Writeln('Список чисел был записан в обратном порядке в файл output2.txt');
 end.




