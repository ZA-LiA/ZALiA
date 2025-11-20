/// rm_data_init_MazIs_A_1()

// Breaking up `rm_data_init_MazIs_A` because things go slow with it open.


var _i,_j,_k, _a,_b, _w,_h;
var _x,_xl, _y,_yt, _x1,_x2,_x3,_x4, _y1,_y2,_y3,_y4;
var _val,_val1,_val2,_val3,_val4;
var _data,_data1,_data2,_data3,_data4,_data5,_data6;
var _rm, _pages, _dk, _datakey0,_datakey1;
var _len, _dir, _dur, _delay, _dist;
var _pi;
var _file;
//var _exit_name = REEN_DEFAULT;
var _ow_axis = 0;
var _dk_spawn_item0, _dk_spawn_item1, _dk_spawn_item2, _dk_spawn_item3, _dk_spawn_item4;




var _MapAreaName_MAZE_ISLAND = "MAZE ISLAND";








// -----------------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------------




//   --------------------------  40  --------------------------- 
//    Extra scene rando scene. Field, moai statue with doorway mouth, 2 sections wide room
rm_num  = $40;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'064');


row3=row0+$17; y3=row3<<3;
row4=row3-$02; y4=row4<<3;
row5=row3+$02; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,Bot_A,$1,  $0F<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $2F<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$2,  $17<<3,y3); // Bot  2


clm3=$1F;
data_exit(EXM0,etB0,1,  clm3,row4,  $03,ROWS2,  clm3-1,row4,  rm_num_+EXM0_); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


//data_rando_scene01("_01"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_m0, exit_name_r0);
data_path_conditions(exit_name_m0, exit_name_l0);

data_path_conditions(exit_name_r0, exit_name_m0);
data_path_conditions(exit_name_r0, exit_name_l0);

data_path_conditions(exit_name_l0, exit_name_m0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  41  --------------------------- 
//    Extra scene rando scene. Field, moai statue with doorway mouth, 4 sections wide room
rm_num  = $41;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'065');


row3=row0+$17; y3=row3<<3;
row4=row3-$02; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRIO,SpMoA,$1,  0,0,  STR_Strong+STR_Encounter); // MobySpawner  1 
data_spawn(rm+STR_PRXM,MoblA,$2,  $1B<<3,y3); // Moblin  2 
data_spawn(rm+STR_PRXM,MoblA,$2,  $67<<3,y3); // Moblin  2 


clm3=$3F;
data_exit(EXM0,etB0,1,  clm3,row4,  $03,ROWS2,  clm3-1,row4,  rm_num_+EXM0_); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


//data_rando_scene01("_01"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_m0, exit_name_r0);
data_path_conditions(exit_name_m0, exit_name_l0);

data_path_conditions(exit_name_r0, exit_name_m0);
data_path_conditions(exit_name_r0, exit_name_l0);

data_path_conditions(exit_name_l0, exit_name_m0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  42  --------------------------- 
//    Extra scene rando scene. Field and water, moai statue with doorway mouth, 2 sections wide room
rm_num  = $42;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'066');


row3=row0+$16; y3=row3<<3;
row4=row0+$19; y4=row4<<3;
row5=row3-$02; y5=row5<<3;
row6=row4+$02; y6=row6<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,Bot_A,$1,  $0D<<3,y6); // Bot  1
//data_spawn(rm+STR_PRXM,Octorok01,$1,  $0D<<3,y6); // Octorok  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $2F<<3,y3+$10); // Bot  1


clm3=$1F;
data_exit(EXM0,etB0,1,  clm3,row5,  $03,ROWS2,  clm3-1,row5,  rm_num_+EXM0_); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row4,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


//data_rando_scene01("_01"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_m0, exit_name_r0);
data_path_conditions(exit_name_m0, exit_name_l0);

data_path_conditions(exit_name_r0, exit_name_m0);
data_path_conditions(exit_name_r0, exit_name_l0);

data_path_conditions(exit_name_l0, exit_name_m0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  43  --------------------------- 
//    Extra scene rando scene. Field, Ruins with doorway, 2 sections wide room
rm_num  = $43;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'067');


row3=row0+$16; y3=row3<<3;
row4=row3-$03; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,Ache01,$1,  $31<<3,(row0+$05)<<3); // Ache  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $20<<3,(row0+$08)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $0F<<3,(row0+$16)<<3); // Bot  1


clm3=$1F;
data_exit(EXM0,etB0,1,  clm3,row4,  $02,ROWS2,  clm3-1,row4,  rm_num_+EXM0_); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


//data_rando_scene01("_01"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_m0, exit_name_r0);
data_path_conditions(exit_name_m0, exit_name_l0);

data_path_conditions(exit_name_r0, exit_name_m0);
data_path_conditions(exit_name_r0, exit_name_l0);

data_path_conditions(exit_name_l0, exit_name_m0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  44  --------------------------- 
//    Extra scene rando scene. Dungeon, flat floor, 9 pillars, curtains
rm_num  = $44;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'068');


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
clm3=$10; x3=(clm3<<3)+4; clms3=$0A; clms4=$20;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
x3+=clms3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
x3+=clms4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
x3+=clms3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
x3+=clms4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
x3+=clms3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpGrA,$1,  0,0); // GruntSpawner  1 
data_spawn(rm+STR_PRXM,GoriA,$2,  $1F<<3,y3); // Goriya  2 
data_spawn(rm+STR_PRXM,GoriA,$2,  $3F<<3,y3); // Goriya  2 
data_spawn(rm+STR_PRXM,GoriA,$2,  $5F<<3,y3); // Goriya  2 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXD0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  45  --------------------------- 
//    Extra scene rando scene. Dungeon, very small corner room with down elevator and right exit
rm_num  = $45;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'069');


