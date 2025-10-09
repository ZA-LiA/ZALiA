/// PC_update_SwordHB_xy()

// *** Users: PC, ShadowBoss,  ***


// BIT_ATK1    = $01; // BVR_ATK1. high stab
// BIT_ATK2    = $02; // BVR_ATK2. low  stab
// BIT_ATK3    = $04; // BVR_DWTH. down thrust
// BIT_ATK4    = $08; // BVR_UPTH. up   thrust
// BIT_ATK5    = $10; // BVR_
// BIT_ATK6    = $20; // BVR_
// BIT_ATK7    = $40; // BVR_
// BIT_ATK8    = $80; // BVR_

// EC19
SwordHB_collidable = false;

// EC7F

var                                      _bits  = 0;
if (behavior==global.pc.behavior_STAB_STAND)  _bits |= BIT_ATK1; // $01. high stab
if (behavior==global.pc.behavior_STAB_CROUCH) _bits |= BIT_ATK2; // $02. low  stab
if (behavior==global.pc.behavior_STAB_DOWN)   _bits |= BIT_ATK3; // $04. down thrust
if (behavior==global.pc.behavior_STAB_UP)     _bits |= BIT_ATK4; // $08. up   thrust

if (id==global.pc) attack_bits =              _bits;

if(!_bits) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



// -------------------------------------------------------------------------
if(1)
{                        var _xOff  =  0;
         if (_bits&BIT_ATK1) _xOff  =  4 + (20*xScale); // stab high
    else if (_bits&BIT_ATK2) _xOff  =  4 + (20*xScale); // stab low
    else if (_bits&BIT_ATK3) _xOff  =  8;               // down thrust
    else if (xScale)         _xOff  = 12;               // up   thrust right
    else                     _xOff  =  0;               // up   thrust left
    
                         var _yOff  =  0;
         if (_bits&BIT_ATK1) _yOff  =  0; // stab high
    else if (_bits&BIT_ATK2) _yOff  = 16; // stab low
    else if (_bits&BIT_ATK3) _yOff  = 33; // down thrust
    else                     _yOff  = -4; // up   thrust
    
    if (id==global.pc 
    &&  is_cucco 
    &&  _bits&(BIT_ATK2|BIT_ATK3) )
    {                        _yOff -= 16;  }
    
    
    // swrdX_base not used if g.use_wide_view
    SwordHB_x_base = (view_xl_dist_og+_xOff) &$FF;
    SwordHB_y_base =               yt+_yOff;
    
    
    SwordHB_collidable = inRange(xl+_xOff, viewXL(), viewXR()-1);
}
else
{   // This check simulates OG.
    // (SwordHB_collidable = false;) only occurs when pc is 
    // close enough to cam left edge, is facing left, and 
    // doing the right attack. If the initial swrdX offsets, 
    // calculated right before this in update_swrdXY, added 
    // to xx is left of cam.
    SwordHB_collidable = true;
    
    if(!xScale 
    &&  attack_bits&(BIT_ATK1|BIT_ATK2|BIT_ATK4) ) // if high stab, low stab, upthrust
    {
        if ((attack_bits& BIT_ATK4           && x-viewXL()<$08)  // if upthrust AND close enough to camXL
        ||  (attack_bits&(BIT_ATK1|BIT_ATK2) && x-viewXL()<$18) )// if stabbing AND close enough to camXL
        {
            SwordHB_collidable = false;
        }
    }
}




