/// Kakusu006_update()


if (sub_state_timer)
{   sub_state_timer--;  }


switch(sub_state)
{
    // ---------------------------------------------------------------------
    // --------------------------------------------------------------
    case SUB_STATE_CHLG_1A:{
    if ( sub_state_timer) break;
    
    
    update_body_hb_1a();
    GOB_body_collide_pc_sword();
    if!(cs&CS_SW1) break;
    
    hp = g.dl_HP[|HP_IDX];
    
    state = state_NORMAL;
    sub_state = SUB_STATE_CHLG_1B;
    break;}
    
    
    
    
    // ---------------------------------------------------------------------
    // --------------------------------------------------------------
    case SUB_STATE_CHLG_1B:{
    if ( sub_state_timer) break;
    
    
    facing_dir = -1;
    hspd = (hspd_jump*facing_dir) &$FF;
    vspd = VSPD_REVEAL; // Jump!
    ogr  = OGR_JUMP;
    
    aud_play_sound(get_audio_theme_track(dk_StrikeEnemy));
    aud_play_sound(SND_REVEAL);
    sub_state = SUB_STATE_ACTV;
    break;}
    
    
    
    
    // ---------------------------------------------------------------------
    // --------------------------------------------------------------
    case SUB_STATE_ACTV:{
    if ( sub_state_timer) break;
    Kakusu_update();
    break;}
}




