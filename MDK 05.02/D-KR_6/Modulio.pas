UNIT Modulio;
Uses GraphABC;

procedure RLine(x, y, x1, y1: real) := Line(Round(x), Round(y), Round(x1), Round(y1)); //нарисовать линию между округленными координатами точек // параметризация
 
function GetAngle(x, y, x2, y2: real): real; //вычисляет угол наклона отрезка, соединяющего точки (x, y) и (x2, y2), относительно оси X // параметризация
begin
  var angle := Abs(RadToDeg(ArcTan((y2 - y) / (x2 - x)))); //декомпозиция
  if (x2 = x) and (y2 = y) then
    Result := 0
  else
  if x2 > x then
    if y2 > y then Result := angle else Result := 360 - angle
    else 
  if y2 > y then Result := 180 - angle else Result := 180 + angle;
end;

function Distance(x, y, x1, y1: real) := Sqrt(Sqr(x1 - x) + Sqr(y1 - y)); //вычисляет расстояние между двумя точками (x, y) и (x1, y1) в декартовой системе координат
procedure Draw(x, y, x1, y1: real); //реализует построение фрактала Кривой Минковского //параметризация
begin
  var r := Distance(x, y, x1, y1); //ВЫЧИСЛЕНИЕ ДЛИНЫ ОТРЕЗКА МЕЖДУ ТОЧКАМИ
  
  if r < 10 then //база рекурсии
    RLine(x, y, x1, y1) //ЕСЛИ R<10 ТО ВЫЗЫВАЕМ RLINE И РИСУЕМ ПРЯМУЮ
  else
  begin
    var angle := GetAngle(x, y, x1, y1); // Вычисляем угол наклона отрезка между точками (x, y) и (x1, y1)
    var angleP := DegToRad(angle + 90); //декомпозиция
    var angleM := DegToRad(angle - 90); //декомпозиция
    
    r /= 4;//Разбиваем текущий отрезок на четыре части
    
    var dx := (x1 - x) / 4; //декомпозиция
    var dy := (y1 - y) / 4; //декомпозиция
    
    var xA := x + dx; //декомпозиция    //вычисляем координаты промежуточных точек A
    var yA := y + dy; //декомпозиция    //вычисляем координаты промежуточных точек A
    var xB := xA + dx; //декомпозиция   //вычисляем координаты промежуточных точек B
    var yB := yA + dy; //декомпозиция   //вычисляем координаты промежуточных точек B
    var xC := xB + dx; //декомпозиция   //вычисляем координаты промежуточных точек C
    var yC := yB + dy; //декомпозиция   //вычисляем координаты промежуточных точек C
    
    //Вычисляем координаты точек x2, y2, x3, y3, x4, y4, x5, y5, используя углы angleP и angleM.
    var x2 := xA + r * Cos(angleP); //декомпозиция
    var y2 := yA + r * Sin(angleP); //декомпозиция
     
    var x3 := xB + r * Cos(angleP); //декомпозиция
    var y3 := yB + r * Sin(angleP); //декомпозиция
    
    var x4 := xB + r * Cos(angleM); //декомпозиция
    var y4 := yB + r * Sin(angleM); //декомпозиция
    
    var x5 := xC + r * Cos(angleM); //декомпозиция
    var y5 := yC + r * Sin(angleM); //декомпозиция
    
    //Рекурсивный вызов процедуры Draw для каждого отрезка
    Draw(x, y, xA, yA);
    Draw(xA, yA, x2, y2);
    Draw(x2, y2, x3, y3);
    Draw(x3, y3, xB, yB);
    Draw(xB, yB, x4, y4);
    Draw(x4, y4, x5, y5);
    Draw(x5, y5, xC, yC);
    Draw(xC, yC, x1, y1);
  end;
  end;
 begin
   
 end.