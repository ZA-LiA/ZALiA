/// NPC_activate_dialogue()


// 9A33
g.dialogue_source = id;
g.gui_state       = g.gui_state_DIALOGUE1;
g.pc_lock         = PC_LOCK_ALL; // Lock all
g.dialogue_started_this_frame = true;

with(global.pc)
{
    attack_phase = 0;
    PC_set_behavior(behavior_IDLE);
    solid_clip_correction(false);
    /* *** When you press 'B' to start 
         dialogue w/ an NPC, pc attack is 
         started. This sets hspd = 0, then 
         attack_phase is stopped right here. */
}


is_talking = true;
talked_to_count++;


if (g.mod_HEAL_NPC_DELAY1 
&&  object_index==NPC_4 )
{   // Healer/Saver: Delay face toward door.
    timer_a1 = 6;
}




