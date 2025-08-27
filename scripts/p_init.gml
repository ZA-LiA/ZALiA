/// p_init()

show_debug_message("p_init()");


var _i,_j,_k,_m, _a,_b,_c, _idx,_idx1,_idx2, _num, _count,_count1,_count2;
var _val,_val1,_val2,_val3,_val4;
var _type,_type_, _current_type_;
var _clm,_row, _clm0,_row0, _clms,_rows;
var _str, _len, _pos;
var _pi,_palette_index, _pal1,_pal2,_pal3,_pal4,_pal5,_pal6,_pal7,_pal8, _palette;
var _dk,_datakey,_datakey1,_datakey2,_datakey3,_datakey4,_datakey5;
var _adj = 0;
var _color,_color1,_color2,_color3, _brightness;
var _base_color_char, _c_wht, _c_red, _c_blu, _c_grn, _c_ylw, _c_mgn, _c_blk, _c_cyn;
var _base_color_order = "";
var _file, _file_name, _data;
// ci: Color Index
var _ci1="";
var _ci2="";
var _ci3="";
var _ci4="";

var _dl = ds_list_create();
dm = ds_map_create();
dm_pal_data = ds_map_create();
dl_PAL_POS = ds_list_create();
dm_scene_palette = ds_map_create();
dl_various_pals1 = ds_list_create();
dl_various_pals2 = ds_list_create();
dl_BASE_COLORS = ds_list_create();




depth = DEPTH_p;


// 7 colors means 5040 permutations per palette
// 6 colors means  720 permutations per palette
// 5 colors means  120 permutations per palette
// 4 colors means   24 permutations per palette
//                          // 
//                          // 
C_WHT0  = $FFFFFF; // B-255,G-255,R-255.   full white
C_WHT0_ = color_str(C_WHT0);
ds_list_add(dl_BASE_COLORS, C_WHT0);
_base_color_order += "W";
//                          // 
C_RED0  = $0000FF; // B-000,G-000,R-255.   full red
C_RED0_ = color_str(C_RED0);
ds_list_add(dl_BASE_COLORS, C_RED0);
_base_color_order += "R";
//                          // 
C_BLU0  = $FF0000; // B-255,G-000,R-000.   full blue
C_BLU0_ = color_str(C_BLU0);
ds_list_add(dl_BASE_COLORS, C_BLU0);
_base_color_order += "B";
//                          // 
C_GRN0  = $00FF00; // B-000,G-255,R-000.   full green
C_GRN0_ = color_str(C_GRN0);
ds_list_add(dl_BASE_COLORS, C_GRN0);
_base_color_order += "G";
//                          // 
C_YLW0  = $00FFFF; // B-000,G-255,R-255.   full yellow
C_YLW0_ = color_str(C_YLW0);
ds_list_add(dl_BASE_COLORS, C_YLW0);
_base_color_order += "Y";
//                          // 
C_MGN0  = $FF00FF; // B-255,G-000,R-255.   full magenta
C_MGN0_ = color_str(C_MGN0);
ds_list_add(dl_BASE_COLORS, C_MGN0);
_base_color_order += "M";
//                          // 
C_BLK0  = $000000; // B-000,G-000,R-000.   full black
C_BLK0_ = color_str(C_BLK0);
ds_list_add(dl_BASE_COLORS, C_BLK0);
_base_color_order += "K";
//                          // 
C_CYN0  = $FFFF00; // B-255,G-255,R-000.   full cyan
C_CYN0_ = color_str(C_CYN0);
ds_list_add(dl_BASE_COLORS, C_CYN0);
_base_color_order += "C";
//                          // 
C_ERR0  = C_YLW0; // Error, Missing data, ..
//                          // 
//     C_ALPHA0: The color that color swap will draw transparent(alpha=0)
global.C_ALPHA0 = $7F7F7F; // B-127,G-127,R-127.   mid grey
//global.C_ALPHA0_B_ = ((global.C_ALPHA0>>$10)&$FF)/$FF; // for shd_pal_swapper
//global.C_ALPHA0_G_ = ((global.C_ALPHA0>>$08)&$FF)/$FF; // for shd_pal_swapper
//global.C_ALPHA0_R_ = ((global.C_ALPHA0>>$00)&$FF)/$FF; // for shd_pal_swapper
//                          // 
//                          // 
//                          // 
//                          // 
C_BLK1 = $010101; // Closest to $000000 so that pal swap doesn't consider it the base color $000000
//C_BLK1 = $000000; // NES black
//                          // 
C_WHT1 = $FCFCFC; // $30. White 1. Brightest NES white.
C_WHT2 = $F1F2F1; // $20. White 2. SLIGHTLY grey. SLIGHTLY less bright than white 1
//                          // 
C_GRY1 = $BCBCBC; // Grey 1. $10. Brightest grey
C_GRY2 = $A7A9A7; // Grey 2. $3D. 2nd Brightest grey
C_GRY3 = $747474; // Grey 3. $00. Mid grey. 3rd brightest grey. 2nd darkest grey.
C_GRY4 = $3E3E3E; // Grey 4. $2D. Darkest grey
//                          // 
C_BLU1 = $FCE4A8; // $31 Blue. Brightest
C_BLU2 = $FCBC3C; // $21 Blue. Field Encounter sky
C_BLU3 = $EC7000; // $11 Blue. Town sky
C_BLU4 = $A80000; // $02 Blue. Old Kasuto sky
//                          // 
C_VLT1 = $FCD4C4; // $32 Violet.      Brightest
C_VLT2 = $FC945C; // $22 Violet/Blue. Mid-Bright
C_VLT3 = $EC3820; // $12 Violet/Blue. Mid-Dark
C_VLT4 = $8C1824; // $01 Violet.      Darkest
//                          // 
C_PUR1 = $F1BADC; // $33 Purple. 
C_PUR2 = $FC88CC; // $23 Purple. 
C_PUR3 = $F00080; // $13 Purple. Cemetery sky
C_PUR4 = $9C0044; // $03 Purple. 
//                          // 
C_MGN1 = $FCC4FC; // $34 Magenta. 
C_MGN2 = $FC78F4; // $24 Magenta. 
C_MGN3 = $AD15B8; // $14 Magenta. ShadowLink bg
C_MGN4 = $74008C; // $04 Magenta. 
//                          // 
C_PNK1 = $DCB6F1; // $35 Pink. Brightest
C_PNK2 = $B474FC; // $25 Pink. 
C_PNK3 = $5800E4; // $15 Pink. 
C_PNK4 = $1000A8; // $05 Pink. Darkest
//                          // 
C_RED1 = $B0BCFC; // $36 Red. Brightest
C_RED2 = $6074FC; // $26 Red. 
C_RED3 = $0028D8; // $16 Red. orange mob red
C_RED4 = $0000A4; // $06 Red. Darkest
//                          // 
C_ORG1 = $A8D8FC; // $37 orange. Brightest
C_ORG2 = $3898FC; // $27 orange mob orange
C_ORG3 = $0C4CC8; // $17 orange. 2nd darkest
C_ORG4 = $00087C; // $07 orange. 
//                          // 
C_YLW1 = $7DDAD4; // $38 Yellow. 
C_YLW2 = $3CBCF0; // $28 Yellow. Map paper.
C_YLW3 = $007088; // $18 Yellow. 
C_YLW4 = $002C40; // $08 Yellow. 
//                          // 
C_YGR1 = $A0FCE0; // $39 Yellow/Green. Brightest
C_YGR2 = $10D080; // $29 Yellow/Green. 
C_YGR3 = $009400; // $19 Yellow/Green. 
C_YGR4 = $004400; // $09 Yellow/Green. 
//                          // 
C_GRN1 = $96E8AF; // $3A Green. 
C_GRN2 = $48DC4C; // $2A Green. Link green
C_GRN3 = $00A800; // $1A Green. 
C_GRN4 = $005000; // $0A Green. 
//                          // 
C_GRB1 = $BCE89E; // $3B Green-Blue.
C_GRB2 = $70D43A; // $2B Green-Blue.
C_GRB3 = $2A7B00; // $1B Green-Blue.
C_GRB4 = $003E00; // $0B Green-Blue.
//                          // 
C_CYN1 = $F0FC9C; // $3C Teal. Brightest.
C_CYN2 = $D8E800; // $2C Teal. 
C_CYN3 = $888000; // $1C Teal. 
C_CYN4 = $5C3C18; // $0C Teal. Darkest.
//                          // 
//                          // 
/*
// Color Tone Highlight, Midtone, Shadow
C_TONE_HGH = C_WHT0; // Highlight
C_TONE_MID = C_RED0; // Midtone
C_TONE_LOW = C_BLU0; // Shadow
*/




// palette_image_IS_SURFACE ---------------------------------
// 2024/06/26: Had a lot of trouble getting this working. 
// Palette swap would fail at random times during the 
// ShadowBoss fight or the cutscene after.
// After more work, I seem to have got it working fine during 
// those times but needs to be tested much more.
// 2024/06/27: When scaling the game window, there's about 
// 1 frame the pal swap doesn't work so I switched back 
// to using a sprite for palette_image.
// You can set it to false for the stable legacy method that 
// uses a sprite instead of a surface.
global.palette_image_IS_SURFACE = false;
global.palette_image = -1;

// WRBGYMKC. W: WHITE, R: RED, B: BLUE, G: GREEN, Y: YELLOW, M: MAGENTA, K: BLACK, C: CYAN
global.PAL_BASE_COLOR_ORDER = _base_color_order; // "WRBGYMKC"
global.COLORS_PER_PALETTE   = string_length(global.PAL_BASE_COLOR_ORDER);
global.PAL_CHAR_PER_COLOR   = 6; // full color hex
global.PAL_CHAR_PER_PAL     = global.COLORS_PER_PALETTE * global.PAL_CHAR_PER_COLOR;




global.dm_pi = ds_map_create();
_datakey1 = STR_Palette+STR_Index;
_palette_index = -1;




_datakey = "BASE";
global.dm_pi[?_datakey+_datakey1] = ++_palette_index;
global.PI_BASE = _palette_index;




_datakey = "GUI";
global.dm_pi[?_datakey+STR_Count] = val(global.dm_pi[?_datakey+STR_Count])+1;
global.dm_pi[?_datakey+      string(val(global.dm_pi[?_datakey+STR_Count]))+_datakey1] = ++_palette_index;
global.PI_GUI1 = val(global.dm_pi[?_datakey+"1"+_datakey1], -1);

global.dm_pi[?_datakey+STR_Count] = val(global.dm_pi[?_datakey+STR_Count])+1;
global.dm_pi[?_datakey+      string(val(global.dm_pi[?_datakey+STR_Count]))+_datakey1] = ++_palette_index;
global.PI_GUI2 = val(global.dm_pi[?_datakey+"2"+_datakey1], -1);

global.dm_pi[?_datakey+STR_Count] = val(global.dm_pi[?_datakey+STR_Count])+1;
global.dm_pi[?_datakey+      string(val(global.dm_pi[?_datakey+STR_Count]))+_datakey1] = ++_palette_index;
global.PI_GUI3 = val(global.dm_pi[?_datakey+"3"+_datakey1], -1);

global.dm_pi[?_datakey+STR_Count] = val(global.dm_pi[?_datakey+STR_Count])+1;
global.dm_pi[?_datakey+      string(val(global.dm_pi[?_datakey+STR_Count]))+_datakey1] = ++_palette_index;
global.PI_GUI4 = val(global.dm_pi[?_datakey+"4"+_datakey1], -1);





_datakey = "PC";
global.dm_pi[?_datakey+STR_Count] = val(global.dm_pi[?_datakey+STR_Count])+1;
global.dm_pi[?_datakey+      string(val(global.dm_pi[?_datakey+STR_Count]))+_datakey1] = ++_palette_index;
global.PI_PC1 = val(global.dm_pi[?_datakey+"1"+_datakey1], -1);

global.dm_pi[?_datakey+STR_Count] = val(global.dm_pi[?_datakey+STR_Count])+1;
global.dm_pi[?_datakey+      string(val(global.dm_pi[?_datakey+STR_Count]))+_datakey1] = ++_palette_index;
global.PI_PC2 = val(global.dm_pi[?_datakey+"2"+_datakey1], -1);

global.dm_pi[?_datakey+STR_Count] = val(global.dm_pi[?_datakey+STR_Count])+1;
global.dm_pi[?_datakey+      string(val(global.dm_pi[?_datakey+STR_Count]))+_datakey1] = ++_palette_index;
global.PI_PC3 = val(global.dm_pi[?_datakey+"3"+_datakey1], -1);




_datakey = "DISGUISE_PC";
global.dm_pi[?_datakey+_datakey1] = ++_palette_index;
global.PI_DISGUISE_PC = val(global.dm_pi[?_datakey+_datakey1], -1);




_datakey = "SPELL_PC";
global.dm_pi[?_datakey+STR_Count] = val(global.dm_pi[?_datakey+STR_Count])+1;
global.dm_pi[?_datakey+      string(val(global.dm_pi[?_datakey+STR_Count]))+_datakey1] = ++_palette_index;
global.PI_SPELL_PC1 = val(global.dm_pi[?_datakey+"1"+_datakey1], -1);

global.dm_pi[?_datakey+STR_Count] = val(global.dm_pi[?_datakey+STR_Count])+1;
global.dm_pi[?_datakey+      string(val(global.dm_pi[?_datakey+STR_Count]))+_datakey1] = ++_palette_index;
global.PI_SPELL_PC2 = val(global.dm_pi[?_datakey+"2"+_datakey1], -1);

global.dm_pi[?_datakey+STR_Count] = val(global.dm_pi[?_datakey+STR_Count])+1;
global.dm_pi[?_datakey+      string(val(global.dm_pi[?_datakey+STR_Count]))+_datakey1] = ++_palette_index;
global.PI_SPELL_PC3 = val(global.dm_pi[?_datakey+"3"+_datakey1], -1);




_datakey = "CUCCO";
global.dm_pi[?_datakey+STR_Count] = val(global.dm_pi[?_datakey+STR_Count])+1;
global.dm_pi[?_datakey+      string(val(global.dm_pi[?_datakey+STR_Count]))+_datakey1] = ++_palette_index;
global.PI_CUCCO1 = val(global.dm_pi[?_datakey+"1"+_datakey1], -1);

global.dm_pi[?_datakey+STR_Count] = val(global.dm_pi[?_datakey+STR_Count])+1;
global.dm_pi[?_datakey+      string(val(global.dm_pi[?_datakey+STR_Count]))+_datakey1] = ++_palette_index;
global.PI_CUCCO2 = val(global.dm_pi[?_datakey+"2"+_datakey1], -1);

global.dm_pi[?_datakey+STR_Count] = val(global.dm_pi[?_datakey+STR_Count])+1;
global.dm_pi[?_datakey+      string(val(global.dm_pi[?_datakey+STR_Count]))+_datakey1] = ++_palette_index;
global.PI_CUCCO3 = val(global.dm_pi[?_datakey+"3"+_datakey1], -1);




_datakey = "DISGUISE_CUCCO";
global.dm_pi[?_datakey+_datakey1] = ++_palette_index;
global.PI_DISGUISE_CUCCO = val(global.dm_pi[?_datakey+_datakey1], -1);



