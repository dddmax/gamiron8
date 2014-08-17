if global.player_mananow>=argument2
{
global.player_mananow-=argument2

if (argument0="inferno")
    {
    if global.sound=true {sound_play(snd_magic)}
    add_message("Energy around you explodes creating")
    add_message("a massive heat wave.")
    var damage_modifier;

    damage_modifier=argument1

    a=instance_create(o_player.x+16+8,o_player.y+8,o_aoe_magic)
    a.damage_modifier=damage_modifier
    a.type="inferno"
    a=instance_create(o_player.x+16+8,o_player.y+16+8,o_aoe_magic)
    a.damage_modifier=damage_modifier
    a.type="inferno"
    a=instance_create(o_player.x+8,o_player.y+16+8,o_aoe_magic)
    a.damage_modifier=damage_modifier
    a.type="inferno"
    a=instance_create(o_player.x-16+8,o_player.y+16+8,o_aoe_magic)
    a.damage_modifier=damage_modifier
    a.type="inferno"
    a=instance_create(o_player.x-16+8,o_player.y+8,o_aoe_magic)
    a.damage_modifier=damage_modifier
    a.type="inferno"
    a=instance_create(o_player.x-16+8,o_player.y-16+8,o_aoe_magic)
    a.damage_modifier=damage_modifier
    a.type="inferno"
    a=instance_create(o_player.x+8,o_player.y-16+8,o_aoe_magic)
    a.damage_modifier=damage_modifier
    a.type="inferno"
    a=instance_create(o_player.x+16+8,o_player.y-16+8,o_aoe_magic)
    a.damage_modifier=damage_modifier
    a.type="inferno"
    
    normalize_stats()
    }
    
if (argument0="toxic_shock")
    {
    if global.sound=true {sound_play(snd_magic)}
    normalize_stats()
    
    add_message("Poisonous cloud surrounds you.")
    with (p_enemy)
        {
        if (distance_to_object(o_player) < 28)
            {    
            
            var oppo_name, own_dex, oppo_dex, damage_modifier;
            
            damage_modifier=argument1
            own_dex=random(global.player_total_int+global.player_total_ev)
            oppo_dex=random(total_dex+total_ev)
    
            if (own_dex>oppo_dex)
                {
                var damage;
                
                if poison>0
                    {
                    damage_modifier=1
                    }
                else
                    {
                    damage_modifier=0.5
                    poison=15
                    }
        
                damage=round(random(global.player_total_int*damage_modifier))
        
                if (damage>0)
                    {
                    healthnow-=damage
            
                    //DAMAGE MESSAGE
                    add_message("You deal " +string(damage) + string(' damage to ')+string(name)+string('.'),0)
            
                    //KILL MESSAGE
                    if (healthnow<=0)
                        {
                        add_message("You killed " +string(name)+string('.'),16)
                        }
                    }
                    else
                    add_message("You miss.",0)
                }
                else
                add_message("You miss.",0)
            }
            
        if floor(random(1.99))=0
        {
        poison=3*5
        add_message("The " +string(string_replace(name,'a ','The ')) + string(' is poisoned.'),0)
        }
        }

    }
    
if (argument0="fiery_rage")
    {
    if global.sound=true {sound_play(snd_magic)}
    normalize_stats()
    var damage_modifier;

    damage_modifier=argument1

    a=instance_create(o_player.x+16+8,o_player.y+8,o_aoe_magic)
    a.damage_modifier=damage_modifier
    a.type="fiery_rage"
    a=instance_create(o_player.x+8,o_player.y+16+8,o_aoe_magic)
    a.damage_modifier=damage_modifier
    a.type="fiery_rage"
    a=instance_create(o_player.x-16+8,o_player.y+8,o_aoe_magic)
    a.damage_modifier=damage_modifier
    a.type="fiery_rage"
    a=instance_create(o_player.x+8,o_player.y-16+8,o_aoe_magic)
    a.damage_modifier=damage_modifier
    a.type="fiery_rage"
    }

}
else
add_message("You need more mana.")
