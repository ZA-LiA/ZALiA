


var _a, _x,_yt, _pi;
var _val, _val1,_val2,_val3;
var _dist,_dist1,_dist2;
var _obj, _ver;
var _rm;
var _exit = EXIT_NAME_GAME_START;
var _file;
var _rc = $00;
var _tsrc = $00;
var _datakey;








// *************************   PALACE 7   *************************** 
// ------------------------------------------------------------------------------- 
area = area_PG;

var _DUNGEON_NUM  = $07;
var _DUNGEON_NUM_ = hex_str(_DUNGEON_NUM);

mus0 = STR_Dungeon+_DUNGEON_NUM_;
//mus0 = MUS_DUNGEON1;

var _DARK_DATA=STR_Dark+"01";
ow_axis =  0; // 0:horizontal, 1:vertical


var _DUNGEON_NAME = STR_Great_Palace;
g.dm_dungeon[?STR_Dungeon+_DUNGEON_NUM_+STR_Name] = _DUNGEON_NAME;
g.dm_dungeon[?STR_Dungeon+area         +STR_Name] = _DUNGEON_NAME;
g.dm_dungeon[?STR_Dungeon+STR_Num+_DUNGEON_NAME]  = _DUNGEON_NUM;
g.dm_dungeon[?STR_Dungeon+_DUNGEON_NUM_+STR_Area] = area;
g.dm_dungeon[?_DUNGEON_NAME+STR_Area]             = area;








//   --------------------------  00  --------------------------- 
//    
rm_num  = $00;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PG+'000', STR_ow_axis+hex_str(ow_axis));
g.dm_rm[?"CrystalBarrier1"+dk_SceneName] = rm;
//g.CrystalBarrier1_RM_NAME = rm;


data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1',  $0000,  3,StarSky_1_init);
row3=row0+$17; y3=row3<<3; // pc spawn row exit left
row4=row3-$04; y4=row4<<3; // pc spawn row exit right-1
row5=row0+$03; y5=row5<<3;
//row4=row3+$01; y4=row4<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  $37<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $77<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,BarrA,$1,  $3C<<3,(row0+$09)<<3); // Barrier  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $58<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$2,  $60<<3,y5); // Bot  2
data_spawn(rm+STR_PRXM,Bot_A,$1,  $64<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$2,  $6A<<3,y5); // Bot  2
data_spawn(rm+STR_PRXM,Bot_A,$1,  $6E<<3,y5); // Bot  1


_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
g.dm_rm[?get_dk_dungeon_entrance(_DUNGEON_NUM)] = _exit;

row3    = -PAGE_ROWS;
row4    = row0+$07;
row5    = row4-$06;
row6    = row0+$13;
rows3   = row4-row3;
rows4   = (rows0-row4) + PAGE_ROWS;
data_exit(EXR0,etA0,1,  clm2,row3,  CLMS2,rows3,  clmA,row5,  '3B'+EXL0_); // RGT 0, 
data_exit(EXR1,etA0,1,  clm2,row4,  CLMS2,rows4,  clmA,row6,  '3B'+EXL1_); // RGT 1, 








//   --------------------------  01  --------------------------- 
//    
rm_num  = $01;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'069', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3; // pc spawn row exit right
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0C<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($73<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bot_A,$1,  $34<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $3A<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $3E<<3,y3); // Bot  1


clm3=$10; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '06'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row_e5);                                                 // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$11,  '5A'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '02'+EXL0_); // RGT 0, 
/*
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'001', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3; // pc spawn row exit right
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0C<<3)+0,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($73<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bot_A,$1,  $34<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $3A<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $3E<<3,y3); // Bot  1


clm3=$10; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '06'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row_e5);                                                 // Elevator DW $40, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '02'+EXL0_); // RGT 0, 
*/


//data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_00",rm);







//   --------------------------  02  --------------------------- 
//    
rm_num  = $02;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'002', STR_ow_axis+hex_str(ow_axis));


clm3=$50; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$0F; y3=row3<<3; // pc spawn row exit left
row4=row0+$13; y4=row4<<3; // pc spawn row exit right
row5=row0+$09; y5=row5<<3;
row6=row0+$18; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$2,  $37<<3,y5); // Drop spawner v2. Drops Flame1
data_spawn(rm+STR_PRIO,SpDrA,$2,  $67<<3,y5); // Drop spawner v2. Drops Flame1
data_spawn(rm+STR_PRXM,FokuA,$1,  $1A<<3,(row0+$11)<<3); // Fokkeru  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '3B'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row_e5);                                                 // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '01'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '03'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_01",rm);








//   --------------------------  03  --------------------------- 
//    
rm_num  = $03;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PG+'003', STR_ow_axis+hex_str(ow_axis));


row3=row0+$12; y3=row3<<3; // pc spawn row exit left, right
row4=row3+$01; y4=row4<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpBaA,$1,  $1E<<3,(row0+$08)<<3); // BagoSpawner  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '02'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '04'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  04  --------------------------- 
//    
rm_num  = $04;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'004', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3; // pc spawn row exit left, 
row4=row3+$01; y4=row4<<3;
row5=row0+$09; y5=row5<<3;
row6=row5+$01; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($07<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($67<<3)+4,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,FokuA,$1,  $36<<3,(row0+$13)<<3); // Fokkeru  1
data_spawn(rm+STR_PRXM,BubbA,$2,  $76<<3,(row5+$02)<<3); // Bubble  2


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '03'+EXR0_); // LFT 0, 


data_spawn(rm+STR_PRIO,ItmF0,$A,  $78<<3,y5); // PBag $A: 1000


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm, STR_JUMP);








//   --------------------------  05  --------------------------- 
//    
rm_num  = $05;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'001', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3; // pc spawn row exit right
row4=row3+$01; y4=row4<<3;
row5=row0+$09; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0C<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($73<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Ra__A,$3,  $36<<3,y5); // Ra  3
data_spawn(rm+STR_PRXM,Ra__A,$3,  $48<<3,y5); // Ra  3


clm3=$10; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '09'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row_e5);                                                 // Elevator DW $40, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '06'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_00"+"_01"+"_00",rm);









//   --------------------------  06  --------------------------- 
//    
rm_num  = $06;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'002', STR_ow_axis+hex_str(ow_axis));


clm3=$50; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$17; y3=row3<<3;
row4=row0+$09; y4=row4<<3;
row6=row0+$18; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$2,  $37<<3,y4); // Drop spawner v2. Drops Flame1
data_spawn(rm+STR_PRIO,SpDrA,$2,  $67<<3,y4); // Drop spawner v2. Drops Flame1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '01'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row_e5);                                                 // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0F,  '05'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$13,  '07'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_01",rm);








//   --------------------------  07  --------------------------- 
//    
rm_num  = $07;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'030', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3; // pc spawn row exit left, right
row4=row0+$15; y4=row4<<3;
row5=row0+$13; y5=row5<<3;
row6=row0+$0B; y6=row6<<3;
row7=row3+$01; y7=row7<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,y7,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,y7,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spin_trap(FiRoA,1,  $20<<3,y4,  -1,  8,1,4, 0*90); // Firerope
data_spin_trap(FiRoA,1,  $30<<3,y5,  -1,  8,1,4, 1*90); // Firerope
data_spin_trap(FiRoA,1,  $40<<3,y4,  -1,  8,1,4, 2*90); // Firerope
data_spin_trap(FiRoA,1,  $50<<3,y5,  -1,  8,1,4, 3*90); // Firerope
data_spin_trap(FiRoA,1,  $60<<3,y4,  -1,  8,1,4, 2*90); // Firerope
data_spawn(rm+STR_PRXM,Ra__A,$3,  $36<<3,y6); // Ra  3
data_spawn(rm+STR_PRXM,Ra__A,$3,  $48<<3,y6); // Ra  3


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '06'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '08'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  08  --------------------------- 
//    
rm_num  = $08;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'005', STR_ow_axis+hex_str(ow_axis));


clm3=$70; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$17; y3=row3<<3; // pc spawn row exit left
row4=row3+$01; y4=row4<<3;
clm6=$10; x6=(clm6<<3)-4; _dist=$18<<3; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
/*
_dist=$15<<3; x3=_dist>>1;                   _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  (clm3-$04)<<3,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
*/
data_spawn(rm+STR_PRXM,FokuA,$1,  $62<<3,y3); // Fokkeru  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '0C'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row_e5);                                                 // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '07'+EXR0_); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_01"+"_00",rm);








//   --------------------------  09  --------------------------- 
//    
rm_num  = $09;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'006', STR_ow_axis+hex_str(ow_axis));


clm3=$10; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$15; y3=row3<<3; // pc spawn row exit right
row4=row3-$02; y4=row4<<3;
row5=row3+$02; y5=row5<<3;
row6=row3+$01; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,AnerA,$3,  $2A<<3,y4); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $2E<<3,y5); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $32<<3,y3); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $60<<3,y3); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $64<<3,y5); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $68<<3,y4); // Aneru  3


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '05'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row0+$12);                                               // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0A'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_01",rm, STR_GLOVE);








//   --------------------------  0A  --------------------------- 
//    
rm_num  = $0A;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'007', STR_ow_axis+hex_str(ow_axis));


clm3=$50; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$17; y3=row3<<3;
row4=row0+$0D; y4=row4<<3;
//row6=row3+$01; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpStA,$2,  $3C<<3,(row0+$0F)<<3); // SpawnByStab  2
data_spawn(rm+STR_PRXM,BubbA,$1,  $20<<3,y4); // Bubble  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $30<<3,y4,  STR_Direction+hex_str($2|$8)); // Bubble  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $64<<3,y4,  STR_Direction+hex_str($1|$8)); // Bubble  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '0F'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row_e5);  // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '09'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0B'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_00",rm);








//   --------------------------  0B  --------------------------- 
//    
rm_num  = $0B;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'008', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0B<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($1F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($33<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($6B<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,FokuA,$1,  $22<<3,(row0+$0B)<<3); // Fokkeru  1
data_spawn(rm+STR_PRXM,FokuA,$1,  $50<<3,(row0+$0F)<<3); // Fokkeru  1


data_exit(EXU0,etA0,0,  $04,row_e0,  $28,ROWS5,  $10,row_e4,  '2D'+EXD0_); // UP  0, Pit up 
//data_exit(EXU0,etA0,0,  $00,row_e0,  $30,ROWS5,  $10,row_e4,  '2D'+EXD0_); // UP  0, Pit up 
data_exit(EXD0,etA1,1,  $00,row_e2,  clms0,ROWS5,  $4F,row_e3,  '55'+EXU0_); // DWN 0, Pit down 
data_pit(exit_name_d0,0,2);
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0A'+EXR0_); // LFT 0, 


data_spawn(rm+STR_PRIO,ItmF0,$A,  $74<<3,y3); // PBag $A: 1000


//data_rando_scene01("_00"+"_00"+"_01"+"_01"+"_01"+STR_Pit+"C",rm);








//   --------------------------  0C  --------------------------- 
//    
rm_num  = $0C;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'006', STR_ow_axis+hex_str(ow_axis));


clm3=$10; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$15; y3=row3<<3; // pc spawn row exit right
row4=row0+$09; y4=row4<<3;
row6=row3+$01; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Ra__A,$3,  $36<<3,y4); // Ra  3
data_spawn(rm+STR_PRXM,Ra__A,$3,  $48<<3,y4); // Ra  3


