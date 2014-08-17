//procedure StartWave(px, py: integer);

px = argument0;
py = argument1;
MAX_DEPTH = 5;
//   var  x,y,dx,dy,d,i,j:integer;

if (px<5) or (px>ds_grid_width(global.map)-5) or (py<5) or (py>ds_grid_height(global.map)-5) then exit;
X=ds_grid_width(global.map);
Y=ds_grid_height(global.map);
   dx=0;
   dy=0;
   
   switch (random(4))
   {
    case 0: dx=-1; break;
    case 1: dx=1; break;
    case 2: dy=-1; break;
    case 3: dy=1; break;    
   }
   
  d=random(MAX_DEPTH)+1;
  for(i=0; i<d; i+=1)
  {
     if (px<5) or (px>X-5) or (py<5) or (py>Y-5) then exit;
     if (scr_countnearby(px,py,TILE_GROUND)>7) then exit;    
     ds_grid_set(global.map, px, py, TILE_GROUND);
     px=px+dx;
     py=py+dy;
     
     scr_StartWave(px,py);
  }
   

