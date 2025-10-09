/// update_out_of_bounds_fail_safe()


if (global.pc.state != global.pc.state_NORMAL) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

var _DIST=$10<<3;
//var _DIST=$8<<3;
if(!wINw(global.pc.xl,global.pc.ww, -_DIST,rm_w+(_DIST<<1)) 
||  global.pc.yt > rm_h+PAGE_H )
{
    rm_restart();
}




