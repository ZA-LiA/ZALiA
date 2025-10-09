/// Thunderbird_update()


// A359
if(!Boss_update_1()) // check battle start/end/qualify
{
    update_EF11();
    g.go_mgr.update_idx = g.go_mgr.UPDATE_COUNT;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



if (start_timer) // Delay 1st attack
{
    start_timer--;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
else
{   // Thunderbird_init_2 sets react_thunder=0 so 
    // THUNDER can't damage until the battle starts
    react_thunder = REACT_THUNDER;
}






// ------------------------------------------------------------
// A3CC
GO_update_cam_vars();
cs &= $F0; // So sword can't hit multiple times in 1 stab.


if (hp < HP) // if THUNDER has been cast
{
    update_body_hb_1a();
    // At least 8 of body hb need to be on screen
    if (borderInRect(8, BodyHB_xl,BodyHB_yt,BodyHB_w,BodyHB_h, viewXL(),viewYT(),viewW(),viewH()))
    {   // A3C2 - Prevent taking dmg if Link is up/downthrust
        if (global.pc.behavior!=global.pc.behavior_STAB_DOWN 
        &&  global.pc.behavior!=global.pc.behavior_STAB_UP )
        {   // E48B - Link projectiles to enemy body
            GOB_body_collide_pc_proj();
            // E677 - Link sword to enemy body
            GOB_body_collide_pc_sword();
        }
        
        if(!pc_sword_collided_solid_body)
        {   // E4D9 - Link body to enemy body
            GOB_body_collide_pc_body_1a();
        }
    }
}



// A3DB
Boss_update_5(); // check & set pending death

// A3D2: JSR EF11
update_EF11();

// A3F7: JSR A4E9
Boss_HPBar_udp();


if(!pending_death) Boss_Roar_update();



// ----------------------------------------------------------------
// A3FA
var _TIMING = $1F>>(hp<hp_CUE1); // $1F or $0F. Fireball spawn rate

if(!(g.counter1&_TIMING) 
&&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
{   // A40B: JSR DBCE.                     Fireball2, ver 2
    with(GOC1_create(xl+$C, yt, facing_dir, projectile,projectile_ver))
    {
        // _data = "02040810FEFCF8F0"; // 02,04,08,10  FE,FC,F8,F0
                                  hspd = $2 <<(g.dl_RandomOG[|2]&$3);
        if (g.dl_RandomOG[|2]&$4) hspd = (-hspd)&$FF;
        
        vspd = $F0;
        GO_depth_init(other.depth-1);
    }
}


// ----------------------------------------------------------------
// A436: JSR DEB8
updateX();
// A439: JSR DEC8
updateY();


// ----------------------------------------------------------------
// A43C
if!(g.counter1&$3)
{   // A442
    // At spawn: vspd = 8, counter = 0
    // When counter is even: vspd decrements from $10 to $F0
    // When counter is odd:  vspd increments from $F0 to $10
    if (abs8b(vspd)==$10) counter = (counter+1)&$FF; // $10,$F0
    
    if (counter&$1) vspd = (vspd+1)&$FF;
    else            vspd = (vspd-1)&$FF;
}

// A45D
if!(g.counter1&$1F)
{   // A463: JSR DC91
    facing_dir = dir_to_pc(id);
    hspd      = ($10*facing_dir) &$FF;
}