clm3=$10; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '08'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row0+$12);                                         // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0D'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_01",rm, STR_GLOVE);








//   --------------------------  0D  --------------------------- 
//    
rm_num  = $0D;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'036', STR_ow_axis+hex_str(ow_axis));


clm3=$70; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$17; y3=row3<<3; // pc spawn row exit left
row4=row3+$01; y4=row4<<3;
clm6=$10; x6=(clm6<<3)-4; _dist=$18<<3;
//row6=row3+$01; y6=row6<<3;
_a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE



data_spawn(rm+STR_PRXM,FokkA,$1,  $30<<3,y3); // Fokka  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $4E<<3,(row0+$11)<<3); // Bot  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '10'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row_e5);  // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0C'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '3D'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_00",rm);








//   --------------------------  0E  --------------------------- 
//    
rm_num  = $0E;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'001', STR_ow_axis+hex_str(ow_axis));


clm3=$10; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$17; y3=row3<<3; // pc spawn row exit right
row4=row3+$01; y4=row4<<3;
row5=row0+$09; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0C<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($73<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,FokuA,$1,  $190,(row0+$0B)<<3); // Fokkeru  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '11'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row_e5);  // Elevator DW $40, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0F'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_00"+"_01"+"_00",rm);








//   --------------------------  0F  --------------------------- 
//    
rm_num  = $0F;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PG+'027', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row0+$0F; y4=row4<<3;
//row4=row3+$01; y4=row4<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  $37<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $77<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,AnerA,$3,  $60<<3,(row0+$16)<<3); // Aneru  3


clm3=$70; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '0A'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_,  clm3,row0+$12);// Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0A,  '0E'+EXR0_); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01",rm);
//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01",rm, STR_JUMP);









//   --------------------------  10  --------------------------- 
//    
rm_num  = $10;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'038', STR_ow_axis+hex_str(ow_axis));


clm3=$70; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpStA,$2,  $2E<<3,(row0+$0F)<<3); // SpawnByStab  2


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '0D'+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '12'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row0+$15);    // Elevator DW $40, UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '57'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '58'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_01",rm);








//   --------------------------  11  --------------------------- 
//    
rm_num  = $11;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'011', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($1F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpStA,$2,  $2E<<3,(row0+$0F)<<3); // SpawnByStab  2


clm3=$70; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '0E'+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '13'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row_e5); // Elevator DW $40, UP $80, 


data_rando_scene01("_00"+"_00"+"_00"+"_01"+"_01",rm);








//   --------------------------  12  --------------------------- 
//    
rm_num  = $12;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'049', STR_ow_axis+hex_str(ow_axis));


clm3=$70; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0D<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($25<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,BubbA,$8,  $0C<<3,(row0+$15)<<3,  STR_Direction+hex_str($1|$8)); // GiantBubble
data_spawn(rm+STR_PRXM,BubbA,$8,  $24<<3,(row0+$0B)<<3); // GiantBubble


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '10'+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '16'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row0+$15);    // Elevator DW $40, UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '48'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '44'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_01",rm);








//   --------------------------  13  --------------------------- 
//    
rm_num  = $13;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'012', STR_ow_axis+hex_str(ow_axis));


clm3=$10; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$09; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Ra__A,$3,  $1B0,y5); // Ra  3
data_spawn(rm+STR_PRXM,Ra__A,$3,  $240,y5); // Ra  3
data_spawn(rm+STR_PRXM,Myu_A,$1,  $210,y3); // Myu  1
data_spawn(rm+STR_PRXM,Myu_A,$1,  $240,y3); // Myu  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '11'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row_e5);                                           // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '14'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_01",rm);








//   --------------------------  14  --------------------------- 
//    
rm_num  = $14;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'005', STR_ow_axis+hex_str(ow_axis));


clm3=$70; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$17; y3=row3<<3; // pc spawn row exit left
row4=row3+$01; y4=row4<<3;
clm6=$0F; x6=(clm6<<3)+4; _dist=$18<<3; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
/*
_dist=$15<<3; x3=_dist>>1;                   _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  (clm3-$04)<<3,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
*/
data_spawn(rm+STR_PRXM,FokkA,$1,  $6A<<3,(row0+$0F)<<3); // Fokka  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '18'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row_e5);  // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '13'+EXR0_); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_01"+"_00",rm);








//   --------------------------  15  --------------------------- 
//    
rm_num  = $15;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'037', STR_ow_axis+hex_str(ow_axis));


clm3=$30; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$17; y3=row3<<3; // pc spawn row exit right
row4=row0+$12; y4=row4<<3;
row5=row3+$01; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($2B<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($73<<3)+4,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bot_A,$1,  $17<<3,(row0+$0E)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $38<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $3E<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $40<<3,y3); // Bot  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '19'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$14); // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row4,  '4A'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '16'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_00",rm);








//   --------------------------  16  --------------------------- 
//    
rm_num  = $16;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'002', STR_ow_axis+hex_str(ow_axis));


clm3=$50; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$17; y3=row3<<3;
row4=row0+$09; y4=row4<<3;
row6=row3+$01; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$2,  $37<<3,y4); // Drop spawner v2. Drops Flame1
data_spawn(rm+STR_PRIO,SpDrA,$2,  $67<<3,y4); // Drop spawner v2. Drops Flame1
data_spawn(rm+STR_PRXM,FokuA,$1,  $1A<<3,(row0+$11)<<3); // Fokkeru  1
data_spawn(rm+STR_PRXM,FokuA,$1,  $74<<3,(row0+$13)<<3); // Fokkeru  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '12'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_,  clm3,row_e5);  // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0F,  '15'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$13,  '17'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_01",rm);








//   --------------------------  17  --------------------------- 
//    
rm_num  = $17;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'036', STR_ow_axis+hex_str(ow_axis));


clm3=$70; x3=clm3<<3; // clm3: elevator center clm
clm6=$0F; x6=(clm6<<3)+4; _dist=$18<<3; _a=0;
row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$09; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpStA,$2,  $6A<<3,(row0+$0F)<<3); // SpawnByStab  2
data_spawn(rm+STR_PRXM,AnerA,$3,  $1C<<3,y3); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $34<<3,y3); // Aneru  3
data_spawn(rm+STR_PRXM,Ra__A,$3,  $36<<3,y5); // Ra  3
data_spawn(rm+STR_PRXM,Ra__A,$3,  $48<<3,y5); // Ra  3


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '1B'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row_e5);  // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '16'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '4C'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_00",rm);







//   --------------------------  18  --------------------------- 
//    
rm_num  = $18;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'039', STR_ow_axis+hex_str(ow_axis));


clm3=$70; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  ($17<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  ($27<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,ReFaA,$1,  ($1F<<3)+4,(row0+$11)<<3); // RestoreFairy  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '14'+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '23'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row0+$15, "05");   // Elevator DW $40, UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '4B'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_00"+"_01"+"_01",rm);








//   --------------------------  19  --------------------------- 
//    
rm_num  = $19;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'006', STR_ow_axis+hex_str(ow_axis));


clm3=$10; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$15; y3=row3<<3; // pc spawn row exit right
row4=row3-$02; y4=row4<<3;
row5=row3+$02; y5=row5<<3;
row6=row3+$01; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bot_A,$1,  $2A<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $32<<3,(row3+$02)<<3); // Bot  1
data_spawn(rm+STR_PRXM,FokkA,$2,  $4A<<3,y3); // Fokka  2


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '15'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row0+$12);   // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '1A'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_01",rm, STR_GLOVE);








//   --------------------------  1A  --------------------------- 
//    
rm_num  = $1A;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PG+'013', STR_ow_axis+hex_str(ow_axis));


row3=row0+$12; y3=row3<<3; // pc spawn row exit left
row4=row3+$02; y4=row4<<3;
data_spawn(rm+STR_PRXM,Myu_A,$1,  $1A<<3,y4); // Myu  1
data_spawn(rm+STR_PRXM,Myu_A,$1,  $22<<3,y4); // Myu  1
data_spawn(rm+STR_PRXM,Myu_A,$1,  $2A<<3,y4); // Myu  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $54<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $5A<<3,y4); // Bot  1


clm3=$70; clm4=clm3-$04; clm5=clm3-$01; // clm3: Elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '1D'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row0+$15);                                              // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$12,  '19'+'10'); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_01"+"_00",rm);









//   --------------------------  1B  --------------------------- 
//    
rm_num  = $1B;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'006', STR_ow_axis+hex_str(ow_axis));


clm3=$10; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$15; y3=row3<<3; // pc spawn row exit right
row4=row3-$02; y4=row4<<3;
row5=row3+$02; y5=row5<<3;
row6=row3+$01; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,LoDoA,$1,  $15<<3,y4); // Locked Door
data_spawn(rm+STR_PRXM,Bot_A,$1,  $2A<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $32<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,FokkA,$2,  $4A<<3,y3); // Fokka  2


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '17'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row0+$12); // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '1C'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_01",rm);








//   --------------------------  1C  --------------------------- 
//    
rm_num  = $1C;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'035', STR_ow_axis+hex_str(ow_axis));


