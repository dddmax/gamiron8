StartX = view_xview[0]+10;
StartY = view_yview[0]+10;
Width = view_xview[0]+115;
Height = view_yview[0]+115;

draw_set_alpha(0.85);

draw_set_color(c_black);
draw_rectangle(StartX-6,StartY-6,Width+15,Height+15,true);

draw_set_color(c_gray);
draw_rectangle(StartX-5,StartY-5,Width+15,Height+15,false);

if(instance_number(obj_enemy) > 0)
{
    for(e = 0; e < instance_number(obj_enemy); e += 1)
    {
        if(instance_find(obj_enemy,e).x > 0 && instance_find(obj_enemy,e).x < room_width && instance_find(obj_enemy,e).y > 0 && instance_find(obj_enemy,e).y < room_height)
        {
            draw_sprite_ext(spr_EnemyOnMap,0,StartX+Width/room_width*instance_find(obj_enemy,e).x,StartY+Height/room_height*instance_find(obj_enemy,e).y,1,1,instance_find(obj_enemy,e).direction,image_blend,0.85);
        }
    }
}

if(instance_number(obj_player) > 0)
{
    for(p = 0; p < instance_number(obj_player); p += 1)
    {
        if(instance_find(obj_player,p).x > 0 && instance_find(obj_player,p).x < room_width && instance_find(obj_player,p).y > 0 && instance_find(obj_player,p).y < room_height)
        {
            draw_sprite_ext(spr_PlayerOnMap,0,StartX+Width/room_width*instance_find(obj_player,p).x,StartY+Height/room_height*instance_find(obj_player,p).y,1,1,instance_find(obj_player,p).direction,image_blend,0.85);
        }
    }
}

draw_set_alpha(1);