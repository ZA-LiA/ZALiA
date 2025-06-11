/// load_game_pref()


var _val;


var _FILE_NAME = UserPrefFileName;
//var _FILE_NAME = string_letters(dk_UserPreferences)+"01"+".txt";
//var _FILE_NAME = STR_Game+STR_Preferences+"01"+".txt";
if(!file_exists(_FILE_NAME)) save_game_pref();




// --------------------------------------------------
var _FILE    = file_text_open_read(working_directory+_FILE_NAME);
var _ENCODED = file_text_read_string(_FILE);
               file_text_close(_FILE);
var _dm_FILE_DATA = json_decode(_ENCODED);
// --------------------------------------------------


if (_dm_FILE_DATA==-1) // `json_decode` returns -1 if it fails
{
    show_debug_message("");
    show_debug_message("!!!! WARNING! load_game_pref(). `_dm_file_data` failed to get data from '"+_FILE_NAME+"' !!!!");
    show_debug_message("");
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// --------------------------------------------------
g.WindowScale_scale = val(_dm_FILE_DATA[?STR_Window+STR_Scale], g.WindowScale_scale);
window_set_scale(window_get_scale());

var _XL = g.window_center_x - ((viewW()*g.WindowScale_scale)>>1);
var _YT = g.window_center_y - ((viewH()*g.WindowScale_scale)>>1);
window_set_position_(_XL,_YT);

window_set_fullscreen(val(_dm_FILE_DATA[?STR_Fullscreen]));




// --------------------------------------------------
_val = _dm_FILE_DATA[?f.SDNAME_volume_sound];
if(!is_undefined(_val))
{
    Audio.snd_vol = _val;
    audio_group_set_gain(audiogroup_snd, Audio.snd_vol/10, 0);
}

_val = _dm_FILE_DATA[?f.SDNAME_volume_music];
if(!is_undefined(_val))
{
    Audio.mus_vol = _val;
    audio_group_set_gain(audiogroup_mus, Audio.mus_vol/10, 0);
}


_val = _dm_FILE_DATA[?STR_Music+STR_Set];
if(!is_undefined(_val)) Audio.audio_set = string(_val);

_val = _dm_FILE_DATA[?STR_Audio+STR_Random+STR_Custom];
if(!is_undefined(_val)) Audio.dm_random_custom = json_decode(_val);



_val = _dm_FILE_DATA[?STR_Input+STR_Preferences];
if(!is_undefined(_val))
{
    var _dm = json_decode(_val);
    ds_map_copy(Input.dm_UserInputConfig, _dm);
    ds_map_destroy(_dm); _dm=undefined;
}



// --------------------------------------------------
_val = _dm_FILE_DATA[?STR_Background+STR_Flashing];
if(!is_undefined(_val)) p.BackgroundFlash_setting = _val;

_val = _dm_FILE_DATA[?STR_Screen+STR_Shake];
if(!is_undefined(_val)) g.ScreenShake_user_pref = _val;

_val = _dm_FILE_DATA[?STR_Dialogue+STR_Speed];
if(!is_undefined(_val)) g.mod_DLG_SPEED = _val;

_val = _dm_FILE_DATA[?STR_Indicate+STR_Spell+STR_Active];
if(!is_undefined(_val)) g.mod_IndicateSpellActive = _val;

_val = _dm_FILE_DATA[?STR_Torch+STR_Lighting];
if(!is_undefined(_val)) g.torch_lighting_method = _val;

_val = _dm_FILE_DATA[?STR_HUD+STR_Type];
if(!is_undefined(_val)) global.HUD_state = _val;

_val = _dm_FILE_DATA[?STR_Frenzy+STR_Stab];
if(!is_undefined(_val)) g.mod_StabFrenzy = _val;

_val = _dm_FILE_DATA[?STR_Cucco+STR_Spell+"02"+STR_Preference];
if(!is_undefined(_val)) g.CuccoSpell2_Option = _val>0;

_val = _dm_FILE_DATA[?STR_Rando+STR_Palette];
if(!is_undefined(_val)) g.RandoPalette_state = _val;

_val = _dm_FILE_DATA[?STR_Rando+STR_Enemy];
if(!is_undefined(_val)) g.Rando_enemy = _val;

_val = _dm_FILE_DATA[?STR_Rando+STR_Overworld+STR_TSRC];
if(!is_undefined(_val)) global.can_rando_ow_tsrc = _val;

_val = _dm_FILE_DATA[?STR_Rando+STR_Scene];
if(!is_undefined(_val)) global.SceneRando_enabled = _val;

_val = _dm_FILE_DATA[?STR_Rando+STR_Hint];
if(!is_undefined(_val)) global.RandoHints_enabled = _val;

_val = _dm_FILE_DATA[?STR_Rando+STR_Dungeon+STR_Tileset];
if(!is_undefined(_val)) global.RandoDungeonTilesets_enabled = _val;

_val = _dm_FILE_DATA[?STR_Halloween+"01"];
if(!is_undefined(_val)) global.Halloween1_enabled = _val;

_val = _dm_FILE_DATA[?STR_Map+STR_Show+STR_Key];
if(!is_undefined(_val)) g.RandoKeys_MAP_items_show_keys = _val;

_val = _dm_FILE_DATA[?STR_Overworld+STR_Mark+STR_Acquired];
if(!is_undefined(_val)) g.can_mark_acquired_item_locations = _val;

_val = _dm_FILE_DATA[?STR_Overworld+STR_Mark+STR_Hidden+STR_Exit];
if(!is_undefined(_val)) g.HiddenExitIndicator_enabled = _val;


_val = _dm_FILE_DATA[?STR_PC+STR_Sprite+STR_Set];
if(!is_undefined(_val)) g.pc.dm_skins[?STR_Current+STR_Idx] = clamp(_val, 0,val(g.pc.dm_skins[?STR_Set+STR_Count])-1);



_val = _dm_FILE_DATA[?"_DevTools"     +STR_State];
if(!is_undefined(_val)) g.DevTools_state = _val;

_val = _dm_FILE_DATA[?"_DoubleJump"   +STR_State];
if(!is_undefined(_val)) g.DoubleJump_state = _val;

_val = _dm_FILE_DATA[?"_DevDash"      +STR_State];
if(!is_undefined(_val)) g.DevDash_state = _val;

_val = _dm_FILE_DATA[?"_Debug_Overlay"+STR_State];
if(!is_undefined(_val))
{
    g.can_show_debug_overlay = _val;
    show_debug_overlay(g.can_show_debug_overlay);
}

_val = _dm_FILE_DATA[?"_All_BGR_Black"+STR_State];
if(!is_undefined(_val)) g.all_bg_black_only = _val;

_val = _dm_FILE_DATA[?STR_Frame+STR_Count+"_App"            +"_can_draw"];
if(!is_undefined(_val)) global.App_frame_count_can_draw = _val;

_val = _dm_FILE_DATA[?STR_Frame+STR_Count+"_App"+"_Unpaused"+"_can_draw"];
if(!is_undefined(_val)) global.App_frame_count_unpaused_can_draw = _val;

_val = _dm_FILE_DATA[?STR_Frame+STR_Count+"_Room"           +"_can_draw"];
if(!is_undefined(_val)) global.Room_frame_count_can_draw = _val;




ds_map_destroy(_dm_FILE_DATA); _dm_FILE_DATA=undefined;