/*
if (global.PAL_SYS_VER<4)
{
    _datakey = "SPELL_CUCCO";
    global.dm_pi[?_datakey+STR_Count] = val(global.dm_pi[?_datakey+STR_Count])+1;
    global.dm_pi[?_datakey+      string(val(global.dm_pi[?_datakey+STR_Count]))+_datakey1] = ++_palette_index;
    global.PI_SPELL_CUCCO1 = val(global.dm_pi[?_datakey+"1"+_datakey1], -1);
    
    global.dm_pi[?_datakey+STR_Count] = val(global.dm_pi[?_datakey+STR_Count])+1;
    global.dm_pi[?_datakey+      string(val(global.dm_pi[?_datakey+STR_Count]))+_datakey1] = ++_palette_index;
    global.PI_SPELL_CUCCO2 = val(global.dm_pi[?_datakey+"2"+_datakey1], -1);
    
    global.dm_pi[?_datakey+STR_Count] = val(global.dm_pi[?_datakey+STR_Count])+1;
    global.dm_pi[?_datakey+      string(val(global.dm_pi[?_datakey+STR_Count]))+_datakey1] = ++_palette_index;
    global.PI_SPELL_CUCCO3 = val(global.dm_pi[?_datakey+"3"+_datakey1], -1);
}
*/



_datakey = "BGR";
global.dm_pi[?_datakey+STR_Count] = val(global.dm_pi[?_datakey+STR_Count])+1;
global.dm_pi[?_datakey+      string(val(global.dm_pi[?_datakey+STR_Count]))+_datakey1] = ++_palette_index;
global.PI_BGR1 = val(global.dm_pi[?_datakey+"1"+_datakey1], -1);

global.dm_pi[?_datakey+STR_Count] = val(global.dm_pi[?_datakey+STR_Count])+1;
global.dm_pi[?_datakey+      string(val(global.dm_pi[?_datakey+STR_Count]))+_datakey1] = ++_palette_index;
global.PI_BGR2 = val(global.dm_pi[?_datakey+"2"+_datakey1], -1);

global.dm_pi[?_datakey+STR_Count] = val(global.dm_pi[?_datakey+STR_Count])+1;
global.dm_pi[?_datakey+      string(val(global.dm_pi[?_datakey+STR_Count]))+_datakey1] = ++_palette_index;
global.PI_BGR3 = val(global.dm_pi[?_datakey+"3"+_datakey1], -1);

global.dm_pi[?_datakey+STR_Count] = val(global.dm_pi[?_datakey+STR_Count])+1;
global.dm_pi[?_datakey+      string(val(global.dm_pi[?_datakey+STR_Count]))+_datakey1] = ++_palette_index;
global.PI_BGR4 = val(global.dm_pi[?_datakey+"4"+_datakey1], -1);

//global.dm_pi[?_datakey+STR_Count] = val(global.dm_pi[?_datakey+STR_Count])+1;
//global.dm_pi[?_datakey+      string(val(global.dm_pi[?_datakey+STR_Count]))+_datakey1] = ++_palette_index;
global.PI_BGR5 = val(global.dm_pi[?_datakey+"5"+_datakey1], -1);




global.dm_pi[?"MOB"+STR_Count] = val(global.dm_pi[?"MOB"+STR_Count])+1;
global.dm_pi[?"MOB_ORG"+_datakey1] = ++_palette_index;
global.PI_MOB_ORG = val(global.dm_pi[?"MOB_ORG"+_datakey1], -1);

global.dm_pi[?"MOB"+STR_Count] = val(global.dm_pi[?"MOB"+STR_Count])+1;
global.dm_pi[?"MOB_RED"+_datakey1] = ++_palette_index;
global.PI_MOB_RED = val(global.dm_pi[?"MOB_RED"+_datakey1], -1);

global.dm_pi[?"MOB"+STR_Count] = val(global.dm_pi[?"MOB"+STR_Count])+1;
global.dm_pi[?"MOB_BLU"+_datakey1] = ++_palette_index;
global.PI_MOB_BLU = val(global.dm_pi[?"MOB_BLU"+_datakey1], -1);

global.dm_pi[?"MOB"+STR_Count] = val(global.dm_pi[?"MOB"+STR_Count])+1;
global.dm_pi[?"MOB_PUR"+_datakey1] = ++_palette_index;
global.PI_MOB_PUR = val(global.dm_pi[?"MOB_PUR"+_datakey1], -1);

//global.dm_pi[?"MOB"+STR_Count] = val(global.dm_pi[?"MOB"+STR_Count])+1;
//global.dm_pi[?"MOB_A"+_datakey1] = ++_palette_index;
global.PI_MOB_A = val(global.dm_pi[?"MOB_A"+_datakey1], -1);




// SET: there's a set for a room lit(normal), and dark version of the lit set
PAL_PER_SET = _palette_index+1;




global.PI_DARKLONK  = global.PI_GUI2;
global.PI_CLOUD_1   = global.PI_BGR4;
//_count1 = val(global.dm_pi[?"PC"+STR_Count]) + val(global.dm_pi[?"SPELL_PC"+STR_Count]);
//global.PI_PC_SWORD  = global.PI_MOB_PUR + 2 + (_count1<<1) + 1; // (PI_MOB_PUR + 2 + (PC_PAL_COUNT<<1) + 1)




// SET: there's a set for a room lit(normal), and dark version of the lit set
PAL_SETS_PER_SCENE = 2; // scene lit set, scene dark set
PAL_PER_SCENE = PAL_PER_SET * PAL_SETS_PER_SCENE;

COL_PER_SET   = PAL_PER_SET   * global.COLORS_PER_PALETTE;
COL_PER_SCENE = PAL_PER_SCENE * global.COLORS_PER_PALETTE;
global.PAL_CHAR_PER_SET   = COL_PER_SET   * global.PAL_CHAR_PER_COLOR;
global.PAL_CHAR_PER_SCENE = COL_PER_SCENE * global.PAL_CHAR_PER_COLOR;

// PI: Palette Index
SET_IDX_LIT = 0;
SET_IDX_DRK = 1;
PI_LAST_LIT = ((SET_IDX_LIT+1)    * PAL_PER_SET) - 1;
PI_LAST_DRK = ((SET_IDX_DRK+1)    * PAL_PER_SET) - 1;
PI_LAST     = (PAL_SETS_PER_SCENE * PAL_PER_SET) - 1;

PI_PERMUT_BASE = PI_LAST + 1;

PI_LIT1 = SET_IDX_LIT * PAL_PER_SET; // 
PI_DRK1 = SET_IDX_DRK * PAL_PER_SET; // 

PI_ERR0 = global.PI_BASE;




global.palette_image_W = PAL_PER_SCENE;
global.palette_image_H = global.COLORS_PER_PALETTE;
global.palette_image_w = global.palette_image_W;
global.palette_image_h = global.palette_image_H;




for(_i=0; _i<PAL_PER_SET; _i++)
{
    global.dm_pi[?hex_str(_i)+STR_Dark+"1"] = PI_DRK1 + _i;
}




var _dk_Palette_Position = STR_Palette+STR_Position;
for(_i=0; _i<PAL_PER_SCENE; _i++)
{
    _val = get_pal_pos(_i+1);
    ds_list_add(dl_PAL_POS, _val);
    dm_pal_data[?hex_str(_i+1)+_dk_Palette_Position] = _val;
}





g.dm_ITEM[?hex_str(ITM_MAP1)  +STR_pal_idx] = global.PI_MOB_ORG;
g.dm_ITEM[?hex_str(ITM_MAP2)  +STR_pal_idx] = global.PI_MOB_ORG;
g.dm_ITEM[?hex_str(ITM_BTL1)  +STR_pal_idx] = global.PI_MOB_RED;
g.dm_ITEM[?hex_str(ITEM_SPELL)+STR_pal_idx] = global.PI_MOB_ORG;
if (g.mod_MedicinePlantItem)
{   // flower
    g.dm_ITEM[?hex_str(ITM_MEDI)+STR_pal_idx]= global.PI_MOB_ORG;
}
else
{   // bubbling bottle
    g.dm_ITEM[?hex_str(ITM_MEDI)+STR_pal_idx]= global.PI_MOB_BLU;
}







dl_COLOR = ds_list_create();
repeat($100) ds_list_add(dl_COLOR, C_ERR0);
                                //                                          // 
// $00-0F                       //                                          // 
            _a=-1;              //                                          // 
dl_COLOR[|++_a] = C_GRY3; // Luminosity/Brightness $74/$74.  Grey 3. Mid grey. 3rd brightest grey. 2nd darkest grey.
dl_COLOR[|++_a] = C_VLT4; // Luminosity/Brightness $8C/$23.  Violet.      Darkest 
dl_COLOR[|++_a] = C_BLU4; // Luminosity/Brightness $A8/$0C.  Blue.        Darkest 
dl_COLOR[|++_a] = C_PUR4; // Luminosity/Brightness $9C/$1A.  Purple.      Darkest 
dl_COLOR[|++_a] = C_MGN4; // Luminosity/Brightness $8C/$26.  Magenta.     Darkest 
dl_COLOR[|++_a] = C_PNK4; // Luminosity/Brightness $A8/$25.  Pink.        Darkest 
dl_COLOR[|++_a] = C_RED4; // Luminosity/Brightness $A4/$23.  Red.         Darkest 
dl_COLOR[|++_a] = C_ORG4; // Luminosity/Brightness $7C/$20.  Orange.      Darkest 
                                //                                          // 
dl_COLOR[|++_a] = C_YLW4; // Luminosity/Brightness $40/$2D.  Yellow.      Darkest 
dl_COLOR[|++_a] = C_YGR4; // Luminosity/Brightness $44/$31.  Yellow-Green. Darkest 
dl_COLOR[|++_a] = C_GRN4; // Luminosity/Brightness $50/$39.  Green.       Darkest 
dl_COLOR[|++_a] = C_GRB4; // Luminosity/Brightness $3E/$2C.  Green-Blue.  Darkest 
dl_COLOR[|++_a] = C_CYN4; // Luminosity/Brightness $5C/$37.  Teal.        Darkest 
dl_COLOR[|++_a] = C_BLK1; // $010101. closest thing to full black
//dl_COLOR[|++_a] = C_BLK1; // Luminosity/Brightness $00/$00.  B-000,G-000,R-000.   full black
//dl_COLOR[|++_a] = C_WHT0; // Luminosity/Brightness $.  B-255,G-255,R-255.   full white
//dl_COLOR[|++_a] = C_BLK0; // Luminosity/Brightness $.  B-000,G-000,R-000.   full black
                                //                                          // 
                                //                                          // 
// $10-1F                       //                                          // 
            _a = (_a&$F0)+$0F;  //                                         // 
dl_COLOR[|++_a] = C_GRY1; // Luminosity/Brightness $BC/$BC.  Grey 1. Brightest grey
dl_COLOR[|++_a] = C_BLU3; // Luminosity/Brightness $EC/$61.  Blue. 
dl_COLOR[|++_a] = C_VLT3; // Luminosity/Brightness $EC/$40.  Violet. 
dl_COLOR[|++_a] = C_PUR3; // Luminosity/Brightness $F0/$2D.  Purple. 
dl_COLOR[|++_a] = C_MGN3; // Luminosity/Brightness $B8/$43.  Magenta. 
dl_COLOR[|++_a] = C_PNK3; // Luminosity/Brightness $E4/$37.  Pink. Mid-Dark
dl_COLOR[|++_a] = C_RED3; // Luminosity/Brightness $D8/$4B.  Red. 
dl_COLOR[|++_a] = C_ORG3; // Luminosity/Brightness $C8/$62.  Orange.  
                                //                                          // 
dl_COLOR[|++_a] = C_YLW3; // Luminosity/Brightness $88/$6D.  Yellow. 
dl_COLOR[|++_a] = C_YGR3; // Luminosity/Brightness $94/$6A.  Yellow-Green. 
dl_COLOR[|++_a] = C_GRN3; // Luminosity/Brightness $A8/$78.  Green. 
dl_COLOR[|++_a] = C_GRB3; // Luminosity/Brightness $7B/$5B.  Green-Blue. 
dl_COLOR[|++_a] = C_CYN3; // Luminosity/Brightness $88/$65.  Teal
dl_COLOR[|++_a] = C_BLK1; // $010101. closest thing to full black
//dl_COLOR[|++_a] = C_BLK1; // Luminosity/Brightness $00/$00.  
// dl_COLOR[|++_a] = C_BLU0; // Luminosity/Brightness $.  B-255,G-000,R-000.   full blue
// dl_COLOR[|++_a] = C_BLK0; // Luminosity/Brightness $.  B-000,G-000,R-000.   full black
                                //                                          // 
                                //                                          // 
// $20-2F                       //                                          // 
            _a = (_a&$F0)+$0F;  //                                         // 
dl_COLOR[|++_a] = C_WHT2; // Luminosity/Brightness $F2/$F2.  White 2. SLIGHTLY grey. SLIGHTLY less bright than white 1
dl_COLOR[|++_a] = C_BLU2; // Luminosity/Brightness $FC/$A5.  Blue. 
dl_COLOR[|++_a] = C_VLT2; // Luminosity/Brightness $FC/$90.  Violet. 
dl_COLOR[|++_a] = C_PUR2; // Luminosity/Brightness $FC/$9F.  Purple. 
dl_COLOR[|++_a] = C_MGN2; // Luminosity/Brightness $FC/$9C.  Magenta. 
dl_COLOR[|++_a] = C_PNK2; // Luminosity/Brightness $FC/$96.  Pink. Mid-Bright
dl_COLOR[|++_a] = C_RED2; // Luminosity/Brightness $FC/$8F.  Red. 
dl_COLOR[|++_a] = C_ORG2; // Luminosity/Brightness $FC/$A6.  Orange. mob orange.
                                //                                          // 
dl_COLOR[|++_a] = C_YLW2; // Luminosity/Brightness $F0/$BE.  Yellow. Map paper.
dl_COLOR[|++_a] = C_YGR2; // Luminosity/Brightness $D0/$B1.  Yellow/Green. 
dl_COLOR[|++_a] = C_GRN2; // Luminosity/Brightness $DC/$B3.  Green. 
dl_COLOR[|++_a] = C_GRB2; // Luminosity/Brightness $D4/$AC.  Green-Blue. 
dl_COLOR[|++_a] = C_CYN2; // Luminosity/Brightness $E8/$B6.  Teal
dl_COLOR[|++_a] = C_GRY4; // Luminosity/Brightness $3E/$3E.  Grey 4. Darkest grey.
// dl_COLOR[|++_a] = C_RED0; // Luminosity/Brightness $.  B-000,G-000,R-255.   full red
// dl_COLOR[|++_a] = C_BLK0; // Luminosity/Brightness $.  B-000,G-000,R-000.   full black
                                //                                          // 
                                //                                          // 
// $30-3F                       //                                          // 
            _a = (_a&$F0)+$0F;  //                                         // 
dl_COLOR[|++_a] = C_WHT1; // Luminosity/Brightness $FC/$FC.  White 1. Brightest NES white.
dl_COLOR[|++_a] = C_BLU1; // Luminosity/Brightness $FC/$D9.  Blue. Brightest
dl_COLOR[|++_a] = C_VLT1; // Luminosity/Brightness $FC/$D3.  Violet. Brightest
dl_COLOR[|++_a] = C_PUR1; // Luminosity/Brightness $F1/$C5.  Purple. 
dl_COLOR[|++_a] = C_MGN1; // Luminosity/Brightness $FC/$D4.  Magenta. 
dl_COLOR[|++_a] = C_PNK1; // Luminosity/Brightness $F1/$C5.  Pink.    Brightest
dl_COLOR[|++_a] = C_RED1; // Luminosity/Brightness $FC/$C9.  Red.     Brightest
dl_COLOR[|++_a] = C_ORG1; // Luminosity/Brightness $FC/$DC.  Orange.  Brightest
                                //                                          // 
