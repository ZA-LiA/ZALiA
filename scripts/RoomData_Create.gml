/// RoomData_Create()

if (DEV)
{
    var _START_TIME = current_time;
    repeat(1) show_debug_message("");
    show_debug_message("RoomData_Create() START");
}


var _file, _encoded;


FILE_NAME0 = "SceneData01.txt";
//FILE_NAME1 = FILE_NAME0;
FILE_NAME1 = "rm_tile_data/"+FILE_NAME0;


FILE2_NAME0 = "SceneWallData01.txt";
FILE2_NAME1 = "rm_tile_data/"+FILE2_NAME0;




QUICK_REINITIALIZE = false;
var _REINITIALIZING = false; // *** SET true WHEN ANY OF THIS DATA HAS CHANGED. BUT UPDATE OVERWORLD DATA FIRST IF IT NEEDS TO BE UPDATED ***
if(!_REINITIALIZING 
&& !QUICK_REINITIALIZE )
{
    if (file_exists(FILE2_NAME1))
    {
        _file    = file_text_open_read(FILE2_NAME1);
        _encoded = file_text_read_string(_file);
                   file_text_close(      _file);
        var _dm_SCENE_WALL_FILE_DATA = json_decode(_encoded);
        if (_dm_SCENE_WALL_FILE_DATA==-1) // `json_decode` returns -1 if it fails
        {
            show_debug_message("!!!! WARNING! RoomData_Create(). `_dm_SCENE_WALL_FILE_DATA` failed to get data from file '"+FILE2_NAME1+"' !!!!");
        }
        else
        {
            var _SCENE_WALL_PART_DATA = _dm_SCENE_WALL_FILE_DATA[?"scene_wall_data"];
            if(!is_undefined(_SCENE_WALL_PART_DATA)) ds_map_read(global.dm_scene_wall_data, _SCENE_WALL_PART_DATA);
            ds_map_destroy(_dm_SCENE_WALL_FILE_DATA); _dm_SCENE_WALL_FILE_DATA=undefined;
        }
    }
    else
    {
        show_debug_message("!!!! WARNING! RoomData_Create(). file '"+FILE2_NAME1+"' does not exist !!!!");
    }
    
    
    
    
    if (file_exists(FILE_NAME1))
    {
        RoomData_Create_3(); // get and set data for `g.dm_rm`, `g.dm_spawn`, `g.dm_dungeon`, ...
        
        if (DEV)
        {
            show_debug_message("RoomData_Create() END1. "+string(current_time-_START_TIME));
            repeat(1) show_debug_message("");
        }
        
        //dev_find_scenes_using_certain_tiles();
        instance_destroy();
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}








// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
var _i,_j,_k,_m, _idx, _num, _val, _len, _count;
var _clms,_rows, _clm,_row;
var _str, _dk;
var _scene_name;
var _debug_str;


dl_used_tiled_files = ds_list_create();
//dm_overworld = ds_map_create();
dm_palette = ds_map_create();
dm_audio = ds_map_create();
dm_rando_hints = ds_map_create();
dm_rando_enemy = ds_map_create();
//dm_pbags = ds_map_create();
//dm_1ups = ds_map_create();
//dm_door_keys = ds_map_create();
//dm_magic_jars = ds_map_create();


DIST1 = ($08<<3)+4; // for torhes. common dist from rm edge
DIST2 = ($03<<3)+4; // for torhes. common dist left  from elevator center
DIST3 = DIST2-8;    // for torhes. common dist right from elevator center


rm_num  = undefined;
rm_num_ = undefined; // hex-string of rm_num
rm_name = undefined;
rm      = rm_name; // rm: short-hand for rm_name
page    = 0;
pages_x = 1;
pages_y = 1;
pages   = pages_x * pages_y;

rm_w    = pages_x<<8;
rm_h    = pages_y<<8;
rm_w_   = rm_w>>1;
rm_h_   = rm_h>>1;

CLM0    = -PAGE_CLMS; // 
CLM1    =  $00; // 
CLM2    = -$02; // left exit clm
CLM3    =  $02; // left enter pc spawn clm
CLM4    =  $11;      //  PC spawn x - Encounter, 
CLM5    =  CLM4+$20; //  PC spawn x - Encounter, Bagu Woods, 
CLM6    =  CLM5+$20; //  PC spawn x - 
CLM7    =  CLM6+$20; //  PC spawn x - 
CLM8    =  $00; // 
CLM9    =  $00; // 
//                      //
Clm0    =  $00; // 
Clm1    =  $00; // 
Clm2    =  $00; // 
Clm3    =  $00; // 
Clm4    =  $00; // 
Clm5    =  $00; // 
Clm6    =  $00; // 
Clm7    =  $00; // 
Clm8    =  $00; // 
Clm9    =  $00; // 
//                      //
clm0    =  $00; // 
clm1    =  $00; // 
clm2    =  $00; // 
clm3    =  $00; // 
clm4    =  $00; // 
clm5    =  $00; // 
clm6    =  $00; // 
clm7    =  $00; // 
clm8    =  $00; // 
clm9    =  $00; // 
clmA    =  $00; // 
clmB    =  $00; // 
clmC    =  $00; // 
clmD    =  $00; // 
clmE    =  $00; // 
clmF    =  $00; // 
//                      //
CLMS0   =  PAGE_CLMS<<1; // 
CLMS1   =  PAGE_CLMS; // 
CLMS2   =  $02; // 
CLMS3   =  $04; // 
CLMS4   =  $08; // 
CLMS5   =  $20; // 
CLMS6   =  $00; // 
CLMS7   =  $00; // 
CLMS8   =  $00; // 
CLMS9   =  $00; // 
//                      //
clms0   =  rm_w>>3; // 
clms1   =  clms0 + CLMS0; // 
clms2   =  $00; // 
clms3   =  $00; // 
clms4   =  $00; // 
clms5   =  $00; // 
clms6   =  $00; // 
clms7   =  $00; // 
clms8   =  $00; // 
clms9   =  $00; // 
//                      //
CLMT0   =  $08; // Torch clm left exit
clmt0   =  $00; // Torch clm right exit
clmt1   =  $00; // Torch clm 
//                      //
//                      //
//                      //
//                      //
ROW0    = -PAGE_ROWS; // 
ROW1    =  $00; // 
ROW2    =  $00; // 
ROW3    =  $00; // 
ROW4    =  $00; // 
ROW5    =  $00; // 
ROW6    =  $00; // 
ROW7    =  $00; // 
ROW8    =  $00; // 
ROW9    =  $00; // 
//                      //
ROWE0   = -$0F;
ROWE1   =  $05;
//                      //
Row0    =  $00; // 
Row1    =  $00; // 
Row2    =  $00; // 
Row3    =  $00; // 
Row4    =  $00; // 
Row5    =  $00; // 
Row6    =  $00; // 
Row7    =  $00; // 
Row8    =  $00; // 
Row9    =  $00; // 
//                      //
row0    =  $00; // 
row1    =  $00; // 
row2    =  $00; // 
row3    =  $00; // 
row4    =  $00; // 
row5    =  $00; // 
row6    =  $00; // 
row7    =  $00; // 
row8    =  $00; // 
row9    =  $00; // 
rowA    =  $00; // 
//                      // 
ROWS0   =  PAGE_ROWS<<1;
ROWS1   =  PAGE_ROWS;
ROWS2   =  $04; // $20. middle
ROWS3   =  $02; // $10. top/btm
ROWS4   =  $06; // $30. pipe exit h 1
ROWS5   =  $10; // $80. Elev exit h
ROWS6   =  (viewH()>>3) * 3; // $2A0. 3 cam heights. side
ROWS7   =  ($03<<8)>>3; // 3 map pages
ROWS8   =  $00;
ROWS9   =  $00;
//                      //
rows0   =  rm_h>>3; // 
rows1   =  rows0 + ROWS0; // 
rows2   =  $00; // 
rows3   =  $00; // 
rows4   =  $00; // 
rows5   =  $00; // 
rows6   =  $00; // 
rows7   =  $00; // 
rows8   =  $00; // 
rows9   =  $00; // 
rowsA   =  $00; // 
//                      //
ROWS_E0 =  $10; // Elevator exit row count
row_e0  =  $00; // Elevator exit up   top row
row_e1  =  $00; // Elevator exit up   pc spawn row
row_e2  =  $00; // Elevator exit down top row
row_e3  =  $00; // Elevator exit down pc spawn row
row_e4  =  $00; // Pit exit up PC spawn row
row_e5  =  $00; // Elevator spawn row 1
//                      //
//                      //
//                      //
w0      = 0; // width
w1      = 0; // width
w2      = 0; // width
w3      = 0; // width
w4      = 0; // width
w5      = 0; // width
w6      = 0; // width
w7      = 0; // width
w8      = 0; // width
w9      = 0; // width
//                      //
h0      = 0; // height
h1      = 0; // height
h2      = 0; // height
h3      = 0; // height
h4      = 0; // height
h5      = 0; // height
h6      = 0; // height
h7      = 0; // height
h8      = 0; // height
h9      = 0; // height
//                      //
x0      = 0; // 
x1      = 0; // 
x2      = 0; // 
x3      = 0; // 
x4      = 0; // 
x5      = 0; // 
x6      = 0; // 
x7      = 0; // 
x8      = 0; // 
x9      = 0; // 
//                      //
//XT0     = (CLMT0<<3)+4; // Torch x. Left exit
xt0     = 0; // Torch x. Right exit
xt1     = 0; // Torch x. Right exit
//                      //
//                      //
y0      = 0; // 
y1      = 0; // 
y2      = 0; // 
y3      = 0; // 
y4      = 0; // 
y5      = 0; // 
y6      = 0; // 
y7      = 0; // 
y8      = 0; // 
y9      = 0; // 
//                      //
//                      //
//                      //
//                      //
//                      //






CRYSTALHOLDER_XL = ($70<<3)-4;
CRYSTALHOLDER_YT =  $16<<3;






owrc0 = 0; // OverWorld RowClm
owrc1 = 0; // OverWorld RowClm
owrc2 = 0; // OverWorld RowClm
owrc3 = 0; // OverWorld RowClm
owrc4 = 0; // OverWorld RowClm

// For orientation of PC char in pause menu map of ow.
ow_axis = 0; // ow_axis bits: $0:horizontal, $1:vertical, $2:flip x/yscale




//MUS_OW1       = STR_Overworld+'01';
//MUS_TOWN1     = STR_Town;
MUS_HOUSE1    = STR_House+'01';
MUS_BASEMENT1 = STR_Basement+'01';
MUS_THEWILD   = STR_Battle+'01';
MUS_DUNGEON1  = STR_Dungeon+'01';
mus0          = 0;
mus1          = 0;




COLOR0_ = color_str(p.C_GRY4);
COLOR1_ = color_str(p.C_BLK1);
COLOR2_ = color_str(p.C_VLT2); // Violet/Blue. Town sky
COLOR3_ = color_str(p.C_BLU2); // Blue.      Field encounter sky
COLOR4_ = color_str(p.C_PUR3); // Purple.    Cemetary sky
COLOR5_ = color_str(p.C_BLU4); // Dark blue. Old Kasuto sky
COLOR6_ = color_str(p.C_MGN3);
COLOR7_ = color_str(p.C_BLU3);
COLOR8_ = color_str(p.C_VLT4); // $8C1824; $01 Violet.      Darkest
//                              //
/*
COLOR0  = $2D;       // '2D' Dark Grey
COLOR0_ = hex_str(COLOR0);
//                              //
COLOR1  = p.CI_BLK1; // '0D' Black
COLOR1_ = hex_str(COLOR1);
//                              //
COLOR2  = p.CI_VLT2; // '22' Violet/Blue. Town sky
COLOR2_ = hex_str(COLOR2);
//                              //
COLOR3  = p.CI_BLU2; // '21' Blue.      Field encounter sky
COLOR3_ = hex_str(COLOR3);
//                              //
COLOR4  = p.CI_PUR3; // '13' Purple.    Cemetary sky
COLOR4_ = hex_str(COLOR4);
//                              //
COLOR5  = p.CI_BLU4; // '02' Dark blue. Old Kasuto sky
COLOR5_ = hex_str(COLOR5);
//                              //
COLOR6  = p.CI_MGN3; // '14' Magenta.   ShadowBoss bg
COLOR6_ = hex_str(COLOR6);
//                              //
COLOR7  = p.CI_BLU3; // '11' Blue.      2nd darkest
COLOR7_ = hex_str(COLOR7);
//                              //
color0  = COLOR0;
color1  = COLOR1;
*/







// g.ENC_WEAK: $01
// g.ENC_STRG: $02
// g.ENC_FARY: $04
ENC_A1 = g.ENC_FARY | g.ENC_WEAK | g.ENC_STRG;
ENC_B1 = g.ENC_FARY | g.ENC_WEAK;


map_clms    = 0;
map_clm     = 0;
map_clm_rgt = 0;
map_clm_lft = 0;
map_clm_off = 0;

map_rows    = 0;
map_row     = 0;
map_row_btm = 0;
map_row_top = 0;
map_row_off = 0;

dungeon_map_tile_count = 0;

MAP_TSRC_BLANK = $FF;
// Single page rms
MAP_TSRC_A0  = $30;               //          0: 0 exits,     1: 1 exit RGT,  2: 1 exit BTM
MAP_TSRC_A1  = MAP_TSRC_A0 + $04; // 2 exits: 0: RGT-LFT,     1: BTM-TOP,     2: RGT-BTM
MAP_TSRC_A2  = MAP_TSRC_A1 + $04; // 3 exits: 0: RGT-LFT-BTM, 1: RGT-BTM-T0P
MAP_TSRC_A3  = MAP_TSRC_A2 + $04; // 4 exits: 0: 4 exits
/*
MAP_TSRC_A0  = $30;               //          0: 0 exits,     1: 4 exits,     2: 2 exits hor, 3: 2 exits ver
MAP_TSRC_A1  = MAP_TSRC_A0 + $04; // 1 exits: 0: RGT,         1: LFT,         2: BTM,         3: TOP
MAP_TSRC_A2  = MAP_TSRC_A1 + $04; // 2 exits: 0: RGT-BTM,     1: RGT-T0P,     2: LFT-BTM,     3: LFT-TOP
MAP_TSRC_A3  = MAP_TSRC_A2 + $04; // 3 exits: 0: LFT-BTM-TOP, 1: RGT-BTM-TOP, 2: RGT-LFT-TOP, 3: RGT-LFT-BTM
*/
//                                // 
// Hallway-Horizontal-End-RGT     // 
MAP_TSRC_B0  = MAP_TSRC_A0 + $10; //          0: 0 exits
MAP_TSRC_B1  = MAP_TSRC_B0 + $01; // 1 exits: 0: RGT,         1: BTM,         2: TOP
MAP_TSRC_B2  = MAP_TSRC_B1 + $03; // 2 exits: 0: RGT-BTM,     1: RGT-TOP,     2: BTM-TOP
MAP_TSRC_B3  = MAP_TSRC_B2 + $03; //          0: 3 exits
// Hallway-Horizontal-End-LFT     // 
MAP_TSRC_C0  = MAP_TSRC_B0 + $08; //          0: 0 exits
MAP_TSRC_C1  = MAP_TSRC_C0 + $01; // 1 exits: 0: LFT,         1: BTM,         2: TOP
MAP_TSRC_C2  = MAP_TSRC_C1 + $03; // 2 exits: 0: LFT-BTM,     1: LFT-TOP,     2: BTM-TOP
MAP_TSRC_C3  = MAP_TSRC_C2 + $03; //          0: 3 exits
//                                // 
// Hallway-Vertical-End-BTM       // 
MAP_TSRC_D0  = MAP_TSRC_B0 + $10; //          0: No exits
MAP_TSRC_D1  = MAP_TSRC_D0 + $01; // 1 exits: 0: RGT,         1: LFT,         2: BTM
MAP_TSRC_D2  = MAP_TSRC_D1 + $03; // 2 exits: 0: RGT-LFT,     1: RGT-BTM,     2: LFT-BTM
MAP_TSRC_D3  = MAP_TSRC_D2 + $03; //          0: 3 exits
// Hallway-Vertical-End-TOP       // 
MAP_TSRC_E0  = MAP_TSRC_D0 + $08; //          0: No exits
MAP_TSRC_E1  = MAP_TSRC_E0 + $01; // 1 exits: 0: RGT,         1: LFT,         2: TOP
MAP_TSRC_E2  = MAP_TSRC_E1 + $03; // 2 exits: 0: RGT-LFT,     1: RGT-TOP,     2: LFT-TOP
MAP_TSRC_E3  = MAP_TSRC_E2 + $03; //          0: 3 exits
//                                // 
// Hallway-Horizontal-Open        // 
MAP_TSRC_F0  = MAP_TSRC_D0 + $10; // 0: 0 exits, 1: BTM, 2: TOP, 3: BTM-TOP
// Hallway-Vertical-Open          // 
MAP_TSRC_F1  = MAP_TSRC_F0 + $04; // 0: 0 exits, 1: RGT, 2: LFT, 3: RGT-LFT
//                                // 
// Large rm-Wall-Single           // 
MAP_TSRC_G0  = MAP_TSRC_F0 + $08; // RGT: 0: 0 exit, 1: 1 exit
MAP_TSRC_G1  = MAP_TSRC_G0 + $02; // LFT: 0: 0 exit, 1: 1 exit
MAP_TSRC_G2  = MAP_TSRC_G1 + $02; // BTM: 0: 0 exit, 1: 1 exit
MAP_TSRC_G4  = MAP_TSRC_G2 + $02; // TOP: 0: 0 exit, 1: 1 exit
// Large rm-Corner                // 
MAP_TSRC_H0  = MAP_TSRC_F0 + $10; // RGT-BTM: 0: 0 exits, 1: RGT, 2: BTM, 3: RGT-BTM
MAP_TSRC_H1  = MAP_TSRC_H0 + $04; // RGT-TOP: 0: 0 exits, 1: RGT, 2: TOP, 3: RGT-TOP
MAP_TSRC_H2  = MAP_TSRC_H1 + $04; // LFT-BTM: 0: 0 exits, 1: LFT, 2: BTM, 3: RGT-BTM
MAP_TSRC_H3  = MAP_TSRC_H2 + $04; // LFT-TOP: 0: 0 exits, 1: LFT, 2: TOP, 3: LFT-TOP
//                                // 
// Elevator                       // 
MAP_TSRC_Z0  = MAP_TSRC_D0 + $10; // 0: Vertical, 1: Horizontal
MAP_TSRC_Z1  = MAP_TSRC_Z0 + $01; // 
//                                // 


dl_dungeon_map_clm = ds_list_create();
dl_dungeon_map_row = ds_list_create();
dm_dungeon_map_rc  = ds_map_create();




// ------------------------------
area    = undefined;
area_OA = Area_OvrwA; // Overworld A

area_WA = Area_WestA;
area_EA = Area_EastA;
area_DM = Area_DthMt;
area_MI = Area_MazIs;

area_PA = Area_PalcA;
area_PB = Area_PalcB;
area_PC = Area_PalcC;
area_PD = Area_PalcD;
area_PE = Area_PalcE;
area_PF = Area_PalcF;
area_PG = Area_PalcG;
area_PH = Area_PalcH;
area_PZ = Area_PalcZ;

area_TA = Area_TownA;
area_TB = Area_TownB;

town_num     = 0;
town_name    = undefined;
dungeon_num  = 0;
dungeon_name = undefined;

// the list index of p.dl_pal_dark_room.
dark_id = -1;


spawn_datakey=undefined;



// Falling Scene. The blue stripe w/ pc silouette falling when exiting through a pit
fall_scene_RT = g.FallScene_BIT_RIGHT; // Fall Right
fall_scene_LF = g.FallScene_BIT_LEFT;  // Fall Left
fall_scene_DW = g.FallScene_BIT_DOWN;  // Fall Down
fall_scene_UP = g.FallScene_BIT_UP;    // Fall Up





// MID. DOORWAY
                  _val = g.EXIT_DIR_MID;
EXM0    =         _val;
EXM0_   = hex_str(_val);
                  _val++;
EXM1    =         _val;
EXM1_   = hex_str(_val);
                  _val++;
EXM2    =         _val;
EXM2_   = hex_str(_val);
                  _val++;
EXM3    =         _val;
EXM3_   = hex_str(_val);
                  _val++;
EXM4    =         _val;
EXM4_   = hex_str(_val);
                  _val++;
EXM5    =         _val;
EXM5_   = hex_str(_val);
                  _val++;
EXM6    =         _val;
EXM6_   = hex_str(_val);
                  _val++;
EXM7    =         _val;
EXM7_   = hex_str(_val);
// RIGHT                // 
                  _val = g.EXIT_DIR_RIGHT;
EXR0    =         _val;
EXR0_   = hex_str(_val);
                  _val++;
EXR1    =         _val;
EXR1_   = hex_str(_val);
                  _val++;
EXR2    =         _val;
EXR2_   = hex_str(_val);
                  _val++;
EXR3    =         _val;
EXR3_   = hex_str(_val);
                  _val++;
EXR4    =         _val;
EXR4_   = hex_str(_val);
// LEFT                 // 
                  _val = g.EXIT_DIR_LEFT;
EXL0    =         _val;
EXL0_   = hex_str(_val);
                  _val++;
EXL1    =         _val;
EXL1_   = hex_str(_val);
                  _val++;
EXL2    =         _val;
EXL2_   = hex_str(_val);
                  _val++;
EXL3    =         _val;
EXL3_   = hex_str(_val);
                  _val++;
EXL4    =         _val;
EXL4_   = hex_str(_val);
// DOWN                 // 
                  _val = g.EXIT_DIR_DOWN;
EXD0    =         _val;
EXD0_   = hex_str(_val);
                  _val++;
EXD1    =         _val;
EXD1_   = hex_str(_val);
                  _val++;
EXD2    =         _val;
EXD2_   = hex_str(_val);
                  _val++;
EXD3    =         _val;
EXD3_   = hex_str(_val);
                  _val++;
EXD4    =         _val;
EXD4_   = hex_str(_val);
// UP                   // 
                  _val = g.EXIT_DIR_UP;
EXU0    =         _val;
EXU0_   = hex_str(_val);
                  _val++;
EXU1    =         _val;
EXU1_   = hex_str(_val);
                  _val++;
EXU2    =         _val;
EXU2_   = hex_str(_val);
                  _val++;
EXU3    =         _val;
EXU3_   = hex_str(_val);
                  _val++;
EXU4    =         _val;
EXU4_   = hex_str(_val);







// et: Exit Type
etA0 = g.EXIT_TYPE_STANDARD;    // $00. Standard. No condition to use exit
etA1 = etA0 | fall_scene_DW;            // include falling scene DOWNWARD
etA2 = etA0 | fall_scene_RT;            // include falling scene RIGHT
etA3 = etA0 | fall_scene_LF;            // include falling scene LEFT
etA4 = etA0 | g.EXIT_BIT_VERT1; // $04. Base g.pc_spawn_x is g.leave_rm_x for pit up exits
etA8 = etA0 | g.EXIT_BIT_WARP1; // $08. Don't reload rm. Warps to another exit in same rm.
etA9 = etA1 | g.EXIT_BIT_WARP1; // $09. Falling Scene 1 + Don't reload rm. Warps to another exit in same rm.

etB0 = g.EXIT_TYPE_DOOR;        // $10. Doorway
etB1 = etB0 | fall_scene_DW;            // include falling scene DOWNWARD
etB2 = etB0 | fall_scene_RT;            // include falling scene RIGHT
etB3 = etB0 | fall_scene_LF;            // include falling scene LEFT
etB8 = etB0 | g.EXIT_BIT_WARP1; // $18. Don't reload rm. Warps to another exit in same rm.
etBF = etB0 | g.EXIT_BIT_TELEPORT; // Fast travel exit.

etC0 = g.EXIT_TYPE_ELEVATOR;    // $20. Elevator
etC1 = etC0 | fall_scene_DW;            // include falling scene DOWNWARD
//etC4 = etC0 | 4;                // Elevator shaft. Elevator shares an exit on other end

etD0 = g.EXIT_TYPE_PIPE;        // $40. Pipe
etD1 = etD0 | fall_scene_DW;            // include falling scene DOWNWARD
etD8 = etD0 | g.EXIT_BIT_WARP1; // $48. Don't reload rm. Warps to another exit in same rm.

//etE0 = g.EXIT_TYPE_V1;          // Vertical 1. Means don't base spawn x off g.leave_rm_x


               _val = REEN_DEFAULT;
exit_name_m0 = _val;
exit_name_m1 = _val;
exit_name_m2 = _val;
exit_name_m3 = _val;
//                  //
exit_name_r0 = _val;
exit_name_r1 = _val;
exit_name_r2 = _val;
exit_name_r3 = _val;
//                  //
exit_name_l0 = _val;
exit_name_l1 = _val;
exit_name_l2 = _val;
exit_name_l3 = _val;
//                  //
exit_name_d0 = _val;
exit_name_d1 = _val;
exit_name_d2 = _val;
exit_name_d3 = _val;
//                  //
exit_name_u0 = _val;
exit_name_u1 = _val;
exit_name_u2 = _val;
exit_name_u3 = _val;
//                  //




dl_exit = ds_list_create();



cont_piece_count_hp = cont_piece_cnt_hp();
cont_piece_count_mp = cont_piece_cnt_mp();







// --------------------------------------------------------------------------------------------
// PI: Palette Index
PIa = global.PI_MOB_ORG; // 7.  orange
PIb = global.PI_MOB_RED; // 8.  red
PIc = global.PI_MOB_BLU; // 9.  blue/purple
PId = global.PI_MOB_PUR; // 10. purple/?
PIe = global.PI_BGR1; // 2.  
PIf = global.PI_BGR2; // 3.  
PIg = global.PI_BGR3; // 4.  
PIh = global.PI_BGR4; // 5.  
Sign_PI = global.PI_BGR3;





// --------------------------------------------------------------------------------------------
// DK: Dialogue Key

DK0000 = '00_00_'; // 
DK0001 = '00_01_'; // 
DK0002 = '00_02_'; // 
DK0003 = '00_03_'; // 
DK0004 = '00_04_'; // 
DK0005 = '00_05_'; // 
DK0006 = '00_06_'; // 
DK0007 = '00_07_'; // 
DK0008 = '00_08_'; // 
DK0009 = '00_09_'; // 
DK000A = '00_0A_'; // 
DK000B = '00_0B_'; // 
DK000C = '00_0C_'; // 
DK000D = '00_0D_'; // 
DK000E = '00_0E_'; // 
DK000F = '00_0F_'; // 
//                          //
DK0010 = '00_10_'; // 
DK0011 = '00_11_'; // 
DK0012 = '00_12_'; // 
DK0013 = '00_13_'; // 
DK0014 = '00_14_'; // 
DK0015 = '00_15_'; // 
DK0016 = '00_16_'; // 
DK0017 = '00_17_'; // 
DK0018 = '00_18_'; // 
DK0019 = '00_19_'; // 
DK001A = '00_1A_'; // 
DK001B = '00_1B_'; // 
DK001C = '00_1C_'; // 
DK001D = '00_1D_'; // 
DK001E = '00_1E_'; // 
DK001F = '00_1F_'; // 
//                          //
DK0020 = '00_20_'; // 
DK0021 = '00_21_'; // 
DK0022 = '00_22_'; // 
DK0023 = '00_23_'; // 
DK0024 = '00_24_'; // 
DK0025 = '00_25_'; // 
DK0026 = '00_26_'; // 
DK0027 = '00_27_'; // 
DK0028 = '00_28_'; // 
DK0029 = '00_29_'; // 
DK002A = '00_2A_'; // 
DK002B = '00_2B_'; // 
DK002C = '00_2C_'; // 
DK002D = '00_2D_'; // 
DK002E = '00_2E_'; // 
DK002F = '00_2F_'; // 
//                          //
DK0030 = '00_30_'; // 
DK0031 = '00_31_'; // 
DK0032 = '00_32_'; // 
DK0033 = '00_33_'; // 
DK0034 = '00_34_'; // 
DK0035 = '00_35_'; // 
DK0036 = '00_36_'; // 
DK0037 = '00_37_'; // 
DK0038 = '00_38_'; // 
DK0039 = '00_39_'; // 
DK003A = '00_3A_'; // 
DK003B = '00_3B_'; // 
DK003C = '00_3C_'; // 
DK003D = '00_3D_'; // 
DK003E = '00_3E_'; // 
DK003F = '00_3F_'; // 
//                          //
DK0040 = '00_40_'; // 
DK0041 = '00_41_'; // 
DK0042 = '00_42_'; // 
DK0043 = '00_43_'; // 
DK0044 = '00_44_'; // 
DK0045 = '00_45_'; // 
DK0046 = '00_46_'; // 
DK0047 = '00_47_'; // 
DK0048 = '00_48_'; // 
DK0049 = '00_49_'; // 
DK004A = '00_4A_'; // 
DK004B = '00_4B_'; // 
DK004C = '00_4C_'; // 
DK004D = '00_4D_'; // 
DK004E = '00_4E_'; // 
DK004F = '00_4F_'; // 
//                          //





DK0100 = '01_00_'; // 
DK0101 = '01_01_'; // 
DK0102 = '01_02_'; // 
DK0103 = '01_03_'; // 
DK0104 = '01_04_'; // 
DK0105 = '01_05_'; // 
DK0106 = '01_06_'; // 
DK0107 = '01_07_'; // 
DK0108 = '01_08_'; // 
DK0109 = '01_09_'; // 
DK010A = '01_0A_'; // 
DK010B = '01_0B_'; // 
DK010C = '01_0C_'; // 
DK010D = '01_0D_'; // 
DK010E = '01_0E_'; // 
DK010F = '01_0F_'; // 
//                          //
DK0110 = '01_10_'; // 
DK0111 = '01_11_'; // 
DK0112 = '01_12_'; // 
DK0113 = '01_13_'; // 
DK0114 = '01_14_'; // 
DK0115 = '01_15_'; // 
DK0116 = '01_16_'; // 
DK0117 = '01_17_'; // 
DK0118 = '01_18_'; // 
DK0119 = '01_19_'; // 
DK011A = '01_1A_'; // 
DK011B = '01_1B_'; // 
DK011C = '01_1C_'; // 
DK011D = '01_1D_'; // 
DK011E = '01_1E_'; // 
DK011F = '01_1F_'; // 
//                          //
DK0140 = '01_40_'; // 
DK0141 = '01_41_'; // 
DK0142 = '01_42_'; // 
DK0143 = '01_43_'; // 
DK0144 = '01_44_'; // 
DK0145 = '01_45_'; // 
DK0146 = '01_46_'; // 
DK0147 = '01_47_'; // 
DK0148 = '01_48_'; // 
DK0149 = '01_49_'; // 
DK014A = '01_4A_'; // 
DK014B = '01_4B_'; // 
DK014C = '01_4C_'; // 
DK014D = '01_4D_'; // 
DK014E = '01_4E_'; // 
DK014F = '01_4F_'; // 
//                          //







DK0200 = '02_00_'; // 
DK0201 = '02_01_'; // 
DK0202 = '02_02_'; // 
DK0203 = '02_03_'; // 
DK0204 = '02_04_'; // 
DK0205 = '02_05_'; // 
DK0206 = '02_06_'; // 
DK0207 = '02_07_'; // 
DK0208 = '02_08_'; // 
DK0209 = '02_09_'; // 
DK020A = '02_0A_'; // 
DK020B = '02_0B_'; // 
DK020C = '02_0C_'; // 
DK020D = '02_0D_'; // 
DK020E = '02_0E_'; // 
DK020F = '02_0F_'; // 
//                          //
DK0240 = '02_40_'; // 
DK0241 = '02_41_'; // 
DK0242 = '02_42_'; // 
DK0243 = '02_43_'; // 
DK0244 = '02_44_'; // 
DK0245 = '02_45_'; // 
DK0246 = '02_46_'; // 
DK0247 = '02_47_'; // 
DK0248 = '02_48_'; // 
DK0249 = '02_49_'; // 
DK024A = '02_4A_'; // 
DK024B = '02_4B_'; // 
DK024C = '02_4C_'; // 
DK024D = '02_4D_'; // 
DK024E = '02_4E_'; // 
DK024F = '02_4F_'; // 
//                          //





DK0300 = '03_00_'; // 
DK0301 = '03_01_'; // 
DK0302 = '03_02_'; // 
DK0303 = '03_03_'; // 
DK0304 = '03_04_'; // 
DK0305 = '03_05_'; // 
DK0306 = '03_06_'; // 
DK0307 = '03_07_'; // 
DK0308 = '03_08_'; // 
DK0309 = '03_09_'; // 
DK030A = '03_0A_'; // 
DK030B = '03_0B_'; // 
DK030C = '03_0C_'; // 
DK030D = '03_0D_'; // 
DK030E = '03_0E_'; // 
DK030F = '03_0F_'; // 
//                          //
DK0340 = '03_40_'; // 
DK0341 = '03_41_'; // 
DK0342 = '03_42_'; // 
DK0343 = '03_43_'; // 
DK0344 = '03_44_'; // 
DK0345 = '03_45_'; // 
DK0346 = '03_46_'; // 
DK0347 = '03_47_'; // 
DK0348 = '03_48_'; // 
DK0349 = '03_49_'; // 
DK034A = '03_4A_'; // 
DK034B = '03_4B_'; // 
DK034C = '03_4C_'; // 
DK034D = '03_4D_'; // 
DK034E = '03_4E_'; // 
DK034F = '03_4F_'; // 
//                          //





DK0400 = '04_00_'; // 
DK0401 = '04_01_'; // 
DK0402 = '04_02_'; // 
DK0403 = '04_03_'; // 
DK0404 = '04_04_'; // 
DK0405 = '04_05_'; // 
DK0406 = '04_06_'; // 
DK0407 = '04_07_'; // 
DK0408 = '04_08_'; // 
DK0409 = '04_09_'; // 
DK040A = '04_0A_'; // 
DK040B = '04_0B_'; // 
DK040C = '04_0C_'; // 
DK040D = '04_0D_'; // 
DK040E = '04_0E_'; // 
DK040F = '04_0F_'; // 
//                          //
DK0440 = '04_40_'; // 
DK0441 = '04_41_'; // 
DK0442 = '04_42_'; // 
DK0443 = '04_43_'; // 
DK0444 = '04_44_'; // 
DK0445 = '04_45_'; // 
DK0446 = '04_46_'; // 
DK0447 = '04_47_'; // 
DK0448 = '04_48_'; // 
DK0449 = '04_49_'; // 
DK044A = '04_4A_'; // 
DK044B = '04_4B_'; // 
DK044C = '04_4C_'; // 
DK044D = '04_4D_'; // 
DK044E = '04_4E_'; // 
DK044F = '04_4F_'; // 
//                          //





DK0500 = '05_00_'; // 
DK0501 = '05_01_'; // 
DK0502 = '05_02_'; // 
DK0503 = '05_03_'; // 
DK0504 = '05_04_'; // 
DK0505 = '05_05_'; // 
DK0506 = '05_06_'; // 
DK0507 = '05_07_'; // 
DK0508 = '05_08_'; // 
DK0509 = '05_09_'; // 
DK050A = '05_0A_'; // 
DK050B = '05_0B_'; // 
DK050C = '05_0C_'; // 
DK050D = '05_0D_'; // 
DK050E = '05_0E_'; // 
DK050F = '05_0F_'; // 
//                          //
DK0540 = '05_40_'; // 
DK0541 = '05_41_'; // 
DK0542 = '05_42_'; // 
DK0543 = '05_43_'; // 
DK0544 = '05_44_'; // 
DK0545 = '05_45_'; // 
DK0546 = '05_46_'; // 
DK0547 = '05_47_'; // 
DK0548 = '05_48_'; // 
DK0549 = '05_49_'; // 
DK054A = '05_4A_'; // 
DK054B = '05_4B_'; // 
DK054C = '05_4C_'; // 
DK054D = '05_4D_'; // 
DK054E = '05_4E_'; // 
DK054F = '05_4F_'; // 
//                          //





DK0600 = '06_00_'; // 
DK0601 = '06_01_'; // 
DK0602 = '06_02_'; // 
DK0603 = '06_03_'; // 
DK0604 = '06_04_'; // 
DK0605 = '06_05_'; // 
DK0606 = '06_06_'; // 
DK0607 = '06_07_'; // 
DK0608 = '06_08_'; // 
DK0609 = '06_09_'; // 
DK060A = '06_0A_'; // 
DK060B = '06_0B_'; // 
DK060C = '06_0C_'; // 
DK060D = '06_0D_'; // 
DK060E = '06_0E_'; // 
DK060F = '06_0F_'; // 
//                          //
DK0640 = '06_40_'; // 
DK0641 = '06_41_'; // 
DK0642 = '06_42_'; // 
DK0643 = '06_43_'; // 
DK0644 = '06_44_'; // 
DK0645 = '06_45_'; // 
DK0646 = '06_46_'; // 
DK0647 = '06_47_'; // 
DK0648 = '06_48_'; // 
DK0649 = '06_49_'; // 
DK064A = '06_4A_'; // 
DK064B = '06_4B_'; // 
DK064C = '06_4C_'; // 
DK064D = '06_4D_'; // 
DK064E = '06_4E_'; // 
DK064F = '06_4F_'; // 
//                          //





DK0700 = '07_00_'; // 
DK0701 = '07_01_'; // 
DK0702 = '07_02_'; // 
DK0703 = '07_03_'; // 
DK0704 = '07_04_'; // 
DK0705 = '07_05_'; // 
DK0706 = '07_06_'; // 
DK0707 = '07_07_'; // 
DK0708 = '07_08_'; // 
DK0709 = '07_09_'; // 
DK070A = '07_0A_'; // 
DK070B = '07_0B_'; // 
DK070C = '07_0C_'; // 
DK070D = '07_0D_'; // 
DK070E = '07_0E_'; // 
DK070F = '07_0F_'; // 
//                          //
DK0740 = '07_40_'; // 
DK0741 = '07_41_'; // 
DK0742 = '07_42_'; // 
DK0743 = '07_43_'; // 
DK0744 = '07_44_'; // 
DK0745 = '07_45_'; // 
DK0746 = '07_46_'; // 
DK0747 = '07_47_'; // 
DK0748 = '07_48_'; // 
DK0749 = '07_49_'; // 
DK074A = '07_4A_'; // 
DK074B = '07_4B_'; // 
DK074C = '07_4C_'; // 
DK074D = '07_4D_'; // 
DK074E = '07_4E_'; // 
DK074F = '07_4F_'; // 
//                          //





DK0800 = '08_00_'; // 
DK0801 = '08_01_'; // 
DK0802 = '08_02_'; // 
DK0803 = '08_03_'; // 
DK0804 = '08_04_'; // 
DK0805 = '08_05_'; // 
DK0806 = '08_06_'; // 
DK0807 = '08_07_'; // 
DK0808 = '08_08_'; // 
DK0809 = '08_09_'; // 
DK080A = '08_0A_'; // 
DK080B = '08_0B_'; // 
DK080C = '08_0C_'; // 
DK080D = '08_0D_'; // 
DK080E = '08_0E_'; // 
DK080F = '08_0F_'; // 
//                          //
DK0840 = '08_40_'; // 
DK0841 = '08_41_'; // 
DK0842 = '08_42_'; // 
DK0843 = '08_43_'; // 
DK0844 = '08_44_'; // 
DK0845 = '08_45_'; // 
DK0846 = '08_46_'; // 
DK0847 = '08_47_'; // 
DK0848 = '08_48_'; // 
DK0849 = '08_49_'; // 
DK084A = '08_4A_'; // 
DK084B = '08_4B_'; // 
DK084C = '08_4C_'; // 
DK084D = '08_4D_'; // 
DK084E = '08_4E_'; // 
DK084F = '08_4F_'; // 
//                          //





DK0900 = '09_00_'; // 
DK0901 = '09_01_'; // 
DK0902 = '09_02_'; // 
DK0903 = '09_03_'; // 
DK0904 = '09_04_'; // 
DK0905 = '09_05_'; // 
DK0906 = '09_06_'; // 
DK0907 = '09_07_'; // 
DK0908 = '09_08_'; // 
DK0909 = '09_09_'; // 
DK090A = '09_0A_'; // 
DK090B = '09_0B_'; // 
DK090C = '09_0C_'; // 
DK090D = '09_0D_'; // 
DK090E = '09_0E_'; // 
DK090F = '09_0F_'; // 
//                          //
DK0910 = '09_10_'; // 
DK0911 = '09_11_'; // 
DK0912 = '09_12_'; // 
DK0913 = '09_13_'; // 
DK0914 = '09_14_'; // 
DK0915 = '09_15_'; // 
DK0916 = '09_16_'; // 
DK0917 = '09_17_'; // 
DK0918 = '09_18_'; // 
DK0919 = '09_19_'; // 
DK091A = '09_1A_'; // 
DK091B = '09_1B_'; // 
DK091C = '09_1C_'; // 
DK091D = '09_1D_'; // 
DK091E = '09_1E_'; // 
DK091F = '09_1F_'; // 
//                          //
DK0940 = '09_40_'; // 
DK0941 = '09_41_'; // 
DK0942 = '09_42_'; // 
DK0943 = '09_43_'; // 
DK0944 = '09_44_'; // 
DK0945 = '09_45_'; // 
DK0946 = '09_46_'; // 
DK0947 = '09_47_'; // 
DK0948 = '09_48_'; // 
DK0949 = '09_49_'; // 
DK094A = '09_4A_'; // 
DK094B = '09_4B_'; // 
DK094C = '09_4C_'; // 
DK094D = '09_4D_'; // 
DK094E = '09_4E_'; // 
DK094F = '09_4F_'; // 
//                          //





// B: Minigame
DK0B00 = '0B_00_'; // 
DK0B01 = '0B_01_'; // 
DK0B02 = '0B_02_'; // 
DK0B03 = '0B_03_'; // 
DK0B04 = '0B_04_'; // 
DK0B05 = '0B_05_'; // 
DK0B06 = '0B_06_'; // 
DK0B07 = '0B_07_'; // 
//                          //





// C: Spell Sequence
DK0C00 = '0C_00_'; // 
DK0C01 = '0C_01_'; // 
DK0C02 = '0C_02_'; // 
DK0C03 = '0C_03_'; // 
DK0C04 = '0C_04_'; // 
DK0C05 = '0C_05_'; // 
DK0C06 = '0C_06_'; // 
DK0C07 = '0C_07_'; // 
//                          //





// D: Shop Owner
DK0D00 = '0D_00_'; // 
DK0D01 = '0D_01_'; // 
DK0D02 = '0D_02_'; // 
DK0D03 = '0D_03_'; // 
DK0D04 = '0D_04_'; // 
DK0D05 = '0D_05_'; // 
DK0D06 = '0D_06_'; // 
DK0D07 = '0D_07_'; // 
//                          //





// Zelda -------------------
DK0Z00 = '0Z_00_'; // 
DK0Z01 = '0Z_01_'; // 
DK0Z02 = '0Z_02_'; // 
DK0Z03 = '0Z_03_'; // 
DK0Z04 = '0Z_04_'; // 
DK0Z05 = '0Z_05_'; // 
DK0Z06 = '0Z_06_'; // 
DK0Z07 = '0Z_07_'; // 
//                          //







CONTINUE_DATAKEY = STR_Continue+STR_Exit+STR_Town+STR_Num;


MAP_DATAKEY1 = STR_Map+STR_Tile;
MAP_DATAKEY2 = STR_Map+STR_Explored+STR_Exception;




MapAreaName_NORTH_PALACE_      = MapAreaName_DATAKEY+MapAreaName_NORTH_CASTLE;
MapAreaName_NORTH_PALACE_LAKE_ = MapAreaName_DATAKEY+MapAreaName_NORTH_CASTLE_LAKE;
MapAreaName_NORTH_PALACE_WOODS_= MapAreaName_DATAKEY+MapAreaName_NORTH_CASTLE_FOREST;
MapAreaName_NORTH_PALACE_FIELD_= MapAreaName_DATAKEY+MapAreaName_NORTH_CASTLE_FIELD;
MapAreaName_PARAPA_DESERT_     = MapAreaName_DATAKEY+MapAreaName_PARAPA_DESERT;
MapAreaName_TANTARI_DESERT_    = MapAreaName_DATAKEY+MapAreaName_TANTARI_DESERT;
MapAreaName_RAURU_WOODS_       = MapAreaName_DATAKEY+"RAURU WOODS";
MapAreaName_RAURU_PASS_        = MapAreaName_DATAKEY+"RAURU PASS"; // Boulder next to Rauru
MapAreaName_RUTO_MOUNTAINS_    = MapAreaName_DATAKEY+"RUTO MOUNTAINS";
MapAreaName_MORUGE_SWAMP_      = MapAreaName_DATAKEY+"MORUGE SWAMP";
MapAreaName_SARIA_RIVER_       = MapAreaName_DATAKEY+"SARIA RIVER";
MapAreaName_SARIA_FIELD_       = MapAreaName_DATAKEY+"SARIA FIELD";
MapAreaName_SARIA_RIVER_WOODS_ = MapAreaName_DATAKEY+"SARIA RIVER WOODS";
MapAreaName_SARIA_CEMETERY_    = MapAreaName_DATAKEY+"SARIA CEMETERY";
MapAreaName_SARIA_BAY_         = MapAreaName_DATAKEY+"SARIA BAY";
MapAreaName_MIDORO_SWAMP_      = MapAreaName_DATAKEY+"MIDORO SWAMP";
MapAreaName_MIDORO_FIELD_      = MapAreaName_DATAKEY+"MIDORO FIELD";
MapAreaName_ROYAL_CEMETERY_    = MapAreaName_DATAKEY+"ROYAL CEMETERY";
MapAreaName_KINGS_TOMB_        = MapAreaName_DATAKEY+"KINGS TOMB";








dm_dialogue_spell = ds_map_create();
dm_dialogue_spell[?hex_str(SPL_PRTC)] = DK0700;
dm_dialogue_spell[?hex_str(SPL_JUMP)] = DK0701;
dm_dialogue_spell[?hex_str(SPL_LIFE)] = DK0702;
dm_dialogue_spell[?hex_str(SPL_FARY)] = DK0703;
dm_dialogue_spell[?hex_str(SPL_FIRE)] = DK0704;
dm_dialogue_spell[?hex_str(SPL_RFLC)] = DK0705;
dm_dialogue_spell[?hex_str(SPL_SPEL)] = DK0706;
dm_dialogue_spell[?hex_str(SPL_THUN)] = DK0707;
dm_dialogue_spell[?hex_str(SPL_SUMM)] = DK0740;







//SRST_DK = dk_SceneRando+STR_Scene+STR_Type;
//STR_Hallway
/*
SRDK1_01 = "01";
SRDK1_02 = "02";
SRDK1_04 = "04";
SRDK1_08 = "08";

SRDK1_01000000 = "01"+"00"+"00"+"00";
SRDK1_01010000 = "01"+"01"+"00"+"00";
SRDK1_01000100 = "01"+"00"+"01"+"00";
SRDK1_01000001 = "01"+"00"+"00"+"01";
SRDK1_01010001 = "01"+"01"+"00"+"01";
SRDK1_01010100 = "01"+"01"+"01"+"00";
*/



// --------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------
// Manually set all rm width and height to avoid the slowdown caused 
// by opening every rm's file in the rest of this script.
// This could be updated and ran at the end of dev.
// Run this scr any time data relevant of rm file data is changed.
// Turn off the file lookup in data_rm_1a()

// Use dev_automateRoomData2() below to output auto-code of 
// RoomData_Create_2a() every time a tile file changes.
RoomData_Create_2a();


//var _dg_dungeon_map_ROWS = ds_grid_height(g.PAUSE_MENU.dg_dngn_map);




















// --------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------
// Give FileSelect & ContinueSave scenes a bg color
g.dm_rm[?Area_FileS+"00"+dk_BackgroundColor] = p.C_BLK1;
g.dm_rm[?Area_ContS+"00"+dk_BackgroundColor] = p.C_BLK1;

// TITLE SCREEN
rm_name = RM_NAME_TITLSCR;
_len    = string_length(rm_name);
area    = string_copy(  rm_name,1,_len-2);
rm_num_ = string_copy(  rm_name,_len-1,2)
rm_num  = str_hex(rm_num_);
set_rm_data(rm_name, STR_Title, STR_Color+COLOR1_, STR_Tile+Area_Title+'000');


// FILE SELECT
set_rm_data(Area_FileS+'00', dk_FileSelect);


// OVERWORLD
set_rm_data(Area_OvrwA+'00', STR_Overworld+STR_Standard);





// --------------------------  WEST  -----------------------------
// Area:  _WestA_  -------------------------------------------
RoomData_Create_1a(); // reset properties
rm_data_init_West_A();




// --------------------------  EAST  -----------------------------
// Area:  _EastA_  -------------------------------------------
RoomData_Create_1a(); // reset properties
rm_data_init_East_A();




// --------------------------  DEATH MTN  -----------------------------
// Area:  _DthMt_  -------------------------------------------
RoomData_Create_1a(); // reset properties
rm_data_init_DthMt_A();




// --------------------------  MAZE ISL  -----------------------------
// Area:  _MazIs_  -------------------------------------------
RoomData_Create_1a(); // reset properties
rm_data_init_MazIs_A();




// --------------------------  PARAPA PALACE  -----------------------------
// Area:  _PalcA_  -------------------------------------------
RoomData_Create_1a(); // reset properties
rm_data_init_Palc_A();


data_dungeon_2(val(g.dm_rm[?get_dk_dungeon_entrance($1)], area+'00'+EXL0_));
ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_1,         g.PAUSE_MENU.dg_dngn_map);
ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_1_DEFAULT, g.PAUSE_MENU.dg_dngn_map);



