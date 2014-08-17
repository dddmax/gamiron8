dropped_weapon=instance_create(o_player.x,o_player.y,o_tile_weapon)

dropped_weapon.name=global.item[argument0,0]
dropped_weapon.sprite_index=global.item[argument0,1]

dropped_weapon.weapon_vit=global.item[argument0,10]
dropped_weapon.weapon_str=global.item[argument0,11]
dropped_weapon.weapon_dex=global.item[argument0,12]
dropped_weapon.weapon_int=global.item[argument0,13]
dropped_weapon.weapon_ac=global.item[argument0,14]
dropped_weapon.weapon_ev=global.item[argument0,15]

add_message("You drop a " +string(global.item[argument0,0])+string('.'))

if global.item[argument0,4]="used"
{
global.player_weapon_vit=0
global.player_weapon_str=0
global.player_weapon_dex=0
global.player_weapon_int=0
global.player_weapon_ac=0
global.player_weapon_ev=0
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
