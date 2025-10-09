/// g_Room_End()

show_debug_message("g_Room_End()");


/*
var _exists = false;

    _exists=variable_instance_exists(id,"dl_");
if (_exists) _exists = !is_undefined(    dl_);
if (_exists) _exists = ds_exists(        dl_,ds_type_list);
if (_exists)           ds_list_destroy(  dl_);
if (_exists)                             dl_=undefined;

    _exists=variable_instance_exists(id,"dm_");
if (_exists) _exists = !is_undefined(    dm_);
if (_exists) _exists = ds_exists(        dm_,ds_type_map);
if (_exists)           ds_map_destroy(   dm_);
if (_exists)                             dm_=undefined;

    _exists=variable_instance_exists(id,"dg_");
if (_exists) _exists = !is_undefined(    dg_);
if (_exists) _exists = ds_exists(        dg_,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_);
if (_exists)                             dg_=undefined;

    _exists=variable_instance_exists(id,"ds_");
if (_exists) _exists = !is_undefined(    ds_);
if (_exists) _exists = ds_exists(        ds_,ds_type_stack);
if (_exists)           ds_stack_destroy( ds_);
if (_exists)                             ds_=undefined;
*/



var _exists = false;


// D3E6: JMP E18A
if (room_type=="A") GOB_rm_end_clean_up_1(); // allow rm's remaining gob to spawn if rm is visited again.


// D2AE
if(!area_is_ow(f.reen)) counter1 = 0; // if NOT going to ow


pc_lock  = 0;
global.pc.state = global.pc.state_NULL;


gui_window_can_draw = 0;
gui_state        = gui_state_NONE; // 074C. GUI Window. 1 PauseMenu, 2 LevelUp, 3 Dialogue
menu_state       = 0;
menu_built_count = 0;
level_up_timer   = 0; // 
dialogue_source  = noone;

with(PAUSE_MENU)
{
    canDrawSections  = 0;
    canDrawItems     = 0;
    canDrawSpells    = 0;
}


with(LEVEL_MENU)
{
    canDrawSections = 0;
    cnt_draw_rows   = 0;
}


with(DIALOGUE_WINDOW)
{
    dialogue           = dialogue_DEF;
    dlg_line_cnt       = 0;
    writ_char_pos      = 0;
    writ_line_idx      = 0;
    writ_line_char_pos = 0;
    writ_dlg           = "";
    cnt_draw_rows      = 0;
}


with(global.OPTIONS_MENU)
{
    cnt_draw_rows = 0;
}

with(QUIT_APP_MENU)
{
    cnt_draw_rows = 0;
    cursor_option = 0;
}



if(!is_undefined(    exit_leave) 
&&  instance_exists( exit_leave) )
{   instance_destroy(exit_leave);  }
exit_leave         = noone;
exit_leave_pending = noone;


NIAO_Room_End();


    _exists=variable_instance_exists(id,"dm_tile_file");
if (_exists) _exists = !is_undefined(    dm_tile_file);
if (_exists) _exists = ds_exists(        dm_tile_file,ds_type_map);
if (_exists)           ds_map_destroy(   dm_tile_file);
if (_exists)                             dm_tile_file=undefined;
//ds_map_clear(dm_tile_file);


ds_map_clear( dm_hidden_tiles);
ds_list_clear(dl_hidden_tiles);




show_debug_message("########################################################################");
repeat(8) show_debug_message("");