// --------------------------  MIDORO PALACE  -----------------------------
// Area:  _PalcB_  -------------------------------------------
RoomData_Create_1a(); // reset properties
rm_data_init_Palc_B();


data_dungeon_2(val(g.dm_rm[?get_dk_dungeon_entrance($2)], area+'00'+EXR0_));
ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_2,         g.PAUSE_MENU.dg_dngn_map);
ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_2_DEFAULT, g.PAUSE_MENU.dg_dngn_map);




// --------------------------  ISLAND PALACE  -----------------------------
// Area:  _PalcC_  -------------------------------------------
RoomData_Create_1a(); // reset properties
rm_data_init_Palc_C();


data_dungeon_2(val(g.dm_rm[?get_dk_dungeon_entrance($3)], area+'00'+EXL0_));
ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_3,         g.PAUSE_MENU.dg_dngn_map);
ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_3_DEFAULT, g.PAUSE_MENU.dg_dngn_map);




// --------------------------  MAZE ISL PALACE  -----------------------------
// Area:  _PalcD_  -------------------------------------------
RoomData_Create_1a(); // reset properties
rm_data_init_Palc_D();


data_dungeon_2(val(g.dm_rm[?get_dk_dungeon_entrance($4)], area+'00'+EXL0_));
ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_4,         g.PAUSE_MENU.dg_dngn_map);
ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_4_DEFAULT, g.PAUSE_MENU.dg_dngn_map);