clm3=$30; clms3=$10;
row3=row0+$14; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
_a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  (clm3+(clms3*_a++))<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  (clm3+(clms3*_a++))<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  (clm3+(clms3*_a++))<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($6C<<3)+4,(row0+$18)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clm3=$27; clms3=$10;
row5=row0+$04; y5=row5<<3;
_a=0;
data_spawn(rm+STR_PRIO,SpDrA,$1,  (clm3+(clms3*_a++))<<3,y5,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Drop spawner v1. Only spawns Drop
data_spawn(rm+STR_PRIO,SpDrA,$1,  (clm3+(clms3*_a++))<<3,y5); // Drop spawner v1. Only spawns Drop
data_spawn(rm+STR_PRIO,SpDrA,$1,  (clm3+(clms3*_a++))<<3,y5); // Drop spawner v1. Only spawns Drop
data_spawn(rm+STR_PRIO,SpDrA,$1,  (clm3+(clms3*_a++))<<3,y5,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Drop spawner v1. Only spawns Drop

clm3=$2F; clms3=$10;
row5=row0+$1A; y5=row5<<3;
_a=0;
data_spawn(rm+STR_PRXM,Bot_A,$1,  (clm3+(clms3*_a++))<<3,y5,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  (clm3+(clms3*_a++))<<3,y5,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  (clm3+(clms3*_a++))<<3,y5,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  (clm3+(clms3*_a++))<<3,y5,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Bot  1

_pi=global.PI_BGR1;
clm3=$2B; clm4=clm3; clms3=$10; clms4=$04;
row5=row0+$04; y5=row5<<3;
_a=0;
data_spawn(rm+STR_PRIO,TyellManager,$1,  $00<<3,$00<<3);
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms4*_a++))<<3,y5,  dk_PI+hex_str(_pi)); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms4*_a++))<<3,y5,  dk_PI+hex_str(_pi)); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms4*_a++))<<3,y5,  dk_PI+hex_str(_pi)); // Tyell v1: Vertical
clm4+=clms3;
_a=0;
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms4*_a++))<<3,y5,  dk_PI+hex_str(_pi),  STR_Qualified+STR_Quest+STR_Nums+"02"); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms4*_a++))<<3,y5,  dk_PI+hex_str(_pi),  STR_Qualified+STR_Quest+STR_Nums+"02"); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms4*_a++))<<3,y5,  dk_PI+hex_str(_pi),  STR_Qualified+STR_Quest+STR_Nums+"02"); // Tyell v1: Vertical
clm4+=clms3;
_a=0;
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms4*_a++))<<3,y5,  dk_PI+hex_str(_pi)); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms4*_a++))<<3,y5,  dk_PI+hex_str(_pi)); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms4*_a++))<<3,y5,  dk_PI+hex_str(_pi)); // Tyell v1: Vertical


clm3=$70; clm4=clm3-$04; clm5=clm3-$01; // clm3: Elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '1F'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row0+$15);                                              // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '1B'+EXR0_); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_01"+"_00",rm);








//   --------------------------  1D  --------------------------- 
//    
rm_num  = $1D;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'012', STR_ow_axis+hex_str(ow_axis));


clm3=$10; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$0B; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,LoDoA,$1,  $1B<<3,(row3-$02)<<3); // Locked Door
data_spawn(rm+STR_PRXM,FokuA,$1,  $240,y3); // Fokkeru  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $180,y5); // Bubble  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $300,y5); // Bubble  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '1A'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_,  clm3,row_e5);  // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '1E'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_01",rm);








//   --------------------------  1E  --------------------------- 
//    
rm_num  = $1E;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PG+'013', STR_ow_axis+hex_str(ow_axis));


row3=row0+$12; y3=row3<<3;
row4=row3+$02; y4=row4<<3;
row5=row0+$18; y5=row5<<3;
data_spawn(rm+STR_PRXM,BubbA,$2,  $18<<3,y5); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $2E<<3,y5); // Bubble  2
data_spawn(rm+STR_PRXM,Bot_A,$1,  $44<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $54<<3,y4); // Bot  1


clm3=$70; clm4=clm3-$04; clm5=clm3-$01; // clm3: Elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '21'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row0+$15);                                              // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '1D'+'10'); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_01"+"_00",rm);









//   --------------------------  1F  --------------------------- 
//    
rm_num  = $1F;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'058', STR_ow_axis+hex_str(ow_axis));


clm3=$10; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$05; y3=row3<<3;
row4=row0+$17; y4=row4<<3;
row5=row4+$01; y5=row5<<3;
row6=row0+$0E; y6=row6<<3;
row7=row0+$19; y7=row7<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($27<<3)+4,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($47<<3)+4,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,(row3+$01)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,AnerA,$3,  $20<<3,y7); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $40<<3,y7); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $60<<3,y7); // Aneru  3
data_spawn(rm+STR_PRXM,BubbA,$2,  $1F<<3,y6); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $2F<<3,y6); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $3F<<3,y6); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $4F<<3,y6); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $5F<<3,y6); // Bubble  2


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '1C'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row0+$15); // Elevator UP $80, 
clm3=$6A; clms3=$20-(clm3&$1F); clm4=clm3+(clms3>>1);
data_exit(EXU1,etA4,0,  $66,row_e0,  $1A,ROWS5,  $6C,row_e4,  '4E'+EXD0_); // UP  0, Pit up 
//data_exit(EXU1,etA4,0,  clm3,row_e0,  clms3,ROWS5,  clm4,row_e4,  '4E'+EXD0_); // UP  0, Pit up 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '20'+EXL0_); // RGT 0, 








//   --------------------------  20  --------------------------- 
//    
rm_num  = $20;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'009', STR_ow_axis+hex_str(ow_axis));


clm3=$70; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($2F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,FokkA,$2,  $30<<3,y3); // Fokka  2
data_spawn(rm+STR_PRXM,BubbA,$8,  $50<<3,(row0+$0B)<<3); // GiantBubble


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '22'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row_e5);  // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '1F'+EXR0_); // LFT 0, 


//data_rando_scene01("_00"+"_00"+"_01"+"_01"+"_00",rm);








//   --------------------------  21  --------------------------- 
//    
rm_num  = $21;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'011', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($1F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpStA,$2,  $2E<<3,(row0+$0F)<<3); // SpawnByStab  2


clm3=$70; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '1E'+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '28'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row_e5); // Elevator DW $40, UP $80, 


data_rando_scene01("_00"+"_00"+"_00"+"_01"+"_01",rm);








//   --------------------------  22  --------------------------- 
//    
rm_num  = $22;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'011', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($1F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpStA,$2,  $2E<<3,(row0+$0F)<<3); // SpawnByStab  2


clm3=$70; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '20'+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '2A'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row_e5); // Elevator DW $40, UP $80, 


data_rando_scene01("_00"+"_00"+"_00"+"_01"+"_01",rm);








//   --------------------------  23  --------------------------- 
//    
rm_num  = $23;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'006', STR_ow_axis+hex_str(ow_axis));


clm3=$10; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$15; y3=row3<<3; // pc spawn row exit right
row4=row3-$02; y4=row4<<3;
row5=row3+$02; y5=row5<<3;
row6=row3+$01; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpStA,$2,  $64<<3,(row0+$0D)<<3); // SpawnByStab  2
data_spawn(rm+STR_PRXM,AnerA,$3,  $06<<3,y3); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $1A<<3,y3); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $72<<3,y3); // Aneru  3
data_spawn(rm+STR_PRXM,BubbA,$1,  $2A<<3,y4); // Bubble  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $68<<3,y4); // Bubble  1


clm3=$10; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '18'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row0+$12); // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '24'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_01",rm, STR_GLOVE);








//   --------------------------  24  --------------------------- 
//    
rm_num  = $24;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'014', STR_ow_axis+hex_str(ow_axis));


clm6=$0F; x6=(clm6<<3)+4; _dist=$20<<3;
row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$09; y5=row5<<3;
clm6=$0F; x6=(clm6<<3)+4; _dist=$18<<3; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
/*
clm6=$0F; x6=(clm6<<3)+4; _dist=$20<<3;      _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
*/
data_spawn(rm+STR_PRXM,Ra__A,$3,  $36<<3,y5); // Ra  3
data_spawn(rm+STR_PRXM,Ra__A,$3,  $48<<3,y5); // Ra  3


//data_exit(EXU0,etA4,0,  $00,row_e0,  clms0,ROWS5,  $4F,YTOP,  '0B'+'40');   // UP  0, Pit up 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '23'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '25'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  25  --------------------------- 
//    
rm_num  = $25;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PG+'003', STR_ow_axis+hex_str(ow_axis));


row3=row0+$12; y3=row3<<3;
data_spawn(rm+STR_PRXM,BoBoA,$1,  $2E<<3,(row0+$08)<<3); // BossBot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '24'+'10'); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '26'+'20'); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  26  --------------------------- 
//    
rm_num  = $26;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'031', STR_ow_axis+hex_str(ow_axis));


clm6=$1F; x6=(clm6<<3)+4; _dist=$10<<3; _a=0;
row3=row0+$14; y3=row3<<3;
row4=row0+$15; y4=row4<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE

_ver=$1; // v1: Only spawn Drop
//_ver=$3; // v3: chance to spawn Flame instead of Drop
clm4=$17; clms4=$20; clms5=$10;
row5=row0+$04; y5=row5<<3;
//row5=row0+$0A; y5=row5<<3;
_a=0;
data_spawn(rm+STR_PRIO,SpDrA,_ver,  (clm4+(clms5*_a++))<<3,y5,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Drop spawner
data_spawn(rm+STR_PRIO,SpDrA,_ver,  (clm4+(clms5*_a++))<<3,y5); // Drop spawner
data_spawn(rm+STR_PRIO,SpDrA,_ver,  (clm4+(clms5*_a++))<<3,y5,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Drop spawner
data_spawn(rm+STR_PRIO,SpDrA,_ver,  (clm4+(clms5*_a++))<<3,y5); // Drop spawner
data_spawn(rm+STR_PRIO,SpDrA,_ver,  (clm4+(clms5*_a++))<<3,y5,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Drop spawner
data_spawn(rm+STR_PRIO,SpDrA,_ver,  (clm4+(clms5*_a++))<<3,y5); // Drop spawner

clm3=$17; clms5=$10;
row6=row0+$1A; y6=row6<<3;
_a=0;
data_spawn(rm+STR_PRXM,Bot_A,$1,  (clm3+(clms5*_a++))<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  (clm3+(clms5*_a++))<<3,y6,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  (clm3+(clms5*_a++))<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  (clm3+(clms5*_a++))<<3,y6,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  (clm3+(clms5*_a++))<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  (clm3+(clms5*_a++))<<3,y6,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Bot  1

_pi=global.PI_BGR1;
clm3=$1B; clm4=clm3; clms3=$04; clms4=$10;
_a=0;
data_spawn(rm+STR_PRIO,TyellManager,$1,  $00<<3,$00<<3);
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms3*_a++))<<3,y5,  dk_PI+hex_str(_pi),  STR_Qualified+STR_Quest+STR_Nums+"02"); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms3*_a++))<<3,y5,  dk_PI+hex_str(_pi),  STR_Qualified+STR_Quest+STR_Nums+"02"); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms3*_a++))<<3,y5,  dk_PI+hex_str(_pi),  STR_Qualified+STR_Quest+STR_Nums+"02"); // Tyell v1: Vertical
clm4+=clms4;
_a=0;
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms3*_a++))<<3,y5,  dk_PI+hex_str(_pi)); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms3*_a++))<<3,y5,  dk_PI+hex_str(_pi)); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms3*_a++))<<3,y5,  dk_PI+hex_str(_pi)); // Tyell v1: Vertical
clm4+=clms4;
_a=0;
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms3*_a++))<<3,y5,  dk_PI+hex_str(_pi),  STR_Qualified+STR_Quest+STR_Nums+"02"); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms3*_a++))<<3,y5,  dk_PI+hex_str(_pi),  STR_Qualified+STR_Quest+STR_Nums+"02"); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms3*_a++))<<3,y5,  dk_PI+hex_str(_pi),  STR_Qualified+STR_Quest+STR_Nums+"02"); // Tyell v1: Vertical
clm4+=clms4;
_a=0;
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms3*_a++))<<3,y5,  dk_PI+hex_str(_pi)); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms3*_a++))<<3,y5,  dk_PI+hex_str(_pi)); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms3*_a++))<<3,y5,  dk_PI+hex_str(_pi)); // Tyell v1: Vertical
clm4+=clms4;
_a=0;
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms3*_a++))<<3,y5,  dk_PI+hex_str(_pi),  STR_Qualified+STR_Quest+STR_Nums+"02"); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms3*_a++))<<3,y5,  dk_PI+hex_str(_pi),  STR_Qualified+STR_Quest+STR_Nums+"02"); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm4+(clms3*_a++))<<3,y5,  dk_PI+hex_str(_pi),  STR_Qualified+STR_Quest+STR_Nums+"02"); // Tyell v1: Vertical

