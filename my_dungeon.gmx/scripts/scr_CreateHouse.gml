//procedure CreateHouse(x1,y1,x2,y2,maxroomvalue:integer);

if (x2-x1+1<=8) or (y2-y1+1<=8) then
  scr_DrawRoom(x1,y1,x2,y2)
else
  scr_CreateRoom(x1,y1,x2,y2);