row3=row0+$14; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($35<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clm3=$2E; // Elevator center clm
data_exit(EXD0,etC0,1,  clm3-4,row_e2,  CLMS4,ROWS5,  clm3-1,row_e3,  hex_str(rm_num-1)+EXR0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$13);                                          // Elevator DW $40, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_00"+"_01"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_d0);
data_path_conditions(exit_name_d0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  46  --------------------------- 
//    Extra scene rando scene. Dungeon, very small corner room with down elevator and left exit
rm_num  = $46;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'070');


row3=row0+$14; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($09<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clm3=$12; // Elevator center clm
data_exit(EXD0,etC0,1,  clm3-4,row_e2,  CLMS4,ROWS5,  clm3-1,row_e3,  hex_str(rm_num+1)+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$13);                                          // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 


//data_rando_scene01("_00"+"_00"+"_01"+"_01"+"_00",rm);
data_path_conditions(exit_name_l0, exit_name_d0);
data_path_conditions(exit_name_d0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  47  --------------------------- 
//    Extra scene rando scene. Dungeon, very small corner room with up elevator and right exit
rm_num  = $47;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'071');


row3=row0+$0A; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($35<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clm3=$2E; // Elevator center clm
data_exit(EXU0,etC0,1,  clm3-4,row_e0,  CLMS4,ROWS5,  clm3-1,row_e1,  hex_str(rm_num-1)+EXD0_); // UP  0, Elevator up 
data_Elev(EXU0_, clm3,row0+$08);                                          // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_01",rm);
data_path_conditions(exit_name_r0, exit_name_u0);
data_path_conditions(exit_name_u0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  48  --------------------------- 
//    Extra scene rando scene. Dungeon, very small corner room with up elevator and left exit
rm_num  = $48;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'072');


row3=row0+$0A; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($09<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clm3=$12; // Elevator center clm
data_exit(EXU0,etC0,1,  clm3-4,row_e0,  CLMS4,ROWS5,  clm3-1,row_e1,  hex_str(rm_num+1)+EXR0_); // UP  0, Elevator up 
data_Elev(EXU0_, clm3,row0+$08);                                          // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01",rm);
data_path_conditions(exit_name_l0, exit_name_u0);
data_path_conditions(exit_name_u0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  49  --------------------------- 
//    Extra scene rando scene. 
rm_num  = $49;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'073');


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $37<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,MegmA,$1,  $20<<3,(row0+$0C)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $25<<3,(row0+$10)<<3); // Megmat  1 


clm3=$10; // Elevator center clm
data_exit(EXU0,etC0,1,  clm3-4,row_e0,  CLMS4,ROWS5,  clm3-1,row_e1,  hex_str(rm_num+1)+EXL0_); // UP  0, Elevator up 
data_Elev(EXU0_, clm3,row0+$12);                                          // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num-1)+EXU0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_01",rm);
data_path_conditions(exit_name_r0, exit_name_u0);
data_path_conditions(exit_name_u0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  4A  --------------------------- 
//    Extra scene rando scene. Dungeon entrance, in the style of the triforce barrier ruins
rm_num  = $4A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR2_, STR_Tile+area_MI+'074');


row3=row0+$17; y3=row3<<3;
row6=row0+$09; y6=row6<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,Moa_A,$1,  $28<<3,(row0+$0E)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $34<<3,(row0+$0C)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Ache01,$1,  $40<<3,y6); // Ache  1 
data_spawn(rm+STR_PRXM,Ache01,$1,  $4A<<3,y6); // Ache  1 
data_spawn(rm+STR_PRXM,Ache01,$1,  $58<<3,y6); // Ache  1 


clm3=$70; // Elevator center clm
data_exit(EXD0,etC0,1,  clm3-4,row_e2,  CLMS4,ROWS5,  clm3-1,row_e3,  hex_str(rm_num+1)+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$14);                                          // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXU0_); // LFT 0, 


//data_rando_scene01("_00"+"_00"+"_01"+"_01"+"_00",rm);
data_path_conditions(exit_name_l0, exit_name_d0);
data_path_conditions(exit_name_d0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  4B  --------------------------- 
//    Extra scene rando scene. Cave, Water, has a "walk across short gaps" section
rm_num  = $4B;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'075');


row3=row0+$08; y3=row3<<3;
row4=row0+$13; y4=row4<<3;
row5=row0+$19; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bagin01,$1,  $16<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  $1E<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  $2A<<3,y5); // Bagin


clm3=$50; // Elevator center clm
data_exit(EXU0,etC0,1,  clm3-4,row_e0,  CLMS4,ROWS5,  clm3-1,row_e1,  hex_str(rm_num-1)+EXD0_); // UP  0, Elevator up 
data_Elev(EXU0_, clm3,row0+$10);                                          // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num+1)+EXD0_); // LFT 0, 


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01",rm);
data_path_conditions(exit_name_l0, exit_name_u0);
data_path_conditions(exit_name_u0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  4C  --------------------------- 
//    Extra scene rando scene. Cave, Left Exit, Elev Down Exit, 4 section-wide room
rm_num  = $4C;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'076');


row3=row0+$0A; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$16; y5=row5<<3;
row6=row5+$02; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,(row0+$0B)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+4,(row0+$16)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,DairA,$1,  $46<<3,y5); // Daira  1
data_spawn(rm+STR_PRXM,MegmA,$1,  $30<<3,y5); // Megmat  1
data_spawn(rm+STR_PRXM,MegmA,$1,  $32<<3,y5); // Megmat  1
data_spawn(rm+STR_PRXM,MegmA,$1,  $36<<3,y5); // Megmat  1
data_spawn(rm+STR_PRXM,LowdA,$1,  $5A<<3,y6); // Lowder  1
data_spawn(rm+STR_PRXM,LowdA,$1,  $5E<<3,y6); // Lowder  1
data_spawn(rm+STR_PRXM,LowdA,$1,  $64<<3,y6); // Lowder  1


clm3=$50; // Elevator center clm
data_exit(EXD0,etC0,1,  clm3-4,row_e2,  CLMS4,ROWS5,  clm3-1,row_e3,  hex_str(rm_num-1)+EXL0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$13);                                          // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num+1)+EXU0_); // LFT 0, 


