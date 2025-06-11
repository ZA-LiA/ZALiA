/// update_game_window_1a()


switch(g.MouseCursor_HideVer)
{
    default:{ // Never hide
    window_set_cursor(cr_default)
    break;}
    
    case 1:{ // 1: Always hide
    window_set_cursor(cr_none)
    break;}
    
    case 2:{ // 2: Hide for fullscreen only
    if (window_get_fullscreen()) window_set_cursor(cr_none);
    else                         window_set_cursor(cr_default);
    break;}
}







// ----------------------------------------------------------------------------------------
//  POSITIONING  -----------------------------------------------------------------------
if(!window_get_fullscreen())
{
    var _WINDOW_W = window_get_width();
    var _WINDOW_H = window_get_height();
    
    
    if (g.Fullscreen_toggled 
    ||  g.WindowScale_changed )
    {
        if (window_get_x()+(_WINDOW_W>>1) != g.window_center_x 
        ||  window_get_y()+(_WINDOW_H>>1) != g.window_center_y )
        {
            window_set_position_(g.window_center_x-(_WINDOW_W>>1), g.window_center_y-(_WINDOW_H>>1));
        }
    }
    else
    {
        // Track g.window_center_x/y if window has been moved/dragged 
        // and so toggling fullscreen doesn't re-center the window.
        if (g.window_center_x != window_get_x()+(_WINDOW_W>>1) 
        ||  g.window_center_y != window_get_y()+(_WINDOW_H>>1) )
        {
            g.window_center_x  = window_get_x()+(_WINDOW_W>>1);
            g.window_center_y  = window_get_y()+(_WINDOW_H>>1);
        }
    }
}








// ----------------------------------------------------------------------------------------
if (g.Fullscreen_toggled 
||  g.WindowScale_changed )
{
    g.Fullscreen_toggled  = false;
    g.WindowScale_changed = false;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}







// ----------------------------------------------------------------------------------------
//  FULLSCREEN  --------------------------------------------------------------------

// Trying to prevent white flash on fullscreen toggle. Not sure if flash is one frame or several.
//if (window_get_colour()!=c_black)
//{   window_set_colour(   c_black);  }

//if(!g.WindowScale_changed) // If was not scaled prev frame
var _will_toggle_fullscreen = false;
if (Input.keypressed_prev==0 
&&  (keyboard_check_pressed(g.Fullscreen_KEY) || (keyboard_check_pressed(vk_escape) && window_get_fullscreen())) )
{
    if (keyboard_check_pressed(vk_escape))
    {   // As of 2025/06/11, the following app states will close with `vk_escape`
        if(!g.app_paused 
        &&  g.gui_state!=g.gui_state_OPTIONS 
        &&  g.gui_state!=g.gui_state_QUIT_APP 
        &&  g.gui_state!=g.gui_state_EDIT_PAL 
        &&  g.gui_state!=g.gui_state_GEE 
        &&  Dev_RmWarper.state==Dev_RmWarper.STATE_IDLE )
        {
            _will_toggle_fullscreen = true;
        }
    }
    else
    {
        _will_toggle_fullscreen = true;
    }
    
    //_will_toggle_fullscreen = true;
}


if(!_will_toggle_fullscreen)
{
    if (g.gui_state==g.gui_state_OPTIONS 
    &&  global.OPTIONS_MENU.menu_state==global.OPTIONS_MENU.menu_state_MAIN 
    &&  global.OPTIONS_MENU.MainOption==global.OPTIONS_MENU.MainOption_FULLSCREEN 
    && !abs(bit_dir(gui_tmr_cursor_v())) )
    {
        if (Input.Jump_pressed 
        ||  Input.Pause_pressed 
        ||  keyboard_check_pressed(vk_enter) 
        ||  keyboard_check_pressed(vk_space) 
        ||  abs(bit_dir(gui_tmr_cursor_h())) )
        {
            _will_toggle_fullscreen = true;
        }
    }
}


if (_will_toggle_fullscreen)
{
    g.Fullscreen_toggled = true;
    window_set_fullscreen(!window_get_fullscreen()); // Toggle fullscreen
    if(!window_get_fullscreen()) g.WindowScale_changed = window_set_scale(g.WindowScale_scale);
    save_game_pref();
}










// ----------------------------------------------------------------------------------------
//  SCALING  -----------------------------------------------------------------------
if(!_will_toggle_fullscreen)
{
    var _SCALE_DIR = 0;
    if (keyboard_check(vk_control) 
    //if (Input.keypressed_prev==0 
    //&&  keyboard_check(vk_control) 
    &&  keyboard_check_pressed(g.WindowScale_KEY) )
    {
        _SCALE_DIR = sign_(!keyboard_check(vk_shift));
    }
    else
    {
        if (g.gui_state==g.gui_state_OPTIONS 
        &&  global.OPTIONS_MENU.menu_state==global.OPTIONS_MENU.menu_state_MAIN 
        &&  global.OPTIONS_MENU.MainOption==global.OPTIONS_MENU.MainOption_APP_SCALE 
        && !abs(bit_dir(gui_tmr_cursor_v())) )
        {
            _SCALE_DIR = bit_dir(gui_tmr_cursor_h());
        }
    }
    
    
    if (_SCALE_DIR!=0)
    {   // scale window
        if (window_set_scale(window_get_scale()+_SCALE_DIR)) // if scale changed
        {
            g.WindowScale_changed = true; // For positioning the window on the NEXT frame
            window_set_fullscreen(false);
            save_game_pref();
        }
    }
}




