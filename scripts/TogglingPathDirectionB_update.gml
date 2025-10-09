/// TogglingPathDirectionB_update()


update_EF11();


// pc_lock: $1: hspd, $2: jump, 
// $10: stab high, $20: stab low, $40: thrust down, $80: thrust up, 
g.pc_lock |= elev.pc_lock_bits;



if (g.EnterRoom_control_timer)
{
    with (elev) GameObjectB_step();
    
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}





var _dir  = 0;
var _amt  = 0;
var _dist = 0;
var _colliding = false;
var _X = 0;
var _Y = 0;




switch (sub_state)
{
    // --------------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------
    case SUB_STATE_1:   {
    
    _X = dg_a[# location_a-1,1];
    _Y = dg_a[# location_a-1,2];
    
    loc_b_reached = false;
    
    elev.hspd1 = elev.HSPD;
    elev.vspd1 = elev.VSPD;
    
    elev.moving_dir = 0;
    
    
    if (isVal(location_a, LOC_TOP, LOC_BTM))
    {
            elev.moving_dir = Input.heldV & $C;
        if (elev.moving_dir)
        {
            _amt  = (elev.vspd1 * bit_dir(elev.moving_dir & $C))&$FF;   // vspd
            _amt  = simulate_position_change(_amt, elev.vspd_sub);                // y change
            
            _dist = abs(elev.y - _Y);
            
                _colliding = _dist <= abs(_amt);
            if (_colliding)
            {
                if (_dist)
                {
                    elev.vspd1 = (_dist<<4)&$F0;
                }
                else elev.moving_dir = 0;
            }
        }
    }
    else
    {
            elev.moving_dir = Input.heldH&$3;
        if (elev.moving_dir)
        {
            _amt  = (elev.hspd1 * bit_dir(elev.moving_dir & $3))&$FF;   // hspd
            _amt  = simulate_position_change(_amt, elev.hspd_sub);                // x change
            
            _dist = abs(elev.x - _X);
            
                _colliding = _dist <= abs(_amt);
            if (_colliding)
            {
                if (_dist)
                {
                    elev.hspd1 = (_dist<<4)&$F0;
                }
                else elev.moving_dir = 0;
            }
        }
    }
    
    
    
    if (_colliding)
    {
        timer = DUR_DELAY_1; // Delay set pc xScale
        
        
        sub_state = SUB_STATE_2;
    }
    
    
    break;              }
    
    
    
    
    
    
    
    
    // --------------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------
    case SUB_STATE_2:   {
    
    elev.moving_dir = 0;
    
    if (timer)
    {
        timer--;
        break;
    }
    
    
    global.pc.xScale = sign_(dg_a[# location_b-1,1] - dg_a[# location_a-1,1]);
    timer = DUR_SELF_CONTROL1_DELAY;
    
    
    sub_state = SUB_STATE_3;
    
    
    break;              }
    
    
    
    
    
    
    
    
    // --------------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------
    case SUB_STATE_3:   {
    
    if (timer)
    {
        timer--;
        break;
    }
    
    
    
    elev.hspd1 = SPEED1;
    elev.vspd1 = SPEED1;
    
    
    var _DIST = ($05 + isVal(location_b, LOC_RGT, LOC_LFT)) <<3;
    
    if (isVal(location_b, LOC_TOP, LOC_BTM))
    {
        // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
        // ---------------------  going to: TOP or BTM  ------------------------------------
                            elev.moving_dir  = (4 <<(location_b == LOC_TOP)); // 4(    DWN) or  8(    UP)
        if (!loc_b_reached) elev.moving_dir |= (1 <<(location_a == LOC_RGT)); // 5(RGT-DWN) or $A(LFT-UP)
        
        if (!loc_b_reached)
        {
            _amt  = (elev.hspd1 * bit_dir(elev.moving_dir & $3))&$FF;   // hspd
            _amt  = simulate_position_change(_amt, elev.hspd_sub);                // x change
            
            
            _X = dg_a[# location_b-1,1];
            _dist = abs(elev.x - _X);
            
                loc_b_reached = _dist <= abs(_amt);
            if (loc_b_reached)
            {
                if (_dist)
                {
                    elev.hspd1 = (_dist<<4)&$F0;
                }
                else elev.moving_dir &= ~_dir;
            }
        }
        else
        {
            _amt  = (elev.vspd1 * bit_dir(elev.moving_dir & $C))&$FF;   // vspd
            _amt  = simulate_position_change(_amt, elev.vspd_sub);                // y change
            
            _Y = dg_a[# location_b-1,2];
            _colliding = (((elev.y+_amt) - _Y) * sign_(location_b == LOC_BTM)) >= _DIST;
        }
    }
    else
    {
        // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
        // ---------------------  going to: RGT or LFT  ------------------------------------
                            elev.moving_dir  = (1 <<(location_b == LOC_LFT)); // 1(RGT)     or  2(LFT)
        if (!loc_b_reached) elev.moving_dir |= (4 <<(location_a == LOC_BTM)); // 5(RGT-DWN) or $A(LFT-UP)
        
        if (!loc_b_reached)
        {
            _amt  = (elev.vspd1 * bit_dir(elev.moving_dir & $C))&$FF;   // vspd
            _amt  = simulate_position_change(_amt, elev.vspd_sub);                // y change
            
            
            _Y = dg_a[# location_b-1,2];
            _dist = abs(elev.y - _Y);
            
                loc_b_reached = _dist <= abs(_amt);
            if (loc_b_reached)
            {
                if (_dist)
                {
                    elev.vspd1 = (_dist<<4)&$F0;
                }
                else elev.moving_dir &= ~_dir;
            }
        }
        else
        {
            _amt  = (elev.hspd1 * bit_dir(elev.moving_dir & $3))&$FF;   // hspd
            _amt  = simulate_position_change(_amt, elev.hspd_sub);                // x change
            
            _X = dg_a[# location_b-1,1];
            _colliding = (((elev.x+_amt) - _X) * sign_(location_b == LOC_RGT)) >= _DIST;
        }
    }
    
    
    
    
    
    if (_colliding)
    {
        elev.moving_dir = 0;
        
        
        path_dir = -path_dir;
        g.dm_spawn[? dk_spawn+STR_Direction] = path_dir;
        
        location_a = location_b;
        location_b = ((location_a-1 + path_dir) & 3) + 1;
        
        
        timer = DUR_PLYR_CONTROL1_DELAY;
        
        
        sub_state = SUB_STATE_4;
    }
    
    
    break;              }
    
    
    
    
    
    
    
    // --------------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------
    case SUB_STATE_4:   {
    
    if (timer)
    {
        timer--;
        break;
    }
    
    
    sub_state = SUB_STATE_1;
    
    break;              }
}







with (elev) GameObjectB_step();




/*
switch (location_b)
{
    case 1: {
    
    break;  }
    
    case 2: {
    
    break;  }
    
    case 3: {
    
    break;  }
    
    case 4: {
    
    break;  }
}
*/






