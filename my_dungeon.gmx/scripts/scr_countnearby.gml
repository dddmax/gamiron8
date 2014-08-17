//counts, how many nearly tiles have some ID
//function countnearby(x,y,id:integer):integer;

xx = argument0;
yy = argument1;
mapid = argument2; 

res:=0;
if ds_grid_get(global.map, xx-1, yy) = mapid then res:=res+1;
if ds_grid_get(global.map, xx+1, yy) = mapid then res:=res+1;
if ds_grid_get(global.map, xx, yy-1) = mapid then res:=res+1;
if ds_grid_get(global.map, xx, yy+1) = mapid then res:=res+1;
if ds_grid_get(global.map, xx-1, yy-1) = mapid then res:=res+1;
if ds_grid_get(global.map, xx-1, yy+1) = mapid then res:=res+1;
if ds_grid_get(global.map, xx+1, yy-1) = mapid then res:=res+1;
if ds_grid_get(global.map, xx+1, yy+1) = mapid then res:=res+1;
return(res);

