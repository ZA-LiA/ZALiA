/// Kakusu011_update()


if (sub_state_timer)
{   sub_state_timer--;  }


switch(sub_state)
{
    // ---------------------------------------------------------------------
    // --------------------------------------------------------------
    case SUB_STATE_SEQU:{
    if ( sub_state_timer) break;
    break;}
    
    
    
    
    // ---------------------------------------------------------------------
    // --------------------------------------------------------------
    case SUB_STATE_CMPL1:{
    if ( sub_state_timer) break;
    
    facing_dir = dir_to_pc_(id);
    hspd = (hspd_jump*facing_dir) &$FF;
    vspd = VSPD_REVEAL; // Jump!
    ogr  = OGR_JUMP;
    
    aud_play_sound(get_audio_theme_track(dk_StrikeEnemy));
    sub_state = SUB_STATE_ACTV;
    break;}
    
    
    
    
    // ---------------------------------------------------------------------
    // --------------------------------------------------------------
    case SUB_STATE_ACTV:{
    if ( sub_state_timer) break;
    Kakusu_update();
    break;}
}




