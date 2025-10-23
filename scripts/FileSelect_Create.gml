/// FileSelect_Create()

show_debug_message("FileSelect_Create()");


var _i,_j, _a, _val, _dist;
var _X,_Y, _x,_y;
var _len;
var _ver, _file_num;
var _default=0;
var _datakey1,_datakey2;
var _file_name, _file, _file_data;




                  _i=0;
State_NULL      = _i++;
State_MAIN      = _i++;
State_REGISTER  = _i++;
State_RANDO     = _i++;
State_ELIMINATE = _i++;
state           = State_NULL;
state_pending   = State_MAIN;
state_previous  = state;




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




RANDO_YOFF1 = -($02<<3);
RANDO_YOFF2 = -$6;




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
CONFIRM_SOUND_THEME1 = dk_ChooseChar;
CONFIRM_SOUND_THEME2 = dk_ItemDrop;
BACK_SOUND_THEME1    = dk_ChooseChar;
//BACK_SOUND_THEME1    = STR_Stab;
CURSOR_SOUND_THEME1  = dk_CursorSpellMenu;
CURSOR_SOUND_THEME2  = dk_CursorFileSelect;


Text_ON  = "ON";
Text_OFF = "OFF";
//Text_ON  = "YES";
//Text_OFF = " NO";




// -------------------------------------------------
dm_RandoSeeds = ds_map_create();

dl_can_color_file = ds_list_create();
repeat(SAVE_FILE_MAX) ds_list_add(dl_can_color_file, false);

dl_save_file_registered = ds_list_create();

            dl_spr_statIcon = ds_list_create();
ds_list_add(dl_spr_statIcon,global.SPR_ICON_ATK);
ds_list_add(dl_spr_statIcon,global.SPR_ICON_MAG);
ds_list_add(dl_spr_statIcon,global.SPR_ICON_LIF);

dg_stats = ds_grid_create(SAVE_FILE_MAX,7);




            CharTable_dl=ds_list_create();
ds_list_add(CharTable_dl,"A B C D E F G H I J K");
ds_list_add(CharTable_dl,"L M N O P Q R S T U V");
ds_list_add(CharTable_dl,"W X Y Z - .");
ds_list_add(CharTable_dl,"0 1 2 3 4 5 6 7 8 9");

_len = string_length(CharTable_dl[|0]);
CharTable_Window_CLMS  = _len; // text
CharTable_Window_CLMS += $02;  // + left & right text padding
CharTable_Window_CLMS += $02;  // + left & right window borders

CharTable_Text_ROWS = ds_list_size(CharTable_dl);
CharTable_Text_CLMS = string_length(CharTable_dl[|0]) - string_count(" ",CharTable_dl[|0]);
//CharTable_Text_CLMS = $0B;

// REGISTER YOUR NAME
CharTable_CHAR_NULL = "?";
// "ABCDEFGHIJKLMNOPQRSTUVWXYZ-.?????0123456789&"
CharTable_CHARS  = "ABCDEFGHIJKLMNOPQRSTUVWXYZ-.";
CharTable_CHARS += string_repeat(CharTable_CHAR_NULL,5);
CharTable_CHARS += "0123456789 ";

CharTable_cursor_char = 0;




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




// -------------------------------------------------
MAIN_surf       = -1;
MAIN_surf_CLMS  = Main_CLMS;
MAIN_surf_ROWS  = Frame_ROWS;
MAIN_surf_ROWS += $01; // S E L E C T
MAIN_surf_W     = viewW();
MAIN_surf_H     = viewH();
MAIN_surf_XL    = viewXC() - (MAIN_surf_W>>1);
MAIN_surf_YT    = viewYC() - (MAIN_surf_H>>1);
MAIN_surf_DrawArea_XL = (MAIN_surf_XL + (MAIN_surf_W>>1)) - ((MAIN_surf_CLMS<<3)>>1);
MAIN_surf_DrawArea_YT = yt;




