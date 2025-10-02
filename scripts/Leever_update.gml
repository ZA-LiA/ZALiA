/// Leever_update()


var _RAND = rand();


// 9910: JSR DA02
GOB_update_2();

if (stun_timer)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


// -----------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------
// 9916
if (cs&CS_BD1) enemy_collide_pc_body();



// -------------------------------------------------------------------
switch(sub_state)
{
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    case SUB_STATE_NEWXY:
    {
        // 9928
        if (timer) break;
        
        
        var _X  = g.view_xl_og + _RAND;
            _X += ww_;
        //
        var _Y  = Leever_in_ground_y(_X>>3, IN_GROUND_ROW_MIN);
            _Y += hh_;
        //
        
        if (1) // MOD.  Prevent spawning out of solids.
        {
            if(!g.dg_RmTile_solid[# (_X-ww_)>>3, _Y>>3])
            {   _X += 8;  }
            if(!g.dg_RmTile_solid[# (_X+ww_)>>3, _Y>>3])
            {   _X -= 8;  }
                _X  = (_X>>3)<<3;
        }
        
        set_xy(id, _X,_Y);
        
        facing_dir = dir_to_pc(id);
        hspd_dir  = facing_dir;
        hspd      = ($10*hspd_dir)&$FF;
        
        
        timer     = $50; // 1.333s
        sub_state = SUB_STATE_SURFC;
        // counter = (counter+1)&$FF;
        
        
        break;
    }
    
    
    
    
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    case SUB_STATE_SURFC:
    {
        // 9950
        if (timer)
        {
            if ( timer < $1A 
            && !(timer & 1) )
            {
                set_xy(id, x, y-1);
            }
            
            break;
        }
        
        
        // $30-3F: 0.800s-1.050s
        // $70-7F: 1.867s-2.117s. 50% chance to include bit $40
        timer     = $30 | (_RAND>>1);
        sub_state = SUB_STATE_MOVEX;
        // counter = (counter+1)&$FF;
        
        
        break;
    }
    
    
    
    
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    case SUB_STATE_MOVEX:
    {
        // 996C
        if (1) // MOD.  Prevent moving out of solids.
        {
            var _X  = x + (ww_ * hspd_dir) + hspd_dir;
            // var _X  = x + sim_pos_change(hspd, hspd_sub);
            //     _X += (ww_ * hspd_dir) + 1;
            var _Y  = y + hh_ + 1;
            
            if(!g.dg_RmTile_solid[# _X>>3, _Y>>3])
            {
                timer = 0; // Force SUB_STATE_SBMRG
            }
            else
            {
                updateX();
            }
        }
        else
        {
            updateX();
        }
        
        
        if (timer) break;
        
        
        timer     = $20; // 0.533s
        sub_state = SUB_STATE_SBMRG;
        // counter = (counter+1)&$FF;
        
        
        break;
    }
    
    
    
    
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    case SUB_STATE_SBMRG:
    {
        // 997C
        if (timer)
        {
            if (timer & 1)
            {
                set_xy(id, x, y+1);
            }
            
            break;
        }
        
        
        // $30-3F: 0.800s-1.050s
        // $70-7F: 1.867s-2.117s. 50% chance to include bit $40
        timer     = $30 | (_RAND>>1);
        sub_state = SUB_STATE_NEWXY;
        // counter = (counter+1)&$FF;
        
        
        break;
    }
}







/*
/// update_Leever()


var _RAND = rand();


// 9910: JSR DA02
GOB_update_2();

if (tmr_stun)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


// -----------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------
// 9916
if (cs & CS_BD1) enemy_collide_pc_body();



// -------------------------------------------------------------------
var _timer = timer;

switch (counter & 3)
{
    // -------------------------------------------------------------------
    
    case 0:
    {
        // 9928
        if (!_timer)
        {
            var _XX = g.camXL + _RAND;
            var _YY = LeevA_in_ground_y(_XX>>3, IN_GROUND_ROW_MIN);
            setXY(id, _XX, _YY);
            
            facing_dir = dir_to_pc(id);
            hspd = ($10 * facing_dir)&$FF;
            
            timer = $50; // 1.333s
            
            
            counter=(counter+1)&$FF;
        }
        
        break;
    }
    // -------------------------------------------------------------------
            
    case 1:
    {
        // 9950
        if (_timer)
        {
            if (_timer < $1A && !(_timer & 1))
            {
                setXY(id, xx, yy-1);
            }
        }
        else
        {
            // $30-3F: 0.800s-1.050s
            // $70-7F: 1.867s-2.117s. 50% chance to include bit $40
            timer = $30 | (_RAND >>1);
            
            
            counter=(counter+1)&$FF;
        }
        
        break;
    }
    // -------------------------------------------------------------------
    
    case 2:
    {
        // 996C
        updateX();
        
        if (!_timer)
        {
            timer = $20; // 0.533s
            
            
            counter=(counter+1)&$FF;
        }
        
        break;
    }
    // -------------------------------------------------------------------
    
    case 3:
    {
        // 997C
        if (_timer)
        {
            if (_timer & 1) setXY(id, xx, yy+1);
        }
        else
        {
            // $30-3F: 0.800s-1.050s
            // $70-7F: 1.867s-2.117s. 50% chance to include bit $40
            timer = $30 | (_RAND >>1);
            
            
            counter=(counter+1)&$FF;
        }
        
        break;
    }
    // -------------------------------------------------------------------
    
}
*/




