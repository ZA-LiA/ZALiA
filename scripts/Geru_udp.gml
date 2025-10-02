/// Geru_udp()


can_draw_self = true;

var                                    _idx  = 0;
if (ShieldHB_idx == ShieldHB_IDX_HGH)  _idx += 2;
if (hspd && cs&$4 && !(g.counter1&$8)) _idx += 1;
sprite = dl_sprites[|_idx]; // 0,1,2,3


arm     = 0;
lance1  = 0;
lance2  = 0;

if (behavior) // if attacking
{
    // Geru v2 (Red, Club)
        // behavior 1: draw back, no x variance
        // behavior 2: club fwrd, no x variance
        // behavior 3: centered on body, mostly can't see, no x variance, no xoff
        
    // Geru v1 (Orange, Lance)
        // behavior 1/4: draw back, pole only, no x variance
        // behavior 2/5: lance about 1/2 fwrd, full about midway, then 1/2
        // behavior 3/6: lance about 1/8 fwrd, about 1/4 midway, then 1/8
        
    if (ver==2 && behavior==3) // Geru red, weapon: Club
    {
        // arm & weapon behind, at side, no xoff
        armXScale = 1;
        armYScale = 1;
        Arm_xoff   = 0;
        Arm_yoff   = 6;
    }
    else
    {
        var                      _bvrXOff =  1;
        if (isVal(behavior,1,4)) _bvrXOff = -1;
        
                                 Arm_xoff = armXOff1; // 8
        if (isVal(behavior,2,5)) Arm_xoff = armXOff2; // 6
        if (isVal(behavior,3,6)) Arm_xoff = armXOff3; // 2
        
        if (ver==2 
        ||  inRange(timer,3,8) )
        {                        Arm_xoff = Arm_xoff<<1; }
        
        Arm_xoff  *= _bvrXOff;
        Arm_yoff   = -8;
        
        armXScale = -_bvrXOff;
        armYScale = -_bvrXOff;
    }
    
    
    Arm_xoff  *= facing_dir;
    armXScale *= facing_dir;
    
    
    if (ver==1)
    {
        if (behavior>=4) Arm_yoff += 8;
        
        armXScale *= -1;
        armYScale  =  1;
                                  lance1 = spr_Lance_1B; // pole
        if (!isVal(behavior,1,4)) lance2 = spr_Lance_1A; // head
    }
    else
    {
        if (ver==2 && behavior==3) arm = spr_Mace1;
        else                       arm = spr_Geru_Arm1;
    }
}




