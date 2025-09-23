/// FileSelect_RandoOTHER_SKILLS_update()


var _InputConfirm_pressed2 = InputConfirm_pressed || Input.pressedH;


// -------------------------------------------------------------------------------
if (InputBack_pressed 
||  (RandoOTHER_SKILLS_cursor==RandoOTHER_SKILLS_cursor_BACK && InputConfirm_pressed) )
{
    aud_play_sound(get_audio_theme_track(BACK_SOUND_THEME1));
    RandoOTHER_state = RandoOTHER_state_MAIN;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// -------------------------------------------------------------------------------
if (input_select_pressed 
||  Input.pressedV )
{
    var _DIR = sign_(input_select_pressed || input_down_pressed);
    RandoOTHER_SKILLS_cursor += _DIR;
    RandoOTHER_SKILLS_cursor += RandoOTHER_SKILLS_cursor_COUNT;
    RandoOTHER_SKILLS_cursor  = RandoOTHER_SKILLS_cursor mod RandoOTHER_SKILLS_cursor_COUNT;
    aud_play_sound(get_audio_theme_track(CURSOR_SOUND_THEME2));
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}








// -------------------------------------------------------------------------------
switch(RandoOTHER_SKILLS_cursor)
{
    // ============================================================================
    // -------------------------------------------------------------------
    default:{
    if (Input.pressedH 
    ||  input_start_pressed )
    {
        dg_RandoOTHER_SKILLS[#RandoOTHER_SKILLS_cursor,2] = !dg_RandoOTHER_SKILLS[#RandoOTHER_SKILLS_cursor,2];
        aud_play_sound(Audio.SND_TYPE_CHR2);
    }
    break;}
    
    
    
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoOTHER_SKILLS_cursor_BACK:{
    if (InputConfirm_pressed)
    {
        aud_play_sound(get_audio_theme_track(BACK_SOUND_THEME1));
        RandoOTHER_state = RandoOTHER_state_MAIN;
    }
    break;}
}//switch(RandoOTHER_SKILLS_cursor)




