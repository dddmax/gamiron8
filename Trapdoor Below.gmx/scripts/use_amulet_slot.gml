if global.race=8
{
add_message("You can't wear this! You are a wraith!")
exit
}

if global.item[argument0,4]="used"
{
global.player_amulet_vit=0
global.player_amulet_str=0
global.player_amulet_dex=0
global.player_amulet_int=0
global.player_amulet_ac=0
global.player_amulet_ev=0
global.item[argument0,4]="inventory"

add_message("You take off an " +string(global.item[argument0,0])+string('.'))
exit
}



for (p=0 p<20 p+=1)
{
if global.item[p,2]="amulet"
    {
    global.item[p,4]="inventory"
    }
}

global.item[argument0,4]="used"

global.player_amulet_vit=global.item[argument0,10]
global.player_amulet_str=global.item[argument0,11]
global.player_amulet_dex=global.item[argument0,12]
global.player_amulet_int=global.item[argument0,13]
global.player_amulet_ac=global.item[argument0,14]
global.player_amulet_ev=global.item[argument0,15]

add_message("You wear an " +string(global.item[argument0,0])+string('.'))