// --------------------------  PALACE ON THE SEA  -----------------------------
// Area:  _PalcE_  -------------------------------------------
RoomData_Create_1a(); // reset properties
rm_data_init_Palc_E();


data_dungeon_2(val(g.dm_rm[?get_dk_dungeon_entrance($5)], area+'00'+EXL0_));
ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_5,         g.PAUSE_MENU.dg_dngn_map);
ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_5_DEFAULT, g.PAUSE_MENU.dg_dngn_map);




// --------------------------  3-EYE ROCK PALACE  -----------------------------
// Area:  _PalcF_  -------------------------------------------
RoomData_Create_1a(); // reset properties
rm_data_init_Palc_F();


data_dungeon_2(val(g.dm_rm[?get_dk_dungeon_entrance($6)], area+'00'+EXL0_));
ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_6,         g.PAUSE_MENU.dg_dngn_map);
ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_6_DEFAULT, g.PAUSE_MENU.dg_dngn_map);




// --------------------------  GREAT PALACE  -----------------------------
// Area:  _PalcG_  -------------------------------------------
RoomData_Create_1a(); // reset properties
rm_data_init_Palc_G();


data_dungeon_2(val(g.dm_rm[?get_dk_dungeon_entrance($7)], area+'00'+EXL0_));
ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_7,         g.PAUSE_MENU.dg_dngn_map);
ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_7_DEFAULT, g.PAUSE_MENU.dg_dngn_map);





