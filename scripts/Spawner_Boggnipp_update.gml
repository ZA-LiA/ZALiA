/// Spawner_Boggnipp_update()


if (g.counter1&$7F) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
if (available_update_idx_gob(MAX_GOB1)==UIDX_NULL) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!

var            _count  = 0;
with(Boggnipp) _count += sign(state);
if (_count>=3) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
//if (instance_number(Boggnipp)>=3) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!


// ---------------------------------------------------
if (global.pc.x <=        viewW_() 
||  global.pc.x >= g.rm_w-viewW_() )
{    var _DIR = sign_(global.pc.x>g.rm_w_);  }
else var _DIR = sign_(rand()&$1);

// WIDE VIEW
var _XL = (viewXC() + (viewW_()*-_DIR) + (8*_DIR)) - 8;
with(GameObject_create(_XL,yt, Boggnipp,1, -1, palidx))
{
    is_from_spawner = true;
    sub_state = sub_state_CHARGE;
    facing_dir = _DIR;
    
    
    if (instance_exists(PlatformRaft) 
    &&                  PlatformRaft.hspd 
    && !(g.view_lock&$3) 
    &&  viewXL()>0 
    &&  viewXR()<g.rm_w )
    {
        if (facing_dir==PlatformRaft.hspd_dir)
        {   set_xy(id, PlatformRaft.x + ($80*-facing_dir), y);  }
    }
}




