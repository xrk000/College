program lab15_2;
type
  PNode = ^Node; // для указателя на узел списка
  Node = record // для самого узла списка
    word: string[40]; // узел содержит строку
    count: integer; // счётчик
    next: PNode; // указатель на следующий узел
  end;

var
  Head: PNode = nil; // указатель на начало списка узлов
  
function CreateNode(NewWord: string): PNode; // создаёт новый узел со словом NewWord и счётчиком, равным 1
var
  NewNode: PNode;
begin
  New(NewNode);
  NewNode^.word := NewWord;
  NewNode^.count := 1;
  NewNode^.next := nil;
  Result := NewNode;
end;

procedure Sort(var Head: PNode; NewNode: PNode); // сортирует список узлов, чтобы новый узел NewNode был добавлен в правильное место в соответствии с его словом
var
  Current, Previous: PNode;
begin
  Current := Head;
  Previous := nil;
  
  while (Current <> nil) and (Current^.word < NewNode^.word) do
  begin
    Previous := Current;
    Current := Current^.next;
  end;
  
  if Previous = nil then
  begin
    NewNode^.next := Head;
    Head := NewNode;
  end
  else
  begin
    NewNode^.next := Previous^.next;
    Previous^.next := NewNode;
  end;
end; // если NewNode является первым элементом списка, он становится новым началом списка. 
// в противном случае он добавляется после предыдущего узла, который имеет слово меньше, чем у нового узла.

function FindOrAddNode(var Head: PNode; Word: string): PNode; // ищет слово Word в списке
var
  Current: PNode;
begin
  Current := Head;
  while Current <> nil do
  begin
    if Current^.word = Word then
    begin
      Inc(Current^.count);
      Exit();
    end;
    Current := Current^.next;
  end;
  Current := CreateNode(Word);
  Sort(Head, Current);
end;

procedure PrintList(Head: PNode); // выводит все слова и их счётчики из списка
var
  Current: PNode;
begin
  Current := Head;
  while Current <> nil do
  begin
    writeln(Current^.word, ': ', Current^.count);
    Current := Current^.next;
  end;
end;

function CountAllNodes(Head: PNode): integer; // подсчитывает общее количество узлов в списке
var
  Count: integer;
  Current: PNode;
begin
  Count := 0;
  Current := Head;
  while Current <> nil do
  begin
    Inc(Count);
    Current := Current^.next;
  end;
  Result := Count;
end;

var
  F: TextFile;
  Word: string;
  TotalWords: integer;
begin
  AssignFile(F, 'input.txt');
  Reset(F);
  while not eof(F) do
  begin
    ReadLn(F, Word);
    FindOrAddNode(Head, Word);
  end;
  CloseFile(F);
  PrintList(Head);
  TotalWords := CountAllNodes(Head);
  writeln('Всего уникальных слов (количество узлов): ', TotalWords);
end.
