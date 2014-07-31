scr_map_draw();
draw_doors();

//draw the player
draw_sprite(sprite_index,image_single,x,y);

//draw the fade effect
draw_set_alpha(fadein);
draw_set_color(c_black);
draw_rectangle(0,0,room_width,room_height,0);
draw_set_alpha(1);





draw_set_halign(fa_right);
//draw_text(4,room_height-32,string(right_nbor));
//draw_text(4,room_height-16,"GMC:StallionTG - creativegametheory.com");
//draw_set_halign(fa_right);
draw_set_color(c_white);
draw_text(room_width-4,room_height-16,string(obj_floor.room_count)+" / "+string(max_rooms));
