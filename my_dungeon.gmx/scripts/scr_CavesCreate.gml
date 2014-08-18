//procedure CavesCreate(X,Y:integer);

X = argument0;
Y = argument1;

density = 0.65;
//  var i,j:integer;
//  var res:integer;


for(i=0; i<round(X*Y*density); i+=1)
    ds_grid_set(global.map, random(X)+1, random(Y)+1, TILE_CAVE_WALL);    

for(i=0; i<X; i+=1)
for(j=0; j<Y; j+=1)
{
    if (i<=1) or (j<=1) or (i>=X-1) or (j>=Y-1) then
    {
         ds_grid_set(global.map, i, j, TILE_CAVE_WALL); 
         continue;
    };
    res = scr_countnearby(i, j, TILE_CAVE_WALL);
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
   
for(res=0; res<10; res+=1)
    for(i=1; i<X-1; i+=1)
    for(j=1; j<Y-1; j+=1)  
        if (scr_countnearby(i, j, TILE_GROUND)<3) or (scr_countnearby(i, j, TILE_CAVE_WALL)>=7) then
            ds_grid_set(global.map, i, j, TILE_CAVE_WALL);
