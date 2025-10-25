/// SmasherTrap01_udp()


can_draw_self = true;


draw_xoff = 0;
draw_yoff = 0;


if (Trigger_state==0) Trigger_draw_yoff = Trigger_OFFSET1;
else                  Trigger_draw_yoff = 0;


switch(sub_state)
{
    case sub_state_IDLE:{
    break;}//case sub_state_IDLE
    
    case sub_state_DELAY:{
    break;}//case sub_state_DELAY
    
    case sub_state_TELL:{
    if!(TELL_timer&$3)
    {
        if (attack_x_direction!=0) draw_xoff = sign_(TELL_timer&$8);
        if (attack_y_direction!=0) draw_yoff = sign_(TELL_timer&$8);
    }
    break;}//case sub_state_TELL
    
    case sub_state_ATTACK:{
    break;}//case sub_state_ATTACK
    
    case sub_state_DONE:{
    break;}//case sub_state_DONE
}//switch(sub_state)




