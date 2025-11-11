/// Overworld_Create()

if (DEV)
{
    var _START_TIME = current_time;
    show_debug_message("");
    show_debug_message("Overworld_Create() START");
}




var _i,_j, _a, _idx,_idx1,_idx2,_idx3, _count,_count0,_count1;
var _val, _val1,_val2,_val3;
var _clm,_row, _clms,_rows, _grid_rows;
var _depth;
var _str, _dk;
var _type, _data;
var _area, _biome, _biome_num;
var _tsrc, _tsrc_, _tsrc_count;

var _dl0 = ds_list_create();
//var _dl_biome_tsrc = ds_list_create();


global.OVERWORLD = id;


// 1: On app start, overworld info is built and from the Tiled overworld .json file
// 2: On app start, overworld info is built in a script with preprocessed data
// 3: Most data comes from Included Files "other/OverworldData01.txt"
OVERWORLD_INIT_METHOD = 3;




// ------------------------------------------------
dm = ds_map_create();


dg_AreaNames_DEF = ds_grid_create(0,0);
dg_AreaNames     = ds_grid_create(0,0);


//depth = DEPTH_Overworld;
GO_depth_init(DEPTH_BASE); // sets depth & depth_def


              _depth = depth+$16;
//              _depth = depth+$10;
Tile_DEPTH1 = _depth--;
Tile_DEPTH2 = _depth--;




TILESET1           = ts_Overworld_1;
TILESET_TILEMARKER = ts_tile_marker_1a_16x16; // For debug drawing exit outlines

TILESET1_TS_IDX  = ds_list_find_index(g.dl_tileset,TILESET1);
TILESET1_TS_IDX_ = hex_str(TILESET1_TS_IDX);

TILESET2_TS_IDX  = ds_list_find_index(g.dl_tileset,ts_OverworldAnim01);
TILESET2_TS_IDX_ = hex_str(TILESET2_TS_IDX);

var _TS1 = TILESET1_TS_IDX<<8;
var _TS2 = TILESET2_TS_IDX<<8;

TSRC_WATER01 = _TS2|TSRC_WATE01; // deep water
TSRC_WATER02 = _TS2|TSRC_WATE02; // shallow water


COLOR_IDX_BG1 = $11;
color_idx_bg  = 0;




T_SIZE = $10; // $08 or $10 only
SHIFT  = clamp((T_SIZE>>3)+2, 3,4); // 3,4.  For T_SIZE $08 or $10 only


// how many clms/rows pad each edge(RGT,LFT,BTM,TOP)
VIEW_PAD = 1;


DRAW_W  = BASE_GAME_RESOLUTION_W>>SHIFT;   // $100,$1E0 >>4  =  $10,$1E
DRAW_W +=  (DRAW_W &$1) ^ $1; // round up to odd. ($10,$1E & $1) ^ $1 = 1,1
DRAW_W += VIEW_PAD <<1;       // add (VIEW_PAD<<1) clms to each side
DRAW_W  =   DRAW_W <<SHIFT;   // $13,$21 <<4 = $130,$210..  $18 pixel pad RGT & LFT
DRAW_W_ =   DRAW_W >>1;       // FYI, THIS IS NOT THE CENTER OF THE SCREEN

DRAW_H  = BASE_GAME_RESOLUTION_H>>SHIFT;   //  $E0,$10E >>4  =  $0E,$10
DRAW_H +=  (DRAW_H &$1) ^ $1; // round up to odd. ($0E,$10 & $1) ^ $1 = 1,1
DRAW_H += VIEW_PAD <<1;       // add (VIEW_PAD<<1) rows to each side
DRAW_H  =   DRAW_H <<SHIFT;   // $11,$13 <<4 = $110,$130..  $18 pixel pad BTM & TOP
DRAW_H_ =   DRAW_H >>1;       // FYI, THIS IS NOT THE CENTER OF THE SCREEN

DRAW_CLMS = DRAW_W >>SHIFT; // $130,$210 >>4 = $13,$21
DRAW_ROWS = DRAW_H >>SHIFT; // $110,$130 >>4 = $11,$13

draw_move_offset_x = 0;
draw_move_offset_y = 0;




//OW_EDGE_PAD = $18;
OW_CLMS_PAD = (DRAW_CLMS>>1) + 1; // +1 bc GRID_W is odd. $13 div 2 = 9 + 1 = $A
OW_ROWS_PAD = (DRAW_ROWS>>1) + 1; // +1 bc GRID_H is odd. $11 div 2 = 8 + 1 = 9


OW_CLMS = $100;
OW_ROWS = $100;
OW_W = OW_CLMS<<SHIFT;
OW_H = OW_ROWS<<SHIFT;


// Center cam on drawing area
CAM_X = DRAW_W_ - g.VIEW_W_;
CAM_Y = DRAW_H_ - g.VIEW_H_;
// PC CAM X/Y is relative to the cam/view x/y
// It is how many pixels away from view_x/yview and in the center of pc spr
// PC_CAM_X_DEF = g.WINW_HALF;
// PC_CAM_Y_DEF = g.WINH_HALF;
// pc_cam_x     = PC_CAM_X_DEF;
// pc_cam_y     = PC_CAM_Y_DEF;
// pc_cam_x_off = 0;
// pc_cam_y_off = 0;


// w & h of rmC_Overworld_A
rmC_W  = g.VIEW_W; // 
rmC_H  = g.VIEW_H; // 
ROOM_W = DRAW_W;   // what room_width  get set to in Overworld_Room_Start()
ROOM_H = DRAW_H;   // what room_height get set to in Overworld_Room_Start()




Pause_ALLOW_BUFFERING = true;
Pause_FONT   = global.dl_game_font[|global.game_font_idx];
Pause_TEXT   = "PAUSED!";
Pause_TEXT_W = sprite_get_width(Pause_FONT) * string_length(Pause_TEXT);
Pause_xl = 0;
Pause_yt = 0;


can_draw_exits = 1;




