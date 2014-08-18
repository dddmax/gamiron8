//procedure AntNestCreate(x1,y1,x2,y2,typ:integer);

x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;
typ = argument4;  
    
/*      
          var i,j:integer;
      kx,ky,k,dx,dy:real;
      x,y,py, px:integer;
      counter: integer;
*/

xx:=x2-x1+1;
yy:=y2-y1+1;

buffer = ds_grid_create(ds_grid_width(global.map), ds_grid_height(global.map));
ds_grid_copy(buffer, global.map); 

scr_MapClear(TILE_GROUND);
ds_grid_set(global.map, xx div 2, yy div 2, TILE_CAVE_WALL);
  
for(i=0; i<(xx*yy div 3); i+=1)
{
    k = (random(360)+1)*3.1419532/180;
    kx = (xx/2) + (yy/2)*sin(k);
    ky = (yy/2) + (yy/2)*cos(k);
    dx = 1;
    dy = 1;
    while ((abs(dx)<10) and (abs(dy)<10)) do
    {
        dx = random(100)+1;
        dy = random(100)+1;
    };
    dx = dx - 50;
    dy = dy - 50;
    dx = dx / 100;
    dy = dy / 100;
    counter = 0;
    while (true) do
    {
        if counter+1>10000  then break;
        counter += 1;
        kx = kx + dx;
        ky = ky + dy;
        px = round(kx);
        py = round(ky);
        if (px<0) then
        {
            px = xx;
            kx = px;
        };
        if (px>xx) then
        {
            px = 1;
            kx = px;
        };
        if (py<0) then
        {
            py = yy;
            ky = py;
        };
        if (py>yy) then
        {
            py = 1;
            ky = py;
        };
        if (px=0) then px = random(xx)+1;
        if (py=0) then py = random(yy)+1; 
        if ((px>1)  and  (ds_grid_get(global.map, px-1, py)=TILE_CAVE_WALL)) or
            ((py>1)  and  (ds_grid_get(global.map, px, py-1)=TILE_CAVE_WALL)) or
            ((px<xx)  and  (ds_grid_get(global.map, px+1, py)=TILE_CAVE_WALL)) or
            ((py<yy)  and  (ds_grid_get(global.map, px, py+1)=TILE_CAVE_WALL)) then
        {
            ds_grid_set(global.map, px, py, TILE_CAVE_WALL);        
            break;
        };
    };
};

for(i=0; i<xx; i+=1)
for(j=0; j<yy; j+=1)
    if ds_grid_get(global.map, i, j)=TILE_CAVE_WALL  then ds_grid_set(global.map, i, j, TILE_GROUND);       
    else ds_grid_set(global.map, i, j, TILE_CAVE_WALL);      
       
if typ>0 then
    for(i=1; i<xx-1; i+=1)
    for(j=1; j<yy-1; j+=1)
        if scr_countnearby(i,j,TILE_CAVE_WALL)<=3 then ds_grid_set(global.map, i, j, TILE_GROUND);            

if typ=2 then
{
    for(i=0; i<xx; i+=1)
    for(j=0; j<yy; j+=1)
        if ds_grid_get(global.map, i, j)=TILE_CAVE_WALL then ds_grid_set(global.map, i, j, TILE_GROUND);
        else if ds_grid_get(global.map, i, j)=TILE_GROUND then ds_grid_set(global.map, i, j, TILE_MOUNTAIN);                
    scr_AddModOnMap(2);
    scr_AddModOnMap(2);
};

for(i=x1-1; i<x2; i+=1)
for(j=y1-1; j<y2; j+=1)
    ds_grid_set(buffer, i, j, ds_grid_get(global.map, i-x1+1, j-y1+1));    

ds_grid_copy(global.map, buffer);
