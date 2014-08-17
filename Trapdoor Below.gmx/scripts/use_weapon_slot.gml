if room=room_tutorial_land
{
if o_tutorial_guy.i=8 || o_tutorial_guy.i=9
exit

if o_tutorial_guy.i<3
exit
}


if (global.item[argument0,6]="bow" || global.item[argument0,6]="staff")
{
for (p=0 p<20 p+=1)
    {
    if global.item[p,2]="shield"
        {
        if global.item[p,4]="used"
            {
            global.player_shield_vit=0
            global.player_shield_str=0
            global.player_shield_dex=0
            global.player_shield_int=0
            global.player_shield_ac=0
            global.player_shield_ev=0
            global.item[p,4]="inventory"
            
            //add_message("You unwield a " +string(global.item[p,0])+string('.'))
            }
        }        
    }
}

if global.item[argument0,4]="used"
{
global.player_weapon_vit=0
global.player_weapon_str=0
global.player_weapon_dex=0
global.player_weapon_int=0
global.player_weapon_ac=0
global.player_weapon_ev=0
global.item[argument0,4]="inventory"

add_message("You unwield a " +string(global.item[argument0,0])+string('.'))
exit
}



for (p=0 p<20 p+=1)
{
if global.item[p,2]="weapon"
    {
    global.item[p,4]="inventory"
    }
}

global.item[argument0,4]="used"

global.player_weapon_vit=global.item[argument0,10]
global.player_weapon_str=global.item[argument0,11]
global.player_weapon_dex=global.item[argument0,12]
global.player_weapon_int=global.item[argument0,13]
global.player_weapon_ac=global.item[argument0,14]
global.player_weapon_ev=global.item[argument0,15]

add_message("You wield a " +string(global.item[argument0,0])+string('.'))

if (room=room_tutorial_land)
{
if global.item[argument0,0]="Tutorial Sword"
{o_tutorial_guy.sword_wield=true}

if global.item[argument0,0]="Tutorial Bow"
{o_tutorial_guy.bow_wield=true}
}
