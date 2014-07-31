// Define variables
bsp_splitcount = 6;             // Amount of splits (Don't split too many times, you're still limited to grid size)
bsp_xsize = 256;                // Grid width
bsp_ysize = 128;                // Grid height
bsp_tilesize = 4;               // Size per tile (graphics only)
bsp_range_min = 0.3;            // Min split factor (scale 0 - 1)
bsp_range_max = 0.7;            // Max split factor (scale 0 - 1)
bsp_room_size_min = 0.75;       // Min room size factor (scale 0 - 1) (keep 0.5 as the lowest value)
bsp_room_size_max = 1;          // Max room size factor (scale 0 - 1)
bsp_border = 1;                 // Define whether to use a border around the rooms 0 = off, 1 = on



// Start out with 1 big field -- I'm using objects to represent the leaves because that's easy to program
i = instance_create(0, 0, bsp);
i.xmin = 0;                                                 // smallest x
i.ymin = 0;                                                 // smallest y
i.xmax = bsp_xsize;                                         // biggest x
i.ymax = bsp_ysize;                                         // biggest y
i.factor = random_range(bsp_range_min, bsp_range_max);      // this is the range to split
i.orient = choose(0, 1);                                    // this is the orientation -- 0 is horizontal split, 1 is vertical split

// Loop through available splits and create leaves
repeat bsp_splitcount
begin
    with bsp
    begin
        if orient = 0
        begin
            i = instance_create(0, 0, bsp);
            i.xmin = xmin;
            i.ymin = ymin;
            i.xmax = xmin + round((xmax-xmin)*factor); 
            i.ymax = ymax;
            i.factor = random_range(Control.bsp_range_min, Control.bsp_range_max);
            if (i.xmax-i.xmin)/(i.ymax-i.ymin) >= 1 then i.orient = 0 else i.orient = 1;
            // The line above is to check the aspect ratio of the created leaf, and split it the right direction. 
            // This prevents from creating very thin leafs.
            
            i = instance_create(0, 0, bsp);
            i.xmin = xmin + round((xmax-xmin)*factor);
            i.ymin = ymin;
            i.xmax = xmax; 
            i.ymax = ymax;                 
            i.factor = random_range(Control.bsp_range_min, Control.bsp_range_max); 
            if (i.xmax-i.xmin)/(i.ymax-i.ymin) >= 1 then i.orient = 0 else i.orient = 1;
        end;
        else
        begin
            i = instance_create(0, 0, bsp);
            i.xmin = xmin;
            i.ymin = ymin;
            i.xmax = xmax;
            i.ymax = ymin + round((ymax-ymin)*factor);
            i.factor = random_range(Control.bsp_range_min, Control.bsp_range_max);
            if (i.xmax-i.xmin)/(i.ymax-i.ymin) >= 1 then i.orient = 0 else i.orient = 1;
            
            i = instance_create(0, 0, bsp);
            i.xmin = xmin;
            i.ymin = ymin + round((ymax-ymin)*factor);
            i.xmax = xmax; 
            i.ymax = ymax;                 
            i.factor = random_range(Control.bsp_range_min, Control.bsp_range_max); 
            if (i.xmax-i.xmin)/(i.ymax-i.ymin) >= 1 then i.orient = 0 else i.orient = 1; 
        end;  
        
        // Destroy the splitted bsp object
        instance_destroy(); 
    end;
end;

// Save bsp object data in arrays, so they can be used later on
bsp_count = 0;
with bsp
begin
    Control.bsp_count += 1;
    Control.bsp_array_xmin[Control.bsp_count] = xmin;
    Control.bsp_array_ymin[Control.bsp_count] = ymin;
    Control.bsp_array_xmax[Control.bsp_count] = xmax;
    Control.bsp_array_ymax[Control.bsp_count] = ymax;
    instance_destroy();
end;

// Now the BSP is created and the data is saved in arrays, it's time to generate some rooms out of it.
bsp_grid = ds_grid_create(bsp_xsize, bsp_ysize);

i = 0;
repeat bsp_count
begin
    i += 1;
    
    w = (bsp_array_xmax[i]-bsp_border)-(bsp_array_xmin[i]+bsp_border);
    h = (bsp_array_ymax[i]-bsp_border)-(bsp_array_ymin[i]+bsp_border);
     
    bsp_room_w = round(w*random_range(bsp_room_size_min, bsp_room_size_max));
    bsp_room_h = round(h*random_range(bsp_room_size_min, bsp_room_size_max));
    
    bsp_room_x = round(random_range(0, w-bsp_room_w));
    bsp_room_y = round(random_range(0, h-bsp_room_h));
    
    bsp_room_xmin[i] = bsp_array_xmin[i] + bsp_border + bsp_room_x;
    bsp_room_ymin[i] = bsp_array_ymin[i] + bsp_border + bsp_room_y;
    bsp_room_xmax[i] = bsp_array_xmin[i] + bsp_border + bsp_room_x + bsp_room_w;
    bsp_room_ymax[i] = bsp_array_ymin[i] + bsp_border + bsp_room_y + bsp_room_h;
    //wall
    ds_grid_set_region(bsp_grid, bsp_room_xmin[i]-1, bsp_room_ymin[i]-1, bsp_room_xmax[i], bsp_room_ymax[i], 2);
    //floor
    ds_grid_set_region(bsp_grid, bsp_room_xmin[i], bsp_room_ymin[i], bsp_room_xmax[i]-1, bsp_room_ymax[i]-1, 1);
