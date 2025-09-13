/// FileSelect_Create()

show_debug_message(" FileSelect_Create()");


var _i,_j, _a, _val;
var _X,_Y;
var _ver, _file_num;
var _default=0;
var _datakey1,_datakey2;
var _file_name, _file, _file_data;

dl_can_color_file = ds_list_create();
repeat(SAVE_FILE_MAX) ds_list_add(dl_can_color_file, false);

//instance_create(0,0, ValDispaly);


/*
SPR_MAIN = spr_File_Select_Bare;
SPR_REGI = spr_File_Select_Register_1;
//SPR_RAND = spr_File_Select_Rando;
SPR_ELIM = spr_File_Select_Elimination;

dl_sprites=ds_list_create();
dl_sprites[|0] = SPR_MAIN;
dl_sprites[|1] = SPR_REGI;
dl_sprites[|2] = SPR_ELIM;
sprite_index   = SPR_MAIN;

// x is xl
//x = viewXC() - (sprite_get_width( sprite_index)>>1); // centered
x = viewXC() - $80;
// y is yt
//y = viewYC() - (sprite_get_height(sprite_index)>>1); // centered
y = viewYC() - $70;
*/

depth       = DEPTH_FILE_SELECT;
DEPTH_PIECE = depth-1;


PI_MENU1 = global.PI_GUI1;
PI_MENU2 = global.PI_GUI3; // darker version of global.PI_GUI1
PI_DARK0 = global.PI_GUI2;
PI_DARK1 = add_pi_permut(global.PI_GUI2, "WBRGYKMC", "OptionsMenu dark text 1");
PI_DARK2 = add_pi_permut(global.PI_GUI2, "RWBGMKYC", "OptionsMenu dark text 2");
PI_DARK3 = add_pi_permut(global.PI_GUI2, "RBWGMKYC", "OptionsMenu dark text 3");


//FONT_SPRITE1=spr_Font3_1;
FONT_SPRITE1 = spr_Font2;


SPR_DOLL  = spr_Doll_PC_1a_WRB;
SPR_QUEST = spr_2nd_quest_icon;


                  _i=0;
State_NULL      = _i++;
State_MAIN      = _i++;
State_REGISTER  = _i++;
State_RANDO     = _i++;
State_ELIMINATE = _i++;
state           = State_NULL;
state_pending   = State_MAIN;
state_previous  = state;




// Main_CLMS: num of clms wide the center area is
Main_CLMS = $1C;


// -------------------------------------------------
// Area1: Center Area
Area1_W  = Main_CLMS<<3;
Area1_XL = viewXC() - (Area1_W>>1);
Area1_XR = Area1_XL + Area1_W;
Area1_YT = ($5<<3) - g.VIEW_Y_TILE_OFF;
// Area0: Left Area
Area0_XL = 0;
Area0_W  = Area1_XL -  Area0_XL;
// Area2: Right Area
Area2_XL = Area1_XL +  Area1_W;
Area2_W  = viewXR() -  Area2_XL;

// -------------------------------------------------
var  _ROWS  = $02; // Frame/Border
     _ROWS += $01; // Column Header (-NAME-     -LEVEL-)
     _ROWS += $02; // Column Header Top+Bottom Padding
     _ROWS += $03*SAVE_FILE_MAX; // Save Files
     _ROWS += $01; // REGISTER YOUR NAME
     _ROWS += $02; // REGISTER Top+Bottom Padding
     _ROWS += $01; // ELIMINATION MODE
     _ROWS += $02; // ELIMINATION Top+Bottom Padding
Frame_ROWS = _ROWS;
     _ROWS += $01; // S E L E C T
     _ROWS += $02; // Top Padding
     _ROWS += $05; // Bottom Padding
//
xl = Area1_XL;
x  = xl;

yt  = viewYC() - ((_ROWS<<3)>>1);
yt  = (yt>>3)<<3;
yt += $02<<3; // Truncate top padding. YT of "S E L E C T"
y  = yt;


surf_MAIN_CLMS  = Main_CLMS;
surf_MAIN_ROWS  = Frame_ROWS;
surf_MAIN_ROWS += $01; // S E L E C T
surf_MAIN       = surface_create(1,surf_MAIN_ROWS<<3);
surf_MAIN_XL    = viewXC() - ((surf_MAIN_CLMS<<3)>>1);
surf_MAIN_YT    = yt;


surf_REGISTER  = surface_create(1,1);
//surf_REGISTER_XL = 0;
surf_REGISTER_YT = 0;

surf_ELIMINATE = surface_create(1,1);

Frame_YT  = surf_MAIN_YT;
Frame_YT += $01<<3; // S E L E C T





// -------------------------------------------------
FAIRY_X1  = xl + ($02<<3);
FAIRY_Y1  = yt + ($06<<3) + 1;

