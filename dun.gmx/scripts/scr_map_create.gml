max_rooms = 60;//total number of rooms to generate.
max_nbor = 2;//how many neiboring rooms can each room have.(1-4)
cell_width = 16;//how big each room is.
cell_height = 16;//how big each room is.
grid_width = 11;//how many rooms across are allowed.
grid_height = 11;

sx = (cell_width/32);
sy = (cell_height/32);

//variable declaration
room_count = 0;
curx = x;
cury = y;
toggle_nbor = floor(max_nbor);

//parimeter
botx = room_width-(cell_width*grid_width)-8;
boty = room_height-(cell_height*grid_height)-8;
topx = room_width-8;
topy = room_height-8;




