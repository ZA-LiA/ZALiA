/// GOB_update_sword_offsets()

//  Every frame, in GameObjectB_step():
//      SwordHB_yoff is set to 0 
//      swrdY1      is set to $F8   


if (is_ancestor(object_index, DairA))
{
    SwordHB_xoff = SwordHB_XOFF * facing_dir;
    SwordHB_yoff = SwordHB_YOFF;
}
else if (is_ancestor_(object_index, FokkA,IrKnA,ReboB))
{
    if (1)
    {   // OG ----------------------------------------------
        // *** Since swrdW = 14, an equal abs(xoff) for 
        // both facing dir give facing left 2 pixel 
        // extra reach.
        
        // Only called for BVR_ATKH: 2, BVR_ATKL: 4
        SwordHB_xoff  = SwordHB_XOFF <<inRange(timer, 3, 12); // $08,$10
        SwordHB_xoff *= facing_dir;
        
        // IrKnA & ReboB at certain points don't 
        // clear the carry like Fokka does.
        // facing right:   8,  16,   9
        // facing left:   -8, -15,  -7
        if (is_ancestor_(object_index, IrKnA,ReboB))
        {
            if ( timer >= 13 
            ||  (timer >=  3 && !facing_dir) )            // timer 3-12
            {
                SwordHB_xoff++;
            }
        }
    }
    else
    {   // Something balanced. --------------------------------
        if (facing_dir) SwordHB_xoff  =  16;
        else           SwordHB_xoff  = -SwordHB_w;
        
        if (!inRange(timer, 3, 12))
        {              SwordHB_xoff += (8 * -facing_dir);  }
        
        // SwordHB_xoff  = (ww >>1) + (swrdW >>1)
    }
    
    
    
    if (behavior == BVR_ATKL) SwordHB_yoff = 25;
    else                      SwordHB_yoff =  9;
}
else if (is_ancestor(object_index, GeruA))
{
    // Only called on behavior 2 (2 & 5 for Lance Geru (orange))
    // 9F35
        SwordHB_xoff  = SwordHB_XOFF * facing_dir; // 6
    if (ver == 2 || inRange(timer, 3, 8)) // v2 Geru red
    {   SwordHB_xoff *= 2;  }
    
    // 9F4F, 9F57, E5F5
                       SwordHB_yoff  = SwordHB_YOFF;
    if (behavior == 5) SwordHB_yoff += 8; // Low atk. Lance Geru (orange)

}
else if (is_ancestor_(object_index, MoblA,MoblB)) // Moblin & Grunt
{
    // 1: 0, 2
    // 2: 1, 3, 0, 2
    // 3: 0, 2
    // 4: 1, 3
    
    if ( behavior &  1 
    ||  (behavior == 2 && timer < 8) )
    {   SwordHB_xoff  = SwordHB_XOFF1 * -facing_dir;  } // 4
    else
    {   SwordHB_xoff  = SwordHB_XOFF2 *  facing_dir;  } // 8
    
    if (inRange(timer, 3, 12))
    {   SwordHB_xoff *= 2;   }
    
    
                      SwordHB_yoff  = SwordHB_YOFF;
    if (behavior < 3) SwordHB_yoff += 8;
}
else if (is_ancestor(object_index, StalA))
{
    // BE66
    SwordHB_xoff = SwordHB_XOFF * facing_dir;
    SwordHB_yoff = SwordHB_YOFF;
}
else if (is_ancestor(object_index, HorsA))
{
    if (attack_state)
    {   // 983B(in sprite update)
        switch(attack_state){// SwordHB_XOFF=16+g.HB_ADJ_X
        default:                     {SwordHB_xoff = -SwordHB_XOFF * facing_dir; break;}
        case   attack_state_DRAWBACK:{SwordHB_xoff = -SwordHB_XOFF * facing_dir; break;}
        case   attack_state_SWING:   {SwordHB_xoff =  SwordHB_XOFF * facing_dir; break;}
        }
        
        SwordHB_yoff = SwordHB_YOFF + 9; // SwordHB_YOFF=16+g.HB_ADJ_Y
    }
}
else if (is_ancestor(object_index, ReboA))
{
    // updated in usd_RebonackA()
}




