/// save_game_pref()


var _i, _idx, _val, _count;
var _dm = ds_map_create();
var _dm_save_data = ds_map_create();
var _FILE_NAME = UserPrefFileName;
//var _FILE_NAME = string_letters(dk_UserPreferences)+"01"+".txt";
//var _FILE_NAME = STR_Game+STR_Preferences+"01"+".txt";




// ---------------------------------------------------------------
_dm_save_data[?f.SDNAME_volume_sound]                   = Audio.snd_vol;
_dm_save_data[?f.SDNAME_volume_music]                   = Audio.mus_vol;
_dm_save_data[?STR_Music+STR_Set]                       = Audio.audio_set;
_dm_save_data[?STR_Audio+STR_Random+STR_Custom]         = json_encode(Audio.dm_random_custom);
_dm_save_data[?STR_Fullscreen]                          = window_get_fullscreen();
_dm_save_data[?STR_Window+STR_Scale]                    = g.WindowScale_scale;
_dm_save_data[?STR_PC+STR_Sprite+STR_Set]               = val(global.pc.dm_skins[?STR_Current+STR_Idx]);
_dm_save_data[?STR_Background+STR_Flashing]             = p.BackgroundFlash_setting;
_dm_save_data[?STR_Screen+STR_Shake]                    = g.ScreenShake_user_pref;
_dm_save_data[?STR_Dialogue+STR_Speed]                  = g.mod_DLG_SPEED;
_dm_save_data[?STR_Game+STR_Font]                       = global.game_font_idx;
_dm_save_data[?STR_Indicate+STR_Spell+STR_Active]       = g.mod_IndicateSpellActive;
_dm_save_data[?STR_Torch+STR_Lighting]                  = g.torch_lighting_method;
_dm_save_data[?STR_HUD+STR_Type]                        = global.HUD_state;
_dm_save_data[?STR_Frenzy+STR_Stab]                     = g.mod_StabFrenzy;
_dm_save_data[?STR_Cucco+STR_Spell+"02"+STR_Preference] = g.CuccoSpell2_Option;
_dm_save_data[?STR_Overworld+STR_Mark+STR_Hidden+STR_Exit] = g.HiddenExitIndicator_enabled;
_dm_save_data[?STR_Halloween+"01"]                      = global.Halloween1_enabled;

_dm_save_data[?STR_Overworld+STR_Mark+STR_Acquired]     = g.can_mark_acquired_item_locations;
_dm_save_data[?STR_Rando+STR_Palette]                   = g.RandoPalette_state;
_dm_save_data[?STR_Rando+STR_Enemy]                     = g.Rando_enemy;
_dm_save_data[?STR_Rando+STR_Overworld+STR_TSRC]        = global.can_rando_ow_tsrc;
_dm_save_data[?STR_Rando+STR_Scene]                     = global.SceneRando_enabled;
_dm_save_data[?STR_Rando+STR_Hint]                      = global.RandoHints_enabled;
_dm_save_data[?STR_Rando+STR_Dungeon+STR_Tileset]       = global.RandoDungeonTilesets_enabled;
_dm_save_data[?STR_Map+STR_Show+STR_Key]                = g.RandoKeys_MAP_items_show_keys;

_dm_save_data[?STR_Input+STR_Preferences]               = json_encode(Input.dm_UserInputConfig);

_dm_save_data[?"_DevTools"     +STR_State] = g.DevTools_state;
_dm_save_data[?"_DoubleJump"   +STR_State] = g.DoubleJump_state;
_dm_save_data[?"_DevDash"      +STR_State] = g.DevDash_state;
_dm_save_data[?"_Debug_Overlay"+STR_State] = g.can_show_debug_overlay;
_dm_save_data[?"_All_BGR_Black"+STR_State] = g.all_bg_black_only;
_dm_save_data[?STR_Frame+STR_Count+"_App"            +"_can_draw"] = global.App_frame_count_can_draw;
_dm_save_data[?STR_Frame+STR_Count+"_App"+"_Unpaused"+"_can_draw"] = global.App_frame_count_unpaused_can_draw;
_dm_save_data[?STR_Frame+STR_Count+"_Room"           +"_can_draw"] = global.Room_frame_count_can_draw;
//_dm_save_data[?"_Dev_Tools"]                            = json_encode(Input.dm_UserInputConfig);




// Graphic Effects ----------------------------------------------------
_dm_save_data[?"_Retro_Shaders_Enabled"]       = global.RetroShaders_enabled;
_dm_save_data[?"_Retro_Shaders_Surface_Scale"] = global.RetroShaders_surface_scale;

ds_map_clear(_dm);
with(g.surf.GEE)
{
    _dm[?STR_Brightness+STR_State] = dg_Brightness[#Brightness_ENABLE,$5];
    _dm[?STR_Brightness+"A"]       = dg_Brightness[#Brightness_EDIT,$5];
    //                                                                          //
    _dm[?STR_Saturation+STR_State] = dg_Saturation[#Saturation_ENABLE,$5];
    _dm[?STR_Saturation+"A"]       = dg_Saturation[#Saturation_EDIT,$5];
    //                                                                          //
    _dm[?STR_Scanlines +STR_State] = dg_Scanlines[#Scanlines_ENABLE,$5];
    _dm[?STR_Scanlines +"A"]       = dg_Scanlines[#Scanlines_EDIT,$5];
    //                                                                          //
    _dm[?STR_Bloom     +STR_State] = dg_Bloom[#Bloom_ENABLE,$5];
    _dm[?STR_Bloom     +"A"]       = dg_Bloom[#Bloom_A,$5];
    _dm[?STR_Bloom     +"B"]       = dg_Bloom[#Bloom_B,$5];
    _dm[?STR_Bloom     +"C"]       = dg_Bloom[#Bloom_C,$5];
    _dm[?STR_Bloom     +"D"]       = dg_Bloom[#Bloom_D,$5];
    _dm[?STR_Bloom     +"E"]       = dg_Bloom[#Bloom_E,$5];
    _dm[?STR_Bloom     +"F"]       = dg_Bloom[#Bloom_F,$5];
    _dm[?STR_Bloom     +"G"]       = dg_Bloom[#Bloom_G,$5];
    //                                                                          //
    _dm[?STR_Blur      +STR_State] = dg_Blur[#Blur_ENABLE,$5];
    _dm[?STR_Blur      +"A"]       = dg_Blur[#Blur_EDIT,$5];
    //                                                                          //
    _dm_save_data[?"_Graphics_Effects"+STR_Preferences] = json_encode(_dm);
}








// ---------------------------------------------------------------
if (DEV 
&& !file_exists(_FILE_NAME) )
{
    show_debug_message("save_game_pref():  '"+_FILE_NAME+"'  created!");
}

var _ENCODED = json_encode(_dm_save_data);
var _FILE = file_text_open_write(working_directory+_FILE_NAME);
            file_text_write_string(_FILE, _ENCODED);
            file_text_close(_FILE);
show_debug_message("save_game_pref():  '"+_FILE_NAME+"'  saved!");
// ---------------------------------------------------------------




ds_map_destroy(_dm_save_data); _dm_save_data=undefined;
ds_map_destroy(_dm); _dm=undefined;




