//procedure CreateRoad;
//  var x1,y1,x2,y2,i,j,k:integer;

x1 = random(ds_grid_width(global.map))+1;
y1 = random(ds_grid_height(global.map))+1;
x2 = random(ds_grid_width(global.map))+1;
y2 = random(ds_grid_height(global.map))+1;
  
while scr_toBorder(x1,y1) * scr_toBorder(x2,y2) <> 8 do begin end;
  
scr_DrawLine(x1, y1, x2, y2, TILE_ROAD);
for(i=0; i<3; i+=1)
{
    scr_DrawLine(x1+i, y1, x2+i, y2, TILE_ROAD);
    scr_DrawLine(x1-i, y1, x2+i, y2, TILE_ROAD);
    scr_DrawLine(x1+i, y1, x2-i, y2, TILE_ROAD);
    scr_DrawLine(x1-i, y1, x2-i, y2, TILE_ROAD);
    scr_DrawLine(x1, y1+i, x2, y2+i, TILE_ROAD);
    scr_DrawLine(x1, y1-i, x2, y2+i, TILE_ROAD);
    scr_DrawLine(x1, y1-i, x2, y2-i, TILE_ROAD);
    scr_DrawLine(x1, y1-i, x2, y2-i, TILE_ROAD);
};

for(i=0; i<ds_grid_width(global.map); i+=1)
for(j=0; j<ds_grid_height(global.map); j+=1)
    if scr_countnearby(i, j, TILE_ROAD)>5 then
        ds_grid_set(global.map, i, j, TILE_ROAD);
