/// g_Step()


// An Extension so that Windows Sleep Margin in 
// Global Game Settings doesn't need to be maxed at 15 
// to get smooth performance and avoid stuttering/jittering.
if (scheduler_resolution_get()!=1)
{   scheduler_resolution_set(1);  }


// Added this to help decrease large room loading times.
global.delta_target     = 1 / room_speed;
global.delta_actual     = delta_time / 1000000;
global.delta_multiplier = global.delta_actual / global.delta_target;
//show_debug_message('delta_time: '+string(delta_time)+', delta_target: '+string(delta_target)+', delta_actual: '+string(delta_actual)+', delta_multiplier: '+string(delta_multiplier));


global.App_frame_count++;


// --------------------------------------------------------------------
with(Input) Input_update1(); // Gamepad input checks. gp1,2,3,4, bumpers, triggers, fpb: frame pause buttons, keypressed_prev, keypressed_curr
with(Input) Input_GameTesting();


update_game_window_1a(); // app window scale and positioning


update_QuestTimer();


if(!can_update_frame()) // for pausing during dev
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



global.App_frame_count_unpaused++;
global.Room_frame_count++;

counter0 = (counter0+1)&$FF;


// --------------------------------------------------------------------
spell_cast_this_frame = 0;
dialogue_started_this_frame = false;




// --------------------------------------------------------------------
// --------------------------------------------------------------------
// --------------------------------------------------------------------
// --------------------------------------------------------------------
// --------------------------------------------------------------------
// --------------------------------------------------------------------


// C12F: JSR C1C1,   C1C6
Audio_update();

// C132  - Input
with(Input) Input_update2(); // determine inputs for this frame




if (room_type=="C" 
&&  overworld_paused )
{
    if ((Input.GP_Other5_held && Input.GP_Other6_held && Input.GP_Other1_held)  // Other5: LT, Other6: RT, Other1: Xbox B
    ||  (keyboard_check(vk_control) && keyboard_check(vk_backspace)) )
    {
        if(!global.OverworldSoftlock_timer)
        {
            global.OverworldSoftlock_timer = global.OverworldSoftlock_DURATION0;
        }
        else
        {
            global.OverworldSoftlock_timer--;
            if(!global.OverworldSoftlock_timer)
            {
                room_goto_(rmB_ContinueSave);
            }
        }
    }
    else
    {
        global.OverworldSoftlock_timer = 0;
    }
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}








// --------------------------------------------------------------------
// --------------------------------------------------------------------
if(!update_QuitAppMenu() 
&& !update_OptionsMenu() )
{
    if(!update_change_room()) // if not changing rm
    {
        // --------------------------------------------------------------------
        switch(room_type){
        case "A":{g_Step_A1(); break;} // menus, out of bounds fail safe
        case "B":{g_Step_B1(); break;} // Title Screen, File Select, Next Life, Game Over, etc..
        case "C":{with(global.OVERWORLD) Overworld_Step(); break;} // Overworld
        }
        
        d_l0__oo__0l_b();
        
        
        // --------------------------------------------------------------------
        // C14E
        var _GUI_CONDITION =  gui_state==gui_state_NONE 
                          ||  gui_state==gui_state_DIALOGUE1 
                          ||  gui_state==gui_state_DIALOGUE2 
                          ||  gui_state==gui_state_DIALOGUE3;
        //
        if (_GUI_CONDITION  // g.gui_state is 0 or dialogue
        && !global.OVERWORLD.flute_timer )
        {   // C169  - Timers
            update_game_timers();
            // C185  - Random numbers
            update_og_rand();
        }
        
        
        // --------------------------------------------------------------------
        if (    EnterRoom_SpawnGO_timer)
        {
                EnterRoom_SpawnGO_timer--;
            if(!EnterRoom_SpawnGO_timer)
            {
                go_spawn_enter_room();
            }
        }
        
        
        // --------------------------------------------------------------------
        // Main update
        if (room_type=="A" 
        && !EnterRoom_SpawnGO_timer 
        &&  _GUI_CONDITION ) // g.gui_state is 0 or dialogue
        {
            g_Step_A2();
        }
    }
    
    
    
    
    // --------------------------------------------------------------------
    // --------------------------  CUTSCENES  -----------------------------
    cutscene_update();
}




