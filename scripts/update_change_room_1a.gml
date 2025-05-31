/// update_change_room_1a()


// ------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------
// ---------------------------   CHANGE ROOM   ----------------------------------------------
var _i, _num, _datakey;
var _EXITING_RM     = is_exiting_rm();
var _EXITING_OW     = is_exiting_ow();
var _EXITING_RM_ENC = _EXITING_RM && rm_get_encounter_types(rm_name);




// ------------------------------------------------------------------
// reen: Room-Entry Exit-Name
//f.reen = REEN_DEFAULT;

if (room==rmB_NextLife)
{
    switch(coming_from)
    {
        case coming_from_FILE:{ // coming from FileSelect
        f.reen = f.reen_new_run;
        break;}
        
        case coming_from_CONT:{ // coming from ContinueSave
        f.reen = get_continue_reen();
        break;}
        
        case coming_from_DEAD:{ // coming from a death
        _datakey = val(dm_room_history[?STR_Last+STR_Rm+"A"+STR_Datakey], STR_undefined);
        f.reen   = val(dm_room_history[?_datakey+STR_reen], f.reen);
        break;}
    }
}
else if (_EXITING_RM)
{
    f.reen = exit_leave.goToExitName;
}
else if (_EXITING_OW)
{
    _datakey = hex_str(global.OVERWORLD.exit_owrc)+hex_str(global.OVERWORLD.pc_dir)+STR_Exit;
    f.reen = val(global.OVERWORLD.dm[?_datakey], REEN_DEFAULT);
    f.reen = val(f.dm_rando[?_datakey], f.reen); // this returns the vanilla exit if rando isn't active
    //sdm(_datakey+" - "+string(val(f.dm_rando[?_datakey]))); // 803004_Exit - _TownA_0210
}
else
{
    f.reen = REEN_DEFAULT;
}


var _GOING_TO_OW = area_is_ow(f.reen);


if (_GOING_TO_OW 
&&  _EXITING_RM_ENC )
{   // Leaving an encounter, going back to OW
    f.reen = Area_OvrwA+hex_str(global.OVERWORLD.pcrc);
}


with(global.OVERWORLD)
{
    if (_EXITING_OW 
    && !is_undefined(enc_reen)  // if going to an encounter scene
    &&  is_undefined(dm[?hex_str(pcrc)+dk_NO_ENCOUNTER]) ) // if this scene does NOT have the strict 'no encounter' rule
    {   // go to the encounter scene
        f.reen = enc_reen;
    }
}




// ------------------------------------------------------------------
if (_EXITING_RM)
{
    _num = val(dm_exit_leave_history[?STR_Counter])+1;
    dm_exit_leave_history[?STR_Counter] = _num;
    dm_exit_leave_history[?hex_str(_num)+STR_Exit+STR_Name] = exit_leave.exitName;
    
    
    // A challenge similar to Z1 Lost Woods in which the 
    // correct sequence of exits needs to be taken in 
    // a certain scene to get to the scene beyond it.
    _datakey = rm_name+STR_Exit+STR_Sequence;
    var _COUNT1 = val(dm_rm[?_datakey+STR_Count]);
    if (_COUNT1 
    &&  _COUNT1<=_num )
    {
        var _exit_name1,_exit_name2;
        _num -= _COUNT1;
        for(_i=1; _i<=_COUNT1; _i++)
        {
            _exit_name1 = dm_rm[?_datakey+hex_str(_i)];
            _exit_name2 = dm_exit_leave_history[?hex_str(_num+_i)+STR_Exit+STR_Name];
            if (is_undefined(_exit_name1) 
            ||  is_undefined(_exit_name2) 
            ||  _exit_name1!=_exit_name2 )
            {
                break;//_i
            }
            
            if (_i==_COUNT1)
            {   // The correct sequence of exits has been taken.
                f.reen = val(dm_rm[?_datakey+STR_Complete+STR_Exit+STR_Name], f.reen);
                aud_play_sound(get_audio_theme_track(STR_Secret));
            }
        }
    }
}




