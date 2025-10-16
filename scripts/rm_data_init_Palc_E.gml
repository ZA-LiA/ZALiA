/// rm_data_init_Palc_E()


var _i, _a, _val, _dist;
var _x,_x1,_x2,_y,_yt, _w,_w2,_w3, _h,_h2,_h3;
var _clm,_clm2, _row,_row2, _clms,_rows;
var _pi, _obj;
var _rm, _file, _data, _exit, _owrc;
var _exit, _file;
var _exit_name = REEN_DEFAULT;
//var _Ra_VER = 1; // P5 OG
var _Ra_VER = 2; // mod
var _dk_spawn_item0, _dk_spawn_item1, _dk_spawn_item2, _dk_spawn_item3, _dk_spawn_item4;








// *************************   PALACE 5   *************************** 
// ------------------------------------------------------------------------------- 
area = area_PE;

var _DUNGEON_NUM  = $05;
var _DUNGEON_NUM_ = hex_str(_DUNGEON_NUM);

mus0 = STR_Dungeon+_DUNGEON_NUM_;
//mus0 = MUS_DUNGEON1;

var _DARK_DATA=STR_Dark+"01";
ow_axis =  0; // 0:horizontal, 1:vertical


var _DUNGEON_NAME = STR_Palace_On_The_Sea;
g.dm_dungeon[?STR_Dungeon+_DUNGEON_NUM_+STR_Name] = _DUNGEON_NAME;
g.dm_dungeon[?STR_Dungeon+area         +STR_Name] = _DUNGEON_NAME;
g.dm_dungeon[?STR_Dungeon+STR_Num+_DUNGEON_NAME]  = _DUNGEON_NUM;
g.dm_dungeon[?STR_Dungeon+_DUNGEON_NUM_+STR_Area] = area;
g.dm_dungeon[?_DUNGEON_NAME+STR_Area]             = area;








//   --------------------------  00  --------------------------- 23
//    
rm_num  = $00;
set_rm_data(area+hex_str(rm_num), mus0, STR_Color+COLOR2_, STR_Tile+area_PE+'040', STR_ow_axis+hex_str(ow_axis));


data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
y3=(row0+$0A)<<3; y4=(row0+$12)<<3;
_val=$19;
data_spawn(rm+STR_PRIO,SpStA,$2,  (_val-1)<<3,y4); // SpawnByStab  2
data_spawn(rm+STR_PRIO,SpStA,$2,  (clms0-_val-1)<<3,y4); // SpawnByStab  2
data_spawn(rm+STR_PRIO,MagnA,$2,  $20<<3,y3); // Magnot 2
data_spawn(rm+STR_PRIO,MagnA,$2,  $28<<3,y3); // Magnot 2
data_spawn(rm+STR_PRIO,MagnA,$2,  $30<<3,y3); // Magnot 2
data_spawn(rm+STR_PRIO,MagnA,$2,  $4E<<3,y3); // Magnot 2
data_spawn(rm+STR_PRIO,MagnA,$2,  $56<<3,y3); // Magnot 2
data_spawn(rm+STR_PRIO,MagnA,$2,  $5E<<3,y3); // Magnot 2


clm3=$40; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '01'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row0+$13, "04");                                  // Elevator DW $40, 
row3=row0+$19;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld
g.dm_rm[?get_dk_dungeon_entrance(_DUNGEON_NUM)] = exit_name_l0;


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmF0,$4,  $5A<<3,(row0+$04)<<3); // PBag v4: 200 


//data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_00",rm, STR_JUMP);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_d0);
data_path_conditions(exit_name_r0, _dk_spawn_item0, STR_JUMP);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_d0);
data_path_conditions(exit_name_l0, _dk_spawn_item0, STR_JUMP);

data_path_conditions(exit_name_d0, exit_name_r0);
data_path_conditions(exit_name_d0, exit_name_l0);
data_path_conditions(exit_name_d0, _dk_spawn_item0, STR_JUMP);

data_scene_rando(rm);








//   --------------------------  01  --------------------------- 24
//    
rm_num  = $01;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'001', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0C<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($12<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $78<<3,(row0+$0C)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpBuA,$1,  $40<<3,(row0+$0D)<<3); // BulletSpawner  1
data_spawn(rm+STR_PRXM,Aneru01,$1,  $4E<<3,(row0+$17)<<3); // Aneru  1
data_spawn(rm+STR_PRXM,Aneru01,$1,  $56<<3,(row0+$15)<<3); // Aneru  1
data_spawn(rm+STR_PRXM,Aneru01,$1,  $5E<<3,(row0+$13)<<3); // Aneru  1
data_spawn(rm+STR_PRXM,Aneru01,$1,  $66<<3,(row0+$11)<<3); // Aneru  1
data_spawn(rm+STR_PRXM,Aneru01,$1,  $6E<<3,(row0+$0F)<<3); // Aneru  1


