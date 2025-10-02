/// Spawner_Bullet_update()


// 9BDD
if (ocs               // if NOT on screen
||  g.counter1&$1F    // if NOT the 32nd frame. 32 frames = 0.533s
|| !is_facing_pc(id)  // if NOT facing PC
||  abs(g.pc.x-x) > $1C<<3  // mod
||  avail_uidx_goc(MAX_GOC1)==UIDX_NULL )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


// ---------------------------------------------------------------------------
var _DIR  = sign_(g.pc.x-x);

var _IDX  = goDist1();
if (_IDX &  $80) 
{   _IDX ^= $FF;  }
    _IDX  = (_IDX + $EB + (_DIR>=facing_dir)) &$FF;
    _IDX  = _IDX>>4;
//
if (_IDX&$8) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!


// ---------------------------------------------------------------------------
var _XL = xl+4;
var _YT = yt+5;
with(GOC1_create(_XL,_YT, _DIR, projectile,projectile_ver, id, global.PI_MOB_BLU))
{
    is_from_spawner = true;
    
    if (facing_dir)
    {    hspd = other.dg_SPEEDS[#_IDX,0];  }
    else hspd = other.dg_SPEEDS[#_IDX,0]^$FF;
    
         vspd = other.dg_SPEEDS[#_IDX,1];
}




