/// rm_data_init_Palc_D()


var _i, _a, _val,_val1,_val2, _dist;
var _x,_x1,_x2,_y,_yt, _w,_w2,_w3, _h,_h2,_h3;
var _clm,_clm2, _row,_row2, _clms,_rows;
var _pi, _obj;
var _rm, _file, _data, _exit, _owrc;
var _datakey;
var _dk_spawn_item0, _dk_spawn_item1, _dk_spawn_item2, _dk_spawn_item3, _dk_spawn_item4;








// *************************   PALACE 4   *************************** 
// ------------------------------------------------------------------------------- 
area = area_PD;

var _DUNGEON_NUM  = $04;
var _DUNGEON_NUM_ = hex_str(_DUNGEON_NUM);

mus0 = STR_Dungeon+_DUNGEON_NUM_;
//mus0 = MUS_DUNGEON1;

var _DARK_DATA=STR_Dark+"01";
ow_axis =  0; // 0:horizontal, 1:vertical


var _DUNGEON_NAME = STR_Maze_Island_Palace;
g.dm_dungeon[?STR_Dungeon+_DUNGEON_NUM_+STR_Name] = _DUNGEON_NAME;
g.dm_dungeon[?STR_Dungeon+area         +STR_Name] = _DUNGEON_NAME;
g.dm_dungeon[?STR_Dungeon+STR_Num+_DUNGEON_NAME]  = _DUNGEON_NUM;
g.dm_dungeon[?STR_Dungeon+_DUNGEON_NUM_+STR_Area] = area;
g.dm_dungeon[?_DUNGEON_NAME+STR_Area]             = area;








//   --------------------------  00  --------------------------- 0F
//    
rm_num  = $00;
set_rm_data(area+hex_str(rm_num), mus0, STR_Color+COLOR2_, STR_Tile+area_PD+'000', STR_ow_axis+hex_str(ow_axis));


data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
data_spawn(rm+STR_PRIO,SpStA,$2,  $34<<3,(row0+$11)<<3); // SpawnByStab  2
data_spawn(rm+STR_PRXM,Moa_B,$1,  $30<<3,(row0+$07)<<3); // FieryMoa  1


clm3=$70; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '03'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row_e5, "04");                                    // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$17,  0); // LFT 0, to Overworld  
g.dm_rm[?get_dk_dungeon_entrance(_DUNGEON_NUM)] = exit_name_l0;


//data_rando_scene01("_00"+"_00"+"_01"+"_01"+"_00",rm);
data_path_conditions(exit_name_l0, exit_name_d0);
data_path_conditions(exit_name_d0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  01  --------------------------- 10
//    
rm_num  = $01;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PD+'001', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($09<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($75<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,DoomA,$1,  $0E<<3,y3); // Doomknocker  1
data_spawn(rm+STR_PRXM,DoomA,$1,  $40<<3,(row0+$0B)<<3); // Doomknocker  1


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '02'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmD0,$1,  $24<<3,y3,  STR_Treasure+STR_Map+"02"); // Key 
_dk_spawn_item1 = data_spawn(rm+STR_PRIO,ItmF0,$4,  $4A<<3,y3); // PBag v4: 200


//data_path_conditions(exit_name_r0, exit_name_r0);
data_path_conditions(exit_name_r0, _dk_spawn_item0, STR_GLOVE);
data_path_conditions(exit_name_r0, _dk_spawn_item1, STR_GLOVE);

data_scene_rando(rm);








//   --------------------------  02  --------------------------- 
//    
rm_num  = $02;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PD+'002', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $26<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $2B<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($52<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,LoDoA,$1,  $59<<3,(row0+$15)<<3); // LockedDoor
data_spawn(rm+STR_PRXM,DoomA,$1,  $1C<<3,y3); // Doomknocker  1
data_spawn(rm+STR_PRXM,IrKnA,$2,  $5A<<3,y3); // IronKnuckle  2
data_spawn(rm+STR_PRXM,WosuA,$1,  $24<<3,y3); // Wosu  1
data_spawn(rm+STR_PRXM,WosuA,$1,  $2C<<3,y3); // Wosu  1
data_spawn(rm+STR_PRXM,BubbA,$2,  $60<<3,(row0+$0B)<<3); // Bubble  2


clm3=$50; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '06'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row_e5);                                          // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '01'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '03'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmD0,$1,  $7A<<3,(row0+$0F)<<3,  STR_Treasure+STR_Map+"02"); // Key 


