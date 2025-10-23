/// FileSelect_Register_update()


var _i, _val;
var _datakey1;


var _cursor_dir = 0;
switch(global.GUI_NAV1_VER)
{
    default:{
    _cursor_dir = sign(input_select_pressed);
    break;}
    
    case 2:{
    if (Register_cursor>=SAVE_FILE_MAX)
    {   _cursor_dir = bit_dir(gui_tmr_cursor_v());  }
    if (_cursor_dir==0)
    {   _cursor_dir = input_select_pressed;  }
    break;}
}//switch(GUI_NAV_VER)

if (_cursor_dir!=0)
{
    FileSelect_cursor_move(State_REGISTER,_cursor_dir);
    aud_play_sound(get_audio_theme_track(CURSOR_SOUND_THEME2));
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



if (Register_cursor<SAVE_FILE_MAX) // SAVE FILE
{
    if (input_b_pressed 
    ||  input_a_pressed 
    ||  input_start_pressed )
    {
        if (input_a_pressed 
        ||  input_start_pressed )
        {
            var              _IDX  = Register_file_num-1;
            f.dl_save_names[|_IDX] = string_delete(      f.dl_save_names[|_IDX], REGISTER_new_save_file_name+1, 1);
            
            _val = string_char_at(CharTable_CHARS,CharTable_cursor_char+1);
            f.dl_save_names[|_IDX] = string_insert(_val, f.dl_save_names[|_IDX], REGISTER_new_save_file_name+1);
        }
        
        REGISTER_new_save_file_name = (REGISTER_new_save_file_name+1+SAVE_NAME_CHAR_LIMIT) mod SAVE_NAME_CHAR_LIMIT;
        aud_play_sound(get_audio_theme_track(CONFIRM_SOUND_THEME1));
    }
    else if (Input.pressedHV)
    {
        FS_cursor_char_move();
    }
}
else if (Register_cursor==SAVE_FILE_MAX) // RANDO
{
    if (input_start_pressed)
    {
        g.counter1 = 0;
        RandoMAIN_cursor = 0;
        
        cue_change_state = CUE_CHANGE_STATE_1B;
        cue_cover_start  = CUE_COVER_START_1B;
        cue_cover_stop   = CUE_COVER_STOP_1B;
        
        aud_play_sound(get_audio_theme_track(CONFIRM_SOUND_THEME1));
        state_pending = State_RANDO;
        state         = State_NULL;
    }
}
else if (Register_cursor>SAVE_FILE_MAX) // END
{
    if (input_start_pressed)
    {
        var _FILE_NUM = Register_file_num;
        if(!get_saved_value(_FILE_NUM,f.SDNAME_saveCreated,0))
        {
            var _is_empty=true;
            for(_i= string_length( f.dl_save_names[|_FILE_NUM-1]); _i>=1; _i--)
            {
                if (string_char_at(f.dl_save_names[|_FILE_NUM-1],_i)!=" ")
                {
                    _is_empty=false;
                    break;//_i
                }
            }
            
            if (_is_empty) f.dl_save_names[|_FILE_NUM-1] = "-";
            FileSelect_register_file(_FILE_NUM);
        }
        /*
        var _SAVE_NAME = f.dl_save_names[|_FILE_NUM-1];
        if (_SAVE_NAME != SAVE_NAME_NULL 
        && !get_saved_value(_FILE_NUM,f.SDNAME_saveCreated,0) )
        {
            FileSelect_register_file(_FILE_NUM);
        }
        */
        
        cue_change_state = CUE_CHANGE_STATE_1B;
        cue_cover_start  = CUE_COVER_START_1B;
        cue_cover_stop   = CUE_COVER_STOP_1B;
        
        g.counter1 = 0;
        state_pending = State_MAIN; // Go to Main
        state         = State_NULL;
    }
}




