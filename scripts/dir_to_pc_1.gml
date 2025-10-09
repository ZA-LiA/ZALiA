/// dir_to_pc_1()

// In OG, if this instant's spawn happens in go_spawn_enter_room(), 
// facingDir here always comes to -1 bc PC's xy are default 0 and 
// haven't been set yet. I have changed it so that PC's xy are 
// set on Room_Start frame.
// This script simulates OG, keeping PC xy set to PC spawn xy


if(!global.pc.state)
{
    var _PC_X = global.pc.x;
    var _PC_Y = global.pc.y;
    set_xy(global.pc, global.pc.ww_,global.pc.hh_);
    var _DIR = dir_to_pc_(id);
    set_xy(global.pc, _PC_X,_PC_Y);
    return _DIR;
}


return dir_to_pc_(id);




