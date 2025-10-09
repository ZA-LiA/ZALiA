/// DeathScreen_Draw()


// -------------------------------------------------------------------------------
// Before Flashing ---------------------------------------------------
if (counter<DEATH_FLASH_START_CUE)
//&&  global.BackgroundColor_at_death>=0 )
{
    // NOT setting the background_colour here looks better.
    // Setting it here gives an abrupt-like, but brief(maybe less than 1 frame?), flash of the background color of the room that the death occured.
    //set_background_color(global.BackgroundColor_at_death);
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
/*
if (counter<DEATH_FLASH_START_CUE)
{
    //set_background_color(p.dl_COLOR[|p.background_color_index]);
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
*/


// -------------------------------------------------------------------------------
// During Flashing ---------------------------------------------------
if (deathFlashTimer>0)
{
    if (p.BackgroundFlash_setting==1) set_background_color(p.dg_color_seq[#0,g.counter1&$3]);
    else                              set_background_color(p.C_RED3); // 20231107. I think this should only be red for death and matches the gameover bgr color
    
    
    with(global.pc)
    {
        var _PAD = $09;
        var _X = clamp(g.last_dist_from_view_x, viewXL()+_PAD,viewXR()-_PAD);
        var _Y = clamp(g.last_dist_from_view_y, viewYT()+_PAD,viewYB()-_PAD);
        if (pc_is_cucco())
        {
            draw_sprite_(spr_chicken_1a_damage_1a,0, _X,_Y, -1, g.last_pc_xscale,1, p.C_BLK1);
        }
        else if (pc_is_fairy())
        {
            draw_sprite_(fairy_sprite,0,   _X,_Y, -1, g.last_pc_xscale,1, p.C_BLK1);
        }
        else
        {
            draw_pc_skin(_X,_Y, g.last_pc_xscale,1, behavior_DAMAGE, false, 1,1, -1, p.C_BLK1);
        }
    }
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// -------------------------------------------------------------------------------
// After Flashing ----------------------------------------------------
if (deathScreenEndTimer==DEATH_SCREEN_END_DUR) // DEATH_SCREEN_END_DUR=3
{
    set_background_color(p.C_BLK1);
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




