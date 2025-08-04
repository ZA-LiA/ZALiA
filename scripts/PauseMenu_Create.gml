/// PauseMenu_Create()

if (DEV)
{
    var _START_TIME = current_time;
    show_debug_message("");
    show_debug_message("PauseMenu_Create() START");
}


var _i, _a, _val, _count;
var _x,_x1,_x2, _y,_y1,_y2,_y3;
var _clm,_row, _clms,_rows;
var _pad, _dist1,_dist2;
var _spr;
var _str, _data;
var _dk;


g.PAUSE_MENU = id;


mapDelay1 = 1; // dev/testing
mapDelay1_state_Backup = 0;
mapDelay1_state_dir_Backup = 0;


POSITIONING_VER = 2;

PI_MENU1 = global.PI_GUI1;


timer  = 0;
timer0 = 0;


state_SPELL = 1;
state_ITEM  = 2;
state_MAP   = 3;
state       = state_SPELL; // Default

// SCB: State Change Button
SCB_R = Input.A; // xbox cont: A
SCB_L = Input.B; // xbox cont: X

state_dir = 0; // 0, 1, -1. Which dir pressed this frame
DUR_ARROW_BLINK = 6;



// Store the current rm palette when the menu opens.
rm_pal_on_open = p.pal_rm_DEFAULT;
PAL_MOBS = p.PAL_MOB_ORG1 + p.PAL_MOB_RED2 + p.PAL_MENU_BLU2;
PAL_MOBS_LEN = string_length(PAL_MOBS);




// 8x8 tiles
CLMS_WIN_DEF = g.GUI_WIN_CLMS1; // $0E. 8x8
ROWS_WIN_DEF = $17;             // $17. 8x8


// 8x8 tiles
CLMS_WIN_SPL = CLMS_WIN_DEF;
ROWS_WIN_SPL = ROWS_WIN_DEF;

// 8x8 tiles
CLMS_WIN_ITM = CLMS_WIN_DEF;
ROWS_WIN_ITM = ROWS_WIN_DEF;


// 8x8 tiles. FOR THE AREA OF MAP PAPER!!!
CLMS_MAP_PAPER = $16 + $0A; // $16==22
ROWS_MAP_PAPER = ROWS_WIN_DEF - 2 - 2; // - 2 for bottom info, - 2 for border

// These are variable because some dungeons will need 
// to be scrolled if big enough.
clms_map_paper = CLMS_MAP_PAPER;
rows_map_paper = ROWS_MAP_PAPER;

paper_drawn_clms = 0;
paper_drawn_rows = 0;

// 8x8 tiles
CLMS_WIN_MAP = CLMS_MAP_PAPER + 2; // map paper area. + 2 for border
ROWS_WIN_MAP = ROWS_WIN_DEF;

// 4x4. max rows/clms of map terrain to draw
CLMS_MAP_TERRA = (CLMS_MAP_PAPER - 2) <<1;
ROWS_MAP_TERRA = (ROWS_MAP_PAPER - 2) <<1;

// max clms & rows that can be viewed at one time.
CLMS_MAP_DNGN  = CLMS_MAP_PAPER - 2;
ROWS_MAP_DNGN  = ROWS_MAP_PAPER - 2;
DUNGEON_MAP_PAD1 = 1;



ANIM_FRAMES_DEF = ROWS_WIN_DEF>>1; // 11
ANIM_FRAMES_MAP = ANIM_FRAMES_DEF + ((CLMS_WIN_MAP-CLMS_WIN_DEF)>>1);
anim_frame      = 0;



//Window_spell_menu_window_xl = 0; // xl for Spell & Item only
Window_W0  = CLMS_WIN_DEF<<3;
Window_xl0 = 0; // what `get_menu_x()` returns
Window_xl  = 0; // same as drawX
Window_xr  = 0;
Window_yt  = 0;
Window_yb  = 0;
Window_w   = 0;
Window_h   = 0;
Window_vertical_draw_section_count = 0;
Window_extra_draw_clms = 0;
Window_extra_draw_clms_w = 0;
Window_filler_clms = 0;
Window_draw_data_state = 0;




WindowBackground_can_draw = false;
WindowBackground_COLOR1 = p.C_BLK1;
WindowBackground_color  = global.BackgroundColor_scene;
WindowBackground_ALPHA1 = 1;
WindowBackground_alpha  = 1;
WindowBackground_w  = 0;
WindowBackground_h  = 0;
WindowBackground_xl = 0;
WindowBackground_yt = 0;



//MenuFrameMapLeftEdge_W = $1<<3;




MenuNav_can_draw = false;
//                                                  //
MenuNav_FONT   = spr_Font1;
MenuNav_FONT_W = sprite_get_width( MenuNav_FONT);
MenuNav_FONT_H = sprite_get_height(MenuNav_FONT);
//                                                  //
MenuNavL_sprite   = 0;
MenuNavL_sprite_x = 0;
MenuNavL_sprite_y = 0;
//                                                  //
MenuNavL_text_can_draw = false;
MenuNavL_text    = undefined;
MenuNavL_text_xl = 0;
MenuNavL_text_yt = 0;
//                                                  //
//                                                  //
MenuNavR_sprite   = 0;
MenuNavR_sprite_x = 0;
MenuNavR_sprite_y = 0;
//                                                  //
MenuNavR_text_can_draw = false;
MenuNavR_text    = undefined;
MenuNavR_text_xl = 0;
MenuNavR_text_yt = 0;
//                                                  //




AreaName_can_draw = false;
AreaName_FONT   = spr_Font1;
AreaName_FONT_W = sprite_get_width( AreaName_FONT);
AreaName_FONT_H = sprite_get_height(AreaName_FONT);
AreaName_text   = undefined;
AreaName_xl     = 0;
AreaName_yt     = 0;




COLOR_PAPER = p.C_YLW2; // CI_YLW2 = $28








Icons_can_draw = false;

SPR_ICON_KEY = spr_Key_icon;
SPR_ICON_SPL = spr_menu_bottle_icon;
SPR_ICON_ITM = SPR_ICON_KEY;
SPR_ICON_MAP = spr_icon_compass;
SPR_ICON_PC1 = spr_Lives_icon;
SPR_ICON_KSU = spr_kakusu_icon_1a;
//SPR_ICON_KSU = spr_Demon_icon;


switch(POSITIONING_VER){
case 1:{Icons_Y=$7C; Icons_PAD=$C; break;}
case 2:{Icons_Y=$78; Icons_PAD=$E; break;}
}
Icons_x = 0;
Icons_y = 0;


