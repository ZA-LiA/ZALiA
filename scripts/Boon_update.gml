/// Boon_update()


// 9989
if ((yt&$FF) < $80 
// if (yt - g.camYT < $68 
&& !(g.counter1&$1F) 
&&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
{
    with(GOC1_create(xl,yt, facing_dir, projectile,projectile_ver))
    {
        hspd = 0;
        vspd = 0;
    }
}


facing_dir = byte_dir(hspd);



if (stun_timer)
{
    GOB_update_2();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


// -------------------------------------------------------------------------------
// 99A7
GOB_update_2();
if (cs&CS_BD1) enemy_collide_pc_body();

facing_dir = dir_to_pc(id);


// -------------------------------------------------------------------------------
// 99AD
var _RESET_Y = viewYT() - hh_;

if(!counter)
{
    // Reset, pick new start position
    set_xy(id, g.view_xl_og+rand()+8, _RESET_Y);
    
    behavior = 0;
    counter  = 1;
    
    timer = $20;
}
else
{
    // 99D2.  HV2: At least 8 w & any h w/in ocs area
    if(!ocsHV2(id)) counter = 0;
    
    // 99DA.  Start moving or pick a movement dir
    if(!timer)
    {
        var        _RAND = rand();
        timer    =(_RAND&$F)|$8; // 8-15
        behavior = _RAND&$3;
    }
    
    
    // 99EF
    if (yt >= GROUND_Y-$20 
    ||  yt >= viewYB()-$30 
    ||  yt <= _RESET_Y+$50 )
    {
        // MOD. Move down to reset or torwards pc.
        if (hp) timer = 0;
        
        vspd = VSPD;
        updateY();
    }
    else
    {
        if (behavior&$2) // behavior 2,3.  Horizontal movement
        {
            hspd = (HSPD *  sign_(behavior&$1)) &$FF;
            updateX();
        }
        else            // behavior 0,1.  Vertical movement
        {
            vspd = (VSPD * -sign_(behavior&$1)) &$FF;
            updateY();
        }
    }
}




