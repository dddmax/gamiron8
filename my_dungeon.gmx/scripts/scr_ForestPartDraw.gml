//procedure ForestPartDraw(x1,y1:integer);
x1 = argument0;
x2 = argument1;
  

i= x1;
j= y1;
for(k=0; k<20; k+=1)
{
    n = random(6);
    e = random(6);
    s = random(6);
    w = random(6);
    if n = 1 then 
    {
        i= i - 1;
        if (ds_grid_get(global.map, i, j) != 1 
            and ds_grid_get(global.map, i, j) != 8
            and ds_grid_get(global.map, i, j) != 9) then exit;
        ds_grid_set(global.map, i, j, TILE_TREE);        
    };
    if s = 1 then 
    {
        i= i + 1;
        if (ds_grid_get(global.map, i, j) != 1 
            and ds_grid_get(global.map, i, j) != 8
            and ds_grid_get(global.map, i, j) != 9) then exit;
        ds_grid_set(global.map, i, j, TILE_TREE);
    };
    if e = 1 then 
    {
        j= j + 1;
        if (ds_grid_get(global.map, i, j) != 1 
            and ds_grid_get(global.map, i, j) != 8
            and ds_grid_get(global.map, i, j) != 9) then exit;
        ds_grid_set(global.map, i, j, TILE_TREE);
    };
    if w = 1 then 
    {
        j= j - 1;
        if (ds_grid_get(global.map, i, j) != 1 
            and ds_grid_get(global.map, i, j) != 8
            and ds_grid_get(global.map, i, j) != 9) then exit;
        ds_grid_set(global.map, i, j, TILE_TREE);
    };
};