//data_rando_scene01("_00"+"_00"+"_01"+"_01"+"_00",rm);
data_path_conditions(exit_name_l0, exit_name_d0);
data_path_conditions(exit_name_d0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  4D  --------------------------- 
//    Extra scene rando scene. Dungeon, Water, Long Drop from Pit Up. The scene used for the evil wizard video
rm_num  = $4D;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'077');


row3=row0+$19; y3=row3<<3;
row4=$55; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($08<<3)+4,(row4+$03)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$1,  $1C<<3,$20<<3); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $0C<<3,$30<<3); // DropSpawner  1
data_spawn(rm+STR_PRXM,Myu_A,$1,  $2D<<3,$36<<3); // Myu  1 


data_exit(EXU0,etA0,0,  $20,row_e0,  $10,ROWS5,  $27,row_e4,  hex_str(rm_num-1)+EXL0_); // UP  0, Pit up 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num+1)+EXL0_); // LFT 0, 


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01"+STR_Pit+"8",rm);
//data_path_conditions(exit_name_l0, exit_name_l0);
data_path_conditions(exit_name_u0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  4E  --------------------------- 
//    Extra scene rando scene. Beach, Water, Basic beach scene
rm_num  = $4E;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'078');


row3=row0+$18; y3=row3<<3;
row4=row3-$04; y4=row4<<3;
row5=row3+$02; y5=row5<<3;
row6=row0+$16; y6=row6<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,Octorok01,$1,  $2B<<3,y5); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $3A<<3,y5); // Octorok  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $1A<<3,y6); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $22<<3,y6); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $32<<3,y6); // Geldarm  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  4F  --------------------------- 
//    Extra scene rando scene. Bridge, Water, All bridge, 4 section-wide room
rm_num  = $4F;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'079');


row3=row0+$09; y3=row3<<3;
row4=row3+$02; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRIO,SpPoA,$1,  0,0); // BubbleSpawner  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $19<<3,y4); // Lowder  1
data_spawn(rm+STR_PRXM,LowdA,$1,  $2F<<3,y4); // Lowder  1
data_spawn(rm+STR_PRXM,LowdA,$1,  $48<<3,y4); // Lowder  1
data_spawn(rm+STR_PRXM,LowdA,$1,  $63<<3,y4); // Lowder  1
data_spawn(rm+STR_PRXM,MegmA,$1,  $1C<<3,y3); // Megmat  1
data_spawn(rm+STR_PRXM,MegmA,$1,  $22<<3,y3); // Megmat  1
data_spawn(rm+STR_PRXM,MegmA,$1,  $33<<3,y3); // Megmat  1
data_spawn(rm+STR_PRXM,MegmA,$1,  $44<<3,y3); // Megmat  1
data_spawn(rm+STR_PRXM,MegmA,$1,  $5E<<3,y3); // Megmat  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  50  --------------------------- 
//    Extra scene rando scene. Cave, Basic cave, 2 section-wide room
rm_num  = $50;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'080');


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $36<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,DairA,$1,  $1F<<3,y3); // Daira  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  51  --------------------------- 
//    Extra scene rando scene. Cave, Water, Old underground VOD tunnels scene
rm_num  = $51;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'081');


row3=row0+$12; y3=row3<<3;
row4=row0+$10; y4=row4<<3;
row5=row0+$19; y5=row5<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $36<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Octorok01,$1,  $47<<3,(row0+$14)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $38<<3,(row0+$0E)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Bagin01,$1,  $1E<<3,y5); // Bagin


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  52  --------------------------- 
//    Extra scene rando scene. Cave, Water, Old underground VOD tunnels scene
rm_num  = $52;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'082');


row3=row0+$12; y3=row3<<3;
row4=row0+$0E; y4=row4<<3;
row5=row0+$19; y5=row5<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $36<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Octorok01,$1,  $43<<3,(row0+$10)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Bagin01,$1,  $1E<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  $2C<<3,y5); // Bagin


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  53  --------------------------- 
//    Extra scene rando scene. Cave, Water, Old underground VOD tunnels scene
rm_num  = $53;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'083');


row3=row0+$12; y3=row3<<3;
row4=row0+$08; y4=row4<<3;
row5=row0+$1A; y5=row5<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $36<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bagin01,$1,  $19<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  $21<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  $49<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  $51<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,Octorok01,$1,  $2B<<3,(row0+$14)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $39<<3,(row0+$10)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $59<<3,(row0+$0C)<<3); // Octorok  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  54  --------------------------- 
//    Extra scene rando scene. Dungeon, Water, Similar to P5's skulls on top of pillars scene
rm_num  = $54;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'084');


row3=row0+$12; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$12; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $04<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $5B<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,BubbA,$12,  $0C<<3,(row0+$0E)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $10<<3,(row0+$10)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $14<<3,(row0+$0A)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $1C<<3,(row0+$10)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $22<<3,(row0+$10)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $26<<3,(row0+$16)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $2A<<3,(row0+$0F)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $2C<<3,(row0+$10)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $2F<<3,(row0+$0D)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $34<<3,(row0+$11)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $3D<<3,(row0+$10)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $3F<<3,(row0+$0C)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $4A<<3,(row0+$10)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $50<<3,(row0+$0E)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRIO,BubbA,$12,  $54<<3,(row0+$0F)<<3); // Bubble v$10(dormant)
data_spawn(rm+STR_PRXM,Moa_B,$1,  $1F<<3,(row0+$0B)<<3); // FieryMoa  1
data_spawn(rm+STR_PRXM,Moa_B,$1,  $3F<<3,(row0+$0B)<<3); // FieryMoa  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  55  --------------------------- 
//    Extra scene rando scene. Dungeon, Option to take high or low path
rm_num  = $55;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'085');


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$04; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($27<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($3F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($57<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$1,  $1F<<3,y5); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $2E<<3,y5); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $50<<3,y5); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $5F<<3,y5); // DropSpawner  1
data_spawn(rm+STR_PRXM,IrKnA,$1,  $27<<3,y3); // IronKnuckle  1
data_spawn(rm+STR_PRXM,IrKnA,$2,  $3F<<3,y3); // IronKnuckle  2
data_spawn(rm+STR_PRXM,IrKnA,$1,  $57<<3,y3); // IronKnuckle  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  56  --------------------------- 
//    Extra scene rando scene. Dungeon, Stairs, 2 section-wide room
rm_num  = $56;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'086');


