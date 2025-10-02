/// state_EXPLODE_step(inst id)


with(argument0)
{   // DCAE
    if(!timer)
    {
        if(!drop_item_obj) timer = g.XP_RISE_DURATION; // $20
        //if (xp) timer = g.XP_RISE_DURATION; // $20
        
        g.ScreenShake_timer      = 0;
        g.ScreenShake_strength_x = 0;
        g.ScreenShake_strength_y = 0;
        
        state = state_DROP; // Drop XP or item
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    
    
    
    // DCC2. Boss  ------------------------------------------------
    if (is_ancestor(object_index,Boss))
    {   // DCBD
        if (timer==g.BOSS_DEATH_FLASH_CUE) // g.BOSS_DEATH_FLASH_CUE==$68
        {
            var                     _DURATION = g.BOSS_DEATH_FLASH_CUE;
            p.Flash_Pal_timer     = _DURATION; // 074B. SpellFlash_DURATION1=$20. bit $80 mean flash bgr
            p.SpellFlash_PC_timer = _DURATION;
            //p.Flash_Bgr_timer     = _DURATION;
            p.Flash_Bgr_timer2    = _DURATION; // this will guarantee the red bgr(if flashing is turned off)
            aud_play_sound(get_audio_theme_track(STR_Boss+STR_Explode));
        }
        
        
        g.ScreenShake_timer      = 0;
        g.ScreenShake_strength_x = 0;
        g.ScreenShake_strength_y = 0;
        
        if (g.mod_ScreenShake 
        &&  timer<g.BOSS_DEATH_FLASH_CUE-$8  // g.BOSS_DEATH_FLASH_CUE==$68
        &&  timer&$1 
        &&  timer>$F )
        //&&  timer>$4 )
        {
            var _ADD = (timer&$F)==$1; // stronger jolt. Trying to match the start of each loop in the sound that plays
            g.ScreenShake_timer      = 1; // Set to 0 to turn off
            g.ScreenShake_strength_x = 2+_ADD;
            g.ScreenShake_strength_y = 2+_ADD;
        }
        
        
        if (timer>=g.BOSS_DEATH_FLASH_CUE) // $68
        {   update_EF11();  }
        
        
        // DD27, 9A46 & 9764. Boss explosions
        if (g.mod_BossExplosionsCenteredOnBoss) // Center explosions on boss
        {
            if(!(g.counter1&$1) 
            &&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
            {   // 9A4B: JSR DBCE
                var _XL = (x-$08) + (g.dl_RandomOG[|2+update_idx]&$0F) - 8; // range $0F
                var _YT = (y-$10) + (g.dl_RandomOG[|1+update_idx]&$1F) - 7; // range $20
                GOC1_create(_XL,_YT, facing_dir, BossExplosion,1, id);
            }
        }
        else // OG. explosions centered around upper left of boss
        {
            if(!(g.counter1&$1) 
            &&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
            {   // 9A4B: JSR DBCE
                var _XL = xl + (g.dl_RandomOG[|2+update_idx]&$0F) - 8; // range $0F
                var _YT = yt + (g.dl_RandomOG[|1+update_idx]&$1F) - 7; // range $20
                GOC1_create(_XL,_YT, facing_dir, BossExplosion,1, id);
            }
        }
        
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    
    
    
    
    // =====================================================================================
    // EEB2. NOT Boss  -----------------------------------------------------------
    // Need explosion_count & explosion_y before EF11
    // for Geldarm and posibly future others.
    explosion_count = max(hh>>4, 1);
    //explosion_count = hh>>4;
    explosion_y     =(drawY-sprite_get_yoffset(sprite)) + 8;
    
    var _C1             = timer >= $18;
    if (_C1) stun_timer = timer; // for pal flash in EF11
    update_EF11();
    stun_timer  = 0;
    can_draw_self = _C1;
    
    
         explosion_can_draw_self = true;
    //
    if (timer>=$08 
    &&  timer<=$17 ) // 23
    {    explosion_sprite = spr_Explosion1B;  } // B: Big
    else explosion_sprite = spr_Explosion1A;    // A: Small
    
         explosion_yscale = sign_(g.counter1&$4);
    //
}




