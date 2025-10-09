/// db_pc_swrdHB_1a()


with(global.pc)
{
    if (behavior==behavior_STAB_STAND 
    ||  behavior==behavior_STAB_CROUCH 
    ||  behavior==behavior_STAB_DOWN 
    ||  behavior==behavior_STAB_UP )
    {
        if(!SwordHB_can_draw) sdm("");
        var _str = " ";
        _str += "xl $"       +hex_str(xl)+", ";
        _str += "x $"        +hex_str(x)+", ";
        _str += "yt $"       +hex_str(yt)+", ";
        _str += "y $"        +hex_str(y)+", ";
        _str += "SwordHB_can_draw "+string(SwordHB_can_draw)+", ";
        _str += "view_xl_dist "+hex_str(view_xl_dist)+", ";
        _str += "SwordHB_x " +hex_str(SwordHB_x)        +", ";
        _str += "SwordHB_x_base "+hex_str(SwordHB_x_base)   +", ";
        sdm(_str);
        
        
        // _str += "";
        _str  =   "SwordHB2_can_draw "  +string(SwordHB2_can_draw);
        _str += ", SwordHB2_collidable "+string(SwordHB2_collidable);
        _str += ", SwordHB2_colliding " +string(SwordHB2_colliding);
        _str += ", SwordHB2_xl $"+hex_str(SwordHB2_xl);
        _str += ", SwordHB2_yt $"+hex_str(SwordHB2_yt);
        _str += ", SwordHB2_W $" +hex_str(SwordHB2_W);
        _str += ", SwordHB2_H $" +hex_str(SwordHB2_H);
        sdm(_str);
        sdm("");
        
    }
}




