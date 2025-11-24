/// update_QuestTimer()


if (global.QuestTimer_state)
//&&  global.HUD_state )
{
    if (room_type=="A" 
    ||  room_type=="C" 
    ||  room==rmB_Death 
    ||  room==rmB_NextLife )
    {
        if (room_type!="C" 
        || !overworld_paused )
        {
            if (global.QuestTimer_state==1 
            && !game_end_state 
            &&  can_update_frame() 
            &&  gui_state!=gui_state_OPTIONS   // Options Menu
            &&  gui_state!=gui_state_QUIT_APP  // Quit App Menu
            &&  gui_state!=gui_state_EDIT_PAL  // Palette Editor
            &&  gui_state!=gui_state_GEE )     // Graphics Effects Editor
            {
                global.QuestTimer_time += delta_time;
            }
        }
        
        var _val;
        var _SECONDS = global.QuestTimer_time div 1000000;
        var _MINUTES = _SECONDS div 60;
        var _HOURS   = _MINUTES div 60;
        
        _val = string(_HOURS);
        global.QuestTimer_text  = _val;
        global.QuestTimer_text += ":";
        _val = string(_MINUTES mod 60);
        _val = string_repeat("0", 2-string_length(_val)) + _val;
        global.QuestTimer_text += _val;
        global.QuestTimer_text += ":";
        _val = string(_SECONDS mod 60);
        _val = string_repeat("0", 2-string_length(_val)) + _val;
        global.QuestTimer_text += _val;
        /* // milliseconds
        global.QuestTimer_text += ".";
        _val = string((global.QuestTimer_time div 10000) mod 100);
        _val = string_repeat("0", 2-string_length(_val)) + _val;
        global.QuestTimer_text += _val;
        */
        
        global.QuestTimer_xl = $4;
        //global.QuestTimer_xl = $8;
        //global.QuestTimer_xl  = sprite_get_width(global.dl_game_font[|global.game_font_idx]) * $0E;
        //global.QuestTimer_xl -= sprite_get_width(global.dl_game_font[|global.game_font_idx]) * string_length(global.QuestTimer_text);
        
        global.QuestTimer_yt = global.HUD_YOFF1;
        //global.QuestTimer_yt = $8;
    }
}


if (global.QuestTimer_state 
&&  global.QuestTimer_show 
&&  gui_state!=gui_state_EDIT_PAL 
&&  gui_state!=gui_state_GEE 
&& !game_end_state )
{
    if (room_type=="A" 
    ||  room_type=="C" 
    ||  room==rmB_Death 
    ||  room==rmB_NextLife )
    {
        global.QuestTimer_can_draw = true;
    }
}




