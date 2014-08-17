var bow_inv, arrows_inv;
bow_inv=false
arrows_inv=false


for (o=0 o<20 o+=1)
{
if  (global.item[o,2]="weapon" && global.item[o,4]="used" && global.item[o,6]="bow")
    {
        bow_inv=true
    }
}

for (o=0 o<20 o+=1)
{
if  (global.item[o,2]="arrows")
    {
        arrows_inv=true
    }
}
if arrows_inv=false
{
add_message("You are out of arrows!")
exit
}

if bow_inv=false
{
add_message("You can't throw these!")
exit
}

if global.ranged_attack=false
{

a=instance_create(mouse_x,mouse_y,o_aim)
a.attack_type="arrows"

global.ranged_attack=true

}
