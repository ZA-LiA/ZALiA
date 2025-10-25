/// rm_data_init_Palc_B()


var _a, _rm, _x, _y, _data, _tsrc;
var _exit = REEN_DEFAULT;
var _dk_spawn_item0, _dk_spawn_item1, _dk_spawn_item2, _dk_spawn_item3, _dk_spawn_item4;

map_clm_off     =  0;
map_row_off     =  0;







// *************************   PALACE 2   *************************** 
// ------------------------------------------------------------------------------- 
area = area_PB;

var _DUNGEON_NUM  = $02;
var _DUNGEON_NUM_ = hex_str(_DUNGEON_NUM);

mus0 = STR_Dungeon+_DUNGEON_NUM_;
//mus0 = MUS_DUNGEON1;

var _DARK_DATA=STR_Dark+"01";
ow_axis =  0; // 0:horizontal, 1:vertical


var _DUNGEON_NAME = STR_Midoro_Palace;
g.dm_dungeon[?STR_Dungeon+_DUNGEON_NUM_+STR_Name] = _DUNGEON_NAME;
g.dm_dungeon[?STR_Dungeon+area         +STR_Name] = _DUNGEON_NAME;
g.dm_dungeon[?STR_Dungeon+STR_Num+_DUNGEON_NAME]  = _DUNGEON_NUM;
g.dm_dungeon[?STR_Dungeon+_DUNGEON_NUM_+STR_Area] = area;
g.dm_dungeon[?_DUNGEON_NAME+STR_Area]             = area;
















//   --------------------------  00  --------------------------- $0E(OG)
//    
rm_num  = $00;
set_rm_data(area+hex_str(rm_num), mus0, STR_Color+COLOR2_, STR_Tile+area_PB+'000', STR_ow_axis+hex_str(ow_axis));


data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init); // 
data_spawn(rm+STR_PRIO,SpStA,$1,  $5E<<3,(row0+$12)<<3); // SpawnByStab  1
y3=(row0+$0A)<<3;
data_spawn(rm+STR_PRIO,SpDrA,$1,  $18<<3,y3); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $46<<3,y3); // DropSpawner  1
y3=(row0+$04)<<3; y4=(row0+$16)<<3;
data_spawn(rm+STR_PRXM,Bot_A,$1,  $20<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $40<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $50<<3,y3); // Bot  1


row3=row0+$1F; row4=row0+$13;
clm3=$30; clm4=clm3-$04; clm5=clm3-$01; // clm3: Elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '05'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$13, "04");                                   // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$14,  '16'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$19,  0); // RGT 0, to Overworld 
g.dm_rm[?get_dk_dungeon_entrance(_DUNGEON_NUM)] = exit_name_r0;


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmF0,$2,  $2C<<3,(row0+$0C)<<3); // PBag v2: 100 


//data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_00",rm, STR_GLOVE+STR_JUMP);
data_path_conditions(exit_name_r0, exit_name_l0, STR_GLOVE);
data_path_conditions(exit_name_r0, exit_name_d0);
data_path_conditions(exit_name_r0, _dk_spawn_item0, STR_JUMP);

data_path_conditions(exit_name_l0, exit_name_r0, STR_GLOVE);
data_path_conditions(exit_name_l0, exit_name_d0, STR_GLOVE);
data_path_conditions(exit_name_l0, _dk_spawn_item0, STR_GLOVE+"+"+STR_JUMP);

data_path_conditions(exit_name_d0, exit_name_r0);
data_path_conditions(exit_name_d0, exit_name_l0, STR_GLOVE);
data_path_conditions(exit_name_d0, _dk_spawn_item0, STR_JUMP);

data_scene_rando(rm);








//   --------------------------  01  --------------------------- $0F(OG)
//    
rm_num  = $01;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PB+'001', STR_ow_axis+hex_str(ow_axis));


