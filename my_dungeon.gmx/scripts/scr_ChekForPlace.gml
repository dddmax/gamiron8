//bool ChekForPlace(int pos_x, int pos_y, int room) //проверка свободного места для комнаты
var pos_x = argument0;
var pos_y = argument1;
var room_num = argument2;

var count = 0;
for(xx=pos_x-1; xx<pos_x + global.rooms_width[room_num] + 1; xx+=1)
for(yy=pos_y-1; yy<pos_y + global.rooms_height[room_num] + 1; yy+=1)
{        
   if (global.map_tile[xx, yy] != 0) count+=1; 
};


if(count == 0) return(true)
else return(false);

