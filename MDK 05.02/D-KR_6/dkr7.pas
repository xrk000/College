USES Modulio;
uses GraphABC; 
 
var
  x, y, x1, y1: integer;
  procedure text; //отвечает за вывод подсказок на экран
begin
  textout(10, 10, 'Left - влево');
  textout(10, 30, 'Right - вправо');
  textout(10, 50, 'Up - вверх');
  textout(10, 70, 'Down - вниз');
  textout(10, 90, 'a - увеличение');
  textout(10, 110, 'd - уменьшение');
end;

 
procedure KeyDown(key: integer);//обрабатывает нажатия клавиш на клавиатуре для перемещения рисунка в соответствующем направлении
begin
  case key of
    VK_Up:
      begin
        y := y - 5;
        y1 := y1 - 5;
      end;
    VK_Down:
      begin
        y := y + 5;
        y1 := y1 + 5;
      end;
    VK_Left:
      begin
        x := x - 5;
        x1 := x1 - 5;
      end;
    VK_Right:
      begin
        x := x + 5;
        x1 := x1 + 5;
      end;
  end;
  Window.Clear;
end;
 
procedure KeyUp(a: integer);//станавливает глубину отрисовки фрактала в зависимости от нажатой клавиши
begin
  case a of
    VK_A: if x > 0 then x := x - 50; 
    Vk_D: if x < 700 then x := x + 50;
    vk_s: x := x - 10;
    vk_w: x := x + 10;
  end; 
  Window.Clear;
  
end;

 

begin
  LockDrawing; //вызывается процедура Draw для его отрисовки, а также устанавливаются обработчики событий клавиш для управления фракталом
  
  x := 5;
  y := 250;
  x1 := 20;
  y1 := 250;
  repeat
    redraw;
    sleep(1);
    text;
    draw(x, y, x1, y1);
    onKeyDown := keydown;
    onKeyUp := keyup;
  until(False);
end.
