//position_destroy_object(arg0,arg1,arg2)
//arg0 is the x position to destroy at
//arg1 is the y position to destroy at
//arg2 is the object to destroy at the position
//created by Ampersand, permission not needed, credit is nice =]
while(position_meeting(argument0,argument1,argument2)){
with(instance_position(argument0,argument1,argument2)){
instance_destroy()
}
}
