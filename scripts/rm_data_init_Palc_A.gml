/// rm_data_init_Palc_A()


var _i, _a, _val, _dist;
var _x,_y, _w,_h;
var _clm,_row, _clms,_rows;
var _pi, _obj,_ver;
var _rm, _file, _exit, _owrc;
var _page,_pages;
var _data, _datakey,_dk;
var _tsrc;
var _ADJ1 = 4;
var _dk_spawn_item0, _dk_spawn_item1, _dk_spawn_item2, _dk_spawn_item3, _dk_spawn_item4;

map_clm_off =  0;
map_row_off =  0;








// *************************   PALACE 1   *************************** 
// ------------------------------------------------------------------------------- 
area = area_PA;

var _DUNGEON_NUM  = $01;
var _DUNGEON_NUM_ = hex_str(_DUNGEON_NUM);

mus0 = STR_Dungeon+_DUNGEON_NUM_;
//mus0 = MUS_DUNGEON1;

var _DARK_DATA=STR_Dark+"01";
ow_axis =  0; // 0:horizontal, 1:vertical


var _DUNGEON_NAME = STR_Parapa_Palace;
g.dm_dungeon[?STR_Dungeon+_DUNGEON_NUM_+STR_Name] = _DUNGEON_NAME;
g.dm_dungeon[?STR_Dungeon+area         +STR_Name] = _DUNGEON_NAME;
g.dm_dungeon[?STR_Dungeon+STR_Num+_DUNGEON_NAME]  = _DUNGEON_NUM;
g.dm_dungeon[?STR_Dungeon+_DUNGEON_NUM_+STR_Area] = area;
g.dm_dungeon[?_DUNGEON_NAME+STR_Area]             = area;







//   --------------------------  00  --------------------------- 
//    
rm_num  = $00;
set_rm_data(area+hex_str(rm_num), mus0, STR_Color+COLOR2_, STR_Tile+area_PA+'000', STR_ow_axis+hex_str(ow_axis));


data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
data_spawn(rm+STR_PRIO,SpStA,$1,  $34<<3,(row0+$11)<<3); // SpawnByStab  2


clm3=$70; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '04'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row_e5, "04");                                           // Elevator DW $40, 
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$17,  0); // LFT 0, to Overworld  
g.dm_rm[?get_dk_dungeon_entrance(_DUNGEON_NUM)] = _exit;
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$01,  '0E'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_HP,CONT_PIECE_OBJ_VER_HP,  ($61<<3)+2,(row0+$03)<<3,  STR_Treasure+STR_Map+"01"); // HEART PIECE


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_d0);
data_path_conditions(exit_name_r0, _dk_spawn_item0);

data_path_conditions(exit_name_l0, exit_name_d0);

data_path_conditions(exit_name_d0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  01  --------------------------- 
//    
rm_num  = $01;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PA+'001', STR_ow_axis+hex_str(ow_axis));


row3=row0+$0B; y3=row3<<3;
row4=row0+$17; y4=row4<<3;
row5=row3+$01; y5=row5<<3;
row6=row4+$01; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $34<<3,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $4C<<3,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $68<<3,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $78<<3,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,WosuA,$1,  $44<<3,y4); // Wosu  1
data_spawn(rm+STR_PRXM,WosuA,$1,  $6E<<3,y3); // Wosu  1


clm3=$10; // elevator center clm
clm4=clm3-$04;  clm5=clm3-$01;
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '10'+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '07'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row0+$14);                                  // Elevator DW $40, UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0B,  '02'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmD0,$1,  $7A<<3,y3,  STR_Treasure+STR_Map+"01"); // Key 


data_path_conditions(exit_name_r0, exit_name_d0);
data_path_conditions(exit_name_r0, exit_name_u0);
data_path_conditions(exit_name_r0, _dk_spawn_item0);

data_path_conditions(exit_name_d0, exit_name_r0);
data_path_conditions(exit_name_d0, exit_name_u0);
data_path_conditions(exit_name_d0, _dk_spawn_item0);

