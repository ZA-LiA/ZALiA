/// Girubokku_update()


// 98BC: JSR D6C1
if (cs&CS_BD1) enemy_collide_pc_body();

// 98BF
if(!timer)
{   // 98C7
    if (counter&$20)
    {
        if (counter&$40) vspd = (-8)&$FF;
        else             vspd = ( 8)&$FF;
        updateY();
    }
    
    // 98DE
    counter = (counter+1)&$FF;
    
    if!(counter&$3F) facing_dir = dir_to_pc(id);
    
    hspd = (8*facing_dir) &$FF;
    updateX();
    
    update_EF11();
    
    
    // 98FB: JSR E617
    if(!GOB_shield_collision_1a()  // if pc sword did NOT collide w/ GOB body
    ||  f.items&ITM_SWRD )         // lvl2 sword can pierce
    {
        GOB_update_2();
        // 9901.  !(rand()&$1F): 1/32 chance?
        if!(rand()&$1F) timer = $3F; // eye open timer
    }
}
else
{   // 98C4: JMP DE40.  eye open
    GOB_update_2();
}




