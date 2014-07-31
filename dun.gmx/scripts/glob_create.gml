scr_map_create();
instance_create(x,y,obj_floor);

start = 0;
move_speed = 6;

imgi = 0;
imgx = 0;
imgy = 0;
image_single = 0;
roomx = 0;
roomy = 0;
fadein = 1;

left_nbor =0;
bottom_nbor =0;
right_nbor =0;
top_nbor =0;


//wall array
i = 1;
repeat(8){
wall[i] = 0;
i+=1;}
