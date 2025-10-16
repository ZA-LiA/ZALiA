/// Eyenocc_update()


GO_update_cam_vars();

if (Jiggle_timer) Jiggle_timer--;


switch(sub_state)
{   // --------------------------------------------------------
    case sub_state_IDLE:{
    if (timer) break;//case sub_state_IDLE
    
    
    Eye_state = Eye_state_OPEN_HALF;
    if (sequence_num>>4<val(dm[?STR_Sequence+STR_Count]))
    {
        if (ocsHV1(id)) // if any w AND h in ocs area
        {
            // E677 - PC sword to enemy body
            GOB_body_collide_pc_sword();
            
            if (cs&CS_SW1)
            {
                Jiggle_timer = Jiggle_DURATION1;
                
                hp = g.dl_HP[|HP_IDX];
                
                sequence_num += $10;
                sequence_num &= $F0;
                sequence_num |= $01; // sequence_num&$F is the sub-sequence num. The sequence num of movements for the last stab.
                if(!is_undefined(dk_spawn)) f.dm_quests[?dk_spawn+STR_Sequence+STR_Num] = sequence_num;
                
                Source_xl = xl;
                Source_yt = yt;
                Destination_xl = val(dm[?STR_Sequence+hex_str(sequence_num)+"_X"], Source_xl);
                Destination_yt = val(dm[?STR_Sequence+hex_str(sequence_num)+"_Y"], Source_yt);
                hspd = (SPEED1*sign(Destination_xl-Source_xl)) &$FF;
                vspd = (SPEED1*sign(Destination_yt-Source_yt)) &$FF;
                
                if (hspd 
                ||  vspd )
                {
                    timer = $0;
                    //timer = $1;
                    sub_state = sub_state_MOVING;
                }
            }
        }
    }
    else
    {
        Eye_state = Eye_state_CLOSED;
    }
    break;}//case sub_state_IDLE
    
    
    
    
    
    
    
    // --------------------------------------------------------
    case sub_state_MOVING:{
    Eye_state = Eye_state_OPEN_FULL;
    if (timer) break;//case sub_state_MOVING
    
    
    var _xl_PREV = xl;
    var _yt_PREV = yt;
    if (hspd) updateX();
    if (vspd) updateY();
    
    if (rectInRect(_xl_PREV,_yt_PREV,ww,hh, Source_xl,Source_yt,ww,hh) 
    && !rectInRect( xl,      yt,     ww,hh, Source_xl,Source_yt,ww,hh) )
    {
        var _i,_j;
        for(_i=(hh>>3)-1; _i>=0; _i--)
        {
            for(_j=(ww>>3)-1; _j>=0; _j--)
            {
                tile_change_1a(0, Source_xl+(_j<<3),Source_yt+(_i<<3), -1,0, 0);
            }
        }
    }
    
    
    var                _destination_reached = false;
         if (hspd&$80) _destination_reached = xl<=Destination_xl;
    else if (hspd)     _destination_reached = xl>=Destination_xl;
    else if (vspd&$80) _destination_reached = yt<=Destination_yt;
    else if (vspd)     _destination_reached = yt>=Destination_yt;
    
    if (_destination_reached)
    {
        hspd = 0;
        vspd = 0;
        set_xy(id, Destination_xl+ww_, Destination_yt+hh_);
        Source_xl = xl;
        Source_yt = yt;
        
        var _i,_j;
        for(_i=(hh>>3)-1; _i>=0; _i--)
        {
            for(_j=(ww>>3)-1; _j>=0; _j--)
            {
                tile_change_1a(0, xl+(_j<<3),yt+(_i<<3), -1,0, TID_SOLID1);
            }
        }
        
        // sequence_num&$F is the sub-sequence num. The sequence num of movements for the last stab.
        if (sequence_num&$F< val(dm[?STR_Sequence+string(sequence_num>>4)+STR_Count]))
        {
            sequence_num++;
            Destination_xl = val(dm[?STR_Sequence+hex_str(sequence_num)+"_X"], Source_xl);
            Destination_yt = val(dm[?STR_Sequence+hex_str(sequence_num)+"_Y"], Source_yt);
            hspd = (SPEED1*sign(Destination_xl-Source_xl)) &$FF;
            vspd = (SPEED1*sign(Destination_yt-Source_yt)) &$FF;
            timer  = $6;
            //timer += $1;
        }
        else
        {
            timer = 0;
            sub_state = sub_state_IDLE;
        }
    }
    break;}//case sub_state_MOVING
}//switch(sub_state)


update_EF11();