//data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_00",rm, STR_GLOVE+STR_JUMP+STR_STABUP);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_d0);
data_path_conditions(exit_name_r0, _dk_spawn_item0, STR_GLOVE+"+"+STR_JUMP+"+"+STR_STABUP);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_d0);
data_path_conditions(exit_name_l0, _dk_spawn_item0, STR_GLOVE+"+"+STR_JUMP+"+"+STR_STABUP);

data_path_conditions(exit_name_d0, exit_name_r0);
data_path_conditions(exit_name_d0, exit_name_l0);
data_path_conditions(exit_name_d0, _dk_spawn_item0, STR_GLOVE+"+"+STR_JUMP+"+"+STR_STABUP);

data_scene_rando(rm);








//   --------------------------  03  --------------------------- 
//    
rm_num  = $03;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PD+'003', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  $03<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $7C<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($52<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($25<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,LoDoA,$1,  $22<<3,(row3-$02)<<3); // LockedDoor
data_spawn(rm+STR_PRIO,SpStA,$1,  $04<<3,(row0+$11)<<3); // SpawnByStab  1
data_spawn(rm+STR_PRXM,WizaA,$1,  $3E<<3,y3); // Wizard  1
data_spawn(rm+STR_PRXM,WizaA,$1,  $6A<<3,y3); // Wizard  1


clm3=$50; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '00'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_,  clm3,row_e5);                                          // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '02'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '04'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_01",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_u0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_u0);

data_path_conditions(exit_name_u0, exit_name_r0);
data_path_conditions(exit_name_u0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  04  --------------------------- 
//    
rm_num  = $04;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PD+'004', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($6C<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
row4=row0+$0B; y4=row4<<3;
row5=row0+$09; y5=row5<<3;
row6=row0+$19; y6=row6<<3;
_val1=hex_str($4); // 
data_spawn(rm+STR_PRIO,SpTrA,$1,  $14<<3,y6,  STR_Direction+_val1); // SpikeTrapA $1
data_spawn(rm+STR_PRIO,SpTrA,$1,  $30<<3,y5,  STR_Direction+_val1); // SpikeTrapA $1
data_spawn(rm+STR_PRIO,SpTrA,$1,  $5A<<3,y6,  STR_Direction+_val1); // SpikeTrapA $1
data_spawn(rm+STR_PRXM,StalA,$2,  $22<<3,y4); // Stalfos  2
data_spawn(rm+STR_PRXM,StalA,$2,  $3E<<3,y4); // Stalfos  2
data_spawn(rm+STR_PRXM,StalA,$2,  $4C<<3,y4); // Stalfos  2


clm3=$70; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '08'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row_e5);                                          // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '03'+EXR0_); // LFT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmF0,$2,  $3E<<3,y6); // PBag v2: 100 


//data_rando_scene01("_00"+"_00"+"_01"+"_01"+"_00",rm, STR_STABDOWN);
data_path_conditions(exit_name_l0, exit_name_d0);
data_path_conditions(exit_name_l0, _dk_spawn_item0);

data_path_conditions(exit_name_d0, exit_name_l0);
data_path_conditions(exit_name_d0, _dk_spawn_item0);

//data_scene_rando(rm);








//   --------------------------  05  ---------------------------
//    
rm_num  = $05;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PD+'005', STR_ow_axis+hex_str(ow_axis));


row3=row0+$0A; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  ($12<<3)+4,(row0+$18)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $77<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,BlazA,$1,  ($16<<3)+4,(row0+$0E)<<3); // Blaze  1
data_spawn(rm+STR_PRIO,SpPoA,$1,  0,0,  STR_Qualified+STR_Quest+STR_Nums+"02"); // PoisonBubbleSpawner  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $36<<3,(row0+$10)<<3); // Myu  1
data_spawn(rm+STR_PRXM,Myu_A,$1,  $4E<<3,(row0+$0E)<<3); // Myu  1


