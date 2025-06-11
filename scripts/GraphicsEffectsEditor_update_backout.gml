/// GraphicsEffectsEditor_update_backout(cursor is Back, *new menu_state)


if (pressed_backout 
||  (argument[0] && pressed_confirm1) )
{
    GraphicsEffectsEditor_reset_cursors(-1);
    
    if (menu_state==menu_focus_Main)
    {
        g.gui_state = g.gui_state_NONE;
        /*
        if (gui_state_at_sess_start!=g.gui_state_OPTIONS) g.gui_state = gui_state_at_sess_start;
        else                                              g.gui_state = g.gui_state_NONE;
        //g.gui_state = gui_state_at_sess_start;
        */
        state = state_CLOSED;
    }
    
    if (argument_count>1) menu_state = argument[1];
    else                  menu_state = menu_focus_Main;
    
    
    aud_play_sound(SOUND_BACK, -1,-1, SOUND_VOLUME);
    timer = DURATION1;
    return true;
}


return false;