row3=row0+$17; y3=row3<<3;
row4=row0-$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0D<<3)+4,row3<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $36<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Octorok01,$1,  $15<<3,(row0+$15)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $19<<3,(row0+$11)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $1D<<3,(row0+$0D)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $21<<3,(row0+$09)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $25<<3,(row0+$05)<<3); // Octorok  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  57  --------------------------- 
//    Extra scene rando scene. Dungeon, Stairs on both ends
rm_num  = $57;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'087');


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0D<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($72<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,DoomA,$1,  $3F<<3,(row0+$02)<<3); // Doomknocker  1
data_spawn(rm+STR_PRXM,Octorok01,$1,  $15<<3,(row0+$14)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $21<<3,(row0+$08)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $5D<<3,(row0+$08)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $69<<3,(row0+$14)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $1D<<3,(row0+$0C)<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $61<<3,(row0+$0C)<<3); // Myu  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  58  --------------------------- 
//    Extra scene rando scene. Dungeon, Pillars, Flat ground except for 4 1x2 block solids
rm_num  = $58;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'088');


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$05; y5=row5<<3;
row6=row3+$02; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $77<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$1,  $25<<3,y5); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $3F<<3,y5); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $59<<3,y5); // DropSpawner  1
data_spawn(rm+STR_PRXM,GeldA,$1,  $1F<<3,y6); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $2C<<3,y6); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $39<<3,y6); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $46<<3,y6); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $53<<3,y6); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $60<<3,y6); // Geldarm  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  59  --------------------------- 
//    Extra scene rando scene. Dungeon, Water, Flat ground with several pitfalls
rm_num  = $59;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'089');


row3=row0+$10; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$07; y5=row5<<3;
row6=row0+$1B; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $76<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bagin01,$1,  $25<<3,y6); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  $3F<<3,y6); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  $59<<3,y6); // Bagin
data_spawn(rm+STR_PRXM,Ra__A,$1,  $2F<<3,y5); // Ra  1
data_spawn(rm+STR_PRXM,Ra__A,$1,  $4F<<3,y5); // Ra  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  5A  --------------------------- 
//    Extra scene rando scene. Field, Rocky ground, Flat ground, Some bgr bushes
rm_num  = $5A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'090');


row3=row0+$17; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,TektA,$1,  $1F<<3,y3); // Tektite  1 
data_spawn(rm+STR_PRXM,TektA,$1,  $3F<<3,y3); // Tektite  1 
data_spawn(rm+STR_PRXM,TektA,$1,  $5F<<3,y3); // Tektite  1 
data_spawn(rm+STR_PRXM,Boon01,$1,  $3F<<3,(row0+$08)<<3); // Boon  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  5B  --------------------------- 
//    Extra scene rando scene. Mtn Pass
rm_num  = $5B;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'091');


row3=row0+$17; y3=row3<<3;
row4=row0+$0F; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,Octorok01,$1,  $2A<<3,(row0+$0B)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $4C<<3,(row0+$07)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $6B<<3,(row0+$0B)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $42<<3,(row0+$0D)<<3); // Lowder  1
data_spawn(rm+STR_PRXM,MegmA,$1,  $2E<<3,(row0+$0B)<<3); // Megmat  1
data_spawn(rm+STR_PRXM,MegmA,$1,  $58<<3,(row0+$07)<<3); // Megmat  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  5C  --------------------------- 
//    Extra scene rando scene. Mtn Pass
rm_num  = $5C;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'092');


row3=row0+$17; y3=row3<<3;
row4=row0+$0F; y4=row4<<3;
row5=row0+$0D; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,GeldA,$1,  ($10<<3)+4,(row0+$19)<<3); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  ($46<<3)+4,y5); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  ($4E<<3)+4,y5); // Geldarm  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $24<<3,(row0+$0D)<<3); // Lowder  1
data_spawn(rm+STR_PRXM,LowdA,$1,  $32<<3,(row0+$0B)<<3); // Lowder  1
data_spawn(rm+STR_PRXM,LowdA,$1,  $55<<3,(row0+$09)<<3); // Lowder  1
data_spawn(rm+STR_PRXM,LowdA,$1,  $6A<<3,(row0+$09)<<3); // Lowder  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  5D  --------------------------- 
//    Extra scene rando scene. River Cave
rm_num  = $5D;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'093');


row3=row0+$18; y3=row3<<3;
row4=row3+$02; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,Boggnipp01,$1,  $1B<<3,y4); // Boggnipp01
data_spawn(rm+STR_PRXM,Boggnipp01,$1,  $30<<3,y4); // Boggnipp01
data_spawn(rm+STR_PRXM,Boggnipp01,$1,  $4E<<3,y4); // Boggnipp01
data_spawn(rm+STR_PRXM,Boggnipp01,$1,  $63<<3,y4); // Boggnipp01
data_spawn(rm+STR_PRXM,Octorok01,$1,  $23<<3,y4); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $3F<<3,y4); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $5B<<3,y4); // Octorok  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  5E  --------------------------- 
//    Extra scene rando scene. Rock, Water
rm_num  = $5E;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'094');


row3=row0+$11; y3=row3<<3;
row4=row0+$0F; y4=row4<<3;
row5=row0+$08; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,Boon01,$1,  $1F<<3,y5); // Boon  1 
data_spawn(rm+STR_PRXM,Boon01,$1,  $3F<<3,y5); // Boon  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $29<<3,y3+($01<<3)); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $35<<3,y3); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $3F<<3,y3); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $45<<3,y3); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $4D<<3,y3); // Geldarm  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  5F  --------------------------- 
//    Extra scene rando scene. Rock, Water, River side
rm_num  = $5F;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'095');


