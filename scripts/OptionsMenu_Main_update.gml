/// OptionsMenu_Main_update()


if(!timer)
{
    var _CLOSE = Backout_requested;
    if(!_CLOSE 
    &&  MainOption==MainOption_CLOSE )
    {
        _CLOSE  = start_button_pressed;
        _CLOSE |= a_button_pressed;
        _CLOSE |= keyboard_check_pressed(vk_enter);
        _CLOSE |= keyboard_check_pressed(vk_space);
    }
    
    if (_CLOSE)
    {
        aud_play_sound(BACK_SOUND1);
        timer = DURATION1;
        sub_state = sub_state_CLOSING1; // Start close menu
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}




var _InputConfirm_pressed   = a_button_pressed;
    _InputConfirm_pressed  |= start_button_pressed;
//
var _InputConfirm_pressed2  = _InputConfirm_pressed;
    _InputConfirm_pressed2 |= keyboard_check_pressed(vk_space);
    _InputConfirm_pressed2 |= keyboard_check_pressed(vk_enter);
//




switch(MainOption)
{   // ---------------------------------------------------------
    case MainOption_MUSIC_SET:{
    if (timer) break;
    
    if (_InputConfirm_pressed2 
    &&  Audio.audio_set==dk_RandomCustom 
    &&  ds_list_find_index(Audio.dl_AUDIO_SETS,dk_RandomCustom)!=-1 )
    {
        AudioCustom_cursor  = 0;
        AudioCustom_cursor2 = 0;
        
        audio_group_stop_all(audiogroup_mus);
        Audio.can_play_mus_rm_body = false;
        can_play_boss_music_at_open_RandomCustom = Audio.can_play_boss_music;
        Audio.can_play_boss_music  = false;
        
        aud_play_sound(CONFIRM_SOUND1);
        timer = DURATION1;
        menu_state = menu_state_AUDIO_CUSTOM;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    break;}//case MainOption_MUSIC_SET
    
    // ---------------------------------------------------------
    case MainOption_INPUT_CONFIG:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        InputConfigOption = InputConfigOption_RIGHT;
        aud_play_sound(CONFIRM_SOUND1);
        timer = DURATION1;
        menu_state = menu_state_INPUT_CONFIG;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    break;}//case MainOption_INPUT_CONFIG
    
    // ---------------------------------------------------------
    case MainOption_DEV_TOOLS:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        DevTools_cursor = DevTools.DEV_TOOLS_STATE;
        aud_play_sound(CONFIRM_SOUND1);
        timer = DURATION1;
        menu_state = menu_state_DEV_TOOLS;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    break;}//case MainOption_DEV_TOOLS
    
    // ---------------------------------------------------------
    case MainOption_RANDO:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        var _COUNT0 = val(dm_options[?"Rando"+STR_Count]);
        for(Rando_cursor=0; Rando_cursor<_COUNT0; Rando_cursor++)
        {
            if (OptionsMenu_option_is_avail(menu_state_RANDO,Rando_cursor))
            {
                break;//RandoOptions_cursor
            }
        }
        Rando_cursor = 0;
        Rando_state = Rando_state_MAIN;
        aud_play_sound(CONFIRM_SOUND1);
        timer = DURATION1;
        menu_state = menu_state_RANDO;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    break;}//case MainOption_RANDO_OPTIONS
    
    // ---------------------------------------------------------
    case MainOption_OTHER:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        Other_cursor = 0;
        Other_state = Other_state_MAIN;
        aud_play_sound(CONFIRM_SOUND1);
        timer = DURATION1;
        menu_state = menu_state_OTHER;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    break;}//case MainOption_OTHER
    
    /*
    // ---------------------------------------------------------
    case MainOption_PAL_EDITOR:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        anim_frame      = 0;
        draw_rows_count = 0;
        MainOption      = 0;
        g.gui_state     = 0;
        //if(!is_undefined(GUI3_pal_backup)) change_pal(strReplaceAt(p.pal_rm_curr, get_pal_pos(global.PI_GUI3), string_length(GUI3_pal_backup), GUI3_pal_backup));
        //GUI3_pal_backup = undefined;
        with(PaletteEditor) PaletteEditor_initiate_pal_edit_mode();
        
        aud_play_sound(get_audio_theme_track(dk_OpenGUI));
        //aud_play_sound(CONFIRM_SOUND1);
        timer = 0;
        sub_state = sub_state_IDLE_CLOSED;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    break;}//case MainOption_RANDO_OPTIONS
    */
    
    // ---------------------------------------------------------
    case MainOption_FORCE_GAMEOVER:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        //if(!is_undefined(GUI3_pal_backup)) change_pal(strReplaceAt(p.pal_rm_curr, get_pal_pos(global.PI_GUI3), string_length(GUI3_pal_backup), GUI3_pal_backup));
        //GUI3_pal_backup = undefined;
        with(QuitAppMenu) QuitAppMenu_trigger_open();
        
        aud_play_sound(get_audio_theme_track(dk_OpenGUI));
        //aud_play_sound(CONFIRM_SOUND1);
        timer = 0;
        sub_state = sub_state_IDLE_CLOSED;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    break;}//case MainOption_RANDO_OPTIONS
}//switch(MainOption)








