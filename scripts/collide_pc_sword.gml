/// collide_pc_sword(x, y, w, h, *radius)


with(global.pc)
{
    // SwordHB_collidable is set and determined at end of master update in update_swrdXY()
    if(!SwordHB_collidable) return false;
    
    PC_update_sword_hb();
    
    if (argument_count>4 
    &&  argument[4] )
    {   // radius
        return rectInCirc(argument[0],argument[1],argument[4], SwordHB_x,SwordHB_y,SwordHB_w,SwordHB_h);
    }
    else
    {
        return rectInRect(argument[0],argument[1],argument[2],argument[3], SwordHB_x,SwordHB_y,SwordHB_w,SwordHB_h);
    }
}

return false;




