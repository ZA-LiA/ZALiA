/// OptionsMenu_InputConfig_update()


// TODO: Add a keyboard controls re-binding system.

switch(InputConfigState)
{
    // ====================================================================
    // -----------------------------------------------------------
    case InputConfigState_MAIN:{
    //if (timer2) break;//case InputConfigState_MAIN
    
    if(!timer)
    {
        var _CLOSE = Backout_requested;
        if(!_CLOSE)
        {
            if (keyboard_check_pressed(vk_space) 
            ||  keyboard_check_pressed(vk_enter) 
            ||  a_button_pressed 
            ||  start_button_pressed )
            {
                switch(InputConfigOption)
                {
                    case InputConfigOption_BACK:{
                    _CLOSE = true;
                    break;}//switch(InputConfigOption)
                    
                    case InputConfigOption_DEFAULT:{
                    gamepad_set_default();
                    aud_play_sound(CONFIRM_SOUND1);
                    timer = DURATION1;
                    break;}//switch(InputConfigOption)
                    
                    default:{
                    aud_play_sound(CONFIRM_SOUND1);
                    timer = DURATION1;
                    //timer = $10;
                    InputConfigState = InputConfigState_EDITING;
                    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    break;}//switch(InputConfigOption)
                }
            }
        }
        
        if (_CLOSE)
        {
            aud_play_sound(BACK_SOUND1);
            timer = DURATION1;
            menu_state = menu_state_MAIN;
            break;//case InputConfigState_MAIN
        }
    }
    
    
    
    // update cursor
    if(!timer2)
    {
        var     _Cursor_DIR = bit_dir(gui_tmr_cursor_v()); // 0,1,-1
        if (abs(_Cursor_DIR))
        {
            InputConfigOption += InputConfigOption_COUNT;
            InputConfigOption += _Cursor_DIR; // 1,-1
            InputConfigOption  = InputConfigOption mod InputConfigOption_COUNT;
            aud_play_sound(CURSOR_SOUND1);
            timer2 = DURATION2;
            break;//case InputConfigState_MAIN
        }
    }
    break;}//case InputConfigState_MAIN
    
    
    
    
    
    
    
    
    // ====================================================================
    // -----------------------------------------------------------
    case InputConfigState_EDITING:{
    if (timer) break;//case InputConfigState_EDITING
    
    if (keyboard_check_pressed(vk_escape) 
    ||  keyboard_check_pressed(vk_backspace) )
    //if (OpenClose_Key_pressed 
    //||  keyboard_check_pressed(vk_escape) )
    {
        aud_play_sound(BACK_SOUND1);
        timer = DURATION1;
        InputConfigState = InputConfigState_MAIN;
        break;//case InputConfigState_EDITING
    }
    
    
    if (Input.GP_pressed)
    {
        var                                   _pressed_val=0;
             if (Input.GP_DPadR_pressed)      _pressed_val=gp_padr; // dpad right
        else if (Input.GP_DPadL_pressed)      _pressed_val=gp_padl; // dpad left
        else if (Input.GP_DPadD_pressed)      _pressed_val=gp_padd; // dpad down
        else if (Input.GP_DPadU_pressed)      _pressed_val=gp_padu; // dpad up
        else if (Input.GP_Face1_pressed)      _pressed_val=gp_face1; // Xbox A button
        else if (Input.GP_Face2_pressed)      _pressed_val=gp_face2; // Xbox B button
        else if (Input.GP_Face3_pressed)      _pressed_val=gp_face3; // Xbox X button
        else if (Input.GP_Face4_pressed)      _pressed_val=gp_face4; // Xbox Y button
        else if (Input.GP_Select_pressed)     _pressed_val=gp_select;
        else if (Input.GP_Start_pressed)      _pressed_val=gp_start;
        else if (Input.GP_Shoulder1L_pressed) _pressed_val=gp_shoulderl;  // Bumper L
        else if (Input.GP_Shoulder1R_pressed) _pressed_val=gp_shoulderr;  // Bumper R
        else if (Input.GP_Shoulder2L_pressed) _pressed_val=gp_shoulderlb; // Trigger L
        else if (Input.GP_Shoulder2R_pressed) _pressed_val=gp_shoulderrb; // Trigger R
        
        var                              _option_val=0;
        switch(InputConfigOption){
        case   InputConfigOption_RIGHT: {_option_val=Input.GP_right;  break;}
        case   InputConfigOption_LEFT:  {_option_val=Input.GP_left;   break;}
        case   InputConfigOption_DOWN:  {_option_val=Input.GP_down;   break;}
        case   InputConfigOption_UP:    {_option_val=Input.GP_up;     break;}
        case   InputConfigOption_MAGIC: {_option_val=Input.GP_magic;  break;}
        case   InputConfigOption_PAUSE: {_option_val=Input.GP_pause;  break;}
        case   InputConfigOption_ATTACK:{_option_val=Input.GP_attack; break;}
        case   InputConfigOption_JUMP:  {_option_val=Input.GP_jump;   break;}
        }
        
        if (_pressed_val 
        &&  _option_val )
        {
            if (_option_val != _pressed_val )
            {
                // Swap with any action already set to _pressed_val (to prevent duplicate assignments)
                switch(_pressed_val){
                case Input.GP_right: {Input.GP_right =_option_val; break;}
                case Input.GP_left:  {Input.GP_left  =_option_val; break;}
                case Input.GP_down:  {Input.GP_down  =_option_val; break;}
                case Input.GP_up:    {Input.GP_up    =_option_val; break;}
                case Input.GP_magic: {Input.GP_magic =_option_val; break;}
                case Input.GP_pause: {Input.GP_pause =_option_val; break;}
                case Input.GP_attack:{Input.GP_attack=_option_val; break;} // XBox X
                case Input.GP_jump:  {Input.GP_jump  =_option_val; break;} // XBox A
                case Input.GP_other1:{Input.GP_other1=_option_val; break;} // XBox B
                case Input.GP_other2:{Input.GP_other2=_option_val; break;} // XBox Y
                case Input.GP_other3:{Input.GP_other3=_option_val; break;} // Bumper L
                case Input.GP_other4:{Input.GP_other4=_option_val; break;} // Bumper R
                case Input.GP_other5:{Input.GP_other5=_option_val; break;} // Trigger L
                case Input.GP_other6:{Input.GP_other6=_option_val; break;} // Trigger R
                }
                
                // Set action to button pressed
                switch(InputConfigOption){
                case   InputConfigOption_RIGHT: {Input.GP_right =_pressed_val; break;}
                case   InputConfigOption_LEFT:  {Input.GP_left  =_pressed_val; break;}
                case   InputConfigOption_DOWN:  {Input.GP_down  =_pressed_val; break;}
                case   InputConfigOption_UP:    {Input.GP_up    =_pressed_val; break;}
                case   InputConfigOption_MAGIC: {Input.GP_magic =_pressed_val; break;}
                case   InputConfigOption_PAUSE: {Input.GP_pause =_pressed_val; break;}
                case   InputConfigOption_ATTACK:{Input.GP_attack=_pressed_val; break;}
                case   InputConfigOption_JUMP:  {Input.GP_jump  =_pressed_val; break;}
                }
                
                
                with(Input)
                {
                    var _datakey,_datakey1;
                    var _GP_NAME = gamepad_get_description(gamepad_slot);
                    
                    var _num = val(dm_UserInputConfig[?_GP_NAME+"_gamepad_num"]);
                    if(!_num) // New gamepad
                    {   _num=0;
                        while(true)
                        {   _datakey = "gamepad"+hex_str(++_num);
                            if (is_undefined(dm_UserInputConfig[?_datakey+"_name"])) break;//while(true)
                        }
                    }
                    
                    _datakey  = "gamepad"+hex_str(_num);
                    _datakey1 = _datakey+"_gp_";
                    
                    dm_UserInputConfig[?_GP_NAME+"_gamepad_num"]= _num;
                    dm_UserInputConfig[?_datakey+"_name"]       = _GP_NAME;
                    
                    dm_UserInputConfig[?_datakey1+"right"]      = GP_right;
                    dm_UserInputConfig[?_datakey1+"left"]       = GP_left;
                    dm_UserInputConfig[?_datakey1+"down"]       = GP_down;
                    dm_UserInputConfig[?_datakey1+"up"]         = GP_up;
                    
                    dm_UserInputConfig[?_datakey1+"magic"]      = GP_magic;
                    dm_UserInputConfig[?_datakey1+"pause"]      = GP_pause;
                    
                    dm_UserInputConfig[?_datakey1+"jump"]       = GP_jump;   // Xbox A
                    dm_UserInputConfig[?_datakey1+"attack"]     = GP_attack; // Xbox X
                    
                    dm_UserInputConfig[?_datakey1+"other1"]     = GP_other1; // Xbox B
                    dm_UserInputConfig[?_datakey1+"other2"]     = GP_other2; // Xbox Y
                    dm_UserInputConfig[?_datakey1+"other3"]     = GP_other3; // bump L
                    dm_UserInputConfig[?_datakey1+"other4"]     = GP_other4; // bump R
                    dm_UserInputConfig[?_datakey1+"other5"]     = GP_other5; // trig L
                    dm_UserInputConfig[?_datakey1+"other6"]     = GP_other6; // trig R
                    
                    //sdm(" User input config saved. "+"Gamepad name: "+_GP_NAME+", _gamepad_num "+hex_str(_num)+", "+_datakey1);
                }
                
                
                save_game_pref();
                aud_play_sound(CONFIRM_SOUND1);
                //aud_play_sound(CONFIRM_SOUND2);
                timer = DURATION1;
            }
        }
        else
        {
            aud_play_sound(BACK_SOUND1);
            timer = DURATION1;
        }
        
        InputConfigState = InputConfigState_MAIN;
    }
    break;}//case InputConfigState_EDITING
    
    
    
    
    
    
    
    
    /*
    // ====================================================================
    // -----------------------------------------------------------
    default:{
    if (timer2) break;//default
    
    aud_play_sound(BACK_SOUND1);
    timer = 0;
    menu_state = menu_state_MAIN;
    break;}//default
    */
    
}//switch(InputConfigState)




