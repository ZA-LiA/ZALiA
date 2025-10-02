/// Spawner_Bago_update()


if (g.counter1&$7F) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
if (available_update_idx_gob(MAX_GOB1)==UIDX_NULL) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!

var         _count  = 0;
with(BagoA) _count += sign(state);
//with(BagoA) _count += state==state_NORMAL;
if (_count>=6) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
//if (instance_number(BagoA)>=6) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!


// ---------------------------------------------------
var _DIR = -sign_(rand()&$1);

// WIDE VIEW
var _X = (viewXC() + (viewW_()*-_DIR) + (8*_DIR)) - 8;
var _Y =  viewYB() - $18;
/*  OG
var _X =  g.camXL    + (($10*_DIR)&$FF);
var _Y = (g.camYT-8) + $D0;
*/

var _VER = 1 + (g.area_name==Area_PalcG);

with(GameObject_create(_X,_Y, BagoA,_VER, -1, palidx))
{
    is_from_spawner = true;
    
    facing_dir = _DIR;
    hspd      = (HSPD2*facing_dir) &$FF; // $20: Launch speed
    vspd      =  VSPD1; // $C0: Launch speed
    
    // D7CE
    HP_IDX = $03; // g.dl_HP_DEFAULT[|$03] = $03
    hp     = g.dl_HP[|HP_IDX];
    
    if (other.ver==2) GO_depth_init(DEPTH_ENEMY);
    
    
    if (instance_exists(PlatformRaft) 
    &&                  PlatformRaft.hspd 
    && !(g.view_lock&$3) 
    &&  viewXL()>0 
    &&  viewXR()<g.rm_w )
    {
        if (facing_dir==PlatformRaft.hspd_dir)
        {   set_xy(id, PlatformRaft.x + ($80*-facing_dir), y);  }
        else hspd = ($18*facing_dir) &$FF;
    }
}




