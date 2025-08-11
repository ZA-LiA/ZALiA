/// update_QuitAppMenu()


with(g.QUIT_APP_MENU)
{   // --------------------------------------------------------------------------------
    switch(sub_state)
    {   // ---------------------------------------------------------------------------------------------
        case sub_state_IDLE_CLOSED:{ // ---------------------------------------------------------------------------------------------
        will_go_to_continuesave = false;
        if (timer){timer--; break;}
        
        /*
        if (g.gui_state==g.gui_state_NONE 
        ||  g.gui_state==g.gui_state_PAUSE 
        ||  g.gui_state==g.gui_state_LEVEL_UP 
        ||  g.gui_state==g.gui_state_DIALOGUE1 
        ||  g.gui_state==g.gui_state_DIALOGUE2 
        ||  g.gui_state==g.gui_state_DIALOGUE3 )
        */
        if (g.gui_state!=g.gui_state_QUIT_APP)
        {
            if (room==rmB_Title 
            ||  room==rmB_FileSelect 
            ||  (g.room_type=="A" && isVal(g.gui_state, g.gui_state_NONE,g.gui_state_PAUSE,g.gui_state_LEVEL_UP,g.gui_state_DIALOGUE1,g.gui_state_DIALOGUE2,g.gui_state_DIALOGUE3)) )
            //||  (g.room_type=="A" && g.gui_state==g.gui_state_NONE) )
            //||  (g.room_type=="C" && !g.overworld.dest_dist) 
            {
                var _qual = Input.GP_Other5_held && Input.GP_Other6_held && Input.Magic_held && Input.Pause_held; // hold RT + hold LT + hold Select + hold Start
                if(!_qual 
                &&  keyboard_check_pressed(vk_escape) 
                && !g.Fullscreen_toggled ) // toggling fullscreen can happen earlier in the frame, window_get_fullscreen() will not be accurate here
                {
                    _qual = true;
                    //with(PaletteEditor) _qual = state!=state_EDIT1A && state!=state_EDIT1B && state!=state_BGR_COLOR; // exiting these Dev_PalettePicker states gets priority
                }
                
                if (_qual)
                {
                    if (room==rmB_Title 
                    ||  room==rmB_FileSelect )
                    {
                        //sdm("update_QuitAppMenu() -> case sub_state_IDLE_CLOSED -> game_end()");
                        game_end(); // Quit app
                    }
                    else
                    {
                        QuitAppMenu_trigger_open();
                    }
                }
            }
            
            
            return false;
        }
        break;}//case sub_state_IDLE_CLOSED
        
        
        
        
        
        // ---------------------------------------------------------------------------------------------
        case sub_state_OPENING1:{ // ---------------------------------------------------------------------------------------------
        if (timer){timer--; break;}
        
        aud_play_sound(get_audio_theme_track(dk_OpenGUI));
        
        timer = 2;
        sub_state = sub_state_OPENING_ANIM;
        break;}//case sub_state_OPENING1
        
        
        
        
        
        // ---------------------------------------------------------------------------------------------
        case sub_state_OPENING_ANIM:{ // ---------------------------------------------------------------------------------------------
        if (timer){timer--; break;}
        
        QuitAppMenu_udp();
        
            anim_frame++;
        if (anim_frame==ANIM_FRAMES_DEF)
        {
            timer = 0;
            sub_state = sub_state_OPEN1;
        }
        
        break;}//case sub_state_OPENING_ANIM
        
        
        
        
        
        // ---------------------------------------------------------------------------------------------
        case sub_state_OPEN1:{ // ---------------------------------------------------------------------------------------------
        if (timer){timer--; break;}
        
        QuitAppMenu_udp();
        
        var _CONFIRM = Input.Pause_pressed;
        //var _CONFIRM =(Input.Pause_held && !(Input.heldPrev&Input.S)) 
        //             || keyboard_check_pressed(vk_enter);
        var _CANCEL  = Input.GP_Other1_pressed  // gp2: xbox 'B'
                    || keyboard_check_pressed(vk_escape);
        if (_CONFIRM 
        ||  _CANCEL )
        {
            if (_CONFIRM 
            &&  cursor_option )
            {
                if (room==rmB_Title 
                ||  room==rmB_FileSelect )
                {
                    //sdm("update_QuitAppMenu() -> case sub_state_OPEN1 -> game_end()");
                    game_end(); // Quit app
                }
                else
                {
                    anim_frame    = 0;
                    cnt_draw_rows = 0;
                    cursor_option = 0;
                    
                    with(global.OPTIONS_MENU) sub_state = sub_state_IDLE_CLOSED;
                    with(global.OPTIONS_MENU) gui_state_backup = 0;
                    gui_state_backup = 0;
                    g.gui_state = g.gui_state_NONE;
                    
                    timer = 0;
                    sub_state = sub_state_IDLE_CLOSED;
                    
                    
                    g.pc.state = g.pc.state_DEAD;
                    g.pc.can_draw_self = false;
                    
                    if(!get_saved_value(f.file_num, STR_Rando+STR_Active, false) 
                    ||  get_saved_value(f.file_num, STR_Rando+"_UP_A"+STR_XP+"_Penalty", true) )
                    {
                        f.xp = round(f.xp*g.mod_Gameover_XP_PENALTY);
                        f.xp = clamp(f.xp, 0,XP_MAX);
                    }
                    
                    f.death_count += lives;
                    lives = 0;
                    
                    //sdm("update_QuitAppMenu() -> case sub_state_IDLE_CLOSED -> game_end()");
                    Audio.mus_rm_body = 0; // Need to do this so ContinueScreen music will play
                    
                    will_go_to_continuesave = true;
                    // Seems like the combination of get_saved_value() and room_goto_() can crash the app so I moved room_goto_(rmB_ContinueSave) to sub_state_CLOSING3
                    //room_goto_(rmB_ContinueSave);
                }
                
                //break;//case sub_state_OPEN1
            }
            
            
            timer = 0;
            sub_state = sub_state_CLOSING1; // Start close menu
            break;//case sub_state_OPEN1
        }
        
        
        
        if (abs(bit_dir(gui_tmr_cursor_v()))  // 0,1
        ||  Input.Magic_pressed )
        {
            cursor_option ^= $1;
            aud_play_sound(get_audio_theme_track(dk_CursorSpellMenu));
            break;//case sub_state_OPEN1
        }        
        break;}//case sub_state_OPEN1
        
        
        
        
        
        // ---------------------------------------------------------------------------------------------
        case sub_state_CLOSING1:{ // ---------------------------------------------------------------------------------------------
        if (timer){timer--; break;}
        
        // Closing menu.
        QuitAppMenu_udp();
        
        aud_play_sound(get_audio_theme_track(dk_OpenGUI));
        timer = 0;
        sub_state = sub_state_CLOSING_ANIM;
        break;}//case sub_state_CLOSING1
        
        
        
        
        
        // ---------------------------------------------------------------------------------------------
        case sub_state_CLOSING_ANIM:{ // ---------------------------------------------------------------------------------------------
        if (timer){timer--; break;}
        
        if (anim_frame)
        {
            QuitAppMenu_udp();
        }
        else
        {
            timer = 0;
            sub_state = sub_state_CLOSING3;
        }
        
        anim_frame--;
        break;}//case sub_state_CLOSING_ANIM
        
        
        
        
        
        // ---------------------------------------------------------------------------------------------
        case sub_state_CLOSING3:{ // ---------------------------------------------------------------------------------------------
        if (timer){timer--; break;}
        
        anim_frame    = 0;
        cnt_draw_rows = 0;
        cursor_option = 0;
        g.gui_state   = g.gui_state_NONE;
        //g.gui_state   = gui_state_backup;
        
        if (will_go_to_continuesave) room_goto_(rmB_ContinueSave);
        will_go_to_continuesave = false;
        
        timer = 0;
        sub_state = sub_state_IDLE_CLOSED;
        break;}//case sub_state_CLOSING3
    }//switch(sub_state)
}//with(g.QUIT_APP_MENU)


return true;




