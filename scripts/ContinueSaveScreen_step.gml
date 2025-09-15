/// ContinueSaveScreen_step()


if (timer) timer--;




switch(state)
{
    // -----------------------------------------------------
    // -----------------------------------------------
    case state_DELAY1:{
    if (timer) break;//case state_DELAY1
    
    if (counter>=READY_CUE)
    {
        state = state_IDLE;
    }
    break;}//case state_DELAY1
    
    
    
    
    // -----------------------------------------------------
    // -----------------------------------------------
    case state_IDLE:{
    if (timer) break;//case state_IDLE
    
    var _cursor_dir = 0;
    switch(global.GUI_NAV1_VER)
    {
        default:{
        _cursor_dir = Input.Magic_pressed;
        //_cursor_dir = Input.GP_Select_pressed || Input.Magic_pressed;
        break;}//default
        
        case 2:{
            _cursor_dir = bit_dir(gui_tmr_cursor_v());
        if (_cursor_dir==0)
        {   _cursor_dir = Input.Magic_pressed;  }
        //{   _cursor_dir = Input.GP_Select_pressed || Input.Magic_pressed;  }
        break;}//case 2
    }//switch(global.GUI_NAV1_VER)
    
    if (_cursor_dir!=0)
    {
        Options_idx = (Options_idx+_cursor_dir+Options_COUNT) mod Options_COUNT;
        aud_play_sound(get_audio_theme_track(dk_CursorSpellMenu));
        break;//case state_IDLE
    }
    
    if (Input.Pause_pressed)
    //if (Input.GP_Start_pressed 
    //||  Input.Pause_pressed )  // Start button pressed
    {
        if (Options_idx==Option_SAVE)
        {   // moved these saves to the moment of button press to prevent possible app crash that I think can occur when changing rooms right after accessing a file.
            file_save(f.file_num,false);
            
            // Save new xp amount ------------------------
            // The exploit: When player saves here, then reload game, 
            // they retain all progress AND get back the xp they 
            // had when they last saved with an NPC.
            set_saved_value(f.file_num, STR_XP, f.xp);
        }
        
        
        counter = Options_idx;
        aud_play_sound(get_audio_theme_track(dk_ItemDrop));
        state = state_SELECTED; // An option has been selected
    }
    break;}//case state_IDLE
    
    
    
    
    // -----------------------------------------------------
    // -----------------------------------------------
    case state_SELECTED:{
        switch(Options_idx)
        {   // -----------------------------------------------------
            case Option_CONT:{
            if (timer) break;
            
            if (counter>=NEXT_LIFE_SCREEN_CUE)
            {
                audio_group_stop_all(audiogroup_mus);
                room_goto_(rmB_NextLife);
                exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            }
            break;}
            
            
            
            // -----------------------------------------------------
            case Option_SAVE:{
            if (timer) break;
            
            if (counter>=TITLE_SCREEN_CUE1)
            {
                goto_title_rm();
            }
            
            if (counter&$7==$4) SaveFlash_count++;
            break;}
            
            
            
            // -----------------------------------------------------
            case Option_QUIT:{
            if (timer) break;
            
            if (counter>=TITLE_SCREEN_CUE2)
            {
                goto_title_rm();
            }
            break;}
        }//switch(Options_idx)
    break;}//case state_SELECTED
}//switch(state)



counter++;