data_spawn(rm+STR_PRIO,Tyell,$1,  $13<<3<<3,y5,  dk_PI+hex_str(_pi)); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  $6B<<3<<3,y5,  dk_PI+hex_str(_pi)); // Tyell v1: Vertical


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '25'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '27'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  27  --------------------------- 
//    
rm_num  = $27;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PG+'013', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row0+$09; y4=row4<<3;
data_spawn(rm+STR_PRXM,Ra__A,$3,  $1B0,y4); // $A9: Ra  3
data_spawn(rm+STR_PRXM,Ra__A,$3,  $240,y4); // $A9: Ra  3
data_spawn(rm+STR_PRXM,Bot_A,$1,  $220,$A0); // $8E: Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $2A0,$A0); // $8E: Bot  1


clm3=$70; clm4=clm3-$04; clm5=clm3-$01; // clm3: Elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '2B'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row0+$15);                                              // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$12,  '26'+'10'); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_01"+"_00",rm);









//   --------------------------  28  --------------------------- 
//    
rm_num  = $28;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'012', STR_ow_axis+hex_str(ow_axis));


clm3=$10; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$09; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Ra__A,$3,  $1B0,y5); // Ra  3
data_spawn(rm+STR_PRXM,Ra__A,$3,  $240,y5); // Ra  3
data_spawn(rm+STR_PRXM,Myu_A,$1,  $1A0,y3); // Myu  1
data_spawn(rm+STR_PRXM,Myu_A,$1,  $1E0,y3); // Myu  1
data_spawn(rm+STR_PRXM,Myu_A,$1,  $220,y3); // Myu  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '21'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_,  clm3,row_e5);  // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '29'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_01",rm);








//   --------------------------  29  --------------------------- 
//    
rm_num  = $29;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'015', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$0F; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($1F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($2F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($6D<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,FokkA,$1,  $10<<3,(row0+$0D)<<3); // Fokka  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $1A<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $2C<<3,y5); // Bot  1


data_exit(EXD0,etA1,1,  $00,row_e2,  clms0,ROWS5,  $4F,row_e3,  '2D'+EXU0_); // DWN 0, Pit down 
data_pit(exit_name_d0,0,2);
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '28'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '2A'+EXL0_); // RGT 0, 


x3=$68<<3;
data_spawn(rm+STR_PRIO,ItmG0,$1,  x3,y3,  STR_Treasure+STR_Map+"02",STR_Qualified+STR_Quest+STR_Nums+"01"); // Extra Life Doll 
data_spawn(rm+STR_PRIO,ItmF0,$A,  x3,y3,  STR_Qualified+STR_Quest+STR_Nums+"02"); // PBag $A: 1000
data_spawn(rm+STR_PRIO,ItmF0,$A,  $5A<<3,(row0+$0D)<<3); // PBag $A: 1000








//   --------------------------  2A  --------------------------- 
//    
rm_num  = $2A;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PG+'016', STR_ow_axis+hex_str(ow_axis));


clm3=$50; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$17; y3=row3<<3;
row4=row0+$10; y4=row4<<3;
row6=row3+$01; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,ReFaA,$1,  $78<<3,(row0+$16)<<3); // RestoreFairy  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $0E<<3,(row0+$12)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $16<<3,(row0+$12)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $24<<3,(row0+$12)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $2E<<3,(row0+$14)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $3E<<3,(row0+$16)<<3); // Bot  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '22'+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '2E'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row_e5);                                          // Elevator DW $40, UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row4,  '29'+'10'); // LFT 0,  


data_rando_scene01("_00"+"_00"+"_01"+"_01"+"_01",rm);









//   --------------------------  2B  --------------------------- 
//    
rm_num  = $2B;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'002', STR_ow_axis+hex_str(ow_axis));
//set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'040', STR_ow_axis+hex_str(ow_axis));


clm3=$50; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$17; y3=row3<<3;
row4=row0+$0F; y4=row4<<3;
row5=row0+$13; y5=row5<<3;
row6=row3+$01; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,FokuA,$1,  $1A<<3,(row0+$11)<<3); // Fokkeru  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '27'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_,  clm3,row_e5);  // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row4,  '50'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row5,  '39'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_01",rm);








//   --------------------------  2C  --------------------------- 
//    
rm_num  = $2C;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PG+'028', STR_ow_axis+hex_str(ow_axis));


row3=row0+$15; y3=row3<<3;
row4=row0+$07; y4=row4<<3;
data_spawn(rm+STR_PRIO,LoDoA,$1,  $0E<<3,(row3-$02)<<3); // Locked Door
data_spawn(rm+STR_PRIO,SpStA,$2,  $16<<3,(row0+$07)<<3); // SpawnByStab  2


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '39'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '2D'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  2D  --------------------------- 
//    
rm_num  = $2D;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'018', STR_ow_axis+hex_str(ow_axis));


clm6=$17; x6=(clm6<<3)+4; _dist=$10<<3; _a=0;
row3=row0+$0D; y3=row3<<3;
row4=row0+$17; y4=row4<<3;
row5=row3+$01; y5=row5<<3;
row6=row3+$02; y6=row6<<3;
row7=row4+$02; y7=row7<<3;
row8=row0+$09; y8=row8<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,(row4+$01)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Ra__A,$3,  $36<<3,y8); // Ra  3
data_spawn(rm+STR_PRXM,Ra__A,$3,  $48<<3,y8); // Ra  3
data_spawn(rm+STR_PRXM,Myu_A,$1,  $28<<3,y6); // Myu  1
data_spawn(rm+STR_PRXM,Myu_A,$1,  $40<<3,y6); // Myu  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $18<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $30<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $2B<<3,y7); // Bot  1. Meant to indicate there's a false floor by falling through it.


clm3  = $20;
clms3 = $10;
clm4  = $40;
clms4 = $10;
clm5  = $40;
clms5 = $20;
clm6  = clm5+(clms5>>1)-1;
rows3 = $10;
data_exit(EXU0,etA4,0,  $40,row_e0,  $20,rows3,  $4F,row_e4,  '29'+EXD0_); // UP  0, Pit up 
//data_exit(EXU0,etA4,0,  $40,row_e0,  $20,rows3,  clm6,row_e4,  '29'+EXD0_); // UP  0, Pit up 
data_exit(EXD0,etA1,1,  clm3,row_e2,  clms3,rows3,  clm3+$07,row_e3,  '0B'+EXU0_); // DWN 0, Pit down 
data_exit(EXD1,etA1,1,  clm4,row_e2,  clms4,rows3,  clm4+$09,row_e3,  '30'+EXU0_); // DWN 1, Pit down 
data_pit(exit_name_d1, 0,2);
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '2C'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '2E'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmF0,$A,  ($2E<<3)-3,y7); // PBag $A: 1000
data_spawn(rm+STR_PRIO,ItmF0,$A,  ($35<<3)-3,y7); // PBag $A: 1000








//   --------------------------  2E  --------------------------- 
//    
rm_num  = $2E;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'002', STR_ow_axis+hex_str(ow_axis));


clm3=$50; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$17; y3=row3<<3;
row4=row0+$0F; y4=row4<<3;
row5=row0+$13; y5=row5<<3;
row6=row3+$01; y6=row6<<3;
row7=row0+$09; y7=row7<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$2,  $37<<3,y7); // Drop spawner v2. Drops Flame1
data_spawn(rm+STR_PRIO,SpDrA,$2,  $67<<3,y7); // Drop spawner v2. Drops Flame1
data_spawn(rm+STR_PRXM,FokuA,$1,  $1A<<3,(row0+$11)<<3); // Fokkeru  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $22<<3,(row0+$15)<<3); // Bot  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '2A'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_,  clm3,row_e5);  // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row4,  '2D'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row5,  '2F'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_01",rm);








//   --------------------------  2F  --------------------------- 
//    
rm_num  = $2F;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'004', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3; // pc spawn row exit left, 
row4=row3+$01; y4=row4<<3;
row5=row0+$09; y5=row5<<3;
row6=row5+$01; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($07<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($67<<3)+4,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,FokkA,$2,  $36<<3,(row0+$13)<<3); // Fokka  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $76<<3,(row0+$0B)<<3); // Bubble  2


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '2E'+EXR0_); // LFT 0, 


data_spawn(rm+STR_PRIO,ItmF0,$A,  $78<<3,(row0+$0B)<<3); // PBag $A: 1000


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm, STR_JUMP);








//   --------------------------  30  --------------------------- 
//    
rm_num  = $30;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'019', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($3D<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($61<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,BoBoA,$1,  $6E<<3,(row0+$0B)<<3); // BossBot  1


data_exit(EXU0,etA4,0,  $44,row_e0,  $18,ROWS5,  $4F,row_e4,  '2D'+EXD1_); // UP  0, Pit up 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '31'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmF0,$A,  $34<<3,(row0+$0B)<<3); // PBag $A: 1000


//data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_01"+STR_Pit+"8",rm, STR_GLOVE);








//   --------------------------  31  --------------------------- 
//    
rm_num  = $31;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PG+'020', STR_ow_axis+hex_str(ow_axis));


row3=row0+$0C; y3=row3<<3;
row4=row0+$16; y4=row4<<3;
row5=row0+$0E; y5=row5<<3;
data_spawn(rm+STR_PRXM,BubbA,$2,  $18<<3,y4); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $66<<3,y4); // Bubble  2
data_spawn(rm+STR_PRXM,Myu_A,$1,  $38<<3,y5); // Myu  1
data_spawn(rm+STR_PRXM,Myu_A,$1,  $42<<3,y5); // Myu  1


