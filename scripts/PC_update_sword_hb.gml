/// PC_update_sword_hb()


/*  About swrd hb properties ---------------------------------
swrdX_base, swrdY_base, swrd_collidable are all calculated 
and set at the very end of the game's update in update_swrdXY().
Because of this, sword hb has a 1 frame delay.

The first frame of an attack does NOT have a sword hb, but the 
frame after the attack does.

swrdY_base will lag behind while moving up and down because it's based 
off of the previous frame's PC.yt.

swrdX_base will also lag, but only when moving horizontally and the 
view isn't following pc (like in a boss battle or near the edge of a room)
*/


/*  About  g.mod_allow_bug_swrdXOff --------------------------
I beleive this can happen as long as PC is close 
to a map page's edge.

This bug causes swrd hb to be further right 
than it should. It occurs when pc.xl(pc.x-$18) is 
inside the page to PC's left. OG doesn't check which 
map page pc.xl is and thinks PC is stabbing left and 
adds an offset to the swrd hb.
It can happen for UPTHRUST,DWNTHRUST, LOW&HIGH STAB right.
*/

with(global.pc)
{
    var _DIST1 = 8;
    
    SwordHB_w_ = SwordHB_w>>1;
    SwordHB_h_ = SwordHB_h>>1;
    
    
         if (attack_bits & (BIT_ATK1|BIT_ATK2)) // high & low stab
         {                            SwordHB_xoff = ((_DIST1+SwordHB_w_)*x_scale_prev) - SwordHB_w_;  }
    else if (attack_bits &  BIT_ATK3) SwordHB_xoff =  -1 - SwordHB_w_; // down thrust
    else if (x_scale_prev)            SwordHB_xoff =   3 - SwordHB_w_; //   up thrust right
    else                              SwordHB_xoff =  -9 - SwordHB_w_; //   up thrust left
    
    if(!g.mod_fix_og_swordhb_exploit 
    &&  qual_SwordHB_xoff_bug() 
    && !(f.items&ITM_SWRD) )
    {
        SwordHB_xoff += 2;
    }
    
    
    if (behavior==behavior_STAB_DOWN 
    ||  behavior==behavior_STAB_UP )
    {    SwordHB_yoff = 0;  }
    else SwordHB_yoff = 7;
    
    
    SwordHB_xoff += g.HB_ADJ_X;
    SwordHB_yoff += g.HB_ADJ_Y;
    
    // view_xl_dist = x-viewXL()
    // view_xl_dist is updated at the end of the main update before 
    // update_swrdXY() so it is based off the previous frame's x
    // SwordHB_x is the XL of the hitbox
    // SwordHB_y is the YT of the hitbox
    SwordHB_x = viewXL() + view_xl_dist + SwordHB_xoff;
    SwordHB_y = SwordHB_y_base          + SwordHB_yoff;
    
    
    var _SwordHB_xc = SwordHB_x+SwordHB_w_;
    var _SwordHB_yc = SwordHB_y+SwordHB_h_;
    
    
    SwordHB_can_draw = SwordHB_collidable;
    
    
    
    
    
    SwordHB2_collidable = SwordHB_collidable && (attack_bits&(BIT_ATK1|BIT_ATK2));
    SwordHB2_can_draw   = SwordHB2_collidable;
    
    if (is_cucco)
    {
        SwordHB2_w = Cucco_SwordHB_W;
        SwordHB2_h = Cucco_SwordHB_H;
    }
    else
    {
        SwordHB2_w = SwordHB2_W;
        SwordHB2_h = SwordHB2_H;
    }
    
    var _SwordHB2_w_ = SwordHB2_w>>1;
    var _SwordHB2_h_ = SwordHB2_h>>1;
    
    var _YOFF = 3; // added height
    if (attack_bits&(BIT_ATK1|BIT_ATK2)) SwordHB2_h += _YOFF;
    
    
    var _XOFF = ((_DIST1+_SwordHB2_w_)*x_scale_prev) - _SwordHB2_w_;
    SwordHB2_xl  = viewXL() + view_xl_dist + _XOFF;
    
    SwordHB2_yt  = y_prev + SwordHB2_YOFF; // stabType. 0: low, 1: high
    SwordHB2_yt += 10 * sign(attack_bits&BIT_ATK2);
    
    if (attack_bits&BIT_ATK2) SwordHB2_yt -= _YOFF;
    
    
    
    //db_pc_swrdHB_1a();
}











/*
// E9A2
if ( g.allow_bug_swrdXOff_1 
&&  (g.camLockedH || g.camAtRoomEdgeH) )
{
    // OG
    if (swrdX_base < camXX)             SwordHB_xoff =  2;
    else                                SwordHB_xoff = -8;
}
else // ShadowLink exploit does not work
{
    if ((swrdX_base + g.camXL) < xx)    SwordHB_xoff =  2;
    else                                SwordHB_xoff = -8;
}


if (isVal(behavior, BVR_UPTH,BVR_DWTH)) SwordHB_yoff =  0;
else                                    SwordHB_yoff =  7;


SwordHB_x = swrdX_base + SwordHB_xoff + g.camXL;
SwordHB_y = swrdY_base + SwordHB_yoff;

SwordHB_can_draw = swrdY_base != g.NULL;
*/




