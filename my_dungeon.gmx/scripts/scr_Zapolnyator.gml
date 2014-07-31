var numrooms = argument0;
var TILE_NONE = 0;
var TILE_FLOOR = 1;
var TILE_WALL = 2;
var TILE_ROOM_FLOOR = 3;
var TILE_ROOM_WALL = 4;
var TILE_DOOR = 5;

for(xx=0; xx<global.MAP_W; xx+=1)
    for(yy=0; yy<global.MAP_H; yy+=1)
    {
        if (global.map_tile[xx, yy] == TILE_NONE) {tile_add(til_wall, 0, 0, global.tile_size, global.tile_size, xx*global.tile_size, yy*global.tile_size, 100);}; 
        if (global.map_tile[xx, yy] == TILE_ROOM_FLOOR) {tile_add(til_floor, 0, 0, global.tile_size, global.tile_size, xx*global.tile_size, yy*global.tile_size, 100);};          
        if (global.map_tile[xx, yy] == TILE_FLOOR) {tile_add(til_floor, 0, 0, global.tile_size, global.tile_size, xx*global.tile_size, yy*global.tile_size, 100);};   
        if (global.map_tile[xx, yy] == TILE_ROOM_WALL) instance_create(xx*global.tile_size, yy*global.tile_size, obj_room_wall); //{tile_add(til_wall, 0, 0, 32, 32, xx*32, yy*32, 0);};
        if (global.map_tile[xx, yy] == TILE_WALL) instance_create(xx*global.tile_size, yy*global.tile_size, obj_Wall); //{tile_add(til_wall, 0, 0, 32, 32, xx*32, yy*32, 0);};  
        if (global.map_tile[xx, yy] == TILE_DOOR) instance_create(xx*global.tile_size, yy*global.tile_size, obj_door); //{tile_add(til_wall, 0, 0, 32, 32, xx*32, yy*32, 0);};     
    }; 
    
randomize();

var tmp = irandom(numrooms);
instance_create(global.rooms_pos_x[tmp]*global.tile_size+(global.tile_size div 2), global.rooms_pos_y[tmp]*global.tile_size+(global.tile_size div 2), obj_player);

//Enemies
for(i=0; i<50; i+=1)
{
    a = irandom(global.MAP_W-5) + 2;
    b = irandom(global.MAP_H-5) + 2;
    if (global.map_tile[a, b] == TILE_FLOOR) instance_create(a*global.tile_size+(global.tile_size div 2), b*global.tile_size+(global.tile_size div 2), obj_enemy);
}

//Items
for(i=0; i<50; i+=1)
{
    a = irandom(global.MAP_W-5) + 2;
    b = irandom(global.MAP_H-5) + 2;
    //if (global.map_tile[a, b] == TILE_FLOOR) instance_create(a*global.tile_size, b*global.tile_size, obj_wood);
}