row3=row0+$16; y3=row3<<3;
row4=row0+$0A; y4=row4<<3;
row5=row4+$01; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($12<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($73<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpStA,$1,  $54<<3,(row0+$0C)<<3); // SpawnByStab  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $2E<<3,y3); // Bubble  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $38<<3,y3); // Bubble  1


clm3=$10; clm4=clm3-$04; clm5=clm3-$01; // clm3: Elev center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '08'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$13);                                           // Elevator DW $40, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '02'+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_d0);
data_path_conditions(exit_name_d0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  02  --------------------------- $10(OG)
//    
rm_num  = $02;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PB+'002', STR_ow_axis+hex_str(ow_axis));


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($2F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($6F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$1,  $5F<<3,(row0+$08)<<3); // DropSpawner  1
data_spawn(rm+STR_PRXM,BubbA,$2,  $1A<<3,(row0+$0A)<<3); // Bubble  2
data_spawn(rm+STR_PRXM,IrKnA,$1,  $20<<3,y3); // IronKnuckle  1
data_spawn(rm+STR_PRXM,IrKnA,$1,  $44<<3,y3); // IronKnuckle  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '01'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '03'+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  03  --------------------------- $11(OG)
//    
rm_num  = $03;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PB+'003', STR_ow_axis+hex_str(ow_axis));


row3=row0+$16; y3=row3<<3;
row4=row0+$10; y4=row4<<3;
row5=row3+$01; y5=row5<<3;
row6=row0+$08; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($07<<3)+4,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($73<<3)+4,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$1,  $2A<<3,y6); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $62<<3,y6); // DropSpawner  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $20<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $36<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $4C<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $50<<3,y4); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '02'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '04'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmD0,$1,  $4A<<3,(row0+$0E)<<3,  STR_Treasure+STR_Map+"01"); // Key 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, _dk_spawn_item0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  04  --------------------------- $12(OG)
//    
rm_num  = $04;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PB+'004', STR_ow_axis+hex_str(ow_axis));


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$08; y5=row5<<3;
//row5=row0+$06; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($27<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($57<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,LoDoA,$1,  $25<<3,(row3-$02)<<3); // LockedDoor
data_spawn(rm+STR_PRXM,Ra__A,$1,  $36<<3,y5); // Ra  1
data_spawn(rm+STR_PRXM,Ra__A,$1,  $48<<3,y5); // Ra  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $12<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $38<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $42<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $6C<<3,y3); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '03'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '05'+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  05  --------------------------- $13(OG)
//    
rm_num  = $05;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PB+'005', STR_ow_axis+hex_str(ow_axis));


row3=row0+$16; y3=row3<<3;
row4=row0+$08; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($52<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($21<<3)+4,(row3+$01)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$1,  $42<<3,y4); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $5C<<3,y4); // DropSpawner  1
data_spawn(rm+STR_PRXM,StalA,$2,  $10<<3,(row0+$0A)<<3); // Stalfos  2


clm3=$50; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '00'+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '0A'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row0+$13);                                    // Elevator DW $40, UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '04'+EXR0_); // LFT 0, 


data_path_conditions(exit_name_l0, exit_name_d0);
data_path_conditions(exit_name_l0, exit_name_u0);

data_path_conditions(exit_name_d0, exit_name_l0);
data_path_conditions(exit_name_d0, exit_name_u0);

data_path_conditions(exit_name_u0, exit_name_l0);
data_path_conditions(exit_name_u0, exit_name_d0);

data_scene_rando(rm);








//   --------------------------  06  --------------------------- $14(OG)
//   -------------------------  GLOVE  -------------------------- 
rm_num  = $06;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PB+'006', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($2F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($47<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($5F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  ($73<<3)+4,y4-($02<<3),  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,LoDoA,$1,  $24<<3,(row0+$15)<<3); // LockedDoor
data_spawn(rm+STR_PRIO,SpStA,$1,  $78<<3,(row0+$0B)<<3); // SpawnByStab  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $54<<3,(row0+$09)<<3); // DropSpawner  1
data_spawn(rm+STR_PRXM,IrKnA,$2,  $1E<<3,(row0+$17)<<3); // IronKnuckle  2
data_spawn(rm+STR_PRXM,IrKnA,$2,  $48<<3,(row0+$17)<<3); // IronKnuckle  2


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3-$04,  '07'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmA1,$1,  $12<<3,(row0+$17)<<3); // GLOVE


//data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_00",rm);
//data_path_conditions(exit_name_r0, exit_name_r0);
data_path_conditions(exit_name_r0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  07  --------------------------- $15(OG)
//    
rm_num  = $07;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PB+'007', STR_ow_axis+hex_str(ow_axis));


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $07<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $74<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,Spawner_FallingBlock,$1,  $36<<3,(row0+$08)<<3); // BlockSpawner  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '06'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '08'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmF0,$1,  $30<<3,y3); // PBag v1:50 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, _dk_spawn_item0, STR_GLOVE);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, _dk_spawn_item0, STR_GLOVE);

//data_scene_rando(rm);








//   --------------------------  08  --------------------------- $16(OG)
//    
rm_num  = $08;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PB+'005', STR_ow_axis+hex_str(ow_axis));


