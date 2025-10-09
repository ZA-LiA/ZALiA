/// Elevator_update_1()


var _i, _x;
var _dir = 0;
var _ELEVB = TYPE=="B";

            global.pc.ogr  = 0;
            global.pc.vspd = 0;
if (_ELEVB) global.pc.hspd = 0;

var                           _DIR_RQST = Input.vHeld;
if (_ELEVB)                   _DIR_RQST = moving_dir;

if (g.EnterRoom_control_timer){
    if (g.exit_enter.side&$3) _DIR_RQST = (g.exit_enter.side&$3)^$3;
    if (g.exit_enter.side&$C) _DIR_RQST = (g.exit_enter.side&$C)^$C;
}


var _PC_CS  = global.pc.cs&$F;
for(_i=(ww>>3)-1; _i>=0; _i--)
{
    _x=(xl+4) + (_i<<3);
    if (collide_solid_grid(_x,yt+8)&$FF == TID_SOLID1)
    {
        _PC_CS|=$8; // So cucco can't get under elevator. Cucco's csTop is shorter and elevator can go too high, leaving gap under it.
        break;
    }
}



var               _DIR_MOVE  = 0;
if (_DIR_RQST&$3) _DIR_MOVE |= (_DIR_RQST&$3) ^ ((_PC_CS&$3) & (_DIR_RQST&$3));
if (_DIR_RQST&$C) _DIR_MOVE |= (_DIR_RQST&$C) ^ ((_PC_CS&$C) & (_DIR_RQST&$C));


hspd = (abs8b(hspd1) * bit_dir(_DIR_MOVE&$3)) &$FF; // hspd1=$18
vspd = (abs8b(vspd1) * bit_dir(_DIR_MOVE&$C)) &$FF; // vspd1=$18

if(!hspd 
&& !vspd )
{
    _DIR_MOVE = 0;
}


var _X_PREV = x;
var _Y_PREV = y;

if (_DIR_MOVE)
{   // D8ED
    if (_DIR_MOVE&$3 && hspd) updateX();
    if (_DIR_MOVE&$C && vspd) updateY();
    
    
    if (g.rm_name!=Area_MazIs+'F8') // For the "Lost Dungeon" YouTube vid
    {
        if (0)
        {   // 2023/11/07. Trying to fix audio timings.
            // This definitely does NOT sound right.
            aud_play_sound(get_audio_theme_track(dk_ElevatorMove));
        }
        else
        {   // This sounds better but still has issues.
            if(!audio_is_playing(get_audio_theme_track(dk_ElevatorMove)))
            {   aud_play_sound(  get_audio_theme_track(dk_ElevatorMove));  }
        }
    }
}




// D8F4
var _C1 = _DIR_MOVE || !_DIR_RQST;
var _C2 = _ELEVB && g.pc_lock&PC_LOCK_HSPD;

if (_C1)
{
        _dir = 0;
    
    var _DIFF  = (x+pc_xoff) - global.pc.x;
    if (_DIFF != 0 
    &&  _C2 )
    {
        global.pc.x_change = _DIFF;
        _dir  =    sign(_DIFF);
    }
    
    
        _DIFF  = (yt+hh-8) - (global.pc.yt+global.pc.hh);
    if (_DIFF != 0) 
    {
        global.pc.y_change = _DIFF;
        _dir  =    sign(_DIFF);
    }
    
    
    // (x!=_X_PREV || y!=_Y_PREV): added to prevent chains from 
    // moving on frame PC steps onto elevator(bug happens when PC steps 
    // on and off elevator 4 times without the elevator moving)
    if (_dir!=0 
    &&  (x!=_X_PREV || y!=_Y_PREV) )
    {
        var _TIMING = (4<<CHAIN_TIMING)-1; // 3, 7, $F, $1F, ..
        chain_yoff_1  = (chain_yoff_1-_dir) & _TIMING;
        chain_yoff_2  =  chain_yoff_1       ^ _TIMING;
    }
}


var      _X = global.pc.x;
if (_C2) _X = x  + pc_xoff;
var      _Y = yt + hh - 8 - global.pc.hh_;
set_xy(global.pc, _X,_Y);




if (g.EnterRoom_control_timer)
{
    var _C3 = 0;
    if(!_C1)
    {
        switch(g.exit_enter.side&$F){
        case $1:{_C3=_PC_CS&CS_LFT; break;} // From RGT exit, moving LFT
        case $2:{_C3=_PC_CS&CS_RGT; break;} // From LFT exit, moving RGT
        case $4:{_C3=_PC_CS&CS_TOP; break;} // From BTM exit, moving UP
        case $8:{_C3=_PC_CS&CS_BTM; break;} // From TOP exit, moving DWN
        }
    }
    else
    {
        var _OFFSET = 8;
        switch(g.exit_enter.side&$F){
        case $1:{_C3 = xr <= cam_xr_max()-_OFFSET; break;} // From RGT exit, moving LFT
        case $2:{_C3 = xl >= cam_xl_min()+_OFFSET; break;} // From LFT exit, moving RGT
        case $4:{_C3 = yb <= cam_yb_max()-_OFFSET; break;} // From BTM exit, moving UP
        case $8:{_C3 = yt >= cam_yt_min()+_OFFSET; break;} // From TOP exit, moving DWN
        }
    }
    
    if (_C3) g.EnterRoom_control_timer = 0;
}




