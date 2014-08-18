//procedure LakesCreate(x1,y1,x2,y2,typ:integer);

x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;
typ = argument4;

density = 0.60;

xx:=x2-x1+1;
yy:=y2-y1+1;
for(i=0; i<round(xx*yy*density)+1; i+=1)
    ds_grid_set(global.map, x1+random(xx), y1+random(yy), TILE_CAVE_WALL);
    
for(i=x1; i<x2+1; i+=1)
for(j=y1; j<y2+1; j+=1)
{
    if (i=x1) or (j=x1) or (i=x2) or (j=y2) then
    {
        ds_grid_set(global.map, i, j, TILE_GROUND);        
        continue;
    };
   res=scr_countnearby(i,j,TILE_CAVE_WALL);
   if (ds_grid_get(global.map, i, j) = TILE_CAVE_WALL) then
   {
         if res<4 then
            ds_grid_set(global.map, i, j, TILE_GROUND); 
   }
   else
   {
        if res>4 then
            ds_grid_set(global.map, i, j, TILE_CAVE_WALL);          
   }
};
   
for(i=x1; i<x2+1; i+=1)
for(j=y1; j<y2+1; j+=1)
    if scr_countnearby(i,j,TILE_GROUND)<3 then ds_grid_set(global.map, i, j, TILE_CAVE_WALL); 
     
for(res=0; res<10; res+=1)
    for(i=x1; i<x2; i+=1)
    for(j=y1; j<y2; j+=1)
        if (scr_countnearby(i,j,TILE_GROUND)>=7) then ds_grid_set(global.map, i, j, TILE_GROUND); 
        
for(i=x1; i<x2; i+=1)
for(j=y1; j<y2; j+=1)
    if typ=0 then
    {
        if ds_grid_get(global.map, i, j)=TILE_CAVE_WALL  then
            ds_grid_set(global.map, i, j, TILE_GROUND)
        else           
            ds_grid_set(global.map, i, j, TILE_WATER);
    }
    else
    {
        if ds_grid_get(global.map, i, j)=TILE_CAVE_WALL  then            
            ds_grid_set(global.map, i, j, TILE_WATER)
        else
            ds_grid_set(global.map, i, j, TILE_GROUND);
    }