// --------------------------  DRAGMIRE TOWER  -----------------------------
// Area:  _PalcH_  -------------------------------------------
RoomData_Create_1a(); // reset properties
rm_data_init_Palc_H();


data_dungeon_2(val(g.dm_rm[?get_dk_dungeon_entrance($8)], area+'00'+EXL0_));
ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_8,         g.PAUSE_MENU.dg_dngn_map);
ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_8_DEFAULT, g.PAUSE_MENU.dg_dngn_map);








// --------------------------  TOWNS  -----------------------------
// Area:  _TownA_  -------------------------------------------
RoomData_Create_1a(); // reset properties
rm_data_init_Town_A();



// Area:  _TownB_  -------------------------------------------
RoomData_Create_1a(); // reset properties
rm_data_init_Town_B();








// --------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------
// Sort data in g.dl_MapItem_ITEM_IDS
var _DEBUG_MAP=false;
if (_DEBUG_MAP)sdm("");
var _dl_id_kakusu   =ds_list_create();
var _dl_id_container=ds_list_create();
var _dl_id_1up      =ds_list_create();
var _dl_id_key      =ds_list_create();
       ds_list_sort(g.dl_MapItem_ITEM_IDS,true);
for(_i=ds_list_size(g.dl_MapItem_ITEM_IDS)-1; _i>=0; _i--)
{   _val =          g.dl_MapItem_ITEM_IDS[|_i];
         if (string_pos(STR_Kakusu,_val)) ds_list_add(_dl_id_kakusu,   _val);
    else if (string_pos(STR_MAGIC, _val)) ds_list_add(_dl_id_container,_val);
    else if (string_pos(STR_HEART, _val)) ds_list_add(_dl_id_container,_val);
    else if (string_pos(STR_1UP,   _val)) ds_list_add(_dl_id_1up,      _val);
    else if (string_pos(STR_KEY,   _val)) ds_list_add(_dl_id_key,      _val);
    if (_DEBUG_MAP)sdm("g.dl_MapItem_ITEM_IDS[|$"+hex_str(_i)+"] = "+_val);
}

