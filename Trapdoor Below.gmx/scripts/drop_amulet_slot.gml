dropped_amulet=instance_create(o_player.x,o_player.y,o_tile_amulet)

dropped_amulet.name=global.item[argument0,0]
dropped_amulet.sprite_index=global.item[argument0,1]

dropped_amulet.amulet_vit=global.item[argument0,10]
dropped_amulet.amulet_str=global.item[argument0,11]
dropped_amulet.amulet_dex=global.item[argument0,12]
dropped_amulet.amulet_int=global.item[argument0,13]
dropped_amulet.amulet_ac=global.item[argument0,14]
dropped_amulet.amulet_ev=global.item[argument0,15]

add_message("You drop an " +string(global.item[argument0,0])+string('.'))

if global.item[argument0,4]="used"
{
global.player_amulet_vit=0
global.player_amulet_str=0
global.player_amulet_dex=0
global.player_amulet_int=0
global.player_amulet_ac=0
global.player_amulet_ev=0
}

global.item[argument0,0]=""
global.item[argument0,1]=s_item_none
global.item[argument0,2]=""
global.item[argument0,4]="inventory"

global.item[argument0,10]=0
global.item[argument0,11]=0
global.item[argument0,12]=0
global.item[argument0,13]=0
global.item[argument0,14]=0
global.item[argument0,15]=0