row3=row0+$13; y3=row3<<3;
row4=row0+$18; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,Octorok01,$1,  $19<<3,(row0+$15)<<3); // Octorok  1 
//data_spawn(rm+STR_PRXM,Octorok01,$1,  $3B<<3,(row0+$17)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $4C<<3,(row0+$1A)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $29<<3,(row0+$15)<<3); // Geldarm  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  60  --------------------------- 
//    Extra scene rando scene. Field, Ruins
rm_num  = $60;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'096');


row3=row0+$17; y3=row3<<3;
row4=row0+$15; y4=row4<<3;
row5=row0+$08; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,Boon01,$1,  $27<<3,y5); // Boon  1 
data_spawn(rm+STR_PRXM,Boon01,$1,  $57<<3,y5); // Boon  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $17<<3,y4); // Megmat  1
data_spawn(rm+STR_PRXM,MegmA,$1,  $2F<<3,y4); // Megmat  1
data_spawn(rm+STR_PRXM,MegmA,$1,  $4F<<3,y4); // Megmat  1
data_spawn(rm+STR_PRXM,MegmA,$1,  $67<<3,y4); // Megmat  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  61  --------------------------- 
//    Extra scene rando scene. Rock, Ruins like ones at triforce barrier
rm_num  = $61;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'097');


row3=row0+$17; y3=row3<<3;
row4=row0+$0F; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,DairA,$2,  $67<<3,y4); // Daira  2 
data_spawn(rm+STR_PRXM,GoriA,$2,  $23<<3,(row0+$13)<<3); // Goriya  2 
data_spawn(rm+STR_PRXM,GoriA,$2,  $47<<3,y4); // Goriya  2 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $34<<3,(row0+$13)<<3); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  62  --------------------------- 
//    Extra scene rando scene. Field, Water, Ruins
rm_num  = $62;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'098');


row3=row0+$19; y3=row3<<3;
row4=row0+$16; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,Bot_A,$1,  $0D<<3,(row0+$1B)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $1E<<3,(row0+$14)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $28<<3,(row0+$14)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $32<<3,(row0+$18)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$2,  $23<<3,(row0+$18)<<3); // Bot  2


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);







//   --------------------------  63  --------------------------- 
//    Extra scene rando scene. Rock, Water
rm_num  = $63;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'099');


row3=row0+$10; y3=row3<<3;
row4=row0+$18; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,Bagin01,$1,  $1B<<3,y4); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  $2E<<3,y4); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  $41<<3,y4); // Bagin
data_spawn(rm+STR_PRXM,LowdA,$1,  $38<<3,(row0+$0C)<<3); // Lowder  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  64  --------------------------- 
//    Extra scene rando scene. Rock, Water
rm_num  = $64;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'100');


row3=row0+$08; y3=row3<<3;
row4=row0+$10; y4=row4<<3;
row5=row0+$18; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,LowdA,$1,  $17<<3,(row0+$12)<<3); // Lowder  1
data_spawn(rm+STR_PRXM,Bagin01,$1,  $2A<<3,y5); // Bagin


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  65  --------------------------- 
//    Extra scene rando scene. Rock, Water
rm_num  = $65;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'101');


row3=row0+$10; y3=row3<<3;
row4=row3-$01; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,GiruA,$1,  $16<<3,y4); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3B<<3,(row0+$0A)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $53<<3,y4); // Girubokku  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  66  --------------------------- 
//    Extra scene rando scene. Rock, Water
rm_num  = $66;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'102');


row3=row0+$04; y3=row3<<3;
row4=row0+$08; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRIO,SpRoA,$1,  0,0); // RockSpawner  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  67  --------------------------- 
//    Extra scene rando scene. 
rm_num  = $67;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'103');


row3=row0-$04; y3=row3<<3;
row4=row0+$06; y4=row4<<3;
row5=row0+$18; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,Bagin01,$1,  $15<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  $1D<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  $2E<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  $41<<3,y5); // Bagin


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  68  --------------------------- 
//    Extra scene rando scene. 
rm_num  = $68;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'104');


row3=row0+$12; y3=row3<<3;
row4=row0+$14; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRIO,SpMoA,$1,  0,0); // MobySpawner  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $1E<<3,(row0+$10)<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $29<<3,(row0+$14)<<3); // Myu  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);









//   --------------------------  69  --------------------------- 
//    Extra scene rando scene. Dungeon, Water, Water pitfalls, Collapsable floors, Need jump to get across
rm_num  = $69;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'105');


row3=row0+$10; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$07; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0E<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $71<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Ra__A,$1,  $3E<<3,y5); // Ra  1
data_spawn(rm+STR_PRXM,Ra__A,$1,  $44<<3,y5); // Ra  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0, STR_JUMP);
data_path_conditions(exit_name_l0, exit_name_r0, STR_JUMP);

data_scene_rando(rm);








//   --------------------------  6A  --------------------------- 
//    Extra scene rando scene. Dungeon, Water, Need cucco to crouch under low submerged wall
rm_num  = $6A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'106');


row3=row0+$18; y3=row3<<3;
row4=row0+$17; y4=row4<<3;
row5=row3+$02; y5=row5<<3;
clm3=$0F; clms3=$18; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3+(clms3*_a++))<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3+(clms3*_a++))<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3+(clms3*_a++))<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpStA,$1,  $48<<3,y3-($06<<3)); // SpawnByStab  1
data_spawn(rm+STR_PRXM,GumaA,$1,  $46<<3,y3); // Guma  1
//data_spawn(rm+STR_PRXM,IrKnA,$3,  $46<<3,y3); // IronKnuckle  3


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0, STR_FAIRY);
data_path_conditions(exit_name_l0, exit_name_r0, STR_FAIRY);

data_scene_rando(rm);








//   --------------------------  6B  --------------------------- 
//    Extra scene rando scene. Cave, Water, Need cucco to duck under low submerged wall
rm_num  = $6B;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'107');


row3=row0+$18; y3=row3<<3;
row4=row0+$16; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $18<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,DairA,$1,  $1F<<3,y3); // Daira  1 
data_spawn(rm+STR_PRXM,DairA,$2,  $4E<<3,y3); // Daira  2 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0, STR_FAIRY);
data_path_conditions(exit_name_l0, exit_name_r0, STR_FAIRY);