clm3=$10; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '0B'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row0+$15);                                        // Elevator DW $40, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '06'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_00"+"_01"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_d0);
data_path_conditions(exit_name_d0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  06  --------------------------- 
//    
rm_num  = $06;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PD+'003', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  $03<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $7C<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($52<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($25<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,LoDoA,$1,  $22<<3,(row0+$15)<<3); // LockedDoor
data_spawn(rm+STR_PRIO,SpWoA,$1,  $1E<<3,y3); // WosuSpawner  1
data_spawn(rm+STR_PRXM,WizaA,$1,  $26<<3,y3); // Wizard  1
data_spawn(rm+STR_PRXM,WizaA,$1,  $64<<3,y3); // Wizard  1


clm3=$50; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '02'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_,  clm3,row_e5);                                          // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '05'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '07'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_01",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_u0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_u0);

data_path_conditions(exit_name_u0, exit_name_r0);
data_path_conditions(exit_name_u0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  07  --------------------------- 
//    
rm_num  = $07;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PD+'006', STR_ow_axis+hex_str(ow_axis));


data_spawn(rm+STR_PRIO,BlazA,$1,  ($100)+4,$60); // $8C: Blaze  1
data_spawn(rm+STR_PRIO,BlazA,$1,  ($200)+4,$60); // $8C: Blaze  1
data_spawn(rm+STR_PRIO,BlazA,$1,  ($300)+4,$60); // $8C: Blaze  1
data_spawn(rm+STR_PRXM,Ra__A,$2,  $1B0,$60); // $A9: Ra  2
data_spawn(rm+STR_PRXM,Ra__A,$2,  $240,$60); // $A9: Ra  2
data_spawn(rm+STR_PRIO,SpStA,$2,  $76<<3,(row0+$0E)<<3); // SpawnByStab  2
//data_spawn_PRIO(_rm, SpStA,  2,  $3B0,   $70); // $09: SpawnByStab  2


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$12,  '06'+'10');   // LFT 0,  


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmD0,$1,  $7A<<3,(row0+$0E)<<3,  STR_Treasure+STR_Map+"02"); // Key


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);
//data_path_conditions(exit_name_l0, exit_name_l0);
data_path_conditions(exit_name_l0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  08  --------------------------- 
//    
rm_num  = $08;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PD+'007', STR_ow_axis+hex_str(ow_axis));


row3=row0+$08; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($12<<3)+4,(row0+$12)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $37<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,StalA,$1,  $28<<3,(row0+$04)<<3); // Stalfos  1.  MOD moved higher up. OG x $6C<<3, y $0C<<3.


clm3=$10; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '04'+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '0E'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row0+$0F);                                  // Elevator DW $40, UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '09'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_00"+"_01"+"_01",rm);
data_path_conditions(exit_name_r0, exit_name_d0);
data_path_conditions(exit_name_r0, exit_name_u0);

data_path_conditions(exit_name_d0, exit_name_r0);
data_path_conditions(exit_name_d0, exit_name_u0);

data_path_conditions(exit_name_u0, exit_name_r0);
data_path_conditions(exit_name_u0, exit_name_d0);

data_scene_rando(rm);








//   --------------------------  09  --------------------------- 
//    
rm_num  = $09;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PD+'017', STR_ow_axis+hex_str(ow_axis));


row3=row0+$07; y3=row3<<3;
row4=row0+$17; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,(row3+$01)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $77<<3,(row4+$01)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,DoomA,$1,  $68<<3,y4); // Doomknocker  1
data_spawn(rm+STR_PRXM,WosuA,$1,  $5E<<3,y4); // Wosu  1


data_exit(EXD0,etA1,1,  $12,row_e2,  $2C,ROWS5,  $30,row_e3,  '0F'+EXU0_); // DWN 0, Pit down 
data_pit(exit_name_d0,0,2);
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '08'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '0A'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  $0E<<3,(row0+$19)<<3,  STR_Treasure+STR_Map+"02"); // MAGIC PIECE


