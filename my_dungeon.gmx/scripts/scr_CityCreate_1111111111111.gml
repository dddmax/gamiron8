//procedure CityCreate(X,Y,typ:integer);
//var px,py,x1,resx,y1,resy,i,j,k,x2,y2:integer;

X = argument0;
Y = argument1;
typ = argument2;

buffer = ds_grid_create(ds_grid_width(global.map), ds_grid_height(global.map));
ds_grid_copy(buffer, global.map); 

scr_CreateHouse(1, 1, X div 4, Y div 4, 5);
px=1;
py=1;

for(i=0; i<X div 4; i+=1)
for(j=0; j<Y div 4; j+=1)
{
    for(k=0; k<4; k+=1)
    {
        ds_grid_set(buffer, px, py, ds_grid_get(global.map, i, j));        
        py=py+1;
        if py>Y then
        {
            px=px+1;
            py=1;
        };
    };
};

resx=0;
for(i=0; i<X div 4; i+=1)
for(k=0; k<4; k+=1)
{
    resx += 1;
    for(j=0; j<Y; j+=1)
        ds_grid_set(global.map, resx, j, ds_grid_get(buffer, i, j));        
};

for(i=0; i<X; i+=1)
for(j=0; j<Y; j+=1)
    if (ds_grid_get(global.map, i, j)=TILE_DOOR) or (ds_grid_get(global.map, i, j)=TILE_HOUSE_WALL) then
        ds_grid_set(global.map, i, j, TILE_ROAD);
    else
        if ds_grid_get(global.map, i, j)=TILE_HOUSE_FLOOR then
            ds_grid_set(global.map, i, j, TILE_GROUND);            

for(i=0; i<X*Y div 50; i+=1)
    scr_CreateSomething(5,20,false);
 
if typ=1 then
{
    scr_AddModOnMap(1);
    for(i=0; i<X; i+=1)
    for(j=0; j<Y; j+=1)
        if ds_grid_get(global.map, i, j)=TILE_HOUSE_FLOOR then
            ds_grid_set(global.map, i, j, TILE_GROUND);
};