//FAIRY_X2  = viewW()>>1;
FAIRY_X2  = Area1_XL + (Area1_W>>1);
//FAIRY_X2  = viewXC();
FAIRY_X2 -= (SAVE_NAME_CHAR_LIMIT<<3)>>1;
FAIRY_X2 -= $03<<3;
FAIRY_X2  = (FAIRY_X2>>3)<<3;
//FAIRY_X2  = FAIRY_X1 + ($06<<3);
FAIRY_Y2  = yt + ($03<<3) + 4 + 1;

fairy_x   = FAIRY_X1;
fairy_y   = FAIRY_Y1;




DOLL_X1 = FAIRY_X1 + ($01<<3);
DOLL_Y1 = yt + ($05<<3);

DOLL_X2 = FAIRY_X2 + ($01<<3);
//DOLL_X2 = DOLL_X1 + ($06<<3);
DOLL_Y2 = yt + ($02<<3) + 4;

doll_x  = DOLL_X1;
doll_y  = DOLL_Y1;




QUEST_X      = DOLL_X1 + ($01<<3);
QUEST_Y      = yt + ($06<<3);
QUEST_X2     = DOLL_X2 + ($01<<3);
QUEST_Y2     = yt + ($06<<3);




SAVE_NAME_X1 = QUEST_X + ($01<<3); // State_MAIN
SAVE_NAME_Y1 = yt + ($05<<3); // State_MAIN

SAVE_NAME_X2 = QUEST_X2 + ($01<<3); // State_REGISTER, State_ELIMINATE
//SAVE_NAME_X2 = SAVE_NAME_X1 + ($07<<3); // State_REGISTER, State_ELIMINATE
SAVE_NAME_Y2 = yt + ($03<<3); // State_REGISTER, State_ELIMINATE
saveNameX    = SAVE_NAME_X1;
saveNameY    = SAVE_NAME_Y1;




DEATHS_X     = SAVE_NAME_X1 + ($01<<3);
DEATHS_Y     = yt + ($06<<3);

LEVELS_X     = FAIRY_X1 + ($0C<<3);
LEVELS_Y     = yt + ($05<<3);
LEVELS_X_OFF = $04<<3;

SAVE_FILE_PAD = $18;


dl_sprites_fairy = ds_list_create();
ds_list_add(dl_sprites_fairy, g.dl_Fairy_SPRITES[|0]); // spr_FairyA
ds_list_add(dl_sprites_fairy, g.dl_Fairy_SPRITES[|1]); // spr_FairyB
sprites_fairy_idx = 0;


CURSOR_SIZE    = 8;

CURSOR_NAME_X1 = SAVE_NAME_X2;
CURSOR_NAME_Y1 = yt + ($03<<3);
cursor_name_x  = CURSOR_NAME_X1;
cursor_name_y  = CURSOR_NAME_Y1;

CURSOR_CHAR_X1  = xl + ($02<<3);
CURSOR_CHAR_X1 += $01<<3; // Ajustment Fix

CURSOR_CHAR_Y1  = SAVE_NAME_Y2;
CURSOR_CHAR_Y1 +=($03<<3)*SAVE_FILE_MAX;
CURSOR_CHAR_Y1 += $01<<3; // "RANDO" YT
CURSOR_CHAR_Y1 += $02<<3; // "END" YT
CURSOR_CHAR_Y1 += $02<<3; // Frame YT
CURSOR_CHAR_Y1 += $01<<3; // Cursor YT
CURSOR_CHAR_Y1 -= $01<<3; // Ajustment Fix
//CURSOR_CHAR_Y1 = yt + ($0F<<3);
cursor_char_x  = CURSOR_CHAR_X1;
cursor_char_y  = CURSOR_CHAR_Y1;




MenuCursor_sprite = dl_sprites_fairy[|sprites_fairy_idx];;
MenuCursor_x = 0;
MenuCursor_y = 0;




// -------------------------------------------------
Register_file_num = 1;
                       _i=SAVE_FILE_MAX;
MainOption_REGISTER  = _i++;
MainOption_ELIMINATE = _i++;
MainOption_COUNT     = _i;
Main_cursor = 0;

                       _i=SAVE_FILE_MAX;
RegisterOption_RANDO = _i++;
RegisterOption_END   = _i++;
RegisterOption_COUNT = _i;
Register_cursor = 0;

                        _i=SAVE_FILE_MAX;
EliminateOption_END   = _i++;
EliminateOption_COUNT = _i;
Eliminate_cursor = 0;





// -------------------------------------------------
CRYSTALS_X   = LEVELS_X       + $04;
CRYSTALS_Y   = LEVELS_Y + $08 + $07;
CRYSTALS_PAD = $10;


FileSelectWindow_CLMS = $1C;
FileSelectWindow_ROWS = $14;



