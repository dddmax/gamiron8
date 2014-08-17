//ALARM, in this program X means "height", and Y means "width"

procedure ForestPartDraw(x1,y1:integer);
var
  n,s,e,w,i,j,k: integer;
begin
  i:= x1;
  j:= y1;
  for k:= 1 to 20 do begin
    n:= random(6);
    e:= random(6);
    s:= random(6);
    w:= random(6);
    if n = 1 then begin
      i:= i - 1;
      if Tileset[map[i,j]].ch<>'.' then exit;
      map[i,j]:= TILE_TREE;
    end;
    if s = 1 then begin
      i:= i + 1;
      if Tileset[map[i,j]].ch<>'.' then exit;
      map[i,j]:= TILE_TREE;
    end;
    if e = 1 then begin
      j:= j + 1;
      if Tileset[map[i,j]].ch<>'.' then exit;
      map[i,j]:= TILE_TREE;
    end;
    if w = 1 then begin
      j:= j - 1;
      if Tileset[map[i,j]].ch<>'.' then exit;
      map[i,j]:= TILE_TREE;
    end;
  end;
end;



procedure ForestCreate(x,y:integer);
var i,j:integer;
begin
 for i:=1 to x*y div 10 do
   ForestPartDraw(random(x)+1,random(y)+1);
 for i:=1 to x do
   for j:=1 to y do
      if map[i,j]=TILE_GROUND then
        map[i,j]:=TILE_GRASS;
end;


procedure AddModOnMap(modtype:integer);
 var i,j,x,y:integer;
begin
case modtype of
 1:
   begin
    for i:=1 to MapX do
      for j:=1 to MapY do
        if Tileset[map[i,j]].ch='#' then
         if random(100)<=40 then
          map[i,j]:=TILE_GROUND;

   end;
 2:
    for i:=1 to MapX*MapY div 25 do
      ForestPartDraw(random(MapX)+1,random(MapY)+1);
 3:
   for i:=1 to MapX do
     for j:=1 to MapY do
      if random(100)<=20 then
        map[i,j]:=TILE_WATER;
 end;



end;



procedure AntNestCreate(x1,y1,x2,y2,typ:integer);
  var i,j:integer;
      kx,ky,k,dx,dy:real;
      x,y,py, px:integer;
      counter: integer;
begin
  x:=x2-x1+1;
  y:=y2-y1+1;
  buffer:=map;
  MapClear(TILE_GROUND);
  Map[X div 2, Y div 2] := TILE_CAVE_WALL;
  for i:=0 to (X*Y div 3) do
  begin
   k := (random(360)+1)*3.1419532/180;
   kx := (X/2) + (Y/2)*sin(k);
   ky := (Y/2) + (Y/2)*cos(k);
   dx := 1;
   dy := 1;
   while ((abs(dx)<10) and (abs(dy)<10)) do
    begin
     dx := Random(100)+1;
     dy := Random(100)+1;
    end;
   dx := dx - 50;
   dy := dy - 50;
   dx := dx / 100;
   dy := dy / 100;
   counter := 0;
   while (true) do
   begin
    if counter+1>10000  then
        break;
    counter := counter +1;
    kx := kx + dx;
    ky := ky + dy;
    px := round(kx);
    py := round(ky);
   if (px<0) then
      begin
       px := X;
       kx := px;
      end;
    if (px>X) then
      begin
       px := 1;
       kx := px;
      end;
    if (py<0) then
      begin
       py := Y;
       ky := py;
      end;
    if (py>Y) then
      begin
       py := 1;
       ky := py;
      end;
      if (px=0) then px := random(x)+1;
      if (py=0) then py := random(y)+1;
    if ((px>1)  and  (Map[px-1,py]=TILE_CAVE_WALL)) or
       ((py>1)  and  (Map[px,py-1]=TILE_CAVE_WALL)) or
       ((px<X)  and  (Map[px+1,py]=TILE_CAVE_WALL)) or
       ((py<Y)  and  (Map[px,py+1]=TILE_CAVE_WALL)) then
     begin
      Map[px,py]:=TILE_CAVE_WALL;
      Break;
     end;
   end;
