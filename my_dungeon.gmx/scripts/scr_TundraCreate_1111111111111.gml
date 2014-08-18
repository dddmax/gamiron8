//procedure TundraCreate(x,y:integer);

xx = argument0;
yy = argument1; 

newx = 0;
newy = 0;
lenx = 0;
leny = 0;
 
for(i=0; i<xx*yy div 200; i+=1)
   scr_ForestPartDraw(random(xx)+1,random(yy)+1);
   
for(i=0; i<xx*yy div 100; i+=1)
{
   if !(scr_ReturnPlaceCoord(10,15,newx,newy,lenx,leny)) then continue;
   if random(100)<=50 then
    scr_AntNestCreate(newx,newy,newx+lenx,newy+leny,2)
   else
    scr_LakesCreate(newx,newy,newx+lenx,newy+leny,1);
};



