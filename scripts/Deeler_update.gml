/// Deeler_update()


// D6DF: JSR DA02
if (stun_timer)
{
    GOB_update_2();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


// ------------------------------------------------------------------------------
// D6E2: JSR D6C1
if (cs&CS_BD1) enemy_collide_pc_body();



// ------------------------------------------------------------------------------
var _RAND = rand();

// D6E5
if (counter<$80) // if has NOT dropped
{   // D6EC
    facing_dir = dir_to_pc(id);
    
    var _IN_DIST_ATK = abs(g.pc.x-x) + DC91_carry(id)<$40 + ww_;
    var _C1 = _IN_DIST_ATK && !(_RAND&$1F) && !ocs;
    
    
    if (counter 
    ||  _C1 )
    {   // D70F
        if(!counter) counter = 1; // 1: move down
        
        var             _targetY = targetY_dw; // home Y + hangDist
        if (counter==2) _targetY = targetY_up; // home Y
        
        if (yt==_targetY  // if at home Y
        &&  counter==2 )  // 2: climbing up
        {
            counter =0; // idle
        }
        else
        {
            // mod
            var _qual_drop = false;
            
            if (yt==_targetY 
            ||  cs&$4 )
            {
                counter = 2; // 2: climbing up
                _qual_drop = true;
            }
            
            
            if (ver==2 
            &&  _qual_drop )
            {   // D734 - Drop
                counter = $80;
                hspd    = 0;
                vspd    = $20;
                timer   = $20;
            }
            else
            {   // D744
                if (counter==2) vspd = $F0; // 2: climbing up
                else            vspd = $20;
                
                // D74A
                // OG
                //updateY();
                // mod
                if(!(cs&$4) 
                || counter==2 ) // 2: climbing up
                {
                    updateY();
                }
            }
        }
    }
    else
    {   // D6FB
        hspd = (8*facing_dir) &$FF;
        if!(cs&$3) updateX();
    }
    
    // mod
    GO_update_cs();
    // DE40
    GOB_update_2();
}






// ------------------------------------------------------------------------------------
if (counter&$80) // if has dropped
{   // D750
    if(!timer) // if can JUMP
    {   // =-----------  JUMP  -------------------
        timer = $40 | (_RAND&$3F);
        facing_dir = dir_to_pc(id);
        
        hspd = ($20*facing_dir) &$FF;
        vspd = $E8 | (_RAND&$7);
    }
    
    
    // D773
    // mod
    if!(cs&$3) updateX();
               updateY();
    //
    vspd = (vspd+1)&$FF;
    
    GO_update_cs();
    
    // mod
    if (cs&$8) vspd = 1;
    
    GOB_update_2();
    
    // D77F
    if (cs&$4)
    {   // DAC1
        solid_clip_correction(false);
        vspd = 0;
        // D788
        hspd = 0;
    }
}




