//keyboard checking to move the player
move_dir = -1;
if keyboard_check(ord('W')){
imgy = 0;
move_dir = 90;}

if keyboard_check(ord('D')){
imgx = 0;
move_dir = 0;}

if keyboard_check(ord('S')){
imgy = 8;
move_dir = 270;}

if keyboard_check(ord('A')){
imgx = 4;
move_dir = 180;}

//move the player and set the sprite image in motion.
if move_dir >= 0{
imgi+=.25;
if imgi >=3.9{imgi = 0;}
move_contact_solid(move_dir,move_speed);}
else{imgi = 0;}
image_single = imgx+imgy+floor(imgi);