//data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_00"+STR_Pit+"4",rm);
data_path_conditions(exit_name_r0, exit_name_d0);
data_path_conditions(exit_name_r0, _dk_spawn_item0, STR_JUMP+"+"+STR_FAIRY);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_d0);
data_path_conditions(exit_name_l0, _dk_spawn_item0, STR_FAIRY);

data_scene_rando(rm);








//   --------------------------  0A  --------------------------- 
//    
rm_num  = $0A;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PD+'006', STR_ow_axis+hex_str(ow_axis));


row3=row0+$12; y3=row3<<3;
row4=row0+$0E; y4=row4<<3;
row5=row0+$0C; y5=row5<<3;
data_spawn(rm+STR_PRIO,BlazA,$1,  ($100)+4,y5); // Blaze  1
data_spawn(rm+STR_PRIO,BlazA,$1,  ($200)+4,y5); // Blaze  1
data_spawn(rm+STR_PRIO,BlazA,$1,  ($300)+4,y5); // Blaze  1
data_spawn(rm+STR_PRXM,DoomA,$1,  $42<<3,y4); // Doomknocker  1
//data_spawn(rm+STR_PRXM,DoomA,$1,  $48<<3,(row0+$0E)<<3); // Doomknocker  1
data_spawn(rm+STR_PRIO,SpStA,$2,  $3B0,y4); // SpawnByStab  2


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '09'+EXR0_); // LFT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmD0,$1,  $3D0,y4,  STR_Treasure+STR_Map+"02"); // Key 


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);
//data_path_conditions(exit_name_l0, exit_name_l0);
data_path_conditions(exit_name_l0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  0B  --------------------------- 
//    
rm_num  = $0B;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PD+'009', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0C<<3)+4,y4,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($12<<3)+4,y4,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $79<<3,y4,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($3E<<3)+4,y4,  STR_Qualified+STR_Quest+STR_Nums+"02"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4E<<3)+4,y4,  STR_Qualified+STR_Quest+STR_Nums+"02"); // v1: Light w/ CANDLE or FIRE
row4=row0+$0B; y4=row4<<3;
data_spawn(rm+STR_PRIO,LoDoA,$1,  $16<<3,(row3-$02)<<3); // LockedDoor
data_spawn(rm+STR_PRXM,BubbA,$2,  $1C<<3,y4,  STR_Direction+hex_str($2|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $6C<<3,y4,  STR_Direction+hex_str($2|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,StalA,$2,  $2E<<3,y4); // Stalfos  2
data_spawn(rm+STR_PRXM,StalA,$2,  $4E<<3,y4); // Stalfos  2


clm3=$10; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '05'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_,  clm3,row_e5, "03");                                    // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0C'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmF0,$5,  $5A<<3,(row0+$09)<<3); // PBag v5: 250


//data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_01",rm, STR_JUMP);
data_path_conditions(exit_name_r0, exit_name_u0);
data_path_conditions(exit_name_r0, _dk_spawn_item0, STR_JUMP);

data_path_conditions(exit_name_u0, exit_name_r0);
data_path_conditions(exit_name_u0, _dk_spawn_item0, STR_JUMP);

data_scene_rando(rm);








//   --------------------------  0C  --------------------------- 
//    
rm_num  = $0C;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PD+'010', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0E<<3)+4,y4,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($2F<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4F<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($70<<3)+4,y4,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
row4=row0+$19; y4=row4<<3;
row5=row0+$0B; y5=row5<<3;
data_spawn(rm+STR_PRXM,IrKnA,$2,  $1C<<3,y3); // IronKnuckle  2
data_spawn(rm+STR_PRXM,IrKnA,$2,  $54<<3,y3); // IronKnuckle  2
// MOD. Adding infinite respawn enemies for magic jars for Carock fight.
data_spawn(rm+STR_PRXM,Myu_A,$1,  $26<<3,y4); // Myu  1
data_spawn(rm+STR_PRXM,Myu_A,$1,  $46<<3,y4); // Myu  1
data_spawn(rm+STR_PRXM,Myu_A,$1,  $66<<3,y4); // Myu  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $14<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $34<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $54<<3,y5); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0B'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '15'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  0D  --------------------------- 1C
//   -----------------------  CAROCK  ------------------------- 
rm_num  = $0D;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PD+'025', STR_ow_axis+hex_str(ow_axis));