REGISTER_surf    = -1;
REGISTER_surf_CLMS = CharTable_Window_CLMS + (CharTable_Window_CLMS&$1);
REGISTER_surf_W  = viewW();
REGISTER_surf_H  = viewH();
REGISTER_surf_XL = viewXC() - (REGISTER_surf_W>>1);
REGISTER_surf_YT = viewYC() - (REGISTER_surf_H>>1);
_dist = max(Area1_W, REGISTER_surf_CLMS<<3);
REGISTER_surf_DrawArea_XL = (REGISTER_surf_XL + (REGISTER_surf_W>>1)) - (_dist>>1);
REGISTER_surf_DrawArea_YT = yt;

REGISTER_new_save_file_name = 0;

_y  = $03<<3; // YT of save files
_y +=($03<<3)*SAVE_FILE_MAX; // + total height of save files for YT of "RANDO"/"END"
_y += $01<<3; // + extra "RANDO"/"END" pad
_y += REGISTER_surf_DrawArea_YT;
_y += RANDO_YOFF2;
REGISTER_RANDO_TEXT_YT = _y;

REGISTER_rando_is_on = false;
REGISTER_file_seed = 0;




ELIMINATE_surf    = -1;
ELIMINATE_surf_CLMS = REGISTER_surf_CLMS;
ELIMINATE_surf_W  = viewW();
ELIMINATE_surf_H  = viewH();
ELIMINATE_surf_XL = viewXC() - (ELIMINATE_surf_W>>1);
ELIMINATE_surf_YT = viewYC() - (ELIMINATE_surf_H>>1);
_dist = max(Area1_W, ELIMINATE_surf_CLMS<<3);
ELIMINATE_surf_DrawArea_XL = (ELIMINATE_surf_XL + (ELIMINATE_surf_W>>1)) - (_dist>>1);
ELIMINATE_surf_DrawArea_YT = yt;




Frame_YT = MAIN_surf_DrawArea_YT + ($01<<3); // S E L E C T





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




QUEST_X  = DOLL_X1 + ($01<<3);
QUEST_Y  = yt + ($06<<3);
QUEST_X2 = DOLL_X2 + ($01<<3);
QUEST_Y2 = yt + ($06<<3);




SAVE_NAME_X1 = QUEST_X + ($01<<3); // State_MAIN
SAVE_NAME_Y1 = yt + ($05<<3); // State_MAIN

SAVE_NAME_X2 = QUEST_X2 + ($01<<3); // State_REGISTER, State_ELIMINATE
//SAVE_NAME_X2 = SAVE_NAME_X1 + ($07<<3); // State_REGISTER, State_ELIMINATE
SAVE_NAME_Y2 = yt + ($03<<3); // State_REGISTER, State_ELIMINATE
//SAVE_NAME_Y3 = SAVE_NAME_Y2 - ($02<<3); // State_RANDO
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




// -------------------------------------------------
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
ds_list_clear(dl_save_file_registered);
for(_i=0; _i<SAVE_FILE_MAX; _i++)
{
    _val = get_saved_value(_i+1,f.SDNAME_saveCreated,false);
    ds_list_add(dl_save_file_registered,_val);
}




// -------------------------------------------------
//FileSelect_Create_Rando();


var _seed = 0;
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
FileSelect_Create_Rando();




// -------------------------------------------------
FS_set_stats();




// -------------------------------------------------
f.quest_num = 1;
g.game_end_state = 0;
g.counter1 = 0;
timer = $FF;
save_num_selected = 0;
cursor_timer1 = 0;
cursor_dir = 0;




// -------------------------------------------------
if (DEV) instance_create(0,0,RandoDebug01);
//instance_create(0,0, ValDispaly);




/*
// Preparing changing FileSelect to persistent. Setting up for FileSelect_Room_Start() 
var _i, _val, _seed;
var _file_num;
var _datakey0,_datakey1,_datakey2;


state          = State_NULL;
state_pending  = State_MAIN;
state_previous = state;


fairy_x = FAIRY_X1;
fairy_y = FAIRY_Y1;

sprites_fairy_idx = 0;
MenuCursor_sprite = dl_sprites_fairy[|sprites_fairy_idx];;
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
//FileSelect_Create_Rando();


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
FileSelect_Create_Rando();


// -------------------------------------------------
FS_set_stats();


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
if (DEV) instance_create(0,0,RandoDebug01);
*/
