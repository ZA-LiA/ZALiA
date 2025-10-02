/// Tektite_update()


// 9805
if (stun_timer)
{   // DE40
    GOB_update_2();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
// 9808
var _RAND = rand();

update_EF11();

var _yt_PREV = yt;





// 980B. -------------------------------------------------------------------
// var _val = vspd&$2; // 2,3,6,7,A,B,E,F.  3,7,B,F.  C5,C7,C9,CB,CD,CF, D1,D3,
if (vspd&$2  // every 4 frames in the air
|| !vspd )   // every frame on the ground(vspd will NOT hit $00 while in air, it will be $FF, then $01)
{
    if ( counter == $10)
    {    counter  = $F1;  }
    else counter  = (counter+1)&$FF;
    
    
    // 9820. -------------------------------------------------------------------
    if (counter==$F8 
    && !(_RAND&$1) 
    &&  cs&$4 )
    {   // --- JUMP -----
        vspd = $C5;
        set_xy(id, x,y-1);
    }
}



// 9837. -------------------------------------------------------------------
GO_update_cs();



// 9B45. -------------------------------------------------------------------
var _carry = 0;

if (cs&$4 
&&  vspd<$80 )
{   // 9B50.  Landing ------------
    solid_clip_correction(vspd && vspd<$80);
    vspd = 0;
}
else
{   // 9B53.  Moving Vertical -----------
    _carry = updateY();
}

// MOD. Prevent clip into ceiling
GO_vspd_update1(); // if (cs8() && vspd&$80) vspd=$0;


// 983A
var _facingDir_COPY = facing_dir;
if(!vspd)
{
    facing_dir = dir_to_pc( id);
    _carry    = DC91_carry(id);
}

if (vspd 
|| !(cs&$4) )
{
    if (vspd) hspd = ($10 * _facingDir_COPY) &$FF;
    else      hspd = ($10 *  facing_dir)      &$FF;
    
    _carry = updateX();
}






// 985C. -------------------------------------------------------------------
if(!(g.counter1&$3F) 
&& !(_RAND&$1) )
{   // 9869
    if (avail_uidx_goc(MAX_GOC1)!=UIDX_NULL)
    {   // Create Bullet2, pID $11
        GOC1_create(xl,_yt_PREV, facing_dir, projectile,projectile_ver, id, global.PI_MOB_RED); // PI_MOB2: red
    }
    else
    {
        _carry = 1;
    }
}





// 987F. -------------------------------------------------------------------
if ((counter+8+_carry)&$FF >= $10) BodyHB_idx = BODY_HB_IDX_SHRT; // short
else                               BodyHB_idx = BODY_HB_IDX_TALL; // tall

if (yt < cam_yb_max()+$18)
{
    GOB_update_2a(); // DE54 & DE63 collision
    
    if(!pc_sword_collided_solid_body 
    &&  cs&CS_BD1 )
    //if (!(ocs&$FC) && !pc_sword_collided_solid_body)
    {
        enemy_collide_pc_body();
    }
}
else
{   // DD3D
    GOB_despawn(id);
}




