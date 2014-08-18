//procedure AddModOnMap(modtype:integer);
modtype = argument0;

switch (modtype)
{
    case 1:
        for(i=0; i<ds_grid_width(global.map); i+=1)
        for(j=0; j<ds_grid_height(global.map); j+=1)
            if ds_grid_get(global.map, i, j) = 7 then
                if random(100)<=40 then ds_grid_set(global.map, i, j, TILE_GROUND);
    break;
    case 2:
        for(i=0; i<ds_grid_width(global.map)*ds_grid_height(global.map) div 25; i+=1)
            scr_ForestPartDraw(random(ds_grid_width(global.map))+1,random(ds_grid_height(global.map))+1); 
    break;
    case 3:
        for(i=0; i<ds_grid_width(global.map); i+=1)
        for(j=0; j<ds_grid_height(global.map); j+=1)
            if random(100)<=20 then  ds_grid_set(global.map, i, j, TILE_WATER);  
    break; 
}