data_path_conditions(exit_name_u0, exit_name_r0);
data_path_conditions(exit_name_u0, exit_name_d0);
data_path_conditions(exit_name_u0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  02  --------------------------- 
//    
rm_num  = $02;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PA+'002', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0C<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($24<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($3C<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($54<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bot_A,$1,  $14<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,WosuA,$1,  $2C<<3,y3); // Wosu  1
data_spawn(rm+STR_PRXM,WosuA,$1,  $3C<<3,y3); // Wosu  1
data_spawn(rm+STR_PRXM,GumaA,$1,  $70<<3,y3); // Guma  1
data_spawn(rm+STR_PRIO,SpStA,$1,  $7A<<3,(row3-$04)<<3); // SpawnByStab  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '01'+EXR0_); // LFT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmD0,$1,  $78<<3,(row0+$16)<<3,  STR_Treasure+STR_Map+"01"); // Key


data_path_conditions(exit_name_l0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  03  --------------------------- 
//    
rm_num  = $03;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PA+'013', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($33<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,StalA,$1,  $40<<3,(row0+$0B)<<3); // Stalfos  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $66<<3,(row0+$0D)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $6A<<3,(row0+$11)<<3); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0B,  'FC'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '04'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmD0,$1,  $06<<3,y3,  STR_Treasure+STR_Map+"01"); // Key


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, _dk_spawn_item0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, _dk_spawn_item0);

//data_scene_rando(rm);








//   --------------------------  04  --------------------------- 
//    
rm_num  = $04;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PA+'042', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
y4=(row3+$01)<<3;
y5=(row3-$01)<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($52<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,StalA,$1,  $20<<3,(row0+$0F)<<3); // Stalfos  1
data_spawn(rm+STR_PRXM,WosuA,$1,  $28<<3,y5); // Wosu  1
data_spawn(rm+STR_PRXM,WosuA,$1,  $72<<3,y5,  STR_Direction+string(-1)); // Wosu  1.  Data -1 means will always move left on spawn
//data_spawn(rm+STR_PRIO,SpWoA,$1,  $00<<3,$00<<3); // WosuSpawner  1


clm3=$50; // elevator center clm
data_exit(EXU0,etC0,1,  clm3-4,row_e0,  CLMS4,ROWS5,  clm3-1,row_e1,  '00'+EXD0_); // UP  0, Elevator up 
data_Elev(EXU0_, clm3,row0+$15);                                             // Elevator UP $80, 
//data_Elev(EXU0_, clm3,row0+$14);                                             // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '03'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '05'+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_u0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_u0);

data_path_conditions(exit_name_u0, exit_name_r0);
data_path_conditions(exit_name_u0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  05  --------------------------- 
//    
rm_num  = $05;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PA+'005', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3; y4=(row3+$01)<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($27<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($57<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,BubbA,$1,  $65<<3,(row0+$15)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  1
data_spawn(rm+STR_PRIO,SpWoA,$1,  $1E<<3,(row0+$07)<<3); // WosuSpawner  1
data_spawn(rm+STR_PRIO,LoDoA,$1,  $25<<3,(row0+$15)<<3); // LockedDoor
//data_spawn(rm+STR_PRIO,LoDoA,$1,  $22<<3,(row0+$15)<<3); // 


data_exit(EXU0,etA4,0,  $04,row_e0,  $78,ROWS5,  $2F,row_e4,  '0E'+EXD0_); // UP  0, Pit up 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '04'+EXR0_); // LFT 0,  
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '06'+EXL0_); // RGT 0,  


g.dm_rm[?MAP_DATAKEY1+rm+STR_Page+"00"+STR_TSRC]   = $41;
g.dm_rm[?MAP_DATAKEY1+rm+STR_Page+"01"+STR_TSRC]   = $51;
g.dm_rm[?MAP_DATAKEY1+rm+STR_Page+"01"+STR_ScaleY] = -1;


//set_rm_data_2(rm, area_PA+'064');


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_path_conditions(exit_name_u0, exit_name_r0);
data_path_conditions(exit_name_u0, exit_name_l0);

data_scene_rando(rm);









//   --------------------------  06  --------------------------- 
//    
rm_num  = $06;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PA+'006', STR_ow_axis+hex_str(ow_axis));


y3=(row0+$18)<<3; y4=(row0+$17)<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($23<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($69<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $78<<3,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($53<<3)-4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
y3=(row0+$19)<<3;
data_spawn(rm+STR_PRXM,Bot_A,$1,  $27<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $6F<<3,y3); // Bot  1
y3=(row0+$0B)<<3;
data_spawn(rm+STR_PRXM,StalA,$1,  $2A<<3,y3); // Stalfos  1
data_spawn(rm+STR_PRXM,StalA,$1,  $70<<3,y3); // Stalfos  1


clm3=$50; // Elev center clm
row3=row0+$17;
data_exit(EXD0,etC0,1,  clm3-4,row_e2,  CLMS4,ROWS5,  clm3-1,row_e3,  '0A'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$14);                                             // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '05'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '07'+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_d0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_d0);

data_path_conditions(exit_name_d0, exit_name_r0);
data_path_conditions(exit_name_d0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  07  --------------------------- 
//    
rm_num  = $07;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PA+'007', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($21<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+4,y3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($53<<3)-4,y3); // v1: Light w/ CANDLE or FIRE
y4=(row3+$02)<<3;
data_spawn(rm+STR_PRXM,Bot_A,$1,  $14<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $28<<3,y4); // Bot  1
y4=(row0+$0B)<<3;
data_spawn(rm+STR_PRXM,BubbA,$1,  $10<<3,y4); // Bubble  1
data_spawn(rm+STR_PRXM,StalA,$1,  $2D<<3,y4); // Stalfos  1
data_spawn(rm+STR_PRIO,ReFaA,$1,  $6A<<3,(row0+$11)<<3); // RestoreFairy  1


clm3=$50; // elevator center clm
clm4=clm3-$04;  clm5=clm3-$01;
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '01'+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '0B'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row0+$14);                                  // Elevator DW $40, UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '06'+EXR0_); // LFT 0, 


data_path_conditions(exit_name_l0, exit_name_d0);
data_path_conditions(exit_name_l0, exit_name_u0);

data_path_conditions(exit_name_d0, exit_name_l0);
data_path_conditions(exit_name_d0, exit_name_u0);

data_path_conditions(exit_name_u0, exit_name_l0);
data_path_conditions(exit_name_u0, exit_name_d0);

data_scene_rando(rm);








//   --------------------------  08  --------------------------- 
//   ------------------------  CANDLE  ------------------------- 
rm_num  = $08;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PA+'041', STR_ow_axis+hex_str(ow_axis));


_val=$10; clm3=$38; row3=row0+$16; y3=row3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3+(_val*0))<<3)+4,y3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3+(_val*1))<<3)+4,y3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3+(_val*2))<<3)+4,y3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3+(_val*3))<<3)+4,y3); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $79<<3,$14<<3); // v1: Light w/ CANDLE or FIRE

