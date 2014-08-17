if global.player_mananow>=argument2
{
global.player_mananow-=argument2

    if global.ranged_attack=false
    {

    a=instance_create(mouse_x,mouse_y,o_aim)
    a.attack_type=argument0
    a.damage_modifier=argument1

    global.ranged_attack=true

    }

}
else
add_message("You need more mana.")
