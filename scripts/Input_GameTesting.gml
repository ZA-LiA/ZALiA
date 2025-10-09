/// Input_GameTesting()


var _i, _idx, _val, _name;


var _CTL   = keyboard_check(vk_control);
var _SHF   = keyboard_check(vk_shift);
var _ALT   = keyboard_check(vk_alt);
var _CTL0  =  _CTL && !_SHF && !_ALT; // ONLY CTL held
var _SHF0  = !_CTL &&  _SHF && !_ALT; // ONLY SHF held
var _ALT0  = !_CTL && !_SHF &&  _ALT; // ONLY ALT held
var _HELD0 =  _CTL &&  _SHF &&  _ALT; // CTL + SHF + ALT held
//var _HELD1 = keyboard_check(ord("~"));








// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
// APP PAUSING ---------------------------------------------------------
// Moved to `Surface_Draw_GUI_End()`
//update_app_pause();
















// ----------------------------------------------------------------------------
// --------------------------------------------------------------------
// Give PC faster hspd
if (GP_Other6_held    // GP_Other6: trig R
&&  g.DevTools_state 
&&  g.DevDash_state   // g.DevDash_state: toggle in options menu
&& !g.app_paused 
&& !global.pc.ogr )        // pc on ground
{
    g.DevDash_state = 2; // 0: Off, 1: On, 2: On and dash input held
}
else
{
    g.DevDash_state = sign(g.DevDash_state); // 0 or 1. // 0: Off, 1: On, 2: On and dash input held
}









// ----------------------------------------------------------------------------
// --------------------------------------------------------------------
if (DEV) // The following is for making these debug tools more accessable to me.
{
    if(!_CTL 
    && !_SHF 
    && !_ALT )
    {
        // Sequence through invulnerable state
        if (keyboard_check_pressed(ord("I")))
        {
            g.dev_invState  = (g.dev_invState&$F)+1; // removes display timer bits
            g.dev_invState *= (g.dev_invState<3);
            g.dev_invState |= $800;                  // include display timer bit
            // Display timer bit starts at $800 and shifts right once every 
            // 8 frames until bit $008, which signals the end of the display
            if (g.dev_invState&$FF) g.DevTools_state=true;
        }
        
        
        // Toggle show sprite outline
        if (keyboard_check_pressed(ord("K")))
        {
            g.DevTools_state=true;
            g.canDrawSprOutline = (g.canDrawSprOutline+1) mod 3; // Sequences 0, 1, 2
        }
        
        // Toggle show xl,yt && xc,yc coords point
        if (keyboard_check_pressed(ord("J")))
        {
            g.DevTools_state=true;
            g.canDraw_ogXY = !g.canDraw_ogXY;
        }
        
        // Toggle show og cam outline
        if (keyboard_check_pressed(ord("L")))
        {
            g.DevTools_state=true;
            g.can_draw_og_cam_outline = !g.can_draw_og_cam_outline;
        }
        
        // Toggle show cs points
        if (keyboard_check_pressed(ord("H")))
        {
            g.DevTools_state=true;
            g.can_draw_cs = !g.can_draw_cs;
        }
        
        // Toggle show hitboxes
        if (keyboard_check_pressed(ord("R")))
        {
            g.DevTools_state=true;
            g.can_draw_hb = !g.can_draw_hb;
        }
        
        // Toggle show highlighted solid tiles
        if (keyboard_check_pressed(ord("Z")))
        {
            g.DevTools_state=true;
            g.can_show_t_solid = !g.can_show_t_solid;
        }
        
        // Toggle show Exit hb
        if (keyboard_check_pressed(ord("E")))
        {
            g.DevTools_state=true;
            g.can_draw_Exit_hb = !g.can_draw_Exit_hb;
        }
        
        // Toggle show debug overlay
        if (keyboard_check_pressed(ord("U")))
        {
            g.DevTools_state=true;
            g.can_show_debug_overlay = !g.can_show_debug_overlay;
            show_debug_overlay(g.can_show_debug_overlay);
            save_game_pref();
        }
        
        // Display Entity hp
        if (keyboard_check_pressed(ord("V")))
        {
            g.DevTools_state=true;
            g.can_draw_hp = !g.can_draw_hp;
        }
        
        /*
        // Display global.app_frame_cnt
        if (keyboard_check_pressed(vk_numpad2))
        {
            g.DevTools_state=true;
            global.App_frame_count_can_draw          = !global.App_frame_count_can_draw;
            global.App_frame_count_unpaused_can_draw = !global.App_frame_count_unpaused_can_draw;
            global.Room_frame_count_can_draw         = !global.Room_frame_count_can_draw;
        }
        */
    }
}













/*
if (g.FileCleaning01_STATE 
&&  g.room_type=="A" 
&&  g.rm_name==g.FileCleaning01_rm_name 
&&  GP_Other5_held  // trig L
&&  GP_Other1_held )// xbox B
{
    if (GP_Other3_pressed  // bump L
    ||  GP_Other4_pressed )// bump R
    {
        var _COUNT = val(g.FileCleaning01_dm[?STR_Tile+STR_File+STR_Count]);
        g.FileCleaning01_current_data_id += _COUNT;
        g.FileCleaning01_current_data_id += sign_(GP_Other4_pressed);
        g.FileCleaning01_current_data_id  = g.FileCleaning01_current_data_id mod _COUNT;
        with(Exit)
        {
            if (exitName==g.FileCleaning01_rm_name+"00")
            {
                g.exit_leave = id; // triggers rm change
                break;//with(Exit)
            }
        }
    }
}
*/




/* // For testing cucco knockback
if (DEV 
&&  keyboard_check_pressed(vk_f3) )
{
    with(global.pc)
    {
        cucco_knockback_testing = (cucco_knockback_testing+1) mod 5;
        sdm(""); sdm("cucco_knockback_testing "+string(cucco_knockback_testing)); sdm("");
    }
}
*/



/* For testing different target game timings
if (0&&DEV 
&&  g.TargetGame_case 
&&  (keyboard_check_pressed(vk_f2)||keyboard_check_pressed(vk_f3)) ){
    var _TargetGame_case=g.TargetGame_case;
    if (keyboard_check_pressed(vk_f2)) g.TargetGame_case = max(g.TargetGame_case-1,$02);
    if (keyboard_check_pressed(vk_f3)) g.TargetGame_case = min(g.TargetGame_case+1,$0D);
    sdm("g.TargetGame_case $"+hex_str(_TargetGame_case)+", $"+hex_str(g.TargetGame_case));
}
*/



// --------------------------------------------------------------------
// --------------------------------------------------------------------
// --------------------------------------------------------------------
// --------------------------------------------------------------------
// --------------------------------------------------------------------
// --------------------------------------------------------------------




