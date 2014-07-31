//if player goes through a doorway, adjust the room and positions.
if x < 64{
x = 384-16;
roomx -= cell_width;
scr_update_room();}

if x > 384{
x = 64+16;
roomx += cell_width;
scr_update_room();}

if y < 64{
y = 384-16;
roomy -= cell_height;
scr_update_room();}

if y > 384{
y = 64+16;
roomy += cell_height;
scr_update_room();}