// ------------------------------------------------------------------
if (_GOING_TO_OW 
&&  _EXITING_RM 
&& !_EXITING_RM_ENC )
{   // when going from a scene to the global.OVERWORLD
    with(global.OVERWORLD)
    {
        var _DEFAULT = val(dm[?MK_OWRC_NPAL1],OWRC_DFL);
        _datakey = g.exit_leave.exitName;
        //pcrc = val(dm[?_datakey+STR_OWRC], _DEFAULT); // goto owrc
        pcrc = val(g.dm_rm[?   _datakey+STR_OWRC], _DEFAULT); // goto owrc
        pcrc = val(f.dm_rando[?_datakey+STR_OWRC], pcrc);
        
        pc_ow_x  = ((pcrc>>0)&$FF) <<SHIFT;
        pc_ow_y  = ((pcrc>>8)&$FF) <<SHIFT;
        pc_ow_x += T_SIZE>>1;
        pc_ow_y += T_SIZE>>1;
        
        //var _DIR  = val(dm[?_datakey+STR_ow_dir], $1);
        var _DIR  = val(g.dm_rm[?_datakey+STR_ow_dir], $1);
        if (_DIR!=$F) pc_dir = _DIR; // $F means face the same way you last exited the global.OVERWORLD
        //sdm("exit_leave.exitName: "+_datakey+", global.OVERWORLD.pcrc $"+hex_str(global.OVERWORLD.pcrc)+", global.OVERWORLD.pc_dir $"+hex_str(global.OVERWORLD.pc_dir)+", $"+hex_str(val(dm_rm_data[?_datakey+STR_ow_dir], $FF)));
    }
}
//sdm("f.reen "+f.reen+", _GOING_TO_OW "+string(_GOING_TO_OW)+", _EXITING_RM "+string(_EXITING_RM)+", _EXITING_RM_ENC "+string(_EXITING_RM_ENC));













// ------------------------------------------------------------------
var _RM_NAME = string_copy(f.reen,1,RmName_LEN);
// ------------------------------------------------------------------






if(!_GOING_TO_OW 
&&  _RM_NAME==rm_name 
&&  exit_leave 
&&  exit_leave.exit_type&EXIT_BIT_WARP1     // Don't reload rm.
&&  f.reen!=EXIT_NAME_GAME_START )
{   // When exit_leave goes to the same rm.
    
    exit_leave         = noone;
    exit_leave_pending = noone;
    ChangeRoom_timer   = 0;
    
    // This will put PC at pc.spawn_x/y of the new exit_enter.
    with(Exit)
    {
        if (exitName==f.reen)
        {
            g.exit_enter = id;
            break;//with(Exit)
        }
    }
    
    PC_reset_to_spawn(0);
}
else
{
    /*
    if(!_GOING_TO_OW)
    {
        // 2024/06/27. For larger rooms that take extra time to 
        // add their tiles, this can result in a frame or two 
        // of a flashbang due to tiles not pal swapped yet.
        // That issue has been given a bandaid that adds extra time 
        // to Change_room_timer but the draw_clear phase of the 
        // new room barely happens. I'm assuming the new room's 
        // draw clear time is being eaten by the first frame 
        // of the new room.
        // So hopefully changing to the new room's background 
        // color BEFORE a room change will fix.
        
        // After some testing, the room background color is 
        // still hanging on the previous room's background color.
        // There doesn't seem to be much improvement, if any at all.
        _val = g.dm_rm[?_RM_NAME+STR_Background_color];
        if(!is_undefined(_val))
        {
            global.BackgroundColor_scene = p.dl_COLOR[|_val];
            if (g.all_bg_black_only) set_background_color(c_black); // For Patreon user Guardian's bg color issue
            else                     set_background_color(global.BackgroundColor_scene);
        }
    }
    */
    
    
    
    if (_GOING_TO_OW)
    {
        var _ROOM = rmC_Overworld_A;
        var _VIEW_W = g.VIEW_W;
        var _VIEW_H = g.VIEW_H;
        //var _VIEW_W = g.global.OVERWORLD.rmC_W;
        //var _VIEW_H = g.global.OVERWORLD.rmC_H;
    }
    else
    {
        var _ROOM = rmA_ACTION;
        var _VIEW_W = rm_get_wh(_RM_NAME,0);
        var _VIEW_H = rm_get_wh(_RM_NAME,1);
    }
    
    room_goto_(_ROOM, _VIEW_W,_VIEW_H);
    
    show_debug_message("update_change_room_1a()    room_goto("+_RM_NAME+")"+",  f.reen: '"+f.reen+"'");
}




