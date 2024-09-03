program lab15_4;
type
NodePtr = ^Node;
Node = record
Data: Integer;
Next: NodePtr;
end;

const
ListSize = 10;

var
NodeList, CurrentNode, NewNode: NodePtr;
MinValue, MaxValue: Integer;
i: Integer;

begin
Randomize;

NodeList := nil;

for i := 1 to ListSize do
begin
New(NewNode);
NewNode^.Data := Random(100); 
NewNode^.Next := NodeList;
NodeList := NewNode;
end;

CurrentNode := NodeList;

if CurrentNode = nil then
begin
Writeln('Список пуст.');
Exit;
end;

MinValue := CurrentNode^.Data;
MaxValue := CurrentNode^.Data;

while CurrentNode <> nil do
begin
if CurrentNode^.Data < MinValue then
MinValue := CurrentNode^.Data;

if CurrentNode^.Data > MaxValue then
MaxValue := CurrentNode^.Data;

CurrentNode := CurrentNode^.Next;
end;

Writeln('Случайный список:');
CurrentNode := NodeList;
while CurrentNode <> nil do
begin
Write(CurrentNode^.Data, ' -> ');
CurrentNode := CurrentNode^.Next;
end;
WriteLn('nil');

Writeln('Минимальный элемент: ', MinValue);
Writeln('Максимальный элемент: ', MaxValue);
end.