clm4  = -PAGE_CLMS;
_exit=data_exit(EXD0,etA1,1,  clm4,row_e2,  clms1,ROWS5,  $4D,row_e3,  '34'+'80');   // DWN 0, Pit down  
data_pit(_exit, 0,2);
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '30'+'10'); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '32'+'20'); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_00"+STR_Pit+"4",rm);









//   --------------------------  32  --------------------------- 
//    
rm_num  = $32;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PG+'003', STR_ow_axis+hex_str(ow_axis));


row3=row0+$12; y3=row3<<3;
data_spawn(rm+STR_PRIO,SpBaA,$1,  0,0); // BagoSpawner  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '31'+'10'); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '33'+'20'); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);









//   --------------------------  33  --------------------------- 
//    
rm_num  = $33;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'004', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3; // pc spawn row exit left, 
row4=row3+$01; y4=row4<<3;
row5=row0+$09; y5=row5<<3;
row6=row5+$01; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($07<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($67<<3)+4,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,BubbA,$8,  $3E<<3,(row0+$0D)<<3); // GiantBubble
data_spawn(rm+STR_PRXM,BubbA,$8,  $46<<3,(row0+$11)<<3); // GiantBubble
data_spawn(rm+STR_PRIO,ReFaA,$1,  $78<<3,(row0+$07)<<3); // RestoreFairy  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '32'+EXR0_); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);








//   --------------------------  34  --------------------------- 
//    
rm_num  = $34;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'067', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($3D<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($61<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpStA,$2,  $0E<<3,y3); // SpawnByStab  2
data_spawn(rm+STR_PRIO,SpStA,$2,  $2E<<3,y3); // SpawnByStab  2


data_exit(EXU0,etA4,0,  $44,row_e0,  $18,ROWS5,  $4F,row_e4,  '31'+EXD0_); // UP  0, Pit up 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '59'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '35'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_01"+STR_Pit+"8",rm, STR_GLOVE);








//   --------------------------  35  --------------------------- 
//   ---------------------  THUNDERBIRD  ----------------------- 
rm_num  = $35;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'021', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row3+$02; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($25<<3)+4,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($39<<3)+4,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
clm3=$5F; x3=(clm3<<3)+4; clms3=$08;          _a=0;
//clm3=$57; x3=(clm3<<3)+4; clms3=$08;          _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+((clms3*_a++)<<3),y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+((clms3*_a++)<<3),y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+((clms3*_a++)<<3),y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+((clms3*_a++)<<3),y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
clm3=$30; // clm3: arena center clm
data_spawn(rm+STR_PRXM,ThunA,$1,  (clm3+$12)<<3,(row0+$0D)<<3,  STR_Arena+'_x'+hex_str(clm3<<3)); // Thunderbird  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '34'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '36'+EXL0_); // RGT 0, 








//   --------------------------  36  --------------------------- 
//   ---------------------  SHADOW BOSS  ----------------------- 
rm_num  = $36;
_file=area_PG+'064'; // bricks in HUD so HUD has black bg instead of purple
//_file=area_PG+'026';
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+_file, STR_ow_axis+hex_str(ow_axis));


x3=(($2<<8)>>3)<<3; // arena_x (arena center)
row3=row0+$16; y3=row3<<3;
row4=row3+$02; y4=row4<<3;
/*
_dist=$07<<3;
clm6=$05; x6=clm6<<3; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
clm6=$5E; x6=clm6<<3; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
*/
data_spawn(rm+STR_PRIO,NPC_A,$1,  $5B<<3,(row0+$0C)<<3,  STR_Dialogue+DK0911); // Triforce Keeper
data_spawn(rm+STR_PRXM,ShLiA,$1,  $48<<3,y3,  STR_Arena+'_x'+hex_str(x3)); // ShadowBoss  1
g.dm_rm[?STR_Boss+STR_Scene+STR_Name+_DUNGEON_NAME] = rm;


clm3=(x3>>3)-1;
_exit=data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3,row3,  EXIT_NAME_GAME_START); // MID 0, 
g.dm_rm[?_exit+STR_Rando+"_Safe"] = true; // Don't let rando change where this goes to
//STR_Game+"_Clear"

_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '35'+EXR0_); // LFT 0, 
g.dm_rm[?_DUNGEON_NAME+STR_Boss+STR_Scene+STR_Entrance+STR_Exit] = _exit;

_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  area_EA+"C0"+EXL0_); // RGT 0, 
g.dm_rm[?STR_Boss+STR_Dungeon+STR_Exit+STR_Name+_DUNGEON_NAME] = _exit;
//g.dm_rm[?_DUNGEON_NAME+STR_Boss+STR_Dungeon+STR_Exit] = _exit;


data_spawn_cutscene(Cutscene_ShadowBoss_1,1, 0,0); // Pre-fight.


// Because the scene is 2 sections tall but only to fill the HUD area with bricks.
_a=0;    _datakey=MAP_DATAKEY1+rm+STR_Page;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B1;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_D0;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_D0;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B1;








//   --------------------------  37  --------------------------- 
//    


//   --------------------------  38  --------------------------- 
//    


//   --------------------------  39  --------------------------- 
//    
rm_num  = $39;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PG+'025', STR_ow_axis+hex_str(ow_axis));


row3=row0+$15; y3=row3<<3;
row4=row3-$02; y4=row4<<3;
row5=row3+$02; y5=row5<<3;
//data_spawn(rm+STR_PRIO,LoDoA,$1,  $15<<3,(row3-$02)<<3); // Locked Door
data_spawn(rm+STR_PRXM,AnerA,$3,  $2A<<3,y4); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $2E<<3,y5); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $32<<3,y3); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $60<<3,y3); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $64<<3,y5); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $68<<3,y4); // Aneru  3


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '2B'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '2C'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_GLOVE);










//   --------------------------  3A  --------------------------- 
//    
rm_num  = $3A;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'029', STR_ow_axis+hex_str(ow_axis));


clm3=$44; // clm3: arena center clm
row3=row0+$15; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($67<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($77<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,GoomA,$2,  (clm3-$12)<<3,y3,  STR_Arena+'_x'+hex_str(clm3<<3)); // Gooma 2 (max: hp, atk, xp)
//data_spawn(rm+STR_PRIO,ReboB,$2,  x3,(row0+$16)<<3,  x4); // Black Knight
//data_spawn(rm+STR_PRIO,HelmA,$2,  x3,y2,  STR_Arena+'_x'+hex_str(x4)); // Helmethead  2


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '54'+EXL0_); // RGT 0, 


set_rm_data_1a(rm_name, area_PG+'065', 2); // 065: 2nd Quest. Spikes on floor


data_spawn(rm+STR_PRIO,ItmK6,$1,  ($0E<<3)+4,y3); // Skeleton Key ALLKEY






//   --------------------------  3B  --------------------------- 
//    
rm_num  = $3B;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PG+'032', STR_ow_axis+hex_str(ow_axis));


data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1',  $0000,  3,StarSky_1_init);
row3=row0+$17; y3=row3<<3;
row4=row0+$02; y4=row4<<3;
data_spawn(rm+STR_PRXM,Bot_A,$1,  $28<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$2,  $30<<3,y4); // Bot  2
data_spawn(rm+STR_PRXM,Bot_A,$1,  $3C<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$2,  $40<<3,y4); // Bot  2
data_spawn(rm+STR_PRXM,Bot_A,$1,  $4A<<3,y4); // Bot  1


clm3=$30; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '02'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row0+$10, "04");    // Elevator DW $40, 
row3    = -PAGE_ROWS;
row4    = row0+$07;
row5    = row4-$06;
row6    = row0+$13;
rows3   = row4-row3;
rows4   = (rows0-row4) + PAGE_ROWS;
data_exit(EXL0,etA0,1,  CLM2,row3,  CLMS2,rows3,  CLM3,row5,  '00'+EXR0_); // LFT 0, 
data_exit(EXL1,etA0,1,  CLM2,row4,  CLMS2,rows4,  CLM3,row6,  '00'+EXR1_); // LFT 1, 

data_exit(EXR0,etA0,1,  clm2,row3,  CLMS2,rows3,  clmA,row5,  '3C'+EXL0_); // RGT 0, 
data_exit(EXR1,etA0,1,  clm2,row4,  CLMS2,rows4,  clmA,row6,  '3C'+EXL1_); // RGT 1, 








//   --------------------------  3C  --------------------------- 
//    Right Entrance (Upper)
rm_num  = $3C;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PG+'010', STR_ow_axis+hex_str(ow_axis));


data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1',  $0000,  3,StarSky_1_init);

row3=row0+$17; y3=row3<<3;
row4=row0+$03; y4=row4<<3;
data_spawn(rm+STR_PRIO,SpStA,$2,  $10<<3,(row0+$11)<<3); // SpawnByStab  2
data_spawn(rm+STR_PRXM,Bot_A,$1,  $0C<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$2,  $10<<3,y4); // Bot  2
data_spawn(rm+STR_PRXM,Bot_A,$1,  $1A<<3,y4); // Bot  1


row4    = row0+$07;
row5    = row4-$06;
row6    = row0+$13;
rows3   = row4-ROW0;
rows4   = (rows0-row4) + PAGE_ROWS;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows3,  CLM3,row5,  '3B'+EXR0_); // LFT 0, 
data_exit(EXL1,etA0,1,  CLM2,row4,  CLMS2,rows4,  CLM3,row6,  '3B'+EXR1_); // LFT 1, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_spawn(rm+STR_PRIO,ItmF0,$A,  $24<<3,(row0+$13)<<3); // PBag $A: 1000


// $6: Moving '02'_LFT or '04'_DWN
//dm_overworld[?hex_str(g.OWRC_DNGN_GRET1)+'02'+STR_Exit] = exit_name_r0; // EXR0, RGT 0
//dm_overworld[?hex_str(g.OWRC_DNGN_GRET1)+'04'+STR_Exit] = exit_name_r0; // EXR0, RGT 0
//global.OVERWORLD.dm[?hex_str(g.OWRC_DNGN_GRET1)+'02'+STR_Exit] = exit_name_r0; // EXR0, RGT 0
//global.OVERWORLD.dm[?hex_str(g.OWRC_DNGN_GRET1)+'04'+STR_Exit] = exit_name_r0; // EXR0, RGT 0








//   --------------------------  3C  --------------------------- 
//    
rm_num  = $3C;








