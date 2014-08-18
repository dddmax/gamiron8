//procedure MazeCreate(X,Y:integer);
//var px,py,i,j:integer;

X = argument0;
Y = argument1;

MAX_DEPTH=5;

for(i=0; i<X; i+=1)
for(j=0; j<Y; j+=1)
    ds_grid_set(global.map, i, j, TILE_CAVE_WALL);    
    
px=X div 2;
py=Y div 2;  

for(i=0; i<X*Y div 100; i+=1)
{
    px:=random(X)+1;
    py:=random(Y)+1;
    scr_StartWave(px,py);
};

