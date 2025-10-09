/// Challenge_SwitchB_update()


// -----------------------------------------------------------------------
switch(sub_state)
{
    // =========================================================
    // ----------------------------------------------------
    case STATE_IDLE:{
    if (timer){timer--; break;}
    
    if (ver==1 
    &&  complete )
    {
        timer = 0;
        sub_state = STATE_COMPLETE;
    }
    
    
    
    
    var _change = false;
    //var _pressed_count = 0;
    var _all_pressed = true;
    with(SwchB)
    {
        if(!pressed)
        {
            _all_pressed = false;
            break;//with(SwchB)
        }
    }
    
    switch(ver)
    {
        case 1:{
        _change  = !complete && _all_pressed;
        complete =  complete || _all_pressed;
        break;}//case 1
        
        case 2:{
        if (complete!=_all_pressed)
        {
            _change = true;
            complete = _all_pressed;
        }
        break;}//case 2
        
        case 3:{
        if (complete!=_all_pressed)
        {
            _change = true;
            complete = _all_pressed;
        }
        break;}//case 3
        
        case 4:{
        if (complete!=_all_pressed)
        {
            _change = true;
            complete = _all_pressed;
        }
        break;}//case 4
    }//switch(ver)
    
    
    if (_change)
    {
        timer = 0;
        sub_state = STATE_CHANGING1;
    }
    break;}//case STATE_IDLE
    
    
    
    
    
    
    
    
    // =========================================================
    // ----------------------------------------------------
    case STATE_CHANGING1:{
    if (timer){timer--; break;}
    
    g.pc_lock = PC_LOCK_ALL;
    
    switch(ver)
    {
        case 1:{
        if (complete)
        {
            f.dm_challenges[?challenge_id+STR_Complete] = true;
            with(SwchB) complete = other.complete;
        }
        break;}//case 1
        
        case 2:{
        f.dm_challenges[?challenge_id+STR_Complete] = complete;
        break;}//case 2
        
        case 3:{
        f.dm_challenges[?challenge_id+STR_Complete] = complete;
        break;}//case 3
        
        case 4:{
        with(SwchB) complete = other.complete;
        //f.dm_challenges[?challenge_id+STR_Complete] = complete;
        break;}//case 4
    }//switch(ver)
    
    timer = DUR_DELAY2; // DUR_DELAY2=$20
    sub_state = STATE_CHANGING2;
    break;}//case STATE_CHANGING1
    
    
    
    
    
    
    
    
    // =========================================================
    // ----------------------------------------------------
    case STATE_CHANGING2:{
    if (timer){timer--; break;}
    
    switch(ver)
    {
        case 1:{
        if (complete 
        &&  locked_door )
        {   locked_door.counter = -1;  } // Starts opening process
        break;}//case 1
        
        
        case 2:{
        Challenge_SwitchB_update_1a(!complete);
        break;}//case 2
        
        
        case 3:{
        with(Exit)
        {
            if (exitNum==$00)
            {
                open = other.complete;
                if (open) doorway_spr = g.Doorway1_SPR;
                else      doorway_spr = spr_Doorway01_Closed01;
                aud_play_sound(get_audio_theme_track(STR_Open+STR_LockedDoor));
                break;//with(Exit)
            }
        }
        break;}//case 3
    }//switch(ver)
    
    timer = DUR_DELAY3; // DUR_DELAY3=$10
    //timer = DUR_DELAY2; // DUR_DELAY2=$20
    sub_state = STATE_CHANGING3;
    break;}//case STATE_CHANGING2
    
    
    
    
    
    
    
    
    // =========================================================
    // ----------------------------------------------------
    case STATE_CHANGING3:{
    if (timer){timer--; break;}
    
    g.pc_lock = 0;
    
    timer = 0;
    sub_state = STATE_COMPLETE1;
    break;}//case STATE_CHANGING3
    
    
    
    
    
    
    
    
    // =========================================================
    // ----------------------------------------------------
    case STATE_COMPLETE1:{
    if (timer){timer--; break;}
    
    timer = 0;
    sub_state = STATE_COMPLETE2;
    break;}//case STATE_COMPLETE1
    
    
    
    
    
    
    
    
    // =========================================================
    // ----------------------------------------------------
    case STATE_COMPLETE2:{
    if (timer){timer--; break;}
    
    timer = 0;
    sub_state = STATE_COMPLETE;
    break;}//case STATE_COMPLETE2
    
    
    
    
    
    
    
    
    // =========================================================
    // ----------------------------------------------------
    case STATE_COMPLETE:{
    if (timer){timer--; break;}
    
    g.pc_lock = 0;
    
    switch(ver)
    {
        case 1:{
        timer = 0;
        //sub_state = STATE_IDLE;
        break;}//case 1
        
        case 2:{
        timer = 0;
        sub_state = STATE_IDLE;
        break;}//case 2
        
        case 3:{
        timer = 0;
        sub_state = STATE_IDLE;
        break;}//case 3
    }//switch(ver)
    break;}//case STATE_COMPLETE
}//switch(sub_state)




