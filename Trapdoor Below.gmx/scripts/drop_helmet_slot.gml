dropped_helmet=instance_create(o_player.x,o_player.y,o_tile_helmet)

dropped_helmet.name=global.item[argument0,0]
dropped_helmet.sprite_index=global.item[argument0,1]

dropped_helmet.helmet_vit=global.item[argument0,10]
dropped_helmet.helmet_str=global.item[argument0,11]
dropped_helmet.helmet_dex=global.item[argument0,12]
dropped_helmet.helmet_int=global.item[argument0,13]
dropped_helmet.helmet_ac=global.item[argument0,14]
dropped_helmet.helmet_ev=global.item[argument0,15]

add_message("You drop a " +string(global.item[argument0,0])+string('.'))

if global.item[argument0,4]="used"
{
global.player_helmet_vit=0
global.player_helmet_str=0
global.player_helmet_dex=0
global.player_helmet_int=0
global.player_helmet_ac=0
global.player_helmet_ev=0
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
