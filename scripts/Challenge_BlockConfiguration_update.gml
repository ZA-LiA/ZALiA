/// Challenge_BlockConfiguration_update()

// The challenge is completed, but key has not been acquired.


if (timer1) timer1--;

switch(sub_state)
{
    // --------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------
    case ST_SUB1_CHCK:{
    var _i,_j, _val1,_val2, _clm,_row;
    for(_i=0; _i<ROWS; _i++)
    {
        for(_j=0; _j<CLMS; _j++)
        {
            _clm = (xl>>3) + (_j<<1);
            _row = (yt>>3) + (_i<<1);
            
            _val1 = !!dg_config[#_j,_i];
            _val2 = g.dg_RmTile_Break[#_clm,_row] &$FF;
            if (_val1!=isVal(_val2,TID_BREAK1,TID_BREAK3))
            {
                exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            }
        }
    }
    
    
    // All tiles match configuration
    f.dm_challenges[?challenge_id+STR_Complete] = 1;
    
    // Stop BlockSpawner from spawning anymore blocks.
    with(Spawner_FallingBlock)
    {
        state = 0;
        if (g.mod_destroy_go_on_death 
        &&  !state )
        {   GO_destroy_1a();  }
        break;//with(Spawner_FallingBlock)
    }
    
    
    var _Y    = (viewYT()>>4) <<4;
        _Y   += ((yt>>3)&$1)  <<3;
    var _ROWS = ((yt+$10)-_Y) >>4;
    //timer1 = (_ROWS<<2) + $10; // cleanup timeout in case cleanup doesnt complete
    timer1 = $FF;
    
    timer = $20;
    sub_state = ST_SUB1_CLEN;
    break;}//case ST_SUB1_CHCK
    
    
    
    
    
    // --------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------
    case ST_SUB1_CLEN:{ // Destroy any blocks above the block configuration.
    if (timer) timer--;
    if (timer) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    
    // Only 1 every 4 frames
    if!(g.counter1&$3) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    if (timer1) // cleanup timeout in case the following loops forever (cleanup doesnt complete)
    {
        var _Y    = (viewYT()>>4) <<4;
            _Y   += ((yt>>3)&$1)  <<3;
        var _ROWS = ((yt+$10)-_Y) >>4;
        
        var _clm,_row;
        var              _COUNT = CLMS*_ROWS;
        for(var _i=0; _i<_COUNT; _i++)
        {
            _clm = (xl>>3) + ((_i mod CLMS)<<1);
            _row = (_Y>>3) + ((_i div CLMS)<<1);
            
            if (isVal(g.dg_RmTile_Break[#_clm,_row]&$FF, TID_BREAK1,TID_BREAK3))
            {
                break_block(_clm,_row);
                exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            }
        }
    }
    
    
    timer1 = 0;
    timer  = $0C;
    sub_state = ST_SUB1_SPWN;
    break;}//case ST_SUB1_CLEN
    
    
    
    
    
    // --------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------
    case ST_SUB1_SPWN:{
    if (timer) timer--;
    if (timer) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    
    
    switch(ver)
    {
        // --------------------------------------------------------------------------------
        case 1:{
        /*
        with(GameObject_create(item_spawn_x,item_spawn_y, ItmD0,1)) // key
        {
            dk_item  = other.challenge_id+STR_Item_Key; // for f.dm_keys
            dk_item += STR_Dungeon+hex_str(g.dungeon_num);
            
            //aud_play_sound(Audio.SND_SPWN_ITM1);
            
            instance_destroy();
            exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        }
        */
        break;}//case 1
        
        
        // --------------------------------------------------------------------------------
        case 2:{
        with(BlckB)
        {
            if (Chain_hang)
            {
                Chain_connected = false;
            }
            else
            {
                var _DEPTH = DEPTH_BG2;
                var _X = xl-8;
                var _Y = yt+8;
                // Remove tiles under prize so it falls to the floor.
                tile_change_1a(_DEPTH, _X+($00<<3),_Y+($00<<3), 0,0, 0);
                tile_change_1a(_DEPTH, _X+($03<<3),_Y+($00<<3), 0,0, 0);
                tile_change_1a(_DEPTH, _X+($01<<3),_Y+($01<<3), 0,0, 0);
                tile_change_1a(_DEPTH, _X+($02<<3),_Y+($01<<3), 0,0, 0);
            }
            break;//with(BlckB)
        }
        
        aud_play_sound(get_audio_theme_track(dk_BlockBreak));
        aud_play_sound(get_audio_theme_track(dk_BridgeCrumble));
        //with(Kakusu) sub_state = SUB_STATE_REVEAL;
        
        timer = $04; // delay secret sound
        sub_state = ST_SUB1_END;
        break;}//case 2
        
        
        // --------------------------------------------------------------------------------
        case 3:{
        break;}//case 3
    }
    break;}//case ST_SUB1_SPWN
    
    
    
    
    
    
    // --------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------
    case ST_SUB1_END:{
    if (timer) timer--;
    if (timer) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    aud_play_sound(get_audio_theme_track(STR_Secret));
    instance_destroy();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    break;}
}