row3=row0+$14; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $04<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $13<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $4E<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $5D<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
/*
data_spawn(rm+STR_PRIO,TorchA,$1,  $06<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $11<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $50<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $5B<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
*/

clm3=$31; // clm3: arena center
data_spawn(rm+STR_PRIO,CaroA,$1,  $71<<3,y3,  STR_Arena+'_x'+hex_str(clm3<<3)); // Carock  1
data_spawn(rm+STR_PRIO,CrHoA,$1,  ($6F<<3)-4,y3); // CrystalHolder  1
g.dm_rm[?STR_Boss+STR_Scene+STR_Name+_DUNGEON_NAME] = rm;


_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '15'+EXR0_); // LFT 0, 
g.dm_rm[?_DUNGEON_NAME+STR_Boss+STR_Scene+STR_Entrance+STR_Exit] = _exit;

_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0);         // RGT 0, to Overworld 
g.dm_rm[?STR_Boss+STR_Dungeon+STR_Exit+STR_Name+_DUNGEON_NAME] = _exit;


// 2nd Quest tile data. Has less platform surface.
set_rm_data_1a(rm,area_PD+'026',2); // 3 pillars to stand on
/*
row3=row0+$14; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0F<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $55<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $50<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $5F<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE

clm3=$30; // clm3: arena center
data_spawn(rm+STR_PRIO,CaroA,$1,  $70<<3,y3,  STR_Arena+'_x'+hex_str(clm3<<3)); // Carock  1
data_spawn(rm+STR_PRIO,CrHoA,$1,  ($6F<<3)-4,y3); // CrystalHolder  1
g.dm_rm[?STR_Boss+STR_Scene+STR_Name+_DUNGEON_NAME] = rm;


_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '15'+EXR0_); // LFT 0, 
g.dm_rm[?_DUNGEON_NAME+STR_Boss+STR_Scene+STR_Entrance+STR_Exit] = _exit;

_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0);         // RGT 0, to Overworld 
g.dm_rm[?STR_Boss+STR_Dungeon+STR_Exit+STR_Name+_DUNGEON_NAME] = _exit;


// 2nd Quest tile data. Has less platform surface.
set_rm_data_1a(rm,area_PD+'026',2); // 3 pillars to stand on
*/


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  0E  --------------------------- 
//    
rm_num  = $0E;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PD+'012', STR_ow_axis+hex_str(ow_axis), STR_View+'02');


clms3 = $09; // num clms from Elev xc to each Bubble
row3  = row0+$0C;
data_spawn(rm+STR_PRXM,BubbA,$1,  (clm1-clms3-1)<<3,row3<<3); // $90: Bubble  1
data_spawn(rm+STR_PRXM,BubbA,$2,  (clm1+clms3-1)<<3,row3<<3); // $90: Bubble  2


clm3 = clm1-4; // Elev xl clm
clm4 = clm1-1; // PC spawn_y clm
data_exit(EXU0,etC0,1,  clm3,row_e0,  CLMS4,ROWS5,  clm4,row0+$05,  '08'+EXD0_); // UP  0, Elevator up 
data_exit(EXD0,etC0,1,  clm3,row_e2,  CLMS4,ROWS5,  clm4,row0+$1B,  '12'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm1,row_e5);                                            // Elevator DW $40, UP $80, 


//MAP_DATAKEY1 = STR_Map+STR_Tile;
//MAP_DATAKEY2 = STR_Map+STR_Explored+STR_Exception;
//g.dm_rm[?MAP_DATAKEY2+"01"+rm] = 1;
_a=$00;  _datakey=MAP_DATAKEY1+rm+STR_Page;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = $35;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;


//data_rando_scene01("_00"+"_00"+"_00"+"_01"+"_01",rm);
data_path_conditions(exit_name_d0, exit_name_u0);
data_path_conditions(exit_name_u0, exit_name_d0);

data_scene_rando(rm);









