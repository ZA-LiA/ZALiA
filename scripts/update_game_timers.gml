/// update_game_timers()


// C169

    timer_b--; // 0500
if (timer_b<0)
{
    timer_b = timer_b_DURATION1; // timer_b_DURATION1 = $14
    
    
    // C177.  Update timers 0519-050E.
    // 0512
    if (timer_b1) timer_b1--;
    
    // 0518
    if (pc.iframes_timer) pc.iframes_timer--;
    
    // 0516
    if (global.OVERWORLD.enc_spawn_timer) global.OVERWORLD.enc_spawn_timer--;
    
    
    if (room_type=="C")
    {
        for(var _i=ds_grid_width(global.OVERWORLD.dg_enc_inst)-1; _i>=0; _i--)
        {   // enc obj timers
            if (global.OVERWORLD.dg_enc_inst[#_i, global.OVERWORLD.ENC_INST_TMR_IDX])
            {   global.OVERWORLD.dg_enc_inst[#_i, global.OVERWORLD.ENC_INST_TMR_IDX]--;  }
        }
    }
}



// 0501-050D timers
// ----------------------------------------------------

// 050D 
if (boss_stun_timer) boss_stun_timer--;

// 050C PC stun timer
if (pc.stun_timer) pc.stun_timer--;

// 050A PC attack timer
if (pc.attack_timer) pc.attack_timer--;

// 0503 Delay control of PC when entering a room
if (EnterRoom_control_timer) EnterRoom_control_timer--;

// 0502
if (control1_timer) control1_timer--;

// 0501 walkIndexTimer
if (WalkAnim_timer) WalkAnim_timer--;


counter1  = (counter1+1) &$FF; // 0012
timer_a1  = (timer_a1+1) &$FFFFFFFF;
timer_a2 += !(counter1&$FF); // Every full    cycle
timer_a3 += !(counter1&$3F); // Every quarter cycle