row3=row0+$16; y3=row3<<3;
row4=row0+$0A; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($52<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($21<<3)+4,(row3+$01)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,LoDoA,$1,  $24<<3,(row3-$02)<<3); // LockedDoor
data_spawn(rm+STR_PRXM,StalA,$2,  $32<<3,y4); // Stalfos  2
data_spawn(rm+STR_PRXM,Aneru01,$1,  $2C<<3,y3); // Aneru  1
data_spawn(rm+STR_PRXM,Aneru01,$1,  $5A<<3,y3); // Aneru  1


clm3=$50; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '01'+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '0B'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row0+$13, "03");                              // Elevator DW $40, UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '07'+EXR0_); // LFT 0, 


data_path_conditions(exit_name_l0, exit_name_d0);
data_path_conditions(exit_name_l0, exit_name_u0);

data_path_conditions(exit_name_d0, exit_name_l0);
data_path_conditions(exit_name_d0, exit_name_u0);

data_path_conditions(exit_name_u0, exit_name_l0);
data_path_conditions(exit_name_u0, exit_name_d0);

data_scene_rando(rm);








//   --------------------------  09  --------------------------- $17(OG)
//    
rm_num  = $09;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PB+'008', STR_ow_axis+hex_str(ow_axis));


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$0A; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($33<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($73<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,StalA,$2,  $28<<3,y5); // Stalfos  2
data_spawn(rm+STR_PRXM,StalA,$2,  $40<<3,y5); // Stalfos  2
data_spawn(rm+STR_PRXM,Bot_A,$1,  $6A<<3,(row0+$10)<<3); // Bot  1


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0A'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmD0,$1,  $06<<3,(row0+$14)<<3,  STR_Treasure+STR_Map+"01"); // Key 


data_path_conditions(exit_name_r0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  0A  --------------------------- $18(OG)
//    
rm_num  = $0A;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PB+'005', STR_ow_axis+hex_str(ow_axis));


row3=row0+$16; y3=row3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($52<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($21<<3)+4,(row3+$01)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,BubbA,$1,  $10<<3,(row0+$0A)<<3); // Bubble  1
data_spawn(rm+STR_PRXM,Aneru01,$2,  $0B<<3,y3); // Aneru  2
data_spawn(rm+STR_PRXM,Aneru01,$2,  $2E<<3,y3); // Aneru  2
data_spawn(rm+STR_PRXM,Aneru01,$2,  $36<<3,y3); // Aneru  2
data_spawn(rm+STR_PRXM,Aneru01,$2,  $68<<3,y3); // Aneru  2


clm3=$50; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '05'+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '0F'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row0+$13);                                    // Elevator DW $40, UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '09'+EXR0_); // LFT 0, 


data_path_conditions(exit_name_l0, exit_name_d0);
data_path_conditions(exit_name_l0, exit_name_u0);

data_path_conditions(exit_name_d0, exit_name_l0);
data_path_conditions(exit_name_d0, exit_name_u0);

data_path_conditions(exit_name_u0, exit_name_l0);
data_path_conditions(exit_name_u0, exit_name_d0);

data_scene_rando(rm);








