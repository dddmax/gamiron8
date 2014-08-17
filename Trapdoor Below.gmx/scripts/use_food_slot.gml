if global.race=8
{
add_message("You can't eat this! You are a wraith!")
exit
}

add_message("You eat a " +string(global.item[argument0,0])+string('.'))
global.player_hunger+=200

if global.player_hunger>700
{global.player_hunger=700}

if global.race<5 || global.race>5
{
add_message("The " +string(global.item[argument0,0])+string(' tasted good.'))
}

if global.race=5
{
if global.item[argument0,0]="Meat" || global.item[argument0,0]="Chicken"
    {
    add_message('Yummy! Fresh meat.')
    global.player_str_modifier=global.player_level
    global.player_hunger+=50
    
    if global.player_hunger>700
    {global.player_hunger=700}
    }
if global.item[argument0,0]="Red Apple" || global.item[argument0,0]="Green Apple" || global.item[argument0,0]="Pineapple"
    {
    add_message('Yuck! Who would ever eat this?')
    global.player_str_modifier-=global.player_level
    global.player_hunger-=50
    }
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
