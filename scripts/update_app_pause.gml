/// update_app_pause()


with(Input)
{
    g.app_adv_frame = g.app_paused && GP_Other4_pressed; // if app paused && BR pressed
    
    
    if (GP_Other4_released  // BR released
    || !GP_Other4_held )    // BR NOT held
    {
        g.adv_frame_held_counter = 0;
    }
    
    if (GP_Other4_held)     // BR held
    {
        if (g.adv_frame_held_counter<$18)
        {
            g.adv_frame_held_counter++;
        }
        else
        {
            g.app_adv_frame = true;
        }
        
        if (g.app_paused)
        {
            exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        }
    }
    
    
    
    
    if (g.app_paused 
    && !GP_Other4_held )       // BR NOT held
    {
        if (GP_Other3_pressed  // BL pressed
        ||  keyboard_check_pressed(vk_escape) )
        //||  keyboard_check_pressed(global.AppPause_unpause_key) )
        {
            g.app_paused = false;
        }
    }
    
    if(!g.app_paused 
    &&  GP_Shoulder2L_held      // TL held
    &&  GP_Shoulder2R_held      // TR held
    &&  GP_Shoulder1R_held      // BR held
    &&  GP_Shoulder1L_pressed ) // BL pressed
    {
        g.app_paused = true;
    }
}