//   --------------------------  0B  --------------------------- $19(OG)
//    
rm_num  = $0B;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PB+'009', STR_ow_axis+hex_str(ow_axis));


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  ($12<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($2F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($3F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($5F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($6F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,IrKnA,$1,  $30<<3,y3); // IronKnuckle  1
data_spawn(rm+STR_PRXM,IrKnA,$1,  $66<<3,y3); // IronKnuckle  1
data_spawn(rm+STR_PRXM,Moa_B,$1,  $22<<3,(row0+$10)<<3); // FieryMoa  1
//data_spawn(rm+STR_PRXM,Moa_B,$1,  $1E<<3,(row0+$10)<<3); // FieryMoa  1


clm3=$10; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '08'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row0+$14);                                                 // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0C'+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_u0);
data_path_conditions(exit_name_u0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  0C  --------------------------- $1A(OG)
//    
rm_num  = $0C;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PB+'010', STR_ow_axis+hex_str(ow_axis));


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$0A; y5=row5<<3;
row6=row0+$10; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($13<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($3F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($6B<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpBuA,$1,  $08<<3,y6); // BulletSpawner  1
data_spawn(rm+STR_PRIO,SpBuA,$2,  $1E<<3,y6); // BulletSpawner  2
data_spawn(rm+STR_PRIO,SpBuA,$1,  $34<<3,y6); // BulletSpawner  1
data_spawn(rm+STR_PRIO,SpBuA,$2,  $4A<<3,y6); // BulletSpawner  2
data_spawn(rm+STR_PRIO,SpBuA,$1,  $60<<3,y6); // BulletSpawner  1
data_spawn(rm+STR_PRIO,SpBuA,$2,  $76<<3,y6); // BulletSpawner  2
data_spawn(rm+STR_PRXM,StalA,$2,  $18<<3,y5); // Stalfos  2
data_spawn(rm+STR_PRXM,StalA,$2,  $44<<3,y5); // Stalfos  2
data_spawn(rm+STR_PRXM,StalA,$2,  $70<<3,y5); // Stalfos  2


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0B'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0D'+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0, STR_GLOVE);
data_path_conditions(exit_name_l0, exit_name_r0, STR_GLOVE);

data_scene_rando(rm);








//   --------------------------  0D  --------------------------- $1B(OG)
//    
rm_num  = $0D;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PB+'011', STR_ow_axis+hex_str(ow_axis));


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$0A; y5=row5<<3;
row6=row0+$08; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($09<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($75<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($52<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$1,  $46<<3,y6); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $58<<3,y6); // DropSpawner  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $1C<<3,y5); // Bubble  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $2C<<3,y6); // Bubble  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $42<<3,y5); // Bubble  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $72<<3,y5); // Bubble  1


clm3=$50; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '11'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$14);                                           // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0C'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0E'+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_d0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_d0);

data_path_conditions(exit_name_d0, exit_name_r0);
data_path_conditions(exit_name_d0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  0E  --------------------------- $1C(OG)
//    
rm_num  = $0E;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PB+'012', STR_ow_axis+hex_str(ow_axis));


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
x3=($0C<<3)+4; _dist=$18<<3; _i=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_i++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_i++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_i++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_i++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  ($6B<<3)+4,y4-($02<<3),  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GumaA,$1,  $70<<3,y3); // Guma  1
data_spawn(rm+STR_PRXM,WosuA,$1,  $2C<<3,y3); // Wosu  1
data_spawn(rm+STR_PRXM,WosuA,$1,  $3C<<3,y3); // Wosu  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $14<<3,y3); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0D'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0D,  '15'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmD0,$1,  $78<<3,(row0+$12)<<3,  STR_Treasure+STR_Map+"01"); // Key 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, _dk_spawn_item0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  0F  --------------------------- $1D(OG)
//    
rm_num  = $0F;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PB+'013', STR_ow_axis+hex_str(ow_axis));


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$0B; y5=row5<<3;
x3=($0C<<3)+4; x4=($12<<3)+4; x5=$78<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,y4,  STR_Lit,STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x4,y4,  STR_Lit,STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x5,y5,  STR_Lit,STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,y4,  STR_Qualified+STR_Quest+STR_Nums+"02"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x4,y4,  STR_Qualified+STR_Quest+STR_Nums+"02"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x5,y5,  STR_Qualified+STR_Quest+STR_Nums+"02"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpBuA,$1,  $40<<3,(row0+$0C)<<3); // BulletSpawner  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $46<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $4A<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $4E<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $52<<3,y3-$10); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $5A<<3,y3-$20); // Bot  1


clm3=$10; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '0A'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row0+$14);                                           // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0A,  '10'+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_u0);
data_path_conditions(exit_name_u0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  10  --------------------------- $1E(OG)
//    
rm_num  = $10;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PB+'014', STR_ow_axis+hex_str(ow_axis));


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
x3=($2D<<3)+4; _dist=$10<<3; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0F<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_a++),y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_a++),y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_a++),y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_a++),y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_a++),y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GumaA,$1,  $30<<3,y3); // Guma  1
data_spawn(rm+STR_PRXM,GumaA,$1,  $68<<3,y3); // Guma  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0F'+EXR0_); // LFT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmD0,$1,  $78<<3,(row0+$12)<<3,  STR_Treasure+STR_Map+"01"); // Key 


data_path_conditions(exit_name_l0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  11  --------------------------- $1F(OG)
//    
rm_num  = $11;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PB+'013', STR_ow_axis+hex_str(ow_axis));


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0C<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($12<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $78<<3,(row0+$0B)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,LoDoA,$1,  $3C<<3,(row3-$02)<<3); // Formally in rm_num $17
data_spawn(rm+STR_PRIO,SpStA,$1,  $74<<3,(row0+$16)<<3); // SpawnByStab  1
data_spawn(rm+STR_PRXM,GumaA,$1,  $5E<<3,(row0+$0E)<<3); // Guma  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $58<<3,(row0+$12)<<3); // Bot  1


clm3=$10; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '0D'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row0+$14);                                           // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0A,  '12'+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_u0);
data_path_conditions(exit_name_u0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  12  --------------------------- $20(OG)
//    
rm_num  = $12;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PB+'015', STR_ow_axis+hex_str(ow_axis));


