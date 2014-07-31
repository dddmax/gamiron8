/*
Скрипт плавно изменяет направление башни до требуемого
Возвращает полученное направление
argument0 - текущее направление
argument1 - требуемое направление
argument2 - скорость изменения направления
*/
var diff;
diff = scr_get_angle_difference(argument0, argument1);
if abs(diff) < argument2
    return argument1;

return argument0 + argument2 * sign(diff);


//image_angle = smooth_angle(image_angle, point_direction(x, y, mouse_x, mouse_y), 3);
