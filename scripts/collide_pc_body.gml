/// collide_pc_body(x, y, w, h, *radius)


with(global.pc)
{
    if (argument_count>4 
    &&  argument[4] )
    {   // radius
        return rectInCirc(argument[0],argument[1],argument[4],             BodyHB_xl,BodyHB_yt,BodyHB_w,BodyHB_h);
    }
    else
    {
        return rectInRect(argument[0],argument[1],argument[2],argument[3], BodyHB_xl,BodyHB_yt,BodyHB_w,BodyHB_h);
    }
}

return false;




