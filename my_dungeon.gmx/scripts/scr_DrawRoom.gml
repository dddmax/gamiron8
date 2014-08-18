//procedure DrawRoom(x1,y1,x2,y2:integer);
/*
var i,x,y,k,j:integer;
    gh:boolean;
begin
*/
x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;

for(i=x1; i<x2-1; i+=1)
for(j=y1; j<y2-1; j+=1)
    ds_grid_set(global.map, i, j, TILE_HOUSE_FLOOR);

for(i=x1-1; i<x2; i+=1)
{ 
    if ds_grid_get(global.map, i, y1) != TILE_DOOR then ds_grid_set(global.map, i, y1, TILE_HOUSE_WALL);       
    if ds_grid_get(global.map, i, y2) != TILE_DOOR then ds_grid_set(global.map, i, y2, TILE_HOUSE_WALL);        
};
 
for(i=y1-1; i<y2; i+=1)
{
    if ds_grid_get(global.map, x1, i) != TILE_DOOR then ds_grid_set(global.map, x1, i, TILE_HOUSE_WALL);        
    if ds_grid_get(global.map, x2, i) != TILE_DOOR then ds_grid_set(global.map, x2, i, TILE_HOUSE_WALL);        
};
 
for(i=0; i<30; i+=1)
    while true do
    {
        gh:=false;
        xx:=random(x2-x1-1)+1;
        yy:=random(y2-y1-1)+1;
        k:=random(5);
        
        switch (k)
        {
            case 0: 
                if scr_countnearby(x1+xx,y1,TILE_DOOR)=0 then
                    if ds_grid_get(global.map, x1+xx, y1) != TILE_DOOR then
                    {
                        ds_grid_set(global.map, x1+xx, y1, TILE_DOOR);                        
                        gh=true;
                    }; 
            break;                
            case 1:
                if ds_grid_get(global.map, x1, yy+y1) != TILE_DOOR then
                    if scr_countnearby(x1,y1+yy,TILE_DOOR)=0 then
                    {
                        ds_grid_set(global.map, x1, y1+yy, TILE_DOOR);                        
                        gh=true;
                    }; 
            break;
            case 2:
                if ds_grid_get(global.map, x2, y1+yy) != TILE_DOOR then
                    if scr_countnearby(x2,y1+yy,TILE_DOOR)=0 then
                    {
                        ds_grid_set(global.map, x2, y1+yy, TILE_DOOR);                        
                        gh=true;
                    }; 
            break;
            case 3: 
                if ds_grid_get(global.map, x1+xx, y2) != TILE_DOOR then
                    if scr_countnearby(x1+xx,y2,TILE_DOOR)=0 then
                    {
                        ds_grid_set(global.map, x1+xx, y2, TILE_DOOR);                        
                        gh=true;
                    };
            break; 
        }            
        if gh then exit;        
    };
