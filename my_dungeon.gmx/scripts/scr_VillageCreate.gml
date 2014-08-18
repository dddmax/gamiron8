//procedure VillageCreate(X,Y,typ:integer);
//var k,i,j:integer;

X = argument0;
Y = argument1;
typ = argument2;

for(k=0; k<X*Y div 50; k+=1)
   scr_CreateSomething(10,15,true);

if typ=1 then
{
    scr_AddModOnMap(1);
    scr_AddModOnMap(2);
    scr_ReplaceTile(TILE_HOUSE_FLOOR, TILE_GROUND);
};

