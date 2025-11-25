/// OptionsMenu_RandoOptions_update()


var _i, _val;

var _InputConfirm_pressed  = a_button_pressed || start_button_pressed; // GP_Face1_pressed: xbox A
var _InputConfirm_pressed2 = _InputConfirm_pressed || Input.pressedH;

var _SOUND1 = CURSOR_SOUND1;
var _SOUND2 = CONFIRM_SOUND1;


// -------------------------------------------------------------------------------
if(!timer)
{
    if (Backout_requested 
    ||  (Rando_cursor==Rando_BACK && _InputConfirm_pressed) )
    {
        aud_play_sound(BACK_SOUND1);
        timer = DURATION1;
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
        var _COUNT0 = val(dm_options[?"Rando"+STR_Count]);
        var _DIR = sign_(select_button_pressed || Input.Down_pressed);
        for(_i=0; _i<_COUNT0; _i++)
        {
            Rando_cursor += _DIR;
            Rando_cursor += _COUNT0;
            Rando_cursor  = Rando_cursor mod _COUNT0;
            if (OptionsMenu_option_is_avail(menu_state_RANDO,Rando_cursor))
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
switch(Rando_cursor)
{
    // -------------------------------------------------
    case Rando_MARK_ACQUIRED:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        var _DIR = sign_(_InputConfirm_pressed || Input.Right_pressed);
        global.MarkItemLocations_state += global.MarkItemLocations_state_COUNT;
        global.MarkItemLocations_state += _DIR;
        global.MarkItemLocations_state  = global.MarkItemLocations_state mod global.MarkItemLocations_state_COUNT;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case Rando_HINTS:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        global.RandoHints_enabled = !global.RandoHints_enabled;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case Rando_MAPS_SHOW_KEYS:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        g.RandoKeys_MAP_items_show_keys = !g.RandoKeys_MAP_items_show_keys;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case Rando_ENEMY_RANDO:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        global.EnemyRando_enabled = !global.EnemyRando_enabled;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case Rando_DUNGEON_TILESETS:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        global.RandoDungeonTilesets_enabled = !global.RandoDungeonTilesets_enabled;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case Rando_OW_BIOMES:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        global.can_rando_ow_tsrc = !global.can_rando_ow_tsrc;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case Rando_SCENES:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        global.SceneRando_enabled = !global.SceneRando_enabled;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case Rando_PALETTE:{
    //if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        var _DIR = sign_(_InputConfirm_pressed || Input.Right_pressed);
        g.RandoPalette_state = (g.RandoPalette_state+_DIR+g.RandoPalette_STATE_COUNT) mod g.RandoPalette_STATE_COUNT;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case Rando_DUNGEONS_REQUIREMENT:{
    //if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        _val  = val(global.dm_save_file_settings[?STR_Crystal+STR_Required+STR_Count], global.RandoDungeonRequirement_MAX);
        _val += sign_(_InputConfirm_pressed || Input.Right_pressed);
             if (_val<global.RandoDungeonRequirement_MIN) _val = global.RandoDungeonRequirement_MAX;
        else if (_val>global.RandoDungeonRequirement_MAX) _val = global.RandoDungeonRequirement_MIN;
        global.dm_save_file_settings[?STR_Crystal+STR_Required+STR_Count] = _val;
        /*
        var _FILE_NAME = f.dl_file_names[|f.file_num-1];
        var _file = file_text_open_read(working_directory+_FILE_NAME);
        var _DATA = file_text_read_string(_file);
                    file_text_close(_file);
        var _dm = json_decode(_DATA);
        if (_dm!=-1)
        {
            _dm[?STR_Save+STR_File+STR_Settings] = json_encode(global.dm_save_file_settings);
            _file = file_text_open_write(working_directory+_FILE_NAME);
                    file_text_write_string(_file, json_encode(_dm));
                    file_text_close(_file);
            ds_map_destroy(_dm); _dm=undefined;
        }
        */
        set_saved_value(f.file_num, STR_Save+STR_File+STR_Settings, json_encode(global.dm_save_file_settings));
        //save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case Rando_BACK:{
    if (timer) break;
    
    if (_InputConfirm_pressed)
    {
        aud_play_sound(BACK_SOUND1);
        timer = DURATION1;
        menu_state = menu_state_MAIN;
    }
    break;}
}//switch(Rando_cursor)




