/// FileSelect_Main_update()


var _i;


var _cursor_dir = 0;
switch(global.GUI_NAV1_VER)
{
    default:{
    _cursor_dir = sign(input_select_pressed);
    break;}
    
    case 2:{
        _cursor_dir = bit_dir(gui_tmr_cursor_v());
    if (_cursor_dir==0)
    {   _cursor_dir = sign(input_select_pressed);  }
    break;}
}//switch(global.GUI_NAV1_VER)

if (_cursor_dir!=0)
{
    FileSelect_cursor_move(State_MAIN,_cursor_dir);
    cursor_name = 0;
    aud_play_sound(get_audio_theme_track(dk_CursorFileSelect));
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




if (input_start_pressed) // OPTION HAS BEEN SELECTED
{
    if (Main_cursor<SAVE_FILE_MAX) // Go to Play game
    {
        ds_map_clear(g.dm_room_history);
        
        // in case switching files and prev file changed data in these datasets
        ds_map_copy(g.dm_spawn, g.dm_spawn_DEFAULT);
        ds_map_copy(f.dm_PBags, f.dm_PBags_DEFAULT);
        ds_map_copy(f.dm_1up_doll, f.dm_1up_doll_DEFAULT);
        ds_map_copy(f.dm_keys, f.dm_keys_DEFAULT);
        
        ds_list_copy(g.dl_XP, g.dl_XP_DEFAULT);
        ds_list_copy(g.dl_HP, g.dl_HP_DEFAULT);
        
        ds_grid_copy(g.dg_spell_cost, g.dg_spell_cost_DEFAULT);
        ds_grid_copy(f.dg_xp_next, f.dg_xp_next_DEFAULT);
        ds_grid_copy(g.dg_enemy_damage, g.dg_enemy_damage_DEFAULT);
        
        ds_map_clear(global.dm_randomized_tiles01);
        
        set_save_props_def();
        save_num_selected = Main_cursor+1;
        file_load(save_num_selected);
        if (g.mod_ContinueFrom&g.mod_ContinueFrom_TWN2) f.reen_new_run = get_continue_reen();
        //sdm("g.mod_ContinueFrom&g.mod_ContinueFrom_TWN2: $"+hex_str(g.mod_ContinueFrom&g.mod_ContinueFrom_TWN2)+", g.CF_FILE: $"+hex_str(g.CF_FILE)+", g.comingFrom: $"+hex_str(g.comingFrom)+", f.reen_new_run: "+f.reen_new_run+", f.cont_run_town_num: "+hex_str(f.cont_run_town_num));
        //sdm("val(g.dm_town_data[?STR_Continue+STR_Exit+STR_Town+STR_Num+hex_str(f.cont_run_town_num)]): "+string(val(g.dm_town_data[?STR_Continue+STR_Exit+STR_Town+STR_Num+hex_str(f.cont_run_town_num)])));
        
        cue_change_state = -1;
        g.counter1 = 0;
        state_previous = state;
        state = State_NULL;
    }
    else if (Main_cursor==SAVE_FILE_MAX) // Go to Register
    {
        FileSelect_init_rando_settings();
        
        RandoMAIN_cursor  = 0;
        RandoITEM_cursor  = 0;
        RandoSPELL_cursor = 0;
        RandoENEMY_cursor = 0;
        
        Register_file_num = 1;
        for(_i=1; _i<=SAVE_FILE_MAX; _i++)
        {
            if(!get_saved_value(_i, f.SDNAME_saveCreated, 0))
            {
                Register_file_num = _i;
                break;//_i
            }
        }
        
        Register_cursor  = Register_file_num-1;
        
        FileSelect_clear_save_file_rando_info(Register_file_num); // clear data in `SaveFileRandoInfo_dm` for this file
        
        cue_change_state = CUE_CHANGE_STATE_1A;
        cue_cover_start  = CUE_COVER_START_1A;
        cue_cover_stop   = CUE_COVER_STOP_1A;
        
        g.counter1 = 0;
        state_previous = state;
        state_pending  = State_REGISTER;
        state          = State_NULL;
    }
    else if (Main_cursor==SAVE_FILE_MAX+1) // Go to Elimination
    {
        cue_change_state = CUE_CHANGE_STATE_2A;
        cue_cover_start  = CUE_COVER_START_2A;
        cue_cover_stop   = CUE_COVER_STOP_2A;
        
        g.counter1 = 0;
        state_previous = state;
        state_pending  = State_ELIMINATE;
        state          = State_NULL;
    }
}




