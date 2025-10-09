/// walk_pc_to_x(x, max hspd)


with(global.pc)
{
    if (x==argument0)
    {
        return true;
    }
    
    // ------------------------------------------------------
    var _DIR = -sign(x-argument0);
    
    xScale = _DIR;
    
    
    if (hspd != (argument1*_DIR)&$FF)
    {
        // Couldn't figure out right way so converting
        var     _HSPD_TARG = argument1   * _DIR; // Target hspd
        var     _HSPD_CURR = abs8b(hspd) * byte_dir(hspd); // Current hspd
        hspd = (_HSPD_CURR + -sign(_HSPD_CURR-_HSPD_TARG)) &$FF;
    }
    
    
    hspd_dir = byte_dir(hspd);
    
    updateX();
    
    if (_DIR != -sign(x-argument0)) // if overshot x
    {
        set_xy(id, argument0,y);
    }
    
    PC_update_walk();
    
    //with(g) update_Camera_1a(); // Commented out 2022/01/28 to fix camera minigame bug
    return false;
}