//   ===================================================================================
//   --------------------------  3D  --------------------------- 
//    
rm_num  = $3D;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'041', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$0E; y5=row5<<3;
row6=row0+$19; y6=row6<<3;
clm6=$0F; x6=(clm6<<3)+4; _dist=$10<<3; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,LoDoA,$1,  $67<<3,(row3-$02)<<3); // Locked Door
//data_spawn(rm+STR_PRIO,LoDoA,$1,  $67<<3,(row0+$18)<<3); // Locked Door
data_spawn(rm+STR_PRXM,AnerA,$3,  $20<<3,y6); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $40<<3,y6); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $60<<3,y6); // Aneru  3
data_spawn(rm+STR_PRXM,BubbA,$2,  $1F<<3,y5); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $2F<<3,y5,  STR_Direction+hex_str($2|$8)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $3F<<3,y5,  STR_Direction+hex_str($1|$8)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $4F<<3,y5); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $5F<<3,y5,  STR_Direction+hex_str($2|$8)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $6F<<3,y5,  STR_Direction+hex_str($1|$8)); // Bubble  2


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0D'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '3E'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  3E  --------------------------- 
//    
rm_num  = $3E;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'042', STR_ow_axis+hex_str(ow_axis));


clm3=$70; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row7=row3+$02; y7=row7<<3;
clm6=$0F; x6=(clm6<<3)+4; _dist=$18<<3; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bot_A,$1,  $10<<3,y7); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $1C<<3,y7); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $28<<3,y7); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $34<<3,y7); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $40<<3,y7); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $4C<<3,y7); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $58<<3,y7); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $64<<3,y7); // Bot  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '41'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$14); // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '3D'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '3F'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_00",rm);








//   --------------------------  3F  --------------------------- 
//    
rm_num  = $3F;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'043', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$0E; y5=row5<<3;
clm6=$13; x6=(clm6<<3)+4; _dist=$16<<3; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Moa_B,$1,  $23<<3,y5); // FieryMoa  1
data_spawn(rm+STR_PRXM,Moa_B,$1,  $5B<<3,y5); // FieryMoa  1
data_spawn(rm+STR_PRXM,FokkA,$2,  $4A<<3,(row0+$11)<<3); // Fokka  2


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '3E'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '40'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  40  --------------------------- 
//    
rm_num  = $40;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'044', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$10; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $16<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,BubbA,$2,  $27<<3,(row0+$15)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $49<<3,(row0+$13)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $6E<<3,(row0+$00)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  2
clm3=$1F; clms3=$10; _x3=(clm3<<3)+4; _a=0;
data_spawn(rm+STR_PRXM,BlazA,$1,  _x3+((clms3*_a++)<<3),y5);
data_spawn(rm+STR_PRXM,BlazA,$1,  _x3+((clms3*_a++)<<3),y5);
data_spawn(rm+STR_PRXM,BlazA,$1,  _x3+((clms3*_a++)<<3),y5);
data_spawn(rm+STR_PRXM,BlazA,$1,  _x3+((clms3*_a++)<<3),y5);
data_spawn(rm+STR_PRXM,BlazA,$1,  _x3+((clms3*_a++)<<3),y5);
data_spawn(rm+STR_PRIO,ItmE0,$1,  ($70<<3)+4,(row0+$0C)<<3); // Magic Jar v1(Full)
/*
row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $16<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  ($6B<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE


y3  =(row0+$15)<<3;
data_spawn(rm+STR_PRXM,BubbA,$2,  $27<<3,(row0+$15)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $49<<3,(row0+$13)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $6E<<3,(row0+$00)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  2
y4    =(row0+$00)<<3;
y5    =(row0+$02)<<3;
clm3  = $1C;
clms3 = $08;
clms4 = clms3+$08;
clms5 = clms3>>1;  _a=0;
//data_spawn(rm+STR_PRIO,Spawner_FallingBlock,$2,  (clm3+(clms4*_a++))<<3,y4,  STR_Clms+hex_str(clms5)); // BlockSpawner  2
//data_spawn(rm+STR_PRIO,Spawner_FallingBlock,$2,  (clm3+(clms4*_a++))<<3,y4,  STR_Clms+hex_str(clms5)); // BlockSpawner  2
//data_spawn(rm+STR_PRIO,Spawner_FallingBlock,$2,  (clm3+(clms4*_a++))<<3,y4,  STR_Clms+hex_str(clms5)); // BlockSpawner  2
//data_spawn(rm+STR_PRIO,Spawner_FallingBlock,$2,  (clm3+(clms4*_a++))<<3,y4,  STR_Clms+hex_str(clms5)); // BlockSpawner  2
//data_spawn(rm+STR_PRIO,Spawner_FallingBlock,$2,  (clm3+(clms4*_a++))<<3,y4,  STR_Clms+hex_str(clms5)); // BlockSpawner  2
clm3=$27; clms3=$10; y4=(row0+$00)<<3; x3=$72<<3; _a=0;
//data_spawn(rm+STR_PRIO,SpDrA,$2,  (clm3+(clms3*_a++))<<3,y5); // Drop spawner v2. Drops Flame1
//data_spawn(rm+STR_PRIO,SpDrA,$2,  (clm3+(clms3*_a++))<<3,y5); // Drop spawner v2. Drops Flame1
//data_spawn(rm+STR_PRIO,SpDrA,$2,  (clm3+(clms3*_a++))<<3,y5); // Drop spawner v2. Drops Flame1
//data_spawn(rm+STR_PRIO,SpDrA,$2,  (clm3+(clms3*_a++))<<3,y5); // Drop spawner v2. Drops Flame1
//data_spawn(rm+STR_PRIO,SpDrA,$2,  x3-($04<<3),y5); // Drop spawner v2. Drops Flame1
//data_spawn(rm+STR_PRXM,Snaraa,$1,  x3,(row0+$0D)<<3,  dk_PI+hex_str(_pi)); // Snaraa
//data_spawn(rm+STR_PRXM,Snaraa,$1,  x3,(row0+$17)<<3,  dk_PI+hex_str(_pi)); // Snaraa
y3  =(row0+$18)<<3;
*/


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$16,  '3F'+EXR0_); // LFT 0, 


_a=$00;  _datakey=MAP_DATAKEY1+rm+STR_Page;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B1;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_D0;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_D0;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B0;


data_spawn(rm+STR_PRIO,ItmE0,$1,  ($70<<3)+4,(row3+$01)<<3); // Magic Jar v1(Full)
//data_spawn(rm+STR_PRIO,ItmE0,$1,  ($6A<<3)+4,(row0+$0C)<<3); // Magic Jar v1(Full)


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);







//   --------------------------  41  --------------------------- 
//    
rm_num  = $41;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'045', STR_ow_axis+hex_str(ow_axis));


clm3=$30; x3=clm3<<3; // clm3: elevator center clm
clm7=$50; x7=clm7<<3; // clm7: elevator center clm
row3=row0+$17; y3=row3<<3;
row4=row0+$11; y4=row4<<3;
row5=row0+$10; y5=row5<<3;
row6=row3+$01; y6=row6<<3;
row7=row0+$15; y7=row7<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x7-DIST2,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x7+DIST3,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpBuA,$1,  $04<<3,y4); // BulletSpawner  1
data_spawn(rm+STR_PRIO,SpBuA,$2,  $26<<3,y4); // BulletSpawner  2
data_spawn(rm+STR_PRIO,SpBuA,$1,  $58<<3,y4); // BulletSpawner  1
data_spawn(rm+STR_PRIO,SpBuA,$2,  $7A<<3,y4); // BulletSpawner  2
data_spawn(rm+STR_PRXM,AttaA,$1,  $15<<3,y5); // Atta  1
data_spawn(rm+STR_PRXM,AttaA,$1,  $69<<3,y5); // Atta  1
data_spawn(rm+STR_PRXM,WosuA,$1,  $3F<<3,y3); // Wosu  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '43'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row7);    // Elevator DW $40, 
clm4=clm7-$04; clm5=clm7-$01; // clm7: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '3E'+EXD0_); // UP  0, Elevator up 
data_Elev(EXU0_, clm7,row7);    // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '42'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_00"+"_01"+"_01",rm);








//   --------------------------  42  --------------------------- 
//    
rm_num  = $42;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'004', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3; // pc spawn row exit left, 
row4=row3+$01; y4=row4<<3;
row5=row0+$09; y5=row5<<3;
row6=row5+$01; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($07<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($67<<3)+4,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,FokuA,$1,  $36<<3,(row0+$13)<<3); // Fokkeru  1
data_spawn(rm+STR_PRXM,BubbA,$2,  $76<<3,(row0+$0B)<<3); // Bubble  2


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '41'+EXR0_); // LFT 0, 


data_spawn(rm+STR_PRIO,ItmF0,$A,  $78<<3,(row0+$0B)<<3); // PBag $A: 1000


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm, STR_JUMP);








//   --------------------------  43  --------------------------- 
//    
rm_num  = $43;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'046', STR_ow_axis+hex_str(ow_axis));


clm3=$50; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$16; y3=row3<<3;
row4=row0+$10; y4=row4<<3;
row5=row0+$0C; y5=row5<<3;
row6=row3+$01; y6=row6<<3;
row7=row0+$12; y7=row7<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE

clm6=$0D; clms6=$08
y8=(row7+$04)<<3;   _a=0;
data_spawn(rm+STR_PRXM,Bot_A,$1,  (clm6+(clms6*_a++))<<3,(row7+$00)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  (clm6+(clms6*_a++))<<3,(row7+$00)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  (clm6+(clms6*_a++))<<3,(row7+$00)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  (clm6+(clms6*_a++))<<3,(row7+$00)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  (clm6+(clms6*_a++))<<3,(row7+$02)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  (clm6+(clms6*_a++))<<3,(row7+$02)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  (clm6+(clms6*_a++))<<3,(row7+$04)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $5E<<3,y8); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $6A<<3,y8); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $74<<3,y8); // Bot  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '41'+EXD0_); // UP  0, Elevator up 
data_Elev(EXU0_, clm3,row0+$14);    // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row4,  '44'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row5,  '45'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_01",rm);








//   --------------------------  44  --------------------------- 
//    
rm_num  = $44;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'047', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
clm6=$0F; x6=(clm6<<3)+4; _dist=$1C<<3; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($77<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,BubbA,$22,  $6B<<3,(row0+$0F)<<3,  STR_Direction+hex_str($4)); // v$20: Bubble-cling
data_spawn(rm+STR_PRXM,BubbA,$22,  $76<<3,(row0+$09)<<3,  STR_Direction+hex_str($2)); // v$20: Bubble-cling
data_spawn(rm+STR_PRXM,BubbA,$2,  $20<<3,(row0+$0B)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $4E<<3,(row0+$0B)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,FokkA,$2,  $54<<3,(row0+$11)<<3); // Fokka  2
data_spawn(rm+STR_PRXM,WosuA,$1,  $18<<3,y3); // Wosu  1
data_spawn(rm+STR_PRXM,WosuA,$1,  $26<<3,y3); // Wosu  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '12'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '43'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  45  --------------------------- 
//    
rm_num  = $45;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'048', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
clm6=$0F; x6=(clm6<<3)+4; _dist=$18<<3; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,SpDrA,$1,  $6E<<3,(row0+$09)<<3); // DropSpawner  1
data_spawn(rm+STR_PRXM,Myu_A,$1,  $26<<3,y3); // Myu  1
data_spawn(rm+STR_PRXM,Myu_A,$1,  $42<<3,y3); // Myu  1
data_spawn(rm+STR_PRXM,AnerA,$3,  $18<<3,y3); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $30<<3,y3); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $48<<3,y3); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $60<<3,y3); // Aneru  3


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '43'+EXR0_); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);








