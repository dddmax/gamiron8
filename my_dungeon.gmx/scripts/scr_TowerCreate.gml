//procedure TowerCreate(X,Y:integer);

X = argument0;
Y = argument1;

waterch = 20;

//var px,py,rad:integer;
//    k,i,j:integer;

px = X div 2;
py = Y div 2;
if (Y-py)<(X-px) then rad = Y-py 
else rad = X-px;
k = rad-5;

while k>0 do
{
    for(i=0; i<X; i+=1)
    for(j=0; j<Y; j+=1)
        if scr_dist(i,j,px,py)=k then
            ds_grid_set(global.map, i, j, TILE_HOUSE_WALL);
   k = k-2;
};

scr_AddModOnMap(1);
scr_AddModOnMap(1);
scr_AddModOnMap(2);
scr_AddModOnMap(3);