row3=row0+$14; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,(row0+$09)<<3,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($2F<<3)+4,y4,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4F<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($6F<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,WosuA,$1,  $60<<3,y3); // Wosu  1
data_spawn(rm+STR_PRXM,WosuA,$1,  $62<<3,y3); // Wosu  1
data_spawn(rm+STR_PRXM,IrKnA,$2,  $64<<3,y3); // IronKnuckle  2


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$08,  '11'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '18'+EXL0_); // RGT 0, 
//data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '17'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmF0,$2,  $10<<3,y3); // PBag v2: 100 


data_path_conditions(exit_name_r0, exit_name_l0, STR_JUMP);
data_path_conditions(exit_name_r0, _dk_spawn_item0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  13  --------------------------- $21(OG)
//    


//   --------------------------  14  --------------------------- $22(OG)
//   -----------------------  HELMETHEAD  ------------------------ 
rm_num  = $14;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PB+'016', STR_ow_axis+hex_str(ow_axis));


row3=row0+$15; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0F<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $50<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $5F<<3,y4); // v1: Light w/ CANDLE or FIRE
clm3=$30; // arena center clm
data_spawn(rm+STR_PRIO,Helmethead01,$1,  (clm3+$10)<<3,(row3+$02)<<3,  STR_Arena+'_x'+hex_str(clm3<<3)); // Helmethead  1
data_spawn(rm+STR_PRIO,CrHoA,$1,  CRYSTALHOLDER_XL,y3); // CrystalHolder  1
g.dm_rm[?STR_Boss+STR_Scene+STR_Name+_DUNGEON_NAME] = rm;


_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '18'+EXR0_); // LFT 0, 
g.dm_rm[?_DUNGEON_NAME+STR_Boss+STR_Scene+STR_Entrance+STR_Exit] = _exit;

_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0);  // RGT 0, to Overworld 
g.dm_rm[?STR_Boss+STR_Dungeon+STR_Exit+STR_Name+_DUNGEON_NAME] = _exit;


set_rm_data_1a(rm_name, area_PB+'019', 2); // 019: 2nd Quest. Arena filled with swamp water.


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  15  --------------------------- 
//   Swamp room 1
rm_num  = $15;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PB+'018', STR_ow_axis+hex_str(ow_axis));


row3=row0+$14; y3=row3<<3;
row4=row0+$06; y4=row4<<3;
row5=row0+$1A; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,(row3+$01)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bot_A,$1,  $20<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $40<<3,y5); // Bot  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $20<<3,y4); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $40<<3,y4); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $60<<3,y4); // DropSpawner  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0E'+EXR0_); // LFT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  $79<<3,(row0+$14)<<3,  STR_Treasure+STR_Map+"01"); // MAGIC PIECE


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);
//data_path_conditions(exit_name_l0, exit_name_l0);
data_path_conditions(exit_name_l0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  16  --------------------------- 
//    
rm_num  = $16;
set_rm_data(area+hex_str(rm_num), mus0, STR_Color+COLOR2_, STR_Tile+area_PB+'017', STR_ow_axis+hex_str(ow_axis));


row3=row0+$14; y3=row3<<3;
row4=row0+$0A; y4=row4<<3;
row7=row0+$14;
row5=row7+$02; y5=row5<<3;
row6=row7+$07; y6=row6<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init); // 
data_spawn(rm+STR_PRIO,SpDrA,$1,  $62<<3,y4); // DropSpawner  1
data_spawn(rm+STR_PRXM,Octorok01,$1,  $0C<<3,y5); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $28<<3,y5); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $3E<<3,y6); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $66<<3,y5); // Octorok  1 


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '00'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmG0,$1,  ($23<<3)+1,row3<<3,  STR_Treasure+STR_Map+"01"); // Extra Life Doll 


//data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_00",rm);
//data_path_conditions(exit_name_r0, exit_name_r0);
data_path_conditions(exit_name_r0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  17  --------------------------- 
//    
rm_num  = $17;



//   --------------------------  18  --------------------------- 
//    
rm_num  = $18;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PB+'026', STR_ow_axis+hex_str(ow_axis));


