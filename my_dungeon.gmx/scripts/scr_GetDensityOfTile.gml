//if we have 100 tiles of "grass" and other 1000 tiles of "ground" we get 100/1100 density of "grass"
//and 1000/1100 tiles of "ground"
//function GetDensityOfTile(X:integer):real;
xx = argument0;

d1:=0;
d2:=0;
for(i=0; i<ds_grid_width(global.map); i+=1)
  for(j=0; j<ds_grid_height(global.map); j+=1)
    if ds_grid_get(global.map, i, j) = xx then d1+=1 else d2+=1;
yy=d1/d2;
return(yy);
