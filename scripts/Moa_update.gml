/// Moa_update()


// DACF
if (stun_timer)
{
    GOB_update_2();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
// DAD2: JSR DE54
GOB_update_2a();


// DAD5
if (ver==1 
|| !NEED_CROSS 
||  f.items&ITM_CROS )
{
    update_EF11();
}


// DAE4
if (cs&CS_BD1) enemy_collide_pc_body();



var _HSPD = hspd;

facing_dir  = dir_to_pc(id);
if (1)
{
    hspd += global.pc.hspd + DC91_carry(id);
    hspd  = hspd + ((8*facing_dir)&$FF) + (hspd>$FF);
    hspd &= $FF;
}
else
{
    var _carry = DC91_carry(id);
    hspd  += global.pc.hspd + _carry;
    _carry = hspd > $FF;
    hspd  &= $FF;
    hspd   = hspd + ((8*facing_dir)&$FF) + _carry;
    hspd  &= $FF;
}
updateX();

hspd      = _HSPD;
facing_dir = hspd_dir;



// DB02
if(!counter)
{
    if(!timer)
    {
        counter = 1;
        hspd_impel_dir = facing_dir;
        
        var _DIST = yt - g.view_yt_og;
        
        if (_DIST <  $48    // OG: $28 below HUD
        ||  _DIST >= $C8 )  // OG: $20 above view btm
        {
            if (_DIST >= $C8) vspd = byte(-$08);
            else              vspd = byte( $08);
        }
        else
        {
            if (rand()&$1)    vspd = byte(-$08);
            else              vspd = byte( $08);
        }
    }
}
else
{   // DB2D
    updateY();
    
        hspd  = (hspd + -hspd_impel_dir)&$FF;
    if (hspd == ($20  * -hspd_impel_dir)&$FF)
    {   // DB47
        counter = 0;
        timer   = $20; // 0.533s
    }
        hspd_dir = byte_dir(hspd);
}




