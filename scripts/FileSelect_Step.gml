/// FileSelect_Step()


if (room!=rmB_FileSelect) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




//if (keyboard_check_pressed(vk_f7)) sdm("FileSelect_Step(). "+"instance_number(TitleScreen)="+string(instance_number(TitleScreen)));
var _i,_j, _val,_num, _count;


input_start_pressed  = Input.Pause_pressed;

input_select_pressed = Input.Magic_pressed;
input_select_held    = Input.Magic_held;

input_a_pressed      = Input.Jump_pressed;
input_b_pressed      = Input.Other1_pressed;

input_right_pressed  = Input.Right_pressed;
input_right_held     = Input.Right_held;
input_left_pressed   = Input.Left_pressed;
input_left_held      = Input.Left_held;

input_down_pressed   = Input.Down_pressed;
input_down_held      = Input.Down_held;
input_up_pressed     = Input.Up_pressed;
input_up_held        = Input.Up_held;

InputConfirm_pressed = input_a_pressed || input_start_pressed;
InputBack_pressed    = input_b_pressed || keyboard_check_pressed(vk_backspace);
//InputBack_pressed    = input_b_pressed || keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_backspace);







// ---------------------------------------------------------------------------------------------
if (state==State_NULL 
&&  g.counter1==cue_change_state )
{
    state = state_pending;
    REGISTER_new_save_file_name = 0;
    CharTable_cursor_char = 0;
    cue_change_state = -1;
    cursor_timer1 = 0;
    
    switch(state){
    case   State_MAIN:     {     Main_cursor=     MainOption_COUNT-1; break;}
    case   State_REGISTER: { Register_cursor= RegisterOption_COUNT-1; break;}
    case   State_ELIMINATE:{Eliminate_cursor=EliminateOption_COUNT-1; break;}
    }
    FileSelect_cursor_move(state,1);
    
    
    if (state_previous!=State_RANDO 
    &&  state_pending !=State_RANDO )
    { // In case of a scenario where changing/creating a save file name was not finalized
        for(_i=0; _i<SAVE_FILE_MAX; _i++)
        {
            f.dl_save_names[|_i] = get_saved_value(_i+1, f.SDNAME_save_name, SAVE_NAME_NULL);
        }
    }
    
    
    
    if (state==State_MAIN)
    {
        FS_set_stats();
    }
    
    if (state!=State_REGISTER 
    &&  state!=State_RANDO )
    {
        ds_map_clear(f.dm_rando);
        FileSelect_init_rando_settings();
    }
    
    
        ds_list_clear(dl_save_file_registered);
    for(_i=0; _i<SAVE_FILE_MAX; _i++)
    {
        ds_list_add(  dl_save_file_registered,get_saved_value(_i+1,f.SDNAME_saveCreated,false));
    }
    
    
    if (state==State_REGISTER)
    {
        FileSelect_clear_save_file_rando_info(Register_file_num);
    }
}




// ---------------------------------------------------------------------------------------------
if (state!=State_NULL)
{
    timer = (timer+1)&$FF;
}




