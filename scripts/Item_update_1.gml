/// Item_update_1()

// E771, E77B. Acquiring item


var _MUSIC_THEME1 = dk_GetItem+"01";
var _MUSIC_THEME2 = dk_GetItem+"02";
var _can_flash=false;

switch(ITEM_TYPE)
{
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_CANDLE:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_GLOVE:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_RAFT:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_HAMMER:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_BOOTS:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    Overworld_tile_change_2a(global.OVERWORLD.TileChangeEvent_TYPE_BOOT1);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_FLUTE:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_BRACELET:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_CROSS:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    
    
    
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_RFAIRY:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    g.StatRestore_timer_hp = get_stat_max(STR_Heart);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_BOOK:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_MEAT:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_PENDANT:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_SHIELD:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_SWORD:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_RING:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_ALLKEY:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_MASK:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    
    
    
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_FEATHER:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_MAP1:{
    f.items |= ITEM_BIT;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME2), -1,false,-1, _MUSIC_THEME2);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_MAP2:{
    f.items |= ITEM_BIT;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME2), -1,false,-1, _MUSIC_THEME2);
    break;}
    
    
    
    
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_TROPHY:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_NOTE:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_MIRROR:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_FLOWER:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_CHILD:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_BOTTLE:{
    f.items |= ITEM_BIT;
    _can_flash=true;
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);
    break;}
    
    
    
    
    
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_HEART:{
    f.cont_pieces_hp += string_copy(ITEM_ID, string_length(ITEM_ID)-3, 4);
    g.StatRestore_timer_hp = get_stat_max(STR_Heart);
    if!(cont_piece_cnt_hp() mod f.CONT_PIECE_PER) // if this completes a container
    {    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);  }
    else aud_play_sound(get_audio_theme_track(_MUSIC_THEME2), -1,false,-1, _MUSIC_THEME2);
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_MAGIC:{
    f.cont_pieces_mp += string_copy(ITEM_ID, string_length(ITEM_ID)-3, 4);
    g.StatRestore_timer_mp = get_stat_max(STR_Magic);
    if!(cont_piece_cnt_mp() mod f.CONT_PIECE_PER) // if this completes a container
    {    aud_play_sound(get_audio_theme_track(_MUSIC_THEME1), -1,false,-1, _MUSIC_THEME1);  }
    else aud_play_sound(get_audio_theme_track(_MUSIC_THEME2), -1,false,-1, _MUSIC_THEME2);
    break;}
    
    
    
    
    
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_KEY:{ // E79A
    if(!is_undefined(ITEM_ID)  // key_datakey example: "0203", "0601"
    &&  is_string(   ITEM_ID) )
    {   f.dm_keys[?  ITEM_ID+STR_Acquired] = true;  }
    
    f.key_count = get_key_count(g.dungeon_num);
    aud_play_sound(get_audio_theme_track(dk_StabItem));
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_JAR:{ // E847
    g.StatRestore_timer_mp += get_jar_restore_dur(ver);
    
    if (ver==1 
    ||  ver==3 )
    {
        if(!is_undefined(ITEM_ID) 
        &&  is_string(   ITEM_ID) )
        {   f.dm_jars[?  ITEM_ID+STR_Acquired] = true;  }
    }
    aud_play_sound(get_audio_theme_track(dk_StabItem));
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_PBAG:{ // E7F4: JSR E880
    // For that have a spawn datakey (not ones dropped by an enemy)
    if(!is_undefined(ITEM_ID) 
    &&  is_string(   ITEM_ID) )
    {   f.dm_PBags[? ITEM_ID+STR_Acquired] = true;  }
    
    aud_play_sound(get_audio_theme_track(dk_StabItem));
    timer = g.XP_RISE_DURATION + 2; // $20 + 2
    state = state_DROP; // for xp rise
    break;}
    
    // ===============================================================================
    // ------------------------------------------------------------------------
    case STR_1UP:{ // E80C
    lives++;
    
    if(!is_undefined(  ITEM_ID) 
    &&  is_string(     ITEM_ID) )
    {
        f.dm_1up_doll[?ITEM_ID+STR_Acquired] = true;
        //show_debug_message("Item_update_1(). "+"f.dm_1up_doll[?'"+ITEM_ID+"'+STR_Acquired] = true;");
    }
    
    aud_play_sound(get_audio_theme_track(_MUSIC_THEME2), -1,false,-1, _MUSIC_THEME2);
    break;}
}//switch(ITEM_TYPE1)



if (_can_flash)
{
    var                     _DURATION = p.SpellFlash_DURATION1; // SpellFlash_DURATION1=$20. bit $80 means flash background
    p.Flash_Pal_timer     = _DURATION;
    p.Flash_Bgr_timer     = _DURATION;
    p.SpellFlash_PC_timer = _DURATION;
}




