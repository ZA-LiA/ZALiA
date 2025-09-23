/// FileSelect_RandoOTHER_MAIN_update()


var _InputConfirm_pressed2 = InputConfirm_pressed || Input.pressedH;


if (InputBack_pressed 
||  (RandoOTHER_MAIN_cursor==RandoOTHER_MAIN_cursor_BACK && InputConfirm_pressed) )
{
    aud_play_sound(get_audio_theme_track(BACK_SOUND_THEME1));
    RandoState = RandoState_MAIN;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



if (input_select_pressed 
||  Input.pressedV )
{
    var _DIR = sign_(input_select_pressed || input_down_pressed);
    RandoOTHER_MAIN_cursor = (RandoOTHER_MAIN_cursor+_DIR+RandoOTHER_MAIN_cursor_COUNT) mod RandoOTHER_MAIN_cursor_COUNT;
    aud_play_sound(get_audio_theme_track(CURSOR_SOUND_THEME2));
    exit;//case RandoOTHER_state_MAIN:
}






// -------------------------------------------------------------------------------
var _val;
var _DIR = sign_(input_right_pressed || InputConfirm_pressed);


if (RandoOTHER_MAIN_cursor==RandoOTHER_MAIN_cursor_ATTACK 
||  RandoOTHER_MAIN_cursor==RandoOTHER_MAIN_cursor_MAGIC 
||  RandoOTHER_MAIN_cursor==RandoOTHER_MAIN_cursor_LIFE )
{
    if (_InputConfirm_pressed2)
    {
        _val = dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor,2];
        _val--;
        _val = (_val+STAT_LEVEL_MAX+_DIR) mod STAT_LEVEL_MAX;
        _val++;
        dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor,2] = _val;
        aud_play_sound(get_audio_theme_track(CONFIRM_SOUND_THEME1));
    }
    exit;//case RandoOTHER_state_MAIN:
}



switch(RandoOTHER_MAIN_cursor)
{
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoOTHER_MAIN_WARP_PENALTY:{
    if (_InputConfirm_pressed2)
    {
        dg_RandoOTHER_Options[#RandoOTHER_MAIN_WARP_PENALTY,2] = !dg_RandoOTHER_Options[#RandoOTHER_MAIN_WARP_PENALTY,2]; // 2: state
        aud_play_sound(get_audio_theme_track(CONFIRM_SOUND_THEME1));
    }
    break;}
    
    
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoOTHER_MAIN_PALETTE:{
    if (_InputConfirm_pressed2)
    {
        dg_RandoOTHER_Options[#RandoOTHER_MAIN_PALETTE,2] = !dg_RandoOTHER_Options[#RandoOTHER_MAIN_PALETTE,2]; // 2: state
        aud_play_sound(get_audio_theme_track(CONFIRM_SOUND_THEME1));
    }
    break;}
    
    
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoOTHER_MAIN_DUNGEON_TS:{
    if (_InputConfirm_pressed2)
    {
        dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor,2] = !dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor,2]; // 2: state
        aud_play_sound(get_audio_theme_track(CONFIRM_SOUND_THEME1));
    }
    break;}
    
    
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoOTHER_MAIN_cursor_QUEST:{
    if (_InputConfirm_pressed2)
    {
        var _MAX = 2;
        _val  = dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor,2];
        _val--;
        _val = (_val+_MAX+_DIR) mod _MAX;
        _val++;
        dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor,2] = _val;
        aud_play_sound(get_audio_theme_track(CONFIRM_SOUND_THEME1));
    }
    break;}//case RandoOTHER_MAIN_cursor_QUEST:
    
    
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoOTHER_MAIN_cursor_ITEMS:{
    if (InputConfirm_pressed)
    {
        RandoOTHER_ITEMS_cursor = 0;
        RandoOTHER_ITEMS_item_cursor = 0;
        aud_play_sound(get_audio_theme_track(CONFIRM_SOUND_THEME1));
        RandoOTHER_state = RandoOTHER_state_ITEMS;
    }
    break;}//case RandoOTHER_MAIN_cursor_ITEMS:
    
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoOTHER_MAIN_cursor_SPELLS:{
    if (InputConfirm_pressed)
    {
        RandoOTHER_SPELLS_cursor = 0;
        aud_play_sound(get_audio_theme_track(CONFIRM_SOUND_THEME1));
        RandoOTHER_state = RandoOTHER_state_SPELLS;
    }
    break;}//case RandoOTHER_MAIN_cursor_SPELLS:
    
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoOTHER_MAIN_cursor_SKILLS:{
    if (InputConfirm_pressed)
    {
        RandoOTHER_SKILLS_cursor = 0;
        aud_play_sound(get_audio_theme_track(CONFIRM_SOUND_THEME1));
        RandoOTHER_state = RandoOTHER_state_SKILLS;
    }
    break;}//case RandoOTHER_MAIN_cursor_SKILLS:
    
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoOTHER_MAIN_cursor_REQUIRE:{
    if (InputConfirm_pressed)
    {
        RandoOTHER_REQUIRE_cursor = 0;
        aud_play_sound(get_audio_theme_track(CONFIRM_SOUND_THEME1));
        RandoOTHER_state = RandoOTHER_state_REQUIRE;
    }
    break;}//case RandoOTHER_MAIN_cursor_REQUIRE:
    
    // ============================================================================
    // -------------------------------------------------------------------
    case RandoOTHER_MAIN_cursor_BACK:{
    if (InputConfirm_pressed)
    {
        aud_play_sound(get_audio_theme_track(BACK_SOUND_THEME1));
        RandoState = RandoState_MAIN;
    }
    break;}//case RandoOTHER_BACK:
}//switch(RandoOTHER_MAIN_cursor)