f.quest_num = 1;
g.game_end_state = 0;

// -------------------------------------------------
g.counter1 = 0;
timer = $FF;

CUE_CHANGE_STATE_0A =  8; // From TitleScreen to Fileselect
CUE_CHANGE_STATE_1A =  4; // From Main to Register
CUE_CHANGE_STATE_1B = 13; // From Register to Main
CUE_CHANGE_STATE_2A =  5; // From Main to Elimination
CUE_CHANGE_STATE_3A =  4; // From Elimination to Register

CUE_COVER_STOP_0A =  9; // From TitleScreen to Fileselect
CUE_COVER_STOP_1A =  5; // From Main to Register
CUE_COVER_STOP_1B = 14; // From Register to Main
CUE_COVER_STOP_2A =  6; // From Main to Elimination
CUE_COVER_STOP_3A =  5; // From Elimination to Register

CUE_COVER_START_1A =  2; // From Main to Register
CUE_COVER_START_1B = 10; // From Register to Main
CUE_COVER_START_2A =  2; // From Main to Elimination
CUE_COVER_START_3A =  2; // From Elimination to Register

cue_cover_start  = -1;
cue_cover_stop   = CUE_COVER_STOP_0A;
cue_change_state = CUE_CHANGE_STATE_0A;

CUE_CHANGE_ROOM  = 8;



covered = true;
save_num_selected = 0;

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


cursor_timer1 = 0;
cursor_dir = 0;




CONFIRM_SOUND_THEME1 = dk_ChooseChar;
CONFIRM_SOUND_THEME2 = dk_ItemDrop;
BACK_SOUND_THEME1    = dk_ChooseChar;
//BACK_SOUND_THEME1    = STR_Stab;
CURSOR_SOUND_THEME1  = dk_CursorSpellMenu;
CURSOR_SOUND_THEME2  = dk_CursorFileSelect;


// -------------------------------------------------
Text_ON  = "ON";
Text_OFF = "OFF";
//Text_ON  = "YES";
//Text_OFF = " NO";


// -------------------------------------------------
/*
for(_i=0; _i<SAVE_FILE_MAX; _i++)
{
    _file_name = f.dl_file_names[|_i];
    _file      = file_text_open_read(working_directory+_file_name);
    _file_data = file_text_read_string(_file);
                 file_text_close(      _file);
    //
    _dm_data   = json_decode(_file_data);
    if (_dm_data!=-1)
    {
        global.dm_save_file_data[?STR_Save+STR_File+hex_str(_i+1)+"_Encoded"] = _file_data;
        
        dg_stats[#_i,0] = val(_dm_data[?f.SDNAME_saveCreated]);
        dg_stats[#_i,1] = val(_dm_data[?f.SDNAME_questNum]);
        dg_stats[#_i,2] = val(_dm_data[?f.SDNAME_deathCount]);
        dg_stats[#_i,3] = val(_dm_data[?f.SDNAME_level_atk]);
        dg_stats[#_i,4] = val(_dm_data[?f.SDNAME_level_mag]);
        dg_stats[#_i,5] = val(_dm_data[?f.SDNAME_level_lif]);
        dg_stats[#_i,6] = val(_dm_data[?f.SDNAME_crystals]);
        
        ds_map_destroy(_dm_data); _dm_data=undefined;
    }
}
*/






// -------------------------------------------------
dl_save_file_registered = ds_list_create();
for(_i=0; _i<SAVE_FILE_MAX; _i++)
{
    _val = get_saved_value(_i+1,f.SDNAME_saveCreated,false);
    ds_list_add(dl_save_file_registered,_val);
}









// -------------------------------------------------
FileSelect_Create_Rando();

var _seed=0;
dm_RandoSeeds = ds_map_create();
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
dg_stats = ds_grid_create(SAVE_FILE_MAX,7);
FS_set_stats();


dl_spr_statIcon = ds_list_create();
ds_list_add(dl_spr_statIcon,global.SPR_ICON_ATK);
ds_list_add(dl_spr_statIcon,global.SPR_ICON_MAG);
ds_list_add(dl_spr_statIcon,global.SPR_ICON_LIF);


// -------------------------------------------------
// REGISTER YOUR NAME
REGI_CHAR_NULL = "?";
// "ABCDEFGHIJKLMNOPQRSTUVWXYZ-.?????0123456789&"
REGI_CHARS  = "ABCDEFGHIJKLMNOPQRSTUVWXYZ-.";
REGI_CHARS += string_repeat(REGI_CHAR_NULL,5);
REGI_CHARS += "0123456789 ";

cursor_char = 0;
cursor_name = 0;

ROW_COUNT = $04;
CLM_COUNT = $0B;



// -------------------------------------------------
if (DEV) instance_create(0,0,RandoDebug01);




