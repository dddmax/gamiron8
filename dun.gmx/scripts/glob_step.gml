//only do after the rooms finish generating
if obj_floor.room_count < obj_floor.max_rooms{
scr_update_room();
//calc fade in effect
}else{
start = 1;}

//once the level has been generated.
if start = 1{
scr_motion();
scr_doors();



if fadein > 0{
fadein -= 1.5/30;}else{fadein = 0;}
}//end start



