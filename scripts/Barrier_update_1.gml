/// Barrier_update_1()


// A234
switch(sub_state)
{
    // ------------------------------------------------------------------
    // ------------------------------------------------------------------
    case 0:{
    if (wINw(xl,BodyHB_w,viewXL(),viewW()))
    {   // A238
        var _REMAINING = global.DungeonCrystals_COUNT - bitCount(f.crystals);
        if(!_REMAINING)
        {
            var _DIST = abs((xl+(BodyHB_w>>1)) - global.pc.x);
            if (_DIST < (BodyHB_w>>1)+$40)
            {   // A249
                g.pc_lock = PC_LOCK_ALL; // Lock all
                PC_set_behavior(global.pc.behavior_IDLE);
                
                counter   = 0; // 0071[eIndex]
                sub_state = 1; // 00AF[eIndex]
                aud_play_sound(get_audio_theme_track(dk_RaiseBarrier));
            }
        }
        
        
        
        
        // A25F
        if(!global.pc.is_dead)
        {   // A266
            if(1){ // MOD.  So that PC can collided w/enemies, changing order of update so that global.pc.invuln_tmr only sets to 0 if (cs&CS_BD1). 
                // A269: JSR E4D9
                GOB_body_collide_pc_body_1a();
                // A26C: JSR D6C1
                if (cs&CS_BD1) global.pc.iframes_timer = 0;
                if (cs&CS_BD1) enemy_collide_pc_body();
                // A26F
                if (cs&CS_BD1 
                &&  (pc_is_fairy() || pc_is_cucco()) )
                {
                    global.pc.is_dead = 1;
                }
            }else{ // ---------------------------------------
                global.pc.iframes_timer = 0;
                // A269: JSR E4D9
                GOB_body_collide_pc_body_1a();
                // A26C: JSR D6C1
                if (cs&CS_BD1) enemy_collide_pc_body();
                // A26F
                if (cs&CS_BD1 
                && (pc_is_fairy() || pc_is_cucco()) )
                {
                    global.pc.is_dead = 1;
                }
            }
        }
    }
    
    // A27C
    Barrier_udp();
    break;}
    
    
    
    
    
    
    // ------------------------------------------------------------------
    // ---------------------   RAISING    -------------------------
    case 1:{
    // A2A7, A2B7
    if(!rows)
    {
        g.pc_lock = 0;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    
    
    
    // A2C4
        counter = (counter+1)&$FF; // 0071[eIndex]
    if!(counter&$3)
    {   // A303
        rows--;
        Barrier_udp();
    }
    break;}
}




