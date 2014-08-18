//procedure CreateRoom(x1,y1,x2,y2:integer);
//var count,i,j,rep:integer;

x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;
maxroomvalue = argument4;

if (x2-x1)<maxroomvalue*2 then exit;
if (y2-y1)<maxroomvalue*2 then exit;
scr_DrawRoom(x1,y1,x2,y2);
if (rep=0) then
{
    rep=-1;
    j=0;
    count=0;
    while (j<maxroomvalue) or (x2-(x1+j)<maxroomvalue)  do
    {
        j=random(x2-x1)+1;
        count +=1;
        if count>100 then exit;
    };
    scr_CreateRoom(x1,y1,x1+j,y2);
    scr_CreateRoom(x1+j,y1,x2,y2);
    exit;
}
else
{
    rep=0;
    j=0;
    count=0;
    while (j<maxroomvalue) or (y2-(y1+j)<maxroomvalue)  do
    {
        j=random(y2-y1)+1;
        count +=1;
        if count>100 then exit;
     };
     scr_CreateRoom(x1,y1,x2,y1+j);
     scr_CreateRoom(x1,y1+j,x2,y2);
};

