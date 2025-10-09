/// Cutscene_FloorTrap_1_update()


if (timer) timer--;


switch(sub_state)
{
    // ==============================================================
    // -----------------------------------------------------
    case sub_state_IDLE:{
    if (timer) break;
    if (inRange(global.pc.x, Zelda_X-Trigger_DIST,Zelda_X+Trigger_DIST))
    //if (inRange(global.pc.x, min(Trigger_X,Zelda_X),max(Trigger_X,Zelda_X)))
    //if (global.pc.x >= Trigger_X)
    {
        g.pc_lock = PC_LOCK;
        
        CrumbleGround_state = 1;
        
        timer     = 0;
        sub_state = sub_state_ACTIVE;
    }
    break;}
    
    
    
    
    
    // ==============================================================
    // -----------------------------------------------------
    case sub_state_ACTIVE:{
    if (timer) break;
    
    switch(CrumbleGround_state)
    {
        // ------------------------------------------
        case 1:{
        if (global.pc.ogr) break;
        
        // Remove ground tiles
        Cutscene_FloorTrap_1_update_1a(1);
        /*
        var _i, _clm,_row;
        var _COUNT = CrumbleGround_CLMS * CrumbleGround_ROWS;
        for(_i=0; _i<_COUNT; _i++)
        {
            _clm = CrumbleGround_CLM + (_i mod CrumbleGround_CLMS);
            _row = CrumbleGround_ROW + (_i div CrumbleGround_CLMS);
            tile_change_1a(DEPTH_BG2, _clm<<3,_row<<3, 0);
        }
        */
        aud_play_combo1(7);
        //aud_play_combo1(3);
        
        timer = CrumbleGround1_DUR; // CrumbleGround1_DUR=$08
        CrumbleGround_state++;
        break;}
        
        
        
        // ------------------------------------------
        case 2:{
        
        // Remove solids
        Cutscene_FloorTrap_1_update_1a(2);
        /*
        var _i, _clm,_row;
        var _COUNT = CrumbleGround_CLMS * CrumbleGround_ROWS;
        for(_i=0; _i<_COUNT; _i++)
        {
            _clm = CrumbleGround_CLM + (_i mod CrumbleGround_CLMS);
            _row = CrumbleGround_ROW + (_i div CrumbleGround_CLMS);
            g.dg_rt_solid[#_clm,_row] = 0;
        }
        */
        
        timer = CrumbleGround2_DUR; // CrumbleGround2_DUR=$08
        CrumbleGround_state++;
        break;}
        
        
        
        // ------------------------------------------
        case 3:{
        CrumbleGround_state = 0;
        
        timer     = 0;
        sub_state = sub_state_DONE;
        break;}
    }
    break;}
    
    
    
    
    
    // ==============================================================
    // -----------------------------------------------------
    case sub_state_DONE:{
    if (timer) break;
    
    break;}
}




