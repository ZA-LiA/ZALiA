/// Balshot_udp()


can_draw_self = true;


if (stun_timer)
{
    if (stun_timer&$4) GO_set_sprite(id,spr_Balshot01b); // eye open
    else               GO_set_sprite(id,spr_Balshot01a); // eye closed
}
else
{
    if (Shoot_timer<2 
    ||  Shoot_timer>=(Shoot_cooldown>>2)*3 )
    {
        GO_set_sprite(id,spr_Balshot01b); // eye open
    }
    else
    {
        GO_set_sprite(id,spr_Balshot01a); // eye closed
    }
}




/*
/// Balshot_udp()


can_draw_self = true;


switch(sub_state)
{
    case sub_state_ENABLED:{
    if (Shoot_timer<2 
    ||  Shoot_timer>=(Shoot_cooldown>>2)*3 )
    {
        GO_set_sprite(id,spr_Balshot01b); // eye open
    }
    else
    {
        GO_set_sprite(id,spr_Balshot01a); // eye closed
    }
    break;}//case sub_state_ENABLED
    
    
    
    
    case sub_state_DISABLED:{
    if (stun_timer&$4) GO_set_sprite(id,spr_Balshot01b); // eye open
    else               GO_set_sprite(id,spr_Balshot01a); // eye closed
    break;}//case sub_state_DISABLED
}//switch(sub_state)
*/