dl_COLOR[|++_a] = C_YLW1; // Luminosity/Brightness $DA/$D2.  Yellow. 
dl_COLOR[|++_a] = C_YGR1; // Luminosity/Brightness $FC/$EF.  Yellow/Green. 
dl_COLOR[|++_a] = C_GRN1; // Luminosity/Brightness $E8/$D6.  Green. 
dl_COLOR[|++_a] = C_GRB1; // Luminosity/Brightness $E8/$D5.  Green-Blue. 
dl_COLOR[|++_a] = C_CYN1; // Luminosity/Brightness $FC/$E7.  Teal. 
dl_COLOR[|++_a] = C_GRY2; // Luminosity/Brightness $A9/$A8.  Grey 2. 2nd Brightest grey
// dl_COLOR[|++_a] = C_GRN0; // Luminosity/Brightness $.  B-000,G-255,R-000.   full green
// dl_COLOR[|++_a] = C_BLK0; // Luminosity/Brightness $.  B-000,G-000,R-000.   full black
                                //                                          // 
                                //                                          // 
// $F0-FF                       //
            _a=$F0;             //
dl_COLOR[|++_a] = C_BLK0; // B-000,G-000,R-000.   full black
dl_COLOR[|++_a] = C_WHT0; // B-255,G-255,R-255.   full white
dl_COLOR[|++_a] = C_RED0; // B-000,G-000,R-255.   full red
dl_COLOR[|++_a] = C_GRN0; // B-000,G-255,R-000.   full green
dl_COLOR[|++_a] = C_BLU0; // B-255,G-000,R-000.   full blue
dl_COLOR[|++_a] = C_MGN0; // B-255,G-000,R-255.   full magenta
dl_COLOR[|++_a] = C_CYN0; // B-000,G-255,R-255.   full cyan
dl_COLOR[|++_a] = C_YLW0; // B-255,G-255,R-000.   full yellow
                                // 
dl_COLOR[| $FF] = C_ERR0; // Error, Missing data, ..








// *** If the color grid changes, look for code near the bottom of `p_Draw_1()` to automate the following, but make sure `ts_SolidColor01` has been updated
            global.dl_COLOR01 = ds_list_create();
// ROW $00                                                              //
ds_list_add(global.dl_COLOR01,$2B2749); // Hue-$FA,  Sat-$77,  Bright-$2E
ds_list_add(global.dl_COLOR01,$1000A8); // Hue-$FB,  Sat-$FF,  Bright-$24
ds_list_add(global.dl_COLOR01,$5800E4); // Hue-$EF,  Sat-$FF,  Bright-$36
ds_list_add(global.dl_COLOR01,$B474FC); // Hue-$EB,  Sat-$8A,  Bright-$95
ds_list_add(global.dl_COLOR01,$DCB6F1); // Hue-$E4,  Sat-$3E,  Bright-$C5
ds_list_add(global.dl_COLOR01,$5D1C83); // Hue-$E4,  Sat-$C8,  Bright-$36
ds_list_add(global.dl_COLOR01,$5424C3); // Hue-$F2,  Sat-$D0,  Bright-$49
ds_list_add(global.dl_COLOR01,$784FF0); // Hue-$F4,  Sat-$AB,  Bright-$74
ds_list_add(global.dl_COLOR01,$8181F6); // Hue-$00,  Sat-$79,  Bright-$99
ds_list_add(global.dl_COLOR01,$90A7FC); // Hue-$09,  Sat-$6D,  Bright-$B7
// ROW $01                                                              //
ds_list_add(global.dl_COLOR01,$41184B); // Hue-$DD,  Sat-$AD,  Bright-$25
ds_list_add(global.dl_COLOR01,$74008C); // Hue-$DC,  Sat-$FF,  Bright-$26
ds_list_add(global.dl_COLOR01,$AD15B8); // Hue-$D7,  Sat-$E2,  Bright-$42
ds_list_add(global.dl_COLOR01,$FC78F4); // Hue-$D2,  Sat-$86,  Bright-$9B
ds_list_add(global.dl_COLOR01,$FCC4FC); // Hue-$D5,  Sat-$39,  Bright-$D3
ds_list_add(global.dl_COLOR01,$543C75); // Hue-$ED,  Sat-$7C,  Bright-$49
ds_list_add(global.dl_COLOR01,$6F4BA2); // Hue-$ED,  Sat-$89,  Bright-$60
ds_list_add(global.dl_COLOR01,$7F65CF); // Hue-$F5,  Sat-$83,  Bright-$7D
ds_list_add(global.dl_COLOR01,$9980ED); // Hue-$F5,  Sat-$75,  Bright-$98
ds_list_add(global.dl_COLOR01,$9DA5D6); // Hue-$06,  Sat-$44,  Bright-$AE
// ROW $02                                                              //
ds_list_add(global.dl_COLOR01,$501931); // Hue-$BD,  Sat-$AF,  Bright-$22
ds_list_add(global.dl_COLOR01,$9C0044); // Hue-$BD,  Sat-$FF,  Bright-$19
ds_list_add(global.dl_COLOR01,$F00080); // Hue-$C1,  Sat-$FF,  Bright-$2C
ds_list_add(global.dl_COLOR01,$FC88CC); // Hue-$C3,  Sat-$75,  Bright-$9E
ds_list_add(global.dl_COLOR01,$F1BADC); // Hue-$C4,  Sat-$3A,  Bright-$C5
ds_list_add(global.dl_COLOR01,$3F2945); // Hue-$DE,  Sat-$67,  Bright-$30
ds_list_add(global.dl_COLOR01,$753E6B); // Hue-$CD,  Sat-$78,  Bright-$4B
ds_list_add(global.dl_COLOR01,$A95E90); // Hue-$C6,  Sat-$71,  Bright-$6E
ds_list_add(global.dl_COLOR01,$F384A8); // Hue-$B8,  Sat-$74,  Bright-$93
ds_list_add(global.dl_COLOR01,$EDADEA); // Hue-$D3,  Sat-$45,  Bright-$BE
// ROW $03                                                              //
ds_list_add(global.dl_COLOR01,$501919); // Hue-$AA,  Sat-$AF,  Bright-$1C
ds_list_add(global.dl_COLOR01,$A80000); // Hue-$AA,  Sat-$FF,  Bright-$0C
ds_list_add(global.dl_COLOR01,$EC3820); // Hue-$A5,  Sat-$DC,  Bright-$3F
ds_list_add(global.dl_COLOR01,$FC945C); // Hue-$9B,  Sat-$A2,  Bright-$8F
ds_list_add(global.dl_COLOR01,$FCD4C4); // Hue-$9E,  Sat-$39,  Bright-$D3
ds_list_add(global.dl_COLOR01,$2F222E); // Hue-$D1,  Sat-$47,  Bright-$25
ds_list_add(global.dl_COLOR01,$46353E); // Hue-$C1,  Sat-$3E,  Bright-$38
ds_list_add(global.dl_COLOR01,$655562); // Hue-$CD,  Sat-$28,  Bright-$58
ds_list_add(global.dl_COLOR01,$6C6C96); // Hue-$00,  Sat-$47,  Bright-$74
ds_list_add(global.dl_COLOR01,$7A94AB); // Hue-$17,  Sat-$49,  Bright-$97
// ROW $04                                                              //
ds_list_add(global.dl_COLOR01,$4B2630); // Hue-$B5,  Sat-$7E,  Bright-$2A
ds_list_add(global.dl_COLOR01,$8C1824); // Hue-$AE,  Sat-$D3,  Bright-$22
ds_list_add(global.dl_COLOR01,$EC7000); // Hue-$96,  Sat-$FF,  Bright-$61
ds_list_add(global.dl_COLOR01,$FCBC3C); // Hue-$8E,  Sat-$C2,  Bright-$A5
ds_list_add(global.dl_COLOR01,$FCE4A8); // Hue-$8C,  Sat-$55,  Bright-$D8
ds_list_add(global.dl_COLOR01,$624F69); // Hue-$E0,  Sat-$3F,  Bright-$55
ds_list_add(global.dl_COLOR01,$8A707F); // Hue-$C3,  Sat-$30,  Bright-$75
ds_list_add(global.dl_COLOR01,$B2AB9B); // Hue-$8C,  Sat-$21,  Bright-$A8
ds_list_add(global.dl_COLOR01,$D0DCC7); // Hue-$67,  Sat-$18,  Bright-$D6
ds_list_add(global.dl_COLOR01,$DDE8DB); // Hue-$5C,  Sat-$0E,  Bright-$E4
// ROW $05                                                              //
ds_list_add(global.dl_COLOR01,$382A1A); // Hue-$93,  Sat-$89,  Bright-$27
ds_list_add(global.dl_COLOR01,$5C3C18); // Hue-$93,  Sat-$BC,  Bright-$36
ds_list_add(global.dl_COLOR01,$888000); // Hue-$82,  Sat-$FF,  Bright-$65
ds_list_add(global.dl_COLOR01,$D8E800); // Hue-$7D,  Sat-$FF,  Bright-$B5
ds_list_add(global.dl_COLOR01,$F0FC9C); // Hue-$7A,  Sat-$61,  Bright-$E6
ds_list_add(global.dl_COLOR01,$533332); // Hue-$A9,  Sat-$65,  Bright-$35
ds_list_add(global.dl_COLOR01,$774A48); // Hue-$A8,  Sat-$65,  Bright-$4C
ds_list_add(global.dl_COLOR01,$B4654D); // Hue-$A0,  Sat-$92,  Bright-$65
ds_list_add(global.dl_COLOR01,$E69B4D); // Hue-$94,  Sat-$AA,  Bright-$8F
ds_list_add(global.dl_COLOR01,$FFD38F); // Hue-$90,  Sat-$70,  Bright-$C7
// ROW $06                                                              //
ds_list_add(global.dl_COLOR01,$2A331B); // Hue-$70,  Sat-$78,  Bright-$2D
ds_list_add(global.dl_COLOR01,$003E00); // Hue-$55,  Sat-$FF,  Bright-$2C
ds_list_add(global.dl_COLOR01,$2A7B00); // Hue-$64,  Sat-$FF,  Bright-$5B
ds_list_add(global.dl_COLOR01,$70D43A); // Hue-$64,  Sat-$B9,  Bright-$AC
ds_list_add(global.dl_COLOR01,$BCE89E); // Hue-$66,  Sat-$51,  Bright-$D5
ds_list_add(global.dl_COLOR01,$655E0B); // Hue-$83,  Sat-$E3,  Bright-$4C
ds_list_add(global.dl_COLOR01,$8F8A0B); // Hue-$81,  Sat-$EB,  Bright-$6F
ds_list_add(global.dl_COLOR01,$9BAF0E); // Hue-$7A,  Sat-$EB,  Bright-$8B
ds_list_add(global.dl_COLOR01,$B9E130); // Hue-$76,  Sat-$C9,  Bright-$B8
ds_list_add(global.dl_COLOR01,$E2F88F); // Hue-$77,  Sat-$6C,  Bright-$E0
// ROW $07                                                              //
ds_list_add(global.dl_COLOR01,$133213); // Hue-$55,  Sat-$9E,  Bright-$29
ds_list_add(global.dl_COLOR01,$005000); // Hue-$55,  Sat-$FF,  Bright-$39
ds_list_add(global.dl_COLOR01,$00A800); // Hue-$55,  Sat-$FF,  Bright-$78
ds_list_add(global.dl_COLOR01,$48DC4C); // Hue-$54,  Sat-$AC,  Bright-$B2
ds_list_add(global.dl_COLOR01,$96E8AF); // Hue-$48,  Sat-$5A,  Bright-$D5
ds_list_add(global.dl_COLOR01,$383631); // Hue-$8C,  Sat-$20,  Bright-$35
ds_list_add(global.dl_COLOR01,$4A4E37); // Hue-$78,  Sat-$4B,  Bright-$48
ds_list_add(global.dl_COLOR01,$647E54); // Hue-$65,  Sat-$55,  Bright-$73
ds_list_add(global.dl_COLOR01,$84A992); // Hue-$45,  Sat-$38,  Bright-$A1
ds_list_add(global.dl_COLOR01,$90BAB2); // Hue-$33,  Sat-$3A,  Bright-$B5
// ROW $08                                                              //
ds_list_add(global.dl_COLOR01,$1F281F); // Hue-$55,  Sat-$39,  Bright-$25
ds_list_add(global.dl_COLOR01,$004400); // Hue-$55,  Sat-$FF,  Bright-$30
ds_list_add(global.dl_COLOR01,$009400); // Hue-$55,  Sat-$FF,  Bright-$69
ds_list_add(global.dl_COLOR01,$10D080); // Hue-$3C,  Sat-$EB,  Bright-$B1
ds_list_add(global.dl_COLOR01,$A0FCE0); // Hue-$37,  Sat-$5D,  Bright-$EF
ds_list_add(global.dl_COLOR01,$4C5A16); // Hue-$77,  Sat-$C1,  Bright-$4A
ds_list_add(global.dl_COLOR01,$639023); // Hue-$6E,  Sat-$C1,  Bright-$75
ds_list_add(global.dl_COLOR01,$73BC1E); // Hue-$6C,  Sat-$D6,  Bright-$95
ds_list_add(global.dl_COLOR01,$69DB91); // Hue-$46,  Sat-$85,  Bright-$C3
ds_list_add(global.dl_COLOR01,$6CDFCD); // Hue-$31,  Sat-$84,  Bright-$D2
// ROW $09                                                              //
ds_list_add(global.dl_COLOR01,$0F232C); // Hue-$1D,  Sat-$A8,  Bright-$23
ds_list_add(global.dl_COLOR01,$002C40); // Hue-$1D,  Sat-$FF,  Bright-$2D
ds_list_add(global.dl_COLOR01,$007088); // Hue-$23,  Sat-$FF,  Bright-$6D
ds_list_add(global.dl_COLOR01,$3CBCF0); // Hue-$1E,  Sat-$BF,  Bright-$BD
ds_list_add(global.dl_COLOR01,$7DDAD4); // Hue-$2D,  Sat-$6D,  Bright-$D2
ds_list_add(global.dl_COLOR01,$243E4C); // Hue-$1C,  Sat-$86,  Bright-$3F
ds_list_add(global.dl_COLOR01,$336667); // Hue-$2A,  Sat-$81,  Bright-$62
ds_list_add(global.dl_COLOR01,$47A9A2); // Hue-$2E,  Sat-$94,  Bright-$A0
ds_list_add(global.dl_COLOR01,$4BE0D5); // Hue-$2E,  Sat-$AA,  Bright-$D2
ds_list_add(global.dl_COLOR01,$86FFFB); // Hue-$2C,  Sat-$79,  Bright-$F5
// ROW $0A                                                              //
ds_list_add(global.dl_COLOR01,$0F1E36); // Hue-$10,  Sat-$B8,  Bright-$22
ds_list_add(global.dl_COLOR01,$1A375E); // Hue-$12,  Sat-$B8,  Bright-$3D
ds_list_add(global.dl_COLOR01,$1B4461); // Hue-$19,  Sat-$B8,  Bright-$47
ds_list_add(global.dl_COLOR01,$406485); // Hue-$16,  Sat-$84,  Bright-$68
ds_list_add(global.dl_COLOR01,$5286B1); // Hue-$17,  Sat-$89,  Bright-$8B
ds_list_add(global.dl_COLOR01,$45307A); // Hue-$F3,  Sat-$9B,  Bright-$41
ds_list_add(global.dl_COLOR01,$39459E); // Hue-$05,  Sat-$A3,  Bright-$57
ds_list_add(global.dl_COLOR01,$3D68CD); // Hue-$0D,  Sat-$B3,  Bright-$7A
ds_list_add(global.dl_COLOR01,$4E90E6); // Hue-$12,  Sat-$A9,  Bright-$9D
ds_list_add(global.dl_COLOR01,$54B9FB); // Hue-$1A,  Sat-$AA,  Bright-$BF
// ROW $0B                                                              //
ds_list_add(global.dl_COLOR01,$0F194D); // Hue-$07,  Sat-$CD,  Bright-$23
ds_list_add(global.dl_COLOR01,$00087C); // Hue-$03,  Sat-$FF,  Bright-$20
ds_list_add(global.dl_COLOR01,$0C4CC8); // Hue-$0E,  Sat-$F0,  Bright-$61
ds_list_add(global.dl_COLOR01,$3898FC); // Hue-$15,  Sat-$C6,  Bright-$A6
ds_list_add(global.dl_COLOR01,$A8D8FC); // Hue-$18,  Sat-$55,  Bright-$DC
ds_list_add(global.dl_COLOR01,$3423AE); // Hue-$FA,  Sat-$CC,  Bright-$41
ds_list_add(global.dl_COLOR01,$3B3BE8); // Hue-$00,  Sat-$BE,  Bright-$5F
ds_list_add(global.dl_COLOR01,$1D6BFB); // Hue-$0F,  Sat-$E2,  Bright-$83
ds_list_add(global.dl_COLOR01,$17A5F7); // Hue-$1B,  Sat-$E7,  Bright-$AC
ds_list_add(global.dl_COLOR01,$2BC2F9); // Hue-$1F,  Sat-$D3,  Bright-$C2
// ROW $0C                                                              //
ds_list_add(global.dl_COLOR01,$0F135A); // Hue-$02,  Sat-$D5,  Bright-$21
ds_list_add(global.dl_COLOR01,$0000A4); // Hue-$00,  Sat-$FF,  Bright-$22
ds_list_add(global.dl_COLOR01,$0028D8); // Hue-$08,  Sat-$FF,  Bright-$4A
ds_list_add(global.dl_COLOR01,$6074FC); // Hue-$05,  Sat-$9E,  Bright-$8F
ds_list_add(global.dl_COLOR01,$B0BCFC); // Hue-$07,  Sat-$4D,  Bright-$C8
ds_list_add(global.dl_COLOR01,$27276E); // Hue-$00,  Sat-$A5,  Bright-$36
ds_list_add(global.dl_COLOR01,$3138B3); // Hue-$02,  Sat-$B9,  Bright-$51
ds_list_add(global.dl_COLOR01,$364FEA); // Hue-$06,  Sat-$C4,  Bright-$6E
ds_list_add(global.dl_COLOR01,$4A7DF5); // Hue-$0D,  Sat-$B2,  Bright-$92
ds_list_add(global.dl_COLOR01,$B0CBFD); // Hue-$0F,  Sat-$4E,  Bright-$D3
// ROW $0D                                                              //
ds_list_add(global.dl_COLOR01,$010101); // Hue-$00,  Sat-$00,  Bright-$01. C_BLK1
ds_list_add(global.dl_COLOR01,$171717); // Hue-$00,  Sat-$00,  Bright-$17
ds_list_add(global.dl_COLOR01,$2A2A2A); // Hue-$00,  Sat-$00,  Bright-$2A
ds_list_add(global.dl_COLOR01,$3A3A3A); // Hue-$00,  Sat-$00,  Bright-$3A
ds_list_add(global.dl_COLOR01,$4C4C4C); // Hue-$00,  Sat-$00,  Bright-$4C
ds_list_add(global.dl_COLOR01,$646464); // Hue-$00,  Sat-$00,  Bright-$64
ds_list_add(global.dl_COLOR01,$888888); // Hue-$00,  Sat-$00,  Bright-$88
ds_list_add(global.dl_COLOR01,$B2B2B2); // Hue-$00,  Sat-$00,  Bright-$B1
ds_list_add(global.dl_COLOR01,$DCDCDC); // Hue-$00,  Sat-$00,  Bright-$DC
ds_list_add(global.dl_COLOR01,$FCFCFC); // Hue-$00,  Sat-$00,  Bright-$FB
// ROW $0E                                                              //
// ROW $0F                                                              //
//                                                                      //
ColorGrid_CLMS = $A;
ColorGrid_ROWS = $E;
//spr_ColorGrid01, ts_SolidColors01_8x8




