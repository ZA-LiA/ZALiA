/// GameObjectB_step()



if(!state) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



// ---------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------
GO_update_cam_vars();


switch(state)
{
    // ============================================================
    // -----------------------------------------------------
    case state_NORMAL:{
    //if (state && disintegrate_counter<$80)
    if (!is_undefined( scr_update))
    {   script_execute(scr_update);  }
    break;}
    
    
    
    // ============================================================
    // -----------------------------------------------------
    case state_EXPLODE:{ // D57D: disintegrating
    if (disintegrate_counter<$80) break; // ####################################
    
    
    // D55A
    can_draw_self = true;
    
    disintegrate_counter = (disintegrate_counter+1) &$FF;
    
    scr_udp = undefined;
    Projectile_udd();
    
    if (isProjSprAdjFrame()) xScale = 1;
    else                     xScale = facing_dir;
    yScale = 1;
    
    if (disintegrate_counter&8) sprite = spr_Projectile_Disintegrate2;
    else                        sprite = spr_Projectile_Disintegrate1;
    
    
    if(!disintegrate_counter) state = 0;
    break;}
} // switch(state)




// -----------------------------------------------------------
if (g.mod_destroy_go_on_death 
&& !state )
{
    GO_destroy_1a();
}




