//function ReturnPlaceCoord(minvalue,maxvalue:integer; var nx,ny,lenx,leny:integer):boolean;


minvalue = argument0;
maxvalue = argument1;
nx = argument2;
ny = argument3;
lenx = argument4;
leny = argument5;

res = false;

count=0;
i=random(ds_grid_width(global.map)-maxvalue-2)+2;
j=random(ds_grid_height(global.map)-maxvalue-2)+2;
newx=random(maxvalue-minvalue)+1+minvalue;
newy=random(maxvalue-minvalue)+1+minvalue;
while !(scr_freespace(i,j,i+newx,j+newy)) do
begin
       i=random(ds_grid_width(global.map)-maxvalue-2)+2;
       j=random(ds_grid_height(global.map)-maxvalue-2)+2;
       newx=random(maxvalue-minvalue)+1+minvalue;
       newy=random(maxvalue-minvalue)+1+minvalue;
       count +=1;
       if count>100 then exit;
end;
if (count<=100)
{    
    nx=i;
    ny=j;
    lenx=newx;
    leny=newy;
    res=true;
}
return (res);

