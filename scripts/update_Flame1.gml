/// update_Flame1()

// Carock, Mago, FieryMoa, Wosu, Kakusu, DropSpawner


// 98B9
if (timer>=FADE_CUE2) // mod. Reduce sound duration
{   aud_play_fire(true);  }
//aud_play_fire(true); // OG. No condition


if (timer<FADE_CUE2) brightness=0;


// 98BC
if (timer)
{   // 98C9
    if (hspd 
    && !(timer&$7) )
    {
        if (hspd<$80) hspd = (hspd-1)&$FF;
        else          hspd = (hspd+1)&$FF;
    }
    
    // 98D9
    if (collisionProjCS(0,hh_))
    {
        set_xy(id, x,(y>>3)<<3);
        //Proj_solid_clip_adj_2a(vspd && vspd<$80); // this will make the flame clip all the way up
        vspd = -vspd_adj &$FF; // counteract the upcoming adj
    }
    
    if (float_tmr) // float_tmr is for Carock2's high flame attack
    {
        float_tmr--;
        vspd = -vspd_adj &$FF; // counteract the upcoming adj
    }
    
    // 9940
    Projectile_update_3a(despawn_offscreen_hor); // Projectile_update_1a(!isVal(pID, 6, 8));
}
else
{   // 995A
    state = 0;
}




