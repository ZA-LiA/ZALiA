/// GraphicsEffectsEditor_update_Main()


if (timer 
||  GraphicsEffectsEditor_update_backout(Main_cursor==Main_BACK) ) // Handles the check for this sub-menu's BACK option
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




if (pressed_move_cursor_v)
{
    var _DIR = sign_(!pressed_up);
    var _COUNT = ds_grid_width(dg_Main);
    repeat(_COUNT)
    {
        Main_cursor += _COUNT;
        Main_cursor += _DIR;
        Main_cursor  = Main_cursor mod _COUNT;
        
        if (Main_cursor==Main_ENABLE 
        ||  Main_cursor==Main_DEFAULT 
        ||  (global.RetroShaders_enabled && dg_Main[#Main_cursor,4]) ) // 4: option available
        {
            aud_play_sound(SOUND_CURSOR1, -1,-1, SOUND_VOLUME);
            break;//repeat(_COUNT)
        }
    }
    
    timer = DURATION0;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}








switch(Main_cursor)
{   // ----------------------------------------------------------------------
    case Main_ENABLE:{
    if (pressed_confirm1)
    {
        dg_Main[#Main_ENABLE,$5] =       !dg_Main[#Main_ENABLE,$5];
            global.RetroShaders_enabled = dg_Main[#Main_ENABLE,$5];
        if (global.RetroShaders_enabled)  dg_Main[#Main_ENABLE,$A] = "ON";
        else                              dg_Main[#Main_ENABLE,$A] = "OFF";
        
        update_shaders_surf_resize();
        global.application_surface_draw_enable_state = !global.RetroShaders_enabled;
        //global.application_surface_draw_enable_state = false; // for testing cam zoom
        application_surface_draw_enable(global.application_surface_draw_enable_state);
        
        save_game_pref();
        aud_play_sound(SOUND_CONFIRM1, -1,-1, SOUND_VOLUME);
        timer = DURATION0;
    }
    break;}
    
    
    
    
    // ----------------------------------------------------------------------
    case Main_DETAIL:{
    if (pressed_right 
    ||  pressed_left )
    {
        var  _IDX = Main_DETAIL;
        var  _DIR = sign_(pressed_right);
        var  _val=dg_Main[#_IDX,$5];            // 5: current
        if ((_val>dg_Main[#_IDX,$6] && !_DIR)   // 6: min
        ||  (_val<dg_Main[#_IDX,$7] &&  _DIR) ) // 7: max
        {
            _val = clamp(dg_Main[#_IDX,$5]+_DIR, dg_Main[#_IDX,$6],dg_Main[#_IDX,$7]);
            dg_Main[#_IDX,$5] = _val;
            dg_Main[#_IDX,$A] = string(dg_Main[#_IDX,$5])+"X"; // $A: value text
            
            global.RetroShaders_surface_scale = dg_Main[#_IDX,$5];
            update_shaders_surf_resize();
            
            save_game_pref();
            aud_play_sound(SOUND_CURSOR2, -1,-1, SOUND_VOLUME);
            timer = DURATION0;
        }
    }
    break;}
    
    
    
    
    // ----------------------------------------------------------------------
    case Main_BRIGHTNESS:{
    if (pressed_confirm1)
    {
        aud_play_sound(SOUND_CONFIRM1, -1,-1, SOUND_VOLUME);
        timer = DURATION0;
        menu_state = menu_focus_Brightness;
    }
    break;}
    
    
    
    
    // ----------------------------------------------------------------------
    case Main_SATURATION:{
    if (pressed_confirm1)
    {
        aud_play_sound(SOUND_CONFIRM1, -1,-1, SOUND_VOLUME);
        timer = DURATION0;
        menu_state = menu_focus_Saturation;
    }
    break;}
    
    
    
    
    // ----------------------------------------------------------------------
    case Main_SCANLINES:{
    if (pressed_confirm1)
    {
        aud_play_sound(SOUND_CONFIRM1, -1,-1, SOUND_VOLUME);
        timer = DURATION0;
        menu_state = menu_focus_Scanlines;
    }
    break;}
    
    
    
    
    // ----------------------------------------------------------------------
    case Main_BLOOM:{
    if (pressed_confirm1)
    {
        aud_play_sound(SOUND_CONFIRM1, -1,-1, SOUND_VOLUME);
        timer = DURATION0;
        menu_state = menu_focus_Bloom;
    }
    break;}
    
    
    
    
    // ----------------------------------------------------------------------
    case Main_BLUR:{
    if (pressed_confirm1)
    {
        aud_play_sound(SOUND_CONFIRM1, -1,-1, SOUND_VOLUME);
        timer = DURATION0;
        menu_state = menu_focus_Blur;
    }
    break;}
    
    
    
    
    // ----------------------------------------------------------------------
    case Main_DEFAULT:{ // restore all defaults
    if (pressed_confirm1)
    {
        dg_Brightness[#Brightness_EDIT,$5] = dg_Brightness[#Brightness_EDIT,$8];
        dg_Saturation[#Saturation_EDIT,$5] = dg_Saturation[#Saturation_EDIT,$8];
        dg_Scanlines[#Scanlines_EDIT,$5]   = dg_Scanlines[#Scanlines_EDIT,$8];
        dg_Bloom[#Bloom_A,$5]              = dg_Bloom[#Bloom_A,$8];
        dg_Bloom[#Bloom_B,$5]              = dg_Bloom[#Bloom_B,$8];
        dg_Bloom[#Bloom_C,$5]              = dg_Bloom[#Bloom_C,$8];
        dg_Bloom[#Bloom_D,$5]              = dg_Bloom[#Bloom_D,$8];
        dg_Bloom[#Bloom_E,$5]              = dg_Bloom[#Bloom_E,$8];
        dg_Bloom[#Bloom_F,$5]              = dg_Bloom[#Bloom_F,$8];
        dg_Bloom[#Bloom_G,$5]              = dg_Bloom[#Bloom_G,$8];
        dg_Blur[#Blur_EDIT,$5]             = dg_Blur[#Blur_EDIT,$8];
        
        save_game_pref();
        aud_play_sound(SOUND_CONFIRM1, -1,-1, SOUND_VOLUME);
        timer = DURATION0;
    }
    break;}//case Main_DEFAULT
}//switch(Main_cursor)