// ---------------------------------------------------------------------------------------------
// CI: Color Index (of dl_COLOR)
CI_ERR0  = $FF; // ERROR. full green
CI_ERR0_ = hex_str(CI_ERR0);
//CI_ERR0 = ds_list_find_index(dl_COLOR, C_ERR0); // ERROR. full green
CI_BLK0  = ds_list_find_index(dl_COLOR, C_BLK0); // full black
CI_BLK0_ = hex_str(CI_BLK0);
CI_WHT0  = ds_list_find_index(dl_COLOR, C_WHT0); // full white
CI_WHT0_ = hex_str(CI_WHT0);
CI_RED0  = ds_list_find_index(dl_COLOR, C_RED0); // full red
CI_RED0_ = hex_str(CI_RED0);
CI_GRN0  = ds_list_find_index(dl_COLOR, C_GRN0); // full green
CI_GRN0_ = hex_str(CI_GRN0);
CI_BLU0  = ds_list_find_index(dl_COLOR, C_BLU0); // full blue
CI_BLU0_ = hex_str(CI_BLU0);
CI_MGN0  = ds_list_find_index(dl_COLOR, C_MGN0); // full magenta
CI_MGN0_ = hex_str(CI_MGN0);
CI_CYN0  = ds_list_find_index(dl_COLOR, C_CYN0); // full cyan
CI_CYN0_ = hex_str(CI_CYN0);
CI_YLW0  = ds_list_find_index(dl_COLOR, C_YLW0); // full yellow
CI_YLW0_ = hex_str(CI_YLW0);
//                                                  // 
//                                                  // 
//                                                  // 
CI_BLK1  = ds_list_find_index(dl_COLOR, C_BLK1); // $0D. B-000,G-000,R-000.   NES black
CI_BLK1_ = hex_str(CI_BLK1);
//                                                  // 
CI_WHT1  = ds_list_find_index(dl_COLOR, C_WHT1); // $30. White 1. Brightest NES white.
CI_WHT1_ = hex_str(CI_WHT1);
CI_WHT2  = ds_list_find_index(dl_COLOR, C_WHT2); // $20. White 2. SLIGHTLY grey. SLIGHTLY less bright than white 1
CI_WHT2_ = hex_str(CI_WHT2);
//                                                  // 
CI_GRY1  = ds_list_find_index(dl_COLOR, C_GRY1); // $10. Grey,    Brightest grey
CI_GRY1_ = hex_str(CI_GRY1);
CI_GRY2  = ds_list_find_index(dl_COLOR, C_GRY2); // $3D. Grey,    2nd Brightest grey
CI_GRY2_ = hex_str(CI_GRY2);
CI_GRY3  = ds_list_find_index(dl_COLOR, C_GRY3); // $00. Grey,    2nd Darkest grey
CI_GRY3_ = hex_str(CI_GRY3);
CI_GRY4  = ds_list_find_index(dl_COLOR, C_GRY4); // $2D. Grey,    Darkest grey
CI_GRY4_ = hex_str(CI_GRY4);
//                                                  // 
CI_BLU1  = ds_list_find_index(dl_COLOR, C_BLU1); // $31. Blue. 
CI_BLU1_ = hex_str(CI_BLU1);
CI_BLU2  = ds_list_find_index(dl_COLOR, C_BLU2); // $21. Blue. Field Encounter sky
CI_BLU2_ = hex_str(CI_BLU2);
CI_BLU3  = ds_list_find_index(dl_COLOR, C_BLU3); // $11. Blue. 
CI_BLU3_ = hex_str(CI_BLU3);
CI_BLU4  = ds_list_find_index(dl_COLOR, C_BLU4); // $02. Blue. Old Kasuto sky
CI_BLU4_ = hex_str(CI_BLU4);
//                                                  // 
CI_VLT1  = ds_list_find_index(dl_COLOR, C_VLT1); // $32. Violet.         Brightest
CI_VLT1_ = hex_str(CI_VLT1);
CI_VLT2  = ds_list_find_index(dl_COLOR, C_VLT2); // $22. Violet/Blue.      
CI_VLT2_ = hex_str(CI_VLT2);
CI_VLT3  = ds_list_find_index(dl_COLOR, C_VLT3); // $12. Violet/Blue.      
CI_VLT3_ = hex_str(CI_VLT3);
CI_VLT4  = ds_list_find_index(dl_COLOR, C_VLT4); // $01. Violet          Darkest
CI_VLT4_ = hex_str(CI_VLT4);
//                                                  // 
CI_PUR1  = ds_list_find_index(dl_COLOR, C_PUR1); // $33. Purple. 
CI_PUR1_ = hex_str(CI_PUR1);
CI_PUR2  = ds_list_find_index(dl_COLOR, C_PUR2); // $23. Purple. 
CI_PUR2_ = hex_str(CI_PUR2);
CI_PUR3  = ds_list_find_index(dl_COLOR, C_PUR3); // $13. Purple. Cemetery sky
CI_PUR3_ = hex_str(CI_PUR3);
CI_PUR4  = ds_list_find_index(dl_COLOR, C_PUR4); // $03. Purple. 
CI_PUR4_ = hex_str(CI_PUR4);
//                                                  // 
CI_MGN1  = ds_list_find_index(dl_COLOR, C_MGN1); // $34. Magenta. 
CI_MGN1_ = hex_str(CI_MGN1);
CI_MGN2  = ds_list_find_index(dl_COLOR, C_MGN2); // $24. Magenta. 
CI_MGN2_ = hex_str(CI_MGN2);
CI_MGN3  = ds_list_find_index(dl_COLOR, C_MGN3); // $14. Magenta. ShadowLink bg
CI_MGN3_ = hex_str(CI_MGN3);
CI_MGN4  = ds_list_find_index(dl_COLOR, C_MGN4); // $04. Magenta. 
CI_MGN4_ = hex_str(CI_MGN4);
//                                                  // 
CI_PNK1  = ds_list_find_index(dl_COLOR, C_PNK1); // $35. Pink. 
CI_PNK1_ = hex_str(CI_PNK1);
CI_PNK2  = ds_list_find_index(dl_COLOR, C_PNK2); // $25. Pink. 
CI_PNK2_ = hex_str(CI_PNK2);
CI_PNK3  = ds_list_find_index(dl_COLOR, C_PNK3); // $15. Pink. 
CI_PNK3_ = hex_str(CI_PNK3);
CI_PNK4  = ds_list_find_index(dl_COLOR, C_PNK4); // $05. Pink. 
CI_PNK4_ = hex_str(CI_PNK4);
//                                                  // 
CI_RED1  = ds_list_find_index(dl_COLOR, C_RED1); // $36. Red. Brightest red
CI_RED1_ = hex_str(CI_RED1);
CI_RED2  = ds_list_find_index(dl_COLOR, C_RED2); // $26. Red. 
CI_RED2_ = hex_str(CI_RED2);
CI_RED3  = ds_list_find_index(dl_COLOR, C_RED3); // $16. Red. orange mob red
CI_RED3_ = hex_str(CI_RED3);
CI_RED4  = ds_list_find_index(dl_COLOR, C_RED4); // $06. Red. 
CI_RED4_ = hex_str(CI_RED4);
//                                                  // 
CI_ORG1  = ds_list_find_index(dl_COLOR, C_ORG1); // $37. orange. brightest
CI_ORG1_ = hex_str(CI_ORG1);
CI_ORG2  = ds_list_find_index(dl_COLOR, C_ORG2); // $27. orange mob orange
CI_ORG2_ = hex_str(CI_ORG2);
CI_ORG3  = ds_list_find_index(dl_COLOR, C_ORG3); // $17. orange 
CI_ORG3_ = hex_str(CI_ORG3);
CI_ORG4  = ds_list_find_index(dl_COLOR, C_ORG4); // $07. 
CI_ORG4_ = hex_str(CI_ORG4);
//                                                  // 
CI_YLW1  = ds_list_find_index(dl_COLOR, C_YLW1); // $38. Yellow. 
CI_YLW1_ = hex_str(CI_YLW1);
CI_YLW2  = ds_list_find_index(dl_COLOR, C_YLW2); // $28. Yellow. Map paper.
CI_YLW2_ = hex_str(CI_YLW2);
CI_YLW3  = ds_list_find_index(dl_COLOR, C_YLW3); // $18. Yellow. 
CI_YLW3_ = hex_str(CI_YLW3);
CI_YLW4  = ds_list_find_index(dl_COLOR, C_YLW4); // $08. Yellow. 
CI_YLW4_ = hex_str(CI_YLW4);
//                                                  // 
CI_YGR1  = ds_list_find_index(dl_COLOR, C_YGR1); // $39. Green-Yellow. 
CI_YGR1_ = hex_str(CI_YGR1);
CI_YGR2  = ds_list_find_index(dl_COLOR, C_YGR2); // $29. Green-Yellow.
CI_YGR2_ = hex_str(CI_YGR2);
CI_YGR3  = ds_list_find_index(dl_COLOR, C_YGR3); // $19. Green-Yellow. 
CI_YGR3_ = hex_str(CI_YGR3);
CI_YGR4  = ds_list_find_index(dl_COLOR, C_YGR4); // $09. Green-Yellow. 
CI_YGR4_ = hex_str(CI_YGR4);
//                                                  // 
CI_GRN1  = ds_list_find_index(dl_COLOR, C_GRN1); // $3A. Green. 
CI_GRN1_ = hex_str(CI_GRN1);
CI_GRN2  = ds_list_find_index(dl_COLOR, C_GRN2); // $2A. Green. Lonk green
CI_GRN2_ = hex_str(CI_GRN2);
CI_GRN3  = ds_list_find_index(dl_COLOR, C_GRN3); // $1A. Green. 
CI_GRN3_ = hex_str(CI_GRN3);
CI_GRN4  = ds_list_find_index(dl_COLOR, C_GRN4); // $0A. Green. 
CI_GRN4_ = hex_str(CI_GRN4);
//                                                  // 
CI_GRB1  = ds_list_find_index(dl_COLOR, C_GRB1); // $3B. Green-Blue. 
CI_GRB1_ = hex_str(CI_GRB1);
CI_GRB2  = ds_list_find_index(dl_COLOR, C_GRB2); // $2B. Green-Blue.
CI_GRB2_ = hex_str(CI_GRB2);
CI_GRB3  = ds_list_find_index(dl_COLOR, C_GRB3); // $1B. Green-Blue.
CI_GRB3_ = hex_str(CI_GRB3);
CI_GRB4  = ds_list_find_index(dl_COLOR, C_GRB4); // $0B. Green-Blue.
CI_GRB4_ = hex_str(CI_GRB4);
//                                                  // 
CI_CYN1  = ds_list_find_index(dl_COLOR, C_CYN1); // $3C. Teal. Brightest
CI_CYN1_ = hex_str(CI_CYN1);
CI_CYN2  = ds_list_find_index(dl_COLOR, C_CYN2); // $2C. Teal. 
CI_CYN2_ = hex_str(CI_CYN2);
CI_CYN3  = ds_list_find_index(dl_COLOR, C_CYN3); // $1C. Teal. 
CI_CYN3_ = hex_str(CI_CYN3);
CI_CYN4  = ds_list_find_index(dl_COLOR, C_CYN4); // $0C. Teal. Darkest
CI_CYN4_ = hex_str(CI_CYN4);
//                                                  // 
//                                                  // 