// ------------------------------------------------
pcrc       = 0; // current room's overworld grid xy
pcrc_spawn = pcrc;
pcrc_map   = pcrc;
pc_ow_x    = 0;
pc_ow_y    = 0;
pc_dir     = $1; // $1,2,4,8
dest_dist  = 0; // The remaining distance pc will move once movement starts

PC_draw_image_idx = 0;
PC_draw_XOFF      = 0;
PC_draw_YOFF      = -2;
PC_draw_xoff      = PC_draw_XOFF;
PC_draw_yoff      = PC_draw_YOFF;
PC_draw_x_base    = 0;
PC_draw_y_base    = 0;
PC_draw_x         = 0;
PC_draw_y         = 0;
PC_draw_is_sheet  = false;
PC_draw_sheet_xl  = 0;
PC_draw_sheet_yt  = 0;

PC_can_draw = false;
pc_sprite_idx = 0;
//pc_spr = dg_pc_spr[#pc_sprite_idx,0];
pc_x_scale = 1;
pc_step_counter = 0;




// mot: Mode Of Transport. 
           _i=1;
MOT_WALK = _i++;
MOT_RAFT = _i++;
mot      =  0; // 0: not moving




move_SYS = 1;
                 _i=0;
MOVE_SPD_1 = $1<<_i++; // !(g.counter1 & (1-1)): every frame
MOVE_SPD_2 = $1<<_i++; // !(g.counter1 & (2-1)): every other frame
MOVE_SPD_3 = $1<<_i++; // !(g.counter1 & (4-1)): every 4 frames
move_spd   = 0; // 0: no movement
move_x     = 0;
move_y     = 0;


// Movement system using fractional values
// 20240712. move_SPEED3 feels studdery.
move_SPEED1   = 1.0;
move_SPEED2   = 0.5;
move_SPEED3   = move_SPEED2+((move_SPEED1-move_SPEED2)/2); // Faster swamp speed with BOOTS
move_speed    = 0.0;
move_distance = 0.0;
//move_SYS=2; move_SPEED2=0.75; // testing


exit_owrc = 0;


FLUTE_DURATION1 = $88 + $8; // This is, at worst, an approximation
flute_timer     = 0; // 0566




// -------------------------------------------------------------
BAIT_can_draw  = false;
BAIT_SPRITE    = val(g.dm_ITEM[?hex_str(bitNum(ITM_MEAT))+STR_Sprite], spr_Item_Meat_1a);
BAIT_DURATION1 = $100;
BAIT_timer     = 0;
BAIT_countdown = 2;
BAIT_owrc      = $0000;
BAIT_ow_x      = 0;
BAIT_ow_y      = 0;
BAIT_draw_x    = 0;
BAIT_draw_y    = 0;




// -------------------------------------------------------------
TreasureMaps_dg = ds_grid_create($0,$E);
TreasureMaps_can_draw = false;

TreasureMaps_Kakusu_sprite = spr_Slime_Small_1a_1;
TreasureMaps_Kakusu_PI     = global.PI_MOB_ORG;
TreasureMaps_Kakusu_YOFF   = -4; // -4: because graphic is aligned to bottom of image

TreasureMaps_Heart_sprite = spr_Heart_1a;
TreasureMaps_Heart_PI     = global.PI_MOB_RED;
TreasureMaps_Heart_YOFF   = 0;

TreasureMaps_Magic_sprite0 = spr_Bottle_6a; // empty bottle
TreasureMaps_Magic_sprite1 = spr_Bottle_6a_Liquid_1a;
TreasureMaps_Magic_PI      = global.PI_MOB_ORG;
TreasureMaps_Magic_YOFF    = -1;

TreasureMaps_1up_sprite = spr_Item_LifeDoll_1a;
TreasureMaps_1up_PI     = global.PI_PC1;
TreasureMaps_1up_YOFF   = 0;

TreasureMaps_Key_sprite = val(g.dm_ITEM[?STR_KEY+STR_Sprite], spr_0);
TreasureMaps_Key_PI     = global.PI_MOB_ORG;
TreasureMaps_Key_YOFF   = 0;




// -------------------------------------------------------------------------
HiddenExitIndicator_dg       = ds_grid_create($0,$5);
HiddenExitIndicator_counter  = 0;
HiddenExitIndicator_can_draw = false;
HiddenExitIndicator_sprite   = 0;
HiddenExitIndicator_xoff     = 0;
HiddenExitIndicator_yoff     = 0;
HiddenExitIndicator_xscale   = 1;
HiddenExitIndicator_yscale   = 1;




// -------------------------------------------------------------
Pause_SOUND1 = get_audio_theme_track(dk_ChooseChar);
Pause_SOUND2 = get_audio_theme_track(dk_CursorFileSelect);









// each cell represents the tile type at that row & clm of the overworld
dg_solid_def = ds_grid_create(0,0); // def: default
dg_solid     = ds_grid_create(0,0);

// A ow room size grid of the tsrc for every tile
dg_tsrc_def  = ds_grid_create(0,0); // def: default
dg_tsrc      = ds_grid_create(0,0);

dg_tid       = ds_grid_create(DRAW_CLMS, DRAW_ROWS);

dg_area      = ds_grid_create(0,0);

dg_boulders  = ds_grid_create(0,4);

dg_ChangeTiles_Boots = ds_grid_create(0,8);
TileChangeEvent_TYPE_BOOT1 = "BOOTS01";

BoulderCircle_center_OWRC    = 0; // set in init_data_overworld()
BoulderCircle_center_TSRC    = _TS1|TSRC_HOLE01; // $C8: Hole in ground
dl_BoulderCircle_broke_order = ds_list_create();
dl_BoulderCircle_OWRC        = ds_list_create();
for(_i=0; _i<8; _i++) ds_list_add(dl_BoulderCircle_OWRC, 0);




