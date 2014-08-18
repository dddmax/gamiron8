//procedure ForestCreate(x,y:integer);

xx = argument0;
yy = argument1;

for(i=0; i<xx*yy div 10; i+=1)
   scr_ForestPartDraw(random(xx)+1,random(yy)+1);

for(i=0; i<xx; i+=1)
for(j=0; j<yy; j+=1)
    if (ds_grid_get(global.map, i, j)=TILE_GROUND) then ds_grid_set(global.map, i, j, TILE_GRASS)
        
