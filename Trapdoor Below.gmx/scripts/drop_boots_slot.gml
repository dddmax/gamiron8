dropped_boots=instance_create(o_player.x,o_player.y,o_tile_boots)

dropped_boots.name=global.item[argument0,0]
dropped_boots.sprite_index=global.item[argument0,1]

dropped_boots.boots_vit=global.item[argument0,10]
dropped_boots.boots_str=global.item[argument0,11]
dropped_boots.boots_dex=global.item[argument0,12]
dropped_boots.boots_int=global.item[argument0,13]
dropped_boots.boots_ac=global.item[argument0,14]
dropped_boots.boots_ev=global.item[argument0,15]

add_message("You drop " +string(global.item[argument0,0])+string('.'))

if global.item[argument0,4]="used"
{
global.player_boots_vit=0
global.player_boots_str=0
global.player_boots_dex=0
global.player_boots_int=0
global.player_boots_ac=0
global.player_boots_ev=0
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
