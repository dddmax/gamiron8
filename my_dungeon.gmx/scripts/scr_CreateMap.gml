/*
1) МУРАВЕЙНИК (ANT CAVES)
2) ПЕЩЕРЫ (CAVES)
3) ДЕРЕВНЯ (VILLAGE)
4/5) ВОДА (WATER MAPS)
6) БАШНЯ (LOST TOWER)
7) УЛЕЙ (HIVE)
8 ) ГОРОД (THE CITY)
9) ГОРЫ В ЛЕСУ (MOUNTAINS)
10) ЛЕС (THE FOREST)
11) БОЛОТО(SWAMP)
12) СМЕРТЕЛЬНЫЙ ПЕРЕВАЛ (DEATH CLIFF)
13) ТУНДРА 
14) РАЗРУШЕННЫЙ ГОРОД (DESTROYED CITY)
15) РАЗРУШЕННАЯ ДЕРЕВНЯ(DESTROYED VILLAGE)
16) КАНАЛИЗАЦИЯ (SEWERS)
17) ЗАМОК (THE CASTLE)
18) Перекресток (Crossroads)
*/
//procedure CreateMap(X, Y, ID: Integer; var A: TBeaRLibMap; S: Integer); //main procedure of creating map
mapW = argument0;
mapH = argument1;
mapID = argument2; //type map

//TBeaRLibMap 
global.map = ds_grid_create(mapW, mapH); //there we save map after creating

//MaxX = 1024 - 1;
//MaxY = 1024 - 1;
MinX = 25;
MinY = 25;


/*
StdArray = array[-100..MaxX + 100, -100..MaxY + 100] of Byte;

var
  Buffer, Map: StdArray;
  MapX, MapY: Integer;  //height and width of map(X - height!)
  A: TBeaRLibMap;
*/

G_ANT_NEST=1;
G_CAVES = 2;
G_VILLAGE = 3;
G_LAKES = 4;
G_LAKES2 = 5;
G_TOWER = 6;
G_HIVE = 7;
G_CITY = 8;
G_MOUNTAIN=9;
G_FOREST = 10;
G_SWAMP = 11;
G_RIFT=12;
G_TUNDRA=13;
G_BROKEN_CITY=14;
G_BROKEN_VILLAGE=15;
G_MAZE=16;
G_CASTLE = 17;
G_WILDERNESS = 18;

MAXID = 18;

TILE_CAVE_WALL=0;
TILE_GROUND=1;
TILE_WATER = 2;
TILE_TREE = 3;
TILE_MOUNTAIN = 4;
TILE_DOOR=5;
TILE_ROAD=6;
TILE_HOUSE_WALL = 7;
TILE_HOUSE_FLOOR = 8;
TILE_GRASS = 9;
TILE_EMPTY = 10;

TILE_LAST = 10;

/*
type
  Tile = record
    Ch: Char;
    Color: Byte;
  end;

const tileset:array[0..TILE_LAST] of Tile =(
(ch:'#';color:6), //0
(ch:'.';color:8), //1
(ch:'~';color:1), //2
(ch:'T';color:10), //3
(ch:'^';color:8), //4
(ch:'+';color:7), //5
(ch:'%';color:8), //6
(ch:'#';color:7), //7
(ch:'.';color:15), //8
(ch:'.';color:10), //9
(ch:' ';color:0) //10
);
*/

//procedure CreateMap(X, Y, ID: Integer; var A: TBeaRLibMap; S: Integer);
//var  I, J: Integer;

if ((mapID < 0) or (mapID > MaxID) or (X < MinX) or (Y < MinY))  then exit;
scr_MapClear(TILE_GROUND);  
randomize;
  
  
  
switch(mapID)
{
    case  G_ANT_NEST:       scr_AntNestCreate(1,1,X,Y,0); break;
    case  G_CAVES:          scr_CavesCreate(X,Y); break;
    case  G_LAKES:          scr_LakesCreate(1,1,X,Y,0); break;
    case  G_LAKES2:         scr_LakesCreate(1,1,X,Y,1); break;
    case  G_TOWER:          scr_TowerCreate(X,Y); break;
    case  G_HIVE:           scr_AntNestCreate(1,1,X,Y,1); break;
    case  G_CITY:           scr_CityCreate(X,Y,0); break;
    case  G_MOUNTAIN:       scr_AntNestCreate(1,1,X,Y,2); break;
    case  G_FOREST:         scr_ForestCreate(X,Y); break;
    case  G_VILLAGE:        scr_VillageCreate(X,Y,0); break;
    case  G_SWAMP:          scr_SwampCreate(X,Y); break;
    case  G_RIFT:           scr_RiftCreate(X,Y); break;
    case  G_TUNDRA:         scr_TundraCreate(X,Y); break;
    case  G_BROKEN_VILLAGE: scr_VillageCreate(X,Y,1); break;
    case  G_BROKEN_CITY:    scr_CityCreate(X,Y,1); break;
    case  G_MAZE:           scr_MazeCreate(X,Y); break;
    case  G_CASTLE:         scr_CastleCreate(X,Y); break;
    case  G_WILDERNESS:     scr_WildernessCreate(X,Y); break;
  }; // case

/*
for(i=0; i<X-1; i+=1)
for(j=0; j<Y-1; j+=1)
    A[i*Y + j] = Map[i+1][j+1];
*/
