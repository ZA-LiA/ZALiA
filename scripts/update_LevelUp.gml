/// update_LevelUp()


// 9D75
switch(g.menu_state)
{
    // ---------------------------------------------------------------------
    case 0:{ // ---------------------------------------------------------------------
        // g.menu_built_count = 0;
        // A199: JMP A267
        g.menu_state++;
        
    break;}
    
    
    
    
    
    
    
    
    // ---------------------------------------------------------------------
    case 1:{ // ---------------------------------------------------------------------
        // A347, A31C
        g._074F = $C0;
        
        aud_play_sound(get_audio_theme_track(dk_OpenGUI));
        
        g.menu_state++;
        
    break;}
    
    
    
    
    
    
    
    
    // ---------------------------------------------------------------------
    case 2:{ // ---------------------------------------------------------------------
        g.level_up_idx = OPTION_CANCEL; // mod
        
        // 9FCE
        if (0)
        {   // OG
                 if (get_xp_next(STAT_ATK) <  f.xp)     g.level_up_idx = STAT_ATK;
            else if (get_xp_next(STAT_MAG) <  f.xp)     g.level_up_idx = STAT_MAG;
            else if (get_xp_next(STAT_LIF) <  f.xp)     g.level_up_idx = STAT_LIF;
        }
        else
        {   // MOD
                 if (get_xp_next(STAT_ATK) == f.xpNext) g.level_up_idx = STAT_ATK;
            else if (get_xp_next(STAT_MAG) == f.xpNext) g.level_up_idx = STAT_MAG;
            else if (get_xp_next(STAT_LIF) == f.xpNext) g.level_up_idx = STAT_LIF;
        }
        
        for(var _i=min(STAT_ATK,STAT_MAG,STAT_LIF); _i<=max(STAT_ATK,STAT_MAG,STAT_LIF); _i++)
        {   dg_DATA[#_i,IDX_CAN_LVL] = get_xp_next(_i) <= f.xp;  }
        // dg_DATA[#STAT_ATK,IDX_CAN_LVL] = get_xp_next(STAT_ATK) <= f.xp;
        // dg_DATA[#STAT_MAG,IDX_CAN_LVL] = get_xp_next(STAT_MAG) <= f.xp;
        // dg_DATA[#STAT_LIF,IDX_CAN_LVL] = get_xp_next(STAT_LIF) <= f.xp;
        // dg_DATA[#STAT_ATK,IDX_CAN_LVL] = get_xp_next(STAT_ATK) < f.xp;
        // dg_DATA[#STAT_MAG,IDX_CAN_LVL] = get_xp_next(STAT_MAG) < f.xp;
        // dg_DATA[#STAT_LIF,IDX_CAN_LVL] = get_xp_next(STAT_LIF) < f.xp;
        
        
        
        // A053
        g.menu_state++;
        
    break;}
    
    
    
    
    
    
    
    
    // ---------------------------------------------------------------------
    case 3:{ // ---------------------------------------------------------------------
        // A26B, A267
        g.menu_state++;
        
    break;}
    
    
    
    
    
    
    
    
    // ---------------------------------------------------------------------
    case 4:{ // ---------------------------------------------------------------------
        // A2F8: JSR A647, A304
            g.menu_built_count  = (g.menu_built_count+1)&$FF;
        usd_LevelUpMenu();
        if (g.menu_built_count >= ROWS>>1) g.menu_state++;
        
    break;}
    
    
    
    
    
    
    
    
    // ---------------------------------------------------------------------
    case 5:{ // ---------------------------------------------------------------------
        var _i,_j;
        
        // 9E7A: JSR 9DF6
        if (gui_tmr_cursor_v()) // 9DF6
        {
            // 9E82
            for(_i = 0; _i < 4; _i++) // each menu option
            {
                g.level_up_idx = (g.level_up_idx + sign_(Input.Down_held)) & 3;
                
                if (g.level_up_idx == OPTION_CANCEL) // 3: CANCEL
                {
                    for(_j = 0; _j < 3; _j++) // each stat
                    {   // As long as xp has not been reached for 1 stat
                        if (get_xp_next(_j) > f.xpNext)
                        {
                            _i = 4;
                            break;
                        }
                    }
                }
                else if (f.xp >= get_xp_next(g.level_up_idx))
                {
                    break;
                }
            }
            
            // 9ECA
            aud_play_sound(get_audio_theme_track(dk_CursorSpellMenu));
        }
        
        // 9F3D
        usd_LevelUpMenu();
        
        if (Input.Pause_pressed)
        //if ( Input.Pause_held          // Start held
        //&& !(Input.heldPrev&Input.S) ) // Start NOT held prev frame
        {
            update_LevelUp_1a(); // option selected by pressing start
            
            // 9FC0: JMP 9FB9, 9F92, 9FB9
            g.menu_state++;
        }
        
        
    break;}
    
    
    
    
    
    
    
    
    // ---------------------------------------------------------------------
    case 6:{ // ---------------------------------------------------------------------
        usd_LevelUpMenu();
        
        /*
        // A68B
        if (g.level_up_idx == 3) // 3: CANCEL
        {
            var _buildCountCopy = g.menu_built_count;
            
                 if (g.level_up_idx == 0) g.menu_built_count = 4;
            else if (g.level_up_idx == 1) g.menu_built_count = 6;
            else if (g.level_up_idx == 2) g.menu_built_count = 9;
            
            // A69C: JSR A647
            // A69F: JSR A35F
            
            g.menu_built_count = _buildCountCopy;
        }
        */
        
        
        if (g.level_up_idx == OPTION_CANCEL) g.gui_timer1 = $60;
        else                            g.gui_timer1 = $20;
        g._074F |= $C0;
        
        g.menu_state++;
        
    break;}
    
    
    
    
    
    
    
    
    // ---------------------------------------------------------------------
    case 7:{ // ---------------------------------------------------------------------
        if(!g.level_up_timer) g.level_up_timer = $9A; // For pre-sound only
        if (g.level_up_timer) g.level_up_timer--;     // For pre-sound only
        
        // MOD  --------------------------------------------
        // Uptick xpnext value for stat chosen to level up
        if (g.level_up_idx != OPTION_CANCEL)
        {
            var _DIFF = get_xp_next(g.level_up_idx) - dl_xp_next_stat[|g.level_up_idx];
            if (_DIFF)
            {
                if (_DIFF >= 10) dl_xp_next_stat[|g.level_up_idx] += 10;
                else             dl_xp_next_stat[|g.level_up_idx] +=  1;
                
                if(!g.level_up_timer) g.level_up_timer = 1; // Keep menu open until uptick done
            }
        }
        // ------------------------------------------------
        
        
        
        
        if (g.level_up_idx==OPTION_CANCEL) g.level_up_timer = 0;   // CANCEL
        
        // A0F1
        g.gui_timer1 = (g.gui_timer1-1)&$FF;
        
        
        
        if(!g.level_up_timer)
        {   // A325
            g.menu_state++;
        }
        
        usd_LevelUpMenu();
        
        
        /*
        if(!g.luTimer 
        || (g.menu_built_count == 3 && !g.gui_tmr_1) )
        {
            // A325
            g.menu_state++;
        }
        
        if (g.luTimer 
        &&  g.menu_built_count != 3 )
        {
            // A0FE
            // A114: JSR A647
            
            // A117
            // usd_LevelUpMenu();
        }
        
        usd_LevelUpMenu();
        */
        
        
        // LOGIC WITH SOUND -------------------------------------------------
        /*
        if (Sound._07FB != $10 
        ||  (g.menu_built_count == 3 && !g._0487) )
        {
            // A325
            g.menu_state = byte(g.menu_state + 1);
        }
        
        if (Sound._07FB == $10 && g.menu_built_count != 3)
        {
            // A0FE
            // A114: JSR A647
            
            // A117
            usd_LevelUpMenu();
        }
        */
        
        
        
    break;}
    
    
    
    
    
    
    
    
    // ---------------------------------------------------------------------
    case 8:{ // ---------------------------------------------------------------------
        usd_LevelUpMenu();
        
        // A26B, A267
        g.menu_state++;
        
    break;}
    
    
    
    
    
    
    
    
    // ---------------------------------------------------------------------
    case 9:{ // ---------------------------------------------------------------------
        // A3D7, A267, A3DF
            g.menu_built_count--;
        if (g.menu_built_count < 0) g.menu_state++;
        else usd_LevelUpMenu();
        
        
    break;}
    
    
    
    
    
    
    
    
    // ---------------------------------------------------------------------
    case 10:{ // ---------------------------------------------------------------------
        // A338
        g.gui_state        = g.gui_state_NONE;
        g.menu_built_count = 0;
        g.menu_state       = 0;
        
    break;}
}




// MOD. Start stat restore in level up menu instead of after.
if (g.gui_state!=g.gui_state_NONE 
&&  g.menu_state > 5 )
{
    update_stat_restore();
}




