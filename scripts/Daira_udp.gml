/// Daira_udp()


// 9D69
can_draw_self = true;

if (cs&$4 
&&  hspd )
{
    var                  _val = 4;
    if (byte(hspd+8)<$B) _val = 8;
    
    if (g.counter1&_val) sprite = dl_sprites[|1]; // legs open
    else                 sprite = dl_sprites[|0]; // legs closed
}
else                     sprite = dl_sprites[|0]; // legs closed


// 9DA6
Arm_sprite = 0;

if (behavior)
{
    if (behavior==3) // ver1 (Orange). Only draws axe
    {
        armXScale = 1;
        armYScale = 1;
        Arm_xoff  = 9;
        Arm_yoff  = 9;
    }
    else
    {
        var _flip, _xOff;
        
        if (behavior==2) _flip = -1;
        else             _flip =  1;
        
        if (behavior==2) _xOff =  0;
        else             _xOff =  3 * _flip;
        
        
        armXScale = -1 * _flip;
        armYScale = -1 * _flip;
        
        Arm_xoff   = -16 * _flip;
        Arm_xoff  += _xOff;
        
        Arm_yoff   = -8 + (behavior==2);
    }
    
    armXScale *= facing_dir;
    Arm_xoff  *= facing_dir;
    
    if (behavior<3) Arm_sprite = spr_Daira_Arm;
    else            Arm_sprite = spr_Axe2;
}




