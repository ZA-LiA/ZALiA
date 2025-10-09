/// SwitchA_update()


if ( sub_state==SUB_ST_IDLE
||  (sub_state==SUB_ST_MOVE && abs(speed1)<=SPD_O) )
{
    update_body_hb_3a();
    if (collide_pc_sword(BodyHB_xl,BodyHB_yt, BodyHB_w,BodyHB_h))
    {
        var     _PUSH = $C;
        var     _qual = false;
        switch(orientation)
        {
            case 0: {
            if (isVal(global.pc.behavior, global.pc.behavior_STAB_STAND, global.pc.behavior_STAB_CROUCH) 
            &&  global.pc.xScale == DIR_IN )
            {
                _qual = true;
                g.control1_timer = global.pc.Pushback_DURATION;
                global.pc.hspd = byte(_PUSH * -DIR_IN);
            }
            break;  }
            
            case 1: {
            if (isVal(global.pc.behavior, global.pc.behavior_STAB_DOWN) 
            &&  global.pc.vspd && global.pc.vspd < $80 )
            {
                _qual = true;
                PC_set_bounce();
            }
            break;  }
            
            case 2: {
            if (isVal(global.pc.behavior, global.pc.behavior_STAB_STAND, global.pc.behavior_STAB_CROUCH) 
            &&  global.pc.xScale == DIR_IN )
            {
                _qual = true;
                g.control1_timer = global.pc.Pushback_DURATION;
                global.pc.hspd = byte(_PUSH * -DIR_IN);
            }
            break;  }
            
            case 3: {
            if (isVal(global.pc.behavior, global.pc.behavior_STAB_UP) 
            &&  global.pc.vspd && global.pc.vspd & $80 )
            {
                _qual = true;
                global.pc.vspd = 0;
            }
            break;  }
        }
        
        
        
        if (    _qual)
        {
            speed1 = SPD_I;
            
            aud_play_sound(get_audio_theme_track(dk_ElevatorMove));
            aud_play_sound(get_audio_theme_track(dk_BridgeCrumble));
            
            sub_state = SUB_ST_MOVE;
        }
    }
}







switch (sub_state)
{
    // ----------------------------------------------------------
    case SUB_ST_IDLE: {
    
    break;            }
    
    
    // ----------------------------------------------------------
    case SUB_ST_MOVE: {
    
        hspd = 0;
        vspd = 0;
    
    var _coord_a  = 0;
    var _coord_b  = 0;
    var _SPD      = (speed1 * DIR_IN) & $FF;
    
    if (orientation & 1) 
    {
        vspd = _SPD;
        updateY();
        _coord_a = y;
        _coord_b = GOAL_Y;
    }
    else
    {
        hspd = _SPD;
        updateX();
        _coord_a = x;
        _coord_b = GOAL_X;
    }
    
    if ( speed1) 
    {    speed1 = max(speed1-2, -SPD_O);  }
    else speed1 = max(speed1-1, -SPD_O);
        hspd = 0;
        vspd = 0;
    
    
    
    if (sign((_coord_a - _coord_b) + DIR_IN) == DIR_IN)
    {
        xl = GOAL_XX;
        yt = GOAL_YY;
        set_xlyt(id, xl, yt);
        
        speed1 = 0;
        
        timer = DUR_GOAL;
        
        sub_state = SUB_ST_GOAL;
    }
    else if (abs(_coord_a - _coord_b) >= MAX_LENGTH)
    {
             xl  = GOAL_XX;
             yt  = GOAL_YY;
        if (orientation & 1)
        {    yt += (MAX_LENGTH * -DIR_IN);  }
        else xl += (MAX_LENGTH * -DIR_IN);
        // if (orientation & 1) yt = (GOAL_Y + (MAX_LENGTH * -DIR_IN)) - sprite_get_yoffset(sprite_index);
        // else                 xl = (GOAL_X + (MAX_LENGTH * -DIR_IN)) - sprite_get_xoffset(sprite_index);
        set_xlyt(id, xl, yt);
        
        speed1 = 0;
        
        
        sub_state = SUB_ST_IDLE;
    }
    
    break;            }
    
    
    // ----------------------------------------------------------
    case SUB_ST_GOAL: {
    
    // if (timer) timer--;
    if(!timer)
    {
        // Nudge 1 pixel out to prevent SUB_ST_MOVE from setting sub_state back to SUB_ST_GOAL
        if (orientation & 1) set_xlyt(id, xl,           yt + -DIR_IN);
        else                 set_xlyt(id, xl + -DIR_IN, yt);
        
        speed1 = -SPD_O;
        
        
        sub_state = SUB_ST_MOVE;
    }
    
    break;            }
    
    
    // ----------------------------------------------------------
    case SUB_ST_COMP: {
    
    break;            }
}



SwitchA_udp();