// ---------------------------------------------------------------------------------------------
if (save_num_selected 
&&  g.counter1==CUE_CHANGE_ROOM )
{
    // ** file_load() has already been called in FileSelect_Main_update()
    
    g.game_end_state = 0;
    
    var _Rando_ACTIVE = val(f.dm_rando[?STR_Rando+STR_Active]);
    //var _Rando_ACTIVE = get_saved_value(save_num_selected, STR_Rando+STR_Active, false);
    //var _Rando_ACTIVE = val(f.dm_rando[?STR_Rando+STR_Active]);
    
    var                _SEED = RUN_RANDOMIZATION_SEED;
    if (_Rando_ACTIVE) _SEED = FileSelect_get_file_seed(save_num_selected,f.quest_num,_SEED);
    
    
    
    var _datakey = STR_Quest+STR_Puzzles+STR_Set;
    if(!val(f.dm_quests[?_datakey]))
    {   // Everytime a save file is loaded, this will be done 
        // until the user saves their progress.
        if (_Rando_ACTIVE) random_set_seed(_SEED);
        else               randomize();
        
        if (val(f.dm_rando[?STR_Randomize+STR_Item+STR_Locations]) 
        ||  val(f.dm_rando[?STR_Randomize+STR_Spell+STR_Locations]) )
        {
            _count = global.Rando_SpellSequence_SPELL_COUNT;
        }
        else
        {
            _count = 4;
        }
        
        new_quest_init_puzzles(_count);
        f.dm_quests[?_datakey] = 1;
    }
    
    
    var _DATAKEY1 = STR_Target+STR_Game+STR_Order;
    _datakey = _DATAKEY1+STR_Set;
    if(!val(f.dm_quests[?_datakey]))
    {   // Everytime a save file is loaded, this will be done 
        // until the user saves their progress.
        f.dm_quests[?_datakey] = 1;
        
        var              _dl_order = ds_list_create();
        if (f.quest_num==1)
        {    ds_list_add(_dl_order, $2,$6,$9,$9,$A,$B,$B,  $4,$5,$8);  } // difficulty 1,2
        else ds_list_add(_dl_order, $4,$4,$5,$5,$8,$8,$8,  $3,$7,$D);    // difficulty 2,3
        
        //see MiniGameA_init() to see how _order is used
        var _COUNT = ds_list_size(_dl_order);
        var _order = "";
        for(_i=0; _i<8; _i++)
        {
            ds_list_shuffle(_dl_order);
            for(_j=0; _j<_COUNT; _j++) _order += hex_str(_dl_order[|_j]);
        }
        f.dm_quests[?_DATAKEY1+STR_Reset] = _order;
        f.dm_quests[?_DATAKEY1]           = _order;
        ds_list_destroy(_dl_order); _dl_order=undefined;
    }
    
    
    
    random_set_seed(_SEED);
    
    g.RandomOG_started = false;
    for(_i=0; _i<g.dl_RandomOG_SIZE; _i++) g.dl_RandomOG[|_i]=0;
    
    
    //file_load_pref(save_num_selected);
    room_goto_(rmB_NextLife);
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// ---------------------------------------------------------------------------------------------
if(!covered 
&&  g.counter1==cue_cover_start )
{
    covered = true;
    cue_cover_start = -1;
}

if (covered 
&&  g.counter1==cue_cover_stop )
{
    covered = false;
    cue_cover_stop = -1;
}










// ---------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------
if(!covered 
&&  state!=State_NULL )
{
    switch(state)
    {   // ==================================================================================
        // ------------------------------------------------------------------------
        case State_MAIN:{  // FILE SELECT
        FileSelect_Main_update();
        break;}//case State_MAIN
        
        
        
        
        // ==================================================================================
        // ------------------------------------------------------------------------
        case State_REGISTER:{  // REGISTER YOUR NAME
        FileSelect_Register_update();
        break;}//case State_REGISTER
        
        
        
        
        // ==================================================================================
        // ------------------------------------------------------------------------
        case State_RANDO:{  // RANDO
        switch(RandoState){
        case   RandoState_MAIN:   {FileSelect_RandoStateMAIN_update();    break;}
        case   RandoState_ITEM:   {FileSelect_RandoStateITEM_update();    break;}
        case   RandoState_SPELL:  {FileSelect_RandoStateSPELL_update();   break;}
        case   RandoState_DUNGEON:{FileSelect_RandoStateDUNGEON_update(); break;}
        case   RandoState_ENEMY:  {FileSelect_RandoStateENEMY_update();   break;}
        case   RandoState_OTHER:  {FileSelect_RandoStateOTHER_update();   break;}
        case   RandoState_SEED:   {FileSelect_RandoStateSEED_update();    break;}
        }
        break;}//case State_RANDO
        
        
        
        
        // ==================================================================================
        // ------------------------------------------------------------------------
        case State_ELIMINATE:{  // ELIMINATION MODE
        FileSelect_Eliminate_update();
        break;}//case State_ELIMINATE
    }//switch(state)
}
















// ---------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------
FileSelect_udp();


if (state)
{
    if!(timer&$3) sprites_fairy_idx = !sprites_fairy_idx;
    
    var                   _CURSOR=0;
    switch(state){
    case State_MAIN:{     _CURSOR=Main_cursor;      break;}
    case State_REGISTER:{ _CURSOR=Register_cursor;  break;}
    //case State_RANDO:{    _CURSOR=Rando_cursor; break;}
    case State_ELIMINATE:{_CURSOR=Eliminate_cursor; break;}
    }//switch(state)
    
    switch(state)
    {   // ---------------------------------------------------------------
        case State_MAIN:{
        saveNameX = SAVE_NAME_X1;
        saveNameY = SAVE_NAME_Y1;
        
        doll_x = DOLL_X1;
        doll_y = DOLL_Y1;
        
        fairy_x  = FAIRY_X1;
        fairy_y  = FAIRY_Y1;
        fairy_y += _CURSOR*SAVE_FILE_PAD;
        if (_CURSOR>=SAVE_FILE_MAX) fairy_y += $01<<3;
        break;}//case State_MAIN
        
        
        // ---------------------------------------------------------------
        case State_REGISTER:{
        saveNameX = SAVE_NAME_X2;
        saveNameY = SAVE_NAME_Y2;
        
        doll_x = DOLL_X2;
        doll_y = DOLL_Y2;
        
        fairy_x  = FAIRY_X2;
        fairy_y  = FAIRY_Y2;
        fairy_y += _CURSOR*SAVE_FILE_PAD;
        
        cursor_name_x = CURSOR_NAME_X1 + (REGISTER_new_save_file_name<<3);
        cursor_name_y = CURSOR_NAME_Y1 + (SAVE_FILE_PAD*_CURSOR);
        
        cursor_char_x = CURSOR_CHAR_X1 + ((CharTable_cursor_char mod CharTable_Text_CLMS)<<4);
        cursor_char_y = CURSOR_CHAR_Y1 + ((CharTable_cursor_char div CharTable_Text_CLMS)<<4);
        if (state==State_REGISTER) cursor_char_y += $02<<3;
        break;}//case State_REGISTER
        
        
        // ---------------------------------------------------------------
        case State_RANDO:{
        saveNameX = SAVE_NAME_X2;
        saveNameY = SAVE_NAME_Y2 + RANDO_YOFF1;
        
        doll_x = DOLL_X2;
        doll_y = DOLL_Y2 + RANDO_YOFF1;
        
        fairy_x  = FAIRY_X2;
        fairy_y  = FAIRY_Y2 + RANDO_YOFF1;
        break;}//case State_RANDO
        
        
        // ---------------------------------------------------------------
        case State_ELIMINATE:{
        saveNameX = SAVE_NAME_X2;
        saveNameY = SAVE_NAME_Y2;
        
        doll_x = DOLL_X2;
        doll_y = DOLL_Y2;
        
        fairy_x  = FAIRY_X2;
        fairy_y  = FAIRY_Y2;
        fairy_y += _CURSOR*SAVE_FILE_PAD;
        //if (_CURSOR>=SAVE_FILE_MAX) fairy_y += $01<<3;
        break;}//case State_ELIMINATE
    }//switch(state)
}




