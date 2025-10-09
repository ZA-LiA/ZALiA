/// Challenge_SwitchC_update()


update_EF11();


// -----------------------------------------------------------------------
switch(sub_state)
{
    // =============================================================
    // -------------------------------------------------------
    case STATE_INCOMPLETE:{
    var _i;
    var _complete = true;
    for(_i=ds_list_size(dl_switch)-1; _i>=0; _i--)
    {
        if (dl_switch[|_i].pressed) continue;
        
        _complete = false;
        break; // for
    }
    
    if(!_complete) break; // switch (sub_state)
    
    
    
    for(_i=ds_list_size(dl_switch)-1; _i>=0; _i--)
    {
        with(dl_switch[|_i])
        {
            complete    = true;
            pressed     = true;
        }
    }
    
    
    for(_i=(CLMS*ROWS)-1; _i>=0; _i--)
    {
        global.dg_solid[#(xl>>3)+(_i mod CLMS), (yt>>3)+(_i div CLMS)] = 0;
    }
    
    
    //Ag.pc_lock = PC_LOCK_ALL; // Lock all
    //f.dm_challenges[?challenge_id+STR_Complete] = 1;
    
    
    timer     = DUR_DELAY_CMP2;
    sub_state = STATE_COMPLETE1;
    break;}
    
    
    
    
    
    // =============================================================
    // -------------------------------------------------------
    case STATE_COMPLETE1:{
    if (timer) timer--;
    if (timer) break;
    if (g.counter1&$3) break;
    
    
    set_xlyt(id, xl+1, yt);
    aud_play_sound(snd_move);
    
    if (xl < GOAL_CLM<<3) break;
    set_xlyt(id, GOAL_CLM<<3, yt);
    
    for(var _i=(CLMS*ROWS)-1; _i>=0; _i--)
    {
        global.dg_solid[#(xl>>3)+(_i mod CLMS), (yt>>3)+(_i div CLMS)] = TID_SOLID1;
    }
    
    
    timer     = DUR_DELAY_CMP2;
    sub_state = STATE_COMPLETE2;
    break;}
    
    
    
    
    
    // =============================================================
    // -------------------------------------------------------
    case STATE_COMPLETE2:{
    if (timer) timer--;
    if (timer) break;
    
    
    g.pc_lock = 0;
    
    
    timer     = 0;
    sub_state = STATE_COMPLETE3;
    break;}
    
    
    
    
    
    // =============================================================
    // -------------------------------------------------------
    case STATE_COMPLETE3:{
    if (timer) timer--;
    if (timer) break;
    
    
    break;}
}