end;
//******************************************************************************************************************
// Create default variables that help "linking" the rooms by placing corridors between them
for(i=2; i<=bsp_count; i+=1)
{    
    centr_x1 = bsp_room_xmin[i] + (bsp_room_xmax[i] - bsp_room_xmin[i] -1)div 2;
    centr_y1 = bsp_room_ymin[i] + (bsp_room_ymax[i] - bsp_room_ymin[i] -1)div 2;
    centr_x2 = bsp_room_xmin[i-1] + (bsp_room_xmax[i-1] - bsp_room_xmin[i-1] -1)div 2;
    centr_y2 = bsp_room_ymin[i-1] + (bsp_room_ymax[i-1] - bsp_room_ymin[i-1] -1)div 2;
    
    min_centr_x = min(centr_x1, centr_x2);
    max_centr_x = max(centr_x1, centr_x2);
    min_centr_y = min(centr_y1, centr_y2);
    max_centr_y = max(centr_y1, centr_y2);
           
    shift_x = max_centr_x - min_centr_x;
    shift_y = max_centr_y - min_centr_y;
      
    for(k=0; k<shift_x; k+=1)
    {
        min_centr_x += 1;
        
        if(ds_grid_get(bsp_grid, min_centr_x, min_centr_y) == 0) ds_grid_set(bsp_grid, min_centr_x, min_centr_y, 1);
        if(ds_grid_get(bsp_grid, min_centr_x, min_centr_y) == 2) ds_grid_set(bsp_grid, min_centr_x, min_centr_y, 1);        
        for(a=-1; a<2; a+=1)
        for(b=-1; b<2; b+=1)            
            if(ds_grid_get(bsp_grid, min_centr_x+a, min_centr_y+b) == 0) ds_grid_set(bsp_grid, min_centr_x+a, min_centr_y+b, 2);
    } 
    for(l=0; l<shift_y; l+=1)
    {
        min_centr_y += 1;
        
        if(ds_grid_get(bsp_grid, min_centr_x, min_centr_y) == 0) ds_grid_set(bsp_grid, min_centr_x, min_centr_y, 1);
        if(ds_grid_get(bsp_grid, min_centr_x, min_centr_y) == 2) ds_grid_set(bsp_grid, min_centr_x, min_centr_y, 1);        
        for(a=-1; a<2; a+=1)
        for(b=-1; b<2; b+=1)            
            if(ds_grid_get(bsp_grid, min_centr_x+a, min_centr_y+b) == 0) ds_grid_set(bsp_grid, min_centr_x+a, min_centr_y+b, 2);
    } 
};

//******************************************************************************************************************

// Draw all data to surface -- this is done to not totally rape performance
surf = surface_create(bsp_xsize*bsp_tilesize, bsp_ysize*bsp_tilesize);
surface_set_target(surf);
draw_clear(c_gray);
/*
// Draw wireframe
draw_set_color(c_dkgray);

i = -1;
repeat room_width/bsp_tilesize
begin
    i += 1;
    draw_line(i*bsp_tilesize, 0, i*bsp_tilesize, room_height);
end;

i = -1;
repeat room_height/bsp_tilesize
begin
    i += 1;
    draw_line(0, i*bsp_tilesize, room_width, i*bsp_tilesize);
end;

// Draw original rooms 
draw_set_color(c_green);
i = 0;
repeat bsp_count
begin
    i += 1;
    draw_rectangle(bsp_array_xmin[i]*bsp_tilesize, bsp_array_ymin[i]*bsp_tilesize, bsp_array_xmax[i]*bsp_tilesize-1, bsp_array_ymax[i]*bsp_tilesize-1, 1);
end;
*/
// Draw rooms and corridors
xx = -1;
repeat bsp_xsize
begin
    xx += 1;
    yy = -1;
    repeat bsp_ysize
    begin
        yy += 1;
        
        if ds_grid_get(bsp_grid, xx, yy) = 1
        begin
            draw_set_color(c_black);
            draw_rectangle(xx*bsp_tilesize, yy*bsp_tilesize, (xx+1)*bsp_tilesize, (yy+1)*bsp_tilesize, 0);
        end;
        
        if ds_grid_get(bsp_grid, xx, yy) = 2
        begin
            draw_set_color(c_red);
            draw_rectangle(xx*bsp_tilesize, yy*bsp_tilesize, (xx+1)*bsp_tilesize, (yy+1)*bsp_tilesize, 0);
        end;
    end;
