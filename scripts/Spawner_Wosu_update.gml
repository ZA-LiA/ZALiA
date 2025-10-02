/// Spawner_Wosu_update()


// B343: JSR B861
if (g.counter1&$7F   // every 128 frames: 2.133s
||  g.view_at_rm_edge&$3 
||  instance_number(WosuA)>=4 )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
}

var         _count  = 0;
with(WosuA) _count += sign(state);
if (_count>=4) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
//if (instance_number(WosuA)>=6) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!


// ---------------------------------------------------
var _RAND = rand();

var _YT = get_ground_y(g.rm_w_,GROUND_Y_BASE, -1,GROUND_Y);
with(enemy_spawn_1(WosuA,1))
{
    is_from_spawner = true;
    
    set_xlyt(id, xl, _YT-hh-$08);
    //set_xlyt(id, xl, viewYT() + $A8); // OG reference
    
    if (_RAND&$2) hspd = ($14*facing_dir) &$FF;
    else          hspd = ($0C*facing_dir) &$FF;
}