data_scene_rando(rm);








//   --------------------------  6C  --------------------------- 
//    Extra scene rando scene. Cave, Water, Need JUMP + cucco to get across pitfall
rm_num  = $6C;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'108');


row3=row0+$0C; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0B<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($54<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0, STR_JUMP+"+"+STR_FAIRY);
data_path_conditions(exit_name_l0, exit_name_r0, STR_JUMP+"+"+STR_FAIRY);

data_scene_rando(rm);








//   --------------------------  6D  --------------------------- 
//    Extra scene rando scene. Previous used scene with hole on west side of Death Mtn
rm_num  = $6D;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'109');


row3=row0+$16; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,Myu_A,$1,  $0D<<3,(row0+$18)<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $22<<3,(row0+$14)<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $2E<<3,(row0+$16)<<3); // Myu  1 


data_exit(EXD0,etA1,1,  $1C,row_e2,  $04,ROWS5,  $33,row_e3,  hex_str(rm_num+1)+EXL0_); // DWN 0, Pit down 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_d0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_d0);

data_scene_rando(rm);








//   --------------------------  6E  --------------------------- 
//    Extra scene rando scene. Dungeon, Up+Down Elevator, 4-Way Exits
rm_num  = $6E;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'110');


row3=row0+$10; y3=row3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($1C<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($22<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bot_A,$1,  $2B<<3,(row0+$12)<<3); // Bot  1


clm3=$20; // Elevator center clm
data_exit(EXU0,etC0,1,  clm3-$04,row_e0,  CLMS4,ROWS5,  clm3-$01,row_e1,  rm_num_+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm3-$04,row_e2,  CLMS4,ROWS5,  clm3-$01,row_e3,  rm_num_+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row0+$0D);                                       // Elevator DW $40, UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXU0_); // RGT 0, 


/*
_dk=rm+STR_Exit+STR_Sequence; _a=0;
g.dm_rm[?_dk+hex_str(++_a)] = rm+EXD0_;
g.dm_rm[?_dk+hex_str(++_a)] = rm+EXR0_;
g.dm_rm[?_dk+hex_str(++_a)] = rm+EXR0_;
g.dm_rm[?_dk+hex_str(++_a)] = rm+EXU0_;
g.dm_rm[?_dk+STR_Count] = _a;
g.dm_rm[?_dk+STR_Complete+STR_Exit+STR_Name] = Area_MazIs+hex_str(rm_num+1)+EXD0_;
*/


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_d0);
data_path_conditions(exit_name_r0, exit_name_u0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_d0);
data_path_conditions(exit_name_l0, exit_name_u0);

data_path_conditions(exit_name_d0, exit_name_r0);
data_path_conditions(exit_name_d0, exit_name_l0);
data_path_conditions(exit_name_d0, exit_name_u0);

data_path_conditions(exit_name_u0, exit_name_r0);
data_path_conditions(exit_name_u0, exit_name_l0);
data_path_conditions(exit_name_u0, exit_name_d0);

data_scene_rando(rm);








//   --------------------------  6F  --------------------------- 
//    Extra scene rando scene. Dungeon, Down Elev on left, Up Elev on right
rm_num  = $6F;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'111');


row3=row0+$10; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
clm3=$0F; clms3=$10; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3+(clms3*_a++))<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3+(clms3*_a++))<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3+(clms3*_a++))<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,DoomA,$1,  $1F<<3,y3); // Doomknocker  1


clm3=$0A; clm4=$36; // Elevator center clm
data_exit(EXU0,etC0,1,  clm4-$04,row_e0,  CLMS4,ROWS5,  clm4-$01,row_e1,  hex_str(rm_num-1)+EXR0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm4,row0+$0C);                                              // Elevator UP $80, 
data_exit(EXD0,etC0,1,  clm3-$04,row_e2,  CLMS4,ROWS5,  clm3-$01,row_e3,  hex_str(rm_num+1)+EXL0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$0F);                                              // Elevator DW $40, UP $80, 


data_path_conditions(exit_name_d0, exit_name_u0);
data_path_conditions(exit_name_u0, exit_name_d0);

data_scene_rando(rm);








//   --------------------------  70  --------------------------- 
//    Extra scene rando scene. Small, left exit only cave
rm_num  = $70;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'112', STR_Dark+'00');


row3=row0+$0C; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0E<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,DeelA,$1,  $16<<3,(row0+$06)<<3); // Deeler  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num+1)+EXL0_); // LFT 0, 


data_scene_rando(rm);








//   --------------------------  71  --------------------------- 
//    Extra scene rando scene. Small, left exit only cave. Secret cucco maze behind FG wall to small cove
rm_num  = $71;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'113', STR_Dark+'00');


row3=row0+$0C; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0E<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,DeelA,$1,  $16<<3,(row0+$06)<<3); // Deeler  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num+1)+EXR0_); // LFT 0, 


//data_scene_rando(rm);








//   --------------------------  72  --------------------------- 
//    Extra scene rando scene. Small cave with relatively long hallway with low ceiling
rm_num  = $72;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'114', STR_Dark+'00');


row3=row0+$14; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $1D<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $33<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,DairA,$1,  $18<<3,y3); // Daira  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $27<<3,(row3+$02)<<3); // Myu  1 


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_scene_rando(rm);








//   --------------------------  73  --------------------------- 
//    Extra scene rando scene. Cave with high and low hallways and a wall in the middle of the low one
rm_num  = $73;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'115', STR_Dark+'00');


row3=row0+$0E; y3=row3<<3;
row4=row0+$16; y4=row4<<3;
row5=row0+$0A; y5=row5<<3;
row6=row4+$02; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0A<<3,(row0+$0F)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $53<<3,(row0+$17)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GiruA,$1,  $20<<3,y5); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $34<<3,y5); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $4C<<3,y5); // Girubokku  1 
//data_spawn(rm+STR_PRXM,DairA,$2,  $67<<3,y4); // Daira  2 
data_spawn(rm+STR_PRXM,GoriA,$2,  $3D<<3,y4); // Goriya  2 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $27<<3,y6); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmE0,$2,  $42<<3,y6); // v2: Magic Jar, Blue(1 container, $10 mp)
_dk_spawn_item1 = data_spawn(rm+STR_PRIO,ItmE0,$2,  $4B<<3,y6); // v2: Magic Jar, Blue(1 container, $10 mp)


