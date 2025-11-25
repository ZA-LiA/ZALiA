/// FileSelect_RandoOTHER_REQUIRE_update()


var _InputConfirm_pressed2 = InputConfirm_pressed || Input.pressedH;


// -------------------------------------------------------------------------------
if (InputBack_pressed 
||  (RandoOTHER_REQUIRE_cursor==RandoOTHER_REQUIRE_cursor_BACK && InputConfirm_pressed) )
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
    RandoOTHER_REQUIRE_cursor += _DIR;
    RandoOTHER_REQUIRE_cursor += RandoOTHER_REQUIRE_cursor_COUNT;
    RandoOTHER_REQUIRE_cursor  = RandoOTHER_REQUIRE_cursor mod RandoOTHER_REQUIRE_cursor_COUNT;
    aud_play_sound(get_audio_theme_track(CURSOR_SOUND_THEME2));
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}





var _val;


switch(RandoOTHER_REQUIRE_cursor)
{
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoOTHER_REQUIRE_cursor_CRYSTALS:{
    if (input_start_pressed 
    ||  Input.pressedH )
    {
        var _DIR = sign_(input_start_pressed || input_right_pressed);
        _val  = dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_CRYSTALS,2];
        _val += _DIR;
             if (_val<global.RandoDungeonRequirement_MIN) _val = global.RandoDungeonRequirement_MAX;
        else if (_val>global.RandoDungeonRequirement_MAX) _val = global.RandoDungeonRequirement_MIN;
        /*
        _val--;
        _val  = (_val+_DIR+global.RandoDungeonRequirement_MAX) mod global.RandoDungeonRequirement_MAX;
        _val++;
        _val  = clamp(_val, global.RandoDungeonRequirement_MIN,global.RandoDungeonRequirement_MAX);
        */
        dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_CRYSTALS,2] = _val;
        aud_play_sound(Audio.SND_TYPE_CHR2);
    }
    break;}
    
    
    
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoOTHER_REQUIRE_cursor_KAKUSU:{
    if (input_start_pressed 
    ||  Input.pressedH )
    {
        var _KAKUSU_MAX = val(g.dm_spawn[?STR_Kakusu+STR_Count]);
        
        var _DIR = sign_(input_a_pressed || input_right_pressed);
        _val  = dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_KAKUSU,2];
        _val--;
        _val  = (_val+_DIR+_KAKUSU_MAX) mod _KAKUSU_MAX;
        _val++;
        _val  = clamp(_val, 1,_KAKUSU_MAX);
        dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_KAKUSU,2] = _val;
        aud_play_sound(Audio.SND_TYPE_CHR2);
    }
    break;}
    
    
    
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoOTHER_REQUIRE_cursor_BACK:{
    if (InputConfirm_pressed)
    {
        aud_play_sound(get_audio_theme_track(BACK_SOUND_THEME1));
        RandoOTHER_state = RandoOTHER_state_MAIN;
    }
    break;}
}




