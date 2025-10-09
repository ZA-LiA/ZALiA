/// Ganon2_update_2()


with(global.pc)
{
    if(!ogr 
    && !(attack_phase&$3) ) // global.pc.attack_phase is 0 or 4(draw-back)
    {
        attack_phase = 0;
        hspd = 0;
        PC_set_behavior(behavior_IDLE);
        g.pc_lock = PC_LOCK_ALL;
    }
}




