/// Cutscene_MoaiOpenMouth2_update()


if (g.ChangeRoom_timer>0)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



if (timer) timer--;


switch(sub_state)
{
    // ----------------------------------------------------------------------
    // ----------------------------------------------------------------------
    case SUB_STATE_IDLE:{
    if (timer) break;
    
    global.pc.depth_def = PC_DEPTH;
    
    set_xy(global.pc, x,yt-global.pc.hh_);
    g.pc_lock  = PC_LOCK_ALL;
    g.cutscene = 1;
    
    if (global.pc.state!=global.pc.state_NORMAL) break;
    timer = $40;
    sub_state = SUB_STATE_OPEN1;
    break;}
    
    
    
    
    
    // ----------------------------------------------------------------------
    // ----------------------------------------------------------------------
    case SUB_STATE_ACTV1:{
    if (timer) break;
    break;}
    
    
    
    
    
    // ----------------------------------------------------------------------
    // ----------------------------------------------------------------------
    case SUB_STATE_OPEN1:{
    if (timer) break;
    
    
    global.pc.depth_def = PC_DEPTH;
    
    
    if (rows_up<ROWS)
    {
        rows_up++;
        set_xlyt(id, xl, spawn_yt-(rows_up<<3));
        
        for(var _i=0; _i<ww>>3; _i++)
        {   // Remove tiles behind sprite
            tile_change_1a(TILE_DEPTH, xl+(_i<<3),yt, 0,0);
        }
        
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
    
    
    global.pc.depth_def = PC_DEPTH_DEF;
    
    
    Exit_inst.open = 1;
    
    opened = true;
    if(!is_undefined(dk_spawn))
    {   f.dm_quests[?dk_spawn+STR_Open] = opened;  }
    
    
    timer = 0;
    sub_state = SUB_STATE_WALK;
    break;}
    
    
    
    
    
    // ----------------------------------------------------------------------
    // ----------------------------------------------------------------------
    case SUB_STATE_WALK:{ // Move PC from door center so player can't accidentally exit the door.
    if (timer) break;
    
    
    global.pc.depth_def = PC_DEPTH_DEF;
    
    var _X = x-ww_-$10;
    global.pc.WalkTo_active   = true;
    global.pc.WalkTo_x        = _X;
    global.pc.WalkTo_hspd_max = $10;
    
    if (global.pc.x==_X)
    //if (walk_pc_to_x(x-ww_-$10, $10)) // if PC at 
    {
        global.pc.WalkTo_active = false;
        global.pc.depth_def = PC_DEPTH_DEF;
        g.pc_lock   = 0;
        g.cutscene  = 0;
        
        timer = 0;
        sub_state = SUB_STATE_DONE;
    }
    break;}
    
    
    
    
    
    
    // ----------------------------------------------------------------------
    // ----------------------------------------------------------------------
    case SUB_STATE_DONE:{
    if (timer) break;
    break;}
}






// ----------------------------------------------------------------------
Cutscene_MoaiOpenMouth_1_udp();




