//procedure CreateSomething(minvalue,maxvalue:integer;flag:boolean);
//var i,j,count,newx,newy:integer;

minvalue = argument0;
maxvalue = argument1;
flag = argument2;

if !(scr_ReturnPlaceCoord(minvalue,maxvalue,i,j,newx,newy)) then exit;
if flag=true then
{
    if random(100)<=25 then
        for(count=0; count<10; count+=1)
            scr_ForestPartDraw(random(newx)+i,random(newy)+j)
    else
        if random(100)<=20 then
            scr_LakesCreate(i,j,i+newx,j+newy,1)
        else
            scr_CreateHouse(i,j,i+newx,j+newy,3);
}
else scr_CreateHouse(i,j,i+newx,j+newy,3);