C_SWDH = C_WHT1;
C_SWDM = C_ORG2;
C_SWDS = C_ORG4;


dl_COLORS_USED = ds_list_create();
             _count=ds_list_size(dl_COLOR);
for(_i=0; _i<_count; _i++)
{
        _color = dl_COLOR[|_i];
    if (_color!=C_ERR0 
    &&  ds_list_find_index(dl_COLORS_USED,_color)==-1 )
    {
        ds_list_add(       dl_COLORS_USED,_color);
    }
}

//dev_output_colors_1a();






// Color Tone Highlight, Midtone, Shadow
CI_TONE_HGH = CI_WHT0; // Highlight
CI_TONE_MID = CI_RED0; // Midtone
CI_TONE_LOW = CI_BLU0; // Shadow


dl_colors_h = ds_list_create(); // recommended colors for a highlight tone
dl_colors_m = ds_list_create(); // recommended colors for a midtone
dl_colors_s = ds_list_create(); // recommended colors for a shadow tone
ds_list_copy(_dl,global.dl_COLOR01);
//ds_list_copy(_dl,dl_COLOR);
for(_i=ds_list_size(_dl)-1; _i>=0; _i--)
{
    _color = _dl[|_i];
    if (ds_list_find_index(dl_BASE_COLORS,_color)==-1)
    {
        _brightness = get_color_brightness(_color);
             if (_brightness<$40) ds_list_add(dl_colors_s,_color);
        else if (_brightness<$80) ds_list_add(dl_colors_m,_color);
        else                      ds_list_add(dl_colors_h,_color);
    }
}




global.BackgroundColor_scene    = C_BLK1;
global.BackgroundColor_at_death = -1;




