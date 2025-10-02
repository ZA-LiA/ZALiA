/// Spawner_Moby_update()


if (g.counter1&$7F) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
if (available_update_idx_gob(MAX_GOB1)==UIDX_NULL) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!

var         _count  = 0;
with(MobyA) _count += sign(state);
if (_count>=6) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
//if (instance_number(MobyA)>=6) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!


// ---------------------------------------------------
// 9B48
with(enemy_spawn_2(MobyA,1))
{
    is_from_spawner = true;
    
    if (instance_exists(PlatformRaft) 
    &&                  PlatformRaft.hspd 
    && !(g.view_lock&$3) 
    &&  viewXL()>0 
    &&  viewXR()<g.rm_w )
    {
        if (facing_dir==PlatformRaft.hspd_dir)
        {    var _DIFF = $50 *  facing_dir;  }
        else var _DIFF = $50 * -facing_dir;
        set_xy(id, x+_DIFF, y);
    }
}




