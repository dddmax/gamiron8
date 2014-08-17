if global.race=8
{
add_message("You can't drink this! You are a wraith!")
exit
}

if global.item[argument0,5]="tutorial"
{
add_message("You are not allowed to drink that right now.")
exit
}


add_message("You drink a " +string(global.item[argument0,0])+string('.'))

switch(global.item[argument0,5])
{
    case "big_heal": {global.player_healthnow+=30 if global.player_healthnow>global.player_healthmax {global.player_health=global.player_healthmax} add_message("You gain 30 health.") global.potion_effect_big_heal=true break}
    case "small_heal": {global.player_healthnow+=15 if global.player_healthnow>global.player_healthmax {global.player_health=global.player_healthmax} add_message("You gain 15 health.") global.potion_effect_small_heal=true break}
    case "invisible": {global.player_invisible=12 add_message("You become invisible.") global.potion_effect_invisible=true break}
    case "anti_poison": {global.player_poisoned=0 add_message("You drink antipoison potion.") global.potion_effect_anti_poison=true break}
    case "str_inc": {global.player_str_modifier=global.player_level*2 add_message("Your strength increaces.") global.potion_effect_str_inc=true break}
    case "dex_inc": {global.player_dex_modifier=global.player_level*2 add_message("Your dexterity increaces.") global.potion_effect_dex_inc=true break}
    case "int_inc": {global.player_int_modifier=global.player_level*2 add_message("Your intelligence increaces.") global.potion_effect_int_inc=true break}
    case "ac_inc": {global.player_ac_modifier=global.player_level add_message("Your armour class increaces.") global.potion_effect_ac_inc=true break}
    case "ev_inc": {global.player_ev_modifier=global.player_level*2 add_message("Your evasion value increaces.") global.potion_effect_ev_inc=true break}
    case "poison": {global.player_poisoned=5*8 add_message("You are poisoned!") global.potion_effect_poison=true break}
    case "cripple": {global.player_crippled=6 add_message("Your are crippled!") global.potion_effect_cripple=true break}
    case "str_deg": {global.player_str_modifier=-global.player_level*2 add_message("Your strength decreaces.") global.potion_effect_str_deg=true break}
    case "dex_deg": {global.player_dex_modifier=-global.player_level*2 add_message("Your dexterity decreaces.") global.potion_effect_dex_deg=true break}
    case "int_deg": {global.player_int_modifier=-global.player_level*2 add_message("Your intelligence decreaces.") global.potion_effect_int_deg=true break}
    case "ac_deg": {global.player_ac_modifier=-global.player_level add_message("Your armour class decreaces.") global.potion_effect_ac_deg=true break}
    case "ev_deg": {global.player_ev_modifier=-global.player_level*2 add_message("Your evasion value decreaces.") global.potion_effect_ev_deg=true break}
    
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
