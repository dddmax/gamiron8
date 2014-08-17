    var count;
    count=0
    for (bb=0 bb<20 bb+=1)
        {
        count+=1
        if !(global.item[bb,0]="") && count=20
            {
            add_message("Your backpack is full.",16)
            break
            }
        }
