var throwing_spears_inv, empty_hands_weapon, empty_hands_shield;
throwing_spears_inv=false
empty_hands_weapon=true
empty_hands_shield=true

for (o=0 o<20 o+=1)
{
if  (global.item[o,2]="weapon" && global.item[o,4]="used")
    {
        empty_hands_weapon=false
    }
}

for (o=0 o<20 o+=1)
{
if  (global.item[o,2]="shield" && global.item[o,4]="used")
    {
        empty_hands_shield=false
    }
}

for (o=0 o<20 o+=1)
{
if  (global.item[o,2]="throwing_spears")
    {
        throwing_spears_inv=true
    }
}
if throwing_spears_inv=false
{
add_message("You don't have any Throwing Spears left!")
exit
}

if (empty_hands_weapon=false && empty_hands_shield=true)
{
add_message("Unwield your weapon first.")
exit
}

if (empty_hands_weapon=true && empty_hands_shield=false)
{
add_message("Unwield your shield first.")
exit
}

if (empty_hands_weapon=false && empty_hands_shield=false)
{
add_message("Unwield your weapon and shield first.")
exit
}

if global.ranged_attack=false
{

a=instance_create(mouse_x,mouse_y,o_aim)
a.attack_type="throwing_spears"

global.ranged_attack=true

}