end;
for i:=1 to X do
   for j:=1 to Y do
     if map[i,j]=TILE_CAVE_WALL  then
       map[i,j]:=TILE_GROUND
     else
       map[i,j]:=TILE_CAVE_WALL;
if typ>0 then
for i:=2 to X-1 do
 for j:=2 to Y-1 do
 if countnearby(i,j,TILE_CAVE_WALL)<=3 then
  map[i,j]:=TILE_GROUND;
if typ=2 then
begin
for i:=1 to X do
 for j:=1 to Y do
 if map[i,j]=TILE_CAVE_WALL then
  map[i,j]:=TILE_GROUND
  else
 if map[i,j]=TILE_GROUND then
   map[i,j] := TILE_MOUNTAIN;
    AddModOnMap(2);
    AddModOnMap(2);
 end;
for i:=x1 to x2 do
  for j:=y1 to y2 do
    buffer[i,j]:=map[i-x1+1,j-y1+1];
  map:=buffer;
end;





procedure RiftCreate(x,y:integer);
 var i,j:integer;
begin
 for i:=1 to x*y div 10 do
   ForestPartDraw(random(x)+1,random(y)+1);
 for i:=1 to X do
  for j:=1 to Y do
   if map[i,j]=TILE_TREE then
    map[i,j]:=TILE_GROUND
   else
    map[i,j]:=TILE_MOUNTAIN;
end;

procedure TundraCreate(x,y:integer);
 var i,newx,newy,lenx,leny:integer;
begin
 for i:=1 to x*y div 200 do
   ForestPartDraw(random(x)+1,random(y)+1);
 for i:=1 to x*y div 100 do
  begin
   if not(ReturnPlaceCoord(10,15,newx,newy,lenx,leny)) then continue;
   if random(100)<=50 then
    AntNestCreate(newx,newy,newx+lenx,newy+leny,2)
   else
    LakesCreate(newx,newy,newx+lenx,newy+leny,1);
  end;


end;



procedure DrawRoom(x1,y1,x2,y2:integer);
var i,x,y,k,j:integer;
    gh:boolean;
begin

for i:=x1+1 to x2-1 do
  for j:=y1+1 to y2-1 do
     map[i,j]:=TILE_HOUSE_FLOOR;
for i:=x1 to x2 do
 begin
 if map[i,y1]<>TILE_DOOR then
  map[i,y1]:=TILE_HOUSE_WALL;
 if map[i,y2]<>TILE_DOOR then
  map[i,y2]:=TILE_HOUSE_WALL;
 end;
for i:=y1 to y2 do
 begin
if map[x1,i]<>TILE_DOOR then
  map[x1,i]:=TILE_HOUSE_WALL;
 if map[x2,i]<>TILE_DOOR then
  map[x2,i]:=TILE_HOUSE_WALL;
 end;
for i:=1 to 30 do
while true do
begin
gh:=false;
x:=random(x2-x1-1)+1;
y:=random(y2-y1-1)+1;
k:=random(5);
if k=0 then
if countnearby(x1+x,y1,TILE_DOOR)=0 then
if map[x1+x,y1]<>TILE_DOOR then
begin
   map[x1+x,y1]:=TILE_DOOR;
   gh:=true;
end;
if k=1 then
if map[x1,y+y1]<>TILE_DOOR then
if countnearby(x1,y1+y,TILE_DOOR)=0 then
begin
   map[x1,y1+y]:=TILE_DOOR;
   gh:=true;
end;
if k=2 then
if map[x2,y1+y]<>TILE_DOOR then
if countnearby(x2,y1+y,TILE_DOOR)=0 then
begin
   map[x2,y1+y]:=TILE_DOOR;
   gh:=true;
end;
if k=3 then
if map[x1+x,y2]<>TILE_DOOR then
if countnearby(x1+x,y2,TILE_DOOR)=0 then
begin
   map[x1+x,y2]:=TILE_DOOR;
   gh:=true;
end;
if gh then exit;
end;
end;



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