//   --------------------------  0F  --------------------------- 
//    
rm_num  = $0F;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PD+'013', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($45<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($63<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($73<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,BubbA,$1,  $5C<<3,y3); // Bubble  1
data_spawn(rm+STR_PRXM,WosuA,$1,  $5C<<3,y3); // Wosu  1
data_spawn(rm+STR_PRXM,WosuA,$1,  $64<<3,y3); // Wosu  1
data_spawn(rm+STR_PRXM,DoomA,$1,  $6E<<3,y3); // Doomknocker  1


data_exit(EXU0,etA4,0,  $20,row_e0,  $60,ROWS5,  $2F,row_e4,  '09'+EXD0_); // UP  0, Pit up 
data_exit(EXD0,etA1,1,  $22,row_e2,  $1C,ROWS5,  $2F,row_e3,  '13'+EXU0_); // DWN 0, Pit down 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '10'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmF0,$4,  $04<<3,y3); // PBag v4: 200


//data_rando_scene01("_00"+"_01"+"_00"+"_01"+"_01"+STR_Pit+"C",rm);
data_path_conditions(exit_name_r0, exit_name_d0);
data_path_conditions(exit_name_r0, _dk_spawn_item0, STR_JUMP+"|"+STR_FAIRY);

data_path_conditions(exit_name_u0, exit_name_r0);
data_path_conditions(exit_name_u0, exit_name_d0);
data_path_conditions(exit_name_u0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  10  --------------------------- 
//   ------------------------  BOOTS  -------------------------- 
rm_num  = $10;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PD+'014', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $16<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $49<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $56<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
row4=row0+$0B; y4=row4<<3;
data_spawn(rm+STR_PRIO,LoDoA,$1,  $59<<3,(row3-$02)<<3); // LockedDoor
data_spawn(rm+STR_PRXM,IrKnA,$3,  $4C<<3,y3); // IronKnuckle  3
data_spawn(rm+STR_PRXM,StalA,$2,  $28<<3,y4); // Stalfos  2
data_spawn(rm+STR_PRXM,StalA,$1,  $2C<<3,y4); // Stalfos  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0F'+EXR0_); // LFT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmA3,$1,  $6C<<3,y3); // BOOTS 


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);
//data_path_conditions(exit_name_l0, exit_name_l0);
data_path_conditions(exit_name_l0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  11  --------------------------- 20
//    
rm_num  = $11;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PD+'001', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($09<<3)+4,y4,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($75<<3)+4,y4,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpStA,$2,  $56<<3,y3); // SpawnByStab  2
data_spawn(rm+STR_PRIO,SpMaA,$1,  $1E<<3,y3); // MauSpawner  1


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '12'+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmD0,$1,  $24<<3,y3,  STR_Treasure+STR_Map+"02"); // Key 


//data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_00",rm, STR_GLOVE);
//data_path_conditions(exit_name_r0, exit_name_r0);
data_path_conditions(exit_name_r0, _dk_spawn_item0, STR_GLOVE);

data_scene_rando(rm);








//   --------------------------  12  --------------------------- 
//    
rm_num  = $12;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PD+'003', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  $03<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $7C<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($52<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($25<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,LoDoA,$1,  $57<<3,(row0+$15)<<3); // LockedDoor
data_spawn(rm+STR_PRXM,WizaA,$1,  $22<<3,y3); // Wizard  1
data_spawn(rm+STR_PRXM,WizaA,$1,  $66<<3,y3); // Wizard  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $2C<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $34<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $6A<<3,y3); // Bot  1


clm3=$50; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '0E'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_,  clm3,row_e5, "03");                                    // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '11'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '13'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_01",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_u0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_u0);

data_path_conditions(exit_name_u0, exit_name_r0);
data_path_conditions(exit_name_u0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  13  --------------------------- 
//    
rm_num  = $13;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PD+'015', STR_ow_axis+hex_str(ow_axis));


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$0C; y5=row5<<3;
row6=row0+$07; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $77<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,BlazA,$1,  ($08<<3)+4,y5); // Blaze  1
data_spawn(rm+STR_PRIO,BlazA,$1,  ($12<<3)+4,y5); // Blaze  1
data_spawn(rm+STR_PRXM,Ra__A,$1,  $36<<3,y6); // Ra  1
data_spawn(rm+STR_PRXM,Ra__A,$1,  $48<<3,y6); // Ra  1


