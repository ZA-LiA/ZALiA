/// collide_pc_proj(x, y, w, h, *radius)


for(var _i=MAX_GOC2-1; _i>=0; _i--)
{
    with(g.go_mgr.dl_goc2[|_i])
    {
        if (state != state_NORMAL) continue; // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        
        
        if (argument_count>4 
        &&  argument[4] )
        {   // radius
            if (rectInCirc(argument[0],argument[1],argument[4],             BodyHB_xl,BodyHB_yt,BodyHB_w,BodyHB_h))
            {
                return id;
            }
        }
        else
        {
            if (rectInRect(argument[0],argument[1],argument[2],argument[3], BodyHB_xl,BodyHB_yt,BodyHB_w,BodyHB_h))
            {
                return id;
            }
        }
    }
}


return 0;




