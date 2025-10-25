/// FileSelect_Room_Start()


if(!persistent  // Only checking this while in process of changing FileSelect to persistent
||  room!=rmB_FileSelect )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// ----------------------------------------------------------------------------------------
show_debug_message("FileSelect_Room_Start()");


var _i, _val, _seed;
var _file_num;
var _datakey0,_datakey1,_datakey2;


state          = State_NULL;
state_pending  = State_MAIN;
state_previous = state;


fairy_x = FAIRY_X1;
fairy_y = FAIRY_Y1;

sprites_fairy_idx = 0;
MenuCursor_sprite = dl_sprites_fairy[|sprites_fairy_idx];
MenuCursor_x = 0;
MenuCursor_y = 0;


doll_x = DOLL_X1;
doll_y = DOLL_Y1;


saveNameX = SAVE_NAME_X1;
saveNameY = SAVE_NAME_Y1;


// -------------------------------------------------
Main_cursor = 0;
Register_cursor = 0;
Eliminate_cursor = 0;


// -------------------------------------------------
covered = true;
cue_cover_start  = -1;
cue_cover_stop   = CUE_COVER_STOP_0A;
cue_change_state = CUE_CHANGE_STATE_0A;




// -------------------------------------------------
input_start_pressed  = false;
input_select_pressed = false;
input_select_held    = false;
input_a_pressed      = false; // equivilent to NES-A and xbox-A
input_b_pressed      = false; // equivilent to NES-B and xbox-B

input_right_pressed  = false;
input_right_held     = false;
input_left_pressed   = false;
input_left_held      = false;
input_down_pressed   = false;
input_down_held      = false;
input_up_pressed     = false;
input_up_held        = false;

//select_pressed       = false;
//start_pressed        = false;
InputConfirm_pressed = false;
InputBack_pressed    = false;




// -------------------------------------------------
Register_file_num = 1;
REGISTER_rando_is_on = false;
REGISTER_file_seed = 0;
REGISTER_new_save_file_name = 0;

ds_list_clear(dl_save_file_registered);
for(_i=0; _i<SAVE_FILE_MAX; _i++)
{
    _val = get_saved_value(_i+1,f.SDNAME_saveCreated,false);
    ds_list_add(dl_save_file_registered,_val);
}




// -------------------------------------------------
FS_set_stats();




// -------------------------------------------------
_seed = 0;
ds_map_clear(dm_RandoSeeds);
for(_file_num=1; _file_num<=SAVE_FILE_MAX; _file_num++)
{
    _datakey1 = get_file_seed_dk(_file_num,1); // 1st Quest
    _datakey2 = get_file_seed_dk(_file_num,2); // 2nd Quest
    
    _seed = Rando_get_new_seed();
    
    if (get_saved_value(_file_num, f.SDNAME_saveCreated, 0))
    {
        _seed = get_saved_value(_file_num, _datakey1, _seed);
        dm_RandoSeeds[?_datakey1] = _seed; // Quest 1
        
        _seed = get_saved_value(_file_num, _datakey2, _seed);
        dm_RandoSeeds[?_datakey2] = _seed; // Quest 2
    }
    else
    {
        FileSelect_change_rando_seed(_file_num, _seed);
    }
    
    //sdm("Quest-1 Seed $"+hex_str(dm_RandoSeeds[?_datakey1]));
    //sdm("Quest-2 Seed $"+hex_str(dm_RandoSeeds[?_datakey2]));
}


// -------------------------------------------------
Rando_failed = false;


RandoState = RandoState_MAIN;
FileSelect_Rando_cursor_reset(RandoState_MAIN);

FileSelect_Rando_cursor_reset(RandoState_ITEM);

Rando_start_spells = 0;
FileSelect_Rando_cursor_reset(RandoState_SPELL);

FileSelect_Rando_cursor_reset(RandoState_DUNGEON);

FileSelect_Rando_cursor_reset(RandoState_ENEMY);

RandoSEED_EDIT_state = 0; // 0: cursor free, 1: editing seed
RandoSeedChar_cursor = 0;
FileSelect_Rando_cursor_reset(RandoState_SEED);

FileSelect_Rando_cursor_reset(RandoState_OTHER);
RandoOTHER_ITEMS_cursor      = RandoOTHER_ITEMS_cursor_ITEM;
RandoOTHER_ITEMS_item_cursor = RandoOTHER_ITEMS_item_cursor_CANDLE;
RandoOTHER_SPELLS_cursor     = RandoOTHER_SPELLS_cursor_PROTECT;
RandoOTHER_SKILLS_cursor     = 0;
RandoOTHER_REQUIRE_cursor    = RandoOTHER_REQUIRE_cursor_CRYSTALS;

FileSelect_init_rando_settings();

for(_i=0; _i<SAVE_FILE_MAX; _i++) FileSelect_refresh_save_file_rando_info(_i+1);




// -------------------------------------------------
f.quest_num = 1;
g.game_end_state = 0;
g.counter1 = 0;

timer = $FF;
save_num_selected = 0;
CharTable_cursor_char = 0;
cursor_timer1 = 0;
cursor_dir = 0;




// -------------------------------------------------
//if (DEV) instance_create(0,0,RandoDebug01);




