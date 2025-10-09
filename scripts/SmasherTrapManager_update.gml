/// SmasherTrapManager_update()


switch(sub_state)
{
    case sub_state_IDLE:{
    if(!global.pc.ogr) // if pc on ground
    {
        if (pointInRect(global.pc.cp1X,global.pc.cp1Y, trigger_x-$10,trigger_y-$8,$20,$10))
        {
            var _i;
            var _TRAP_COUNT = ds_grid_width(Trap_dg);
            for(_i=0; _i<_TRAP_COUNT; _i++)
            {
                Trap_dg[#_i,$0].sub_state = Trap_dg[#_i,$0].sub_state_DELAY;
                Trap_dg[#_i,$0].timer = Trap_dg[#_i,$2];
            }
            
            sub_state = sub_state_DONE;
            break;//case sub_state_IDLE
        }
    }
    break;}//case sub_state_IDLE
    
    
    
    
    case sub_state_TELL:{
    if (timer) break;
    sub_state = sub_state_ATTACK;
    break;}//case sub_state_TELL
    
    
    
    
    case sub_state_ATTACK:{
    break;}//case sub_state_ATTACK
    
    
    
    
    case sub_state_DONE:{
    break;}//case sub_state_DONE
}//switch(sub_state)




