/***************************************************
  Скрипт рисует ссылку.
  argument0 - х;
  argument1 - y;
  argument2 - текст;
  Возвращает 1, если игрок кликнул на текст, иначе - 0.
 ***************************************************/
var xx, yy, str, width, height; // Задаём временные переменные
xx = argument0;
yy = argument1;
str = argument2;
width = string_width(str);
height = string_height(str);

if mouse_x > xx and mouse_y > yy and mouse_x < xx + width and mouse_y < yy + height // Если пользователь навёл на мышку, то...
{
    draw_set_color(c_red); // Устанавливаем цвет, с которым рисуется выделенная ссылка
    draw_text(xx, yy, str); // Рисуем текст
    draw_line(xx, yy + height, xx + width, yy + height); // Рисуем подчёркивание
    
    if mouse_check_button_released(mb_left) // Если пользователь кликнул на ссылку, то...
    {
        return 1; // Возвращаем 1, и завершаем работу скрипта
    }
}
else
{
    draw_set_color(c_blue); // Рисуем ссылку обычным цветом
    draw_text(xx, yy, str);
}

return 0; // Возвращаем 0 - пользователь не кликал на ссылку
/*
Пример использования, draw event:
Код:
if draw_text_button(0, 0, 'button')
{
    execute_shell("http://google.com/", 0);
}*/
