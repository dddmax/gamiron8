randomize();

var global.MAP_W = 80;
var global.MAP_H = 60;/* dimensions of the screen */

var global.tile_size = 32;

//Минимальный и Максимальный размер комнаты
var ROOM_SIZE_MIN = 6;
var ROOM_SIZE_MAX = 10; 

var ROOM_NUM_MIN = 8; //Кол-во комнат
var ROOM_NUM_MAX = 13; //50

var TILE_NONE = 0;
var TILE_FLOOR = 1;
var TILE_WALL = 2;
var TILE_ROOM_FLOOR = 3;
var TILE_ROOM_WALL = 4;
var TILE_DOOR = 5;

var TRY_NUM = (global.MAP_W*global.MAP_H)*4; //Количество попыток разместить комнату

//Сколько будет всего комнат
var numrooms = irandom(ROOM_NUM_MAX - ROOM_NUM_MIN) + ROOM_NUM_MIN;

var global.placedrooms = 0;//для дебага

//Очимтим массив карты
for(xx=0; xx<global.MAP_W; xx+=1)
    for(yy=0; yy<global.MAP_H; yy+=1)
    {
        global.map_tile[xx, yy] = TILE_NONE;        
    };  
//Очистим массив комнат.
for(i=0; i<ROOM_NUM_MAX; i+=1)
{
    global.rooms_width[i] = 0;
    global.rooms_height[i] = 0;
    global.rooms_pos_x[i] = 0;
    global.rooms_pos_y[i] = 0;
};
 
for(i=0; i<numrooms; i+=1) //Определим их размеры
{
    global.rooms_width[i] = irandom(ROOM_SIZE_MAX - ROOM_SIZE_MIN) + ROOM_SIZE_MIN;
    global.rooms_height[i] = irandom(ROOM_SIZE_MAX - ROOM_SIZE_MIN) + ROOM_SIZE_MIN;
};

for (i=0; i<numrooms; i+=1)
{
    res = false;
    try_n = 0;//Кол-во попыток
    while(!res)
    {
        try_n += 1;
        min_x = 2;
        max_x = global.MAP_W - global.rooms_width[i] -2;
        min_y = 2;
        max_y = global.MAP_H - global.rooms_height[i] -2;

        pos_x = irandom(max_x - min_x) + min_x;
        pos_y = irandom(max_y - min_y) + min_y;        
    
        if (scr_ChekForPlace(pos_x, pos_y, i) && !res)        
        {
            global.rooms_pos_x[i] = pos_x;
            global.rooms_pos_y[i] = pos_y;
            scr_PlaceRoom(i);
            try_n = 0;
            res = true;
        };
        if((try_n == TRY_NUM - global.rooms_width[i]) && !res)
        {
            if(global.rooms_width[i] > 2) global.rooms_width[i]-=1;
            if(global.rooms_height[i] > 2) global.rooms_height[i]-=1;
            for(xx=min_x; xx<max_x; xx+=1)
                for(yy=min_y; yy<max_y; yy+=1) 
                {                                  
                    if (scr_ChekForPlace(xx, yy, i))
                    if(count == 0)
                    {
                        global.rooms_pos_x[i] = xx;
                        global.rooms_pos_y[i] = yy;
                        scr_PlaceRoom(i);
                        try_n = 0;
                        res = true;
                    };
                 }; 
        };
        if((try_n > TRY_NUM) && !res)
        {
            try_n = 0;
            res = true;//количество попыток исчерпано переходим к другой комнате
        };
    };//while

};


scr_Zapolnyator(numrooms);


 
