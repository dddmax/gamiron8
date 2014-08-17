dropped_shield=instance_create(o_player.x,o_player.y,o_tile_shield)

dropped_shield.name=global.item[argument0,0]
dropped_shield.sprite_index=global.item[argument0,1]

dropped_shield.shield_vit=global.item[argument0,10]
dropped_shield.shield_str=global.item[argument0,11]
dropped_shield.shield_dex=global.item[argument0,12]
dropped_shield.shield_int=global.item[argument0,13]
dropped_shield.shield_ac=global.item[argument0,14]
dropped_shield.shield_ev=global.item[argument0,15]

add_message("You drop a " +string(global.item[argument0,0])+string('.'))

if global.item[argument0,4]="used"
{
global.player_shield_vit=0
global.player_shield_str=0
global.player_shield_dex=0
global.player_shield_int=0
global.player_shield_ac=0
global.player_shield_ev=0
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
