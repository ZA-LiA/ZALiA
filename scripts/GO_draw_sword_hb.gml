/// GO_draw_sword_hb()


if(!g.DevTools_state) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if(!g.can_draw_hb)    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
if(!variable_instance_exists(id,"SwordHB_can_draw")) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!


//if (id==global.pc && swrd_collidable) sdm(", SwordHB2_candraw "+string(SwordHB2_candraw)+", SwordHB2_collidable"+string(SwordHB2_collidable)+", SwordHB2_colliding "+string(SwordHB2_colliding)+", SwordHB2_xl $"+hex_str(SwordHB2_xl)+", SwordHB2_yt $"+hex_str(SwordHB2_yt)+", SwordHB2_W $"+hex_str(SwordHB2_W)+", SwordHB2_H $"+hex_str(SwordHB2_H));


//if (SwordHB_w)
if (SwordHB_can_draw 
&&  SwordHB_w )
{
    //SwordHB_can_draw = false;
    draw_rect_(SwordHB_color, SwordHB_x,SwordHB_y, SwordHB_w,SwordHB_h, 1, true);
}



if (id==global.pc 
&&  SwordHB2_can_draw )
{
    //SwordHB2_can_draw = false;
    draw_rect_(c_white, SwordHB2_xl,SwordHB2_yt, SwordHB2_w,SwordHB2_h, 1, true);
}




