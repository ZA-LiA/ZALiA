/// Cutscene_MoaiOpenMouth_1_update()


if (timer) timer--;


switch(sub_state)
{
    // ----------------------------------------------------------------------
    // ----------------------------------------------------------------------
    case SUB_STATE_IDLE:{
    if (timer) break;
    
    
    var _W = 8;
    if (wINw(global.pc.x,1, x-(_W>>1),_W))
    {
        g.pc_lock = PC_LOCK_ALL;
        g.cutscene = 1;
        
        timer = DUR1;
        sub_state = SUB_STATE_ACTV1;
    }
    break;}
    
    
    
    
    
    // ----------------------------------------------------------------------
    // ----------------------------------------------------------------------
    case SUB_STATE_ACTV1:{
    var _i, _count;
    
    if (TurnedIn_count)
    {
        for(_i=ds_grid_width(dg_TurnedIn)-1; _i>=0; _i--)
        {
            if (dg_TurnedIn[#_i,2]) // stun flash timer
            {   dg_TurnedIn[#_i,2]--;  }
        }
    }
    
    if (timer) break;
    
    
    
    if (TurnedIn_count<DEFEATED_COUNT)
    {
        _count = ds_grid_width(dg_TurnedIn);
        for(_i=0; _i<_count; _i++)
        {
            if(!dg_TurnedIn[#_i,0])
            {
                dg_TurnedIn[#_i,0] = 1;
                dg_TurnedIn[#_i,2] = DUR3; // $30. stun flash timer
                TurnedIn_count++;
                f.dm_quests[?dk_spawn+TurnedIn_DATAKEY] = TurnedIn_count;
                aud_play_sound(get_audio_theme_track(dk_StrikeEnemy));
                timer = DUR1;
                break;
            }
        }
    }
    else
    {
        if (TurnedIn_count>=DEFEATED_GOAL)
        {
            for(_i=ds_grid_width(dg_TurnedIn)-1; _i>=0; _i--) dg_TurnedIn[#_i,2] = 0; // timer.  just in case
            
            aud_play_sound(get_audio_theme_track(STR_Secret));
            timer = 0;
            sub_state = SUB_STATE_OPEN1;
        }
        else
        {
            timer = 0;
            sub_state = SUB_STATE_DONE;
        }
    }
    break;}
    
    
    
    
    
    // ----------------------------------------------------------------------
    // ----------------------------------------------------------------------
    case SUB_STATE_OPEN1:{
    if (timer) break;
    
    
    if (rows_up<ROWS)
    {
        rows_up++;
        set_xlyt(id, xl, spawn_yt-(rows_up<<3));
        aud_play_sound(get_audio_theme_track(dk_ElevatorMove));
        aud_play_sound(get_audio_theme_track(dk_BridgeCrumble));
        timer = DUR2;
    }
    else
    {
        timer = 0;
        sub_state = SUB_STATE_OPEN2;
    }
    break;}
    
    
    
    
    
    // ----------------------------------------------------------------------
    // ----------------------------------------------------------------------
    case SUB_STATE_OPEN2:{
    if (timer) break;
    
    
    with(Exit)
    {
        if (exitNum&$FF==g.EXIT_DIR_MID)
        {
            open = 1;
            break;
        }
    }
    
    
    timer = 0;
    sub_state = SUB_STATE_DONE;
    break;}
    
    
    
    
    
    // ----------------------------------------------------------------------
    // ----------------------------------------------------------------------
    case SUB_STATE_DONE:{
    if (timer) break;
    
    
    g.pc_lock = 0;
    g.cutscene = 0;
    
    break;}
}






// ----------------------------------------------------------------------
Cutscene_MoaiOpenMouth_1_udp();

//




