/*
topx = 0;//room_width-(cell_width*grid_width);
topy = 0;//room_height-(cell_height*grid_height);
curx = topx+2+96;//(floor(((cell_width*grid_width)/2)/cell_width)*cell_width)+2;
cury = topy+2+96;//(floor(((cell_height*grid_height)/2)/cell_height)*cell_height)+2;
botx = room_width;
boty = room_height;
*/
//re-generate the room when enter pressed
if keyboard_check_pressed(vk_enter){
room_restart();
}


//find starting position.
if room_count = 0{
glob.roomx = botx+(floor(((cell_width*grid_width)/2)/cell_width)*cell_width);
glob.roomy = boty+(floor(((cell_height*grid_height)/2)/cell_height)*cell_height);
curx = glob.roomx;
cury = glob.roomy;
}


//start making rooms(aka obj_room)
if instance_number(obj_room) < max_rooms{

opt = instance_create(curx,cury,obj_room);
if room_count = 0{start_room = opt;}
room_count += 1;

//while loop to crunch all the data before allowing another room to be made.
checkwhile = 0;
ran = 0;

while checkwhile = 0{

//lazy way to keep the game from crashing if you ask for more room then can fit.
ran+=1;
if ran > 10000{room_count += 1;exit;}

newx = curx;
newy = cury;


//check for neibors of the current cell


i = 1+floor(random(6));
//chance to expand in a direction
if i = 1{newx = curx+cell_width;}
if i = 2{newy = cury-cell_height;}
if i = 3{newx = curx-cell_width;}
if i = 4{newy = cury+cell_height;}

//chance to pick a random room to start expanding from insteaf of in a new direction
if i > 4{
nid = -1;
nid = instance_find(obj_room,floor(random(instance_number(obj_room)-1)));
if nid > 0{
curx = nid.x;
cury = nid.y;
newx = curx;
newy = cury;}}

//check that the new expansion will not overlap a current room, and wont be outside of the parameter.
if instance_place(newx,newy,obj_room)||
newx >= topx ||
newy >= topy ||
newx < botx ||
newy < boty{checkwhile = 0;}else{
checkwhile = 1;

//allows for partial calulation of neibors. (3.5 half the time counts as 3 or 4)
toggle_nbor += max_nbor-floor(max_nbor);
if toggle_nbor >= ceil(max_nbor){toggle_nbor = floor(max_nbor);
inbor = ceil(max_nbor);}else{inbor = floor(max_nbor);}
//check for how many neibors of the new cords
nbor = 0;
if instance_place(newx+cell_width,newy,obj_room){nbor+=1;}
if instance_place(newx,newy+cell_height,obj_room){nbor+=1;}
if instance_place(newx-cell_width,newy,obj_room){nbor+=1;}
if instance_place(newx,newy-cell_height,obj_room){nbor+=1;}
if nbor >= inbor{checkwhile = 0;}
}

}//end while loop

//once the while loop is over, set the new cordinates to make a new room.
curx = newx;
cury = newy;
}