data_path_conditions(exit_name_l0, exit_name_r0);

// Omitting this from scene rando because the left item cannot be reached from the right exit
//data_scene_rando(rm);








//   --------------------------  74  --------------------------- 
//    Extra scene rando scene. Short outside dungeon room with 3 pits along its floor
rm_num  = $74;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'116');


row3=row0+$0E; y3=row3<<3;
row4=row0+$04; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);
data_spawn(rm+STR_PRIO,SpDrA,$1,  $17<<3,y4); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $27<<3,y4); // DropSpawner  1


data_exit(EXD0,etA1,1,  $00,row_e2,  clms0,ROWS5,  clms1-$01,row_e3,  hex_str(rm_num+1)+EXL0_); // DWN 0, Pit down 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0, STR_JUMP);
//data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_d0);

data_path_conditions(exit_name_l0, exit_name_r0, STR_JUMP);
//data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_d0);

data_scene_rando(rm);








//   --------------------------  75  --------------------------- 
//    Extra scene rando scene. Short outside dungeon room acending from left to right with 3 liquid pits along its floor
rm_num  = $75;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'117');


row3=row0+$0C; y3=row3<<3;
row4=row0+$00; y4=row4<<3;
row5=row0+$19; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);
data_spawn(rm+STR_PRXM,Bagin01,$1,  $0F<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  $1F<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  $2F<<3,y5); // Bagin


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0, STR_JUMP);

data_scene_rando(rm);








//   --------------------------  76  --------------------------- 
//    Extra scene rando scene. Dungeon hallway with low ceiling, ceiling spikes, and Drop Spawners
rm_num  = $76;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'118', STR_Dark+'00');


row3=row0+$12; y3=row3<<3;
row4=row3+$02; y4=row4<<3;
row5=row0+$08; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $36<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$1,  $13<<3,y5); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $2B<<3,y5); // DropSpawner  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $0F<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $1F<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $2F<<3,y4); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  77  --------------------------- 
//    Extra scene rando scene. Dungeon hallway with low ceiling and ceiling spikes and delicate jumping
rm_num  = $77;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'119');


row3=row0+$0C; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$12; y5=row5<<3;
row6=row0+$0E; y6=row6<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  $07<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $58<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bot_A,$1,  $0C<<3,y5); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $21<<3,y5); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $44<<3,y5); // Bot  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $19<<3,y6); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $29<<3,y6); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $4B<<3,y6); // Lowder  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  78  --------------------------- 
//    Extra scene rando scene. Dungeon entrance.
rm_num  = $78;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'120');


row3=row0+$17; y3=row3<<3;
row4=row0+$13; y4=row4<<3;
row5=row0+$12; y5=row5<<3;
row6=row0+$07; y6=row6<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);
data_spawn(rm+STR_PRIO,SpStA,$2,  $34<<3,(row0+$11)<<3); // SpawnByStab  2
data_spawn(rm+STR_PRIO,SpRoA,$1,  0,0); // RockSpawner  1 
data_spawn(rm+STR_PRXM,Ache01,$1,  $3B<<3,y6); // Ache  1 
data_spawn(rm+STR_PRXM,Ache01,$1,  $49<<3,y6); // Ache  1 
data_spawn(rm+STR_PRXM,Ache01,$1,  $57<<3,y6); // Ache  1 
data_spawn(rm+STR_PRXM,Ache01,$1,  $64<<3,y6); // Ache  1 


clm3=$60; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  hex_str(rm_num+1)+EXL0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row5);                                          // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_d0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_d0);

data_path_conditions(exit_name_d0, exit_name_r0);
data_path_conditions(exit_name_d0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  79  --------------------------- 
//    Extra scene rando scene. Dungeon entrance.
rm_num  = $79;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'121');


row3=row0+$17; y3=row3<<3;
row4=row0+$13; y4=row4<<3;
row5=row0+$10; y5=row5<<3;
row6=row0+$07; y6=row6<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);
data_spawn(rm+STR_PRIO,SpStA,$2,  $3C<<3,(row0+$11)<<3); // SpawnByStab  2
data_spawn(rm+STR_PRXM,Ache01,$1,  $40<<3,y6); // Ache  1 
data_spawn(rm+STR_PRXM,Ache01,$1,  $4F<<3,y6); // Ache  1 
data_spawn(rm+STR_PRXM,Ache01,$1,  $5B<<3,y6); // Ache  1 
data_spawn(rm+STR_PRXM,Ache01,$1,  $66<<3,y6); // Ache  1 
data_spawn(rm+STR_PRXM,Ache01,$1,  $6D<<3,y6); // Ache  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $30<<3,y5); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $4F<<3,y5); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $58<<3,y5); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $61<<3,y5); // Megmat  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  7A  --------------------------- 
//    Extra scene rando scene. Dungeon entrance.
rm_num  = $7A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'122');


row3=row0+$17; y3=row3<<3;
row4=row0+$12; y4=row4<<3;
row5=row0+$13; y5=row5<<3;
row6=row0+$09; y6=row6<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);
data_spawn(rm+STR_PRIO,SpStA,$2,  $34<<3,(row0+$11)<<3); // SpawnByStab  2
data_spawn(rm+STR_PRXM,GoriA,$1,  $50<<3,y5); // Goriya  1 
data_spawn(rm+STR_PRXM,DeelA,$1,  $46<<3,y6); // Deeler  1 
data_spawn(rm+STR_PRXM,DeelA,$1,  $56<<3,y6); // Deeler  1 


clm3=$70; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  hex_str(rm_num+1)+EXL0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row4);                                          // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 