ds_list_clear(g.dl_MapItem_ITEM_IDS);
for(_i=ds_list_size(_dl_id_kakusu)-1;    _i>=0; _i--) ds_list_add(g.dl_MapItem_ITEM_IDS,_dl_id_kakusu[|_i]);
for(_i=ds_list_size(_dl_id_container)-1; _i>=0; _i--) ds_list_add(g.dl_MapItem_ITEM_IDS,_dl_id_container[|_i]);
for(_i=ds_list_size(_dl_id_1up)-1;       _i>=0; _i--) ds_list_add(g.dl_MapItem_ITEM_IDS,_dl_id_1up[|_i]);
for(_i=ds_list_size(_dl_id_key)-1;       _i>=0; _i--) ds_list_add(g.dl_MapItem_ITEM_IDS,_dl_id_key[|_i]);
if (_DEBUG_MAP){sdm(""); for(_i=ds_list_size(g.dl_MapItem_ITEM_IDS)-1; _i>=0; _i--){sdm("g.dl_MapItem_ITEM_IDS[|$"+hex_str(_i)+"] = "+g.dl_MapItem_ITEM_IDS[|_i]);} sdm("");}
ds_list_destroy(_dl_id_kakusu);    _dl_id_kakusu   =undefined;
ds_list_destroy(_dl_id_container); _dl_id_container=undefined;
ds_list_destroy(_dl_id_1up);       _dl_id_1up      =undefined;
ds_list_destroy(_dl_id_key);       _dl_id_key      =undefined;








