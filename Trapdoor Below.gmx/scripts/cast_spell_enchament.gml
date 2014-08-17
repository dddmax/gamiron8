if global.player_mananow>=argument2
{
global.player_mananow-=argument2

    if argument="fiery_rage"
    {
    global.player_dex_modifier=-(global.player_str/2) 
    global.player_str_modifier=(global.player_str/3) 
    global.player_rage=20 
    add_message("Rage blinds your eyes.")
    }
    
    if argument="shadows"
    {
    global.player_ev_modifier=(global.player_dex/2)
    global.player_shadows=20 
    add_message("Shadows protect you.")
    }
    
    if argument="ghost_form"
    {
    global.player_invisible=global.player_total_int
    global.player_str_modifier=-99
    global.player_dex_modifier=-99
    global.player_int_modifier=-99
    add_message("Your body vanishes.")
    }
    
    if argument="healing"
    {
    global.player_healthnow+=20
    if global.player_healthnow > global.player_healthmax
        {global.player_healthnow=global.player_healthmax}
        
    add_message("You feel refreshed.")
    }

    normalize_stats()
}
else
add_message("You need more mana.")
