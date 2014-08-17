dropped_gloves=instance_create(o_player.x,o_player.y,o_tile_gloves)

dropped_gloves.name=global.item[argument0,0]
dropped_gloves.sprite_index=global.item[argument0,1]

dropped_gloves.gloves_vit=global.item[argument0,10]
dropped_gloves.gloves_str=global.item[argument0,11]
dropped_gloves.gloves_dex=global.item[argument0,12]
dropped_gloves.gloves_int=global.item[argument0,13]
dropped_gloves.gloves_ac=global.item[argument0,14]
dropped_gloves.gloves_ev=global.item[argument0,15]

add_message("You drop " +string(global.item[argument0,0])+string('.'))

if global.item[argument0,4]="used"
{
global.player_gloves_vit=0
global.player_gloves_str=0
global.player_gloves_dex=0
global.player_gloves_int=0
global.player_gloves_ac=0
global.player_gloves_ev=0
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