row4=row0+$17; y4=row4<<3; y5=(row4+$02)<<3;
data_spawn(rm+STR_PRIO,LoDoA,$1,  $24<<3,(row0+15)<<3); // LockedDoor
data_spawn(rm+STR_PRXM,StalA,$1,  $30<<3,(row0+$0B)<<3); // Stalfos  1
data_spawn(rm+STR_PRXM,GumaA,$1,  $58<<3,y4); // Guma  1


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4-$04,  '09'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmA0,$1,  $12<<3,y4); // CANDLE. iID 0 


data_path_conditions(exit_name_r0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  09  --------------------------- 
//    
rm_num  = $09;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PA+'009', STR_ow_axis+hex_str(ow_axis));
//g.dm_rm[?"liquid_is_fire_"+rm] = true;


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$14; y5=row5<<3;
row6=row5-$04; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $07<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $78<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bot_A,$1,  $0E<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $12<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $6C<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $70<<3,y5); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '08'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0A'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmF0,$1,  $30<<3,(row0+$0C)<<3); // PBag 50 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, _dk_spawn_item0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  0A  --------------------------- 
//    
rm_num  = $0A;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PA+'010', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
y4=(row3+1)<<3;
x3=($13<<3)+4; _dist=$14<<3; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_a++),y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_a++),y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_a++),y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_a++),y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($6C<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($73<<3)-4,y4); // v1: Light w/ CANDLE or FIRE
y4=(row0+$0B)<<3;
data_spawn(rm+STR_PRXM,BubbA,$1,  $10<<3,y4); // Bubble  1
data_spawn(rm+STR_PRXM,BubbA,$2,  $24<<3,y4); // Bubble  2:fast
data_spawn(rm+STR_PRXM,BubbA,$1,  $38<<3,y4); // Bubble  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $4C<<3,y4); // Bubble  1


clm3=$70; // elevator center clm
data_exit(EXU0,etC0,1,  clm3-4,row_e0,  CLMS4,ROWS5,  clm3-1,row_e1,  '06'+EXD0_); // UP  0, Elevator up 
data_Elev(EXU0_, clm3,row0+$15);                                             // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$17,  '09'+EXR0_); // LFT 0, 


data_path_conditions(exit_name_l0, exit_name_u0);
data_path_conditions(exit_name_u0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  0B  --------------------------- 
//    
rm_num  = $0B;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PA+'011', STR_ow_axis+hex_str(ow_axis));


