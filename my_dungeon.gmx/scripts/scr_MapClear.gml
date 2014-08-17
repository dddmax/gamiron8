//procedure MapClear(ID: Integer);
 
mapid = argument0;
X=ds_grid_width(global.map);
Y=ds_grid_height(global.map);

ds_grid_set_region(global.map, 0, 0, X, Y, mapid);
