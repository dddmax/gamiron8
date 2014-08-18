//procedure CastleCreate(X,Y:integer);
   //var i,j,k,px,py:integer;
X = argument0;
Y = argument1;
   
while (scr_GetDensityOfTile(TILE_HOUSE_FLOOR)<0.4) do
{
    scr_MapClear(TILE_CAVE_WALL);
    px=X div 2;
    py=Y div 2;
    for(i=0; i<X*Y; i+=1)
        scr_StartWave(px,py);

    scr_ReplaceTile(TILE_CAVE_WALL, TILE_GRASS);
    scr_ReplaceTile(TILE_GROUND, TILE_HOUSE_WALL);

    for(i=0; i<X; i+=1)
    for(j=0; j<Y; j+=1)
        if (scr_countnearby(i,j,TILE_HOUSE_WALL)>3) then
            ds_grid_set(global.map, i, j, TILE_HOUSE_WALL);           
    
    for(i=0; i<X; i+=1)
    for(j=0; j<Y; j+=1)
        if (scr_countnearby(i,j,TILE_HOUSE_WALL)>7) then
            ds_grid_set(global.map, i, j, TILE_GROUND);           
           
    for(i=0; i<X; i+=1)
    for(j=0; j<Y; j+=1)
        if ((scr_countnearby(i,j,TILE_GROUND)<>0) and (scr_countnearby(i,j,TILE_GRASS)=0)) then
            ds_grid_set(global.map, i, j, TILE_GROUND);           
           
    for(i=0; i<X; i+=1)
    for(j=0; j<Y; j+=1)
        if ((scr_countnearby(i,j,TILE_GROUND)<>0) and (scr_countnearby(i,j,TILE_GRASS)<>0)) then
            ds_grid_set(global.map, i, j, TILE_HOUSE_WALL);         
         
    for(i=0; i<X; i+=1)
    for(j=0; j<Y; j+=1)
        if (i=1) or (j=1) or (i=X) or (j=Y) then
            if (scr_countnearby(i,j,TILE_GROUND)<>0) then
                ds_grid_set(global.map, i, j, TILE_HOUSE_WALL);                
                
    for(i=0; i<X; i+=1)
    for(j=0; j<Y; j+=1)
        if ds_grid_get(global.map, i, j) = TILE_HOUSE_WALL then
            if scr_countnearby(i,j,TILE_GROUND)=0 then
                ds_grid_set(global.map, i, j, TILE_GRASS);               
    
    for(i=0; i<X; i+=1)
    for(j=0; j<Y; j+=1)
        if ds_grid_get(global.map, i, j) = TILE_GRASS then
            if scr_countnearby(i,j,TILE_GROUND)<>0 then
                ds_grid_set(global.map, i, j, TILE_HOUSE_WALL);
            
            
    scr_ReplaceTile(TILE_GROUND, TILE_HOUSE_FLOOR);
};


scr_ReplaceTile(TILE_GRASS,TILE_GROUND);

for(i=0; i<X*Y div 200; i+=1)
    scr_CreateSomething(5,10,true);
   
scr_ReplaceTile(TILE_GROUND, TILE_WATER);
scr_ReplaceTile(TILE_HOUSE_FLOOR,TILE_GROUND);

for(i=0; i<X*Y div 200; i+=1)  
    scr_CreateSomething(10,20,false);
    
scr_ReplaceTile(TILE_GROUND, TILE_HOUSE_FLOOR);
scr_ReplaceTile(TILE_WATER, TILE_GRASS);