clm3=$10; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '00'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_,  clm3,row0+$15);                                          // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0B,  '02'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_01",rm);
data_path_conditions(exit_name_r0, exit_name_u0);
data_path_conditions(exit_name_u0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  02  --------------------------- 
//    
rm_num  = $02;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'025', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0C<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($77<<3)+4,(row0+$0C)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,BubbA,$1,  $20<<3,(row0+$17)<<3,  STR_Direction+hex_str($2|$8)); // Bubble  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $47<<3,(row0+$0C)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $78<<3,(row0+$07)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$17,  '01'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0B,  '03'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmD0,$1,  $73<<3,(row0+$0C)<<3,  STR_Treasure+STR_Map+"02"); // Key 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_FAIRY);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, _dk_spawn_item0);

data_path_conditions(exit_name_l0, exit_name_r0, STR_FAIRY);
data_path_conditions(exit_name_l0, _dk_spawn_item0, STR_FAIRY);

data_scene_rando(rm);








//   --------------------------  03  --------------------------- 26
//    
rm_num  = $03;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'003', STR_ow_axis+hex_str(ow_axis));


row3=row0+$15; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$05; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($07<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($77<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Ra__A,$1,  $36<<3,y5); // Ra  1
data_spawn(rm+STR_PRXM,Ra__A,$1,  $48<<3,y5); // Ra  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '02'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '04'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmF0,$4,  $4C<<3,(row0+$09)<<3); // PBag v4: 200


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, _dk_spawn_item0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  04  --------------------------- 
//    
rm_num  = $04;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'028', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0B<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($6C<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
row4=row0+$09; y4=row4<<3;
data_spawn(rm+STR_PRIO,LoDoA,$1,  $5E<<3,(row3-$02)<<3); // LockedDoor
// mod. Added extra DropSpawners to farm magic if going back through rm 02
data_spawn(rm+STR_PRXM,SpDrA,$1,  $1A<<3,y4); // DropSpawner  1
data_spawn(rm+STR_PRXM,SpDrA,$1,  $32<<3,y4); // DropSpawner  1
data_spawn(rm+STR_PRXM,SpDrA,$1,  $4A<<3,y4); // DropSpawner  1
//data_spawn(rm+STR_PRXM,SpDrA,$1,  $38<<3,y4); // DropSpawner  1.  OG
data_spawn(rm+STR_PRXM,IrKnA,$2,  $2E<<3,y3); // IronKnuckle  2
data_spawn(rm+STR_PRXM,IrKnA,$2,  $46<<3,y3); // IronKnuckle  2


clm3=$70; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '09'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row_e5, "03");                                    // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '03'+EXR0_); // LFT 0, 


//data_rando_scene01("_00"+"_00"+"_01"+"_01"+"_00",rm);
data_path_conditions(exit_name_l0, exit_name_d0);
data_path_conditions(exit_name_d0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  05  --------------------------- 28
//    
rm_num  = $05;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'005', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row0+$0B; y4=row4<<3;
row5=row3+$01; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($12<<3)+4,y3,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($77<<3)+4,(row4+$01)<<3,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $34<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $4C<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,LoDoA,$1,  $22<<3,(row3-$02)<<3); // LockedDoor
data_spawn(rm+STR_PRXM,IrKnA,$1,  $1E<<3,y3); // IronKnuckle  1
data_spawn(rm+STR_PRXM,IrKnA,$3,  $3A<<3,y3); // IronKnuckle  3
data_spawn(rm+STR_PRXM,IrKnA,$2,  $68<<3,(row0+$0B)<<3); // IronKnuckle  2


clm3=$10; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '0B'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row_e5, "03");                                    // Elevator DW $40, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '06'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_00"+"_01"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_d0);
data_path_conditions(exit_name_d0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  06  --------------------------- 
//   -------------------------  GOOMA  -------------------------- 
rm_num  = $06;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'006', STR_ow_axis+hex_str(ow_axis));


row3=row0+$15; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0F<<3,y4,  STR_Lit,STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $51<<3,y4,  STR_Lit,STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $5F<<3,y4,  STR_Lit,STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
//                                                                                                  //
data_spawn(rm+STR_PRIO,TorchA,$1,  $0F<<3,y4,  STR_Qualified+STR_Quest+STR_Nums+"02"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $51<<3,y4,  STR_Qualified+STR_Quest+STR_Nums+"02"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $5F<<3,y4,  STR_Qualified+STR_Quest+STR_Nums+"02"); // v1: Light w/ CANDLE or FIRE

