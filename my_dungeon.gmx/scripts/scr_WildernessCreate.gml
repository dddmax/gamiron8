//procedure WildernessCreate(X,Y:integer);
//var i:integer;

scr_MapClear(TILE_GROUND);

for(i=0; i<(X*Y div 4000)+1; i+=1)
    scr_CreateRoad();

for(i=0; i<X*Y div 50; i+=1)
    scr_CreateSomething(5,10,true);
