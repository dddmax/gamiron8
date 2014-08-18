//ALARM, in this program X means "height", and Y means "width"

procedure CreateHouse(x1,y1,x2,y2,maxroomvalue:integer);

procedure CreateRoom(x1,y1,x2,y2:integer);
 var count,i,j,rep:integer;
begin
 if (x2-x1)<maxroomvalue*2 then exit;
 if (y2-y1)<maxroomvalue*2 then exit;
 DrawRoom(x1,y1,x2,y2);
 if (rep=0) then
   begin
     rep:=-1;
     j:=0;
     count:=0;
     while (j<maxroomvalue) or (x2-(x1+j)<maxroomvalue)  do
      begin
        j:=random(x2-x1)+1;
        inc(count);
        if count>100 then exit;
      end;
     CreateRoom(x1,y1,x1+j,y2);
     CreateRoom(x1+j,y1,x2,y2);
     exit;
   end
   else
   begin
   rep:=0;
   j:=0;
     count:=0;
     while (j<maxroomvalue) or (y2-(y1+j)<maxroomvalue)  do
      begin
        j:=random(y2-y1)+1;
        inc(count);
        if count>100 then exit;
      end;
     CreateRoom(x1,y1,x2,y1+j);
     CreateRoom(x1,y1+j,x2,y2);
    end;
end;


begin
if (x2-x1+1<=8) or (y2-y1+1<=8) then
  DrawRoom(x1,y1,x2,y2)
else
  CreateRoom(x1,y1,x2,y2);

end;


procedure CreateSomething(minvalue,maxvalue:integer;flag:boolean);
var i,j,count,newx,newy:integer;
begin
if not(ReturnPlaceCoord(minvalue,maxvalue,i,j,newx,newy)) then exit;
      if flag=true then
      begin
      if random(100)<=25 then
        for count:=1 to 10 do
         ForestPartDraw(random(newx)+i,random(newy)+j)
      else
      if random(100)<=20 then
       LakesCreate(i,j,i+newx,j+newy,1)
      else
      CreateHouse(i,j,i+newx,j+newy,3);
      end
        else
       CreateHouse(i,j,i+newx,j+newy,3);

end;


procedure CastleCreate(X,Y:integer);
   var i,j,k,px,py:integer;
begin
   While (GetDensityOfTile(TILE_HOUSE_FLOOR)<0.4) do
   begin

   MapClear(TILE_CAVE_WALL);
   px:=X div 2;
   py:=Y div 2;
   for i:=1 to X*Y  do
      StartWave(px,py);

    ReplaceTIle(TILE_CAVE_WALL,TILE_GRASS);
    ReplaceTile(TILE_GROUND,TILE_HOUSE_WALL);

   for i:=1 to X do
      for j:=1 to Y do
        if (countnearby(i,j,TILE_HOUSE_WALL)>3) then
           map[i,j]:=TILE_HOUSE_WALL;
   for i:=1 to X do
      for j:=1 to Y do
        if (countnearby(i,j,TILE_HOUSE_WALL)>7) then
           map[i,j]:=TILE_GROUND;
   for i:=1 to X do
      for j:=1 to Y do
       if ((countnearby(i,j,TILE_GROUND)<>0) and (countnearby(i,j,TILE_GRASS)=0)) then
           map[i,j]:=TILE_GROUND;
     for i:=1 to X do
      for j:=1 to Y do
      if ((countnearby(i,j,TILE_GROUND)<>0) and (countnearby(i,j,TILE_GRASS)<>0)) then
         map[i,j]:=TILE_HOUSE_WALL;
     for i:=1 to X do
       for j:=1 to Y do
          if (i=1) or (j=1) or (i=X) or (j=Y) then
             if (countnearby(i,j,TILE_GROUND)<>0) then
                map[i,j]:=TILE_HOUSE_WALL;
     for i:=1 to X do
       for j:=1 to Y do
         if map[i,j]=TILE_HOUSE_WALL then
            if countnearby(i,j,TILE_GROUND)=0 then
               map[i,j]:=TILE_GRASS;
     for i:=1 to X do
       for j:=1 to Y do
        if map[i,j]=TILE_GRASS then
          if countnearby(i,j,TILE_GROUND)<>0 then
            map[i,j]:=TILE_HOUSE_WALL;
     ReplaceTile(TILE_GROUND, TILE_HOUSE_FLOOR);
     end;
     ReplaceTile(TILE_GRASS,TILE_GROUND);
   for i:=1 to X*Y div 200 do
     CreateSomething(5,10,true);
     ReplaceTile(TILE_GROUND, TILE_WATER);
     ReplaceTile(TILE_HOUSE_FLOOR,TILE_GROUND);
   for i:=1 to X*Y div 200 do
     CreateSomething(10,20,false);
     ReplaceTile(TILE_GROUND,TILE_HOUSE_FLOOR);
     ReplaceTIle(TILE_WATER, TILE_GRASS);