/*
/// update_game_window_1a()


switch(g.MouseCursor_HideVer)
{
    default:{ // Never hide
    window_set_cursor(cr_default)
    break;}
    
    case 1:{ // 1: Always hide
    window_set_cursor(cr_none)
    break;}
    
    case 2:{ // 2: Hide for fullscreen only
    if (window_get_fullscreen()) window_set_cursor(cr_none);
    else                         window_set_cursor(cr_default);
    break;}
}







// ----------------------------------------------------------------------------------------
//  POSITIONING  -----------------------------------------------------------------------
if(!window_get_fullscreen())
{
    var _WINDOW_W = window_get_width();
    var _WINDOW_H = window_get_height();
    
    
    if (g.Fullscreen_toggled 
    ||  g.WindowScale_changed )
    {
        if (window_get_x()+(_WINDOW_W>>1) != g.window_center_x 
        ||  window_get_y()+(_WINDOW_H>>1) != g.window_center_y )
        {
            window_set_position_(g.window_center_x-(_WINDOW_W>>1), g.window_center_y-(_WINDOW_H>>1));
        }
    }
    else
    {
        // Track g.window_center_x/y if window has been moved/dragged 
        // and so toggling fullscreen doesn't re-center the window.
        if (g.window_center_x != window_get_x()+(_WINDOW_W>>1) 
        ||  g.window_center_y != window_get_y()+(_WINDOW_H>>1) )
        {
            g.window_center_x  = window_get_x()+(_WINDOW_W>>1);
            g.window_center_y  = window_get_y()+(_WINDOW_H>>1);
        }
    }
}








// ----------------------------------------------------------------------------------------
if (g.Fullscreen_toggled 
||  g.WindowScale_changed )
{
    g.Fullscreen_toggled  = false;
    g.WindowScale_changed = false;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}







// ----------------------------------------------------------------------------------------
//  FULLSCREEN  --------------------------------------------------------------------

// Trying to prevent white flash on fullscreen toggle. Not sure if flash is one frame or several.
//if (window_get_colour()!=c_black)
//{   window_set_colour(   c_black);  }

//if(!g.WindowScale_changed) // If was not scaled prev frame
var _will_toggle_fullscreen = false;
if (Input.keypressed_prev==0 
&&  (keyboard_check_pressed(g.Fullscreen_KEY) || (keyboard_check_pressed(vk_escape) && window_get_fullscreen())) )
{
    _will_toggle_fullscreen = true;
}
else
{
    if (g.gui_state==g.gui_state_OPTIONS 
    &&  global.OPTIONS_MENU.menu_state==global.OPTIONS_MENU.menu_state_MAIN 
    &&  global.OPTIONS_MENU.MainOption==global.OPTIONS_MENU.MainOption_FULLSCREEN 
    && !abs(bit_dir(gui_tmr_cursor_v())) )
    {
        if (Input.Jump_pressed 
        ||  Input.Pause_pressed 
        ||  keyboard_check_pressed(vk_enter) 
        ||  keyboard_check_pressed(vk_space) 
        ||  abs(bit_dir(gui_tmr_cursor_h())) )
        {
            _will_toggle_fullscreen = true;
        }
    }
}

if (_will_toggle_fullscreen)
{
    g.Fullscreen_toggled = true;
    window_set_fullscreen(!window_get_fullscreen()); // Toggle fullscreen
    if(!window_get_fullscreen()) g.WindowScale_changed = window_set_scale(g.WindowScale_scale);
    save_game_pref();
}










// ----------------------------------------------------------------------------------------
//  SCALING  -----------------------------------------------------------------------
if(!_will_toggle_fullscreen)
{
    var _SCALE_DIR = 0;
    if (keyboard_check(vk_control) 
    //if (Input.keypressed_prev==0 
    //&&  keyboard_check(vk_control) 
    &&  keyboard_check_pressed(g.WindowScale_KEY) )
    {
        _SCALE_DIR = sign_(!keyboard_check(vk_shift));
    }
    else
    {
        if (g.gui_state==g.gui_state_OPTIONS 
        &&  global.OPTIONS_MENU.menu_state==global.OPTIONS_MENU.menu_state_MAIN 
        &&  global.OPTIONS_MENU.MainOption==global.OPTIONS_MENU.MainOption_APP_SCALE 
        && !abs(bit_dir(gui_tmr_cursor_v())) )
        {
            _SCALE_DIR = bit_dir(gui_tmr_cursor_h());
        }
    }
    
    
    if (_SCALE_DIR!=0)
    {   // scale window
        if (window_set_scale(window_get_scale()+_SCALE_DIR)) // if scale changed
        {
            g.WindowScale_changed = true; // For positioning the window on the NEXT frame
            window_set_fullscreen(false);
            save_game_pref();
        }
    }
}




*/
