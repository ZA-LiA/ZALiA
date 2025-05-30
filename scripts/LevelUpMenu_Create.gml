/// LevelUpMenu_Create()

if (DEV)
{
    var _START_TIME = current_time;
    show_debug_message("");
    show_debug_message("LevelUpMenu_Create() START");
}


var _i, _idx;


var _MIN = min(STAT_ATK,STAT_MAG,STAT_LIF); // 0,1,2
var _MAX = max(STAT_ATK,STAT_MAG,STAT_LIF); // 0,1,2




// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
var _TEXT_LVL_ATK   = "ATTACK";
var _TEXT_LVL_MAG   = "MAGIC";
var _TEXT_LVL_LIF   = "LIFE";

var _TEXT_NEXT      = "NEXT";
var _TEXT_CANCEL    = "CANCEL";
var _TEXT_WILL      = "WILL";
var _TEXT_GO_UP     = "GO UP";


g.LEVEL_MENU = id;


               _idx = 0;
IDX_TEXT_CLM = _idx++;
IDX_TEXT_ROW = _idx++;
IDX_TEXT     = _idx++;
IDX_LVLS_ROW = _idx++;
IDX_ICON_SPR = _idx++;
IDX_CAN_LVL  = _idx++;

var _count  = _MAX+1;   // 3  levels: atk, mag, lif
    _count += 5;        // 4  text: NEXT, UP, CANCEL, WILL, GO UP
dg_DATA = ds_grid_create(_count, _idx+1);




// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
LVL_SECTIONS_ROW = 4;
LVL_SECTION_ROWS = 5;


// 8x8 tiles
CLMS  = g.GUI_WIN_CLMS1; // 8x8
ROWS  = 2;                      // Border rows
ROWS += 3;                      // NEXT UP & CANCEL section
ROWS += LVL_SECTION_ROWS * 3; // LEVEL UP SECTIONS
// ROWS = $14; // 8x8. $14 == 20


CLM_LVL_TEXT = CLMS - 1 - max(string_length(_TEXT_LVL_ATK),string_length(_TEXT_LVL_MAG),string_length(_TEXT_LVL_LIF));
CLM_LVL_ICON = CLMS - 1 - STAT_LEVEL_MAX;


CLM_XP = 1; // align left in case xp goes to a 5th digit
//CLM_XP = 4; // OG aligns it right starting at this clm



// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
var _dm_text = ds_map_create();
_dm_text[?hex_str(STAT_ATK)] = _TEXT_LVL_ATK;
_dm_text[?hex_str(STAT_MAG)] = _TEXT_LVL_MAG;
_dm_text[?hex_str(STAT_LIF)] = _TEXT_LVL_LIF;
for(_i=_MIN; _i<=_MAX; _i++)
{
    dg_DATA[#_i,IDX_TEXT]     = _dm_text[?hex_str(_i)];
    
    dg_DATA[#_i,IDX_LVLS_ROW] = LVL_SECTIONS_ROW + (LVL_SECTION_ROWS * (_i-_MIN));
    
    dg_DATA[#_i,IDX_TEXT_CLM] = CLM_LVL_TEXT;
    dg_DATA[#_i,IDX_TEXT_ROW] = dg_DATA[#_i,IDX_LVLS_ROW] + 1;
}
ds_map_destroy(_dm_text); _dm_text=undefined;



dg_DATA[#STAT_ATK,IDX_ICON_SPR] = global.SPR_ICON_ATK;
dg_DATA[#STAT_MAG,IDX_ICON_SPR] = global.SPR_ICON_MAG;
dg_DATA[#STAT_LIF,IDX_ICON_SPR] = global.SPR_ICON_LIF;



// ------------------------------------------------------------------------
var _ROW_TEXT_NEXT = $01;

         _idx = _MAX + 1;
// "CANCEL"
dg_DATA[#_idx,IDX_TEXT]      = _TEXT_CANCEL;
dg_DATA[#_idx,IDX_TEXT_CLM]  = CLMS - 1 - string_length(dg_DATA[#_idx,IDX_TEXT]);
dg_DATA[#_idx,IDX_TEXT_ROW]  = _ROW_TEXT_NEXT + 1;
         _idx++;
//
// "NEXT"
dg_DATA[#_idx,IDX_TEXT]      = _TEXT_NEXT;
dg_DATA[#_idx,IDX_TEXT_CLM]  = $01;
dg_DATA[#_idx,IDX_TEXT_ROW]  = _ROW_TEXT_NEXT;
         _idx++;
//
// "UP"
dg_DATA[#_idx,IDX_TEXT]      = "UP";
dg_DATA[#_idx,IDX_TEXT_CLM]  = dg_DATA[#_idx-1,IDX_TEXT_CLM];
dg_DATA[#_idx,IDX_TEXT_ROW]  = _ROW_TEXT_NEXT + 1;
         _idx++;
//


WILL_GO_UP_IDX = _idx;
// "WILL"
dg_DATA[#_idx,IDX_TEXT]      = _TEXT_WILL;
dg_DATA[#_idx,IDX_TEXT_CLM]  = CLM_LVL_TEXT;
dg_DATA[#_idx,IDX_TEXT_ROW]  = dg_DATA[#STAT_ATK,IDX_TEXT_ROW] + 1;
         _idx++;
//
// "GO UP"
dg_DATA[#_idx,IDX_TEXT]      = _TEXT_GO_UP;
dg_DATA[#_idx,IDX_TEXT_CLM]  = dg_DATA[#_idx-1,IDX_TEXT_CLM];
dg_DATA[#_idx,IDX_TEXT_ROW]  = dg_DATA[#_idx-1,IDX_TEXT_ROW] + 1;
         _idx++;
//



ARROW_SPR   = spr_Menu_Selector_arrow_1a;
PI_DEF      = global.PI_GUI1;

ANIM_FRAMES_DEF = ROWS >>1;
anim_frame      = 0;
cnt_draw_rows   = 0;

OPTION_CANCEL   = 3;






var _E = "&"; // Empty
var _H = "0"; // Bar horizontal
var _V = "1"; // Bar vertical
var _C = "2"; // Corner square

var _POS = string_length(_TEXT_NEXT) + 2; // ("NEXT" length) + (2 frame pieces)

//  _TSRC_DATA1 = "2" +   "0000" + "0000" + "0000"   +  "2";    // Hor bar 1
var _TSRC_DATA1 = _C  +  string_repeat(_H,  CLMS-2)  +  _C;     // Hor bar 1

//  _TSRC_DATA2 = "2" +   "0000" + "2000" + "0000"   +  "2";    // Hor bar 2 (Next/Cancel)
var _TSRC_DATA2 = _C  +  string_repeat(_H,  CLMS-2)  +  _C;     // Hor bar 2 (Next/Cancel)
    _TSRC_DATA2 =    strReplaceAt(_TSRC_DATA2, _POS, 1, _C);
//
//  _TSRC_DATA3 = "1" +   "&&&&" + "&&&&" + "&&&&"   +  "1";    // Side 1
var _TSRC_DATA3 = _V  +  string_repeat(_E,  CLMS-2)  +  _V;     // Side 1

//  _TSRC_DATA4 = "1" +   "&&&&" + "1&&&" + "&&&&"   +  "1";    // Side 2 (Next/Cancel)
var _TSRC_DATA4 = _V  +  string_repeat(_E,  CLMS-2)  +  _V;     // Side 2 (Next/Cancel)
    _TSRC_DATA4 =    strReplaceAt(_TSRC_DATA4, _POS, 1, _V);
//


dl_tsrc_data = ds_list_create();
// Side 1                       "1" +   "&&&&" + "&&&&" + "&&&&"   +  "1"
for(_i=0; _i<ROWS; _i++) ds_list_add(dl_tsrc_data,_TSRC_DATA3);

// Hor bar 2 (Next/Cancel)      "2" +   "0000" + "2000" + "0000"   +  "2"
dl_tsrc_data[|0]                  = _TSRC_DATA2;
dl_tsrc_data[|LVL_SECTIONS_ROW-1] = _TSRC_DATA2;

// Side 2 (Next/Cancel)         "1" +   "&&&&" + "1&&&" + "&&&&"   +  "1"
for(_i=1; _i<1+(LVL_SECTIONS_ROW-2); _i++) dl_tsrc_data[|_i] = _TSRC_DATA4;

// Hor bar 1                    "2" +   "0000" + "0000" + "0000"   +  "2";
for(_i=0; _i<4; _i++) dl_tsrc_data[|LVL_SECTIONS_ROW+(LVL_SECTION_ROWS*_i)] = _TSRC_DATA1;
/*
ar_TSRC_DATA[ 0] = _TSRC_DATA2; // Hor bar 2 (Next/Cancel)
ar_TSRC_DATA[ 1] = _TSRC_DATA4; // Side 2 (Next/Cancel)
ar_TSRC_DATA[ 2] = _TSRC_DATA4; // Side 2 (Next/Cancel)
ar_TSRC_DATA[ 3] = _TSRC_DATA2; // Hor bar 2 (Next/Cancel)
                                // 
ar_TSRC_DATA[ 4] = _TSRC_DATA1; // Hor bar 1
ar_TSRC_DATA[ 5] = _TSRC_DATA3; // Side 1
ar_TSRC_DATA[ 6] = _TSRC_DATA3; // Side 1
ar_TSRC_DATA[ 7] = _TSRC_DATA3; // Side 1
                                // 
ar_TSRC_DATA[ 8] = _TSRC_DATA3; // Side 1
ar_TSRC_DATA[ 9] = _TSRC_DATA1; // Hor bar 1
ar_TSRC_DATA[10] = _TSRC_DATA3; // Side 1
ar_TSRC_DATA[11] = _TSRC_DATA3; // Side 1
                                // 
ar_TSRC_DATA[12] = _TSRC_DATA3; // Side 1
ar_TSRC_DATA[13] = _TSRC_DATA3; // Side 1
ar_TSRC_DATA[14] = _TSRC_DATA1; // Hor bar 1
ar_TSRC_DATA[15] = _TSRC_DATA3; // Side 1
                                // 
ar_TSRC_DATA[16] = _TSRC_DATA3; // Side 1
ar_TSRC_DATA[17] = _TSRC_DATA3; // Side 1
ar_TSRC_DATA[18] = _TSRC_DATA3; // Side 1
ar_TSRC_DATA[19] = _TSRC_DATA1; // Hor bar 1
*/








canDrawStatIcon = 1;



dl_xp_next_stat = ds_list_create();
ds_list_add(dl_xp_next_stat,0,0,0);





srf_FRAME = 0;
//srf_FRAME = surface_create(CLMS<<3, ROWS<<3);




if (DEV)
{
    show_debug_message("LevelUpMenu_Create() END. "+string(current_time-_START_TIME));
    show_debug_message("");
}




