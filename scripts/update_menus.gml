/// update_menus()


// C206
/*
if (g.menu_state 
&&  g.ldwState<2 ) // PauseMenu & LevelUp
{
    // C212: JSR D250       - set all GO canDrawSelf = false
    //update_D250();
    
    // I think this is here and before GOB update to make LevelUp a priority. It interups PauseMenu before it opens & prevents an NPC from starting dialogue
    // C215: JSR 968D       - Activate Level-up menu
    //if (f.xp>=f.xpNext) g.gui_state = g.GUI_LU;
    //scr_Menu_2a();
}
*/




gui_window_can_draw = 1;


// ----------------------------------------------------------------------
// ----------------------------------------------------------------------
// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

// C218
if (gui_state==gui_state_DIALOGUE1 
||  gui_state==gui_state_DIALOGUE2 
||  gui_state==gui_state_DIALOGUE3 )
{   // C245 - Dialogue Window
    // if(!mod_FIX_SOFTLOCK_LVLUP_2 
    // &&  f.xp >= f.xpNext )
    with(DIALOGUE_WINDOW) update_Dialogue();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




switch(gui_state)
{
    // -----------------------------------------------------------------
    // -----------------------------------------------------------------
    case gui_state_NONE:{ //   -----------------------------------------
    if (f.xp>=f.xpNext)
    {   // Open LevelUp Menu
        gui_state = gui_state_LEVEL_UP;
        //break;
    }
    else if (Input.Pause_pressed)
    //if ( Input.Pause_held          // Start btn $10
    //&& !(Input.heldPrev&Input.S) ) // Start btn $10
    {   // Open Pause Menu
        gui_state = gui_state_PAUSE;
        menu_state = 1;
        PAUSE_MENU.state = PAUSE_MENU.state_SPELL;
        //sdm("update_menus(). gui_state==gui_state_PAUSE: "+string(gui_state==gui_state_PAUSE));
    }
    break;}//case gui_state_NONE
    
    
    
    
    
    
    
    
    // -----------------------------------------------------------------
    // -----------------------------------------------------------------
    case gui_state_PAUSE:{ // SPELL/ITEM/MAP  ----------------------------
    if!(pc_lock&PC_LOCK_MENU)
    {
        // C212: JSR D250       - set all GO.can_draw_self = false
        if (menu_state) set_go_can_draw_self(false);
        
        // 9D91 - Pause Menu
        with(PAUSE_MENU) PauseMenu_update();
    }
    else
    //if (pc_lock&PC_LOCK_MENU)
    {
        gui_state  = gui_state_NONE;
        menu_state = 0;
        //exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //sdm("update_menus(). Exiting PauseMenu. gui_state==gui_state_NONE");
    }
    break;}//case gui_state_PAUSE
    
    
    
    
    
    
    
    
    // -----------------------------------------------------------------
    // -----------------------------------------------------------------
    case gui_state_LEVEL_UP:{ // LEVEL UP  ------------------------------------
    // C212: JSR D250       - set all GO.canDrawSelf = false
    if (menu_state) set_go_can_draw_self(false);
    
    // 9D54 - Level-up Menu
    with(LEVEL_MENU) update_LevelUp();
    break;}//case gui_state_LEVEL_UP
    
    
    
    
    
    
    
    
    // -----------------------------------------------------------------
    // -----------------------------------------------------------------
    //case 3:{break;} //   ------------------------------------
}//switch(gui_state)