// color sequences
dg_color_seq = ds_grid_create(0,4);
_a=-1;
// 0: bg flash for: spell, boss explosion, death screen, 
ds_grid_resize(dg_color_seq, (++_a)+1, ds_grid_height(dg_color_seq));
dg_color_seq[#_a,0] = C_VLT3;
dg_color_seq[#_a,1] = C_RED3;
dg_color_seq[#_a,2] = C_GRN2;
dg_color_seq[#_a,3] = C_RED3;

// 1: Star Sky star color sequence
ds_grid_resize(dg_color_seq, (++_a)+1, ds_grid_height(dg_color_seq));
dg_color_seq[#_a,0] = C_GRY3; // Grey,  2nd darkest
dg_color_seq[#_a,1] = C_BLU4; // Blue,  darkest
dg_color_seq[#_a,2] = C_BLU2; // Blue,  light
dg_color_seq[#_a,3] = C_WHT1; // White, brightest


/*
_val = "00"+"0D"+"2D"+"3D";
dm_COLOR_CHOICES = ds_map_create();
dm_COLOR_CHOICES[?STR_Base+"01"+"_High"]  = _val+"01"+"02"+"03"+"0C"+"11"+"12"+"13"+"1C";
dm_COLOR_CHOICES[?STR_Base+"01"+"_Shad"]  = "01"+"02"+"03"+"0C"+"0D"+"2D";

dm_COLOR_CHOICES[?STR_Base+"02"+"_High"]  = _val+"01"+"02"+"03"+"0C"+"11"+"12"+"13"+"1C";
*/




global.dg_pi_permuts = ds_grid_create(0,4);




SpellFlash_DURATION1   = $20;
Flash_Pal_timer        = 0; // $074B
Flash_Bgr_timer        = 0; // 
Flash_Bgr_timer2       = 0; // Ganon3 uses this so red is used instead of the user's bgr flash setting
SpellFlash_PC_timer    = 0; // 
SpellFlash_GOB_timer   = 0; // 
SpellReady_flash_timer = 0;
SpellCast_flash_timer  = 0;
//Flash_PC_timer         = 0; // 
//PalFlash1_Bgr_timer    = 0; // 
//PalFlash1_timer        = 0; // $074B
//pal_flash_tmr          = 0; // $074B


GameOverScreen_BGR_COLOR = C_RED3;


            dl_BackgroundFlash_COLORS=ds_list_create();
ds_list_add(dl_BackgroundFlash_COLORS,C_BLK1);
ds_list_add(dl_BackgroundFlash_COLORS,C_GRY4);
ds_list_add(dl_BackgroundFlash_COLORS,C_RED3);
ds_list_add(dl_BackgroundFlash_COLORS,C_VLT3);
ds_list_add(dl_BackgroundFlash_COLORS,C_GRN2);
BackgroundFlash_setting = $2;













// ---------------------------------------------------------------------------
// dg_depth_pi contains the pi's each depth will use for THE CURRENT RM.
dg_depth_pi = ds_grid_create(g.TILE_LAYER_COUNT,4);
dm_depth_pi = ds_map_create();

var _GROUP1_BASE  =  TILE_DEPTHS_BASE;

var _GROUP2_BASE  = _GROUP1_BASE;
    _GROUP2_BASE += (TILE_DEPTHS_PAD * (val(global.dm_pi[?"BGR"+STR_Count])-1));
    _GROUP2_BASE +=  TILE_LAYERS_GROUP_PAD;
//
var _depth = 0;

for(_i=ds_list_size(g.dl_TILE_DEPTHS)-1; _i>=0; _i--)
{
    _depth =        g.dl_TILE_DEPTHS[|_i];
    
         _idx  = abs(_depth);
    if ( _idx >= _GROUP2_BASE)
    {    _idx -= _GROUP2_BASE;  }
    else _idx -= _GROUP1_BASE;
         _idx  = _idx div TILE_DEPTHS_PAD; // = 0,1,2,3
         _idx  = global.PI_BGR1 + _idx;
    //
    dm_depth_pi[?hex_str(abs(_depth))] = _idx;
}
/*
dm_depth_pi = ds_map_create();
dm_depth_pi[?hex_str(DEPTH_BG1_P1)] = PI_BGR1; // +$80 depth
dm_depth_pi[?hex_str(DEPTH_BG1_P2)] = PI_BGR2; // +$90
dm_depth_pi[?hex_str(DEPTH_BG1_P3)] = PI_BGR3; // +$A0
dm_depth_pi[?hex_str(DEPTH_BG1_P4)] = PI_BGR4; // +$B0
                                                // 
dm_depth_pi[?hex_str(DEPTH_BG2_P1)] = PI_BGR1; // +$E0
dm_depth_pi[?hex_str(DEPTH_BG2_P2)] = PI_BGR2; // +$F0
dm_depth_pi[?hex_str(DEPTH_BG2_P3)] = PI_BGR3; // +$100
dm_depth_pi[?hex_str(DEPTH_BG2_P4)] = PI_BGR4; // +$110 depth
                                                // 
                                                // 
dm_depth_pi[?hex_str(DEPTH_FG1_P1)] = PI_BGR1; // -$80 depth
dm_depth_pi[?hex_str(DEPTH_FG1_P2)] = PI_BGR2; // -$90
dm_depth_pi[?hex_str(DEPTH_FG1_P3)] = PI_BGR3; // -$A0
dm_depth_pi[?hex_str(DEPTH_FG1_P4)] = PI_BGR4; // -$B0
                                                // 
dm_depth_pi[?hex_str(DEPTH_FG2_P1)] = PI_BGR1; // -$E0
dm_depth_pi[?hex_str(DEPTH_FG2_P2)] = PI_BGR2; // -$F0
dm_depth_pi[?hex_str(DEPTH_FG2_P3)] = PI_BGR3; // -$100
dm_depth_pi[?hex_str(DEPTH_FG2_P4)] = PI_BGR4; // -$110 depth
*/


















TRIFORCE_PI = global.PI_MOB_BLU;
triforce_pi = TRIFORCE_PI;
//TRIFORCE_PAL_POS = val(dm_pal_data[?hex_str(triforce_pi)+STR_Palette+STR_Position]);

// These get set in p_Room_Start()
global.spell_unaffordable_pi = 0;
global.spell_futile_pi       = 0;










_datakey1 = STR_Palette+STR_Index;

PAL_POS_GUI1 = val(dm_pal_data[?hex_str(global.PI_GUI1)          +_dk_Palette_Position], get_pal_pos(global.PI_GUI1));
PAL_POS_GUI2 = val(dm_pal_data[?hex_str(global.PI_GUI2)          +_dk_Palette_Position], get_pal_pos(global.PI_GUI2));
PAL_POS_GUI3 = val(dm_pal_data[?hex_str(global.PI_GUI3)          +_dk_Palette_Position], get_pal_pos(global.PI_GUI3));
PAL_POS_GUI4 = val(dm_pal_data[?hex_str(global.PI_GUI4)+_dk_Palette_Position], get_pal_pos(global.PI_GUI4));
//                                                                                              // 
PAL_POS_PC_1 = val(dm_pal_data[?hex_str(global.PI_PC1)           +_dk_Palette_Position], get_pal_pos(global.PI_PC1));            // Tunic (Green)
PAL_POS_PC_2 = val(dm_pal_data[?hex_str(global.PI_DISGUISE_PC)   +_dk_Palette_Position], get_pal_pos(global.PI_DISGUISE_PC));    // Disguise
PAL_POS_PC_3 = val(dm_pal_data[?hex_str(global.PI_SPELL_PC1)     +_dk_Palette_Position], get_pal_pos(global.PI_SPELL_PC1));      // Spell flash (Light)
PAL_POS_CUC1 = val(dm_pal_data[?hex_str(global.PI_CUCCO1)        +_dk_Palette_Position], get_pal_pos(global.PI_CUCCO1));         // Tunic (Green)
PAL_POS_CUC2 = val(dm_pal_data[?hex_str(global.PI_DISGUISE_CUCCO)+_dk_Palette_Position], get_pal_pos(global.PI_DISGUISE_CUCCO)); // Disguise
//PAL_POS_CUC3 = val(dm_pal_data[?hex_str(PI_CUC3)   +_dk_Palette_Position], get_pal_pos(PI_CUC3   )); // Spell flash (Light)
//                                                                                              // 
PAL_POS_BGR1 = val(dm_pal_data[?hex_str(global.PI_BGR1)          +_dk_Palette_Position], get_pal_pos(global.PI_BGR1));
PAL_POS_BGR2 = val(dm_pal_data[?hex_str(global.PI_BGR2)          +_dk_Palette_Position], get_pal_pos(global.PI_BGR2));
PAL_POS_BGR3 = val(dm_pal_data[?hex_str(global.PI_BGR3)          +_dk_Palette_Position], get_pal_pos(global.PI_BGR3));
PAL_POS_BGR4 = val(dm_pal_data[?hex_str(global.PI_BGR4)          +_dk_Palette_Position], get_pal_pos(global.PI_BGR4));
//                                                                                              // 
PAL_POS_MOB1 = val(dm_pal_data[?hex_str(global.PI_MOB_ORG)       +_dk_Palette_Position], get_pal_pos(global.PI_MOB_ORG));
PAL_POS_MOB2 = val(dm_pal_data[?hex_str(global.PI_MOB_RED)       +_dk_Palette_Position], get_pal_pos(global.PI_MOB_RED));
PAL_POS_MOB3 = val(dm_pal_data[?hex_str(global.PI_MOB_BLU)       +_dk_Palette_Position], get_pal_pos(global.PI_MOB_BLU));
PAL_POS_MOB4 = val(dm_pal_data[?hex_str(global.PI_MOB_PUR)       +_dk_Palette_Position], get_pal_pos(global.PI_MOB_PUR));
//                                                                                              // 
//                                                                                              // 
PAL_POS_GUI1_DARK = PAL_POS_GUI1 + (COL_PER_SET*global.PAL_CHAR_PER_COLOR);
PAL_POS_GUI2_DARK = PAL_POS_GUI2 + (COL_PER_SET*global.PAL_CHAR_PER_COLOR);
PAL_POS_GUI3_DARK = PAL_POS_GUI3 + (COL_PER_SET*global.PAL_CHAR_PER_COLOR);
//PAL_POS_GUI4_DARK = PAL_POS_GUI4 + (COL_PER_SET*global.PAL_CHAR_PER_COLOR);
//                                                                                              // 
PAL_POS_PC_1_DARK = PAL_POS_PC_1 + (COL_PER_SET*global.PAL_CHAR_PER_COLOR);
PAL_POS_PC_2_DARK = PAL_POS_PC_2 + (COL_PER_SET*global.PAL_CHAR_PER_COLOR);
PAL_POS_PC_3_DARK = PAL_POS_PC_3 + (COL_PER_SET*global.PAL_CHAR_PER_COLOR);
PAL_POS_CUC1_DARK = PAL_POS_CUC1 + (COL_PER_SET*global.PAL_CHAR_PER_COLOR);
PAL_POS_CUC2_DARK = PAL_POS_CUC2 + (COL_PER_SET*global.PAL_CHAR_PER_COLOR);
//PAL_POS_CUC3_DARK = PAL_POS_CUC3 + (COL_PER_SET<<1); // spell flash cucco
//                                                                                              // 
PAL_POS_BGR1_DARK = PAL_POS_BGR1 + (COL_PER_SET*global.PAL_CHAR_PER_COLOR);
PAL_POS_BGR2_DARK = PAL_POS_BGR2 + (COL_PER_SET*global.PAL_CHAR_PER_COLOR);
PAL_POS_BGR3_DARK = PAL_POS_BGR3 + (COL_PER_SET*global.PAL_CHAR_PER_COLOR);
PAL_POS_BGR4_DARK = PAL_POS_BGR4 + (COL_PER_SET*global.PAL_CHAR_PER_COLOR);
//                                                                                              // 
PAL_POS_MOB1_DARK = PAL_POS_MOB1 + (COL_PER_SET*global.PAL_CHAR_PER_COLOR);
PAL_POS_MOB2_DARK = PAL_POS_MOB2 + (COL_PER_SET*global.PAL_CHAR_PER_COLOR);
PAL_POS_MOB3_DARK = PAL_POS_MOB3 + (COL_PER_SET*global.PAL_CHAR_PER_COLOR);
PAL_POS_MOB4_DARK = PAL_POS_MOB4 + (COL_PER_SET*global.PAL_CHAR_PER_COLOR);
//                                                                                              // 
//PAL_POS_PC_SWORD = get_pal_pos(PI_PC_SWORD);
//                                                                                              // 








PAL_BASE = build_pal(dl_BASE_COLORS[|0],dl_BASE_COLORS[|1],dl_BASE_COLORS[|2],dl_BASE_COLORS[|3], dl_BASE_COLORS[|4],dl_BASE_COLORS[|5],dl_BASE_COLORS[|6],dl_BASE_COLORS[|7]); // FFFFFF 0000FF FF0000 00FF00 00FFFF FF00FF 000000 FFFF00
//PAL_BASE = build_pal(C_WHT0,C_RED0,C_BLU0,C_GRN0,C_YLW0,C_MGN0,C_BLK0,C_CYN0);
//                                                                          //
//                                                                          //
//                                                                          //
PAL_GUI1 = build_pal(C_WHT1,C_RED3,C_VLT3); // standard
PAL_GUI2 = build_pal(C_GRY1,C_GRY4,C_BLK1); // grey
PAL_GUI3 = build_pal(C_GRY1,C_RED4,C_VLT4); // darker version of PAL_GUI1
PAL_GUI4 = build_pal(C_WHT1,C_RED3,C_VLT3); // ?
//                                                                          //
PAL_MENU_BLU1 = build_pal(C_WHT1,C_BLU2,C_VLT3); // blue    menu
PAL_MENU_BLU2 = build_pal(C_WHT1,C_BLU2,C_BLU3); // blue    menu
//                                                                          //
//                                                                          //
PAL_PC_1 = build_pal(C_RED1,C_GRN2,C_YLW3,C_BLK1,C_SWDH,-2,-2,-2); // tunic green
PAL_PC_2 = build_pal(C_RED1,C_RED3,C_YLW3,C_BLK1,C_SWDH,-2,-2,-2); // tunic red
PAL_PC_3 = build_pal(C_RED1,C_BLU3,C_GRY4,C_BLK1,C_SWDH,-2,-2,-2); // tunic blue
PAL_PC_C = build_pal(C_RED1,C_RED3,C_BLK1,C_BLK1,C_SWDH,-2,-2,-2); // disguise
//                                                                          //
PAL_PC_4 = build_pal(C_BLU2,C_VLT4,C_VLT4,C_BLK1,-2,-2,-2,-2); // spell light
PAL_PC_5 = build_pal(C_WHT1,C_BLU1,C_BLU1,C_BLK1,-2,-2,-2,-2); // spell mid
PAL_PC_6 = build_pal(C_VLT3,C_WHT1,C_WHT1,C_BLK1,-2,-2,-2,-2); // spell dark
//                                                                          //
PAL_PC_7 = build_pal(C_BLU2,C_BLU3,C_VLT4,C_BLK1,-2,-2,-2,-2); // dark room tunic green
PAL_PC_A = build_pal(C_BLU2,C_VLT3,C_VLT4,C_BLK1,-2,-2,-2,-2); // dark room tunic red
PAL_PC_B = build_pal(C_BLU2,C_VLT2,C_VLT4,C_BLK1,-2,-2,-2,-2); // dark room tunic blue
//                                                                          //
PAL_CUC1 = build_pal(C_WHT1,C_ORG2,C_GRN3,C_BLK1,-2,-2,-2,-2); // cucco tunic green
PAL_CUC2 = build_pal(C_WHT1,C_ORG2,C_RED3,C_BLK1,-2,-2,-2,-2); // cucco tunic red
PAL_CUC3 = build_pal(C_WHT1,C_ORG2,C_BLU3,C_BLK1,-2,-2,-2,-2); // cucco tunic blue
PAL_CUC5 = build_pal(C_WHT1,C_RED3,C_BLK1,C_BLK1,-2,-2,-2,-2); // cucco disguise
//                                                                          //




PAL_MOB_ORG1 = build_pal(C_WHT1,C_ORG2,C_RED3,C_BLK1,-2,-2,-2,-2); // orange  mob
//                                                                          //
PAL_MOB_RED1 = build_pal(C_WHT1,C_RED3,C_BLK1,C_BLK1,-2,-2,-2,-2); // red     mob
PAL_MOB_RED2 = build_pal(C_WHT1,C_RED3,C_ORG4,C_BLK1,-2,-2,-2,-2); // red     mob (dungeon)
//                                                                          //
PAL_MOB_BLU1 = build_pal(C_WHT1,C_CYN2,C_CYN4,C_BLK1,-2,-2,-2,-2); // blue    mob (non-dungeon)
PAL_MOB_BLU2 = build_pal(C_WHT1,C_BLU2,C_BLU4,C_BLK1,-2,-2,-2,-2); // blue    mob (dungeon)
PAL_MOB_BLU3 = build_pal(C_WHT1,C_CYN2,C_BLU3,C_BLK1,-2,-2,-2,-2); // blue    mob (old kasuto fire)
//                                                                          //
PAL_MOB_PUR1 = build_pal(C_WHT1,C_PUR3,C_PUR4,C_BLK1,-2,-2,-2,-2); // purple  mob
PAL_MOB_PUR2 = strReplaceAt(PAL_MOB_PUR1, get_pal_col_pos(0,"B"), global.PAL_CHAR_PER_COLOR, color_str(C_BLK1)); // purple  mob
PAL_MOB_PUR2 = strReplaceAt(PAL_MOB_PUR2, get_pal_col_pos(0,"K"), global.PAL_CHAR_PER_COLOR, color_str(get_pal_color(PAL_MOB_PUR2,0,"B")));
//                                                                          //
//                                                                          //
PAL_NPC_ORG1 = PAL_MOB_ORG1;                                       // orange  npc
//                                                                          //
PAL_NPC_RED1 = build_pal(C_RED1,C_RED3,C_BLK1,C_BLK1,-2,-2,-2,-2); // red     npc
//                                                                          //
PAL_NPC_BLU1 = build_pal(C_RED1,C_VLT3,C_BLK1,C_BLK1,-2,-2,-2,-2); // blue    npc
PAL_NPC_BLU2 = PAL_MOB_BLU1; // Bulblin
//                                                                          //
PAL_NPC_PUR1 = build_pal(C_RED1,C_PUR3,C_BLK1,C_BLK1,-2,-2,-2,-2); // purple  npc
PAL_NPC_PUR2 = strReplaceAt(PAL_NPC_PUR1, get_pal_col_pos(0,"B"), global.PAL_CHAR_PER_COLOR, color_str(C_PUR4));
PAL_NPC_PUR2 = strReplaceAt(PAL_NPC_PUR2, get_pal_col_pos(0,"K"), global.PAL_CHAR_PER_COLOR, color_str(get_pal_color(PAL_NPC_PUR2,0,"B")));
PAL_NPC_PUR3 = strReplaceAt(PAL_NPC_PUR1, get_pal_col_pos(0,"B"), global.PAL_CHAR_PER_COLOR, color_str(C_YLW4)); // dark brown outline
PAL_NPC_PUR3 = strReplaceAt(PAL_NPC_PUR3, get_pal_col_pos(0,"K"), global.PAL_CHAR_PER_COLOR, color_str(get_pal_color(PAL_NPC_PUR3,0,"B")));
PAL_NPC_PUR4 = build_pal(C_RED1,C_GRY2,C_PUR4,C_BLK1,-2,-2,-2,-2); // purple  npc. Skill Knights
//                                                                          //
PAL_NPC_SET1 = PAL_NPC_ORG1 + PAL_NPC_RED1 + PAL_NPC_BLU1 + PAL_NPC_PUR1;
PAL_NPC_SET2 = PAL_NPC_ORG1 + PAL_NPC_RED1 + PAL_NPC_BLU2 + PAL_NPC_PUR1; // Bulblin
PAL_NPC_SET3 = PAL_NPC_ORG1 + PAL_NPC_RED1 + PAL_NPC_BLU2 + PAL_NPC_PUR3; // Target Game(Saria Mini Game)
//                                                                          //
//                                                                          //
//                                                                          //
PAL_MOB_SET1 = PAL_MOB_ORG1 + PAL_MOB_RED1 + PAL_MOB_BLU1 + PAL_MOB_PUR2; // non-dungeon
//PAL_MOB_SET1 = PAL_MOB_ORG1 + PAL_MOB_RED1 + PAL_MOB_BLU1 + PAL_MOB_PUR1; // non-dungeon
PAL_MOB_SET2 = PAL_MOB_ORG1 + PAL_MOB_RED2 + PAL_MOB_BLU2 + PAL_MOB_PUR2; // dungeon
//PAL_MOB_SET2 = PAL_MOB_ORG1 + PAL_MOB_RED2 + PAL_MOB_BLU2 + PAL_MOB_PUR1; // dungeon
PAL_MOB_SET3 = PAL_MOB_ORG1 + PAL_MOB_RED2 + PAL_MOB_BLU1 + PAL_MOB_PUR2; // 
PAL_MOB_SET4 = PAL_MOB_ORG1 + PAL_MOB_RED1 + PAL_MOB_BLU1 + PAL_MOB_PUR2; // 
PAL_MOB_SET5 = PAL_MOB_ORG1 + PAL_MOB_RED2 + PAL_MOB_BLU3 + PAL_MOB_PUR2; // old kasuto
//                                                                          //




var _BGR00 = build_pal(C_BLK1,C_BLK1,C_BLK1,C_BLK1,-2,-2,-2,-2); // 
var _BGR01 = build_pal(C_VLT3,C_VLT4,C_BLK1,C_BLK1,-2,-2,-2,-2); // Dark room pal 1a
var _BGR02 = build_pal(C_VLT4,C_BLK1,C_BLK1,C_BLK1,-2,-2,-2,-2); // Dark room pal 1b
var _BGR03 = build_pal(C_BLK1,C_BLK1,C_GRY4,C_BLK1,-2,-2,-2,-2); // Dark room pal 2a
var _BGR04 = build_pal(C_CYN4,C_BLK1,C_BLK1,C_BLK1,-2,-2,-2,-2); // Dungeon, Dark full.
var _BGR05 = build_pal(C_BLK1,C_RED3,C_BLK1,C_BLK1,-2,-2,-2,-2); // Dark rm liquid
var _BGR06 = build_pal(C_VLT3,C_BLU4,C_BLK1,C_BLK1,-2,-2,-2,-2); // Dark room pal 1b
var _BGR07 = build_pal(C_CYN4,C_BLU4,C_BLK1,C_BLK1,-2,-2,-2,-2); // Dungeon, Dark 1a.
var _BGR08 = build_pal(C_BLU4,C_BLK1,C_BLK1,C_BLK1,-2,-2,-2,-2); // 
var _BGR09 = build_pal(C_ORG2,C_ORG4,C_BLK1,C_BLK1,-2,-2,-2,-2); // Cave. 1 torch lit
var _BGR0A = build_pal(C_GRY4,C_BLK1,C_GRY3,C_BLK1,-2,-2,-2,-2); // Dark rm 
var _BGR0B = build_pal(C_VLT4,C_BLK1,C_BLK1,C_BLK1,-2,-2,-2,-2); // Dark rm liquid

var _MOB00 = build_pal(C_BLK1,C_BLK1,C_BLK1,C_BLK1,-2,-2,-2,-2); // red & blue mob dark rm. 0 torch lit
var _MOB01 = build_pal(C_ORG2,C_BLK1,C_BLK1,C_BLK1,-2,-2,-2,-2); // orange     mob dark rm. 1 torch lit
var _MOB02 = build_pal(C_RED3,C_BLK1,C_BLK1,C_BLK1,-2,-2,-2,-2); // red        mob dark rm. 1 torch lit
var _MOB03 = build_pal(C_BLU2,C_BLK1,C_BLK1,C_BLK1,-2,-2,-2,-2); // blue       mob dark rm. 1 torch lit
var _MOB04 = build_pal(C_PUR3,C_BLK1,C_BLK1,C_BLK1,-2,-2,-2,-2); // purple     mob dark rm. 1 torch lit
//var _MOB04 = build_pal(get_pal_color(PAL_NPC_PUR1,0,"R"),C_BLK1,C_BLK1,C_BLK1); // purple     mob dark rm. 1 torch lit
//var _MOB04 = build_pal(C_MGN3,C_BLK1,C_BLK1,C_BLK1); // purple     mob dark rm. 1 torch lit




PAL_SET_GUI = "";
if (val(global.dm_pi[?"GUI"+STR_Count])>0) PAL_SET_GUI += PAL_GUI1;
if (val(global.dm_pi[?"GUI"+STR_Count])>1) PAL_SET_GUI += PAL_GUI2;
if (val(global.dm_pi[?"GUI"+STR_Count])>2) PAL_SET_GUI += PAL_GUI3;
if (val(global.dm_pi[?"GUI"+STR_Count])>3) PAL_SET_GUI += PAL_GUI4;




// PC spell flash palettes
PAL_SET_PC_0 = "";
for(_i=global.PI_SPELL_PC1; _i<global.PI_SPELL_PC1+val(global.dm_pi[?"SPELL_PC"+STR_Count]); _i++)
{
    switch(_i){
    case global.PI_SPELL_PC1:{PAL_SET_PC_0+=PAL_PC_4; break;}
    case global.PI_SPELL_PC2:{PAL_SET_PC_0+=PAL_PC_5; break;}
    case global.PI_SPELL_PC3:{PAL_SET_PC_0+=PAL_PC_6; break;}
    }
}
//PAL_SET_PC_0 = PAL_PC_4 + PAL_PC_5 + PAL_PC_6;




// PC tunic palettes LIT + DARK
_a = min(global.PI_PC1,global.PI_DISGUISE_PC);
_b = max(global.PI_PC3,global.PI_DISGUISE_PC);
PAL_SET_PC_1 = ""; // lit
PAL_SET_PC_2 = ""; // dark
for(_i=_a; _i<=_b; _i++)
{
    switch(_i){
    case global.PI_PC1:        {PAL_SET_PC_1+=PAL_PC_1; PAL_SET_PC_2+=PAL_PC_7; break;}
    case global.PI_PC2:        {PAL_SET_PC_1+=PAL_PC_2; PAL_SET_PC_2+=PAL_PC_A; break;}
    case global.PI_PC3:        {PAL_SET_PC_1+=PAL_PC_3; PAL_SET_PC_2+=PAL_PC_B; break;}
    case global.PI_DISGUISE_PC:{PAL_SET_PC_1+=PAL_PC_C; PAL_SET_PC_2+=PAL_PC_A; break;}
    }
}
//PAL_SET_PC_1 = PAL_PC_1 + PAL_PC_2 + PAL_PC_3 + PAL_PC_C;  // Tunic palettes LIT
//PAL_SET_PC_2 = PAL_PC_7 + PAL_PC_A + PAL_PC_B + PAL_PC_A;  // Tunic palettes DARK




// Cucco palettes LIT + DARK
_a = min(global.PI_CUCCO1,global.PI_DISGUISE_CUCCO);
_b = max(global.PI_CUCCO3,global.PI_DISGUISE_CUCCO);
PAL_SET_CUC1 = "";
for(_i=_a; _i<=_b; _i++)
{
    switch(_i){
    case global.PI_CUCCO1:        {PAL_SET_CUC1+=PAL_CUC1; break;}
    case global.PI_CUCCO2:        {PAL_SET_CUC1+=PAL_CUC2; break;}
    case global.PI_CUCCO3:        {PAL_SET_CUC1+=PAL_CUC3; break;}
    case global.PI_DISGUISE_CUCCO:{PAL_SET_CUC1+=PAL_CUC5; break;}
    }
}
//PAL_SET_CUC1 = PAL_CUC1 + PAL_CUC2 + PAL_CUC3 + PAL_CUC5;  // Cucco palettes scene LIT
PAL_SET_CUC2 = PAL_SET_PC_2; // Cucco palettes scene DARK




PAL_SET2 = PAL_BASE+PAL_SET_GUI + PAL_SET_PC_1+PAL_SET_PC_0 + PAL_SET_CUC1; // scene lit
PAL_SET3 = PAL_BASE+PAL_SET_GUI + PAL_SET_PC_2+PAL_SET_PC_0 + PAL_SET_CUC2; // scene dark




var _PAL_GRP2 = _MOB00 + _MOB00 + _MOB00 + _MOB00; // 0 torch lit
var _PAL_GRP3 = _MOB01 + _MOB02 + _MOB03 + _MOB04; // 1 torch lit


// MOB solid black w/ 0 brightness,  MOB Highlights lit w/ 1 brightness
// Cave
var _RM_PAL_00 = PAL_SET3 + _BGR01+_BGR01+_BGR0B+_BGR02 + _PAL_GRP2; // 0 torch lit
var _RM_PAL_01 = PAL_SET3 + _BGR09+_BGR09+_BGR0B+_BGR02 + _PAL_GRP3; // 1 torch lit
// Dungeon
var _RM_PAL_10 = PAL_SET3 + _BGR04+_BGR02+_BGR0B+_BGR02 + _PAL_GRP2; // 0 torch lit
var _RM_PAL_11 = PAL_SET3 + _BGR07+_BGR08+_BGR0B+_BGR02 + _PAL_GRP3; // 1 torch lit
var _RM_PAL_12 = PAL_SET3 + _BGR04+_BGR02+_BGR00+_BGR02 + _PAL_GRP2; // 0 torch lit
var _RM_PAL_13 = PAL_SET3 + _BGR07+_BGR08+_BGR0A+_BGR02 + _PAL_GRP3; // 1 torch lit



pal_rm_dark_idx = 0;
            _a=0;
var _CAV1 = _a++;
var _DGN1 = _a++;
var _DGN2 = _a++;
    dg_pal_rm_dark = ds_grid_create(_a, g.RM_BRIGHTNESS_MAX);
for(_i=ds_grid_height(dg_pal_rm_dark)-1; _i>=0; _i--)
{
    dg_pal_rm_dark[#_CAV1,_i] = _RM_PAL_01; // Cave.    1 torch lit
    dg_pal_rm_dark[#_DGN1,_i] = _RM_PAL_11; // Dungeon. 1 torch lit
    dg_pal_rm_dark[#_DGN2,_i] = _RM_PAL_13; // Dungeon. 1 torch lit
}
    dg_pal_rm_dark[#_CAV1,0]  = _RM_PAL_00; // Cave.    0 torch lit
    dg_pal_rm_dark[#_DGN1,0]  = _RM_PAL_10; // Dungeon. 0 torch lit
    dg_pal_rm_dark[#_DGN2,0]  = _RM_PAL_12; // Dungeon. 0 torch lit
//




var _SET1 = build_pal(C_RED3,C_GRY4,C_BLK1,C_BLK1,-2,-2,-2,-2); // 
var _PAL1 = build_pal(C_WHT1,C_WHT1,C_WHT1,C_BLK1,-2,-2,-2,-2); // 
var _PAL2 = build_pal(C_RED1,C_GRY1,C_PUR4,C_BLK1,-2,-2,-2,-2); // 
var _PAL3 = PAL_MOB_ORG1; // 
var _PAL4 = build_pal(C_WHT2,C_WHT1,C_ORG4,C_BLK1,-2,-2,-2,-2); // 
var _PAL5 = build_pal(C_ORG2,C_ORG2,C_BLK1,C_BLK1,-2,-2,-2,-2); // 
var _PAL6 = build_pal(C_RED2,C_BLK1,C_BLK1,C_BLK1,-2,-2,-2,-2); // 
var _PAL7 = build_pal(C_WHT1,C_RED3,C_BLK1,C_BLK1,-2,-2,-2,-2); // 
var _PAL8 = build_pal(C_WHT1,C_CYN2,C_BLK1,C_BLK1,-2,-2,-2,-2); // 

// File Select screen
             _dk   = room_get_name(rmB_FileSelect);
dm_pal_data[?_dk]  = PAL_SET2;
dm_pal_data[?_dk] +=_PAL4         +_PAL1         + _PAL1 + _PAL2  // bgr
dm_pal_data[?_dk] += PAL_MOB_ORG1 + PAL_MOB_RED2 + _PAL5 + _PAL2; // mob
// Continue Save screen
             _dk   = room_get_name(rmB_ContinueSave);
dm_pal_data[?_dk]  = PAL_SET2;
dm_pal_data[?_dk] +=_PAL6 + _PAL1 + _PAL1 + _PAL2  // bgr
dm_pal_data[?_dk] +=_PAL3 + _PAL7 + _PAL8 + _PAL2; // mob

OW_PAL  = PAL_SET2;
OW_PAL += build_pal(C_CYN1,C_BLU3,C_BLK1,C_BLK1,-2,-2,-2,-2); // BGR1
OW_PAL += build_pal(C_WHT1,C_YGR2,C_YGR3,C_BLK1,-2,-2,-2,-2); // BGR2
OW_PAL += build_pal(C_WHT1,C_YLW2,C_ORG3,C_BLK1,-2,-2,-2,-2); // BGR3
OW_PAL += build_pal(C_WHT1,C_YLW2,C_GRY3,C_BLK1,-2,-2,-2,-2); // BGR4
OW_PAL += PAL_MOB_ORG1; // MOB ORG
OW_PAL += PAL_MOB_RED2; // MOB RED
OW_PAL += PAL_MOB_BLU2; // MOB BLU
OW_PAL += PAL_MOB_PUR1; // MOB PUR








pal_rm_file = undefined; // from .json rm file
pal_rm_def  = undefined;
pal_rm_curr = "";
pal_rm_new  = "";
pal_rm_dark = undefined;
pal_rm_dark_DEFAULT = dg_pal_rm_dark[#0,0];

// pal_rm_DEFAULT: In case pal data for a rm cannot be located.
pal_rm_DEFAULT = "";
for(_i=0; _i<PAL_PER_SET; _i++)
{
    switch(_i){
    default:                      {pal_rm_DEFAULT+=PAL_BASE; break;}
    case global.PI_BASE:          {pal_rm_DEFAULT+=PAL_BASE; break;}
    case global.PI_GUI1:          {pal_rm_DEFAULT+=PAL_GUI1; break;}
    case global.PI_GUI2:          {pal_rm_DEFAULT+=PAL_GUI2; break;}
    case global.PI_GUI3:          {pal_rm_DEFAULT+=PAL_GUI3; break;}
    case global.PI_GUI4:          {pal_rm_DEFAULT+=PAL_GUI4; break;}
    case global.PI_PC1:           {pal_rm_DEFAULT+=PAL_PC_1; break;}
    case global.PI_PC2:           {pal_rm_DEFAULT+=PAL_PC_2; break;}
    case global.PI_PC3:           {pal_rm_DEFAULT+=PAL_PC_3; break;}
    case global.PI_DISGUISE_PC:   {pal_rm_DEFAULT+=PAL_PC_C; break;}
    case global.PI_SPELL_PC1:     {pal_rm_DEFAULT+=PAL_PC_4; break;}
    case global.PI_SPELL_PC2:     {pal_rm_DEFAULT+=PAL_PC_5; break;}
    case global.PI_SPELL_PC3:     {pal_rm_DEFAULT+=PAL_PC_6; break;}
    case global.PI_CUCCO1:        {pal_rm_DEFAULT+=PAL_CUC1; break;}
    case global.PI_CUCCO2:        {pal_rm_DEFAULT+=PAL_CUC2; break;}
    case global.PI_CUCCO3:        {pal_rm_DEFAULT+=PAL_CUC3; break;}
    case global.PI_DISGUISE_CUCCO:{pal_rm_DEFAULT+=PAL_CUC5; break;}
    case global.PI_BGR1:          {pal_rm_DEFAULT+=_SET1; break;}
    case global.PI_BGR2:          {pal_rm_DEFAULT+=_SET1; break;}
    case global.PI_BGR3:          {pal_rm_DEFAULT+=_SET1; break;}
    case global.PI_BGR4:          {pal_rm_DEFAULT+=_SET1; break;}
    case global.PI_BGR5:          {pal_rm_DEFAULT+=_SET1; break;}
    case global.PI_MOB_ORG:       {pal_rm_DEFAULT+=_SET1; break;}
    case global.PI_MOB_RED:       {pal_rm_DEFAULT+=_SET1; break;}
    case global.PI_MOB_BLU:       {pal_rm_DEFAULT+=_SET1; break;}
    case global.PI_MOB_PUR:       {pal_rm_DEFAULT+=_SET1; break;}
    case global.PI_MOB_A:         {pal_rm_DEFAULT+=_SET1; break;}
    }
}
pal_rm_DEFAULT += pal_rm_dark_DEFAULT;






dg_pal_seq = ds_grid_create(0,4);

// triforce flashing
_idx = ds_grid_width(dg_pal_seq)-1;
ds_grid_resize(dg_pal_seq, (++_idx)+1,ds_grid_height(dg_pal_seq));
dg_pal_seq[#_idx,0] = build_pal(C_WHT1,C_ORG3,C_WHT1,C_BLK1,-2,-2,-2,-2); // 
dg_pal_seq[#_idx,1] = build_pal(C_WHT1,C_ORG2,C_WHT1,C_BLK1,-2,-2,-2,-2); // 
dg_pal_seq[#_idx,2] = build_pal(C_WHT1,C_ORG1,C_WHT1,C_BLK1,-2,-2,-2,-2); // 
dg_pal_seq[#_idx,3] = build_pal(C_WHT1,C_ORG1,C_WHT1,C_BLK1,-2,-2,-2,-2); // 

pal_seq_idx2 = 0;









// ---------------------------------------------------------------------------
// Palette index sequences
_datakey1 = STR_Palette+STR_Index;
dg_PI_SEQ = ds_grid_create($10,$04);
ds_grid_clear(dg_PI_SEQ, PI_ERR0);
//                                      //
// $00: PC stun
dg_PI_SEQ[#$00,0] = global.PI_PC1;
dg_PI_SEQ[#$00,1] = global.PI_MOB_ORG;
dg_PI_SEQ[#$00,2] = global.PI_MOB_RED;
dg_PI_SEQ[#$00,3] = global.PI_MOB_BLU;
//                                      //
// $01: Cucco stun. These will be given permuts in PC_Room_Start()
dg_PI_SEQ[#$01,0] = global.PI_CUCCO1;
dg_PI_SEQ[#$01,1] = dg_PI_SEQ[#$00,1];
dg_PI_SEQ[#$01,2] = dg_PI_SEQ[#$00,2];
dg_PI_SEQ[#$01,3] = dg_PI_SEQ[#$00,3];
//                                      //
// $04: PC spell flash
dg_PI_SEQ[#$04,0] = global.PI_SPELL_PC3; // Dark
dg_PI_SEQ[#$04,1] = global.PI_SPELL_PC1; // Light
dg_PI_SEQ[#$04,2] = global.PI_SPELL_PC2; // Mid
dg_PI_SEQ[#$04,3] = global.PI_SPELL_PC1; // Light
//                                      //
// $05: Cucco spell flash. These will be given permuts in PC_Room_Start()
dg_PI_SEQ[#$05,0] = dg_PI_SEQ[#$04,0]; // Dark
dg_PI_SEQ[#$05,1] = dg_PI_SEQ[#$04,1]; // Light
dg_PI_SEQ[#$05,2] = dg_PI_SEQ[#$04,2]; // Mid
dg_PI_SEQ[#$05,3] = dg_PI_SEQ[#$04,3]; // Light
//                                      //
// $08: Barrier
dg_PI_SEQ[#$08,0] = global.PI_GUI1    + PI_DRK1;
dg_PI_SEQ[#$08,1] = global.PI_MOB_PUR + PI_DRK1;
dg_PI_SEQ[#$08,2] = dg_PI_SEQ[#$08,0];
dg_PI_SEQ[#$08,3] = dg_PI_SEQ[#$08,1];
//                                      //










// ---------------------------------------------------------------------------
// FALLING SCENE  ----------------------------------
var _FALL_SPEED_DEFAULT = 2;
var _STRIPE_W = 8;
_current_type_ = "1";
global.FallScene_IS_SURFACE = true;
global.FallScene_dm = ds_map_create();
global.FallScene_dm[?"_Stripe"+STR_Width] = _STRIPE_W;
global.FallScene_dm[?STR_Current+STR_Type] = string(_current_type_); // Which fall scene will occur. 1: Vertical, 2: Horizontal
//global.FallScene_dm[?STR_Current+STR_Type] = g.FallScene_BIT_DOWN|g.FallScene_BIT_UP;
global.FallScene_dm[?STR_Current+STR_Fall+STR_Direction] = $4; // $1: RIGHT, $2: LEFT, $4: DOWN, $8: UP
global.FallScene_dm[?STR_Counter] = 1;
global.FallScene_dm[?STR_Fall+STR_Speed+STR_Default] = _FALL_SPEED_DEFAULT; // OG: 2


// 1: Vertical
_type=1; _type_=string(_type);
_num = 0;
global.FallScene_dm[?_type_+STR_Color+hex_str(++_num)] = C_CYN3;
global.FallScene_dm[?_type_+STR_Color+hex_str(++_num)] = C_CYN4;
global.FallScene_dm[?_type_+STR_Color+hex_str(++_num)] = C_CYN2;
global.FallScene_dm[?_type_+STR_Color+STR_Count] = _num; // How many stripe colors there will be
global.FallScene_dm[?_type_+STR_Image] = -1;
global.FallScene_dm[?_type_+STR_Image+STR_Width]   = viewW();
global.FallScene_dm[?_type_+STR_Image+STR_Height]  =     (viewH() div _STRIPE_W) * _STRIPE_W;
global.FallScene_dm[?_type_+STR_Image+STR_Height] += sign(viewH() mod _STRIPE_W) * _STRIPE_W;
global.FallScene_dm[?_type_+STR_Fall+STR_Speed]    = global.FallScene_dm[?STR_Fall+STR_Speed+STR_Default];
_num = 0;
global.FallScene_dm[?_type_+dk_PI+hex_str(++_num)+STR_Color+STR_Order] = "RBWGMKYC";
global.FallScene_dm[?_type_+dk_PI+hex_str(  _num)+"_Parent"]           = global.PI_BGR1;
global.FallScene_dm[?_type_+dk_PI+hex_str(  _num)+STR_Name]            = "fall scene 1a";
global.FallScene_dm[?_type_+dk_PI+hex_str(++_num)+STR_Color+STR_Order] = "BWRGKYMC";
global.FallScene_dm[?_type_+dk_PI+hex_str(  _num)+"_Parent"]           = global.PI_BGR1;
global.FallScene_dm[?_type_+dk_PI+hex_str(  _num)+STR_Name]            = "fall scene 1b";
global.FallScene_dm[?_type_+dk_PI+hex_str(++_num)+STR_Color+STR_Order] = global.PAL_BASE_COLOR_ORDER;
global.FallScene_dm[?_type_+dk_PI+hex_str(  _num)+"_Parent"]           = global.PI_BGR1;
global.FallScene_dm[?_type_+dk_PI+hex_str(  _num)+STR_Name]            = "fall scene 1c";
global.FallScene_dm[?_type_+dk_PI+STR_Count] = _num;

// 2: Horizontal
_type++; _type_=string(_type);
_num = 0;
global.FallScene_dm[?_type_+STR_Color+hex_str(++_num)] = C_RED3;
global.FallScene_dm[?_type_+STR_Color+hex_str(++_num)] = C_RED4;
global.FallScene_dm[?_type_+STR_Color+hex_str(++_num)] = C_RED2;
global.FallScene_dm[?_type_+STR_Color+STR_Count] = _num; // How many stripe colors there will be
global.FallScene_dm[?_type_+STR_Image] = -1;
global.FallScene_dm[?_type_+STR_Image+STR_Width]   =     (viewW() div _STRIPE_W) * _STRIPE_W;
global.FallScene_dm[?_type_+STR_Image+STR_Width]  += sign(viewW() mod _STRIPE_W) * _STRIPE_W;
global.FallScene_dm[?_type_+STR_Image+STR_Height]  = viewH();
global.FallScene_dm[?_type_+STR_Fall+STR_Speed]    = round(val(global.FallScene_dm[?_current_type_+STR_Fall+STR_Speed],_FALL_SPEED_DEFAULT) + (val(global.FallScene_dm[?_current_type_+STR_Fall+STR_Speed],_FALL_SPEED_DEFAULT) * (viewH()/viewW())));
_num = 0;
global.FallScene_dm[?_type_+dk_PI+hex_str(++_num)+STR_Color+STR_Order] = "RBWGMKYC";
global.FallScene_dm[?_type_+dk_PI+hex_str(  _num)+"_Parent"]           = global.PI_MOB_PUR;
global.FallScene_dm[?_type_+dk_PI+hex_str(  _num)+STR_Name]            = "fall scene 2a";
global.FallScene_dm[?_type_+dk_PI+hex_str(++_num)+STR_Color+STR_Order] = "BWRGKYMC";
global.FallScene_dm[?_type_+dk_PI+hex_str(  _num)+"_Parent"]           = global.PI_MOB_PUR;
global.FallScene_dm[?_type_+dk_PI+hex_str(  _num)+STR_Name]            = "fall scene 2b";
global.FallScene_dm[?_type_+dk_PI+hex_str(++_num)+STR_Color+STR_Order] = global.PAL_BASE_COLOR_ORDER;
global.FallScene_dm[?_type_+dk_PI+hex_str(  _num)+"_Parent"]           = global.PI_MOB_PUR;
global.FallScene_dm[?_type_+dk_PI+hex_str(  _num)+STR_Name]            = "fall scene 2c";
global.FallScene_dm[?_type_+dk_PI+STR_Count] = _num;

global.FallScene_dm[?STR_Type+STR_Count] = _type;


global.FallScene_dm[?STR_Current+STR_Image]            = global.FallScene_dm[?_current_type_+STR_Image];
global.FallScene_dm[?STR_Current+STR_Image+STR_Width]  = 0;
global.FallScene_dm[?STR_Current+STR_Image+STR_Height] = 0;
global.FallScene_dm[?STR_Current+STR_Fall+STR_Speed]   = global.FallScene_dm[?_current_type_+STR_Fall+STR_Speed];
global.FallScene_dm[?STR_Base+dk_PI] = global.PI_BGR1; // 
global.FallScene_dm[?STR_Current+dk_PI] = 0; // 0484
global.FallScene_dm[?dk_PI+STR_Sequence+STR_Index] = 0;

global.FallScene_dm[?STR_PC+dk_can_draw] = false;
global.FallScene_dm[?STR_PC+dk_PI] = global.PI_PC1;
global.FallScene_dm[?STR_Base   +"_Y"]  = $20; // OG: $10
global.FallScene_dm[?STR_Current+"_y"]  = 0;

global.FallScene_dm[?STR_Base   +"_X"]  = (viewW_()-viewH_()) + global.FallScene_dm[?STR_Base+"_Y"];
global.FallScene_dm[?STR_Base   +"_X"] -= $06<<3;
global.FallScene_dm[?STR_Current+"_x"]  = 0;

global.FallScene_dm[?STR_Current+STR_ScaleX] = 1;


ds_list_copy(_dl, dl_BASE_COLORS);
for(_i=val(global.FallScene_dm[?STR_Type+STR_Count])-1; _i>=0; _i--)
{
    _type_ = string(_i+1);
    for(_j=0; _j<global.COLORS_PER_PALETTE; _j++)
    {
        _dl[|_j] = val(global.FallScene_dm[?_type_+STR_Color+hex_str(_j+1)], dl_BASE_COLORS[|_j]);
    }
    global.FallScene_dm[?_type_+STR_Palette] = build_pal(_dl[|0],_dl[|1],_dl[|2],_dl[|3], _dl[|4],_dl[|5],_dl[|6],_dl[|7]);
}

//global.FallScene_dm[?STR_Current+STR_Palette] = global.FallScene_dm[?_current_type_+STR_Palette];














// ---------------------------------------------------------------------------
var _layer_name="";
var _tile_was_found, _tsrc;
var _CLM_SHIFT = 5; // 32. Palette groups are aligned to left edge of each scene section/map-page
var _ROW_SHIFT = 3; // 08. A palette group every 8 rows

var _dm_data = undefined;
//var _dm_data = ds_map_create();
var _dm_layers;
var _dl_layers;
var _dl_tiles;

var           _COUNT0=2;
for(_i=1; _i<=_COUNT0; _i++) // each file
{
    _file_name = "other/"+"RandoPalettes"+hex_str(_i)+".json";
    //sdm("_file "+_file+", file_exists(_file) "+string(file_exists(_file)));
    if(!file_exists(_file_name)) continue;
    
        _data  = "";
        _file  = file_text_open_read(_file_name);
    while(      !file_text_eof(   _file)) 
    {   _data += file_text_readln(_file);  }
                 file_text_close( _file);
    if (is_undefined(_data)) continue;
    
    
    //ds_map_clear(_dm_data);
    _dm_data = json_decode(_data);
    if (_dm_data!=-1)
    {
        _dl_layers = _dm_data[?"layers"];
        if (is_undefined(_dl_layers)) continue;
        
        
                     _count = ds_list_size(_dl_layers);
        for(_j=0; _j<_count; _j++) // each layer
        {
            _dm_layers  =     _dl_layers[|_j];
            _layer_name = val(_dm_layers[?"name"], "");
            if (string_pos("palette",_layer_name)) break;
        }
        if(!string_pos("palette",_layer_name)) continue;
        
        
        
        
        _dl_tiles = _dm_layers[?"data"];
        var _CLMS = _dm_data[?"width"];
        var _ROWS = _dm_data[?"height"];
        if (is_undefined(_dl_tiles) 
        ||  is_undefined(_CLMS) 
        ||  is_undefined(_ROWS) )
        {
            continue;
        }
        
        
        
        var _CLMS0 = _CLMS>>_CLM_SHIFT;
        var _ROWS0 = _ROWS>>_ROW_SHIFT;
        var          _COUNT1 = _CLMS0*_ROWS0;
        for(_j=0; _j<_COUNT1; _j++) // each palette_group(_j)
        {
            _clm0 = (_j mod _CLMS0) <<_CLM_SHIFT;
            _row0 = (_j div _CLMS0) <<_ROW_SHIFT;
            
            for(_k=0; _k<($1<<_CLM_SHIFT); _k++) // each palette(_k) of the palette_group(_j)
            {
                _c_wht = C_WHT0;
                _c_red = C_RED0;
                _c_blu = C_BLU0;
                _c_grn = C_GRN0;
                _c_ylw = C_YLW0;
                _c_mgn = C_MGN0;
                _c_blk = C_BLK0;
                _c_cyn = C_CYN0;
                
                _palette = "";
                _color = "";
                _tile_was_found = false;
                
                _clm = _clm0+_k;
                
                for(_m=1; _m<=3; _m++) // each color(_m) of the palette(_k). Because the palettes in the file are in the old format, which are only for wht,red,blu, _m only iterates 1,2,3
                {
                    _base_color_char = string_char_at(global.PAL_BASE_COLOR_ORDER,_m);
                    _row = _row0+_m;
                    
                        _idx  = (_row*_CLMS) + _clm;
                        _tsrc = _dl_tiles[|_idx];
                    if (_tsrc!=0) // 0 means no tile here
                    {
                        _tile_was_found = true;
                        _tsrc--; // because Tiled adds 1
                        _tsrc  = abs(_tsrc&$3FFFFFFF); // just incase x or y flipped
                        _tsrc &= $FF;
                        _color = color_str(dl_COLOR[|_tsrc]);
                    }
                    else
                    {
                        _k=_CLMS*_ROWS; // move on to next palette_group(_j)
                        break;//_m
                    }
                    
                    switch(_base_color_char){
                    case "W":{_c_wht=_color; break;}
                    case "R":{_c_red=_color; break;}
                    case "B":{_c_blu=_color; break;}
                    case "G":{_c_grn=_color; break;}
                    case "Y":{_c_ylw=_color; break;}
                    case "M":{_c_mgn=_color; break;}
                    case "K":{_c_blk=_color; break;}
                    case "C":{_c_cyn=_color; break;}
                    }
                }
                
                if (_tile_was_found)
                {
                    // because the palettes in the file are in the old format, which are only for wht,red,blu, grn uses C_BLK1 and ylw,mgn,blk,cyn just use what wht,red,blu,grn use
                    _c_grn = C_BLK1;
                    _c_ylw = _c_wht;
                    _c_mgn = _c_red;
                    _c_blk = _c_blu;
                    _c_cyn = _c_grn;
                    
                    _palette = build_pal(_c_wht,_c_red,_c_blu,_c_grn, _c_ylw,_c_mgn,_c_blk,_c_cyn);
                    
                    switch(_i){
                    case 1:{ds_list_add(dl_various_pals1,_palette); break;}
                    case 2:{ds_list_add(dl_various_pals2,_palette); break;}
                    }
                    /*switch(_i){
                    case 1:{sdm("dl_various_pals1[|$"+hex_str(ds_list_size(dl_various_pals1)-1)+"] = "+_palette); break;}
                    case 2:{sdm("dl_various_pals2[|$"+hex_str(ds_list_size(dl_various_pals2)-1)+"] = "+_palette); break;}
                    }*/
                    //sdm("dl_various_pals[|$"+hex_str(ds_list_size(dl_various_pals)-1)+"] = "+_palette);
                }
            }//_k
        }//_j
        
        ds_map_destroy(_dm_data); _dm_data=undefined;
    }
}//_i

//ds_map_destroy(_dm_data); _dm_data=undefined;




/* // *** Turning this off because rando seems to be picking them too often
// This adds a bunch of extra palettes with a black mid-tone.
ds_list_clear(_dl);

var _dl_COLORS1=ds_list_create();
ds_list_add(_dl_COLORS1, CI_BLK1_,CI_GRY4_,CI_CYN4_,CI_GRB4_,CI_YGR4_,CI_YLW4_,CI_ORG4_,CI_BLU4_,CI_VLT4_);

var _dl_COLORS2=ds_list_create();
ds_list_add(_dl_COLORS2, CI_BLK1_,CI_GRY4_,CI_CYN4_,CI_GRB4_,CI_YGR4_,CI_YLW4_,         CI_BLU4_,CI_VLT4_);

for(_i=0; _i<=1; _i++)
{
    switch(_i){
    case 0:{ds_list_copy(_dl,dl_various_pals1); break;}
    case 1:{ds_list_copy(_dl,dl_various_pals2); break;}
    }
    
    for(_j=ds_list_size(_dl)-1; _j>=0; _j--)
    {
        _val  = _dl[|_j];
        _ci1  = string_copy(_val,1,2);
        _ci2  = string_copy(_val,3,2);
        _ci3  = string_copy(_val,5,2);
        _ci4  = string_copy(_val,7,2);
        _val1 = _ci1 + _ci2 + _ci4 + _ci3;
        _val2 = _ci1 + _ci3 + _ci4 + _ci2;
        _val3 = _ci1 + _ci4 + _ci3 + _ci2;
        
        switch(_i)
        {
            case 0:{//====================================================
            if (ds_list_find_index(dl_various_pals1,_val1)==-1)
            {   ds_list_add(       dl_various_pals1,_val1);  }
            
            if (_ci3==CI_BLK1_ 
            ||  _ci4==CI_BLK1_ )
            {
                if (_ci3==CI_BLK1_) _val = _val2;
                else                _val = _val3;
                if (ds_list_find_index(dl_various_pals1,_val)==-1)
                {   ds_list_add(       dl_various_pals1,_val);  }
            }
            break;}//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
            
            
            case 1:{//====================================================
            var _colors, _pal;
            var _COLORS = CI_BLK1_ + CI_GRY4_ + CI_CYN4_ + CI_GRB4_ + CI_YGR4_ + CI_YLW4_ + CI_BLU4_ + CI_VLT4_; // darkest colors
            var         _dl_PALS=ds_list_create();
            ds_list_add(_dl_PALS, _val1,_val2,_val3);
            
            for(_k=ds_list_size(_dl_PALS)-1; _k>=0; _k--)
            {
                _pal = _dl_PALS[|_k];
                    _color1 = string_copy(_pal,5,2); // midtone
                    _color2 = string_copy(_pal,7,2); // shadow
                if (_color1==CI_BLK1_ 
                ||  _color2==CI_BLK1_ )
                {
                    if (string_pos(_color1,_COLORS) 
                    ||  string_pos(_color2,_COLORS) )
                    {
                        if (ds_list_find_index(dl_various_pals2,_pal)==-1)
                        {   ds_list_add(       dl_various_pals2,_pal);  }
                    }
                }
            }
            
            ds_list_destroy(_dl_PALS); _dl_PALS=undefined;
            break;}//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        }//switch(_i)
    }
}
ds_list_destroy(_dl_COLORS1); _dl_COLORS1=undefined;
ds_list_destroy(_dl_COLORS2); _dl_COLORS2=undefined;
*/








// ---------------------------------------------------------------------------
// This will load palette data from `PaletteData01.txt` or initialize it if it doesn't exist
p_init_palette_data();




// ---------------------------------------------------------------------------
instance_create(0,0, PaletteEditor);




// ---------------------------------------------------------------------------
shader_set(shd_pal_swapper);
shader_set_uniform_f(shader_get_uniform(shd_pal_swapper,"ALPHA0_COLOR"), ((global.C_ALPHA0>>$10)&$FF)/$FF, ((global.C_ALPHA0>>$08)&$FF)/$FF, ((global.C_ALPHA0>>$00)&$FF)/$FF);
shader_reset();




// ---------------------------------------------------------------------------
//dev_list_tile_liquid_layers();


/*
// List all Tiled files that use the 8-color palette system
var _dm0,_dm1, _dl0;
for(_i=ds_list_size(g.dl_AREA_NAME)-1; _i>=0; _i--) // each area
{
    for(_j=0; _j<$100; _j++) // num of possible scenes in this area
    {
        _file_name = string_letters(g.dl_AREA_NAME[|_i])+"_"+string_repeat("0",3-string_length(string(_j))) + string(_j); // _file_name example: PalcA_003
        _file = "rm_tile_data/"+string_letters(g.dl_AREA_NAME[|_i])+"/"+_file_name+".json"; // _file example: "rm_tile_data/PalcA/PalcA_003.json"
        if (file_exists(_file))
        {
                _file  = file_text_open_read(_file);
                _data  = "";
            while(      !file_text_eof(   _file)) 
            {   _data += file_text_readln(_file);  }
                         file_text_close( _file);
            _dm0 = json_decode(_data);
            
            _dl0 = _dm0[?"layers"];
            if(!is_undefined(_dl0))
            {
                for(_k=ds_list_size(_dl0)-1; _k>=0; _k--) // each layer
                {
                    _dm1 = _dl0[|_k];
                    _val = val(_dm1[?"name"], "");
                    if (string_pos("tile_data_system", _val))
                    {
                        _val1 = str_hex(string_copy(_val, string_pos("v.", _val)+2, 2));
                        if (_val1==4) sdm(_file_name);
                        break;//_k
                    }
                }
            }
            
            ds_map_destroy(_dm0); _dm0=undefined;
        }
    }
}
TownA_005
TownA_010
TownA_011
TownA_012
TownA_017
TownA_110
TownA_121
TownA_122
TownA_123
TownA_129
TownA_130
TownA_255
MazIs_003
EastA_100
*/




// ---------------------------------------------------------------------------
ds_list_destroy(_dl); _dl=undefined;