row3=row0+$0C; y3=row3<<3; y4=(row0+$18)<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0C<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($13<<3)-4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $78<<3,y3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,IrKnA,$1,  $30<<3,(row0+$17)<<3); // IronKnuckle  1
data_spawn(rm+STR_PRXM,StalA,$1,  $56<<3,y3); // Stalfos  1
data_spawn(rm+STR_PRXM,StalA,$1,  $6C<<3,y3); // Stalfos  1


clm3=$10; // elevator center clm
data_exit(EXU0,etC0,1,  clm3-4,row_e0,  CLMS4,ROWS5,  clm3-1,row_e1,  '07'+EXD0_); // UP  0, Elevator up 
data_Elev(EXU0_, clm3,row0+$15);                                             // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0B,  '0C'+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_u0);
data_path_conditions(exit_name_u0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  0C  --------------------------- 
//    
rm_num  = $0C;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PA+'229', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3; y4=(row3+$01)<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($27<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($57<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,y4); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $78<<3,y4); // v1: Light w/ CANDLE or FIRE

data_spawn(rm+STR_PRXM,GumaA,$1,  $20<<3,y3); // Guma  1
data_spawn(rm+STR_PRXM,IrKnA,$1,  $6A<<3,y3); // IronKnuckle  1
data_spawn(rm+STR_PRIO,LoDoA,$1,  $22<<3,(row0+$15)<<3); // LockedDoor


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0B'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0D'+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  0D  --------------------------- 
//   -----------------------  HORSEHEAD  ------------------------ 
rm_num  = $0D;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PA+'012', STR_ow_axis+hex_str(ow_axis));


y3=(row0+$16)<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0F<<3,y3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $50<<3,y3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $5F<<3,y3); // v1: Light w/ CANDLE or FIRE
clm3=$30; // clm3: arena center clm
data_spawn(rm+STR_PRIO,Horsehead01,$1,  (clm3+$10)<<3,(row0+$15)<<3,  STR_Arena+'_x'+hex_str(clm3<<3)); // Horsehead  1
data_spawn(rm+STR_PRIO,CrHoA,$1,  CRYSTALHOLDER_XL,(row0+$16)<<3); // CrystalHolder  1
g.dm_rm[?STR_Boss+STR_Scene+STR_Name+_DUNGEON_NAME] = rm;


row3=row0+$15;
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0C'+EXR0_); // LFT 0, 
g.dm_rm[?_DUNGEON_NAME+STR_Boss+STR_Scene+STR_Entrance+STR_Exit] = _exit;

_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 
g.dm_rm[?STR_Boss+STR_Dungeon+STR_Exit+STR_Name+_DUNGEON_NAME] = _exit;


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  0E  --------------------------- 
//    
rm_num  = $0E;
set_rm_data(area+hex_str(rm_num), mus0, STR_Color+COLOR2_, STR_Tile+area_PA+'014', STR_ow_axis+hex_str(ow_axis));


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init); // 
data_spawn(rm+STR_PRIO,SpTrB,$2,  $19<<3,$10<<3,  STR_Speed+hex_str(3),STR_Direction+string(-1)); // SpikeTrapB v2: Short, Auto horizontal
data_spawn(rm+STR_PRIO,SpTrB,$2,  $23<<3,$0C<<3,  STR_Speed+hex_str(2),STR_Direction+string(1)); // SpikeTrapB v2: Short, Auto horizontal
data_spawn(rm+STR_PRIO,SpTrB,$2,  $38<<3,$0C<<3,  dk_PI+hex_str(global.PI_MOB_RED),STR_Speed+hex_str(4),STR_Direction+string(-1)); // SpikeTrapB v2: Short, Auto horizontal
data_spawn(rm+STR_PRIO,SpTrB,$2,  $48<<3,$08<<3,  STR_Speed+hex_str(1),STR_Direction+string(1)); // SpikeTrapB v2: Short, Auto horizontal
data_spawn(rm+STR_PRIO,SpTrB,$2,  $56<<3,$08<<3,  STR_Speed+hex_str(2),STR_Direction+string(-1)); // SpikeTrapB v2: Short, Auto horizontal
data_spawn(rm+STR_PRIO,SpTrB,$2,  $67<<3,$04<<3,  STR_Speed+hex_str(2),STR_Direction+string(1)); // SpikeTrapB v2: Short, Auto horizontal


