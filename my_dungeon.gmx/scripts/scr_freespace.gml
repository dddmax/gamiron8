//function freespace(x1,y1,x2,y2:integer):boolean;

x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;

x1 -=1;
x2 +=1;
y1 -=1;
y2 +=1;
free = true;
for(i=x1; i<x2+1; i+=1)
    for(j=y1; j<y2+1; j+=1)
        if (ds_grid_get(global.map, i, j) != 1 
            or ds_grid_get(global.map, i, j) != 8
            or ds_grid_get(global.map, i, j) != 9
            or ds_grid_get(global.map, i, j) = TILE_HOUSE_FLOOR) then free=false;

return(free); 
