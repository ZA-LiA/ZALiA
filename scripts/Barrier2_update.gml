/// Barrier2_update()


Barrier2_udp();


switch(sub_state)
{
    // =============================================================
    // -----------------------------------------------------
    case sub_state_IDLE1:{
    if (timer) break;
    if (f.quest_num==1) break;
    
    if (abs(g.pc.x-Blocks_XC) <= Activate_DIST 
    && !g.pc.ogr )
    {
        g.pc_lock = PC_LOCK_ALL;
        
        // Holding Triforce restores hp/mp
        g.StatRestore_timer_mp = get_stat_max(STR_Magic);
        g.StatRestore_timer_hp = get_stat_max(STR_Heart);
        
        audio_group_stop_all(audiogroup_mus);
        Audio.can_play_mus_rm_body = false;
        Audio.can_play_boss_music  = false;
        aud_play_sound(Activate_SOUND, -1,false,-1, Activate_SOUND_THEME); // Activate_SND: Audio.MUS_GET_ITEM1
        
        timer  = round(audio_sound_length(Activate_SOUND)*room_speed);
        timer += 2;
        //timer  = audio_sound_length(Activate_SND)*room_speed;
        sub_state = sub_state_ACTIVATING;
    }
    break;}
    
    
    
    
    // =============================================================
    // -----------------------------------------------------
    case sub_state_ACTIVATING:{
    PC_set_behavior(PC_HOLD_BEHAVIOR); // both arms raised
    
    if (timer 
    &&  audio_is_playing(Activate_SOUND) )
    {
        break;
    }
    timer = 0;
    
    
    var _i = irandom(Blocks_COUNT-1);
    dg_Blocks[#_i,0] = 2; // state
    dg_Blocks[#_i,1] = Blocks_DUR1; // timer
    
    timer     = 0;
    sub_state = sub_state_REMOVING;
    break;}
    
    
    
    
    // =============================================================
    // -----------------------------------------------------
    case sub_state_REMOVING:{
    if (timer) break;
    
    var _complete = true;
    var _dl_remaining = ds_list_create();
    var _i,_j, _idx;
    for(_i=0; _i<Blocks_COUNT; _i++)
    {
        if(!dg_Blocks[#_i,1]) continue; // timer
        
        
        _complete = false;
        
            dg_Blocks[#_i,1]--;
        if (dg_Blocks[#_i,1]==Blocks_CUE2)
        {
            for(_j=0; _j<Blocks_COUNT; _j++)
            {
                if (dg_Blocks[#_j,0]!=1) continue;//_j
                
                ds_list_add(    _dl_remaining,_j);
            }
            
            if (ds_list_size(   _dl_remaining))
            {
                ds_list_shuffle(_dl_remaining);
                _idx =          _dl_remaining[|0];
                ds_list_clear(  _dl_remaining);
                
                if (dg_Blocks[#_idx,0]==1) // just in case
                {
                    dg_Blocks[#_idx,0] = 2; // state
                    dg_Blocks[#_idx,1] = Blocks_DUR1; // timer
                    aud_play_sound(get_audio_theme_track(dk_StrikeEnemy));
                    //aud_play_sound(Audio.SND_ENMY_DTH1);
                }
            }
        }
        else if(!dg_Blocks[#_i,1])
        {
            dg_Blocks[#_i,0] = 0; // state
        }
    }
    
    ds_list_destroy(_dl_remaining); _dl_remaining=undefined;
    
    
    if (_complete)
    {
        var _CLM = Blocks_XL>>3;
        var _ROW = Blocks_YT>>3;
        var _clm,_row;
        var _clms = Blocks_CLMS<<1;
        var _rows = Blocks_ROWS<<1;
        for(_i=(_clms*_rows)-1; _i>=0; _i--)
        {   // Remove all solids
            _clm = _CLM + (_i mod _clms);
            _row = _ROW + (_i div _clms);
            g.dg_RmTile_solid[#_clm,_row]=0;
        }
        
        
        f.dm_quests[?Barrier1_SCENE_NAME+STR_Barrier+STR_State] = 1; // Barrier has been removed
        //f.dm_quests[?g.TriforceBarrier1_RM_NAME+STR_Barrier+STR_State] = 1; // Barrier has been removed
        
        g.pc_lock = 0;
        PC_set_behavior(g.pc.behavior_IDLE); // 
        Audio.can_play_mus_rm_body = true; // 
        
        timer     = 0;
        sub_state = sub_state_IDLE2;
    }
    
    break;}
    
    
    
    
    // =============================================================
    // -----------------------------------------------------
    case sub_state_IDLE2:{
    if (timer) break;
    break;}
}




