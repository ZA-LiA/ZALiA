/// OptionsMenu_Other_update()


var _i;

var _InputConfirm_pressed  = a_button_pressed || start_button_pressed; // GP_Face1_pressed: xbox A
var _InputConfirm_pressed2 = _InputConfirm_pressed || Input.pressedH;

var _SOUND1 = CURSOR_SOUND1;
var _SOUND2 = CONFIRM_SOUND1;


// -------------------------------------------------------------------------------
if(!timer)
{
    if (Backout_requested 
    ||  (Other_cursor==Other_BACK && _InputConfirm_pressed) )
    {
        aud_play_sound(BACK_SOUND1);
        timer = DURATION0;
        menu_state = menu_state_MAIN;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}




// -------------------------------------------------------------------------------
if(!timer2)
{
    if (select_button_pressed 
    ||  Input.pressedV )
    {
        var _DIR = sign_(select_button_pressed || Input.Down_pressed);
        var          _COUNT0 = val(dm_options[?"Other"+STR_Count]);
        for(_i=0; _i<_COUNT0; _i++)
        {
            Other_cursor += _DIR;
            Other_cursor += _COUNT0;
            Other_cursor  = Other_cursor mod _COUNT0;
            if (OptionsMenu_option_is_avail(menu_state_OTHER,Other_cursor))
            {
                aud_play_sound(_SOUND1);
                break;//_i
            }
        }
        
        timer2 = DURATION2;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}








// -------------------------------------------------------------------------------
switch(Other_cursor)
{
    // -------------------------------------------------
    case Other_FLASHING:{
    //if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        var _DIR = -sign_(Input.Left_pressed);
        var _COUNT = ds_list_size(p.dl_BackgroundFlash_COLORS);
        p.BackgroundFlash_setting += _COUNT;
        p.BackgroundFlash_setting += _DIR;
        p.BackgroundFlash_setting  = p.BackgroundFlash_setting mod _COUNT;
        save_game_pref();
        aud_play_sound(CURSOR_SOUND1);
        timer = DURATION0;
    }
    break;}//case Other_FLASHING
    
    // -------------------------------------------------
    case Other_DIALOGUE_SPEED:{
    //if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        var _DIR = -sign_(Input.Left_pressed);
        if (g.mod_DLG_SPEED+_DIR>=0 
        &&  g.mod_DLG_SPEED+_DIR<=g.mod_DLG_SPEED_MAX )
        {
            g.mod_DLG_SPEED += _DIR;
            save_game_pref();
            aud_play_sound(CURSOR_SOUND1);
            timer = DURATION0;
        }
    }
    break;}//case Other_DIALOGUE_SPEED
    
    // -------------------------------------------------
    case Other_GAME_FONT:{
    //if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        global.game_font_idx += global.game_font_COUNT;
        global.game_font_idx += -sign_(Input.Left_pressed);
        global.game_font_idx  = global.game_font_idx mod global.game_font_COUNT;
        save_game_pref();
        aud_play_sound(CURSOR_SOUND1);
        timer = DURATION0;
    }
    break;}//case Other_GAME_FONT
    
    // -------------------------------------------------
    case Other_HIDDEN_OW_EXITS:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        g.HiddenExitIndicator_enabled = !g.HiddenExitIndicator_enabled;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case Other_HUD:{
    //if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        global.HUD_state += -sign_(Input.Left_pressed);
        global.HUD_state += global.HUD_state_COUNT;
        global.HUD_state  = global.HUD_state mod global.HUD_state_COUNT;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case Other_TORCH_LIGHTING:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        g.torch_lighting_method = !g.torch_lighting_method;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    /*
    // -------------------------------------------------
    case Other_RENDER_DELAY:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        global.RenderFrameDelay_state = !global.RenderFrameDelay_state;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    */
    
    // -------------------------------------------------
    case Other_SCREEN_SHAKE:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        g.ScreenShake_user_pref = !g.ScreenShake_user_pref;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case Other_BLACK_BGR:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        g.all_bg_black_only = !g.all_bg_black_only;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case Other_STAB_FRENZY:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        g.mod_StabFrenzy = !g.mod_StabFrenzy;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case Other_ANARKHYA_OW:{
    if (timer) break;
    
    if (_InputConfirm_pressed2 
    &&  g.room_type=="A" )
    {
        g.anarkhyaOverworld_enabled = !g.anarkhyaOverworld_enabled;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case Other_HALLOWEEN1:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        global.Halloween1_enabled = !global.Halloween1_enabled;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    /*
    // -------------------------------------------------
    case Other_SHOW_ACTIVE_SPELLS:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        g.mod_IndicateSpellActive = !g.mod_IndicateSpellActive;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    */
    
    
    /*
    // ---------------------------------------------------------
    case Other_BGR_COLOR_EDITOR:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        anim_frame      = 0;
        draw_rows_count = 0;
        MainOption      = 0;
        g.gui_state     = 0;
        with(PaletteEditor) PaletteEditor_initiate_bgr_edit_mode();
        
        aud_play_sound(get_audio_theme_track(dk_OpenGUI));
        //aud_play_sound(CONFIRM_SOUND1);
        timer = 0;
        sub_state = sub_state_IDLE_CLOSED;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    break;}//case Other_BGR_COLOR_EDITOR
    
    
    // ---------------------------------------------------------
    case Other_SCENE_COLORS_EDITOR:{
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
    break;}//case Other_SCENE_COLORS_EDITOR
    */
    
    // -------------------------------------------------
    case Other_DOUBLE_JUMP:{
    if (timer) break;
    
    if (_InputConfirm_pressed2 
    &&  f.items&ITM_FTHR )
    {
        g.DoubleJump_state = !g.DoubleJump_state;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case Other_GEE:{
    if (timer) break;
    
    if (_InputConfirm_pressed)
    {
        GraphicsEffectsEditor.state = GraphicsEffectsEditor.state_OPEN_INIT;
        GraphicsEffectsEditor.gui_state_at_sess_start = g.gui_state;
        g.gui_state = g.gui_state_GEE;
        
        aud_play_sound(_SOUND2);
        timer = DURATION1;
        menu_state = menu_state_MAIN;
        sub_state = sub_state_IDLE_CLOSED;
    }
    break;}
    
    // -------------------------------------------------
    case Other_BACK:{
    if (timer) break;
    
    if (_InputConfirm_pressed)
    {
        aud_play_sound(BACK_SOUND1);
        timer = DURATION1;
        menu_state = menu_state_MAIN;
    }
    break;}
}