clm3=$30; // clm3: arena center clm
data_spawn(rm+STR_PRIO,Gooma01,$1,  (clm3+$0F)<<3,y3,  STR_Arena+'_x'+hex_str(clm3<<3)); // Gooma  1
data_spawn(rm+STR_PRIO,CrHoA,$1,  CRYSTALHOLDER_XL,y3); // CrystalHolder  1
g.dm_rm[?STR_Boss+STR_Scene+STR_Name+_DUNGEON_NAME] = rm;


_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '05'+EXR0_); // LFT 0, 
g.dm_rm[?_DUNGEON_NAME+STR_Boss+STR_Scene+STR_Entrance+STR_Exit] = _exit;

_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0);         // RGT 0, to Overworld 
g.dm_rm[?STR_Boss+STR_Dungeon+STR_Exit+STR_Name+_DUNGEON_NAME] = _exit;


set_rm_data_1a(rm_name, area_PE+'026', 2); // 026: 2nd Quest. Spikes on floor


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  07  --------------------------- 2A
//    
rm_num  = $07;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'005', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row0+$0B; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($12<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($77<<3)+4,(row4+$01)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,Blaze01,$2,  ($2E<<3)+4,y3); // Blaze v2
data_spawn(rm+STR_PRIO,SpStA,$1,  $54<<3,(row0+$0D)<<3); // SpawnByStab  1
//data_spawn(rm+STR_PRXM,Moa_B,$1,  $1E<<3,(row0+$0B)<<3); // FieryMoa  1
data_spawn(rm+STR_PRXM,IrKnA,$1,  $20<<3,y3); // IronKnuckle  1
data_spawn(rm+STR_PRXM,IrKnA,$1,  $3C<<3,y3); // IronKnuckle  1
data_spawn(rm+STR_PRXM,IrKnA,$1,  $6A<<3,y4); // IronKnuckle  1


clm3=$10; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '0D'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row_e5);                                          // Elevator DW $40, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '08'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_00"+"_01"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_d0);
data_path_conditions(exit_name_d0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  08  --------------------------- 
//    
rm_num  = $08;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'007', STR_ow_axis+hex_str(ow_axis));


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($07<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($77<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,Spawner_FallingBlock,$1,  $36<<3,(row0+$06)<<3); // BlockSpawner  1
data_spawn(rm+STR_PRXM,Moa_B,$1,  $1E<<3,(row0+$10)<<3); // FieryMoa  1


row3=row0+$16;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '07'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '09'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmD0,$1,  $40<<3,(row0+$06)<<3,  STR_Treasure+STR_Map+"02"); // Key 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_GLOVE);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, _dk_spawn_item0, STR_GLOVE);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, _dk_spawn_item0, STR_GLOVE);

//data_scene_rando(rm);








//   --------------------------  09  --------------------------- 2C
//    
rm_num  = $09;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'008', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($52<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $78<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,BubbA,$1,  $1E<<3,(row0+$0B)<<3); // Bubble  1
data_spawn(rm+STR_PRXM,MagoA,$1,  $24<<3,y3); // Mago  1
data_spawn(rm+STR_PRXM,MagoA,$1,  $68<<3,y3); // Mago  1


clm3=$50; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '04'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_,  clm3,row0+$15);                                          // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '08'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0A'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_01",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_u0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_u0);

