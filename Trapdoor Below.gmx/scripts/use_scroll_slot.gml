
    add_message("You read a " +string(global.item[argument0,0])+string('.'))

    switch(global.item[argument0,5])
    {                           //NAME, DMG_MOD, MANA COST
        case "fireball":        {cast_spell_missile("fireball",1,2) break}
        case "inferno":         {cast_spell_aoe("inferno",1.5,4) break}
        case "fiery_rage":      {cast_spell_enchament("fiery_rage",0.5,10) break}
        case "ice_shard":       {cast_spell_missile("ice_shard",0.8,2) break}
        case "freeze":          {cast_spell_missile("freeze",0,4)  break}
        case "snakebite":       {cast_spell_missile("snakebite",1,2)  break}
        case "toxic_shock":     {cast_spell_aoe("toxic_shock",1,5) break}
        case "ghost_form":      {cast_spell_enchament("ghost_form",0,10) break}
        case "life_drain":      {cast_spell_missile("drain_life",1,3) break}
        case "blink":           {cast_spell_missile("blink",0,10) break}
        case "confusion":       {cast_spell_missile("confusion",0,3) break}  
        case "shadows":         {cast_spell_enchament("shadows",0,10) break}  
        case "magic_dart":      {cast_spell_missile("magic_dart",0.75,1) break}  
        case "healing":         {cast_spell_enchament("healing",1,8) break}  
        case "banish":          {cast_spell_missile("banish",1,3) break}  
        case "devastation":     {cast_spell_missile("devastation",1.3,2) break} 

    }
