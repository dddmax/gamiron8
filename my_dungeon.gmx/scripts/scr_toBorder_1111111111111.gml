//function toBorder(var X,Y:integer):integer;

X = argument0;
Y = argument1;

switch (random(4))
{
 case 0: X:=1; res = 4; break;
 case 1: Y:=1; res = 1; break;
 case 2: X =ds_grid_width(global.map); res = 2; break;
 case 3: Y =ds_grid_height(global.map); res = 8; break; 
}
return(res);
