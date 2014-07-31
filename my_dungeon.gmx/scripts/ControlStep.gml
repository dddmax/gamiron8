// Re-execute BSP
if keyboard_check_pressed(vk_enter)
begin
    ds_grid_destroy(bsp_grid);
    surface_free(surf);
    ExecuteBSP();
end;

// Allow the user to force-calculate the entire BSP 100 times to check for bugs
if loop < 100
begin
    loop += 1;
    
    ds_grid_destroy(bsp_grid);
    surface_free(surf);
    ExecuteBSP();
end;
if keyboard_check(vk_space) then loop = 0;
