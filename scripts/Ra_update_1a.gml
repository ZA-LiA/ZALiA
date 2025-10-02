/// Ra_update_1a(cam is at room edge)


// BA2B: JSR B9F4, ACE5: JSR ACAD, 966D: JSR 963B
if (1)
{
    var            _DIR = g.pc.hspd_dir;
    if (argument0) _DIR = sign_(argument0&$2);
    
    var            _X  = viewXL() + ww_;
    if (_DIR)      _X  = viewXR() - ww_ - 1;
                   _X += SPAWN_YOFF <= (g.pc.yt&$FF); // carry
    if (argument0) _X  = viewXC() + ((viewW_()+$10) * _DIR);
    //if (argument0) _X += $10 * sign_(_X>viewXC());
    //
    var            _Y  = (g.pc.yt+hh_) - SPAWN_YOFF;
    
    set_xy(id, _X,_Y);
    
    facing_dir   = dir_to_pc(id);
    hspd        = (HSPD*facing_dir) &$FF;
    //hspd        = (HSPD * -_DIR) &$FF;
    
    vspd        = 0;
    vspd_change = VSPD_CHANGE; // 2
}
else
{   // OG
    var                _yt  = ((g.pc.yt&$FF) - SPAWN_YOFF) & $FF;
    
    var                _xl  = viewXL();
    if (g.pc.hspd_dir) _xl  = viewXR()-$11;
                       _xl += (SPAWN_YOFF <= (g.pc.yt&$FF)); // carry
                       // _xl += ((g.pc.yt&$FF) > ((g.pc.yt&$FF) + $10 + SPAWN_YOFF)); // carry
    //
    // var                _xl  = g.camXL;
    // if (g.pc.hspd_dir) _xl += $EF;
                       // _xl += ((g.pc.yt&$FF) > (g.camYT-8 + SPAWN_YOFF)); // carry
    
    set_xlyt(id, _xl,_yt);
    
    hspd        = (HSPD * -g.pc.hspd_dir) &$FF;
    
    vspd        = 0;
    vspd_change = VSPD_CHANGE; // 2
    
    facing_dir   = dir_to_pc(id);
}




