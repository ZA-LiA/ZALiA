/// Cutscene_CreateWaterfall_init_1()


var _i, _a, _idx;

Cutscene_init();

spawn_xl = $2D<<3;
spawn_yt = ((g.rm_rows-PAGE_ROWS)+$10)<<3;
set_xlyt(id, spawn_xl,spawn_yt);

                      _a=1;
SUB_STATE_CHECK0    = _a++;
SUB_STATE_CHECK1    = _a++;
//SUB_STATE_IDLE      = _a++;
SUB_STATE_ACTV0     = _a++;
SUB_STATE_ACTV1     = _a++;
SUB_STATE_ACTV2     = _a++;
SUB_STATE_ACTV3     = _a++;
//SUB_STATE_OPEN1     = _a++;
SUB_STATE_DONE      = _a++;
sub_state           = SUB_STATE_CHECK0;


counter = 0;

DUR1 = $30;
DUR2 = $10;
//DUR3 = $30; // stun flash duration


CLMS            = $09;
ROWS            = $10;
//rows_up         =  0;

lead_row_y      = yt;
rows_added      = 0;


var                    _PI_SET = p.PI_DRK1;
if (rm_pal_qual_lit()) _PI_SET = p.PI_LIT1;




//Waterfall_DEPTH = DEPTH_BG2;
Waterfall_DEPTH = DEPTH_BG4;
Waterfall_DRAW_DEPTH = Waterfall_DEPTH;
Waterfall_SPEED = 0; // 0,1,3,7,15..
Waterfall_TS    = g.ts_Natural1_HMS;
Waterfall_TSRC1 = $F8; // water body
Waterfall_TSRC2 = $F0; // water head
Waterfall_DEPTH_IDX = ds_list_find_index(g.dl_TILE_DEPTHS,Waterfall_DEPTH);
//Waterfall_PI        = p.dg_depth_pi[#Waterfall_DEPTH_IDX,1];
WaterfallPI_LIT  = global.PI_BGR3 + p.PI_LIT1;
WaterfallPI_DARK = global.PI_BGR3 + p.PI_DRK1;
//Waterfall_PI = global.PI_BGR3;


AquiferWater_DEPTH      = DEPTH_FG2;
AquiferWater_Rise_SPEED = $04-1;
AquiferWater_yoff       = 0;
AquiferWater_yoff_MAX   = ($02<<3) + 4;


Block_DEPTH     = DEPTH_BG2;
BlockTile_CLMS  = $03;
BlockTile_ROWS  = $03;
BlockTile_COUNT = BlockTile_CLMS * BlockTile_ROWS;


Blocks1_CLM     =  xl>>3;
Blocks1_ROW     = (yt>>3)-2;
Blocks1_CLMS    = $03;
Blocks1_ROWS    = $01;
Blocks1_COUNT   = Blocks1_CLMS * Blocks1_ROWS;
Blocks1_TILE_COUNT = Blocks1_COUNT * BlockTile_COUNT;

Blocks2_CLM     = $57;
Blocks2_ROW     = (g.rm_rows-PAGE_ROWS)+$0F;
Blocks2_CLMS    = $01;
Blocks2_ROWS    = $02;
Blocks2_COUNT   = Blocks2_CLMS * Blocks2_ROWS;
Blocks2_TILE_COUNT = Blocks2_COUNT * BlockTile_COUNT;


//TSRC_BREAK1_C
Block_Crumble_TS    = ts_Man_made_1a_WRB;
Block_Crumble_TSRC1 = $4F;
Block_Crumble_TSRC2 = Block_Crumble_TSRC1+$10;
dg_Block_Crumble_TSRC = ds_grid_create(BlockTile_CLMS,BlockTile_ROWS);
dg_Block_Crumble_TSRC[#0,0] = Block_Crumble_TSRC1;
dg_Block_Crumble_TSRC[#0,1] = Block_Crumble_TSRC1;
dg_Block_Crumble_TSRC[#0,2] = Block_Crumble_TSRC1;
//                                          //
dg_Block_Crumble_TSRC[#1,0] = Block_Crumble_TSRC1;
dg_Block_Crumble_TSRC[#1,1] = Block_Crumble_TSRC2;
dg_Block_Crumble_TSRC[#1,2] = Block_Crumble_TSRC1;
//                                          //
dg_Block_Crumble_TSRC[#2,0] = Block_Crumble_TSRC2;
dg_Block_Crumble_TSRC[#2,1] = Block_Crumble_TSRC2;
dg_Block_Crumble_TSRC[#2,2] = Block_Crumble_TSRC2;
//                                          //



depth = Waterfall_DRAW_DEPTH;






//LockedDoor      = noone;
LockedDoor_XL = $58<<3;
LockedDoor_YT = ((g.rm_rows-PAGE_ROWS)+$0F) <<3;


dl_Tyell_SPAWN_DK = ds_list_create();