// ----------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------
var _VERTICAL   = bit_dir(gui_tmr_cursor_v()); // 0,1,-1
var _HORIZONTAL = bit_dir(gui_tmr_cursor_h()); // 0,1,-1


if(!timer2)
{
    if (abs(_VERTICAL))
    {
        for(var _i=0; _i<MainOption_COUNT; _i++)
        {
            MainOption += MainOption_COUNT;
            MainOption += _VERTICAL;
            MainOption  = MainOption mod MainOption_COUNT;
            if (MainOption==MainOption_CLOSE 
            ||  OptionsMenu_option_is_avail(menu_state_MAIN,MainOption) )
            {
                break;//_i
            }
        }
        
        aud_play_sound(CURSOR_SOUND1);
        timer2 = DURATION2;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}




if (abs(_HORIZONTAL))
{
    switch(MainOption)
    {
        // ---------------------------------------------------------
        // ---------------------------------------------------
        case MainOption_SND_VOL:{
        //if (timer) break;
        
        if (Audio.snd_vol+_HORIZONTAL>=0 
        &&  Audio.snd_vol+_HORIZONTAL<=10 )
        {
            Audio.snd_vol += _HORIZONTAL;
            save_game_pref();
            audio_group_set_gain(audiogroup_snd, Audio.snd_vol/10, 0);
            aud_play_sound(CURSOR_SOUND1);
            timer = DURATION0;
        }
        break;}//case MainOption_SND_VOL
        
        // ---------------------------------------------------------
        // ---------------------------------------------------
        case MainOption_MUS_VOL:{
        //if (timer) break;
        
        if (Audio.mus_vol+_HORIZONTAL>=0 
        &&  Audio.mus_vol+_HORIZONTAL<=10 )
        {
            Audio.mus_vol += _HORIZONTAL;
            save_game_pref();
            audio_group_set_gain(audiogroup_mus, Audio.mus_vol/10, 0);
            aud_play_sound(CURSOR_SOUND1);
            timer = DURATION0;
        }
        break;}//case MainOption_MUS_VOL
        
        // ---------------------------------------------------------
        // ---------------------------------------------------
        case MainOption_MUSIC_SET:{
        //if (timer) break;
        
        with(Audio)
        {
            var _SIZE = ds_list_size(dl_AUDIO_SETS);
            if (_SIZE>1)
            {
                var _dl_AUDIO_SETS_idx  = max(0, ds_list_find_index(dl_AUDIO_SETS,audio_set));
                var _dl_AUDIO_SETS_idx_PREV = _dl_AUDIO_SETS_idx;
                    _dl_AUDIO_SETS_idx += _SIZE;
                    _dl_AUDIO_SETS_idx += _HORIZONTAL;
                    _dl_AUDIO_SETS_idx  = _dl_AUDIO_SETS_idx mod _SIZE;
                audio_set = string(dl_AUDIO_SETS[|_dl_AUDIO_SETS_idx]);
                //sdm("audio_set: "+audio_set);
                save_game_pref();
                aud_play_sound(other.CURSOR_SOUND1);
                other.timer = other.DURATION0;
                
                
                // The following replaces the music right away without having to change rooms.
                if (_dl_AUDIO_SETS_idx!=_dl_AUDIO_SETS_idx_PREV  // if the audio set changed
                &&  audio_is_playing(mus_rm_inst) ) // if there's anything to replace. Does a music inst NEED to be playing to play a diff track??
                {
                    var _THEME = dm_music_inst[?string(mus_rm_inst)+STR_Theme]; // Theme of mus_rm_inst (might not be mus_rm_body)
                    if(!is_undefined(_THEME))
                    {
                        //sdm("_THEME: "+_THEME);
                        var _BODY = get_audio_theme_track(_THEME); // This is the body of the replacement track which could be something temporary like a boss track.
                        //sdm("_THEME: "+_THEME+", _BODY: "+string(_BODY));
                        //if (_BODY) sdm("_THEME: "+_THEME+", _BODY: "+sound_get_name(_BODY)+", audio_is_playing(_BODY): "+string(audio_is_playing(_BODY)));
                        if (_BODY)
                        {
                            var _mus_rm_inst_IS_INTRO = val(dm[?sound_get_name(mus_rm_inst)+"_Is"+STR_Intro]);
                            var _INTRO = val(dm[?audio_get_name(_BODY)+STR_Intro]);
                            if((!_mus_rm_inst_IS_INTRO && !audio_is_playing(_BODY)) 
                            ||  (_mus_rm_inst_IS_INTRO && _INTRO && !audio_is_playing(_INTRO)) )
                            {
                                if (can_play_mus_rm_body 
                                ||  sound_get_name(_BODY)!=sound_get_name(mus_rm_body) ) // '!can_play_mus_rm_body' would mean only mus_rm_body isn't allowed to play
                                {
                                    var _new_track = _BODY; // Will replace mus_rm_inst if it's a different track.
                                    var _mus_rm_inst_percentage_played = 0; // Tracks what percentage of mus_rm_inst has played so its replacement starts the same percentage through.
                                    if (_mus_rm_inst_IS_INTRO)
                                    {
                                        if (_INTRO  // if the replacement has an intro
                                        && !audio_is_playing(_INTRO) )
                                        {
                                            _new_track = _INTRO;
                                            _mus_rm_inst_percentage_played = audio_sound_get_track_position(mus_rm_inst) / audio_sound_length(mus_rm_inst);
                                        }
                                    }
                                    else
                                    {
                                        _mus_rm_inst_percentage_played = audio_sound_get_track_position(mus_rm_inst) / audio_sound_length(mus_rm_inst);
                                    }
                                    
                                    
                                    var _LOOP = !_mus_rm_inst_IS_INTRO && _new_track!=_INTRO && val(dm_music_inst[?string(mus_rm_inst)+STR_Loop]);
                                    var _INST = aud_play_sound(_new_track, PRIORITY_TOP, _LOOP, -1, _THEME);
                                    if (_INST 
                                    &&  _mus_rm_inst_percentage_played>0 )
                                    {   // Have new track start the same percentage through what it replaced.
                                        // I think this is as close you can get to syncing since the replacement track may be a different tempo.
                                        audio_sound_set_track_position(_INST, audio_sound_length(_INST)*_mus_rm_inst_percentage_played);
                                    }
                                }
                            }
                        }
                    }
                }
                
                
                mus_rm_body = get_audio_theme_track(rm_music_theme);
                mus_rm_intr = val(dm[?audio_get_name(mus_rm_body)+STR_Intro]);
                //mus_rm_intr = get_audio_theme_track_intro(mus_rm_body);
            }
        }//with(Audio)
        break;}//case MainOption_MUSIC_SET
        
        // ---------------------------------------------------------
        // ---------------------------------------------------
        case MainOption_PC_SPRITES:{
        //if (timer) break;
        
        with(global.pc)
        {
            var _Skin_COUNT = val(dm_skins[?STR_Set+STR_Count],1);
            if (_Skin_COUNT>1)
            {
                var _Skin_IDX = val(dm_skins[?STR_Current+STR_Idx]);
                if (_Skin_IDX>=0 
                &&  _Skin_IDX<_Skin_COUNT )
                {
                    _Skin_IDX += _Skin_COUNT;
                    _Skin_IDX += _HORIZONTAL;
                    _Skin_IDX  = _Skin_IDX mod _Skin_COUNT;
                    dm_skins[?STR_Current+STR_Idx] = _Skin_IDX;
                    
                    var _DK    = val(dm_skins[?hex_str(_Skin_IDX)+STR_Datakey], STR_undefined);
                    Skin_image = val(dm_skins[?_DK+STR_Sprite], PCSkin_DEFAULT_SPRITE);
                    
                    var _palette = get_pc_skin_palette(_Skin_IDX);
                    change_pal(strReplaceAt(p.pal_rm_curr, get_pal_pos(global.PI_PC1), string_length(_palette), _palette));
                    
                    save_game_pref();
                    aud_play_sound(other.CURSOR_SOUND1);
                    other.timer = other.DURATION0;
                }
            }
        }
        break;}//case MainOption_PC_SPRITES
        
        // ---------------------------------------------------------
        // ---------------------------------------------------
        case MainOption_FULLSCREEN:{ // **fullscreen toggle is updated in `update_game_window_1a()`
        //aud_play_sound(get_audio_theme_track(CURSOR_SOUND_THEME1));
        //save_game_pref();
        break;}//case MainOption_FULLSCREEN
        
        // ---------------------------------------------------------
        // ---------------------------------------------------
        case MainOption_APP_SCALE:{ // **app scale is updated in `update_game_window_1a()`
        //aud_play_sound(get_audio_theme_track(CURSOR_SOUND_THEME1));
        //save_game_pref();
        break;}//case MainOption_APP_SCALE
        /*
        // ---------------------------------------------------------
        // ---------------------------------------------------
        case MainOption_FLASHING:{
        //if (timer) break;
        
        var _SIZE = ds_list_size(p.dl_BackgroundFlash_COLORS);
        p.BackgroundFlash_setting += _SIZE;
        p.BackgroundFlash_setting += _HORIZONTAL;
        p.BackgroundFlash_setting  = p.BackgroundFlash_setting mod _SIZE;
        save_game_pref();
        aud_play_sound(CURSOR_SOUND1);
        timer = DURATION0;
        break;}//case MainOption_FLASHING
        */
        /*
        // ---------------------------------------------------------
        // ---------------------------------------------------
        case MainOption_DIALOGUE_SPEED:{
        //if (timer) break;
        
        if (g.mod_DLG_SPEED+_HORIZONTAL>=0 
        &&  g.mod_DLG_SPEED+_HORIZONTAL<=g.mod_DLG_SPEED_MAX )
        {
            g.mod_DLG_SPEED += _HORIZONTAL;
            save_game_pref();
            aud_play_sound(CURSOR_SOUND1);
            timer = DURATION0;
        }
        break;}//case MainOption_DIALOGUE_SPEED
        */
    }//switch(MainOption)
}