row3=row0+$18; y3=row3<<3;
row4=row0+$14; y4=row4<<3;
row5=row3-$01; y5=row5<<3;
row6=row0+$0E; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($08<<3)+4,y5,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($20<<3)+4,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($38<<3)+4,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($50<<3)+4,(row4+$01)<<3,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,StalA,$2,  $20<<3,(row3-$05)<<3); // Stalfos  2
data_spawn(rm+STR_PRXM,StalA,$2,  $40<<3,(row3-$05)<<3,  STR_Qualified+STR_Quest+STR_Nums+"01"); // Stalfos  2
data_spawn(rm+STR_PRXM,StalA,$2,  $50<<3,(row5-$03)<<3,  STR_Qualified+STR_Quest+STR_Nums+"01"); // Stalfos  2
data_spawn(rm+STR_PRXM,IrKnA,$1,  $40<<3,y3,  STR_Qualified+STR_Quest+STR_Nums+"02"); // IronKnuckle  1
data_spawn(rm+STR_PRXM,IrKnA,$2,  $50<<3,y4,  STR_Qualified+STR_Quest+STR_Nums+"02"); // IronKnuckle  2
data_spawn(rm+STR_PRXM,BubbA,$1,  $30<<3,(row3-$05)<<3,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Bubble  1
//data_spawn(rm+STR_PRIO,SpDrA,$1,  $14<<3,y6,  STR_Type+hex_str(2)); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $14<<3,y6,  STR_Type+hex_str(2)); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $2C<<3,y6,  STR_Type+hex_str(2)); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $3C<<3,y6,  STR_Type+hex_str(2)); // DropSpawner  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '12'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  '14'+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);







//   --------------------------  19  --------------------------- 
//    


//   --------------------------  1A  --------------------------- 
//    


//   --------------------------  1B  --------------------------- 
//    


//   --------------------------  1C  --------------------------- 
//    


//   --------------------------  1D  --------------------------- 
//    


//   --------------------------  1E  --------------------------- 
//    


//   --------------------------  1F  --------------------------- 
//    


//   --------------------------  20  --------------------------- 
//    


//   --------------------------  21  --------------------------- 
//    


//   --------------------------  22  --------------------------- 
//    


//   --------------------------  23  --------------------------- 
//    


//   --------------------------  24  --------------------------- 
//    


//   --------------------------  25  --------------------------- 
//    


//   --------------------------  26  --------------------------- 
//    


//   --------------------------  27  --------------------------- 
//    


//   --------------------------  28  --------------------------- 
//    


//   --------------------------  29  --------------------------- 
//    


//   --------------------------  2A  --------------------------- 
//    


//   --------------------------  2B  --------------------------- 
//    


//   --------------------------  2C  --------------------------- 
//    


//   --------------------------  2D  --------------------------- 
//    


//   --------------------------  2E  --------------------------- 
//    


//   --------------------------  2F  --------------------------- 
//    


//   --------------------------  30  --------------------------- 
//    


//   --------------------------  31  --------------------------- 
//    


//   --------------------------  32  --------------------------- 
//    


//   --------------------------  33  --------------------------- 
//    


//   --------------------------  34  --------------------------- 
//    


//   --------------------------  35  --------------------------- 
//    


//   --------------------------  36  --------------------------- 
//    


//   --------------------------  37  --------------------------- 
//    


//   --------------------------  38  --------------------------- 
//    


//   --------------------------  39  --------------------------- 
//    


//   --------------------------  3A  --------------------------- 
//    


//   --------------------------  3B  --------------------------- 
//    


//   --------------------------  3C  --------------------------- 
//    


//   --------------------------  3D  --------------------------- 
//    


//   --------------------------  3E  --------------------------- 
//    


//   --------------------------  3F  --------------------------- 
//    


//   --------------------------  40  --------------------------- 
//    


//   --------------------------  41  --------------------------- 
//    


//   --------------------------  42  --------------------------- 
//    


//   --------------------------  43  --------------------------- 
//    


//   --------------------------  44  --------------------------- 
//    


//   --------------------------  45  --------------------------- 
//    


//   --------------------------  46  --------------------------- 
//    


//   --------------------------  47  --------------------------- 
//    


//   --------------------------  48  --------------------------- 
//    


//   --------------------------  49  --------------------------- 
//    


//   --------------------------  4A  --------------------------- 
//    


//   --------------------------  4B  --------------------------- 
//    


//   --------------------------  4C  --------------------------- 
//    


//   --------------------------  4D  --------------------------- 
//    


//   --------------------------  4E  --------------------------- 
//    


//   --------------------------  4F  --------------------------- 
//    


//   --------------------------  50  --------------------------- 
//    


//   --------------------------  51  --------------------------- 
//    


//   --------------------------  52  --------------------------- 
//    


//   --------------------------  53  --------------------------- 
//    


//   --------------------------  54  --------------------------- 
//    


//   --------------------------  55  --------------------------- 
//    


//   --------------------------  56  --------------------------- 
//    


//   --------------------------  57  --------------------------- 
//    


//   --------------------------  58  --------------------------- 
//    


//   --------------------------  59  --------------------------- 
//    


//   --------------------------  5A  --------------------------- 
//    


//   --------------------------  5B  --------------------------- 
//    


//   --------------------------  5C  --------------------------- 
//    


//   --------------------------  5D  --------------------------- 
//    


//   --------------------------  5E  --------------------------- 
//    


//   --------------------------  5F  --------------------------- 
//    


//   --------------------------  60  --------------------------- 
//    


//   --------------------------  61  --------------------------- 
//    


//   --------------------------  62  --------------------------- 
//    


//   --------------------------  63  --------------------------- 
//    


//   --------------------------  64  --------------------------- 
//    


//   --------------------------  65  --------------------------- 
//    


//   --------------------------  66  --------------------------- 
//    


//   --------------------------  67  --------------------------- 
//    


//   --------------------------  68  --------------------------- 
//    


//   --------------------------  69  --------------------------- 
//    


//   --------------------------  6A  --------------------------- 
//    


//   --------------------------  6B  --------------------------- 
//    


//   --------------------------  6C  --------------------------- 
//    


//   --------------------------  6D  --------------------------- 
//    


//   --------------------------  6E  --------------------------- 
//    


//   --------------------------  6F  --------------------------- 
//    


//   --------------------------  70  --------------------------- 
//    


//   --------------------------  71  --------------------------- 
//    


//   --------------------------  72  --------------------------- 
//    


//   --------------------------  73  --------------------------- 
//    


//   --------------------------  74  --------------------------- 
//    


//   --------------------------  75  --------------------------- 
//    


//   --------------------------  76  --------------------------- 
//    


//   --------------------------  77  --------------------------- 
//    


//   --------------------------  78  --------------------------- 
//    


//   --------------------------  79  --------------------------- 
//    


//   --------------------------  7A  --------------------------- 
//    


//   --------------------------  7B  --------------------------- 
//    


//   --------------------------  7C  --------------------------- 
//    


//   --------------------------  7D  --------------------------- 
//    


//   --------------------------  7E  --------------------------- 
//    


//   --------------------------  7F  --------------------------- 
//    


//   --------------------------  80  --------------------------- 
//    


//   --------------------------  81  --------------------------- 
//    


//   --------------------------  82  --------------------------- 
//    


//   --------------------------  83  --------------------------- 
//    


//   --------------------------  84  --------------------------- 
//    


//   --------------------------  85  --------------------------- 
//    


//   --------------------------  86  --------------------------- 
//    


//   --------------------------  87  --------------------------- 
//    


//   --------------------------  88  --------------------------- 
//    


//   --------------------------  89  --------------------------- 
//    


//   --------------------------  8A  --------------------------- 
//    


//   --------------------------  8B  --------------------------- 
//    


//   --------------------------  8C  --------------------------- 
//    


//   --------------------------  8D  --------------------------- 
//    


//   --------------------------  8E  --------------------------- 
//    


//   --------------------------  8F  --------------------------- 
//    


//   --------------------------  90  --------------------------- 
//    


//   --------------------------  91  --------------------------- 
//    


//   --------------------------  92  --------------------------- 
//    


//   --------------------------  93  --------------------------- 
//    


//   --------------------------  94  --------------------------- 
//    


//   --------------------------  95  --------------------------- 
//    


//   --------------------------  96  --------------------------- 
//    


//   --------------------------  97  --------------------------- 
//    


//   --------------------------  98  --------------------------- 
//    


//   --------------------------  99  --------------------------- 
//    


//   --------------------------  9A  --------------------------- 
//    


//   --------------------------  9B  --------------------------- 
//    


//   --------------------------  9C  --------------------------- 
//    


//   --------------------------  9D  --------------------------- 
//    


//   --------------------------  9E  --------------------------- 
//    


//   --------------------------  9F  --------------------------- 
//    


//   --------------------------  A0  --------------------------- 
//    


//   --------------------------  A1  --------------------------- 
//    


//   --------------------------  A2  --------------------------- 
//    


//   --------------------------  A3  --------------------------- 
//    


//   --------------------------  A4  --------------------------- 
//    


//   --------------------------  A5  --------------------------- 
//    


//   --------------------------  A6  --------------------------- 
//    


//   --------------------------  A7  --------------------------- 
//    


//   --------------------------  A8  --------------------------- 
//    


//   --------------------------  A9  --------------------------- 
//    


//   --------------------------  AA  --------------------------- 
//    


//   --------------------------  AB  --------------------------- 
//    


//   --------------------------  AC  --------------------------- 
//    


//   --------------------------  AD  --------------------------- 
//    


//   --------------------------  AE  --------------------------- 
//    


//   --------------------------  AF  --------------------------- 
//    


//   --------------------------  B0  --------------------------- 
//    


//   --------------------------  B1  --------------------------- 
//    


//   --------------------------  B2  --------------------------- 
//    


//   --------------------------  B3  --------------------------- 
//    


//   --------------------------  B4  --------------------------- 
//    


//   --------------------------  B5  --------------------------- 
//    


//   --------------------------  B6  --------------------------- 
//    


//   --------------------------  B7  --------------------------- 
//    


//   --------------------------  B8  --------------------------- 
//    


//   --------------------------  B9  --------------------------- 
//    


//   --------------------------  BA  --------------------------- 
//    


//   --------------------------  BB  --------------------------- 
//    


//   --------------------------  BC  --------------------------- 
//    


//   --------------------------  BD  --------------------------- 
//    


//   --------------------------  BE  --------------------------- 
//    


//   --------------------------  BF  --------------------------- 
//    


//   --------------------------  C0  --------------------------- 
//    


//   --------------------------  C1  --------------------------- 
//    


//   --------------------------  C2  --------------------------- 
//    


//   --------------------------  C3  --------------------------- 
//    


//   --------------------------  C4  --------------------------- 
//    


//   --------------------------  C5  --------------------------- 
//    


//   --------------------------  C6  --------------------------- 
//    


//   --------------------------  C7  --------------------------- 
//    


//   --------------------------  C8  --------------------------- 
//    


//   --------------------------  C9  --------------------------- 
//    


//   --------------------------  CA  --------------------------- 
//    


//   --------------------------  CB  --------------------------- 
//    


//   --------------------------  CC  --------------------------- 
//    


//   --------------------------  CD  --------------------------- 
//    


//   --------------------------  CE  --------------------------- 
//    


//   --------------------------  CF  --------------------------- 
//    


//   --------------------------  D0  --------------------------- 
//    


//   --------------------------  D1  --------------------------- 
//    


//   --------------------------  D2  --------------------------- 
//    


//   --------------------------  D3  --------------------------- 
//    


//   --------------------------  D4  --------------------------- 
//    


//   --------------------------  D5  --------------------------- 
//    


//   --------------------------  D6  --------------------------- 
//    


//   --------------------------  D7  --------------------------- 
//    


//   --------------------------  D8  --------------------------- 
//    


//   --------------------------  D9  --------------------------- 
//    


//   --------------------------  DA  --------------------------- 
//    


//   --------------------------  DB  --------------------------- 
//    


//   --------------------------  DC  --------------------------- 
//    


//   --------------------------  DD  --------------------------- 
//    


//   --------------------------  DE  --------------------------- 
//    


//   --------------------------  DF  --------------------------- 
//    


//   --------------------------  E0  --------------------------- 
//    


//   --------------------------  E1  --------------------------- 
//    


//   --------------------------  E2  --------------------------- 
//    


//   --------------------------  E3  --------------------------- 
//    


//   --------------------------  E4  --------------------------- 
//    


//   --------------------------  E5  --------------------------- 
//    


//   --------------------------  E6  --------------------------- 
//    


//   --------------------------  E7  --------------------------- 
//    


//   --------------------------  E8  --------------------------- 
//    


//   --------------------------  E9  --------------------------- 
//    


//   --------------------------  EA  --------------------------- 
//    


//   --------------------------  EB  --------------------------- 
//    


//   --------------------------  EC  --------------------------- 
//    


//   --------------------------  ED  --------------------------- 
//    


//   --------------------------  EE  --------------------------- 
//    


//   --------------------------  EF  --------------------------- 
//    


//   --------------------------  F0  --------------------------- 
//    


//   --------------------------  F1  --------------------------- 
//    


//   --------------------------  F2  --------------------------- 
//    


//   --------------------------  F3  --------------------------- 
//    


//   --------------------------  F4  --------------------------- 
//    


//   --------------------------  F5  --------------------------- 
//    


//   --------------------------  F6  --------------------------- 
//    


//   --------------------------  F7  --------------------------- 
//    


//   --------------------------  F8  --------------------------- 
//    


//   --------------------------  F9  --------------------------- 
//    


//   --------------------------  FA  --------------------------- 
//    


//   --------------------------  FB  --------------------------- 
//    


//   --------------------------  FC  --------------------------- 
//    


//   --------------------------  FD  --------------------------- 
//    


//   --------------------------  FE  --------------------------- 
//    


//   --------------------------  FF  --------------------------- 
//   




