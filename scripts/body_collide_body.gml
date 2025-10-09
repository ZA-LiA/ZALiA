/// body_collide_body(inst, obj or inst)


with(argument[1]) // obj or inst
{
    if (rectInRect(argument[0].BodyHB_xl, 
                   argument[0].BodyHB_yt, 
                   argument[0].BodyHB_w, 
                   argument[0].BodyHB_h, 
                               BodyHB_xl, 
                               BodyHB_yt, 
                               BodyHB_w, 
                               BodyHB_h) )
    {
        return true;
    }
}

return false;