data_path_conditions(exit_name_l0, exit_name_u0);
data_path_conditions(exit_name_u0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  7B  --------------------------- 
//    Extra scene rando scene. Dungeon entrance.
rm_num  = $7B;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'123');


row3=row0+$17; y3=row3<<3;
row4=row0+$13; y4=row4<<3;
row5=row0+$12; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);
data_spawn(rm+STR_PRIO,SpStA,$2,  $34<<3,(row0+$11)<<3); // SpawnByStab  2
data_spawn(rm+STR_PRXM,MoblA,$2,  $48<<3,y4); // Moblin  2 
data_spawn(rm+STR_PRXM,MoblA,$2,  $68<<3,y4); // Moblin  2 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $28<<3,(row0+$19)<<3); // Octorok  1 


clm3=$60; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  hex_str(rm_num-1)+EXL0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row5);                                          // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXU0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_u0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_u0);

data_path_conditions(exit_name_u0, exit_name_r0);
data_path_conditions(exit_name_u0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  7C  --------------------------- 
//    Extra scene rando scene. Dungeon entrance.
rm_num  = $7C;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'124');


row3=row0+$17; y3=row3<<3;
row4=row0+$13; y4=row4<<3;
row5=row0+$12; y5=row5<<3;
row6=row0+$15; y6=row6<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);
data_spawn(rm+STR_PRIO,SpStA,$2,  $34<<3,(row0+$11)<<3); // SpawnByStab  2
data_spawn(rm+STR_PRIO,Blaze01,$2,  $37<<3,(row0+$01)<<3); // Blaze v2
data_spawn(rm+STR_PRXM,Octorok01,$1,  $25<<3,(row0+$19)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $40<<3,y6); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $4F<<3,y6); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $6E<<3,y6); // Octorok  1 


clm3=$60; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  hex_str(rm_num-1)+EXR0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  hex_str(rm_num+1)+EXL0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row5);                                   // Elevator DW $40, UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_d0);
data_path_conditions(exit_name_r0, exit_name_u0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_d0);
data_path_conditions(exit_name_l0, exit_name_u0);

data_path_conditions(exit_name_d0, exit_name_r0);
data_path_conditions(exit_name_d0, exit_name_l0);
data_path_conditions(exit_name_d0, exit_name_u0);

data_path_conditions(exit_name_u0, exit_name_r0);
data_path_conditions(exit_name_u0, exit_name_l0);
data_path_conditions(exit_name_u0, exit_name_d0);

data_scene_rando(rm);








//   --------------------------  7D  --------------------------- 
//    Extra scene rando scene. Dungeon entrance.
rm_num  = $7D;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'125');


row3=row0+$17; y3=row3<<3;
row4=row0+$12; y4=row4<<3;
row5=row0+$11; y5=row5<<3;
row6=row0+$13; y6=row6<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);
data_spawn(rm+STR_PRIO,SpStA,$2,  $34<<3,y5); // SpawnByStab  2
data_spawn(rm+STR_PRIO,SpDrA,$1,  $4C<<3,(row0+$09)<<3); // DropSpawner  1
data_spawn(rm+STR_PRXM,GumaA,$1,  $3F<<3,y6); // Guma  1
data_spawn(rm+STR_PRIO,SpBuA,$2,  $62<<3,(row0+$0D)<<3); // BulletSpawner  2


clm3=$70; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  hex_str(rm_num+1)+EXL0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  hex_str(rm_num+1)+EXL0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row4);                                   // Elevator DW $40, UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 


data_path_conditions(exit_name_l0, exit_name_d0);
data_path_conditions(exit_name_l0, exit_name_u0);

data_path_conditions(exit_name_d0, exit_name_l0);
data_path_conditions(exit_name_d0, exit_name_u0);

data_path_conditions(exit_name_u0, exit_name_l0);
data_path_conditions(exit_name_u0, exit_name_d0);

data_scene_rando(rm);








//   --------------------------  7E  --------------------------- 
//    Extra scene rando scene. Dungeon entrance.
rm_num  = $7E;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'126');


row3=row0+$17; y3=row3<<3;
row4=row0+$12; y4=row4<<3;
row5=row0+$11; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);
data_spawn(rm+STR_PRIO,SpStA,$2,  $18<<3,y5); // SpawnByStab  2
data_spawn(rm+STR_PRIO,SpStA,$2,  $66<<3,y5); // SpawnByStab  2
data_spawn(rm+STR_PRIO,Moa_B,$1,  $3F<<3,(row0+$0F)<<3); // FieryMoa  1
data_spawn(rm+STR_PRXM,Moa_A,$1,  $18<<3,(row0+$15)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $2F<<3,(row0+$13)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $4F<<3,(row0+$13)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $66<<3,(row0+$15)<<3); // Moa  1 


clm3=$40; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  hex_str(rm_num-1)+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row4);                                          // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXD0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_d0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_d0);

data_path_conditions(exit_name_d0, exit_name_r0);
data_path_conditions(exit_name_d0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  7F  --------------------------- 
//    Extra scene rando scene. Dungeon entrance.
rm_num  = $7F;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'127');


row3=row0+$17; y3=row3<<3;
row4=row0+$12; y4=row4<<3;
row5=row0+$11; y5=row5<<3;
row6=row3-$06; y6=row6<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);
data_spawn(rm+STR_PRIO,SpStA,$2,  $2E<<3,y5); // SpawnByStab  2
data_spawn(rm+STR_PRIO,SpStA,$2,  $50<<3,y5); // SpawnByStab  2
data_spawn(rm+STR_PRXM,Moa_A,$1,  $18<<3,(row0+$15)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $66<<3,(row0+$15)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $10<<3,y6); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $18<<3,y6); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $1D<<3,y6); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $60<<3,y6); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $6A<<3,y6); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $71<<3,y6); // Geldarm  1 


clm3=$40; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  hex_str(rm_num+1)+EXL0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row4);                                          // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_d0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_d0);

data_path_conditions(exit_name_d0, exit_name_r0);
data_path_conditions(exit_name_d0, exit_name_l0);

data_scene_rando(rm);