end;



procedure MazeCreate(X,Y:integer);
   const MAX_DEPTH=5;
   var px,py,i,j:integer;


begin
  for i:=1 to X do
   for j:=1 to Y do
    map[i,j]:=TILE_CAVE_WALL;
    px:=X div 2;
    py:=Y div 2;
  for i:=1 to X*Y div 100 do
  begin
  PX:=RANDOM(x)+1;
  py:=RANDOM(Y)+1;
   StartWave(px,py);
  end;
end;


procedure VillageCreate(X,Y,typ:integer);
var k,i,j:integer;
begin
 for k:=1 to X*Y div 50 do
   CreateSomething(10,15,true);
 if typ=1 then
   begin
    AddModOnMap(1);
    AddModOnMap(2);
    ReplaceTile(TILE_HOUSE_FLOOR,TILE_GROUND);
   end;
end;


procedure TowerCreate(X,Y:integer);
const waterch = 20;
var px,py,rad:integer;
    k,i,j:integer;
begin
  px:=x div 2;
  py:=y div 2;
  if (Y-py)<(X-px) then rad:=y-py else
          rad:=x-px;
  k:=rad-5;
  while k>0 do
   begin
     for i:=1 to X do
      for j:=1 to Y do
       if dist(i,j,px,py)=k then
        map[i,j]:=TILE_HOUSE_WALL;
   k:=k-2;
   end;
 AddModOnMap(1);
 AddModOnMap(1);
 AddModOnMap(2);
 AddModOnMap(3);

end;


procedure SwampCreate(X,Y:integer);
  var i,j:integer;
begin
for i:=1 to X*Y div 1000 do
   CreateSomething(5,10,false);
for i:=1 to X*Y div 20 do
  ForestPartDraw(random(x)+1, random(y)+1);
buffer:=map;
LakesCreate(1,1,X,Y,0);
for i:=1 to X do
 for j:=1 to Y do
  if buffer[i,j]=TILE_HOUSE_WALL then
    map[i,j]:=TILE_HOUSE_WALL
  else
    if buffer[i,j]=TILE_TREE then
    map[i,j]:=TILE_TREE;
AddModOnMap(1);
end;

procedure CavesCreate(X,Y:integer);
const density = 0.65;
  var i,j:integer;
  var res:integer;
begin
 for i:=1 to round(X*Y*density) do
    Map[random(X)+1,random(Y)+1]:=TILE_CAVE_WALL;
 for i:=1 to X do
  for j:=1 to Y do
   begin
    if (i<=1) or (j<=1) or (i>=X-1) or (j>=Y-1) then
       begin
         map[i,j]:=TILE_CAVE_WALL;
         continue;
       end;
   res:=countnearby(i,j,TILE_CAVE_WALL);
     if (map[i,j]=TILE_CAVE_WALL) then
       begin
         if res<4 then
            map[i,j]:=TILE_GROUND;
       end
     else
        begin
         if res>4 then
          map[i,j]:=TILE_CAVE_WALL;
       end
   end;
 for res:=1 to 10 do
  for i:=2 to X-1 do
   for j:=2 to Y-1 do
    if (countnearby(i,j,TILE_GROUND)<3) or (countnearby(i,j,TILE_CAVE_WALL)>=7) then
     map[i,j]:=TILE_CAVE_WALL;
end;


procedure CityCreate(X,Y,typ:integer);
var px,py,x1,resx,y1,resy,i,j,k,x2,y2:integer;
begin
CreateHouse(1,1,X div 4, Y div 4,5);
px:=1;
py:=1;
for i:=1 to X div 4 do
 for j:=1 to Y div 4 do
  begin
    for k:=1 to 4 do
     begin
      buffer[px,py]:=map[i,j];
      py:=py+1;
      if py>Y then
       begin
        px:=px+1;
        py:=1;
       end;
     end;
  end;
