/// update_OptionsMenu()


with(global.OPTIONS_MENU)
{
    if (PCSpriteWalk_timer)
    {
        PCSpriteWalk_timer--;
        if(!PCSpriteWalk_timer)
        {
            PCSpriteWalk_timer =  PCSpriteWalk_DURATION;
            PCSpriteWalk_frame = (PCSpriteWalk_frame+1) mod 3;
        }
    }
    
    
    if (timer2) timer2--;
    
    start_button_pressed  = Input.Pause_pressed;
    select_button_pressed = Input.Magic_pressed;
    a_button_pressed      = Input.Jump_pressed;
    b_button_pressed      = Input.Other1_pressed;
    
    right_input_pressed   = Input.Right_pressed;
    left_input_pressed    = Input.Left_pressed;
    down_input_pressed    = Input.Down_pressed;
    up_input_pressed      = Input.Up_pressed;
    
    //OpenClose_Key_pressed = keyboard_check_pressed(OpenClose_Key_KEY) || (Input.GP_Shoulder1L_held && Input.GP_Shoulder1R_held && Input.GP_Face4_pressed); // Other3: BumperL, Other4: BumperR, Other2: xbox-Y
    OpenClose_Key_pressed = keyboard_check_pressed(OpenClose_Key_KEY) || (Input.GP_Other3_held && Input.GP_Other4_held && Input.GP_Other2_pressed); // Other3: BumperL, Other4: BumperR, Other2: xbox-Y
    //OpenClose_Key_pressed = keyboard_check_pressed(OpenClose_Key_KEY);
    Backout_requested     = b_button_pressed || keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_backspace);
    
    
    
    
    // --------------------------------------------------------------------------------
    switch(sub_state)
    {
        // =========================================================================
        case sub_state_IDLE_CLOSED:{ // ------------------------------------------
        if (timer){timer--; break;}
        
        if (g.gui_state!=g.gui_state_OPTIONS)
        {
            if (OpenClose_Key_pressed 
            &&  g.gui_state==g.gui_state_NONE 
            &&  g.room_type=="A" )
            //if (OpenClose_Key_pressed)
            {
                OpenClose_Key_pressed = false;
                
                anim_frame       = 0;
                MainOption       = 0;
                draw_rows_count  = 0;
                //GUI3_pal_backup  = get_pi_palette(global.PI_GUI3);
                gui_state_backup = g.gui_state;
                g.gui_state      = g.gui_state_OPTIONS;
                
                menu_state        = menu_state_MAIN;
                InputConfigState  = InputConfigState_MAIN;
                InputConfigOption = InputConfigOption_RIGHT;
                
                timer = 0;
                sub_state = sub_state_OPENING1;
            }
            
            return false;
        }
        break;}//case sub_state_IDLE_CLOSED
        
        
        
        
        // =========================================================================
        case sub_state_OPENING1:{ // ------------------------------------------
        if (timer){timer--; break;}
        
        aud_play_sound(get_audio_theme_track(dk_OpenGUI));
        timer = 2;
        sub_state = sub_state_OPENING_ANIM;
        break;}//case sub_state_OPENING1
        
        
        
        
        // =========================================================================
        case sub_state_OPENING_ANIM:{ // ------------------------------------------
        udp_OptionsMenu();
        if (timer){timer--; break;}
        
            anim_frame++;
        if (anim_frame==ANIM_FRAMES_DEF)
        {
            timer = 0;
            sub_state = sub_state_OPEN1;
        }
        break;}//case sub_state_OPENING_ANIM
        
        
        
        
        // =========================================================================
        case sub_state_OPEN1:{ // ------------------------------------------
        if (g.gui_state==g.gui_state_OPTIONS) // To prevent game lock, in case QuitAppMenu was triggered this frame
        {
            udp_OptionsMenu();
            if (timer){timer--; break;}
            
            if (OpenClose_Key_pressed)
            {   // Close options menu from any sub menu.
                timer = 0;
                sub_state = sub_state_CLOSING1; // Start close menu
                break;//case sub_state_OPEN1
            }
            
            
            switch(menu_state){
            case   menu_state_MAIN:         {OptionsMenu_Main_update();        break;}
            case   menu_state_AUDIO_CUSTOM: {OptionsMenu_AudioCustom_update(); break;}
            case   menu_state_INPUT_CONFIG: {OptionsMenu_InputConfig_update(); break;}
            case   menu_state_DEV_TOOLS:    {OptionsMenu_DevTools_update();    break;}
            case   menu_state_RANDO:        {OptionsMenu_RandoOptions_update();break;}
            case   menu_state_OTHER:        {OptionsMenu_Other_update();       break;}
            }
        }
        break;}//case sub_state_OPEN1
        
        
        
        
        // =========================================================================
        case sub_state_CLOSING1:{ // ------------------------------------------
        udp_OptionsMenu();
        //if (timer){timer--; break;}
        
        aud_play_sound(get_audio_theme_track(dk_OpenGUI));
        timer = 0;
        sub_state = sub_state_CLOSING_ANIM;
        break;}//case sub_state_CLOSING1
        
        
        
        
        // =========================================================================
        case sub_state_CLOSING_ANIM:{ // ------------------------------------------
        //if (timer){timer--; break;}
        
        if (anim_frame)
        {
            udp_OptionsMenu();
        }
        else
        {
            timer = 0;
            sub_state = sub_state_CLOSING3;
        }
        
        anim_frame--;
        break;}//case sub_state_CLOSING_ANIM
        
        
        
        
        // =========================================================================
        case sub_state_CLOSING3:{ // ------------------------------------------
        //if (timer){timer--; break;}
        
        anim_frame      = 0;
        draw_rows_count = 0;
        MainOption      = 0;
        g.gui_state     = gui_state_backup;
        
        timer = 0;
        sub_state = sub_state_IDLE_CLOSED;
        break;}//case sub_state_CLOSING3
    }//switch(sub_state)
}//with(g.OPTIONS_MENU)


return true;




