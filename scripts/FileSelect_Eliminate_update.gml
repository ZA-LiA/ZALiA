/// FileSelect_Eliminate_update()


var _i, _val, _num;


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
}//switch(GUI_NAV_VER)

if (_cursor_dir!=0)
{
    FileSelect_cursor_move(State_ELIMINATE,_cursor_dir);
    REGISTER_new_save_file_name = 0;
    aud_play_sound(get_audio_theme_track(CURSOR_SOUND_THEME2));
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




if (input_start_pressed)
{
    if (Eliminate_cursor<SAVE_FILE_MAX) // SAVE FILE: Eliminate file
    {
        var _file;
        var _FILE_NUM = Eliminate_cursor+1;
        
        // Erase rando data files
        f.dl_save_names[|_FILE_NUM-1] = SAVE_NAME_NULL;
        file_save(_FILE_NUM,true);
        FileSelect_clear_save_file_rando_info(_FILE_NUM); // clear data in `SaveFileRandoInfo_dm` for this file
        
        /*
        var _RANDO_DATA_FILE_NAME = f.dl_FILE_NAME_PREFIX[|_FILE_NUM-1]+STR_Rando+STR_Data+".txt";
        _file = file_text_open_write(working_directory+_RANDO_DATA_FILE_NAME);
                file_text_write_string(_file," ");
                file_text_close(_file);
        //
        var _RANDO_SPOILER_FILE_NAME = f.dl_FILE_NAME_PREFIX[|_FILE_NUM-1]+STR_Rando+"_Spoiler"+".txt";
        _file = file_text_open_write(working_directory+_RANDO_SPOILER_FILE_NAME);
                file_text_write_string(_file," ");
                file_text_close(_file);
        //
        */
        
        randomize();
        FileSelect_change_rando_seed(_FILE_NUM,random_get_seed());
        
        FileSelect_cursor_move(State_ELIMINATE,1);
        aud_play_sound(get_audio_theme_track(dk_EliminateFile));
    }
    else // END: Go to Register or Main
    {
        var _file_num;
        Register_file_num = 0;
        for(_i=0; _i<SAVE_FILE_MAX; _i++)
        {
            _file_num = _i+1;
            if(!get_saved_value(_file_num, f.SDNAME_saveCreated, 0))
            {
                Register_file_num = _file_num;
                break;//_i
            }
        }
        
        if (Register_file_num) // Go to Register
        {
            Register_cursor  = Register_file_num-1;
            RandoMAIN_cursor = 0;
            
            cue_change_state = CUE_CHANGE_STATE_3A;
            cue_cover_start  = CUE_COVER_START_3A;
            cue_cover_stop   = CUE_COVER_STOP_3A;
            
            g.counter1 = 0;
            state_previous   = state;
            state_pending    = State_REGISTER;
            state            = State_NULL;
        }
        else // Go to Main
        {
            RandoMAIN_cursor = 0;
            
            cue_change_state = CUE_CHANGE_STATE_1B;
            cue_cover_start  = CUE_COVER_START_1B;
            cue_cover_stop   = CUE_COVER_STOP_1B;
            
            g.counter1 = 0;
            state_pending    = State_MAIN;
            state            = State_NULL;
        }
    }
}