if (ver==4)
{
    var _Waterfall_COUNT = val(Water_dm[?STR_Waterfall+STR_Count]);
    if (_Waterfall_COUNT)
    {
        var _i,_j, _xl,_yt, _x,_y, _w,_h, _datakey0;
        with(BurnableMgr)
        {
            var          _COUNT = ds_grid_width(dg_Burnable);
            for(_i=0; _i<_COUNT; _i++)
            {
                if (dg_Burnable[#_i,$2])
                {
                    _x = dg_Burnable[#_i,$5] + 4;
                    _y = dg_Burnable[#_i,$6] + 4;
                    for(_j=0; _j<_Waterfall_COUNT; _j++)
                    {
                        _datakey0 = STR_Waterfall+hex_str(_j+1);
                        if (val(other.Water_dm[?_datakey0+STR_Active]))
                        {
                            _w  = val(other.Water_dm[?_datakey0+STR_Current+STR_Width]);
                            if (_w>8)
                            {
                                _h  = val(other.Water_dm[?_datakey0+STR_Current+STR_Height]);
                                _xl = val(other.Water_dm[?_datakey0+STR_Current+"_XL"]);
                                _yt = val(other.Water_dm[?_datakey0+STR_Current+"_YT"]);
                                if (pointInRect(_x,_y, _xl,_yt,_w,_h))
                                {
                                    dg_Burnable[#_i,$2] = 0; // main timer
                                    dg_Burnable[#_i,$3] = 0; // spread timer
                                    dg_Burnable[#_i,$4] = 0; // can draw
                                }
                            }
                        }
                    }
                }
            }
        }
        
        
        if (sub_state!=STATE_IDLE)
        {
            for(_i=0; _i<_Waterfall_COUNT; _i++)
            {
                _datakey0 = STR_Waterfall+hex_str(_i+1);
                if (val(Water_dm[?_datakey0+STR_Active]))
                {
                    if (val(Water_dm[?_datakey0+STR_Current+STR_Width])>2)
                    {
                        if!(g.counter1&$7)
                        {
                            Water_dm[?_datakey0+STR_Current+STR_Width] = val(Water_dm[?_datakey0+STR_Current+STR_Width]) - 2;
                            Water_dm[?_datakey0+STR_Current+"_XL"]     = val(Water_dm[?_datakey0+"_XL"]) + ((val(Water_dm[?_datakey0+STR_Width])-val(Water_dm[?_datakey0+STR_Current+STR_Width]))>>1);
                        }
                    }
                    else
                    {
                        Water_dm[?_datakey0+STR_Current+"_YT"]      = val(Water_dm[?_datakey0+STR_Current+"_YT"]) + 1 + (g.counter1&$1);
                        Water_dm[?_datakey0+STR_Current+STR_Height] = val(Water_dm[?_datakey0+STR_Height]) - (val(Water_dm[?_datakey0+STR_Current+"_YT"])-val(Water_dm[?_datakey0+"_YT"]));
                        
                        if(!val(Water_dm[?_datakey0+STR_Current+STR_Height])) Water_dm[?_datakey0+STR_Active] = false;
                        //if (val(Water_dm[?_datakey0+STR_Current+"_YT"])>val(Water_dm[?_datakey0+"_YT"])+$10)
                    }
                }
            }
        }
    }
}