if (g.anarkhyaOverworld_MAIN)
{
    dg_anarkhya_tsrc_def        = ds_grid_create(0,0); // def: default
    dg_anarkhya_tsrc            = ds_grid_create(0,0);
    dg_anarkhya_tsrc_detail_def = ds_grid_create(0,0); // for details layer
    dg_anarkhya_tsrc_detail     = ds_grid_create(0,0); // for details layer
    dg_anarkhya_tsrc_boots      = ds_grid_create(0,2);
    
    anarkhya_TSRC_BOULDER = $173; // this includes a +1 that Tiled assigns
    anarkhya_TSRC_RUBBLE  = $146; // this includes a +1 that Tiled assigns
    anarkhya_TSRC_PALACE  = $1F1; // this includes a +1 that Tiled assigns
    anarkhya_TSRC_HOLE    = $161; // this includes a +1 that Tiled assigns
    anarkhya_TSRC_NEWKAS  = $120; // this includes a +1 that Tiled assigns
    
    anarkhya_TILE_DEPTH1 = Tile_DEPTH1-8;
    anarkhya_TILE_DEPTH2 = anarkhya_TILE_DEPTH1-1; // the details layer
}








// -------------------------------------------------------------------------
//Overworld_init_data();
// -------------------------------------------------------------------------










// -------------------------------------------------------------------------
ENC_PI  = global.PI_MOB_PUR;
ENC_PAL = build_pal(p.C_WHT1,p.C_BLK1,p.C_BLK1,p.C_BLK1,-2,-2,-2,-2);


ENC_TRIG_HB_W = $0A;
ENC_TRIG_HB_H = $10;


dm_enc           = ds_map_create();
dg_enc_inst      = ds_grid_create(6,6);
ENC_INST_TMR_IDX = ds_grid_width(dg_enc_inst)-1;


// $824D-8264:  $00,60,B0,D0,  00,60,D0,F0,  00,60,C0,E0,  00,50,BB,F0,  00,57,D7,F8,  00,57,D7,FF
//   $00, 60, B0, D0,   // FIELD
//   $00, 60, D0, F0,   // DESERT
//   $00, 60, C0, E0,   // FOREST
//   $00, 50, BB, F0,   // SWAMP
//   $00, 57, D7, F8,   // CEMETERY
//   $00, 57, D7, FF    // VOLCANO
dg_enc_obj_id_spawn_data_1 = ds_grid_create(0,4);


Encounters_can_draw = false;




            _i=0;
