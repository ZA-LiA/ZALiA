/// Spawner_Grunt_update()


if (g.counter1&$7F) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
if (available_update_idx_gob(MAX_GOB1)==UIDX_NULL) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!

var         _count  = 0;
with(MoblB) _count += sign(state);
if (_count>=6) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!


// ---------------------------------------------------
// 9B48
with(enemy_spawn_2(MoblB,1))
{
    is_from_spawner = true;
    
    if ((g.view_at_rm_edge&$3) & dir8b(x>viewXC())) // If spawning on same side of rm edge
    {   // MOD. Stop spawns at edge of rm
        var _X = viewXC() - (x-viewXC());
        set_xy(id, _X,y);
    }
    
    // 9939
    HP_IDX = $02; // g.dl_HP_DEFAULT[|$02] = $02
    hp     = g.dl_HP[|HP_IDX];
    
    hspd = ($10*facing_dir) &$FF;
    set_xy(id, x, viewYT()+$A8);
}




