/// GraphicsEffectsEditor_Step()


if (timer) timer--;


//var _pressed_enable_editor = keyboard_check_pressed(vk_f5);
//var _pressed_enable_editor = keyboard_check(vk_control) && keyboard_check_pressed(vk_f4);


switch(state)
{   // -------------------------------------------------
    case state_CLOSED:{
    if (timer) break;
    
    /*
    if (_pressed_enable_editor)
    {
        GraphicsEffectsEditor_reset_cursors(Main_ENABLE);
        menu_state = menu_focus_Main;
        timer = DURATION1;
        state = state_OPEN;
    }
    */
    break;}//case state_CLOSED
    
    
    
    
    // -------------------------------------------------
    case state_OPEN_INIT:{
    if (timer) break;
    
    GraphicsEffectsEditor_reset_cursors(Main_ENABLE);
    menu_state = menu_focus_Main;
    timer = DURATION1;
    state = state_OPEN;
    break;}//case state_OPEN_INIT
    
    
    
    
    // -------------------------------------------------
    case state_OPEN:{
    //if (timer) break;
    
    /*
    if (_pressed_enable_editor)
    {
        timer = DURATION1;
        state = state_CLOSED;
        break;//case state_OPEN
    }
    */
    
    pressed_start  = Input.Pause_pressed;
    pressed_select = Input.Magic_pressed;
    pressed_a      = Input.Jump_pressed;
    pressed_b      = Input.Other1_pressed;
    pressed_right  = Input.Right_pressed;
    pressed_left   = Input.Left_pressed;
    pressed_down   = Input.Down_pressed;
    pressed_up     = Input.Up_pressed;
    
    pressed_confirm1 = pressed_start || pressed_a;
    pressed_confirm2 = pressed_confirm1 || pressed_right;
    pressed_backout  = pressed_b || keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_backspace);
    
    pressed_move_cursor_h = pressed_right || pressed_left;
    pressed_move_cursor_v = pressed_up || pressed_down;
    //pressed_move_cursor_v = pressed_up || pressed_down || pressed_select;
    
    switch(menu_state){
    case menu_focus_Main:{      GraphicsEffectsEditor_update_Main();       break;}//case menu_focus_Main
    case menu_focus_Brightness:{GraphicsEffectsEditor_update_Brightness(); break;}//case menu_focus_Brightness
    case menu_focus_Saturation:{GraphicsEffectsEditor_update_Saturation(); break;}//case menu_focus_Saturation
    case menu_focus_Scanlines:{ GraphicsEffectsEditor_update_Scanlines();  break;}//case menu_focus_Scanlines
    case menu_focus_Bloom:{     GraphicsEffectsEditor_update_Bloom();      break;}//case menu_focus_Bloom
    case menu_focus_Blur:{      GraphicsEffectsEditor_update_Blur();       break;}//case menu_focus_Blur
    }//switch(menu_state)
    break;}//case state_OPEN
}//switch(state)




