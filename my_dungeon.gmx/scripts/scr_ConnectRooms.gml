///Объединение всех комнат.
//ConnectRooms(int room1, int room2)
var room1 = argument0;
var room2 = argument0 - 1;

//var TILE_NONE = 0;
//var TILE_FLOOR = 1;
//var TILE_WALL = 2;
//var TILE_ROOM_FLOOR = 3;
//var TILE_ROOM_WALL = 4;
//var TILE_DOOR = 5;

var centr_x1 = global.rooms_pos_x[room1] + global.rooms_width[room1] div 2;
var centr_y1 = global.rooms_pos_y[room1] + global.rooms_height[room1] div 2;
var centr_x2 = global.rooms_pos_x[room2] + global.rooms_width[room2] div 2;
var centr_y2 = global.rooms_pos_y[room2] + global.rooms_height[room2] div 2;

//var tmp = 0;

if (centr_x1 > centr_x2)
{    
    while(centr_x1 >= centr_x2)
    {
        centr_x1 -= 1;
        if(global.map_tile[centr_x1, centr_y1] == 0) global.map_tile[centr_x1, centr_y1] = 1;
        if(global.map_tile[centr_x1, centr_y1] == 2) global.map_tile[centr_x1, centr_y1] = 1;
        if(global.map_tile[centr_x1, centr_y1] == 4) global.map_tile[centr_x1, centr_y1] = 5; 
        for(a=-1; a<2; a+=1)
        for(b=-1; b<2; b+=1)
            if(global.map_tile[centr_x1+a, centr_y1+b] == 0) global.map_tile[centr_x1+a, centr_y1+b] = 2;                    
    }     
}
else //if (centr_x1 < centr_x2)
{    
    while(centr_x1 <= centr_x2)
    {
        centr_x1 += 1;
        if(global.map_tile[centr_x1, centr_y1] == 0) global.map_tile[centr_x1, centr_y1] = 1;
        if(global.map_tile[centr_x1, centr_y1] == 2) global.map_tile[centr_x1, centr_y1] = 1;
        if(global.map_tile[centr_x1, centr_y1] == 4) global.map_tile[centr_x1, centr_y1] = 5;
        for(a=-1; a<2; a+=1)
        for(b=-1; b<2; b+=1)
            if(global.map_tile[centr_x1+a, centr_y1+b] == 0) global.map_tile[centr_x1+a, centr_y1+b] = 2;
    }    
} 

//centr_x1 = tmp;

if (centr_y1 > centr_y2)
{    
    while(centr_y1 >= centr_y2)
    {
        centr_y1 -= 1;
        if(global.map_tile[centr_x1, centr_y1] == 0) global.map_tile[centr_x1, centr_y1] = 1;
        if(global.map_tile[centr_x1, centr_y1] == 2) global.map_tile[centr_x1, centr_y1] = 1;
        if(global.map_tile[centr_x1, centr_y1] == 4) global.map_tile[centr_x1, centr_y1] = 5;
        for(a=-1; a<2; a+=1)
        for(b=-1; b<2; b+=1)
            if(global.map_tile[centr_x1+a, centr_y1+b] == 0) global.map_tile[centr_x1+a, centr_y1+b] = 2;               
    } 
}
else //if (centr_y1 < centr_y2)
{    
    while(centr_y1 <= centr_y2)
    {
        centr_y1 += 1;
        if(global.map_tile[centr_x1, centr_y1] == 0) global.map_tile[centr_x1, centr_y1] = 1;
        if(global.map_tile[centr_x1, centr_y1] == 2) global.map_tile[centr_x1, centr_y1] = 1;
        if(global.map_tile[centr_x1, centr_y1] == 4) global.map_tile[centr_x1, centr_y1] = 5;
        for(a=-1; a<2; a+=1)
        for(b=-1; b<2; b+=1)
            if(global.map_tile[centr_x1+a, centr_y1+b] == 0) global.map_tile[centr_x1+a, centr_y1+b] = 2;
    }
} 


