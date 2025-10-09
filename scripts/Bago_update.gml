/// Bago_update()


if(!stun_timer 
&& !ocsH1(id) ) // if NO w in ocs area
{
    state = 0;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


if (stun_timer)
{   // DE40
    GOB_update_2();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// ----------------------------------------------------------------------
// D7E4, D7F1
if (cs&CS_BD1) enemy_collide_pc_body();



// D7F4
var _carry = 0;


if (vspd<$80   // NOT moving up
&&  cs&$4 )    // btm on ground
{   // D803
    if(!has_landed) 
    {
        facing_dir = dir_to_pc(id);
        solid_clip_correction(true);
    }
    
    has_landed = true;
    
    hspd = (HSPD1*facing_dir) &$FF; // $10.  hspd $20 until first landing
    vspd = 0;
}
else // vspd & $80 || !cs4()
{   // D812
    has_landed = false;
    
    // vspd at launch is $C0
    // vspd    = byte(vspd+1);
    _carry = updateY();
}




// D818
if(!timer 
&&  byte(byte(yt)-byte(global.pc.yt)+_carry) < $11 )
{   // D825
    timer = $70; // $70: 1.867s
    
    if (rand()<$80 
    &&  is_facing_pc(id) )
    {
        with(GOC1_create(xl,yt, facing_dir, projectile,projectile_ver))
        {
            GO_depth_init(other.depth);
        }
    }
}



// D832
updateX();
GO_update_cs();
GOB_update_2();




