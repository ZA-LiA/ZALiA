/// Lowder_update()


if (stun_timer)
{
    GOB_update_2();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// ------------------------------------------------------
// ------------------------------------------------------
// ------------------------------------------------------
// 98C3, 98C6
if (cs&CS_BD1) enemy_collide_pc_body();

var _cs_COPY = cs;
GO_update_cs();


GOB_update_2();



// 98CC
var    _HSPD = hspd;
hspd = (hspd<<is_facing_pc(id))&$FF;
updateX();
hspd = _HSPD;



// ----------------------------------------------------------------------------
// MODDED. See update_Lowder_OG for unmodded
// 98E6
var _C1a = g.pc.yt+$10>=yt;               // qualify aggro
//var _C1b = _C1a;                            // Testing. can walk off edge
var _C1b = g.pc.yt-$08>=yt && ver==2;     // qualify walk off edge
var _C2a =   _cs_COPY&$4  && !(cs&$4);  // is at edge of ground
var _C2b = !(_cs_COPY&$4) && !(cs&$4);  // is falling
var _C3a = xl<cam_xl_min() || xr>cam_xr_max();  // is past edge of room

if (cs&$4)
{
    solid_clip_correction(vspd && vspd<$80);
    vspd = 0;
}
else if (_C2b || (_C2a && _C1b)) // is falling OR (at ground edge && qual walk off edge)
{
    updateY2($20, 3);
}



// Turn around
if (cs&$3 
|| (_C2a && !_C1b)  // is at edge of ground && NOT qualify walk off edge
||  _C3a )          // is past edge of room
{   // 9921
    facing_dir = -facing_dir;
    hspd      = byte_negate(hspd);
    
    // update x twice
    updateX();
    updateX();
}
// Aggro
else
{
    if (_C1a    // qualify aggro
    && !timer 
    &&  cs&$4 )
    {   // 98F4
        facing_dir = dir_to_pc(id);
        hspd      = (8*facing_dir) &$FF;
        
        timer = $A0; // $A0 = 160 = 2.667s
    }
}




