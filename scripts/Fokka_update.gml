/// Fokka_update()

// v1 Red, v2 Blue


var _RAND = rand();


// 9D2C
update_EF11();

// ---------------------------------------------------------------------------------------
// BVR_IDLE = 0; // idle
// BVR_DRWH = 1; // draw high
// BVR_ATKH = 2; // stab high
// BVR_DRWL = 3; // draw low
// BVR_ATKL = 4; // stab low
// BVR_THRW = 5; // throw

// 9D2F
if (behavior) // if attacking
{
    if (behavior==BVR_ATKH 
    ||  behavior==BVR_ATKL )
    {   // 9D37
        if (abilities&ABL_SHOT 
        &&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
        {
            var _XL = xl;
            var _YT = yt + ($A * (behavior==BVR_ATKL));
            GOC1_create(_XL,_YT, facing_dir, projectile,projectile_ver);
            behavior = 0;
        }
        
        // GOB sword collision -----------------------------------
        // 9D57: JSR E563: JSR E5F3
        if(!GOB_sword_collision_2a())  // handles PC SHIELD collision check & reaction
        {   //       E579: JSR E5F3
            GOB_sword_collision_1a();  // handles PC BODY   collision check & reaction
        }
    }
    
    
    // 9D5A
    if(!timer)
    {
             if (behavior==BVR_DRWH) behavior = BVR_ATKH;
        else if (behavior==BVR_DRWL) behavior = BVR_ATKL;
        else                         behavior = 0;
        
        if (behavior) timer = DUR_ATK_STAB; // $10
    }
}






// ---------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------
// 9D77,   E617. handles GOB shield collision
if (GOB_shield_collision_1a()) // if PC sword collided enemy shield
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// ---------------------------------------------------------------------------------------
// PC sword did NOT collide GOB shield --------------------------------------

// 9D7A
GO_update_cs();
GO_update_cam_vars();


// 9D83
if (yt >= cam_yb_max()+$18)
{
    GOB_despawn(id);
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// ---------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------
// 9D8E, 9DA0: JSR E48B (GOB body collision)
GOB_update_2a();
if (pc_sword_collided_solid_body)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}








// ---------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------
// 9DA9
if (cs&CS_BD1) enemy_collide_pc_body();


updateY();


if (cs&$8)
{   vspd = $10;  }

if (cs&$4)
{
    solid_clip_correction(vspd && vspd<$80);
    vspd = 0;
}



// 9DC3 JSR: 9E42
GOB_update_1(cs&$4); // update hspd_pushback

GO_update_cs();

if!(cs&$3) updateX();


// 9DC6
if (global.pc.ogr)
{
    if (global.pc.yt+5 >= yt) ShieldHB_idx = ShieldHB_IDX_LOW; // 1
    else                 ShieldHB_idx = ShieldHB_IDX_HGH; // 2
}
else if (Input.Attack_pressed)
{
    if (Input.dHeld)     ShieldHB_idx = ShieldHB_IDX_LOW; // 1
    else                 ShieldHB_idx = ShieldHB_IDX_HGH; // 2
}



// 9DE6
facing_dir = dir_to_pc(id);



if (cs&$4 
&& !(_RAND&$1F) ) // 1 in 32 chance (3.125%)
{   // 9DF8. -------------  JUMP! ---------------
    set_xy(id, x, y-1);
    hspd = (HSPD_JUMP*facing_dir) &$FF; // $18, $E8
    vspd = JUMP_VEL; // JUMP_VEL=$C8
}
else
{
    if (cs&$4)
    {   // 9E06. -------------- SET hspd -----------------
             if (global.pc.hspd)      hspd = global.pc.hspd;
        else if (g.counter1&$40) hspd =  HSPD_PACE &$FF;
        else                     hspd = -HSPD_PACE &$FF;
        
        hspd = (hspd>>1) | (hspd&$80);
    }
    
    
    // Check if can start an attack. 
    if(!(cs&$4)      // if off ground 
    || !behavior ) // if not attacking
    {   // 9E1E
        counter = (counter+1)&$FF;
        
        var         _VAL = $3F; // every 64 frames. 1.067 sec
        if (ver==2) _VAL = $1F; // every 32 frames. 0.533 sec. Fokka blue
        
        if!(counter&_VAL)
        {   // 9E29. ------------------ START ATTACK --------------------
            if (_RAND&$2) behavior = BVR_DRWL; // 3. Low
            else          behavior = BVR_DRWH; // 1. High
            
            timer = DUR_ATK_DRAW; // $18 frames. 0.400 sec
        }
    }
}