dg_ENC_SPR = ds_grid_create(3,4);
// Weak   enemy
dg_ENC_SPR[#_i,0] = spr_OW_enc_char_1_1a;
dg_ENC_SPR[#_i,1] = spr_OW_enc_char_1_1b;
            _i++;
// Strong enemy
dg_ENC_SPR[#_i,0] = spr_OW_enc_char_2_1a;
dg_ENC_SPR[#_i,1] = spr_OW_enc_char_2_1b;
            _i++;
// Fairy
FAIRY_IDX = _i;
dg_ENC_SPR[#_i,0] = g.dl_Fairy_SPRITES[|0]; // spr_FairyA
dg_ENC_SPR[#_i,1] = g.dl_Fairy_SPRITES[|1]; // spr_FairyB
            _i++;
//
for(_i=ds_grid_width(dg_ENC_SPR)-1; _i>=0; _i--)
{
    dg_ENC_SPR[#_i,2] = sprite_get_width( dg_ENC_SPR[#_i,0]);
    dg_ENC_SPR[#_i,3] = sprite_get_height(dg_ENC_SPR[#_i,1]);
}








// TODO: Each one of the areas needs it's own rm_name for each encounter, otherwise
// getting into an encounter for that biome will reset any trees smashed by HAMMER.
// This means you need to add each encounter biome to each rm_data_init_..
                         _area = Area_WestA;
dm_enc[?STR_Rm+STR_FIELD+_area+"01"] = _area+"22"; // WestA(All areas BEFORE JUMP cave)
dm_enc[?STR_Rm+STR_FIELD+_area+"02"] = _area+"23"; // WestA(All areas AFTER  JUMP cave)
//                                                  // 
dm_enc[?STR_Rm+STR_DESER+_area+"01"] = _area+"1D"; // WestA(All areas BEFORE JUMP cave)
dm_enc[?STR_Rm+STR_DESER+_area+"02"] = _area+"1E"; // WestA(All areas AFTER  JUMP cave)
//                                                  // 
dm_enc[?STR_Rm+STR_BEACH+_area+"01"] = _area+"46"; // WestA(All areas BEFORE JUMP cave)
dm_enc[?STR_Rm+STR_BEACH+_area+"02"] = _area+"46"; // WestA(All areas AFTER  JUMP cave)
//                                                  // 
dm_enc[?STR_Rm+STR_FORES+_area+"01"] = _area+"27"; // WestA(All areas BEFORE JUMP cave)
dm_enc[?STR_Rm+STR_FORES+_area+"02"] = _area+"28"; // WestA(All areas AFTER  JUMP cave)
//                                                  // 
dm_enc[?STR_Rm+STR_SWAMP+_area+"01"] = _area+"30"; // WestA(All areas BEFORE JUMP cave)
dm_enc[?STR_Rm+STR_SWAMP+_area+"02"] = _area+"30"; // WestA(All areas AFTER  JUMP cave)
//                                                  // 
dm_enc[?STR_Rm+STR_CEMET+_area+"01"] = _area+"35"; // WestA(All areas BEFORE JUMP cave)
dm_enc[?STR_Rm+STR_CEMET+_area+"02"] = _area+"35"; // WestA(All areas AFTER  JUMP cave)
//                                                  // 
dm_enc[?STR_Rm+STR_VOLCA+_area+"01"] = Area_EastA+"3C"; // WestA(All areas BEFORE JUMP cave)
dm_enc[?STR_Rm+STR_VOLCA+_area+"02"] = Area_EastA+"3C"; // WestA(All areas AFTER  JUMP cave)
//                                                  // 
dm_enc[?STR_Rm+STR_PATH_+_area+"01"] = _area+"39"; // WestA(All areas BEFORE JUMP cave)
dm_enc[?STR_Rm+STR_PATH_+_area+"02"] = _area+"39"; // WestA(All areas AFTER  JUMP cave)
//                                                  // 
//                                                  // 
//                                                  // 
//                                                  // 
                         _area = Area_EastA;
dm_enc[?STR_Rm+STR_FIELD+_area+"01"] = _area+"22"; // EastA(All areas BEFORE RiverDevil)
dm_enc[?STR_Rm+STR_FIELD+_area+"02"] = _area+"22"; // EastA(All areas AFTER  RiverDevil)
dm_enc[?STR_Rm+STR_FIELD+_area+"03"] = _area+"38"; // EastA(South continent)
dm_enc[?STR_Rm+STR_FIELD+_area+"04"] = _area+"38"; // EastA(Dragon Island)
//                                                  // 
dm_enc[?STR_Rm+STR_DESER+_area+"01"] = _area+"1D"; // EastA(All areas BEFORE RiverDevil), MazIs
dm_enc[?STR_Rm+STR_DESER+_area+"02"] = _area+"1E"; // EastA(All areas AFTER  RiverDevil), NewK, OldK)
dm_enc[?STR_Rm+STR_DESER+_area+"03"] = _area+"1E"; // EastA(South continent)
dm_enc[?STR_Rm+STR_DESER+_area+"04"] = _area+"1E"; // EastA(Dragon Island)
//                                                  // 
dm_enc[?STR_Rm+STR_BEACH+_area+"01"] = _area+"40"; // EastA(All areas BEFORE RiverDevil), MazIs
dm_enc[?STR_Rm+STR_BEACH+_area+"02"] = _area+"3D"; // EastA(All areas AFTER  RiverDevil), NewK, OldK)
dm_enc[?STR_Rm+STR_BEACH+_area+"03"] = _area+"3D"; // EastA(South continent)
dm_enc[?STR_Rm+STR_BEACH+_area+"04"] = _area+"3D"; // EastA(Dragon Island)
//                                                  // 
dm_enc[?STR_Rm+STR_FORES+_area+"01"] = _area+"27"; // EastA(All areas BEFORE RiverDevil), MazIs
dm_enc[?STR_Rm+STR_FORES+_area+"02"] = _area+"28"; // EastA(All areas AFTER  RiverDevil), NewK, OldK)
dm_enc[?STR_Rm+STR_FORES+_area+"03"] = _area+"43"; // EastA(South continent)
dm_enc[?STR_Rm+STR_FORES+_area+"04"] = _area+"44"; // EastA(Dragon Island)
//                                                  // 
dm_enc[?STR_Rm+STR_SWAMP+_area+"01"] = _area+"30"; // EastA(All areas BEFORE RiverDevil)
dm_enc[?STR_Rm+STR_SWAMP+_area+"02"] = _area+"30"; // EastA(All areas AFTER  RiverDevil) 
dm_enc[?STR_Rm+STR_SWAMP+_area+"03"] = _area+"32"; // EastA(South continent)
dm_enc[?STR_Rm+STR_SWAMP+_area+"04"] = _area+"45"; // EastA(Dragon Island)
//                                                  // 
dm_enc[?STR_Rm+STR_CEMET+_area+"01"] = _area+"35"; // EastA(All areas BEFORE RiverDevil)
dm_enc[?STR_Rm+STR_CEMET+_area+"02"] = _area+"35"; // EastA(All areas AFTER  RiverDevil) 
dm_enc[?STR_Rm+STR_CEMET+_area+"03"] = _area+"35"; // EastA(South Continent)
dm_enc[?STR_Rm+STR_CEMET+_area+"04"] = _area+"35"; // EastA(Dragon Island)
//                                                  // 
dm_enc[?STR_Rm+STR_VOLCA+_area+"01"] = _area+"3C"; // EastA(All areas BEFORE RiverDevil)
dm_enc[?STR_Rm+STR_VOLCA+_area+"02"] = _area+"3C"; // EastA(All areas AFTER  RiverDevil) 
dm_enc[?STR_Rm+STR_VOLCA+_area+"03"] = _area+"3C"; // EastA(South continent)
dm_enc[?STR_Rm+STR_VOLCA+_area+"04"] = _area+"3C"; // EastA(Dragon Island)
//                                                  // 
dm_enc[?STR_Rm+STR_PATH_+_area+"01"] = _area+"39"; // EastA(All areas BEFORE RiverDevil)
dm_enc[?STR_Rm+STR_PATH_+_area+"02"] = _area+"39"; // EastA(All areas AFTER  RiverDevil)
dm_enc[?STR_Rm+STR_PATH_+_area+"03"] = _area+"39"; // EastA(South continent)
dm_enc[?STR_Rm+STR_PATH_+_area+"04"] = _area+"39"; // EastA(Dragon Island)
//                                                  // 
//                                                  // 
//                                                  // 
//                                                  // 
                         _area = Area_DthMt;
dm_enc[?STR_Rm+STR_FIELD+_area+"01"] = _area+"32"; // DthMt(All)
//                                                  // 
dm_enc[?STR_Rm+STR_DESER+_area+"01"] = _area+"1D"; // DthMt(All)
//                                                  // 
dm_enc[?STR_Rm+STR_BEACH+_area+"01"] = val(dm_enc[?STR_Rm+STR_BEACH+Area_WestA+"01"]); // DthMt(All)
//                                                  // 
dm_enc[?STR_Rm+STR_FORES+_area+"01"] = _area+"27"; // DthMt(All)
//                                                  // 
dm_enc[?STR_Rm+STR_SWAMP+_area+"01"] = val(dm_enc[?STR_Rm+STR_SWAMP+Area_WestA+"01"]); // DthMt(All)
//                                                  // 
dm_enc[?STR_Rm+STR_CEMET+_area+"01"] = _area+"34"; // DthMt(All)
//                                                  // 
dm_enc[?STR_Rm+STR_VOLCA+_area+"01"] = _area+"33"; // DthMt(All)
//                                                  // 
dm_enc[?STR_Rm+STR_PATH_+_area+"01"] = _area+"39"; // DthMt(All)
//                                                  // 
//                                                  // 
//                                                  // 
//                                                  // 
                         _area = Area_MazIs;
dm_enc[?STR_Rm+STR_FIELD+_area+"01"] = val(dm_enc[?STR_Rm+STR_FIELD+Area_EastA+"01"]); // MazIs(All)
//                                                  // 
dm_enc[?STR_Rm+STR_DESER+_area+"01"] = val(dm_enc[?STR_Rm+STR_FIELD+Area_EastA+"01"]); // MazIs(All)
//                                                  // 
dm_enc[?STR_Rm+STR_BEACH+_area+"01"] = val(dm_enc[?STR_Rm+STR_BEACH+Area_EastA+"01"]); // MazIs(All)
//                                                  // 
dm_enc[?STR_Rm+STR_FORES+_area+"01"] = val(dm_enc[?STR_Rm+STR_FORES+Area_EastA+"01"]); // MazIs(All)
//                                                  // 
dm_enc[?STR_Rm+STR_SWAMP+_area+"01"] = val(dm_enc[?STR_Rm+STR_SWAMP+Area_EastA+"01"]); // MazIs(All)
//                                                  // 
dm_enc[?STR_Rm+STR_CEMET+_area+"01"] = val(dm_enc[?STR_Rm+STR_CEMET+Area_EastA+"01"]); // MazIs(All)
//                                                  // 
dm_enc[?STR_Rm+STR_VOLCA+_area+"01"] = val(dm_enc[?STR_Rm+STR_VOLCA+Area_DthMt+"01"]); // MazIs(All)
//                                                  // 
dm_enc[?STR_Rm+STR_PATH_+_area+"01"] = val(dm_enc[?STR_Rm+STR_PATH_+Area_DthMt+"01"]); // MazIs(All)
//                                                  // 
//                                                  // 
//                                                  // 
//                                                  // 








// -------------------------------------------------------------
// -------------------------------------------------------------
Biome_dm = ds_map_create();
_biome_num = 0;
_grid_rows = ds_grid_height(dg_enc_obj_id_spawn_data_1);




// -------------------------------------------------------------
_biome = Overworld_init_data_biome(STR_FIELD, hex_str(_TS1|TSRC_GRAS01,4)+hex_str(_TS1|TSRC_GRAS02,4)+hex_str(_TS1|TSRC_GRAS03,4)+hex_str(_TS1|TSRC_GRAS04,4),  true,_TS1|TSRC_GRAS04,_TS1|TSRC_GRAS01);
Overworld_init_data_encounter1(_biome, true,true, $20,$0A, "D0"+"B0"+"60"+"00"); // STR_Spawn+STR_Cooldown OG: $20

// -----------------------------------------------------------
_biome = Overworld_init_data_biome(STR_DESER, hex_str(_TS1|TSRC_SAND01,4)+hex_str(_TS1|TSRC_SAND02,4)+hex_str(_TS1|TSRC_SAND03,4)+hex_str(_TS1|TSRC_PATH03,4),  true,_TS1|TSRC_SAND02,_TS1|TSRC_SAND01,_TS1|TSRC_SAND03);
Overworld_init_data_encounter1(_biome, true,true, $18, val(dm_enc[?STR_FIELD+dk_EncounterInstance+STR_Duration],$0A), "F0"+"D0"+"60"+"00"); // STR_Spawn+STR_Cooldown OG: $18

// -----------------------------------------------------------
_biome = Overworld_init_data_biome(STR_BEACH, hex_str(_TS1|TSRC_SNOW01,4)+hex_str(_TS1|TSRC_SNOW02,4)+hex_str(_TS1|TSRC_SNOW03,4)+hex_str(_TS1|TSRC_SNOW04,4),  true,_TS1|TSRC_SNOW04,_TS1|TSRC_SNOW02,_TS1|TSRC_SNOW01);
Overworld_init_data_encounter1(_biome, true,true, $18, val(dm_enc[?STR_DESER+dk_EncounterInstance+STR_Duration],$0A), "F0"+"D0"+"60"+"00"); // STR_Spawn+STR_Cooldown OG: $18

// -----------------------------------------------------------
_biome = Overworld_init_data_biome(STR_FORES, hex_str(_TS1|TSRC_TREE01,4)+hex_str(_TS1|TSRC_TREE02,4)+hex_str(_TS1|TSRC_TREE03,4)+hex_str(_TS1|TSRC_TREE04,4),  true,-1,_TS1|TSRC_TREE01);
Overworld_init_data_encounter1(_biome, true,true, $18,$18, "E0"+"C0"+"60"+"00"); // STR_Spawn+STR_Cooldown OG: $18

// -----------------------------------------------------------
_biome = Overworld_init_data_biome(STR_SWAMP, hex_str(_TS1|TSRC_SWAM01,4)+hex_str(_TS1|TSRC_SWAM02,4)+hex_str(_TS1|TSRC_SWAM03,4)+hex_str(_TS1|TSRC_SWAM04,4),  true,_TS1|TSRC_SWAM02,_TS1|TSRC_SWAM01);
Overworld_init_data_encounter1(_biome, true,true, $20, val(dm_enc[?STR_FORES+dk_EncounterInstance+STR_Duration],$18), "F0"+"BB"+"50"+"00"); // STR_Spawn+STR_Cooldown OG: $20

// -----------------------------------------------------------
_biome = Overworld_init_data_biome(STR_CEMET, hex_str(_TS1|TSRC_GRAV01,4)+hex_str(_TS1|TSRC_GRAV02,4)+hex_str(_TS1|TSRC_GRAV03,4)+hex_str(_TS1|TSRC_GRAV04,4),  true,_TS1|TSRC_GRAV02,_TS1|TSRC_GRAV01,_TS1|TSRC_GRAV03,_TS1|TSRC_GRAV04);
Overworld_init_data_encounter1(_biome, true,true, $09,$30, "F8"+"D7"+"57"+"00"); // STR_Spawn+STR_Cooldown OG: $09

// -----------------------------------------------------------
_biome = Overworld_init_data_biome(STR_VOLCA, hex_str(_TS1|TSRC_VOLC01,4),  true,-1,_TS1|TSRC_VOLC01);
Overworld_init_data_encounter1(_biome, true,true, $03, val(dm_enc[?STR_CEMET+dk_EncounterInstance+STR_Duration],$30), "FF"+"D7"+"57"+"00"); // STR_Spawn+STR_Cooldown OG: $03

// -----------------------------------------------------------
_biome = Overworld_init_data_biome(STR_PATH_, hex_str(_TS1|TSRC_PATH01,4)+hex_str(_TS1|TSRC_PATH02,4));
Overworld_init_data_encounter1(_biome, true);








// -------------------------------------------------------------------------
enc_reen = undefined; // reen: rm entry exit name
enc_spawn_timer     = 0; // 0516. OW encounter spawn cooldown
enc_spawn_timer_add = 0;


// OBJ IDs. $8265-8274: $01,02,01,01, 01,01,01,02, 02,01,02,01 ,01,03,01,03

// _idx_obj:  0   1   2   3,    4   5   6   7,    8   9   A   B,    C   D   E   F
// _TYPES:   01, 02, 01, 01,   01, 01, 01, 02,   02, 01, 02, 01,   01, 03, 01, 03

dg_enc_obj_id_spawn_data_2 = ds_grid_create(0,4);

_idx = -1;
ds_grid_resize(dg_enc_obj_id_spawn_data_2, (++_idx)+1, ds_grid_height(dg_enc_obj_id_spawn_data_2));
dg_enc_obj_id_spawn_data_2[#_idx,0] = g.ENC_WEAK; // _idx_obj:  0
dg_enc_obj_id_spawn_data_2[#_idx,1] = g.ENC_STRG; // _idx_obj:  1
dg_enc_obj_id_spawn_data_2[#_idx,2] = g.ENC_WEAK; // _idx_obj:  2
dg_enc_obj_id_spawn_data_2[#_idx,3] = g.ENC_WEAK; // _idx_obj:  3
//                                                  //
ds_grid_resize(dg_enc_obj_id_spawn_data_2, (++_idx)+1, ds_grid_height(dg_enc_obj_id_spawn_data_2));
dg_enc_obj_id_spawn_data_2[#_idx,0] = g.ENC_WEAK; // _idx_obj:  4
dg_enc_obj_id_spawn_data_2[#_idx,1] = g.ENC_WEAK; // _idx_obj:  5
dg_enc_obj_id_spawn_data_2[#_idx,2] = g.ENC_WEAK; // _idx_obj:  6
dg_enc_obj_id_spawn_data_2[#_idx,3] = g.ENC_STRG; // _idx_obj:  7
//                                                  //
ds_grid_resize(dg_enc_obj_id_spawn_data_2, (++_idx)+1, ds_grid_height(dg_enc_obj_id_spawn_data_2));
dg_enc_obj_id_spawn_data_2[#_idx,0] = g.ENC_STRG; // _idx_obj:  8
dg_enc_obj_id_spawn_data_2[#_idx,1] = g.ENC_WEAK; // _idx_obj:  9
dg_enc_obj_id_spawn_data_2[#_idx,2] = g.ENC_STRG; // _idx_obj:  A
dg_enc_obj_id_spawn_data_2[#_idx,3] = g.ENC_WEAK; // _idx_obj:  B
//                                                  //
ds_grid_resize(dg_enc_obj_id_spawn_data_2, (++_idx)+1, ds_grid_height(dg_enc_obj_id_spawn_data_2));
dg_enc_obj_id_spawn_data_2[#_idx,0] = g.ENC_WEAK; // _idx_obj:  C
dg_enc_obj_id_spawn_data_2[#_idx,1] = g.ENC_FARY; // _idx_obj:  D
dg_enc_obj_id_spawn_data_2[#_idx,2] = g.ENC_WEAK; // _idx_obj:  E
dg_enc_obj_id_spawn_data_2[#_idx,3] = g.ENC_FARY; // _idx_obj:  F
//                                                  //




enc_objs_spawned_count = 0;








// -------------------------------------------------------------------------
Overworld_init_data();
// -------------------------------------------------------------------------








// -------------------------------------------------------------
//exit_owrc = dm[?MK_OWRC_NPAL1];
pcrc      = dm[?MK_OWRC_NPAL1];








// -------------------------------------------------------------
// 0: location num
// 1: item id
// 2: spawn datakey
// 3: rm name
// 4: owrc
// 5: -
dm_rando_locations = ds_map_create();
dm_Rando_TSRC = ds_map_create();
//dm_rando_biome = ds_map_create();
RandoTSRC_active = false;








// -------------------------------------------------------------
ItemAcquiredIndicator_can_draw = false;
ItemAcquiredIndicator_FONT     = spr_Font3_1;
ItemAcquiredIndicator_FONT_W   = sprite_get_width( ItemAcquiredIndicator_FONT);
ItemAcquiredIndicator_FONT_H   = sprite_get_height(ItemAcquiredIndicator_FONT);








// -------------------------------------------------------------------------
// Draw indicator on walkable water tiles that are always deep water graphic.
// BTI: Boots Tile Indicator
var _dg_ChangeTiles_Boots_W = ds_grid_width(dg_ChangeTiles_Boots);
dl_WaterSparkle_idx = ds_list_create();


WaterSparkle_CUE1       = $08;
WaterSparkle_DURATION1  = $20;
WaterSparkle_DURATION2  = $08;
WaterSparkle_DURATION0  = WaterSparkle_CUE1;
WaterSparkle_DURATION0 += ((WaterSparkle_DURATION1-WaterSparkle_DURATION2)*4) + WaterSparkle_DURATION2;
WaterSparkle_DURATION0 += $10;
WaterSparkle_timer      = 0;


// The row&clm of each possible pixel sparkle w/in an 8x8 square
dl_WaterSparkle_RC = ds_list_create();
ds_list_add(dl_WaterSparkle_RC,$03);
ds_list_add(dl_WaterSparkle_RC,$11);
ds_list_add(dl_WaterSparkle_RC,$17);
ds_list_add(dl_WaterSparkle_RC,$24);
//                                      //
ds_list_add(dl_WaterSparkle_RC,$30);
ds_list_add(dl_WaterSparkle_RC,$42);
ds_list_add(dl_WaterSparkle_RC,$45);
ds_list_add(dl_WaterSparkle_RC,$57);
//                                      //
ds_list_add(dl_WaterSparkle_RC,$61);
ds_list_add(dl_WaterSparkle_RC,$64);
ds_list_add(dl_WaterSparkle_RC,$76);
//                                      //
// Grid clms 0-4 represent an overworld tile under and around the pc;
// 0: under pc, 1: east of pc, 2: west of pc, 3: south of pc, 4: north of pc
// Grid row 0 is the owrc of the overworld tile. A -1 value means it will NOT sparkle.
// Grid rows 1-4 represent an 8x8 section of its overworld tile;
// 0: owrc, 1: top left, 2: top right, 3: bottom left, 4: bottom right
// The grid row values are the sparkles for the current sparkle cycle and 
// will refresh each sparkle cycle picked randomly from dl_WaterSparkle_RC
dg_WaterSparkle = ds_grid_create(5,5);
ds_grid_clear(dg_WaterSparkle,-1);


             dl_WaterSparkle_RC2 = ds_list_create();
ds_list_copy(dl_WaterSparkle_RC2,dl_WaterSparkle_RC);
ds_list_add( dl_WaterSparkle_RC2,$53);




BootsTileIndicator_VER = 2;
BootsTileIndicator_can_draw = false;
//dl_BTI_active=ds_list_create();
//BTI_DURATION0 = $08;
//BTI_DURATION1 = $14;
//BTI_DURATION2 = BTI_DURATION0*3;
//BTI_DURATION3 = $20;
//BTI_DURATION4 = BTI_DURATION1+BTI_DURATION2;
//BTI_DURATION5 = BTI_DURATION4+BTI_DURATION3;
//BTI_CUE1 = BTI_DURATION1;
BTI_DURATION0  = $0A;
BTI_DURATION1  = $10;
//BTI_DURATION0  = $04;
//BTI_DURATION1  = $08;
BTI_DURATION2  = $20;
BTI_DURATION3  = BTI_DURATION0+BTI_DURATION1;
BTI_DURATION4  =(BTI_DURATION3+BTI_DURATION0) * 3;
//BTI_DURATION4  = BTI_DURATION3*3;
//BTI_DURATION4 += BTI_DURATION0*2;
BTI_DURATION5  = BTI_DURATION2+BTI_DURATION4;


dl_BTI_OWRC = ds_list_create();
var             _dl_RC = ds_list_create();
ds_list_copy(   _dl_RC, dl_WaterSparkle_RC2);
ds_list_shuffle(_dl_RC);
dg_BTI = ds_grid_create(_dg_ChangeTiles_Boots_W,8);
for(_i=0; _i<_dg_ChangeTiles_Boots_W; _i++)
{
    _owrc =   dg_ChangeTiles_Boots[#_i,0];
    ds_list_add(dl_BTI_OWRC, _owrc);
    dg_BTI[#_i,0] = _owrc;
    
    for(_j=0; _j<3; _j++)
    {
        _idx1 = _j<<2;
        _idx2 = 2+(_j<<1);
        _idx2++;
        
        _val = (_dl_RC[|_idx1+0]+$00) <<$00;
        dg_BTI[#_i,_idx2] |= _val;
        
        _val = (_dl_RC[|_idx1+1]+$08) <<$08;
        dg_BTI[#_i,_idx2] |= _val;
        
        _val = (_dl_RC[|_idx1+2]+$80) <<$10;
        dg_BTI[#_i,_idx2] |= _val;
        
        _val = (_dl_RC[|_idx1+3]+$88) <<$18;
        dg_BTI[#_i,_idx2] |= _val;
    }
}

ds_list_destroy(_dl_RC); _dl_RC=undefined;

// 11111111    11111111    11111111    11111111    
//     11111111    11111111    11111111    11111111
// 1111    11111111    11111111    11111111    1111








// -------------------------------------------------------------
                         _i=1;
Warp_state_FLUTE       = _i++;
Warp_state_SPIN_UP     = _i++;
Warp_state_VANISH      = _i++;
Warp_state_OWRC_CHANGE = _i++;
Warp_state_APPEAR      = _i++;
Warp_state_SPIN_DOWN   = _i++;
Warp_state             = 0;

Warp_FLUTE_THEME = STR_Warp+STR_Flute;
//Warp_FLUTE_THEME = dk_MagicalKeyHouse;
//Warp_FLUTE_THEME = "_Jingle"+"01";

Warp_is_warping = false;

Warp_DURATION1 = $70;
Warp_DURATION2 = $40;
Warp_DURATION3 = $30;
Warp_timer     = 0;

Warp_owrc = $0000;
Warp_x    = 0;
Warp_y    = 0;
Warp_yoff = 0;

Warp_speed     = 0;
Warp_speed_MAX = 7;

Warp_can_draw = false;
Warp_sprite   = 0;
Warp_pi       = global.PI_MOB_ORG;
Warp_xscale   = 1;
Warp_yscale   = 1;
Warp_draw_x   = 0;
Warp_draw_y   = 0;


Warp_destination_num = 1;

var _Warp_dg_DESTINATIONS_ROWS = 3;
Warp_dg_DESTINATIONS = ds_grid_create(0, _Warp_dg_DESTINATIONS_ROWS);
_i=0;
//                                              //
ds_grid_resize(Warp_dg_DESTINATIONS,_i+1,_Warp_dg_DESTINATIONS_ROWS);
Warp_dg_DESTINATIONS[#_i,0] = STR_Rauru;
Warp_dg_DESTINATIONS[#_i,1] = g.OWRC_TOWN_RAUR1;
Warp_dg_DESTINATIONS[#_i,2] = "RAURU WOODS";
//Warp_dg_DESTINATIONS[#_i,2] = MapAreaName_RAURU;
_i++;
//                                              //
ds_grid_resize(Warp_dg_DESTINATIONS,_i+1,_Warp_dg_DESTINATIONS_ROWS);
Warp_dg_DESTINATIONS[#_i,0] = STR_Ruto;
Warp_dg_DESTINATIONS[#_i,1] = g.OWRC_TOWN_RUTO1;
Warp_dg_DESTINATIONS[#_i,2] = "RUTO MOUNTAINS";
//Warp_dg_DESTINATIONS[#_i,2] = MapAreaName_RUTO;
_i++;
//                                              //
ds_grid_resize(Warp_dg_DESTINATIONS,_i+1,_Warp_dg_DESTINATIONS_ROWS);
Warp_dg_DESTINATIONS[#_i,0] = STR_Saria;
Warp_dg_DESTINATIONS[#_i,1] = g.OWRC_TOWN_SARI1;
Warp_dg_DESTINATIONS[#_i,2] = "SARIA RIVER";
//Warp_dg_DESTINATIONS[#_i,2] = MapAreaName_SARIA;
_i++;
//                                              //
ds_grid_resize(Warp_dg_DESTINATIONS,_i+1,_Warp_dg_DESTINATIONS_ROWS);
Warp_dg_DESTINATIONS[#_i,0] = STR_Mido;
Warp_dg_DESTINATIONS[#_i,1] = g.OWRC_TOWN_MIDO1;
Warp_dg_DESTINATIONS[#_i,2] = "MIDO HARBOR";
//Warp_dg_DESTINATIONS[#_i,2] = "ROYAL CEMETERY";
//Warp_dg_DESTINATIONS[#_i,2] = MapAreaName_MIDO;
_i++;
//                                              //
ds_grid_resize(Warp_dg_DESTINATIONS,_i+1,_Warp_dg_DESTINATIONS_ROWS);
Warp_dg_DESTINATIONS[#_i,0] = STR_Nabooru;
Warp_dg_DESTINATIONS[#_i,1] = g.OWRC_TOWN_NABO1;
Warp_dg_DESTINATIONS[#_i,2] = "NABOORU FIELD";
//Warp_dg_DESTINATIONS[#_i,2] = "NABOORU BAY";
//Warp_dg_DESTINATIONS[#_i,2] = MapAreaName_NABOORU;
_i++;
//                                              //
ds_grid_resize(Warp_dg_DESTINATIONS,_i+1,_Warp_dg_DESTINATIONS_ROWS);
Warp_dg_DESTINATIONS[#_i,0] = STR_Darunia;
Warp_dg_DESTINATIONS[#_i,1] = g.OWRC_TOWN_DARU1;
Warp_dg_DESTINATIONS[#_i,2] = "DARUNIA MOUNTAINS";
//Warp_dg_DESTINATIONS[#_i,2] = MapAreaName_DARUNIA;
_i++;
//                                              //
ds_grid_resize(Warp_dg_DESTINATIONS,_i+1,_Warp_dg_DESTINATIONS_ROWS);
Warp_dg_DESTINATIONS[#_i,0] = STR_New_Kasuto;
Warp_dg_DESTINATIONS[#_i,1] = g.OWRC_TOWN_NEWK1;
//Warp_dg_DESTINATIONS[#_i,2] = "KASUTO FOREST";
//Warp_dg_DESTINATIONS[#_i,2] = "NEW KASUTO FOREST";
Warp_dg_DESTINATIONS[#_i,2] = "HIDDEN TOWN";
//Warp_dg_DESTINATIONS[#_i,2] = MapAreaName_NEW_KASUTO;
_i++;
//                                              //
ds_grid_resize(Warp_dg_DESTINATIONS,_i+1,_Warp_dg_DESTINATIONS_ROWS);
Warp_dg_DESTINATIONS[#_i,0] = STR_Old_Kasuto;
Warp_dg_DESTINATIONS[#_i,1] = g.OWRC_TOWN_OLDK1;
Warp_dg_DESTINATIONS[#_i,2] = "KASUTO RIVER";
//Warp_dg_DESTINATIONS[#_i,2] = MapAreaName_KASUTO;
_i++;
//                                              //
ds_grid_resize(Warp_dg_DESTINATIONS,_i+1,_Warp_dg_DESTINATIONS_ROWS);
Warp_dg_DESTINATIONS[#_i,0] = STR_Bulblin;
Warp_dg_DESTINATIONS[#_i,1] = g.OWRC_TOWN_BULB1;
Warp_dg_DESTINATIONS[#_i,2] = "DRAGMIRE TOWN";
//Warp_dg_DESTINATIONS[#_i,2] = "MONSTER TOWN";
//Warp_dg_DESTINATIONS[#_i,2] = MapAreaName_BULBLIN;
_i++;
//                                              //


WarpText_can_draw = false;
WarpText_FONT     = global.dl_game_font[|global.game_font_idx];
WarpText_FONT_W   = sprite_get_width( WarpText_FONT);
WarpText_FONT_H   = sprite_get_height(WarpText_FONT);
WarpText_text     = Warp_dg_DESTINATIONS[#Warp_destination_num-1,2];
WarpText_draw_xl  = 0;
WarpText_draw_yt  = 0;








// -------------------------------------------------------------
/*
sdm("dg_tid:        "+string(dg_tid));
sdm("dg_pc_spr:     "+string(dg_pc_spr));
sdm("dg_solid_def:  "+string(dg_solid_def));
sdm("dg_solid:      "+string(dg_solid));
sdm("dg_tsrc_def:   "+string(dg_tsrc_def));
sdm("dg_tsrc:       "+string(dg_tsrc));
sdm("dm_enc:        "+string(dm_enc));
sdm("dl_biome_enc:  "+string(dl_biome_enc));
sdm("dm:            "+string(dm));

sdm("dg_area:       "+string(dg_area));
sdm("dg_enc_obj_id_spawn_data_1:  "+string(dg_enc_obj_id_spawn_data_1));
sdm("dg_enc_obj_id_spawn_data_2:  "+string(dg_enc_obj_id_spawn_data_2));
sdm("dg_enc_inst:   "+string(dg_enc_inst));
sdm("dg_ENC_SPR:    "+string(dg_ENC_SPR));
//sdm("dg_owrc_area:  "+string(dg_owrc_area));
*/



ds_list_destroy(_dl0); _dl0=undefined;
//ds_list_destroy(_dl_biome_tsrc); _dl_biome_tsrc=undefined;




if (DEV)
{
    show_debug_message("Overworld_Create() END. "+string(current_time-_START_TIME));
    show_debug_message("");
}




