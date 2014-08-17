//Procedure ReplaceTile(X,Y:integer);
//var i,j:integer;

aa = argument0;
bb = argument1;
 for(i=0; i<ds_grid_width(global.map); i+=1)
   for(j=0; j<ds_grid_height(global.map); j+=1)
     if ds_grid_get(global.map, i, j) = aa then ds_grid_set(global.map, i, j, bb);
     