end;
/*
// Create default variables that help "linking" the rooms by placing corridors between them
a = 0;
repeat bsp_count
begin
    a += 1;
    
    bsp_link_xmin[a] = bsp_array_xmin[a];
    bsp_link_ymin[a] = bsp_array_ymin[a];
    bsp_link_xmax[a] = bsp_array_xmax[a];
    bsp_link_ymax[a] = bsp_array_ymax[a];
    
    bsp_link_room_xmin[a] = bsp_room_xmin[a];
    bsp_link_room_ymin[a] = bsp_room_ymin[a];
    bsp_link_room_xmax[a] = bsp_room_xmax[a];
    bsp_link_room_ymax[a] = bsp_room_ymax[a];
end;     

i = 0; // manages skipping
a = 0; // loops though leafs
repeat bsp_count
begin
    i += 1;
    a += 1;
    
    v1 = a; // room 1
    v2 = a-1; // room 2
    v3 = 2 // skipping limit
    
    if i = v3
    begin
        // The split is horizontal
        if bsp_link_ymin[v1] = bsp_link_ymin[v2]
        begin
            bsp_link_xmin[v1] = min(bsp_link_xmin[v1], bsp_link_xmin[v2]);
            bsp_link_ymin[v1] = min(bsp_link_ymin[v1], bsp_link_ymin[v2]);
            bsp_link_xmax[v1] = max(bsp_link_xmax[v1], bsp_link_xmax[v2]);
            bsp_link_ymax[v1] = max(bsp_link_ymax[v1], bsp_link_ymax[v2]);
            
            bsp_link_room_xmin[v1] = min(bsp_link_room_xmin[v1], bsp_link_room_xmin[v2]);
            bsp_link_room_ymin[v1] = min(bsp_link_room_ymin[v1], bsp_link_room_ymin[v2]);
            bsp_link_room_xmax[v1] = max(bsp_link_room_xmax[v1], bsp_link_room_xmax[v2]);
            bsp_link_room_ymax[v1] = max(bsp_link_room_ymax[v1], bsp_link_room_ymax[v2]);
             
            draw_set_color(c_white);
            draw_rectangle(bsp_link_xmin[v1]*bsp_tilesize+v3, bsp_link_ymin[v1]*bsp_tilesize+v3, bsp_link_xmax[v1]*bsp_tilesize-v3, bsp_link_ymax[v1]*bsp_tilesize-v3, 1);
        end;
        
        // The split is vertical
        if bsp_link_xmin[v1] = bsp_link_xmin[v2]
        begin
            bsp_link_xmin[v1] = min(bsp_link_xmin[v1], bsp_link_xmin[v2]);
            bsp_link_ymin[v1] = min(bsp_link_ymin[v1], bsp_link_ymin[v2]);
            bsp_link_xmax[v1] = max(bsp_link_xmax[v1], bsp_link_xmax[v2]);
            bsp_link_ymax[v1] = max(bsp_link_ymax[v1], bsp_link_ymax[v2]);
            
            bsp_link_room_xmin[v1] = min(bsp_link_room_xmin[v1], bsp_link_room_xmin[v2]);
            bsp_link_room_ymin[v1] = min(bsp_link_room_ymin[v1], bsp_link_room_ymin[v2]);
            bsp_link_room_xmax[v1] = max(bsp_link_room_xmax[v1], bsp_link_room_xmax[v2]);
            bsp_link_room_ymax[v1] = max(bsp_link_room_ymax[v1], bsp_link_room_ymax[v2]);
             
            draw_set_color(c_white);
            draw_rectangle(bsp_link_xmin[v1]*bsp_tilesize+v3, bsp_link_ymin[v1]*bsp_tilesize+v3, bsp_link_xmax[v1]*bsp_tilesize-v3, bsp_link_ymax[v1]*bsp_tilesize-v3, 1);
        end;

        // Reset "skipping" variable to be able to detect the next link
        i = 0;
    end;
end;
*/
// Draw numbers on rooms
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(Font);

i = 0;
repeat bsp_count
begin
    i += 1;
    
    draw_text(((bsp_room_xmin[i]+bsp_room_xmax[i])/2)*bsp_tilesize, ((bsp_room_ymin[i]+bsp_room_ymax[i])/2)*bsp_tilesize, i);
end;

surface_reset_target();