data_exit(EXU0,etA4,0,  $1C,row_e0,  $30,ROWS5,  $2F,row_e4,  '0F'+EXD0_); // UP  0, Pit up 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '12'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '14'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_01"+STR_Pit+"8",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_path_conditions(exit_name_u0, exit_name_r0);
data_path_conditions(exit_name_u0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  14  --------------------------- 23
//    
rm_num  = $14;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PD+'006', STR_ow_axis+hex_str(ow_axis));


y3=(row0+$0C)<<3;
data_spawn(rm+STR_PRIO,BlazA,$1,  ($20<<3)+4,y3); // Blaze  1
data_spawn(rm+STR_PRIO,BlazA,$1,  ($40<<3)+4,y3); // Blaze  1
data_spawn(rm+STR_PRIO,BlazA,$1,  ($60<<3)+4,y3); // Blaze  1
data_spawn(rm+STR_PRXM,DoomA,$1,  $24<<3,(row0+$0E)<<3); // Doomknocker  1
data_spawn(rm+STR_PRXM,StalA,$1,  $4B<<3,(row0+$0A)<<3); // Stalfos  1
//data_spawn(rm+STR_PRXM,StalA,$1,  $4C<<3,(row0+$0C)<<3); // Stalfos  1
data_spawn(rm+STR_PRXM,BubbA,$2,  $64<<3,(row0+$16)<<3); // Bubble  2


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$12,  '13'+EXR0_); // LFT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmD0,$1,  $7A<<3,(row0+$0E)<<3,  STR_Treasure+STR_Map+"02"); // Key 


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);
//data_path_conditions(exit_name_l0, exit_name_l0);
data_path_conditions(exit_name_l0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  15  --------------------------- 
//    
rm_num  = $15;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PD+'016', STR_View+'00', STR_ow_axis+hex_str(ow_axis));


clm3=$0D; x3=clm3<<3;
clm4=$32; x4=clm4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,$13<<3,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,$1F<<3,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,$2B<<3,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,$37<<3,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
//                                                              //
data_spawn(rm+STR_PRIO,TorchA,$1,  x4,$0D<<3,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x4,$19<<3,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x4,$25<<3,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x4,$31<<3,  STR_Qualified+STR_Quest+STR_Nums+"01"); // v1: Light w/ CANDLE or FIRE

data_spawn(rm+STR_PRIO,SpStA,$1,  $14<<3,$06<<3); // SpawnByStab  1
_pi = global.PI_BGR1;
clm3=$06; x3=clm3<<3;
clm4=$38; x4=clm4<<3;
data_spawn(rm+STR_PRXM,Snaraa,$1,  x3,$0D<<3,  dk_PI+hex_str(_pi)); // Snaraa
data_spawn(rm+STR_PRXM,Snaraa,$1,  x3,$19<<3,  dk_PI+hex_str(_pi)); // Snaraa
data_spawn(rm+STR_PRXM,Snaraa,$1,  x3,$25<<3,  dk_PI+hex_str(_pi)); // Snaraa
//                                                              //
data_spawn(rm+STR_PRXM,Snaraa,$1,  x4,$13<<3,  dk_PI+hex_str(_pi)); // Snaraa
data_spawn(rm+STR_PRXM,Snaraa,$1,  x4,$1F<<3,  dk_PI+hex_str(_pi)); // Snaraa
data_spawn(rm+STR_PRXM,Snaraa,$1,  x4,$2B<<3,  dk_PI+hex_str(_pi)); // Snaraa


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,$36,  '0C'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,$08,  '0D'+EXL0_); // RGT 0, 


////data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_JUMP);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0, STR_JUMP);

data_scene_rando(rm);








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


//   --------------------------  FD  --------------------------- 
//    


//   --------------------------  FE  --------------------------- 
//    


//   --------------------------  FF  --------------------------- 
//    