// --------------------------------------------------------------------------------------------
ds_map_copy(f.dm_1up_doll_DEFAULT, f.dm_1up_doll);








// --------------------------------------------------------------------------------------------
if (DEV) // Because this will save to local dir which needs to be moved to included files during development
{
    var _dm_save_data = ds_map_create();
    
    
    // ------------------------------------------------------------------------------------------
    _dm_save_data[?STR_Tile+STR_File+"_Dimensions"] = ds_map_write(global.dm_scene_wh);
    _dm_save_data[?"scene_data"]       = ds_map_write(g.dm_rm);
    _dm_save_data[?"spawn_data"]       = ds_map_write(g.dm_spawn);
    _dm_save_data[?"dungeon_data"]     = ds_map_write(g.dm_dungeon);
    _dm_save_data[?"town_data"]        = ds_map_write(g.dm_town);
    _dm_save_data[?"pbags_data"]       = ds_map_write(f.dm_PBags);
    _dm_save_data[?"1up_data"]         = ds_map_write(f.dm_1up_doll);
    _dm_save_data[?"keys_data"]        = ds_map_write(f.dm_keys);
    _dm_save_data[?"jars_data"]        = ds_map_write(f.dm_jars);
    _dm_save_data[?"scene_rando_data"] = ds_map_write(global.dm_scene_rando);
    
    _dm_save_data[?"palette_data"]     = ds_map_write(dm_palette);
    _dm_save_data[?"audio_data"]       = ds_map_write(dm_audio);
    _dm_save_data[?"rando_hint_data"]  = ds_map_write(dm_rando_hints);
    _dm_save_data[?"rando_enemy_data"] = ds_map_write(dm_rando_enemy);
    
    _dm_save_data[?"dg_dngn_map_1"]    = ds_grid_write(g.PAUSE_MENU.dg_dngn_map_1);
    _dm_save_data[?"dg_dngn_map_2"]    = ds_grid_write(g.PAUSE_MENU.dg_dngn_map_2);
    _dm_save_data[?"dg_dngn_map_3"]    = ds_grid_write(g.PAUSE_MENU.dg_dngn_map_3);
    _dm_save_data[?"dg_dngn_map_4"]    = ds_grid_write(g.PAUSE_MENU.dg_dngn_map_4);
    _dm_save_data[?"dg_dngn_map_5"]    = ds_grid_write(g.PAUSE_MENU.dg_dngn_map_5);
    _dm_save_data[?"dg_dngn_map_6"]    = ds_grid_write(g.PAUSE_MENU.dg_dngn_map_6);
    _dm_save_data[?"dg_dngn_map_7"]    = ds_grid_write(g.PAUSE_MENU.dg_dngn_map_7);
    _dm_save_data[?"dg_dngn_map_8"]    = ds_grid_write(g.PAUSE_MENU.dg_dngn_map_8);
    
    _dm_save_data[?"dl_MapItem_ITEM_IDS"] = ds_list_write(g.dl_MapItem_ITEM_IDS);
    
    _encoded = json_encode(_dm_save_data);
    _file = file_text_open_write(working_directory+FILE_NAME0);
            file_text_write_string(_file, _encoded);
            file_text_close(       _file);
    // !!!! MOVE(NOT COPY) THE SAVED DATA FROM %localappdata% TO Included Files !!!!
    repeat(1) show_debug_message("");
    show_debug_message("RoomData_Create(). Data saved to '"+FILE_NAME0+"'!");
    repeat(1) show_debug_message("");
    show_debug_message("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    show_debug_message("THIS IS A REMINDER TO MOVE(NOT COPY) FILE '"+FILE_NAME0+"' FROM THE %localappdata% DIRECTORY TO ITS Included Files DIRECTORY!");
    show_debug_message("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    repeat(1) show_debug_message("");
    
    
    
    // ------------------------------------------------------------------------------------------
    ds_map_clear(_dm_save_data);
    _dm_save_data[?"scene_wall_data"] = ds_map_write(global.dm_scene_wall_data);
    
    _encoded = json_encode(_dm_save_data);
    _file = file_text_open_write(working_directory+FILE2_NAME0);
            file_text_write_string(_file, _encoded);
            file_text_close(       _file);
    // !!!! MOVE(NOT COPY) THE SAVED DATA FROM %localappdata% TO Included Files !!!!
    repeat(1) show_debug_message("");
    show_debug_message("RoomData_Create(). Data saved to '"+FILE2_NAME0+"'!");
    repeat(1) show_debug_message("");
    show_debug_message("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    show_debug_message("THIS IS A REMINDER TO MOVE(NOT COPY) FILE '"+FILE2_NAME0+"' FROM THE %localappdata% DIRECTORY TO ITS Included Files DIRECTORY!");
    show_debug_message("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    repeat(1) show_debug_message("");
    
    
    
    
    // ------------------------------------------------------------------------------------------
    ds_map_destroy(_dm_save_data); _dm_save_data=undefined;
}









// --------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------
ds_map_copy(g.dm_spawn_DEFAULT, g.dm_spawn);


ds_grid_resize(g.PAUSE_MENU.dg_dngn_map, 0, g.PAUSE_MENU.DUNGEON_MAP_ROWS_DEFAULT);
ds_grid_clear( g.PAUSE_MENU.dg_dngn_map, 0);








// --------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------
/*
// Scene Rando Debug
repeat(4) show_debug_message("");
show_debug_message("// ----------------------------------------------------------");
var _dl_group_ids = ds_list_create();
var _dl_group_scenes = ds_list_create();
var _DATAKEY0 = STR_Group+STR_ID+STR_List;
var _DATAKEY1 = STR_Group+STR_ID+STR_Index;
var _data = global.dm_scene_rando[?_DATAKEY0];
if(!is_undefined(_data))
{
    ds_list_read(_dl_group_ids, _data);
    var          _GROUP_COUNT = ds_list_size(_dl_group_ids);
    for(_i=0; _i<_GROUP_COUNT; _i++)
    {
        show_debug_message("GROUP ID $"+hex_str(_i)+":  "+_dl_group_ids[|_i]);
        
        ds_list_clear(_dl_group_scenes);
        _data = global.dm_scene_rando[?_DATAKEY1+hex_str(_i)+STR_Scene+STR_List];
        if(!is_undefined(_data))
        {
            ds_list_read(_dl_group_scenes, _data);
            show_debug_message("GROUP ID $"+hex_str(_i)+" "+STR_Scene+STR_Count+":  $"+hex_str(ds_list_size(_dl_group_scenes)));
        }
        else
        {
            show_debug_message("!!! "+_DATAKEY1+hex_str(_i)+STR_Scene+STR_List+" is undefined !!!");
        }
        
        show_debug_message("");
    }
}
else
{
    show_debug_message("!!! "+_DATAKEY0+" is undefined !!!");
    show_debug_message("");
}

repeat(4) show_debug_message("");

ds_list_destroy(_dl_group_ids); _dl_group_ids=undefined;
ds_list_destroy(_dl_group_scenes); _dl_group_scenes=undefined;
*/








/*
with(g.PAUSE_MENU)
{
    var _dg_dngn_map_COUNT=ds_grid_width(dg_dngn_map_5);
    for(_i=0; _i<_dg_dngn_map_COUNT; _i++)
    {
        _str  = "$"+hex_str(_i)+": ";
        _str += ", "+dg_dngn_map_5[#_i,5];
        _str += ", "+"page $" +hex_str(dg_dngn_map_5[#_i,6]);
        _str += ", "+"clm $"  +hex_str(dg_dngn_map_5[#_i,0])+", row $"+hex_str(dg_dngn_map_5[#_i,1]);
        _str += ", "+"tsrc $" +hex_str(dg_dngn_map_5[#_i,2]);
        _str += ", "+"exits: "+hex_str(dg_dngn_map_5[#_i,8]);
        sdm(_str);
    }
}
*/




//dev_rmdata_cleanup_data_check();
//dev_automateRoomData1();

//debug_list_rms_using_permut_ts();
//db_LifeDoll_data_1a();

/* // Output which rm are missing owrc data
var _rm_name;
for(_i=0; _i<ds_list_size(g.dl_AREA_NAME); _i++)
{
    for(_j=0; _j<$100; _j++)
    {
        _rm_name=g.dl_AREA_NAME[|_i]+hex_str(_j);
        if(!is_undefined(g.dm_rm[?_rm_name+STR_Background_color]))
        {
            if (is_undefined(g.dm_rm[?_rm_name+STR_OWRC]))
            {
                sdm("NO OWRC FOR "+_rm_name);
            }
        }
    }
}
*/








/* // Find out which scenes have more than one exit that goes to the same reen
var _exit_name, _same_goto_reen, _goto_reen;
var _dl_goto_reen = ds_list_create();
//var _dl_goto_owrc = ds_list_create();
for(_i=0; _i<ds_list_size(g.dl_AREA_NAME); _i++) // each area
{
    for(_j=0; _j<$100; _j++) // each scene of area _i
    {
        _scene_name = g.dl_AREA_NAME[|_i]+hex_str(_j);
        if(!is_undefined(g.dm_rm[?_scene_name+dk_BackgroundColor]))
        {
            _same_goto_reen = false;
            ds_list_clear(_dl_goto_reen);
            //ds_list_clear(_dl_goto_owrc);
            _num = 1;
            while (true)
            {
                _exit_name = g.dm_rm[?_scene_name+STR_Exit+hex_str(_num++)+STR_Name];
                if (is_undefined(_exit_name)) break;//while (true)
                _goto_reen = g.dm_rm[?string(_exit_name)+STR_goto_reen];
                if(!is_undefined(_goto_reen))
                {
                    if (ds_list_find_index(_dl_goto_reen,_goto_reen)!=-1)
                    {
                        _same_goto_reen = true;
                        break;//while (true)
                    }
                    else
                    {
                        ds_list_add(_dl_goto_reen,_goto_reen);
                    }
                }
            }
            
            if (_same_goto_reen)
            {
                _num = 1;
                show_debug_message("=================================");
                while (true)
                {
                    _exit_name = g.dm_rm[?_scene_name+STR_Exit+hex_str(_num++)+STR_Name];
                    if (is_undefined(_exit_name)) break;//while (true)
                    _goto_reen = g.dm_rm[?string(_exit_name)+STR_goto_reen];
                    if(!is_undefined(_goto_reen)) show_debug_message("Exit: "+_exit_name+", GotoReen: "+_goto_reen);
                }
            }
            //if (is_undefined(g.dm_rm[?_scene_name+STR_OWRC]))
        }
    }
}
ds_list_destroy(_dl_goto_reen); _dl_goto_reen=undefined;
//ds_list_destroy(_dl_goto_owrc); _dl_goto_owrc=undefined;
//g.dm_rm[?_EXIT_NAME+STR_goto_reen]  g.dm_rm[?_EXIT_NAME+STR_OWRC]  g.dm_rm[?_RM_NAME+STR_Exit+hex_str(_count)+STR_Name]  val(g.dm_rm[?_RM_NAME+STR_Exit+STR_Count])
*/







/*
// Output which Tiled files aren't used
if (g.FileCleaning01_STATE)
{
    var _dk1,_dk2;
    var _file_name1,_file_name2;
    _count=ds_list_size(g.dl_AREA_NAME);
    for(_i=0; _i<_count; _i++)
    {
        for(_j=0; _j<$100; _j++)
        {
            _num = string(_j);
            _num = string_repeat("0",3-string_length(_num)) + _num;
            
            // _file_name2 example: "PalcA_003"
            _file_name2  = string_letters(g.dl_AREA_NAME[|_i]);
            _file_name2 += "_"+_num;
            //_file_name2 += ".json";
            
            // _file_name1 example: "PalcA_003.json"
            _file_name1 = _file_name2+".json";
            
            if (file_exists(_file_name1) 
            &&  ds_list_find_index(dl_used_tiled_files,_file_name2)==-1)
            {
                _dk = STR_Tile+STR_File+STR_Count;
                       g.FileCleaning01_dm[?_dk] = val(g.FileCleaning01_dm[?_dk])+1;
                _num = g.FileCleaning01_dm[?_dk];
                
                g.FileCleaning01_dm[?STR_Tile+STR_File+hex_str(_num)+STR_Name] = _file_name1;
                g.FileCleaning01_dm[?_file_name1+STR_Tile+STR_File+STR_Num] = _num;
                //sdm(_file_name2);
            }
        }
        sdm("");
    }
    ds_list_destroy(dl_used_tiled_files); dl_used_tiled_files=undefined;
    sdm(""); sdm(""); sdm("");
}
*/




/* // Check for broken exits to ow. 2024/09/19. No broken exits found.
// Note this will print encounter exits and pit-up exits but they don't matter here.
repeat(8) sdm("");
_count=val(g.dm_rm[?STR_Exit+STR_Count]);
for(_i=1; _i<=_count; _i++)
{
    _str=val(g.dm_rm[?STR_Exit+hex_str(_i)+STR_Name]);
    _val=val(g.dm_rm[?string(_str)+STR_OWRC]);
    if (_val==g.OWRC_NO_EXIT_DATA) sdm(_str);
}
repeat(8) sdm("");
*/




/*
for(_i=0; _i<ds_list_size(g.dl_AREA_NAME); _i++) // each area
{
    for(_j=0; _j<$100; _j++) // each scene of area _i
    {
        _scene_name = g.dl_AREA_NAME[|_i]+hex_str(_j);
        if(!is_undefined(g.dm_rm[?_scene_name+STR_Rm+STR_Num+STR_Game]) 
        && !val(global.dm_scene_rando[?_scene_name+"_Safe"+STR_Item+STR_Position+STR_Count]) )
        {
            _val = string(val(g.dm_rm[?_scene_name+dk_FileName+STR_Quest+"01"]));
            show_debug_message(_scene_name+" - "+_val);
        }
    }
}
*/








//dev_find_scenes_using_certain_tiles();

//if (DEV) dev_automateRoomData2(); // automates scene width/height data for RoomData_Create_2a()
//if (global.REINITIALIZE_DATA1) dev_automateRoomData2(); // automates scene width/height data for RoomData_Create_2a()





ds_map_destroy(dm_dungeon_map_rc); dm_dungeon_map_rc=undefined;
ds_list_destroy(dl_dungeon_map_clm); dl_dungeon_map_clm=undefined;
ds_list_destroy(dl_dungeon_map_row); dl_dungeon_map_row=undefined;
ds_map_destroy(dm_dialogue_spell); dm_dialogue_spell=undefined;
ds_list_destroy(dl_exit); dl_exit=undefined;

//ds_map_destroy(dm_overworld); dm_overworld=undefined;
ds_map_destroy(dm_palette); dm_palette=undefined;
ds_map_destroy(dm_audio); dm_audio=undefined;
ds_map_destroy(dm_rando_hints); dm_rando_hints=undefined;
ds_map_destroy(dm_rando_enemy); dm_rando_enemy=undefined;
//ds_map_destroy(dm_pbags); dm_pbags=undefined;
//ds_map_destroy(dm_1ups); dm_1ups=undefined;
//ds_map_destroy(dm_door_keys); dm_door_keys=undefined;
//ds_map_destroy(dm_magic_jars); dm_magic_jars=undefined;




// --------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------
instance_destroy();
// --------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------




if (DEV)
{
    show_debug_message("RoomData_Create() END2. "+string(current_time-_START_TIME));
    repeat(1) show_debug_message("");
}