//   --------------------------  46  --------------------------- 
//    
rm_num  = $46;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PG+'050', STR_ow_axis+hex_str(ow_axis));


row3=row0+$08; y3=row3<<3;
row4=row0+$0E; y4=row4<<3;
row5=row0+$0C; y5=row5<<3;
data_spawn(rm+STR_PRIO,BlazA,$1,  ($16<<3)+4,(row0+$0C)<<3); // Blaze  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $30<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $3B<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $4A<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $53<<3,y5); // Bot  1


clm3=$10; // Elevator center clm
data_exit(EXD0,etC0,1,  clm3-$04,row_e2,  CLMS4,ROWS5,  clm3-$01,row_e3,  '49'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$13);                                                       // Elevator DW $40, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '47'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_00"+"_01"+"_00",rm);








//   --------------------------  47  --------------------------- 
//    
rm_num  = $47;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PG+'003', STR_ow_axis+hex_str(ow_axis));


row3=row0+$12; y3=row3<<3;
data_spawn(rm+STR_PRIO,SpBaA,$1,  $00<<3,(row0+$08)<<3); // BagoSpawner  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '46'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '48'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  48  --------------------------- 
//    
rm_num  = $48;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'051', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$11; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $37<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpBuA,$1,  $14<<3,y5); // BulletSpawner  1
data_spawn(rm+STR_PRIO,SpBuA,$2,  $2A<<3,y5); // BulletSpawner  2
data_spawn(rm+STR_PRXM,StalA,$2,  $1E<<3,(row0+$0B)<<3); // Stalfos  2


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '47'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '12'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_GLOVE);








//   --------------------------  49  --------------------------- 
//    
rm_num  = $49;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'052', STR_ow_axis+hex_str(ow_axis));


clm3=$30; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$17; y3=row3<<3;
row4=row0+$09; y4=row4<<3;
row6=row3+$01; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3-DIST2,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3+DIST3,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($69<<3)+4,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,MagnA,$2,  $23<<3,y4); // Magnot 2
data_spawn(rm+STR_PRIO,MagnA,$2,  $3B<<3,y4); // Magnot 2
data_spawn(rm+STR_PRIO,MagnA,$2,  $4B<<3,y4); // Magnot 2
data_spawn(rm+STR_PRIO,MagnA,$2,  $5D<<3,y4); // Magnot 2
data_spawn(rm+STR_PRIO,MagnA,$2,  $75<<3,y4); // Magnot 2
data_spawn(rm+STR_PRXM,BoBoA,$1,  $0C<<3,y4); // BossBot  1
data_spawn(rm+STR_PRXM,FokuA,$1,  $53<<3,y3); // Fokkeru  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etA1,1,  $04,row_e2,  $14,ROWS5,  $0E,row_e3,  '4B'+EXU0_); // DWN 0, Pit down 
data_pit(exit_name_d0,0,2);
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '46'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_,  clm3,row0+$15);// Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '4A'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmF0,$A,  $07<<3,y3); // PBag $A: 1000


//data_rando_scene01("_00"+"_01"+"_00"+"_01"+"_01"+STR_Pit+"4",rm);








//   --------------------------  4A  --------------------------- 
//    
rm_num  = $4A;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'053', STR_ow_axis+hex_str(ow_axis));


row3=row0+$15; y3=row3<<3;
row4=row0+$18; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($11<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($30<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4E<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($6D<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
row5=row3+$02; y5=row5<<3;
row6=row5+$02; y6=row6<<3;
//data_spawn(rm+STR_PRIO,SpTrB,$2,  $1F<<3,y6,  dk_PI+hex_str(PI_MOB_RED),STR_Speed+hex_str(4),STR_Direction+string(-1)); // SpikeTrapB v2: Short, Auto horizontal
//data_spawn(rm+STR_PRIO,SpTrB,$2,  $28<<3,y6,  dk_PI+hex_str(PI_MOB_RED),STR_Speed+hex_str(4),STR_Direction+string(-1)); // SpikeTrapB v2: Short, Auto horizontal
//data_spawn(rm+STR_PRIO,SpTrB,$2,  $56<<3,y6,  dk_PI+hex_str(PI_MOB_RED),STR_Speed+hex_str(4),STR_Direction+string(-1)); // SpikeTrapB v2: Short, Auto horizontal
//data_spawn(rm+STR_PRIO,SpTrB,$2,  $60<<3,y6,  dk_PI+hex_str(PI_MOB_RED),STR_Speed+hex_str(4),STR_Direction+string(-1)); // SpikeTrapB v2: Short, Auto horizontal
data_spawn(rm+STR_PRXM,GumaA,$1,  $10<<3,y5); // Guma  1
data_spawn(rm+STR_PRXM,GumaA,$1,  $26<<3,y5); // Guma  1
data_spawn(rm+STR_PRXM,GumaA,$1,  $44<<3,y5); // Guma  1
data_spawn(rm+STR_PRXM,GumaA,$1,  $62<<3,y5); // Guma  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '49'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '15'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_GLOVE);








//   --------------------------  4B  --------------------------- 
//    
rm_num  = $4B;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'044', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$10; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $16<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,BubbA,$2,  $27<<3,(row0+$15)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $49<<3,(row0+$13)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $6E<<3,(row0+$00)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  2
clm3=$1F; clms3=$10; _x3=(clm3<<3)+4; _a=0;
data_spawn(rm+STR_PRXM,BlazA,$1,  _x3+((clms3*_a++)<<3),y5);
data_spawn(rm+STR_PRXM,BlazA,$1,  _x3+((clms3*_a++)<<3),y5);
data_spawn(rm+STR_PRXM,BlazA,$1,  _x3+((clms3*_a++)<<3),y5);
data_spawn(rm+STR_PRXM,BlazA,$1,  _x3+((clms3*_a++)<<3),y5);
data_spawn(rm+STR_PRXM,BlazA,$1,  _x3+((clms3*_a++)<<3),y5);


data_exit(EXU0,etA4,0,  $04,row_e0,  $70,ROWS5,  $30,row_e4,  '49'+EXD0_); // UP  0, Pit up 
//data_exit(EXU0,etA4,0,  $20,row_e0,  $20,ROWS5,  $30,row_e4,  '49'+EXD0_); // UP  0, Pit up 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$16,  '18'+EXR0_); // LFT 0, 


_a=$00;  _datakey=MAP_DATAKEY1+rm+STR_Page;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B1;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_D1;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_D0;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B0;


data_spawn(rm+STR_PRIO,ItmE0,$1,  ($70<<3)+4,(row3+$01)<<3); // Magic Jar v1(Full)
/*
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'044', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($6B<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE

y3  =(row0+$15)<<3;
data_spawn(rm+STR_PRXM,BubbA,$2,  $27<<3,(row0+$15)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $49<<3,(row0+$13)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $6E<<3,(row0+$00)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  2
y4    =(row0+$00)<<3;
y5    =(row0+$02)<<3;
clm3  = $1C;
clms3 = $08;
clms4 = clms3+$08;
clms5 = clms3>>1;  _a=0;
data_spawn(rm+STR_PRIO,Spawner_FallingBlock,$2,  (clm3+(clms4*_a++))<<3,y4,  STR_Clms+hex_str(clms5)); // BlockSpawner  2
data_spawn(rm+STR_PRIO,Spawner_FallingBlock,$2,  (clm3+(clms4*_a++))<<3,y4,  STR_Clms+hex_str(clms5)); // BlockSpawner  2
data_spawn(rm+STR_PRIO,Spawner_FallingBlock,$2,  (clm3+(clms4*_a++))<<3,y4,  STR_Clms+hex_str(clms5)); // BlockSpawner  2
data_spawn(rm+STR_PRIO,Spawner_FallingBlock,$2,  (clm3+(clms4*_a++))<<3,y4,  STR_Clms+hex_str(clms5)); // BlockSpawner  2
data_spawn(rm+STR_PRIO,Spawner_FallingBlock,$2,  (clm3+(clms4*_a++))<<3,y4,  STR_Clms+hex_str(clms5)); // BlockSpawner  2
clm3=$27; clms3=$10; y4=(row0+$00)<<3; x3=$72<<3; _a=0;
data_spawn(rm+STR_PRIO,SpDrA,$2,  (clm3+(clms3*_a++))<<3,y5); // Drop spawner v2. Drops Flame1
data_spawn(rm+STR_PRIO,SpDrA,$2,  (clm3+(clms3*_a++))<<3,y5); // Drop spawner v2. Drops Flame1
data_spawn(rm+STR_PRIO,SpDrA,$2,  (clm3+(clms3*_a++))<<3,y5); // Drop spawner v2. Drops Flame1
data_spawn(rm+STR_PRIO,SpDrA,$2,  (clm3+(clms3*_a++))<<3,y5); // Drop spawner v2. Drops Flame1
data_spawn(rm+STR_PRIO,SpDrA,$2,  x3-($04<<3),y5); // Drop spawner v2. Drops Flame1
data_spawn(rm+STR_PRXM,Snaraa,$1,  x3,(row0+$0D)<<3,  dk_PI+hex_str(_pi)); // Snaraa
data_spawn(rm+STR_PRXM,Snaraa,$1,  x3,(row0+$17)<<3,  dk_PI+hex_str(_pi)); // Snaraa


data_exit(EXU0,etA4,0,  $20,row_e0,  $20,ROWS5,  $30,row_e4,  '49'+EXD0_); // UP  0, Pit up 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$16,  '18'+EXR0_); // LFT 0, 


_a=$00;  _datakey=MAP_DATAKEY1+rm+STR_Page;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B1;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_D1;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_D0;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B0;


data_spawn(rm+STR_PRIO,ItmE0,$1,  ($6A<<3)+4,(row0+$0C)<<3); // Magic Jar v1(Full)
*/


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01"+STR_Pit+"8",rm, STR_GLOVE);








//   --------------------------  4C  --------------------------- 
//    
rm_num  = $4C;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PG+'054', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row0+$14; y4=row4<<3;
data_spawn(rm+STR_PRIO,SpBaA,$1,  $00<<3,(row0+$08)<<3); // BagoSpawner  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $22<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $37<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $4F<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $5F<<3,y4); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '17'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '4D'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  4D  --------------------------- 
//    
rm_num  = $4D;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'055', STR_ow_axis+hex_str(ow_axis));


row3=row0+$06; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row6=row3+$02; y6=row6<<3;
clm6=$0F; x6=(clm6<<3)+4; _dist=$18<<3; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,LoDoA,$1,  $50<<3,(row3-$02)<<3); // Locked Door
data_spawn(rm+STR_PRXM,Bot_A,$1,  $10<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $1C<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $28<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $34<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $40<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $4C<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $58<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $64<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $70<<3,y6); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '4C'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '4E'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  4E  --------------------------- 
//    
rm_num  = $4E;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'056', STR_ow_axis+hex_str(ow_axis));


