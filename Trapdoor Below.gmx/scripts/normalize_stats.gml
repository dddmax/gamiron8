for(s=0 s<20 s+=1)
        {
        if global.item[s,5]="immune_poison"
            {
            if global.item[s,4]="used"
                {
                if global.player_poisoned>0
                    {
                    add_message("You resist poison.")
                    global.player_poisoned=0
                    }
                }
            }
            
        if global.item[s,5]="immune_confusion"
            {
            if global.item[s,4]="used"
                {
                if global.player_confusion>0
                    {
                    add_message("You resist confusion.")
                    global.player_confusion=0
                    }
                }
            }
        if global.item[s,5]="hurt"
            {
            if global.item[s,4]="used"
                {
                if floor(random(10))=0 && global.player_healthnow>0
                    {
                    global.player_healthnow-=3
                    add_message("Something hits you.")
                    }
                }
            }
        if global.item[s,5]="mana_burn"
            {
            if global.item[s,4]="used"
                {
                if floor(random(10))=0 && global.player_mananow>0
                    {
                    global.player_mananow-=1
                    add_message("Something drains your mana.")
                    }
                }
            }
        if global.item[s,5]="ac_inc"
            {
            if global.item[s,4]="used"
                {
                if global.player_ac_modifier<0.2
                    {
                    global.player_ac_modifier+=global.player_level
                    }
                }
            }
        if global.item[s,5]="ev_inc"
            {
            if global.item[s,4]="used"
                {
                if global.player_ev_modifier<0.2
                    {
                    global.player_ev_modifier+=global.player_level
                    }
                }
            }
        if global.item[s,5]="str_inc"
            {
            if global.item[s,4]="used"
                {
                if global.player_str_modifier<0.2
                    {
                    global.player_str_modifier+=global.player_level
                    }
                }
            }
        if global.item[s,5]="dex_inc"
            {
            if global.item[s,4]="used"
                {
                if global.player_dex_modifier<0.2
                    {
                    global.player_dex_modifier+=global.player_level
                    }
                }
            }
        if global.item[s,5]="int_inc"
            {
            if global.item[s,4]="used"
                {
                if global.player_int_modifier<0.2
                    {
                    global.player_int_modifier+=global.player_level
                    }
                }
            }
        if global.item[s,5]="ac_deg"
            {
            if global.item[s,4]="used"
                {
                if global.player_ac_modifier>-0.2
                    {
                    global.player_ac_modifier-=global.player_level
                    }
                }
            }
        if global.item[s,5]="ev_deg"
            {
            if global.item[s,4]="used"
                {
                if global.player_ev_modifier>-0.2
                    {
                    global.player_ev_modifier-=global.player_level
                    }
                }
            }
        if global.item[s,5]="str_deg"
            {
            if global.item[s,4]="used"
                {
                if global.player_str_modifier>-0.2
                    {
                    global.player_str_modifier-=global.player_level
                    }
                }
            }
        if global.item[s,5]="dex_deg"
            {
            if global.item[s,4]="used"
                {
                if global.player_dex_modifier>-0.2
                    {
                    global.player_dex_modifier-=global.player_level
                    }
                }
            }
        if global.item[s,5]="int_deg"
            {
            if global.item[s,4]="used"
                {
                if global.player_int_modifier>-0.2
                    {
                    global.player_int_modifier-=global.player_level
                    }
                }
            }
        if global.item[s,0]="Bloody Staff" && global.player_healthnow>1
            {
            if global.item[s,4]="used"
                {
                if global.player_int_modifier<0.2
                    {
                        if floor(random(10))=0
                        {
                        global.player_healthnow-=3
                        global.player_int_modifier+=global.player_level
                        add_message("The Bloody Staff drains energy from you.")
                        add_message("Your intelligence increaces.")
                        }
                    }
                }
            }
        if global.item[s,0]="Healing Staff" && global.player_healthnow<global.player_healthmax
            {
            if global.item[s,4]="used"
                {
                if floor(random(40))=0
                    {
                    global.player_healthnow+=10
                    add_message("You gain 10 health.")
                    }
                }
            }
            
        if global.item[s,0]="Skull Staff"
            {
            if global.item[s,4]="used"
                {
                if floor(random(120))=0
                    {
                    global.player_invisible+=global.player_level*2+6
                    add_message("You become invisible.")
                    }
                }
            }
        }


with(o_player)
    {
    regen-=1
    
    for(s=0 s<20 s+=1)
        {
        if global.item[s,5]="faster_regen"
            {
            if global.item[s,4]="used"
            {regen-=0.5}
            }
        if global.item[s,5]="slower_regen"
            {
            if global.item[s,4]="used"
            {regen+=0.5}
            }
        }
    
    if global.player_rage>0
        {
        global.player_rage-=1
    
        if global.player_rage=1
            {
            global.player_rage=0
            
            add_message("You are tired.")
            global.player_str_modifier=-2
            global.player_dex_modifier=0
            }
        }
    if global.player_shadows>0
        {
        global.player_shadows-=1
    
        if global.player_shadows=1
            {
            global.player_shadows=0
            global.player_ev_modifier=0
            add_message("Shadows disappear.")
            }
        }
        
    if global.player_invisible>0
        {
        global.player_invisible-=1
    
        if global.player_invisible=1
            {
            global.player_invisible=0
            
            add_message("You become visible.")
            global.player_str_modifier=0
            global.player_dex_modifier=0
            global.player_int_modifier=0
            }
        }
    
    
    }


with(p_enemy){movement_point=1}
with(p_enemy){movement_stopped-=1 if movement_stopped<0 {movement_stopped=0}}
with(p_enemy){confusion-=1 if confusion<0 {confusion=0}}

if global.player_poisoned>0
    {
    global.player_poisoned-=1
    
    if frac(global.player_poisoned/5)=0
        {
        global.player_healthnow-=round(global.player_healthmax*0.1)+1
        if global.player_healthnow<=0
        {add_message("You have been badly wounded by poison.")
        global.player_killedby='poison'}
        }
    }
    
if global.player_crippled>0 {global.player_crippled-=1}

if global.player_str_modifier>0 {global.player_str_modifier-=0.05}
if global.player_dex_modifier>0 {global.player_dex_modifier-=0.05}
if global.player_int_modifier>0 {global.player_int_modifier-=0.05}
if global.player_ac_modifier>0 {global.player_ac_modifier-=0.05}
if global.player_ev_modifier>0 {global.player_ev_modifier-=0.05}

if global.player_str_modifier<0 {global.player_str_modifier+=0.05}
if global.player_dex_modifier<0 {global.player_dex_modifier+=0.05}
if global.player_int_modifier<0 {global.player_int_modifier+=0.05}
if global.player_ac_modifier<0 {global.player_ac_modifier+=0.05}
if global.player_ev_modifier<0 {global.player_ev_modifier+=0.05}

if (room=room1)
{

//hunger
global.player_hunger-=1
//undead hunger
if (floor(random(1.99))=0 && global.race=2)
{
global.player_hunger+=1
}

//wraith hunger
if global.race=8
{
global.player_hunger+=1
}

}

    for(s=0 s<20 s+=1)
        {
        if global.item[s,5]="more_hungry"
            {
            if global.item[s,4]="used"
            {global.player_hunger-=1}
            }
        if global.item[s,5]="less_hungry"
            {
            if global.item[s,4]="used"
            {global.player_hunger+=0.5}
            }
        }

if global.player_hunger<=0
{
global.player_killedby='lack of food'
add_message("You starve to death...")
global.player_healthnow=0
}
