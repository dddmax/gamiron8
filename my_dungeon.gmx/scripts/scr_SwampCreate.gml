//procedure SwampCreate(X,Y:integer);
  //var i,j:integer;
X = argument0;
Y = argument1;

for(i=0; i<X*Y div 1000; i+=1)
    scr_CreateSomething(5,10,false);
    
for(i=0; i<X*Y div 20; i+=1)
  scr_ForestPartDraw(random(X)+1, random(Y)+1);

buffer = ds_grid_create(ds_grid_width(global.map), ds_grid_height(global.map));
ds_grid_copy(buffer, global.map); 

scr_LakesCreate(1,1,X,Y,0);


for(i=0; i<X; i+=1)
for(j=0; j<Y; j+=1) 
    if ds_grid_get(buffer, i, j) = TILE_HOUSE_WALL then 
        ds_grid_set(global.map, i, j, TILE_HOUSE_WALL);
    else
        if ds_grid_get(buffer, i, j)  =TILE_TREE then
            ds_grid_set(global.map, i, j, TILE_TREE);
            
            
scr_AddModOnMap(1);

