/// Ganon1_update_battle_2()


switch(Collision_VER)
{
    // ------------------------------------------------------------
    case 1:{
    update_body_hb_1a();
    if (GO_can_collide_this_frame(update_idx) 
    && !stun_timer 
    && !global.pc.iframes_timer 
    &&  global.pc.yt>=yt 
    &&  collide_pc_body(BodyHB_xl,BodyHB_yt, BodyHB_w,BodyHB_h, BodyHB_r) )
    {
        PC_take_damage(id);
    }
    break;}//case 1
    
    
    // ------------------------------------------------------------
    case 2:{
    Ganon1_update_battle_2a();
    break;}//case 2
}//switch(Collision_VER)




