fadein = 1;
left_nbor =0;
bottom_nbor =0;
right_nbor =0;
top_nbor =0;
i = 0.2;
opt = instance_position(roomx+cell_width,roomy,obj_room);
if opt{right_nbor =1;opt.seen = i;}
opt = instance_position(roomx,roomy+cell_height,obj_room)
if opt{bottom_nbor=1;opt.seen = i;}
opt = instance_position(roomx-cell_width,roomy,obj_room)
if opt{left_nbor=1;opt.seen = i;}
opt = instance_position(roomx,roomy-cell_height,obj_room)
if opt{top_nbor=1;opt.seen = i;}

//get current room details
opt = -1;
opt = instance_position(roomx,roomy,obj_room);
if opt > 0{
opt.seen = 1;}

////wall you in the new room.
i = 1;
repeat(8){
if instance_exists(wall[i]){
with wall[i]{instance_destroy();}}
i+=1;}

if right_nbor = 0{
wall[1] = instance_create(384,224,obj_wall);
wall[2] = instance_create(384,224-32,obj_wall);}

if left_nbor = 0{
wall[3] = instance_create(64-32,224,obj_wall);
wall[4] = instance_create(64-32,224-32,obj_wall);}

if top_nbor = 0{
wall[5] = instance_create(224,64-32,obj_wall);
wall[6] = instance_create(224-32,64-32,obj_wall);}

if bottom_nbor = 0{
wall[7] = instance_create(224,384,obj_wall);
wall[8] = instance_create(224-32,384,obj_wall);}
