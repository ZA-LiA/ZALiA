/// FileSelect_RandoStateITEM_update()


var _InputConfirm_pressed2 = InputConfirm_pressed || Input.pressedH;


// -------------------------------------------------------------------------------
if (InputBack_pressed 
||  (RandoITEM_cursor==RandoITEM_BACK && InputConfirm_pressed) )
{
    aud_play_sound(get_audio_theme_track(BACK_SOUND_THEME1));
    RandoState = RandoState_MAIN;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}





// -------------------------------------------------------------------------------
if (input_select_pressed 
||  Input.pressedV )
{
    var _i;
    var _DIR = sign_(input_select_pressed || input_down_pressed);
    for(_i=0; _i<RandoITEM_COUNT; _i++)
    {
        RandoITEM_cursor = (RandoITEM_cursor+_DIR+RandoITEM_COUNT) mod RandoITEM_COUNT;
        
        if(!dg_RandoITEM_Options[#RandoITEM_LOCS,2]) // Must be turned on to interact with the other options
        {
            if (RandoITEM_cursor==RandoITEM_PBAG 
            ||  RandoITEM_cursor==RandoITEM_KEYS 
            ||  RandoITEM_cursor==RandoITEM_DARKROOM 
            ||  RandoITEM_cursor==RandoITEM_OBSCURE_LOCS 
            ||  RandoITEM_cursor==RandoITEM_HINTS 
            ||  RandoITEM_cursor==RandoITEM_ZELDA_HINT )
            {
                continue;//_i
            }
        }
        /*
        if(!dg_RandoITEM_Options[#RandoITEM_HINTS,2] 
        &&  RandoITEM_cursor==RandoITEM_ZELDA_HINT )
        //&&  RandoITEM_cursor!=RandoITEM_ZELDA_HINT )
        {
            continue;//_i
        }
        */
        if (dg_RandoITEM_Options[#RandoITEM_cursor,2]>=0) // if option is available
        {
            break;//_i
        }
    }
    aud_play_sound(get_audio_theme_track(CURSOR_SOUND_THEME2));
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}







var _DIR = sign_(!input_left_pressed);



// -------------------------------------------------------------------------------
switch(RandoITEM_cursor)
{
    // ============================================================================
    // -------------------------------------------------------------------
    /*
    case RandoITEM_METHOD:{
    if (_InputConfirm_pressed2)
    {
        var _COUNT=2;
        var _val = dg_RandoITEM_Options[#RandoITEM_cursor,2];
            _val--;
            _val = (_val+_DIR+_COUNT) mod _COUNT;
            _val++;
        dg_RandoITEM_Options[#RandoITEM_cursor,2] = _val;
        aud_play_sound(get_audio_theme_track(dk_ChooseChar));
    }
    break;}
    */
    
    
    
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoITEM_OBSCURE_LOCS:{
    if (_InputConfirm_pressed2)
    {
        dg_RandoITEM_Options[#RandoITEM_OBSCURE_LOCS,2] = !dg_RandoITEM_Options[#RandoITEM_OBSCURE_LOCS,2]; // 2: state
        aud_play_sound(get_audio_theme_track(CONFIRM_SOUND_THEME1));
    }
    break;}
    
    
    
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoITEM_DARKROOM:{
    if (_InputConfirm_pressed2)
    {
        //var _COUNT1=g.Rando_DarkroomDiff_COUNT;
        //var _COUNT1=3;
        ItemLocations_DARKROOM_DIFFICULTY -= g.Rando_DarkroomDiff_MIN;
        ItemLocations_DARKROOM_DIFFICULTY += g.Rando_DarkroomDiff_COUNT;
        ItemLocations_DARKROOM_DIFFICULTY += _DIR;
        ItemLocations_DARKROOM_DIFFICULTY  = ItemLocations_DARKROOM_DIFFICULTY mod g.Rando_DarkroomDiff_COUNT;
        ItemLocations_DARKROOM_DIFFICULTY += g.Rando_DarkroomDiff_MIN;
        //ItemLocations_DARKROOM_DIFFICULTY = (ItemLocations_DARKROOM_DIFFICULTY+_COUNT1+_DIR) mod _COUNT1;
        
        dg_RandoITEM_Options[#RandoITEM_cursor,2] = ItemLocations_DARKROOM_DIFFICULTY;
        aud_play_sound(get_audio_theme_track(CONFIRM_SOUND_THEME1));
    }
    break;}
    
    
    
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoITEM_HINTS:{
    if (_InputConfirm_pressed2)
    {
        dg_RandoITEM_Options[#RandoITEM_HINTS,2] = !dg_RandoITEM_Options[#RandoITEM_HINTS,2]; // 2: state
        aud_play_sound(get_audio_theme_track(CONFIRM_SOUND_THEME1));
        
        if (dg_RandoITEM_Options[#RandoITEM_HINTS,2] 
        &&  dg_RandoITEM_Options[#RandoITEM_ZELDA_HINT,2]==ZELDA_HINT_OPTIONS.ALLKEY 
        &&  dg_RandoITEM_Options[#RandoITEM_KEYS,2] )
        {
            dg_RandoITEM_Options[#RandoITEM_ZELDA_HINT,2] =ZELDA_HINT_OPTIONS.FLUTE;
        }
        /*
        if (dg_RandoITEM_Options[#RandoITEM_HINTS,2] 
        &&  dg_RandoITEM_Options[#RandoITEM_ZELDA_HINT,2] 
        &&  dg_RandoITEM_Options[#RandoITEM_KEYS,2] )
        {
            dg_RandoITEM_Options[#RandoITEM_ZELDA_HINT,2] = ZELDA_HINT_OPTIONS.JUMP; // 2: JUMP town hint
        }
        */
    }
    break;}
    
    
    
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoITEM_ZELDA_HINT:{
    if (_InputConfirm_pressed2)
    {
        _val = dg_RandoITEM_Options[#RandoITEM_ZELDA_HINT,2];
        for(var _i=0; _i<ZELDA_HINT_OPTIONS.COUNT; _i++)
        {
            _val += ZELDA_HINT_OPTIONS.COUNT;
            _val += _DIR;
            _val  = _val mod ZELDA_HINT_OPTIONS.COUNT;
            if(!dg_RandoITEM_Options[#RandoITEM_KEYS,2] 
            ||  _val!=ZELDA_HINT_OPTIONS.ALLKEY )
            {
                break;//_i
            }
        }
        dg_RandoITEM_Options[#RandoITEM_ZELDA_HINT,2] = _val; // 2: state
        aud_play_sound(get_audio_theme_track(CONFIRM_SOUND_THEME1));
    }
    break;}
    
    
    
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoITEM_LOCS:{
    if (_InputConfirm_pressed2)
    {
        dg_RandoITEM_Options[#RandoITEM_cursor,2] = !dg_RandoITEM_Options[#RandoITEM_cursor,2]; // 2: state
        aud_play_sound(get_audio_theme_track(CONFIRM_SOUND_THEME1));
    }
    break;}
    
    
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoITEM_PBAG:{
    if (_InputConfirm_pressed2)
    {
        dg_RandoITEM_Options[#RandoITEM_cursor,2] = !dg_RandoITEM_Options[#RandoITEM_cursor,2]; // 2: state
        aud_play_sound(get_audio_theme_track(CONFIRM_SOUND_THEME1));
    }
    break;}
    
    
    
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoITEM_KEYS:{
    if (_InputConfirm_pressed2)
    {
        dg_RandoITEM_Options[#RandoITEM_cursor,2] = !dg_RandoITEM_Options[#RandoITEM_cursor,2]; // 2: state
        if (dg_RandoITEM_Options[#RandoITEM_cursor,2] 
        &&  dg_RandoITEM_Options[#RandoITEM_ZELDA_HINT,2]==ZELDA_HINT_OPTIONS.ALLKEY ) // ALLKEY location
        {
            dg_RandoITEM_Options[#RandoITEM_ZELDA_HINT,2] =ZELDA_HINT_OPTIONS.FLUTE;  // FLUTE location hint
            //dg_RandoITEM_Options[#RandoITEM_ZELDA_HINT,2] =ZELDA_HINT_OPTIONS.JUMP;  // JUMP location hint
        }
        aud_play_sound(get_audio_theme_track(CONFIRM_SOUND_THEME1));
    }
    break;}
    
    
    /*
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoITEM_DIFFICULTY:{
    if (start_pressed 
    ||  Input.pA )
    {
        
    }
    break;}
    */
    
    
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoITEM_BACK:{
    if (InputConfirm_pressed)
    {
        aud_play_sound(get_audio_theme_track(BACK_SOUND_THEME1));
        RandoState = RandoState_MAIN;
    }
    break;}
}