row3=row0+$06; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row6=row3+$02; y6=row6<<3;
clm6=$0F; x6=(clm6<<3)+4; _dist=$18<<3; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bot_A,$1,  $10<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $1C<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $28<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $34<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $40<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $4C<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $58<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $64<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $70<<3,y6); // Bot  1


_exit=data_exit(EXD0,etA1,1,  -PAGE_CLMS,row_e2,  clms1,ROWS5,  $2F,row_e3,  '1F'+EXU1_); // DWN 0, Pit down  
data_pit(_exit, 0,4);
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '4D'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '4F'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_00"+STR_Pit+"4",rm);








//   --------------------------  4F  --------------------------- 
//    
rm_num  = $4F;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'057', STR_ow_axis+hex_str(ow_axis));


row3=row0+$06; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row6=row3+$02; y6=row6<<3;
clm6=$0F; x6=(clm6<<3)+4; _dist=$18<<3; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bot_A,$1,  $10<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $1C<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $28<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $34<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $40<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $4C<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $58<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $64<<3,y6); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $70<<3,y6); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '4E'+EXR0_); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);








//   --------------------------  50  --------------------------- 
//    
rm_num  = $50;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'037', STR_ow_axis+hex_str(ow_axis));


clm3=$30; x3=clm3<<3; // clm3: elevator center clm
row3=row0+$17; y3=row3<<3; // pc spawn row exit right
row4=row0+$12; y4=row4<<3;
//row5=row0+$09; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($2C<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($73<<3)+4,(row3+$01)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bot_A,$1,  $17<<3,(row0+$0E)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $38<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $3E<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $40<<3,y3); // Bot  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '53'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$14); // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row4,  '51'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '2B'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_00",rm);








//   --------------------------  51  --------------------------- 
//    
rm_num  = $51;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PG+'003', STR_ow_axis+hex_str(ow_axis));


row3=row0+$12; y3=row3<<3; // pc spawn row exit left,right
data_spawn(rm+STR_PRIO,SpBaA,$1,  $00<<3,(row0+$08)<<3); // BagoSpawner  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '52'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '50'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  52  --------------------------- 
//    
rm_num  = $52;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'059', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$0F; y5=row5<<3;
row6=row0+$07; y6=row6<<3;
clm6=$18; x6=(clm6<<3)+4; _dist=$10<<3; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
clm3=$30; clms3=$20; _a=0;
data_spawn(rm+STR_PRXM,AttaA,$1,  (clm3+(clms3*_a++))<<3,y5); // Atta  1
data_spawn(rm+STR_PRXM,AttaA,$1,  (clm3+(clms3*_a++))<<3,y5); // Atta  1
data_spawn(rm+STR_PRXM,AttaA,$1,  (clm3+(clms3*_a++))<<3,y5); // Atta  1
data_spawn(rm+STR_PRXM,SpDrA,$1,  $20<<3,y6); // DropSpawner  1
data_spawn(rm+STR_PRXM,SpDrA,$1,  $40<<3,y6); // DropSpawner  1
data_spawn(rm+STR_PRXM,SpDrA,$1,  $60<<3,y6); // DropSpawner  1


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '51'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmE0,$3,  ($09<<3)+4,(row0+$17)<<3); // Magic Jar (1 cont), no respawn


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_00",rm);








//   --------------------------  53  --------------------------- 
//    
rm_num  = $53;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'060', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($17<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($27<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpStA,$2,  $2E<<3,(row0+$0F)<<3); // SpawnByStab  2
data_spawn(rm+STR_PRXM,BubbA,$8,  $16<<3,(row0+$0D)<<3); // GiantBubble


clm3=$70; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '50'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_,  clm3,row0+$15);// Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '54'+EXR0_); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01",rm);








//   --------------------------  54  --------------------------- 
//    
rm_num  = $54;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'061', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$07; y5=row5<<3;
row6=row0+$0D; y6=row6<<3;
clm6=$07; x6=(clm6<<3)+4; _dist=$10<<3; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6+(_dist*_a++),y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,SpDrA,$1,  $1F<<3,y5); // DropSpawner  1
data_spawn(rm+STR_PRXM,SpDrA,$1,  $3F<<3,y5); // DropSpawner  1
data_spawn(rm+STR_PRXM,SpDrA,$1,  $5F<<3,y5); // DropSpawner  1
data_spawn(rm+STR_PRXM,BubbA,$8,  $1F<<3,y6); // GiantBubble
data_spawn(rm+STR_PRXM,BubbA,$8,  $3F<<3,y6); // GiantBubble
data_spawn(rm+STR_PRXM,BubbA,$8,  $5F<<3,y6); // GiantBubble


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '3A'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '53'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  55  --------------------------- 
//    
rm_num  = $55;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'019', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($3D<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($61<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpStA,$2,  $0E<<3,y3); // SpawnByStab  2
data_spawn(rm+STR_PRXM,BoBoA,$1,  $6E<<3,(row0+$0B)<<3); // BossBot  1


data_exit(EXU0,etA4,0,  $44,row_e0,  $18,ROWS5,  $4F,row_e4,  '0B'+EXD0_); // UP  0, Pit up 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '56'+EXL0_); // RGT 0, 


//data_spawn(rm+STR_PRIO,ItmF0,$A,  $34<<3,y4); // PBag $A: 1000


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_01"+STR_Pit+"8",rm, STR_GLOVE);








//   --------------------------  56  --------------------------- 
//    
rm_num  = $56;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'030', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$15; y5=row5<<3;
row6=row0+$13; y6=row6<<3;
row7=row0+$0B; y7=row7<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0B<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($73<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spin_trap(FiRoA,1,  $20<<3,y5,  -1,  8,1,4, 0*90); // Firerope
data_spin_trap(FiRoA,1,  $30<<3,y6,  -1,  8,1,4, 1*90); // Firerope
data_spin_trap(FiRoA,1,  $40<<3,y5,  -1,  8,1,4, 2*90); // Firerope
data_spin_trap(FiRoA,1,  $50<<3,y6,  -1,  8,1,4, 3*90); // Firerope
data_spin_trap(FiRoA,1,  $60<<3,y5,  -1,  8,1,4, 2*90); // Firerope
data_spawn(rm+STR_PRXM,Ra__A,$3,  $36<<3,y7); // Ra  3
data_spawn(rm+STR_PRXM,Ra__A,$3,  $48<<3,y7); // Ra  3


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '55'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '57'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  57  --------------------------- 
//    
rm_num  = $57;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_PG+'063', STR_ow_axis+hex_str(ow_axis));


y3 = (row0+$1A)<<3;
y5 = (row0+$09)<<3;
data_spawn(rm+STR_PRXM,Ra__A,$3,  $18<<3,y5); // Ra  3
data_spawn(rm+STR_PRXM,Ra__A,$3,  $46<<3,y5); // Ra  3
data_spawn(rm+STR_PRXM,BagiA,$1,  $0F<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $1F<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $2F<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $3F<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $4F<<3,y3); // Bagin


row3 = row0+$12;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '56'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '10'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  58  --------------------------- 
//    
rm_num  = $58;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'062', STR_ow_axis+hex_str(ow_axis));


row3=row0+$0A; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
//row5=row0+$15; y5=row5<<3;
row6=row0+$16; y6=row6<<3;
row7=row6+$02; y7=row7<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($16<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($2E<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($46<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
x3=(clms0-$0A)<<3; _pi=global.PI_BGR1; // $76
data_spawn(rm+STR_PRXM,Snaraa,$1,  x3,(row3+$01)<<3,  dk_PI+hex_str(_pi)); // Snaraa
data_spawn(rm+STR_PRXM,Snaraa,$1,  x3,(row6+$01)<<3,  dk_PI+hex_str(_pi)); // Snaraa
data_spawn(rm+STR_PRXM,FokuA,$1,  $2F<<3,y3); // Fokkeru  1
data_spawn(rm+STR_PRXM,FokuA,$1,  $5F<<3,y6); // Fokkeru  1
data_spawn(rm+STR_PRXM,AnerA,$3,  $1E<<3,y7); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $3E<<3,y7); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $6E<<3,y7); // Aneru  3


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '10'+EXR0_); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);








//   --------------------------  59  --------------------------- 
//    
rm_num  = $59;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'070', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row3-$02; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $1C<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $23<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clm3=$1F;
data_exit(EXM0,etB3,1,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  '5A'+EXM0_); // MID 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '34'+EXL0_); // RGT 0, 
/*
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'066', STR_ow_axis+hex_str(ow_axis));


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$15; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($3F<<3)+4,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($53<<3)+4,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($67<<3)+4,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  ($67<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,AnerA,$3,  $06<<3,(row0+$0A)<<3); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $14<<3,(row0+$08)<<3); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $22<<3,(row0+$0A)<<3); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $30<<3,(row0+$10)<<3); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $46<<3,(row0+$18)<<3); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $58<<3,(row0+$16)<<3); // Aneru  3
data_spawn(rm+STR_PRXM,AnerA,$3,  $6A<<3,(row0+$18)<<3); // Aneru  3
//data_spawn(rm+STR_PRXM,AnerA,$3,  $67<<3,(row0+$18)<<3); // Aneru  3


data_exit(EXD0,etA1,1,  $00,row_e2,  $10,ROWS5,  $08,row_e3,  '0B'+EXU0_); // DWN 0, Pit down 
//data_pit(exit_name_d0,0,2);
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '34'+EXL0_); // RGT 0, 
*/








//   --------------------------  5A  --------------------------- 
//    Fast travel to Thunderbird
rm_num  = $5A;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PG+'070', STR_ow_axis+hex_str(ow_axis));


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row3-$02; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $1C<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $23<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,LoDoA,$2,  $47<<3,y5,  STR_Side+hex_str($2)); // Locked Door


clm3=$1F;
data_exit(EXM0,etB2,1,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  '59'+EXM0_); // MID 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '01'+EXL0_); // RGT 0, 








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