data_path_conditions(exit_name_u0, exit_name_r0);
data_path_conditions(exit_name_u0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  0A  --------------------------- 
//    
rm_num  = $0A;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'009', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
x3=($0C<<3)+4; _dist=$18<<3; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$1,  $6E<<3,(row0+$09)<<3); // DropSpawner  1
data_spawn(rm+STR_PRXM,Aneru01,$2,  $18<<3,y3); // Aneru  2
data_spawn(rm+STR_PRXM,Aneru01,$2,  $30<<3,y3); // Aneru  2
data_spawn(rm+STR_PRXM,Aneru01,$2,  $48<<3,y3); // Aneru  2
data_spawn(rm+STR_PRXM,Aneru01,$2,  $60<<3,y3); // Aneru  2
data_spawn(rm+STR_PRXM,Myu_A,$1,  $26<<3,y3); // Myu  1
data_spawn(rm+STR_PRXM,Myu_A,$1,  $42<<3,y3); // Myu  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '09'+EXR0_); // LFT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  $73<<3,y3,  STR_Treasure+STR_Map+"02"); // MAGIC PIECE
//data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_HP,CONT_PIECE_OBJ_VER_HP,  $73<<3,y3,  STR_Treasure+STR_Map+"02"); // HEART PIECE


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);
//data_path_conditions(exit_name_l0, exit_name_l0);
data_path_conditions(exit_name_l0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  0B  --------------------------- 2E
//    
rm_num  = $0B;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'010', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($19<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($52<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($78<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpStA,$1,  $60<<3,(row0+$11)<<3); // SpawnByStab  1
data_spawn(rm+STR_PRXM,IrKnA,$2,  $1A<<3,(row0+$17)<<3); // IronKnuckle  2
data_spawn(rm+STR_PRXM,GumaA,$1,  $70<<3,(row0+$0F)<<3); // Guma  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $16<<3,(row0+$0D)<<3); // Bubble  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $36<<3,(row0+$0D)<<3); // Bubble  1


clm3=$50; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '05'+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '12'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row_e5);                                    // Elevator DW $40, UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0C'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmF0,$4,  $0C<<3,(row0+$0F)<<3); // PBag v4: 200


//data_rando_scene01("_00"+"_01"+"_00"+"_01"+"_01",rm, STR_GLOVE+STR_JUMP+STR_STABDOWN+STR_STABUP);
data_path_conditions(exit_name_r0, exit_name_d0);
data_path_conditions(exit_name_r0, exit_name_u0);
data_path_conditions(exit_name_r0, _dk_spawn_item0, STR_GLOVE+"+"+STR_JUMP+"+"+STR_STABDOWN+"+"+STR_STABUP);

data_path_conditions(exit_name_d0, exit_name_r0);
data_path_conditions(exit_name_d0, exit_name_u0);
data_path_conditions(exit_name_d0, _dk_spawn_item0, STR_GLOVE+"+"+STR_JUMP+"+"+STR_STABDOWN+"+"+STR_STABUP);

data_path_conditions(exit_name_u0, exit_name_r0);
data_path_conditions(exit_name_u0, exit_name_d0);
data_path_conditions(exit_name_u0, _dk_spawn_item0, STR_GLOVE+"+"+STR_JUMP+"+"+STR_STABDOWN+"+"+STR_STABUP);

data_scene_rando(rm);








//   --------------------------  0C  --------------------------- 
//    
rm_num  = $0C;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'011', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($09<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($75<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($52<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
row5=row0+$09; y5=row5<<3;
row6=row0+$0B; y6=row6<<3;
data_spawn(rm+STR_PRIO,LoDoA,$1,  $26<<3,(row0+$15)<<3); // LockedDoor
data_spawn(rm+STR_PRIO,SpDrA,$1,  $46<<3,y5); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $58<<3,y5); // DropSpawner  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $1C<<3,y6); // Bubble  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $2C<<3,(row0+$09)<<3); // Bubble  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $42<<3,y6); // Bubble  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $72<<3,y6); // Bubble  1


clm3=$50; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '13'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row_e5);                                                 // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0B'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0D'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmF0,$4,  $4E<<3,(row0+$0D)<<3); // PBag v4: 200


//data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_00",rm, STR_JUMP);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_d0);
data_path_conditions(exit_name_r0, _dk_spawn_item0, STR_JUMP);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_d0);
data_path_conditions(exit_name_l0, _dk_spawn_item0, STR_JUMP);

data_path_conditions(exit_name_d0, exit_name_r0);
data_path_conditions(exit_name_d0, exit_name_l0);
data_path_conditions(exit_name_d0, _dk_spawn_item0, STR_JUMP);

data_scene_rando(rm);








//   --------------------------  0D  --------------------------- 30
//    
rm_num  = $0D;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'012', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($07<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($77<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($52<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,MagoA,$1,  $16<<3,y3); // Mago  1
data_spawn(rm+STR_PRXM,MagoA,$1,  $3C<<3,y3); // Mago  1
data_spawn(rm+STR_PRXM,MagoA,$1,  $6A<<3,y3); // Mago  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $1A<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $32<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $74<<3,y3); // Bot  1


clm3=$50; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '07'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row0+$15);                                           // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0C'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0E'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_01",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_u0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_u0);

data_path_conditions(exit_name_u0, exit_name_r0);
data_path_conditions(exit_name_u0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  0E  --------------------------- 
//    
rm_num  = $0E;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PE+'013', STR_ow_axis+hex_str(ow_axis));


row3=row0+$11; y3=row3<<3;
data_spawn(rm+STR_PRIO,SpBaA,$1,  $1E<<3,(row0+$07)<<3); // BagoSpawner  1
data_spawn(rm+STR_PRXM,IrKnA,$2,  $34<<3,y3); // IronKnuckle  2
data_spawn(rm+STR_PRXM,IrKnA,$2,  $4E<<3,y3); // IronKnuckle  2


row3=row0+$17;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0D'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0F'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  0F  --------------------------- 32
//    
rm_num  = $0F;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'014', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($07<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($77<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpStA,$1,  $54<<3,(row0+$11)<<3); // SpawnByStab  1
data_spawn(rm+STR_PRXM,IrKnA,$3,  $46<<3,y3); // IronKnuckle  3
data_spawn(rm+STR_PRXM,WosuA,$1,  $1E<<3,y3); // Wosu  1
data_spawn(rm+STR_PRXM,BubbA,$22,  $6B<<3,(row0+$0F)<<3,  STR_Direction+hex_str($4)); // Bubble  v$20: Bubble-cling
data_spawn(rm+STR_PRXM,BubbA,$1,  $1C<<3,(row0+$0B)<<3); // Bubble  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0E'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '10'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmD0,$1,  $6C<<3,(row0+$13)<<3,  STR_Treasure+STR_Map+"02"); // Key 


//data_path_conditions(exit_name_r0, exit_name_r0);
data_path_conditions(exit_name_r0, _dk_spawn_item0);

//data_path_conditions(exit_name_l0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  10  --------------------------- 
//    
rm_num  = $10;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'004', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $03<<3,y4,  STR_Lit,STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($6C<<3)+4,y3,  STR_Lit,STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
row4=row0+$0B; y4=row4<<3;
row5=row3-$02; y5=row5<<3;
x3=$14<<3; _dist=$0C<<3; _i=0;
data_spawn(rm+STR_PRIO,Blaze01,$1,  (x3+(_dist*(_i++)))+4,y5,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Blaze  1
data_spawn(rm+STR_PRIO,Blaze01,$1,  (x3+(_dist*(_i++)))+4,y5,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Blaze  1
data_spawn(rm+STR_PRIO,Blaze01,$1,  (x3+(_dist*(_i++)))+4,y5,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Blaze  1
data_spawn(rm+STR_PRIO,Blaze01,$1,  (x3+(_dist*(_i++)))+4,y5,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Blaze  1
data_spawn(rm+STR_PRIO,Blaze01,$1,  (x3+(_dist*(_i++)))+4,y5,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Blaze  1
data_spawn(rm+STR_PRIO,Blaze01,$1,  (x3+(_dist*(_i++)))+4,y5,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Blaze  1
data_spawn(rm+STR_PRXM,StalA,$2,  $16<<3,y4); // Stalfos  2
data_spawn(rm+STR_PRXM,StalA,$2,  $2E<<3,y4); // Stalfos  2
data_spawn(rm+STR_PRXM,StalA,$2,  $46<<3,y4); // Stalfos  2


clm3=$70; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '17'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row_e5);                                           // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0F'+EXR0_); // LFT 0, 


//data_rando_scene01("_00"+"_00"+"_01"+"_01"+"_00",rm);
data_path_conditions(exit_name_l0, exit_name_d0);
data_path_conditions(exit_name_d0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  11  --------------------------- 34
//    
rm_num  = $11;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'022', STR_ow_axis+hex_str(ow_axis));


row3=row0+$13; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $04<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $7A<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE

//                                                              //
data_spawn(rm+STR_PRXM,Moa_B,$1,  $10<<3,(row0+$0B)<<3); // FieryMoa  1
data_spawn(rm+STR_PRXM,Moa_B,$1,  $50<<3,(row0+$0B)<<3); // FieryMoa  1
//                                                              //
data_spawn(rm+STR_PRIO,BubbA,$12,  $09<<3,(row0+$11)<<3,  STR_Qualified+STR_Quest+STR_Nums+'02'); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $0C<<3,(row0+$0F)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $10<<3,(row0+$11)<<3,  STR_Qualified+STR_Quest+STR_Nums+'02'); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $14<<3,(row0+$0B)<<3,  STR_Qualified+STR_Quest+STR_Nums+'02'); // Bubble v$10(dormant)
//                                                              //
data_spawn(rm+STR_PRIO,BubbA,$12,  $18<<3,(row0+$13)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $1C<<3,(row0+$11)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $1F<<3,(row0+$15)<<3,  STR_Qualified+STR_Quest+STR_Nums+'02'); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $22<<3,(row0+$11)<<3,  STR_Qualified+STR_Quest+STR_Nums+'02'); // Bubble v$10(dormant)
//                                                              //
data_spawn(rm+STR_PRIO,BubbA,$12,  $26<<3,(row0+$17)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $2A<<3,(row0+$10)<<3,  STR_Qualified+STR_Quest+STR_Nums+'02'); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $2C<<3,(row0+$11)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $2F<<3,(row0+$0E)<<3,  STR_Qualified+STR_Quest+STR_Nums+'02'); // Bubble v$10(dormant)
//                                                              //
data_spawn(rm+STR_PRIO,BubbA,$12,  $32<<3,(row0+$15)<<3,  STR_Qualified+STR_Quest+STR_Nums+'02'); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $34<<3,(row0+$12)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $38<<3,(row0+$15)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $3D<<3,(row0+$11)<<3,  STR_Qualified+STR_Quest+STR_Nums+'02'); // Bubble v$10(dormant)
//                                                              //
data_spawn(rm+STR_PRIO,BubbA,$12,  $3F<<3,(row0+$0D)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $42<<3,(row0+$15)<<3,  STR_Qualified+STR_Quest+STR_Nums+'02'); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $48<<3,(row0+$15)<<3,  STR_Qualified+STR_Quest+STR_Nums+'02'); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $4A<<3,(row0+$11)<<3); // Bubble v$10(dormant)
//                                                              //
data_spawn(rm+STR_PRIO,BubbA,$12,  $50<<3,(row0+$0F)<<3,  STR_Qualified+STR_Quest+STR_Nums+'02'); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $54<<3,(row0+$10)<<3,  STR_Qualified+STR_Quest+STR_Nums+'02'); // Bubble v$10(dormant)


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '1D'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '12'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_JUMP);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  12  --------------------------- 
//    
rm_num  = $12;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'016', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($13<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($27<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($3B<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($6C<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($72<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
row4=row0+$0B; y4=row4<<3;
data_spawn(rm+STR_PRXM,MagoA,$1,  $20<<3,y3); // Mago  1
data_spawn(rm+STR_PRXM,MagoA,$1,  $3E<<3,y3); // Mago  1
data_spawn(rm+STR_PRXM,MagoA,$1,  $5C<<3,y3); // Mago  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $16<<3,y4); // Bubble  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $52<<3,y4); // Bubble  1


clm3=$70; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '0B'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_,  clm3,row0+$15);                                          // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '11'+EXR0_); // LFT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmF0,$5,  $30<<3,(row0+$0F)<<3); // PBag v5: 250


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01",rm, STR_JUMP);
data_path_conditions(exit_name_l0, exit_name_u0);
data_path_conditions(exit_name_l0, _dk_spawn_item0, STR_GLOVE+"|"+STR_JUMP);

data_path_conditions(exit_name_u0, exit_name_l0);
data_path_conditions(exit_name_u0, _dk_spawn_item0, STR_GLOVE+"|"+STR_JUMP);

data_scene_rando(rm);








//   --------------------------  13  --------------------------- 36
//    
rm_num  = $13;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'010', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$0F; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($19<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($52<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($78<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,IrKnA,$2,  $70<<3,y5); // IronKnuckle  2
data_spawn(rm+STR_PRXM,GumaA,$1,  $30<<3,y5); // Guma  1
data_spawn(rm+STR_PRXM,BubbA,$2,  $06<<3,(row0+$0B)<<3); // Bubble  2


clm3=$50; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '0C'+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '19'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row_e5);                                    // Elevator DW $40, UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '14'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmD0,$1,  $78<<3,y5,  STR_Treasure+STR_Map+"02"); // Key 
_dk_spawn_item1 = data_spawn(rm+STR_PRIO,ItmF0,$4,  $0C<<3,y5); // PBag v4: 200


data_path_conditions(exit_name_r0, exit_name_d0);
data_path_conditions(exit_name_r0, exit_name_u0);
data_path_conditions(exit_name_r0, _dk_spawn_item0, STR_JUMP);
data_path_conditions(exit_name_r0, _dk_spawn_item1, STR_GLOVE+"+"+STR_JUMP+"+"+STR_STABDOWN+"+"+STR_STABUP);

data_path_conditions(exit_name_d0, exit_name_r0);
data_path_conditions(exit_name_d0, exit_name_u0);
data_path_conditions(exit_name_d0, _dk_spawn_item0, STR_JUMP);
data_path_conditions(exit_name_d0, _dk_spawn_item1, STR_GLOVE+"+"+STR_JUMP+"+"+STR_STABDOWN+"+"+STR_STABUP);

data_path_conditions(exit_name_u0, exit_name_r0);
data_path_conditions(exit_name_u0, exit_name_d0);
data_path_conditions(exit_name_u0, _dk_spawn_item0, STR_JUMP);
data_path_conditions(exit_name_u0, _dk_spawn_item1, STR_GLOVE+"+"+STR_JUMP+"+"+STR_STABDOWN+"+"+STR_STABUP);

data_scene_rando(rm);








//   --------------------------  14  --------------------------- 
//    area_PE+'027': Room with floor spikes
rm_num  = $14;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'027', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($07<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($77<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
row4=row0+$0B; y4=row4<<3;
row5=row3-$04; y5=row5<<3;
data_spawn(rm+STR_PRXM,Bot_A,$1,  $13<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $29<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $35<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $49<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $55<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $6B<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,BubbA,$2,  $16<<3,y4); // Bubble  1
data_spawn(rm+STR_PRXM,BubbA,$2,  $52<<3,y4); // Bubble  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '13'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '15'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_JUMP);
data_path_conditions(exit_name_r0, exit_name_l0, STR_JUMP);
data_path_conditions(exit_name_l0, exit_name_r0, STR_JUMP);

data_scene_rando(rm);








//   --------------------------  15  --------------------------- 38
//    
rm_num  = $15;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'018', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
if (g.mod_P5HorseHead)
{
    data_spawn(rm+STR_PRIO,TorchA,$1,  ($07<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
    data_spawn(rm+STR_PRIO,TorchA,$1,  ($37<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
    data_spawn(rm+STR_PRIO,TorchA,$1,  ($77<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
    clm3=$20; // arena center clm
    data_spawn(rm+STR_PRIO,Horsehead01,$1,  (clm3+$0B)<<3,(row0+$15)<<3,  STR_Arena+'_x'+hex_str(clm3<<3),  STR_Qualified+STR_Quest+STR_Nums+"02"); // Horsehead  1
    data_spawn(rm+STR_PRXM,IrKnA,$3,  $38<<3,y3,  STR_Qualified+STR_Quest+STR_Nums+"01"); // IronKnuckle  3
}
else
{
    data_spawn(rm+STR_PRIO,TorchA,$1,  ($07<<3)+4,y4,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
    data_spawn(rm+STR_PRIO,TorchA,$1,  ($77<<3)+4,y4,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
    data_spawn(rm+STR_PRIO,TorchA,$1,  ($3C<<3)+4,y4,  STR_Qualified+STR_Quest+STR_Nums+"02"); // v1: Light w/ CANDLE or FIRE
    data_spawn(rm+STR_PRXM,IrKnA,$3,  $38<<3,y3); // IronKnuckle  3
}


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '14'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '16'+EXL0_); // RGT 0, 



if (g.mod_P5HorseHead) set_rm_data_1a(rm_name, area_PE+'029', 2); // 2nd Quest tile data. For HorseHead


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

//data_scene_rando(rm);








//   --------------------------  16  --------------------------- 
//    
rm_num  = $16;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'011', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($09<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($75<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($52<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
row5=row0+$09; y5=row5<<3;
data_spawn(rm+STR_PRIO,SpDrA,$1,  $46<<3,y5); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $58<<3,y5); // DropSpawner  1
data_spawn(rm+STR_PRXM,MagoA,$1,  $12<<3,y3); // Mago  1
data_spawn(rm+STR_PRXM,MagoA,$1,  $3A<<3,y3); // Mago  1
data_spawn(rm+STR_PRXM,MagoA,$1,  $68<<3,y3); // Mago  1


clm3=$50; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '1B'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row_e5);                                          // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '15'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '17'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_d0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_d0);

data_path_conditions(exit_name_d0, exit_name_r0);
data_path_conditions(exit_name_d0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  17  --------------------------- 3A
//    
rm_num  = $17;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'016', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($13<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($27<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($3B<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($6C<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($72<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpStA,$1,  $36<<3,(row0+$13)<<3); // SpawnByStab  1
data_spawn(rm+STR_PRXM,MagoA,$1,  $26<<3,(row0+$17)<<3); // Mago  1
data_spawn(rm+STR_PRXM,MagoA,$1,  $4E<<3,(row0+$17)<<3); // Mago  1
data_spawn(rm+STR_PRXM,WosuA,$1,  $0C<<3,(row0+$0F)<<3); // Wosu  1
data_spawn(rm+STR_PRXM,WosuA,$1,  $48<<3,(row0+$0F)<<3); // Wosu  1


clm3=$70; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '10'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_,  clm3,row0+$15);                                          // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$17,  '16'+EXR0_); // LFT 0, 


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01",rm);
data_path_conditions(exit_name_l0, exit_name_u0);
data_path_conditions(exit_name_u0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  18  --------------------------- 
//    
rm_num  = $18;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'015', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($33<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($73<<3)+4,y4,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
row4=row0+$09; y4=row4<<3;
row5=row0+$0F; y5=row5<<3;
data_spawn(rm+STR_PRIO,SpStA,$1,  $22<<3,y5); // SpawnByStab  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $28<<3,y4); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $6C<<3,y4); // DropSpawner  1
data_spawn(rm+STR_PRXM,IrKnA,$2,  $1C<<3,y3); // IronKnuckle  2
data_spawn(rm+STR_PRXM,IrKnA,$2,  $42<<3,y5); // IronKnuckle  2
data_spawn(rm+STR_PRXM,IrKnA,$2,  $5E<<3,y3); // IronKnuckle  2


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '19'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_00",rm);
//data_path_conditions(exit_name_r0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  19  --------------------------- 3C
//    
rm_num  = $19;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'016', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($13<<3)+4,y4,  STR_Lit,STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($27<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($3B<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4F<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($6C<<3)+4,y4,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($72<<3)+4,y4,  STR_Lit,STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
row4=row0+$0B; y4=row4<<3;
data_spawn(rm+STR_PRXM,Ra__A,$1,  $36<<3,y3); // Ra  1
data_spawn(rm+STR_PRXM,Ra__A,$1,  $48<<3,y3); // Ra  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $16<<3,y4); // Bubble  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $38<<3,y4); // Bubble  1


clm3=$70; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '13'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row0+$15);                                           // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '18'+EXR0_); // LFT 0, 


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01",rm);
data_path_conditions(exit_name_l0, exit_name_u0);
data_path_conditions(exit_name_u0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  1A  --------------------------- 
//   -------------------------  FLUTE  -------------------------- 
rm_num  = $1A;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'019', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($2F<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($47<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($5F<<3)+4,y4,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $78<<3,(row0+$14)<<3,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,LoDoA,$1,  $24<<3,(row3-$02)<<3); // LockedDoor
data_spawn(rm+STR_PRIO,SpStA,$1,  $78<<3,(row0+$0B)<<3); // SpawnByStab  1
data_spawn(rm+STR_PRXM,IrKnA,$3,  $2A<<3,y3); // IronKnuckle  3
data_spawn(rm+STR_PRXM,IrKnA,$1,  $4C<<3,y3); // IronKnuckle  1


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$13,  '1B'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmA4,$1,  $12<<3,y3); // FLUTE


//data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_00",rm);
//data_path_conditions(exit_name_r0, exit_name_r0);
data_path_conditions(exit_name_r0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  1B  --------------------------- 3E
//    
rm_num  = $1B;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'016', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($13<<3)+4,y4,  STR_Lit,STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($27<<3)+4,y4,  STR_Lit,STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($3B<<3)+4,y4,  STR_Lit,STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4F<<3)+4,y4,  STR_Lit,STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($6C<<3)+4,y4,  STR_Lit,STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($72<<3)+4,y4,  STR_Lit,STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
//                                                                                                      //
data_spawn(rm+STR_PRIO,TorchA,$1,  ($27<<3)+4,y4,  STR_Qualified+STR_Quest+STR_Nums+"02"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($3B<<3)+4,y4,  STR_Qualified+STR_Quest+STR_Nums+"02"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4F<<3)+4,y4,  STR_Qualified+STR_Quest+STR_Nums+"02"); // v1: Light w/ CANDLE or FIRE

data_spawn(rm+STR_PRIO,LoDoA,$1,  $62<<3,(row0+$15)<<3); // LockedDoor
data_spawn(rm+STR_PRIO,SpMaA,$1,  $1E<<3,(row0+$07)<<3); // MauSpawner  1
data_spawn(rm+STR_PRXM,MagoA,$1,  $12<<3,y3); // Mago  1
data_spawn(rm+STR_PRXM,MagoA,$1,  $2E<<3,y3); // Mago  1
data_spawn(rm+STR_PRXM,MagoA,$1,  $54<<3,y3); // Mago  1


clm3=$70; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '16'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_,  clm3,row0+$15);                                          // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '1A'+EXR0_); // LFT 0, 


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01",rm);
data_path_conditions(exit_name_l0, exit_name_u0);
data_path_conditions(exit_name_u0, exit_name_l0);

data_scene_rando(rm);









//   --------------------------  1C  --------------------------- 
//    


//   --------------------------  1D  --------------------------- 
//    
rm_num  = $1D;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PE+'023', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $5A<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
var _PI1 = global.PI_MOB_BLU; // For spinning spike trap to contrast w/ red walls of palace 3
y3=(row0+$13)<<3; y4=(row0+$15)<<3;                   _a=0;
data_spin_trap(SpTrC,1,  $50<<3,y4,  _PI1,  7,  1,5, (_a++)*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,1,  $40<<3,y3,  _PI1,  6, -1,3, (_a++)*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,1,  $30<<3,y4,  _PI1,  7,  1,4, (_a++)*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,1,  $20<<3,y3,  _PI1,  6, -1,3, (_a++)*90); // SpTrC: spins on chain
data_spawn(rm+STR_PRXM,BubbA,$22,  $10<<3,(row0+$11)<<3,  STR_Direction+hex_str($4)); // v$20: Bubble-cling
data_spawn(rm+STR_PRXM,BubbA,$22,  $20<<3,(row0+$19)<<3,  STR_Direction+hex_str($4)); // v$20: Bubble-cling
data_spawn(rm+STR_PRXM,BubbA,$22,  $40<<3,(row0+$19)<<3,  STR_Direction+hex_str($4)); // v$20: Bubble-cling
data_spawn(rm+STR_PRXM,BubbA,$22,  $2E<<3,(row0+$0B)<<3,  STR_Direction+hex_str($4)); // v$20: Bubble-cling
data_spawn(rm+STR_PRXM,BubbA,$22,  $4E<<3,(row0+$0B)<<3,  STR_Direction+hex_str($4)); // v$20: Bubble-cling


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '11'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmD0,$1,  $0F<<3,(row0+$11)<<3,  STR_Treasure+STR_Map+"02"); // Key


//data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_00",rm);
//data_path_conditions(exit_name_r0, exit_name_r0);
data_path_conditions(exit_name_r0, _dk_spawn_item0);

data_scene_rando(rm);








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