dg_icons1 = ds_grid_create(0,7);
_i = -1;
ds_grid_resize(dg_icons1, (++_i)+1, ds_grid_height(dg_icons1));
dg_icons1[#_i,0] = SPR_ICON_PC1;
dg_icons1[#_i,1] = g.CHAR_TIMES + "X";
dg_icons1[#_i,2] =  0; // xoff
dg_icons1[#_i,3] =  0; // yoff
dg_icons1[#_i,4] = PI_MENU1; // 
dg_icons1[#_i,5] = false; // can draw
dg_icons1[#_i,6] = -1; // xscale

ds_grid_resize(dg_icons1, (++_i)+1, ds_grid_height(dg_icons1));
dg_icons1[#_i,0] = SPR_ICON_KEY;
dg_icons1[#_i,1] = g.CHAR_TIMES + "X";
dg_icons1[#_i,2] =  0; // xoff
dg_icons1[#_i,3] =  0; // yoff
dg_icons1[#_i,4] = PI_MENU1; // 
dg_icons1[#_i,5] = false; // can draw
dg_icons1[#_i,6] = 1; // xscale

ds_grid_resize(dg_icons1, (++_i)+1, ds_grid_height(dg_icons1));
dg_icons1[#_i,0] = SPR_ICON_KSU;
dg_icons1[#_i,1] = g.CHAR_TIMES + "X";
dg_icons1[#_i,2] =  0; // xoff
dg_icons1[#_i,3] = -1; // yoff
dg_icons1[#_i,4] = global.PI_MOB_ORG; // 
dg_icons1[#_i,5] = false; // can draw
dg_icons1[#_i,6] = 1; // xscale


Icons_COUNT = ds_grid_width(dg_icons1);




map_clm_off = 0;
map_row_off = 0;


dungeon_clms    = 0;
dungeon_rows    = 0;
dungeon_clms_visited = 0;
dungeon_rows_visited = 0;
dungeon_vis_rgt = 0;
dungeon_vis_lft = 0;
dungeon_vis_btm = 0;
dungeon_vis_top = 0;

dngn_map_pc_rc      = 0;
// DNGN_MAP_PC_SPR     = SPR_ICON_PC1;
DNGN_MAP_PC_SPR_WW_ = sprite_get_width( SPR_ICON_PC1)>>1;
DNGN_MAP_PC_SPR_HH_ = sprite_get_height(SPR_ICON_PC1)>>1;

            dl_DngnEntranceArrow_SPR = ds_list_create();
ds_list_add(dl_DngnEntranceArrow_SPR, 0); // idx 0 is nothing. To make data access easier
ds_list_add(dl_DngnEntranceArrow_SPR, spr_arrow_6_rgt);
ds_list_add(dl_DngnEntranceArrow_SPR, spr_arrow_6_lft);
ds_list_add(dl_DngnEntranceArrow_SPR, spr_arrow_6_dwn);
ds_list_add(dl_DngnEntranceArrow_SPR, spr_arrow_6_up);
/*
MAP_EXIT_ARROW_SPR_RGT = spr_arrow_6_rgt;
MAP_EXIT_ARROW_SPR_LFT = spr_arrow_6_lft;
MAP_EXIT_ARROW_SPR_DWN = spr_arrow_6_dwn;
MAP_EXIT_ARROW_SPR_UP  = spr_arrow_6_up;
*/
DngnEntranceArrow_XYOff  = sprite_get_width(dl_DngnEntranceArrow_SPR[|1])>>1; // $4: half arrow spr w
DngnEntranceArrow_XYOff += 4; // Dist outside of rm drawn.


// ---------------------------------------------------------------------


MapAreaName = MapAreaName_DEF;





// ---------------------------------------------------------------------
/*
for (_i=5; _i>=0; _i--)
{
    sprData[_i, 2] = "";
    sprData[_i, 1] = "";
    sprData[_i, 0] = "";
}

// strings of indices for array Menu.sprPieces
sprDataStr1 = "20000000000002"; // Top & Bottom
sprDataStr2 = "1&&&&&&&&&&&&1"; // Side
sprDataStr3 = "10000000000001"; // Hor section bar
sprData[0, 0] = sprDataStr1; // Top
sprData[0, 1] = sprDataStr2;
sprData[1, 0] = sprDataStr2;
sprData[1, 1] = sprDataStr2;
sprData[2, 0] = sprDataStr3; // Hor section bar
sprData[2, 1] = sprDataStr2;
sprData[2, 2] = sprDataStr1; // Bottom

// For ST_MAP
sprDataStr4 = "2000000000000002"; // (ST_MAP) Top
sprDataStr5 = "1&&&&&&&&&&&&&&1"; // (ST_MAP) Side
sprDataStr6 = "1020000000000001"; // (ST_MAP) Hor section bar
sprDataStr7 = "1&1&&&&&&&&&&&&1"; // (ST_MAP) Side w/ divider
sprDataStr8 = "2020000000000002"; // (ST_MAP) Bottom
sprData[3, 0] = sprDataStr4; // Top
sprData[3, 1] = sprDataStr5;
sprData[4, 0] = sprDataStr5;
sprData[4, 1] = sprDataStr5;
sprData[5, 0] = sprDataStr6; // Hor section bar
sprData[5, 1] = sprDataStr7;
sprData[5, 2] = sprDataStr8; // Bottom
*/





/*
// strings of indices for array Menu.sprPieces
sprDataStr1 =   "20000000000002"; // Top & Bottom
sprDataStr2 =   "1&&&&&&&&&&&&1"; // Side
sprDataStr3 =   "10000000000001"; // Hor section bar
// For ST_MAP
sprDataStr4 = "2000000000000002"; // (ST_MAP) Top
sprDataStr5 = "1&&&&&&&&&&&&&&1"; // (ST_MAP) Side
sprDataStr6 = "1020000000000001"; // (ST_MAP) Hor section bar
sprDataStr7 = "1&1&&&&&&&&&&&&1"; // (ST_MAP) Side w/ divider
sprDataStr8 = "2020000000000002"; // (ST_MAP) Bottom
*/
var _E = "&"; // Empty
var _H = "0"; // Horizontal
var _V = "1"; // Vertical
var _C = "2"; // Corner

TSRC_HORZ = g.dl_MenuFrame_TSRC[|0];
TSRC_VERT = g.dl_MenuFrame_TSRC[|1];
TSRC_CORN = g.dl_MenuFrame_TSRC[|2];

// CLMS_WIN_DEF==$E
var _CLMS = CLMS_WIN_DEF - 2;

// strings of indices for array Menu.sprPieces
sprDataStr1 =         _C + string_repeat(_H,_CLMS) + _C; // Top & Bottom
sprDataStr2 =         _V + string_repeat(_E,_CLMS) + _V; // Mid
sprDataStr3 =         _V + string_repeat(_H,_CLMS) + _V; // Hor section bar

sprDataStr4 = _C+_H + _H + string_repeat(_H,_CLMS) + _C; // (ST_MAP) Top
sprDataStr5 = _V+_E + _E + string_repeat(_E,_CLMS) + _V; // (ST_MAP) Mid
sprDataStr6 = _V+_H + _C + string_repeat(_H,_CLMS) + _V; // (ST_MAP) Hor section bar
sprDataStr7 = _V+_E + _V + string_repeat(_E,_CLMS) + _V; // (ST_MAP) Mid w/ divider
sprDataStr8 = _C+_H + _C + string_repeat(_H,_CLMS) + _C; // (ST_MAP) Bottom
//sprDataStr9 = _V+_H + _C + string_repeat(_H,_CLMS) + _C; // (ST_MAP) Hor section bar








var _WIN_MID_SECTION_COUNT  = ROWS_WIN_DEF;
    _WIN_MID_SECTION_COUNT -= $4; // top & bottom sections, 2 rows each
    _WIN_MID_SECTION_COUNT  = _WIN_MID_SECTION_COUNT>>1; // each section is 2 rows
//

dg_tdata_H = 3;


// an index num of 1st dimension == the anim frame - 1
// an index num of 2nd dimension == one of the 8-pixel-high rows
// dg_win_tdata_spl[anim frame, row of frame]
// SPELL ------------------------------------
dg_win_tdata_spl = ds_grid_create(0,dg_tdata_H);
_idx = -1;
ds_grid_resize(dg_win_tdata_spl, (++_idx)+1, dg_tdata_H);
dg_win_tdata_spl[#_idx,0] = sprDataStr1; // Top
dg_win_tdata_spl[#_idx,1] = sprDataStr2; // 
//                                      //
repeat(_WIN_MID_SECTION_COUNT)
{
    ds_grid_resize(dg_win_tdata_spl, (++_idx)+1, dg_tdata_H);
    dg_win_tdata_spl[#_idx,0] = sprDataStr2; // 
    dg_win_tdata_spl[#_idx,1] = sprDataStr2; // 
}
//                                      //
ds_grid_resize(dg_win_tdata_spl, (++_idx)+1, dg_tdata_H);
dg_win_tdata_spl[#_idx,0] = sprDataStr3; // Hor section bar
dg_win_tdata_spl[#_idx,1] = sprDataStr2; // 
dg_win_tdata_spl[#_idx,2] = sprDataStr1; // Bottom


MenuFrame_srf_SPELL   = 0;
MenuFrame_srf_SPELL_W = CLMS_WIN_SPL<<3;
_count = 0;
for(_i=ds_grid_width(dg_win_tdata_spl)-1; _i>=0; _i--){
    for(_j=0; _j<dg_tdata_H; _j++) _count += dg_win_tdata_spl[#_i,_j]!=0;
}
MenuFrame_srf_SPELL_H = _count<<3;








// ITEM ------------------------------------
dg_win_tdata_itm = ds_grid_create(0,dg_tdata_H);
ds_grid_copy(dg_win_tdata_itm, dg_win_tdata_spl);

MenuFrame_srf_ITEM   = 0;
MenuFrame_srf_ITEM_W = CLMS_WIN_ITM<<3;
_count = 0;
for(_i=ds_grid_width(dg_win_tdata_itm)-1; _i>=0; _i--){
    for(_j=0; _j<dg_tdata_H; _j++) _count += dg_win_tdata_itm[#_i,_j]!=0;
}
MenuFrame_srf_ITEM_H = _count<<3;








// MAP ------------------------------------
dg_win_tdata_map = ds_grid_create(0,dg_tdata_H);
_idx = -1;
ds_grid_resize(dg_win_tdata_map, (++_idx)+1, dg_tdata_H);
dg_win_tdata_map[#_idx,0] = sprDataStr4; // Top
dg_win_tdata_map[#_idx,1] = sprDataStr5; // 
//                                      //
repeat(_WIN_MID_SECTION_COUNT)
{
    ds_grid_resize(dg_win_tdata_map, (++_idx)+1, dg_tdata_H);
    dg_win_tdata_map[#_idx,0] = sprDataStr5; // 
    dg_win_tdata_map[#_idx,1] = sprDataStr5; // 
}
//                                      //
ds_grid_resize(dg_win_tdata_map, (++_idx)+1, dg_tdata_H);
dg_win_tdata_map[#_idx,0] = sprDataStr6; // Hor section bar
dg_win_tdata_map[#_idx,1] = sprDataStr7; // 
dg_win_tdata_map[#_idx,2] = sprDataStr8; // Bottom

_count  = (ANIM_FRAMES_MAP-ANIM_FRAMES_DEF)<<1;
_count -= 2;
for(_i=ds_grid_width(dg_win_tdata_map)-1; _i>=0; _i--)
{
    for(_j=0; _j<dg_tdata_H; _j++)
    {
        _data = dg_win_tdata_map[#_i,_j];
        if (_data!=0)
        {
            _val  = string_char_at(_data,2);
            _val  = string_repeat(_val, _count);
            _data = string_insert(_val, _data, 2);
            dg_win_tdata_map[#_i,_j] = _data;
        }
    }
}


MenuFrame_srf_MAP   = 0;
MenuFrame_srf_MAP_W = CLMS_WIN_MAP<<3;
_count = 0;
for(_i=ds_grid_width(dg_win_tdata_map)-1; _i>=0; _i--){
    for(_j=0; _j<dg_tdata_H; _j++) _count += dg_win_tdata_map[#_i,_j]!=0;
}
MenuFrame_srf_MAP_H = _count<<3;
/*
sprDataStr4 = _C+_H + _H + string_repeat(_H,_CLMS) + _C; // (ST_MAP) Top
sprDataStr5 = _V+_E + _E + string_repeat(_E,_CLMS) + _V; // (ST_MAP) Mid
sprDataStr6 = _V+_H + _C + string_repeat(_H,_CLMS) + _V; // (ST_MAP) Hor section bar
sprDataStr7 = _V+_E + _V + string_repeat(_E,_CLMS) + _V; // (ST_MAP) Mid w/ divider
sprDataStr8 = _C+_H + _C + string_repeat(_H,_CLMS) + _C; // (ST_MAP) Bottom
*/








MenuFrameSeparator1_can_draw = false;
MenuFrameSeparator1_W        = $1<<3; // spell/item: frame left clm. map: area-name/menu-navigation separator. 1st clm of `Window_xl0`
MenuFrameSeparator1_SURF_XL  = MenuFrame_srf_MAP_W - Window_W0;


MenuFrameMain_w      = Window_W0;
MenuFrameMain_xl     = 0;
MenuFrameMain_yt     = 0;
MenuFrameMain_srf_xl = 0;







// --------------------------------------------------------
canDrawSpells = false;

dl_spell_str = ds_list_create();
var _CHAR_MAX = 8;
var                  _spell_name;
for(_i=0; _i<g.SPELL_COUNT; _i++){
                     _spell_name  = string_letters(val(g.dm_Spell[?hex_str($1<<_i)+STR_Name], STR_CUCCO));
    if(!is_undefined(_spell_name))
    {                _spell_name += string_repeat(".", _CHAR_MAX-string_length(_spell_name));  }
    else             _spell_name  = string_repeat(".", _CHAR_MAX);
    
    ds_list_add(dl_spell_str,_spell_name);
}

Head_TEXT         = "MAGIC";
Head_TEXT        += string_repeat(".", _CHAR_MAX-string_length(Head_TEXT));

SPELL_TEXT_CUCCO  = string_letters(STR_CUCCO);
SPELL_TEXT_CUCCO += string_repeat(".", _CHAR_MAX-string_length(SPELL_TEXT_CUCCO));

// ar_spell_str[0] = "SHIELD..";
// ar_spell_str[1] = "JUMP....";
// ar_spell_str[2] = "LIFE....";
// ar_spell_str[3] = "FAIRY...";
// ar_spell_str[4] = "FIRE....";
// ar_spell_str[5] = "REFLECT.";
// ar_spell_str[6] = "SPELL...";
// ar_spell_str[7] = "THUNDER.";
// ar_spell_str[8] = "RETURN..";





// --------------------------------------------------------
canDrawItems = false;

var _PI_ITEM = global.PI_MOB_ORG;
var _SPR_ERROR = spr_Locked_Door1B;

switch(POSITIONING_VER)
{   // -----------------------------------------------------------
    case 1:{
    ITEM_PAD2 = 4;
    
    _dist1 = $08 + ITEM_PAD2;
    _dist2 = $10 + $05;
    _x1    = $0A + 4;
    _y1    = $0C + 8;
    _y2    = $48;
    
    ITEMS_BAR1_Y = $37;
    ITEMS_BAR2_Y = $56;
    ITEMS_BAR3_Y = $70;
    break;}
    
    // -----------------------------------------------------------
    case 2:{
    _dist1 = $08 + 4;
    _dist2 = $10 + $05;
    _x1    = $0A + 4;
    _y1    = $0A + 8;
    _y2    = $47;
    
    ITEMS_BAR1_Y = $35;
    ITEMS_BAR2_Y = $56;
    ITEMS_BAR3_Y = $6E;
    break;}
}

Items_Bar_COLOR1 = p.C_WHT0;
Items_Bar_COLOR2 = p.C_BLU0;
//Items_Bar_COLOR1 = p.C_WHT1;
//Items_Bar_COLOR2 = p.C_VLT3;
Items_Bar_W = (CLMS_WIN_DEF-2)<<3;

Items_Bar1_can_draw = false; // Main & Quest items separator
Items_Bar1_XOFF = 8;
Items_Bar1_YOFF = ITEMS_BAR1_Y;
Items_Bar1_x    = 0;
Items_Bar1_y    = 0;

Items_Bar2_can_draw = false; // Crystals top bar
Items_Bar2_XOFF = 8;
Items_Bar2_YOFF = ITEMS_BAR2_Y;
Items_Bar2_x    = 0;
Items_Bar2_y    = 0;

Items_Bar3_can_draw = false; // Crystals btm bar
Items_Bar3_XOFF = 8;
Items_Bar3_YOFF = ITEMS_BAR3_Y;
Items_Bar3_x    = 0;
Items_Bar3_y    = 0;
//                                                                                              //
//                                                                                              //
MainItems_can_draw = false;
//                                                                                              //
dg_items = ds_grid_create($0,$6);
var _GRID_HEIGHT = ds_grid_height(dg_items);
//                                                                                              //
//                                                                                              //
for(_i=0; _i<$10; _i++){
ds_grid_resize(dg_items, _i+1,_GRID_HEIGHT);
dg_items[#_i,$0]   = $01<<_i; // ITEM_BIT
dg_items[#_i,$1]   = _x1+(_dist1*(_i mod 8));
dg_items[#_i,$2]   = _y1+(_dist2*(_i div 8));
dg_items[#_i,$3]   = val(g.dm_ITEM[?hex_str(bitNum(dg_items[#_i,$0]))+STR_Sprite], _SPR_ERROR);
dg_items[#_i,$4]   = _PI_ITEM;
dg_items[#_i,$5]   = false; // can draw
}         _i--;
//                                                                                              //
ITM_NOTE_IDX = ++_i; ds_grid_resize(dg_items, _i+1,_GRID_HEIGHT); // 
dg_items[#_i,$0]   = ITM_NOTE;
dg_items[#_i,$1]   = ($02<<3)+4;
dg_items[#_i,$2]   = _y2;
dg_items[#_i,$3]   = val(g.dm_ITEM[?hex_str(bitNum(dg_items[#_i,$0]))+STR_Sprite], _SPR_ERROR);
dg_items[#_i,$4]   = _PI_ITEM;
//                                                                                              //
ITM_MIRR_IDX = ++_i; ds_grid_resize(dg_items, _i+1,_GRID_HEIGHT); // 
dg_items[#_i,$0]   = ITM_MIRR;
dg_items[#_i,$1]   = ($04<<3)+4;
dg_items[#_i,$2]   = _y2;
dg_items[#_i,$3]   = val(g.dm_ITEM[?hex_str(bitNum(dg_items[#_i,$0]))+STR_Sprite], _SPR_ERROR);
dg_items[#_i,$4]   = _PI_ITEM;
//                                                                                              //
ITM_TRPH_IDX = ++_i; ds_grid_resize(dg_items, _i+1,_GRID_HEIGHT); // 
dg_items[#_i,$0]   = ITM_TRPH;
dg_items[#_i,$1]   = (CLMS_WIN_DEF>>1)<<3;
dg_items[#_i,$2]   = _y2;
dg_items[#_i,$3]   = val(g.dm_ITEM[?hex_str(bitNum(dg_items[#_i,$0]))+STR_Sprite], _SPR_ERROR);
dg_items[#_i,$4]   = _PI_ITEM;
//                                                                                              //
ITM_MEDI_IDX = ++_i; ds_grid_resize(dg_items, _i+1,_GRID_HEIGHT); // 
dg_items[#_i,$0]   = ITM_MEDI;
dg_items[#_i,$1]   =(($02<<3)+4) + ((CLMS_WIN_DEF>>1)<<3);
dg_items[#_i,$2]   = _y2;
dg_items[#_i,$3]   = val(g.dm_ITEM[?hex_str(bitNum(dg_items[#_i,$0]))+STR_Sprite], _SPR_ERROR);
dg_items[#_i,$4]   = val(g.dm_ITEM[?hex_str(ITM_MEDI)+STR_pal_idx],global.PI_MOB_ORG);
//                                                                                              //
ITM_CHLD_IDX = ++_i; ds_grid_resize(dg_items, _i+1,_GRID_HEIGHT); // 
dg_items[#_i,$0]   = ITM_CHLD;
dg_items[#_i,$1]   =(($04<<3)+4) + ((CLMS_WIN_DEF>>1)<<3) + 1;
dg_items[#_i,$2]   = _y2;
dg_items[#_i,$3]   = val(g.dm_ITEM[?hex_str(bitNum(dg_items[#_i,$0]))+STR_Sprite], _SPR_ERROR);
dg_items[#_i,$4]   = _PI_ITEM;
//                                                                                              //
ITM_BTL1_IDX = ++_i; ds_grid_resize(dg_items, _i+1,_GRID_HEIGHT); // 
dg_items[#_i,$0]   = ITM_BTL1;
dg_items[#_i,$1]   = $60;
dg_items[#_i,$2]   = _y2;
dg_items[#_i,$3]   = val(g.dm_ITEM[?hex_str(bitNum(dg_items[#_i,$0]))+STR_Sprite], _SPR_ERROR);
dg_items[#_i,$4]   = global.PI_MOB_RED;
ITM_BTL1_SPR1 = dg_items[#ITM_BTL1_IDX,$03];
ITM_BTL1_SPR2 = spr_Item_Bottle_8c; // Bottle full
//                                                                      //
//                                                                                              //
switch(POSITIONING_VER)
{
    // ==================================================================
    // -----------------------------------------------------------
    case 1:{
    dg_items[#(bitNum(ITM_CAND))-1,$02] += -1;
    dg_items[#(bitNum(ITM_RAFT))-1,$02] += -1;
    dg_items[#(bitNum(ITM_BOOT))-1,$02] += -1;
    dg_items[#(bitNum(ITM_FLUT))-1,$02] += -1;
    dg_items[#(bitNum(ITM_CROS))-1,$02] += -2;
    dg_items[#(bitNum(ITM_HAMM))-1,$02] += -1;
    dg_items[#(bitNum(ITM_RING))-1,$02] += -3;
    dg_items[#(bitNum(ITM_BRAC))-1,$02] += -1;
    dg_items[#(bitNum(ITM_MASK))-1,$02] += -1;
    break;}
    
    
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case 2:{
    dg_items[#(bitNum(ITM_RING))-1,$02] += -3;
    break;}
}

//                                                                      //
dg_items[#(bitNum(ITM_FRY1))-1,$04] = global.PI_MOB_RED;
//                                                                      //




Feather_can_draw = false;
Feather_SPRITE = spr_Item_Feather_1a;
Feather_pi     = global.PI_GUI2;
Feather_x = 0;
Feather_y = 0;






Crystals_can_draw = false;
SPR_CRYSTAL1   = spr_Crystal_1b;
SPR_CRYSTAL2   = spr_Crystal_1a;
SPR_CRYSTAL_H_ = sprite_get_height(SPR_CRYSTAL1)>>1;
Crystals_PAD1 = $2<<3;
switch(POSITIONING_VER){
case 1:{Crystals_Y=$65;break;}
case 2:{Crystals_Y=$64;break;}
}
Crystals_x = 0;
Crystals_y = 0;




LifeDolls_can_draw = false;
LifeDolls_SPRITE  = val(g.dm_ITEM[?object_get_name(ItmG0)+'01'+STR_Sprite], spr_Item_LifeDoll_1b);
//LifeDolls_SPRITE  = val(g.dm_ITEM[?object_get_name(ItmG0)+'01'+STR_Sprite], spr_Item_LifeDoll_1a);
//LifeDolls_SPRITE_H_ = sprite_get_height(LifeDoll_SPRITE)>>1;
LifeDolls_pi = global.PI_PC1; // Green PC pal
LifeDolls_count = 0;
switch(POSITIONING_VER){
case 1:{Dolls_X=$34; Dolls_Y=$81; Dolls_PAD=$0E; break;}
case 2:{Dolls_X=$34; Dolls_Y=$7F; Dolls_PAD=$0E; break;}
}
LifeDolls_x = 0;
LifeDolls_y = 0;




switch(POSITIONING_VER){
case 1:{_y1=$95;break;}
case 2:{_y1=$94;break;}
}




AllKey_can_draw = false;
AllKey_SPRITE = val(g.dm_ITEM[?hex_str(bitNum(ITM_SKEY))+STR_Sprite], spr_Item_Skull_key_1a_1);
switch(POSITIONING_VER){
case 1:{AllKey_X=$5F; AllKey_Y=$81;break;}
case 2:{AllKey_X=$5F; AllKey_Y=$7F;break;}
}
AllKey_x = 0;
AllKey_y = 0;








//TreasureMaps_can_draw = false;
switch(POSITIONING_VER){
case 1:{TreasureMap1_XOFF=$34; TreasureMap1_YOFF=_y1; Maps_PAD=$2; break;}
case 2:{TreasureMap1_XOFF=$34; TreasureMap1_YOFF=_y1; Maps_PAD=$2; break;}
}

TreasureMap1_can_draw = false;
TreasureMap1_SPRITE = val(g.dm_ITEM[?hex_str(bitNum(ITM_MAP1))+STR_Sprite], spr_Item_Map_2a);
TreasureMap1_x = 0;
TreasureMap1_y = 0;


TreasureMap2_can_draw = false;
TreasureMap2_SPRITE = val(g.dm_ITEM[?hex_str(bitNum(ITM_MAP2))+STR_Sprite], spr_Item_Map_2b);
TreasureMap2_XOFF = TreasureMap1_XOFF + 8 + Maps_PAD;
TreasureMap2_YOFF = TreasureMap1_YOFF;
TreasureMap2_x = 0;
TreasureMap2_y = 0;








//Containers_can_draw = false;
switch(POSITIONING_VER){
case 1:{Containers_X=$4E; Containers_Y=_y1; Containers_PAD=$01; break;}
case 2:{Containers_X=$4E; Containers_Y=_y1; Containers_PAD=$01; break;}
}
ContainerPiece_count_hp = 0;
ContainerPiece_count_mp = 0;

ContainerHP_can_draw = false;
ContainerHP_sprite = 0;
ContainerHP_x = 0;
ContainerHP_y = 0;

ContainerMP_can_draw = false;
ContainerMP_sprite = 0;
ContainerMP_x = 0;
ContainerMP_y = 0;







// --------------------------------------------------------
MapArea_W  = CLMS_MAP_PAPER<<3;
MapArea_H  = ROWS_MAP_PAPER<<3;
MapArea_w  = 0;
MapArea_h  = 0;
MapArea_xl = 0;
MapArea_yt = 0;

MapPaper_USE_SURFACE = true;
MapPaper_PAD1 = $2;
MapPaper_w  = 0;
MapPaper_h  = 0;
MapPaper_xl = 0;
MapPaper_yt = 0;

MapTears_srf = 0;

map_anim_idx = 0;

// index is (frame - 1) of open map sequence, which is about 5 frames.
// The value is num of clms to draw from drawX.
dl_map_anim_data = ds_list_create();
ds_list_add(dl_map_anim_data,$00,$02,$06,$0B,$10,$14,$18,$1B,$1E,$20,$20);
/*
ar_map_anim_data = 0;
var    _VER = 3;
switch(_VER)
{
    case 1:{
    for(_i=4; _i>=0; _i--) ar_map_anim_data[_i]=0;
    ar_map_anim_data[0] = $07; // 
    ar_map_anim_data[1] = $0C; // 
    ar_map_anim_data[2] = $10; // 
    ar_map_anim_data[3] = $13; // 
    ar_map_anim_data[4] = $16; // 
    break;}
    
    case 2:{
    for(_i=5; _i>=0; _i--) ar_map_anim_data[_i]=0;
    ar_map_anim_data[0] = $06; // 
    ar_map_anim_data[1] = $0B; // 
    ar_map_anim_data[2] = $0F; // 
    ar_map_anim_data[3] = $12; // 
    ar_map_anim_data[4] = $15; // 
    ar_map_anim_data[5] = $16; // 
    break;}
    
    case 3:{
    var    _COUNT = ANIM_FRAMES_MAP-ANIM_FRAMES_DEF;
    for(_i=_COUNT-1; _i>=0; _i--) ar_map_anim_data[_i] = 0;
    ar_map_anim_data[ 0] = $00; // 
    ar_map_anim_data[ 1] = $02; // 
    ar_map_anim_data[ 2] = $06; // 
    ar_map_anim_data[ 3] = $0B; // 
    ar_map_anim_data[ 4] = $10; // 
    ar_map_anim_data[ 5] = $14; // 
    ar_map_anim_data[ 6] = $18; // 
    ar_map_anim_data[ 7] = $1B; // 
    ar_map_anim_data[ 8] = $1E; // 
    ar_map_anim_data[ 9] = $20; // 
    ar_map_anim_data[10] = $20; // 
    break;}
}
*/




/*
dg_map_edge values:
$FF: Draw nothing
$FE: Draw solid
$0F bits:
  $00-03 back-end 2 pixels transparent for edge of map
  $00: Sprite 1
  $01: Sprite 1 rot 90deg
  $02: Sprite 2
  $03: Sprite 2 rot 90deg

  $04-07 same as 0-3 except back-end 2 pixels opaque for inner map
  $04: Sprite 1
  $05: Sprite 1 rot 90deg
  $06: Sprite 2
  $07: Sprite 2 rot 90deg
$C0 bits:
  $40: Flip hor
  $80: Flip ver
*/
_clms = CLMS_MAP_PAPER;
_rows = ROWS_MAP_PAPER;
dg_map_edge = ds_grid_create(_clms,_rows);
ds_grid_clear(dg_map_edge, -1);





_clm = 0;
// _clm = _clms-1;
_row = _rows-1;

// clm $00
// dg_map_edge[#_clm,  $00] = $; // 
dg_map_edge[#_clm,  $01] = $41; // 
// dg_map_edge[#_clm,  $02] = $; // 
// dg_map_edge[#_clm,  $03] = $; // 
dg_map_edge[#_clm,  $04] = $C3; // 
// dg_map_edge[#_clm,  $05] = $; // 
dg_map_edge[#_clm,  $06] = $C1; // 
// dg_map_edge[#_clm,  $07] = $; // 
dg_map_edge[#_clm,  $08] = $43; // 
// dg_map_edge[#_clm,  $09] = $; // 
// dg_map_edge[#_clm,  $0A] = $; // 
dg_map_edge[#_clm,  $0B] = $43; // 
// dg_map_edge[#_clm,  $0C] = $; // 
// dg_map_edge[#_clm,  $0D] = $; // 
// dg_map_edge[#_clm,  $0E] = $; // 
dg_map_edge[#_clm,  $0F] = $43; // 
// dg_map_edge[#_clm,  $10] = $; // 
// dg_map_edge[#_clm,  $11] = $; // 
// dg_map_edge[#_clm, _row] = $C0; // 

// clm $01
             _clm++;
dg_map_edge[# $01, _row] = $C0; // 

// clm $02
             _clm++;
dg_map_edge[#_clm,  $00] = $00;
dg_map_edge[#_clm, _row] = $82; // 

// clm $03
             _clm++;
dg_map_edge[#_clm,  $00] = $02;

// clm $04
             _clm++;
dg_map_edge[#_clm, _row] = $C0; // 

// clm $05
             _clm++;


// clm $06
             _clm++;


// clm $07
             _clm++;
dg_map_edge[#_clm,  $00] = $40;
dg_map_edge[#_clm, _row] = $82; // 

// clm $08
             _clm++;


// clm $09
             _clm++;
dg_map_edge[#_clm, _row] = $C0; // 

// clm $0A
             _clm++;


// clm $0B
             _clm++;


// clm $0C
             _clm++;
dg_map_edge[#_clm,  $00] = $00;

// clm $0D
             _clm++;
dg_map_edge[#_clm,  $00] = $00;
dg_map_edge[#_clm, _row] = $C0; // 

// clm $0E
             _clm++;


// clm $0F
             _clm++;


// clm $10
             _clm++;
dg_map_edge[#_clm, _row] = $C0; // 

// clm $11
             _clm++;
dg_map_edge[#_clm,  $00] = $40;
dg_map_edge[#_clm, _row] = $82; // 

// clm $12
             _clm++;


// clm $13
             _clm++;
dg_map_edge[#_clm, _row] = $C0; // 

// clm $14
             _clm++;


// clm $15
             _clm++;


// clm $16
             _clm++;
dg_map_edge[#_clm,  $00] = $00;

// clm $17
             _clm++;
dg_map_edge[#_clm,  $00] = $00;
dg_map_edge[#_clm, _row] = $C0; // 

// clm $18
             _clm++;


// clm $19
             _clm++;


// clm $1A
             _clm++;
dg_map_edge[#_clm, _row] = $C0; // 

// clm $1B
             _clm++;
dg_map_edge[#_clm,  $00] = $00;

// clm $1C
             _clm++;
dg_map_edge[#_clm,  $00] = $FE;
dg_map_edge[#_clm,  $01] = $46; // inner map tear

// clm $1D
             _clm++;
dg_map_edge[#_clm,  $00] = $02;
dg_map_edge[#_clm, _row] = $C0; // 

// clm $1E
             _clm++;
dg_map_edge[#_clm,  $0D] = $85; // inner map tear
dg_map_edge[#_clm, _row] = $82; // 

// clm $1F
             _clm++;
// dg_map_edge[#_clm,  $00] = $; // 
dg_map_edge[#_clm,  $01] = $83; // 
// dg_map_edge[#_clm,  $02] = $; // 
// dg_map_edge[#_clm,  $03] = $; // 
dg_map_edge[#_clm,  $04] = $03; // 
dg_map_edge[#_clm,  $05] = $81; // 
// dg_map_edge[#_clm,  $06] = $; // 
// dg_map_edge[#_clm,  $07] = $; // 
// dg_map_edge[#_clm,  $08] = $; // 
dg_map_edge[#_clm,  $09] = $03; // 
// dg_map_edge[#_clm,  $0A] = $; // 
// dg_map_edge[#_clm,  $0B] = $; // 
dg_map_edge[#_clm,  $0C] = $83; // 
dg_map_edge[#_clm,  $0D] = $FE; // 
dg_map_edge[#_clm,  $0E] = $81; // 
// dg_map_edge[#_clm,  $0F] = $; // 
dg_map_edge[#_clm,  $10] = $01; // 
// dg_map_edge[#_clm,  $11] = $; // 
// dg_map_edge[#_clm, _row] = $; // 




DUNGEON_MAP_ROWS_DEFAULT = $9;
// row indicies: 0:clm, 1:row, 2:tsrc, 3: xscale, 4: yscale, 5: rm_name, 6: rm page, 7: explored, 8: if tsrc is elevator shaft, this is a string of each exit name
dg_dngn_map   = ds_grid_create(0,DUNGEON_MAP_ROWS_DEFAULT);
dg_dngn_map_a = ds_grid_create(0,DUNGEON_MAP_ROWS_DEFAULT);
//                                                          //
dg_dngn_map_1         = ds_grid_create(0,DUNGEON_MAP_ROWS_DEFAULT); // Parapa Palace
dg_dngn_map_1_DEFAULT = ds_grid_create(0,DUNGEON_MAP_ROWS_DEFAULT); // Parapa Palace
//                                                          //
dg_dngn_map_2         = ds_grid_create(0,DUNGEON_MAP_ROWS_DEFAULT); // Midoro Palace
dg_dngn_map_2_DEFAULT = ds_grid_create(0,DUNGEON_MAP_ROWS_DEFAULT); // Midoro Palace
//                                                          //
dg_dngn_map_3         = ds_grid_create(0,DUNGEON_MAP_ROWS_DEFAULT); // Island Palace
dg_dngn_map_3_DEFAULT = ds_grid_create(0,DUNGEON_MAP_ROWS_DEFAULT); // Island Palace
//                                                          //
dg_dngn_map_4         = ds_grid_create(0,DUNGEON_MAP_ROWS_DEFAULT); // Maze Isl Palace
dg_dngn_map_4_DEFAULT = ds_grid_create(0,DUNGEON_MAP_ROWS_DEFAULT); // Maze Isl Palace
//                                                          //
dg_dngn_map_5         = ds_grid_create(0,DUNGEON_MAP_ROWS_DEFAULT); // Palace on the Sea
dg_dngn_map_5_DEFAULT = ds_grid_create(0,DUNGEON_MAP_ROWS_DEFAULT); // Palace on the Sea
//                                                          //
dg_dngn_map_6         = ds_grid_create(0,DUNGEON_MAP_ROWS_DEFAULT); // 3-Rock Palace
dg_dngn_map_6_DEFAULT = ds_grid_create(0,DUNGEON_MAP_ROWS_DEFAULT); // 3-Rock Palace
//                                                          //
dg_dngn_map_7         = ds_grid_create(0,DUNGEON_MAP_ROWS_DEFAULT); // Great Palace
dg_dngn_map_7_DEFAULT = ds_grid_create(0,DUNGEON_MAP_ROWS_DEFAULT); // Great Palace
//                                                          //
dg_dngn_map_8         = ds_grid_create(0,DUNGEON_MAP_ROWS_DEFAULT); // Dragmire Tower
dg_dngn_map_8_DEFAULT = ds_grid_create(0,DUNGEON_MAP_ROWS_DEFAULT); // Dragmire Tower













Overworld8x8_USE_TILES = true;
map_is_opening = false;

TerrainDraw_CLMS = CLMS_MAP_PAPER - 2;
TerrainDraw_CLMS++; // Because grid is centered on paper. Left & Right most tiles will be half drawn

TerrainDraw_ROWS = ROWS_MAP_PAPER - 2;
TerrainDraw_ROWS++; // Because grid is centered on paper. Top & Bottom most tiles will be half drawn

terrain_tile_xl_base = 0;
terrain_tile_yt_base = 0;
terrain_draw_area_xl = 0;
terrain_draw_area_xr = 0;
terrain_draw_area_yt = 0;
terrain_draw_area_yb = 0;

tsrc_grid_clm_base = 0;
tsrc_grid_row_base = 0;

// Will update each frame with the info needed for the draw
dg_terrain_draw = ds_grid_create(TerrainDraw_CLMS*TerrainDraw_ROWS,$C);



var _TS1_IDX_ = hex_str(ds_list_find_index(g.dl_tileset,ts_Overworld_1));
var _TS2_IDX_ = hex_str(ds_list_find_index(g.dl_tileset,ts_OverworldAnim01));
//var _TS1_IDX_ = g.overworld.TILESET1_TS_IDX_;
//var _TS2_IDX_ = g.overworld.TILESET2_TS_IDX_;

/*
var _TSRC_WATER_SHALLOW1 = $30; // 
var _TSRC_WATER_SHALLOW_ANIM1A = $30; // 
var _TSRC_WATER_SHALLOW_ANIM1B = $30; // 
var _TSRC_WATER_SHALLOW_ANIM1C = $30; // 
var _TSRC_WATER_SHALLOW_ANIM1D = $30; // 
var _TSRC_WATER_SHALLOW_ANIM1A = $30; // 
var _TSRC_WATER_SHALLOW_ANIM1B = $30; // 
var _TSRC_WATER_SHALLOW_ANIM1C = $30; // 
var _TSRC_WATER_SHALLOW_ANIM1D = $30; // 

var _TSRC_WATER_DEEP1 = $30; // 
var _TSRC_WATER_DEEP_ANIM1A = $30; // 
var _TSRC_WATER_DEEP_ANIM1B = $30; // 
var _TSRC_WATER_DEEP_ANIM1C = $30; // 
var _TSRC_WATER_DEEP_ANIM1D = $30; // 
*/
/*
var _TSRC_TREE1_FULL1    = $00; // 
var _TSRC_TREE1_FULL2    = $01; // 
var _TSRC_TREE1_TOP      = $02; // 
var _TSRC_TREE1_SIDE     = $03; // 
var _TSRC_TREE1_SIDE_TOP = $04; // 
*/
                          _i=$F8;
var _TSRC_SOLID_BLUE1   = _i++; // Shallow water color
var _TSRC_SOLID_BLUE2   = _i++; // Deep water color
var _TSRC_SOLID_BEIGE1  = _i++; // Beach color
var _TSRC_SOLID_PINK1   = _i++; // Desert color
var _TSRC_SOLID_ORANGE1 = _i++; // Volcano color
var _TSRC_SOLID_GREEN1  = _i++; // Green - light
var _TSRC_SOLID_GREEN2  = _i++; // Green - mid

var _TSRC_FIELD1    = $20; // 
var _TSRC_MOUNTAIN1 = $28; // 
var _TSRC_DESERT1   = $30; // Regular
var _TSRC_DESERT2   = _TSRC_DESERT1+1; // Rough
var _TSRC_SWAMP1    = $40; // 
var _TSRC_VOLCANO1  = $50; // 
var _TSRC_CEMETERY1 = $60; // Regular
var _TSRC_CEMETERY2 = _TSRC_CEMETERY1+1; // Tilted
var _TSRC_BEACH1    = $70; // Regular
var _TSRC_BEACH2    = _TSRC_BEACH1+1; // Rough

var _TSRC_WATER_SHALLOW1 = $80; // 
var _TSRC_WATER_DEEP1    = _TSRC_WATER_SHALLOW1+1; // 
var _TSRC_SHOALS1  = $79; // Shallow water
var _TSRC_SHOALS2  = _TSRC_SHOALS1+1; // Deep water

var _TSRC_PATH1    = $F0; // Regular
var _TSRC_PATH2    = _TSRC_PATH1+1; // Detail
var _TSRC_PATH3    = _TSRC_PATH2+1; // Rough
var _TSRC_BRIDGE1  = $D4; // Horizontal
var _TSRC_BRIDGE2  = _TSRC_BRIDGE1+1; // Vertical
var _TSRC_BOULDER1 = $E0; // 
var _TSRC_DUNGEON1 = $B0; // 
var _TSRC_CASTLE1  = _TSRC_DUNGEON1; // 
var _TSRC_TOWN1    = $B8; // Brown
var _TSRC_TOWN2    = _TSRC_TOWN1+1; // Grey
var _TSRC_TOWN3    = _TSRC_TOWN2+1; // Green
var _TSRC_HOUSE1   = _TSRC_TOWN1; // Brown
var _TSRC_HOUSE2   = _TSRC_TOWN2; // Grey
var _TSRC_HOUSE3   = _TSRC_TOWN3; // Green
var _TSRC_CAVE1    = $D8; // 
var _TSRC_HOLE1    = $C8; // 
var _TSRC_MONSTER1 = $E8; // 


dm_terrain = ds_map_create();

            _dk = STR_TSRC+"_16x16_to_8x8_"+"_Layer1";
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_TREE01)]   = _TSRC_SOLID_GREEN1; // Reg Green Tree - Reg Green BGR
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_TREE02)]   = _TSRC_SOLID_GREEN2; // Orange Tree - Dark Green BGR
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_TREE03)]   = _TSRC_SOLID_GREEN1; // Dark Green Tree - Reg Green BGR
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_TREE04)]   = _TSRC_SOLID_GREEN2; // Dark Green Tree - Mid Green BGR
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_TREE04+1)] = _TSRC_SOLID_BLUE2; // Reg Green Tree - Mid Blue BGR
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_TREE04+2)] = _TSRC_SOLID_BLUE2; // Orange Tree - Mid Blue BGR

dm_terrain[?_dk+_TS1_IDX_+hex_str($08)]         = _TSRC_SHOALS2; // Shoals - deep
dm_terrain[?_dk+_TS1_IDX_+hex_str($0A)]         = _TSRC_SHOALS1; // Shoals - shallow

dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_SAND01)] = _TSRC_DESERT1; // Desert/Sand
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_SAND02)] = _TSRC_DESERT2; // Desert/Sand
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_SAND03)] = _TSRC_DESERT1; // Desert/Sand

dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_SNOW01)] = _TSRC_BEACH1; // Beach/Snow
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_SNOW02)] = _TSRC_BEACH1; // Beach/Snow
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_SNOW03)] = _TSRC_BEACH1; // Beach/Snow
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_SNOW04)] = _TSRC_BEACH2; // Beach/Snow

dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_GRAS01)] = _TSRC_FIELD1; // Field/Grass
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_GRAS02)] = _TSRC_FIELD1; // Field/Grass
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_GRAS03)] = _TSRC_FIELD1; // Field/Grass
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_GRAS04)] = _TSRC_FIELD1; // Field/Grass

dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_VOLC01)] = _TSRC_VOLCANO1; // Volcano

dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_SWAM01)] = _TSRC_SWAMP1; // Swamp
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_SWAM02)] = _TSRC_SWAMP1; // Swamp
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_SWAM03)] = _TSRC_SWAMP1; // Swamp

dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_GRAV01)] = _TSRC_CEMETERY1; // Cemetery/Grave
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_GRAV02)] = _TSRC_CEMETERY1; // Cemetery/Grave
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_GRAV03)] = _TSRC_CEMETERY1; // Cemetery/Grave
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_GRAV04)] = _TSRC_CEMETERY2; // Cemetery/Grave

dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_PATH01)] = _TSRC_PATH1; // Path
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_PATH02)] = _TSRC_PATH2; // Path - messy
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_PATH03)] = _TSRC_PATH3; // Path - rough/hostile

dm_terrain[?_dk+_TS1_IDX_+hex_str($C0)]         = _TSRC_CAVE1; // Cave
dm_terrain[?_dk+_TS1_IDX_+hex_str($C1)]         = _TSRC_CAVE1; // Cave
dm_terrain[?_dk+_TS1_IDX_+hex_str($C2)]         = _TSRC_CAVE1; // Cave
dm_terrain[?_dk+_TS1_IDX_+hex_str($C8)]         = _TSRC_HOLE1; // Ground Hole

dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL01+0)] = _TSRC_PATH1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL01+1)] = _TSRC_PATH1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL01+2)] = _TSRC_DESERT1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL01+3)] = _TSRC_FIELD1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL01+4)] = _TSRC_SWAMP1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL01+5)] = _TSRC_SOLID_BLUE1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL01+6)] = _TSRC_VOLCANO1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL01+7)] = _TSRC_SOLID_BLUE2; // Boulder
/*
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL01)]   = _TSRC_PATH1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL02)]   = _TSRC_PATH1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL02+1)] = _TSRC_DESERT1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL02+2)] = _TSRC_FIELD1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL02+3)] = _TSRC_SWAMP1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL02+4)] = _TSRC_SOLID_BLUE1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL02+5)] = _TSRC_VOLCANO1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL02+6)] = _TSRC_SOLID_BLUE2; // Boulder
*/

dm_terrain[?_dk+_TS2_IDX_+hex_str($F8)]         = _TSRC_PATH1; // River Devil
dm_terrain[?_dk+_TS2_IDX_+hex_str($F9)]         = _TSRC_BRIDGE2; // River Devil
//dm_terrain[?_dk+hex_str($D8)]         = _TSRC_PATH1; // River Devil
//dm_terrain[?_dk+hex_str($D9)]         = _TSRC_BRIDGE2; // River Devil

dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_MOUN01)] = _TSRC_MOUNTAIN1; // Mountain - Top Left of a 16x16

dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BRDG1A)] = _TSRC_BRIDGE1; // Bridge - horizontal
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BRDG1B)] = _TSRC_BRIDGE2; // Bridge - vertical
dm_terrain[?_dk+_TS1_IDX_+hex_str($B4)]         = _TSRC_BRIDGE1; // Bridge - horizontal
dm_terrain[?_dk+_TS1_IDX_+hex_str($B5)]         = _TSRC_BRIDGE2; // Bridge - vertical
dm_terrain[?_dk+_TS1_IDX_+hex_str($B6)]         = _TSRC_BRIDGE1; // Bridge - horizontal
dm_terrain[?_dk+_TS1_IDX_+hex_str($B7)]         = _TSRC_BRIDGE2; // Bridge - vertical
dm_terrain[?_dk+_TS1_IDX_+hex_str($B8)]         = _TSRC_BRIDGE1; // Bridge - horizontal
dm_terrain[?_dk+_TS1_IDX_+hex_str($B9)]         = _TSRC_BRIDGE2; // Bridge - vertical
dm_terrain[?_dk+_TS1_IDX_+hex_str($BA)]         = _TSRC_BRIDGE1; // Bridge - horizontal
dm_terrain[?_dk+_TS1_IDX_+hex_str($BB)]         = _TSRC_BRIDGE2; // Bridge - vertical
dm_terrain[?_dk+_TS1_IDX_+hex_str($BC)]         = _TSRC_BRIDGE1; // Bridge - horizontal
dm_terrain[?_dk+_TS1_IDX_+hex_str($BD)]         = _TSRC_BRIDGE2; // Bridge - vertical
dm_terrain[?_dk+_TS1_IDX_+hex_str($BE)]         = _TSRC_BRIDGE1; // Bridge - horizontal
dm_terrain[?_dk+_TS1_IDX_+hex_str($BF)]         = _TSRC_BRIDGE2; // Bridge - vertical
dm_terrain[?_dk+_TS1_IDX_+hex_str($A8)]         = _TSRC_BRIDGE1; // Bridge Corner
dm_terrain[?_dk+_TS1_IDX_+hex_str($A9)]         = _TSRC_BRIDGE2; // Bridge Corner

dm_terrain[?_dk+_TS1_IDX_+hex_str($AE)]         = _TSRC_BRIDGE1; // Raft Launch - horizontal
dm_terrain[?_dk+_TS1_IDX_+hex_str($AF)]         = _TSRC_BRIDGE2; // Raft Launch - vertical
dm_terrain[?_dk+_TS1_IDX_+hex_str($B0)]         = _TSRC_BRIDGE1; // Raft Launch - horizontal
dm_terrain[?_dk+_TS1_IDX_+hex_str($B1)]         = _TSRC_BRIDGE2; // Raft Launch - vertical

dm_terrain[?_dk+_TS1_IDX_+hex_str($70)]         = _TSRC_BEACH1; // Town
dm_terrain[?_dk+_TS1_IDX_+hex_str($71)]         = _TSRC_DESERT1; // Town
dm_terrain[?_dk+_TS1_IDX_+hex_str($72)]         = _TSRC_FIELD1; // Town
dm_terrain[?_dk+_TS1_IDX_+hex_str($73)]         = _TSRC_DESERT1; // Town
dm_terrain[?_dk+_TS1_IDX_+hex_str($E8)]         = _TSRC_PATH1; // Town
dm_terrain[?_dk+_TS1_IDX_+hex_str($E9)]         = _TSRC_FIELD1; // Town
dm_terrain[?_dk+_TS1_IDX_+hex_str($EA)]         = _TSRC_PATH2; // Town
dm_terrain[?_dk+_TS1_IDX_+hex_str($EB)]         = _TSRC_DESERT1; // Town
dm_terrain[?_dk+_TS1_IDX_+hex_str($78)]         = _TSRC_BEACH1; // House
dm_terrain[?_dk+_TS1_IDX_+hex_str($EC)]         = _TSRC_PATH1; // House
dm_terrain[?_dk+_TS1_IDX_+hex_str($ED)]         = _TSRC_PATH2; // House
dm_terrain[?_dk+_TS1_IDX_+hex_str($EE)]         = _TSRC_DESERT1; // House
dm_terrain[?_dk+_TS1_IDX_+hex_str($EF)]         = _TSRC_FIELD1; // House

dm_terrain[?_dk+_TS1_IDX_+hex_str($90)]         = _TSRC_PATH2; // Dungeon
dm_terrain[?_dk+_TS1_IDX_+hex_str($91)]         = _TSRC_DESERT1; // Dungeon
dm_terrain[?_dk+_TS1_IDX_+hex_str($92)]         = _TSRC_FIELD1; // Dungeon
dm_terrain[?_dk+_TS1_IDX_+hex_str($93)]         = _TSRC_SWAMP1; // Dungeon
dm_terrain[?_dk+_TS1_IDX_+hex_str($94)]         = _TSRC_WATER_SHALLOW1; // Dungeon
dm_terrain[?_dk+_TS1_IDX_+hex_str($95)]         = _TSRC_VOLCANO1; // Dungeon
dm_terrain[?_dk+_TS1_IDX_+hex_str($98)]         = _TSRC_PATH3; // Dungeon
dm_terrain[?_dk+_TS1_IDX_+hex_str($99)]         = _TSRC_PATH3; // Dungeon
dm_terrain[?_dk+_TS1_IDX_+hex_str($E0)]         = _TSRC_PATH1; // Dungeon

dm_terrain[?_dk+_TS1_IDX_+hex_str($A0)]         = _TSRC_PATH2; // Castle
dm_terrain[?_dk+_TS1_IDX_+hex_str($A1)]         = _TSRC_DESERT1; // Castle
dm_terrain[?_dk+_TS1_IDX_+hex_str($A2)]         = _TSRC_FIELD1; // Castle
dm_terrain[?_dk+_TS1_IDX_+hex_str($A3)]         = _TSRC_SWAMP1; // Castle
dm_terrain[?_dk+_TS1_IDX_+hex_str($A4)]         = _TSRC_WATER_SHALLOW1; // Castle
dm_terrain[?_dk+_TS1_IDX_+hex_str($A5)]         = _TSRC_VOLCANO1; // Castle
dm_terrain[?_dk+_TS1_IDX_+hex_str($E1)]         = _TSRC_PATH1; // Castle




            _dk = STR_TSRC+"_16x16_to_8x8_"+"_Layer2";
dm_terrain[?_dk+_TS1_IDX_+hex_str($90)]         = _TSRC_DUNGEON1; // Dungeon
dm_terrain[?_dk+_TS1_IDX_+hex_str($91)]         = _TSRC_DUNGEON1; // Dungeon
dm_terrain[?_dk+_TS1_IDX_+hex_str($92)]         = _TSRC_DUNGEON1; // Dungeon
dm_terrain[?_dk+_TS1_IDX_+hex_str($93)]         = _TSRC_DUNGEON1; // Dungeon
dm_terrain[?_dk+_TS1_IDX_+hex_str($94)]         = _TSRC_DUNGEON1; // Dungeon
dm_terrain[?_dk+_TS1_IDX_+hex_str($95)]         = _TSRC_DUNGEON1; // Dungeon
dm_terrain[?_dk+_TS1_IDX_+hex_str($98)]         = _TSRC_DUNGEON1; // Dungeon
dm_terrain[?_dk+_TS1_IDX_+hex_str($99)]         = _TSRC_DUNGEON1; // Dungeon
dm_terrain[?_dk+_TS1_IDX_+hex_str($E0)]         = _TSRC_DUNGEON1; // Dungeon

dm_terrain[?_dk+_TS1_IDX_+hex_str($A0)]         = _TSRC_CASTLE1; // Castle
dm_terrain[?_dk+_TS1_IDX_+hex_str($A1)]         = _TSRC_CASTLE1; // Castle
dm_terrain[?_dk+_TS1_IDX_+hex_str($A2)]         = _TSRC_CASTLE1; // Castle
dm_terrain[?_dk+_TS1_IDX_+hex_str($A3)]         = _TSRC_CASTLE1; // Castle
dm_terrain[?_dk+_TS1_IDX_+hex_str($A4)]         = _TSRC_CASTLE1; // Castle
dm_terrain[?_dk+_TS1_IDX_+hex_str($A5)]         = _TSRC_CASTLE1; // Castle
dm_terrain[?_dk+_TS1_IDX_+hex_str($E1)]         = _TSRC_CASTLE1; // Castle

dm_terrain[?_dk+_TS1_IDX_+hex_str($70)]         = _TSRC_TOWN2; // Town
dm_terrain[?_dk+_TS1_IDX_+hex_str($71)]         = _TSRC_TOWN1; // Town
dm_terrain[?_dk+_TS1_IDX_+hex_str($72)]         = _TSRC_TOWN3; // Town
dm_terrain[?_dk+_TS1_IDX_+hex_str($73)]         = _TSRC_TOWN2; // Town
dm_terrain[?_dk+_TS1_IDX_+hex_str($E8)]         = _TSRC_TOWN2; // Town
dm_terrain[?_dk+_TS1_IDX_+hex_str($E9)]         = _TSRC_TOWN2; // Town
dm_terrain[?_dk+_TS1_IDX_+hex_str($EA)]         = _TSRC_TOWN2; // Town
dm_terrain[?_dk+_TS1_IDX_+hex_str($EB)]         = _TSRC_TOWN2; // Town

dm_terrain[?_dk+_TS1_IDX_+hex_str($78)]         = _TSRC_HOUSE1; // House
dm_terrain[?_dk+_TS1_IDX_+hex_str($EC)]         = _TSRC_HOUSE1; // House
dm_terrain[?_dk+_TS1_IDX_+hex_str($ED)]         = _TSRC_HOUSE1; // House
dm_terrain[?_dk+_TS1_IDX_+hex_str($EE)]         = _TSRC_HOUSE1; // House
dm_terrain[?_dk+_TS1_IDX_+hex_str($EF)]         = _TSRC_HOUSE1; // House

dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL01+0)] = _TSRC_BOULDER1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL01+1)] = _TSRC_BOULDER1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL01+2)] = _TSRC_BOULDER1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL01+3)] = _TSRC_BOULDER1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL01+4)] = _TSRC_BOULDER1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL01+5)] = _TSRC_BOULDER1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL01+6)] = _TSRC_BOULDER1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL01+7)] = _TSRC_BOULDER1; // Boulder
/*
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL01)]   = _TSRC_BOULDER1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL02)]   = _TSRC_BOULDER1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL02+1)] = _TSRC_BOULDER1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL02+2)] = _TSRC_BOULDER1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL02+3)] = _TSRC_BOULDER1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL02+4)] = _TSRC_BOULDER1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL02+5)] = _TSRC_BOULDER1; // Boulder
dm_terrain[?_dk+_TS1_IDX_+hex_str(TSRC_BOUL02+6)] = _TSRC_BOULDER1; // Boulder
*/

dm_terrain[?_dk+_TS2_IDX_+hex_str($F8)]         = _TSRC_MONSTER1; // River Devil
dm_terrain[?_dk+_TS2_IDX_+hex_str($F9)]         = _TSRC_MONSTER1; // River Devil
//dm_terrain[?_dk+_TS1_IDX_+hex_str($D8)]         = _TSRC_MONSTER1; // River Devil
//dm_terrain[?_dk+_TS1_IDX_+hex_str($D9)]         = _TSRC_MONSTER1; // River Devil








MenuMap_srf = 0;




if (DEV)
{
    show_debug_message("PauseMenu_Create() END. "+string(current_time-_START_TIME));
    show_debug_message("");
}




