if global.race=8
{
add_message("You can't wear this! You are a wraith!")
exit
}

if global.item[argument0,4]="used"
{
global.player_gloves_vit=0
global.player_gloves_str=0
global.player_gloves_dex=0
global.player_gloves_int=0
global.player_gloves_ac=0
global.player_gloves_ev=0
global.item[argument0,4]="inventory"

add_message("You take off " +string(global.item[argument0,0])+string('.'))
exit
}



for (p=0 p<20 p+=1)
{
if global.item[p,2]="gloves"
    {
    global.item[p,4]="inventory"
    }
}

global.item[argument0,4]="used"

global.player_gloves_vit=global.item[argument0,10]
global.player_gloves_str=global.item[argument0,11]
global.player_gloves_dex=global.item[argument0,12]
global.player_gloves_int=global.item[argument0,13]
global.player_gloves_ac=global.item[argument0,14]
global.player_gloves_ev=global.item[argument0,15]

add_message("You wear " +string(global.item[argument0,0])+string('.'))