clm4 = -PAGE_CLMS;
data_exit(EXD0,etA1,1,  clm4,row_e2,  clms1,ROWS5,  clm1,row2+2,  '05'+EXU0_); // DWN 0, Pit down 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$13,  '00'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$02,  '0F'+EXL0_); // RGT 0, 


g.dm_rm[?MAP_DATAKEY1+rm+STR_Page+"00"+STR_TSRC] = $41;
g.dm_rm[?MAP_DATAKEY1+rm+STR_Page+"01"+STR_TSRC] = $50;
g.dm_rm[?MAP_DATAKEY1+rm+STR_Page+"02"+STR_TSRC] = $51;


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_d0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_d0);

data_scene_rando(rm);








//   --------------------------  0F  --------------------------- 
//    
rm_num  = $0F;
set_rm_data(area+hex_str(rm_num), mus0, STR_Color+COLOR2_, STR_Tile+area_PA+'015', STR_ow_axis+hex_str(ow_axis));


row3 =  row0+$1A; // ground lvl first 2 pages of rm
y3   = (row0+$11)<<3;
_pi  = global.PI_MOB_PUR;
data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init); // 
data_spawn(rm+STR_PRXM,GlzmA,$1,  $12<<3,(row3-$E)<<3,  dk_PI+hex_str(global.PI_MOB_RED)); // Gellzam
data_spawn(rm+STR_PRXM,GeldA,$1,  $21<<3,y3,  dk_PI+hex_str(_pi)); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $24<<3,y3,  dk_PI+hex_str(_pi)); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $5D<<3,y3,  dk_PI+hex_str(_pi)); // Geldarm  1 
data_spawn(rm+STR_PRIO,SpRoA,$1,  0,0); // RockSpawner  1 


clms3=$04; // bc of RockSpawner
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3+clms3,row0+$16,  '0E'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA-clms3,row0+$13,  '10'+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  10  --------------------------- 
//    
rm_num  = $10;
set_rm_data(area+hex_str(rm_num), mus0, STR_Color+COLOR2_, STR_Tile+area_PA+'016', STR_ow_axis+hex_str(ow_axis));


_pi = global.PI_MOB_PUR;
y3  = (row0+$11)<<3;
y4  = (row0+$14)<<3;
data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init); // 
data_spawn(rm+STR_PRXM,GeldA,$1,  $1F<<3,y3,  dk_PI+hex_str(_pi)); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $37<<3,y3,  dk_PI+hex_str(_pi)); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $44<<3,y4,  dk_PI+hex_str(_pi)); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $56<<3,y4,  dk_PI+hex_str(_pi)); // Geldarm  1 
data_spawn(rm+STR_PRXM,GlzmA,$1,  $31<<3,y3,  dk_PI+hex_str(global.PI_MOB_RED)); // Gellzam


clm3=$70; clm4=clm3-$04; clm5=clm3-$01; // clm3: Elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '01'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row0+$15, "02");                                        // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$13,  '0F'+EXR0_); // LFT 0, 


data_path_conditions(exit_name_l0, exit_name_d0);
data_path_conditions(exit_name_d0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  11  --------------------------- 
//    


//   --------------------------  12  --------------------------- 
//    


//   --------------------------  13  --------------------------- 
//    


//   --------------------------  14  --------------------------- 
//    


//   --------------------------  15  --------------------------- 
//    


//   --------------------------  16  --------------------------- 
//    


//   --------------------------  17  --------------------------- 
//    


//   --------------------------  18  --------------------------- 
//    


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
rm_num  = $FC;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PA+'222', STR_ow_axis+hex_str(ow_axis));


y3 = $19<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $12<<3,y3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $1D<<3,y3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $22<<3,y3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $2D<<3,y3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $36<<3,y3); // v1: Light w/ CANDLE or FIRE


clm3 = clms0+1;
clm4 = -PAGE_CLMS;
row3 = rows0-1;
data_exit(EXD0,etA1,1,  clm4,row3,  clms1,ROWS5,  clm1,row3-4,  '00'+EXL0_); // DWN 0, Pit down  
data_exit(EXR0,etA0,1,  clm3,-$20,  CLMS2,rows1,  clm3-5,row0+$13,  '03'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,Kakusu005,$1,  $0F<<3,$06<<3,  STR_Treasure+STR_Map+"01"); // $F,$6: Head of left-most pillar


data_path_conditions(exit_name_r0, exit_name_d0);

data_scene_rando(rm);








//   --------------------------  FD  --------------------------- 
//   


//   --------------------------  FE  --------------------------- 
//   


//   --------------------------  FF  --------------------------- 
//   




