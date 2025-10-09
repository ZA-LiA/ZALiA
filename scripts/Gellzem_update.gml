/// Gellzem_update()


var _i;


update_EF11();



// ------------------------------------------------------------------
if (stun_timer)
{
    // During eye removal sequence, a strike sound will occur on each eye removal
    if (inRange(stun_timer, 1,DELAY_EXPL) 
    && !(stun_timer&$7) ) 
    {   aud_play_sound(get_audio_theme_track(dk_StrikeEnemy));  } // play snd on each frame an eye is removed
    
    
    if (stun_timer==1) 
    {
        damage_gob(id, max(hp,0), false);
    }
    
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


var  _alive_cnt = EYE_CNT;
for(_i=0; _i<EYE_CNT; _i++){
     _alive_cnt -= (dl_tmr_revive[|_i]>0);
}

if(!_alive_cnt)
{
    // Delay death to play extra pre death animation
    stun_timer  = DELAY_EXPL; // dur of eye removal sequence
    stun_timer += $21;        // delay  eye removal sequence
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// ------------------------------------------------------------------
// update_EF11();


eye_hit = false;

for(_i=0; _i<EYE_CNT; _i++)
{
                        dl_xscale[|_i]  = sign_(~_i & 1);
    // if (g.timer0 & $40) dl_xscale[|_i]  = -dl_xscale[|_i];
    dl_xx[|_i]  = x - (EYE_W>>1);
    dl_xx[|_i] += (dl_xscale[|_i] * (xScale==dl_xscale[|_i]));
    dl_yy[|_i]  = EYE_BASE_Y + (EYE_SPACING*_i);
    
    if (dl_xscale[|_i]) dl_hb_x[|_i] =(dl_xx[|_i]-EYE_HB_XOFF + (EYE_W-EYE_HB_W));
    else                dl_hb_x[|_i] = dl_xx[|_i]+EYE_HB_XOFF;
                        dl_hb_y[|_i] = dl_yy[|_i]+EYE_HB_YOFF;
    
    
    if(!dl_tmr_revive[|_i] 
    &&  collide_pc_sword(dl_hb_x[|_i],dl_hb_y[|_i], EYE_HB_W,EYE_HB_H) )
    {
        eye_hit = true;
        
        if (revive_type==2) dl_tmr_revive[|_i] = REVIVE_DELAY_0;
        else                dl_tmr_revive[|_i] = REVIVE_DELAY_1;
        
        
        if (global.pc.behavior==global.pc.behavior_STAB_DOWN) PC_set_bounce();
        
        
        aud_play_sound(get_audio_theme_track(dk_StrikeEnemy));
    }
    
    
    if (dl_tmr_revive[|_i]) 
    {   dl_tmr_revive[|_i]--;  }
    
    if (revive_type==2    // Must hit all eyes with 1 sword strike
    && !global.pc.attack_phase )   // 
    {   dl_tmr_revive[|_i] = 0;  }
}



// ------------------------------------------------------------------
// update_body_hb_1a();
BodyHB_can_draw = true;

if (collide_pc_sword(BodyHB_xl,BodyHB_yt, BodyHB_w,BodyHB_h)) 
{
    if (global.pc.behavior==global.pc.behavior_STAB_DOWN) PC_set_bounce();
    else                              pushback_pc_and_go(id, $8,0); // Won't push GO
    //else                              pushback_pc_and_go(id, -1, 0); // Won't push GO
    
    
    if(!eye_hit)
    {
        if(!audio_is_playing(SND_HIT_EYE) 
        && !audio_is_playing(SND_HIT_BDY) )
        {   aud_play_sound(  SND_HIT_BDY);  }
    }
}
else
// else if (collide_pc_body(bodyX,bodyY, bodyW,bodyH))
{
    GOB_body_collide_pc_body_1a();
    if (cs&CS_BD1) enemy_collide_pc_body();
}




