///void PlaceRoom(int i)

room_num = argument0;
 
global.placedrooms+=1;
//стены
for(xx=global.rooms_pos_x[room_num]-1; xx<global.rooms_pos_x[room_num] + global.rooms_width[room_num]+1; xx+=1)
for(yy=global.rooms_pos_y[room_num]-1; yy<global.rooms_pos_y[room_num] + global.rooms_height[room_num]+1; yy+=1)
    global.map_tile[xx, yy] = 4; //TILE_ROOM_WALL;
//пол
for(xx=global.rooms_pos_x[room_num]; xx<global.rooms_pos_x[room_num] + global.rooms_width[room_num]; xx+=1)
for(yy=global.rooms_pos_y[room_num]; yy<global.rooms_pos_y[room_num] + global.rooms_height[room_num]; yy+=1)
    global.map_tile[xx, yy] =3; //TILE_ROOM_FLOOR;       
   
if(room_num != 0) scr_ConnectRooms(room_num);

