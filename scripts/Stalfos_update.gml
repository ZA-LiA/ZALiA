/// Stalfos_update()



// ---------------------------------------------------------------------------
// 965A
if(!counter 
&& !wINwAll(xl,ww, g.view_xl_og,VIEW_W_OG) )
//&&  ocs ) // OG
{   // 9662
    update_EF11();
    set_xlyt(id, xl,spawn_y);
    hspd = 0;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}






// ---------------------------------------------------------------------------
// 966B
counter = 1; // Signafies Stalfos has detached from chain


// ---------------------------------------------------------------------------
facing_dir = dir_to_pc(id);
update_EF11();





// ---------------------------------------------------------------------------
// 9675
if (GOB_shield_collision_1a())
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}











// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
// behavior:   0:idle, 1:drawback, 2:stab, 3:downstab
var _behavior_COPY = behavior;
var _timer_COPY    = timer;





// -----------------------------------------------------------------------
// 9678
if(!_timer_COPY)
{
    if (behavior) // Last frame of   1:drawback, 2:stab, 3:downstab
    {   // BC23
        if ( behavior==1)     // 1:drawback
        {    behavior =2;  }  // 2:stab
        else behavior =0;     // 0:idle if behavior == 2:stab OR 3:downstab
        
        timer = $F; // $F: 0.250s
    }
    
    
    
    if (_behavior_COPY&$1) // Last frame of   1:drawback OR 3:downstab
    {   // 968F, BDEF
        facing_dir = dir_to_pc(id);
        update_EF11();
        
        // 9692: JSR E563: JSR E5F3
        if(!GOB_sword_collision_2a()) // handles SHIELD collision check & reaction
        {   // E579: JSR E5F3
            GOB_sword_collision_1a(); // handles BODY collision check & reaction
        }
    }
    
    
    
    
    
    
    // 9678.  behavior:   0:idle, 1:drawback, 2:stab, 3:downstab
    if (_behavior_COPY==2) // Last frame of   2:stab
    {
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}









// -----------------------------------------------------------------------
// 9695
// MOD: Set Stalfos prop data for sword vulnerability (react_swrd) 
//      invulnerable to upthrust. This way, PC's sword will 
//      still be collidable w/ other objs.
if(!g.mod_STALFOS_CONTROL1)
{
    with(g.pc){if (behavior==behavior_STAB_UP) SwordHB_collidable = false;} // OG
}







// -----------------------------------------------------------------------
// 96A0
GO_update_cam_vars();


if (GOB_is_out_of_bounds_y(id)) // Same as OG: if (yy > $FF)
{   // DD3D
    GOB_despawn(id);
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


GOB_update_2a(); // DE54 & DE63 collision







// -------------------------------------------------------------------
// 96C9
updateY();





// -------------------------------------------------------------------
GO_update_cs();



// -------------------------------------------------------------------
if (cs&CS_BD1) enemy_collide_pc_body();



// -------------------------------------------------------------------
facing_dir = dir_to_pc(id);




// -------------------------------------------------------------------
// 96D5
var _cs4_COPY    = cs&$4;
var _hspdPB_COPY = hspd_pushback;
var _PC_DIST     = goDist1();




if (cs&$8) vspd = 2;

if (cs&$4)
{
    hasDroppedFromSpawn = $4; // 04A0,X = $4. Used by udp
    
    // 96E9: JSR 9E17
    GOB_update_1(true); // update hspdPB
    
    //GO_update_cs();
    if (_hspdPB_COPY) GO_update_cs();
}




// 9E2C
if!(cs&$3) updateX();





// ---------------------------------------------------------------
if (_cs4_COPY)
{   // 96EC
    solid_clip_correction(vspd && vspd<$80);
    vspd = 0;
    hspd = 0;
    
    
    var _DIST = $1E;
    
    var               _val = _PC_DIST;
    if (_hspdPB_COPY) _val = $60;
    
    if ((_val+_DIST)&$FF >= _DIST<<1)
    {   // 96F9.  WHY IS LEFT FASTER THAN RIGHT???
        if (facing_dir) hspd = $0A; //  10
        else           hspd = $F2; // -14
    }
    else
    {
        if(!timer 
        && !vspd 
        && !behavior ) // 0:idle
        {
                _val = rand()&$3;
            if (_val 
            ||  ver==$1 ) // Stalfos red
            {   // 9723, BC23
                behavior = _val<$3; // 0:idle, 1:drawback
                timer = $F;         // $F: 0.250s
            }
            else
            {   // 971B
                vspd = $CD; // JUMP!!
                
                // 96F9
                if (facing_dir) hspd = $0A;
                else           hspd = $F2;
            }
        }
    }
}




