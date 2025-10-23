/// SmasherTrap01_update()


var _X_PREV = x;
var _Y_PREV = y;


hspd = 0;
vspd = 0;




switch(sub_state)
{
    // ------------------------------------------------------------------------------------
    // -----------------------------------------------------------------------------
    case sub_state_IDLE:{
    if (trigger_x>=0 
    &&  trigger_y>=0 
    && !global.pc.ogr  // if pc on ground
    &&  pointInRect(global.pc.cp1X,global.pc.cp1Y, trigger_x-$10,trigger_y-$8,$20,$10) )
    {
        sub_state = sub_state_DELAY;
        break;//case sub_state_IDLE
    }
    break;}//case sub_state_IDLE
    
    
    
    
    // ------------------------------------------------------------------------------------
    // -----------------------------------------------------------------------------
    case sub_state_DELAY:{
    if (DELAY_timer)
    {
        DELAY_timer--;
        break;//case sub_state_DELAY
    }
    
    sub_state = sub_state_TELL;
    break;}//case sub_state_DELAY
    
    
    
    
    // ------------------------------------------------------------------------------------
    // -----------------------------------------------------------------------------
    case sub_state_TELL:{
    if (TELL_timer)
    {
        TELL_timer--;
        break;//case sub_state_TELL
    }
    
    sub_state = sub_state_ATTACK;
    break;}//case sub_state_TELL
    
    
    
    
    // ------------------------------------------------------------------------------------
    // -----------------------------------------------------------------------------
    case sub_state_ATTACK:{
    SmasherTrap01_update_ATTACK();
    break;}//case sub_state_ATTACK
    
    
    
    
    // ------------------------------------------------------------------------------------
    // -----------------------------------------------------------------------------
    case sub_state_DONE:{
    break;}//case sub_state_DONE
}//switch(sub_state)




BodyHB_can_draw = true;
update_body_hb();


// updates all GameObject instances on top of trap
update_go_xy_on_moving_platform(x-_X_PREV, y-_Y_PREV);




update_EF11();



//if (keyboard_check_pressed(vk_f7)) show_debug_message("SmasherTrap01_update()."+" palidx_def=$"+hex_str(palidx_def)+" palidx_base=$"+hex_str(palidx_base)+" palidx=$"+hex_str(palidx)+" global.PI_BGR1=$"+hex_str(global.PI_BGR1));




