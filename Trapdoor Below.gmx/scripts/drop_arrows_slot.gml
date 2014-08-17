dropped_arrows=instance_create(o_player.x,o_player.y,o_tile_arrows)

dropped_arrows.name=global.item[argument0,0]
dropped_arrows.sprite_index=global.item[argument0,1]
dropped_arrows.amount=global.item[argument0,3]
dropped_arrows.effect=global.item[argument0,5]



add_message("You drop " +string(global.item[argument0,0])+string('.'))


global.item[argument0,0]=""
global.item[argument0,1]=s_item_none
global.item[argument0,2]=""
global.item[argument0,3]=0
global.item[argument0,4]="inventory"

global.item[argument0,10]=0
global.item[argument0,11]=0
global.item[argument0,12]=0
global.item[argument0,13]=0
global.item[argument0,14]=0
global.item[argument0,15]=0