resx:=0;
for i:=1 to X div 4 do
for k:=1 to 4 do
begin
inc(resx);
 for j:=1 to Y do
  map[resx,j]:=buffer[i,j];
 end;
for i:=1 to X do
 for j:=1 to Y do
  if (map[i,j]=TILE_DOOR) or (map[i,j]=TILE_HOUSE_WALL) then
    map[i,j]:=TILE_ROAD
  else
   if map[i,j]=TILE_HOUSE_FLOOR then
      map[i,j]:=TILE_GROUND;
for i:=1 to X*Y div 50 do
 CreateSomething(5,20,false);
if typ=1 then
  begin
    AddModOnMap(1);
    for i:=1 to X do
      for j:=1 to Y do
        if map[i,j]=TILE_HOUSE_FLOOR then
           map[i,j]:=TILE_GROUND;
  end;

end;

function toBorder(var X,Y:integer):integer;
begin
 case random(4) of
  0:begin x:=1; toBorder:=4; end;
  1:begin y:=1; toBorder:=1; end;
  2:begin x:=MapX; toBorder:=2; end;
  3:begin y:=MapY; toBorder:=8; end;
 end;
end;

procedure CreateRoad;
  var x1,y1,x2,y2,i,j,k:integer;
begin
  x1:=random(MapX)+1;
  y1:=random(MapY)+1;
  x2:=random(MapX)+1;
  y2:=random(MapY)+1;
  while toBorder(x1,y1)*toBorder(x2,y2)<>8 do begin end;
  DrawLine(x1,y1,x2,y2,TILE_ROAD);
  for i:=1 to 3 do
    begin
      DrawLine(x1+i,y1,x2+i,y2,TILE_ROAD);
      DrawLine(x1-i,y1,x2+i,y2,TILE_ROAD);
      DrawLine(x1+i,y1,x2-i,y2,TILE_ROAD);
      DrawLine(x1-i,y1,x2-i,y2,TILE_ROAD);
      DrawLine(x1,y1+i,x2,y2+i,TILE_ROAD);
      DrawLine(x1,y1-i,x2,y2+i,TILE_ROAD);
      DrawLine(x1,y1-i,x2,y2-i,TILE_ROAD);
      DrawLine(x1,y1-i,x2,y2-i,TILE_ROAD);
    end;

  for i:=1 to MapX do
  for j:=1 to MapY do
    if countnearby(i,j,TILE_ROAD)>5 then
       map[i,j]:=TILE_ROAD;

end;

procedure WildernessCreate(X,Y:integer);
var i:integer;
begin
  MapClear(TILE_GROUND);
for i:=1 to (X*Y div 4000)+1 do
  CreateRoad;
for i:=1 to X*Y div 50 do
  CreateSomething(5,10,true);

end;

procedure CreateMap(X, Y, ID: Integer; var A: TBeaRLibMap; S: Integer);
var
  I, J: Integer;
begin
  if ((ID <= 0) or (ID > MaxID) or (X < MinX) or (Y < MinY))  then Exit;
  MapClear(TILE_GROUND);
  MapX := X;
  MapY := Y;
  Randomize;
  case ID of
    G_ANT_NEST:       AntNestCreate(1,1,X,Y,0);
    G_CAVES:          CavesCreate(X,Y);
    G_LAKES:          LakesCreate(1,1,X,Y,0);
    G_LAKES2:         LakesCreate(1,1,X,Y,1);
    G_TOWER:          TowerCreate(X,Y);
    G_HIVE:           AntNestCreate(1,1,X,Y,1);
    G_CITY:           CityCreate(X,Y,0);
    G_MOUNTAIN:       AntNestCreate(1,1,X,Y,2);
    G_FOREST:         ForestCreate(X,Y);
    G_VILLAGE:        VillageCreate(X,Y,0);
    G_SWAMP:          SwampCreate(X,Y);
    G_RIFT:           RiftCreate(X,Y);
    G_TUNDRA:         TundraCreate(X,Y);
    G_BROKEN_VILLAGE: VillageCreate(X,Y,1);
    G_BROKEN_CITY:    CityCreate(X,Y,1);
    G_MAZE:           MazeCreate(X,Y);
    G_CASTLE:         CastleCreate(X,Y);
    G_WILDERNESS:     WildernessCreate(X,Y);
  end; // case

     for I := 0 to X - 1 do
       for J := 0 to Y - 1 do
         A[I * Y + J] := Map[I+1][J+1];
end;


end.

