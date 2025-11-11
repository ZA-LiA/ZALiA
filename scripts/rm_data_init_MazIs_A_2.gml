/// rm_data_init_MazIs_A_2()

// Breaking up `rm_data_init_MazIs_A` because things go slow with it open.


var _i,_j,_k, _a,_b, _w,_h;
var _x,_xl, _y,_yt, _x1,_x2,_x3,_x4, _y1,_y2,_y3,_y4;
var _val,_val1,_val2,_val3,_val4;
var _data,_data1,_data2,_data3,_data4,_data5,_data6;
var _rm, _pages, _dk, _datakey0,_datakey1;
var _len, _dir, _dur, _delay, _dist;
var _pi;
var _file;
var _ow_axis = 0;
var _dk_spawn_item0, _dk_spawn_item1, _dk_spawn_item2, _dk_spawn_item3, _dk_spawn_item4;




var _MapAreaName_MAZE_ISLAND = "MAZE ISLAND";








// -----------------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------------




//   --------------------------  80  --------------------------- 
//    Extra scene rando scene. Dungeon entrance.
rm_num  = $80;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'128');


row3=row0+$17; y3=row3<<3;
row4=row0+$12; y4=row4<<3;
row5=row0+$05; y5=row5<<3;
row6=row0+$19; y6=row6<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);
data_spawn(rm+STR_PRXM,Bot_A,$1,  $1A<<3,y5); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $25<<3,y5); // Bot  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $0E<<3,y6); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $31<<3,y6); // Myu  1 


clm3=$20; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
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








//   --------------------------  81  --------------------------- 
//    Dungeon Scene. Horizontal moving platform with lava below
rm_num  = $81;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'129');


row3=row0+$08; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$16; y5=row5<<3;
row6=row0+$0A; y6=row6<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  ($09<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  ($75<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,BubbA,$2,  $3F<<3,(row0+$06)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,Aneru01,$1,  $14<<3,y6); // Aneru  1
data_spawn(rm+STR_PRXM,Aneru01,$1,  $27<<3,y6); // Aneru  1
data_spawn(rm+STR_PRXM,Aneru01,$1,  $57<<3,y6); // Aneru  1
data_spawn(rm+STR_PRXM,Aneru01,$1,  $6C<<3,y6); // Aneru  1
clms3=$4; _w=clms3<<3;
x3=$35<<3; x4=($4B<<3)-_w; _data=hex_str(y5,4)+hex_str(x3,4) + hex_str(y5,4)+hex_str(x4,4);
data_Platform(PlatformA,$1,  x3,y5,  global.PI_MOB_ORG, 1, 0, _data, $18,$00, _w);


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0, STR_JUMP);
data_path_conditions(exit_name_l0, exit_name_r0, STR_JUMP);

data_scene_rando(rm);








//   --------------------------  82  --------------------------- 
//    Dungeon Scene. Full lava floor with minimal platforms across supported by pillars
rm_num  = $82;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'130');


row3=row0+$0A; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$10; y5=row5<<3;
row6=row0+$01; y6=row6<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  ($09<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  ($75<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$1,  $1E<<3,y6); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $32<<3,y6); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $4D<<3,y6); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $60<<3,y6); // DropSpawner  1
var _DUR = 4; // SpTrC revolution duration
var _PI1 = global.PI_MOB_BLU; // To contrast w/ red walls
_dist=$0A<<3; 
x3=($0F<<3)+4; _a=0;
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  8, 1,_DUR,2*90,STR_Qualified+STR_Quest+STR_Nums+"02"); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  8, 1,_DUR,2*90,STR_Qualified+STR_Quest+STR_Nums+"02"); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
//                                                                          //
data_spin_trap(SpTrC,$1,  x0,               y5,  _PI1,  8, 1,_DUR-1,2*90,STR_Qualified+STR_Quest+STR_Nums+"02"); // SpTrC: spins on chain
//                                                                          //
x3=($48<<3)+4; _a=0;
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  8, 1,_DUR,2*90,STR_Qualified+STR_Quest+STR_Nums+"02"); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  8, 1,_DUR,2*90,STR_Qualified+STR_Quest+STR_Nums+"02"); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  hex_str(rm_num+1)+EXU0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  83  --------------------------- 
//    Dungeon Scene. Tall vertical scene. Zigzag through with several elevators.
rm_num  = $83;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'131', STR_Dark+'00', STR_View+'02');


clm6=$19; x6=clm6<<3;
clm7=$26; x7=clm7<<3;
clm8=$1F; x8=clm8<<3;
row3=$1C; y3=row3<<3;
row4=$40; y4=row4<<3;
row5=$64; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x7,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x7,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x7,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,DoomA,$1,  x8,y3); // Doomknocker  1
data_spawn(rm+STR_PRXM,DoomA,$1,  x8,y4); // Doomknocker  1
data_spawn(rm+STR_PRXM,DoomA,$1,  x8,y5); // Doomknocker  1
data_spawn(rm+STR_PRIO,Blaze01,$2,  $28<<3,$2E<<3); // Blaze v2
data_spawn(rm+STR_PRIO,Blaze01,$2,  $16<<3,$52<<3); // Blaze v2
//data_spawn(rm+STR_PRXM,BubbA,$22,  $28<<3,$2E<<3,  STR_Direction+hex_str($2)); // v$20: Bubble-cling
//data_spawn(rm+STR_PRXM,BubbA,$22,  $16<<3,$52<<3,  STR_Direction+hex_str($1)); // v$20: Bubble-cling
//data_spawn(rm+STR_PRXM,BubbA,$2,  $3F<<3,(row0+$06)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  2


clm3=$0A; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm left  side
clm6=$36; clm7=clm6-$04; clm8=clm6-$01; // clm6: elevator center clm right side
data_exit(EXU0,etC0,1,  clm7,  -$0F,  CLMS4,ROWS5,  clm8,   $05,  hex_str(rm_num-1)+EXR0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm6,$18);                                           // Elevator UP $80, 
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  hex_str(rm_num+1)+EXL0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,$63);                                           // Elevator DW $40, 
//data_Elev(0, clm3,$2B); // Elevator confined w/in scene. Doesn't go to an exit.
//data_Elev(0, clm6,$4F); // Elevator confined w/in scene. Doesn't go to an exit.

// Elevators that don't go to exits:
row5=$60;
_dk = data_spawn(rm+STR_PRIO,ElevA,1, clm6,row5);
_val=EXU0_;
g.dm_spawn[?_dk+STR_Elevator+STR_Spawn+STR_Row+STR_Exit+"01"] = _val;
g.dm_spawn[?_dk+STR_Elevator+STR_Spawn+STR_Row+_val] = $3F;
_val=EXD0_;
g.dm_spawn[?_dk+STR_Elevator+STR_Spawn+STR_Row+STR_Exit+"02"] = _val;
g.dm_spawn[?_dk+STR_Elevator+STR_Spawn+STR_Row+_val] = row5;

row5=$3C;
_dk = data_spawn(rm+STR_PRIO,ElevA,1, clm3,row5);
_val=EXU0_;
g.dm_spawn[?_dk+STR_Elevator+STR_Spawn+STR_Row+STR_Exit+"01"] = _val;
g.dm_spawn[?_dk+STR_Elevator+STR_Spawn+STR_Row+_val] = $1B;
_val=EXD0_;
g.dm_spawn[?_dk+STR_Elevator+STR_Spawn+STR_Row+STR_Exit+"02"] = _val;
g.dm_spawn[?_dk+STR_Elevator+STR_Spawn+STR_Row+_val] = row5;


data_path_conditions(exit_name_d0, exit_name_u0);
data_path_conditions(exit_name_u0, exit_name_d0);

data_scene_rando(rm);








//   --------------------------  84  --------------------------- 
//    Extra scene rando scene. Cave. 'Lost Dungeon' entrance
rm_num  = $84;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'132', STR_Dark+'00');


x3=$57<<3; y3=((row0+$18)<<3)+3;
_data = hex_str((x3>>8)&$FF)+hex_str((x3>>0)&$FF) + hex_str((y3>>8)&$FF)+hex_str((y3>>0)&$FF);
data_NIAO_1a(rm+STR_NIAO+"0",  $0000,1,AdditionalBGGraphics_init,  global.PI_BGR3,  spr_Skull_2a_WRB,0,DEPTH_BG3-1,_data);

row3=row0+$17; y3=row3<<3;
_pi=global.PI_BGR4;
data_spawn(rm+STR_PRIO,TorchA,$3,  $58<<3,y3,  dk_PI+hex_str(_pi)); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$3,  $69<<3,y3,  dk_PI+hex_str(_pi)); // v1: Light w/ CANDLE or FIRE

row3=row0+$14; y3=row3<<3;
row4=row0+$16; y4=row4<<3;
row5=row0+$18; y5=row5<<3;
//row6=row0+$19; y6=row6<<3;
data_spawn(rm+STR_PRXM,Myu_A,$1,  $1C<<3,y5); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $3C<<3,y5); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $44<<3,y5); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $54<<3,y5); // Myu  1 


clm3=$61; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  hex_str(rm_num+1)+EXL0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row3);                                          // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXD0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_d0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_d0);

data_path_conditions(exit_name_d0, exit_name_r0);
data_path_conditions(exit_name_d0, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  85  --------------------------- 
//    Extra scene rando scene. Cave. Dead end ruins at far right
rm_num  = $85;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'133', STR_Dark+'00');


row3=row0+$14; y3=row3<<3; // PC spawn row Left exit
row4=row0+$17; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0D<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$1,  $54<<3,(row0+$0B)<<3,  STR_Type+"02"); // DropSpawner  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  hex_str(rm_num+1)+EXU0_); // LFT 0, 


data_scene_rando(rm);








//   --------------------------  86  --------------------------- 
//    Extra scene rando scene. Scene at bottom of 'Lost Dungeon' elevator entrance
rm_num  = $86;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'134', STR_Dark+'00');


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$14; y5=row5<<3;
row6=row0+$10; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0B<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($13<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($2B<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4B<<3)+4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,StalA,$1,  $2A<<3,y6); // Stalfos  1
data_spawn(rm+STR_PRXM,StalA,$1,  $4A<<3,y6); // Stalfos  1


clm3=$10; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  hex_str(rm_num-1)+EXL0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row5);                                          // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_u0);
data_path_conditions(exit_name_u0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  87  --------------------------- 
//    Extra scene rando scene. Dungeon room, both exits are doors
rm_num  = $87;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'135', STR_Dark+'00');


row3=row0+$14; y3=row3<<3;
row4=row0+$12; y4=row4<<3;
row5=row4-$03; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($12<<3)+4,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($21<<3)+4,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($3D<<3)+4,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+4,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
clm3=clm1-1; x3=clm3<<3;
y5=y4-4-$10;
y6=y5-4-$10;
_val1=hex_str($30); // Speed
_val2=hex_str($3);  // Movement Direction. $1,2 bits: Horizontal, $4,8 bits: Vertical. Include both bits so first movement is towards pc
_val3=hex_str($10); // Idle Duration after hitting solid
data_spawn(rm+STR_PRIO,SpTrA,$1,  x3,y5,  STR_Speed+_val1,STR_Direction+_val2,STR_Duration+_val3, "_Skull"); // SpikeTrapA $1
data_spawn(rm+STR_PRIO,SpTrA,$1,  x3,y6,  STR_Speed+_val1,STR_Direction+_val2,STR_Duration+_val3, "_Skull"); // SpikeTrapA $1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  88  --------------------------- 
//    Extra scene rando scene. Dungeon room, tall room with 2 left exit and non-exit elevator
rm_num  = $88;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'136', STR_Dark+'00', STR_View+'02');


row3=$0A; y3=row3<<3; // PC spawn row Left0 exit
row4=$54; y4=row4<<3; // PC spawn row Left1 exit
row5=$52; y5=row5<<3;
row6=row4+$01; y6=row6<<3;
clm3=$10; clms3=$03; // clm3: elevator center clm
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3-clms3)<<3)-4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3-clms3)<<3)-4,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3+clms3)<<3)-4,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
_dk = data_spawn(rm+STR_PRIO,ElevA,1,  clm3,row5);
_val=EXL0_;
g.dm_spawn[?_dk+STR_Elevator+STR_Spawn+STR_Row+STR_Exit+"01"] = _val;
g.dm_spawn[?_dk+STR_Elevator+STR_Spawn+STR_Row+_val] = $07;

_val=EXL1_;
g.dm_spawn[?_dk+STR_Elevator+STR_Spawn+STR_Row+STR_Exit+"02"] = _val;
g.dm_spawn[?_dk+STR_Elevator+STR_Spawn+STR_Row+_val] = row5;


rows4=$30;
row5=-PAGE_ROWS; rows5=abs(row5)+rows4;
row6=row5+rows4; rows6=(rows0-row6)+PAGE_ROWS;
data_exit(EXL0,etA0,1,  CLM2,row5,  CLMS2,rows5,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXL1,etA0,1,  CLM2,row6,  CLMS2,rows6,  CLM3,row4,  hex_str(rm_num+1)+EXL0_); // LFT 1, 


data_path_conditions(exit_name_l0, exit_name_l1);
data_path_conditions(exit_name_l1, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  89  --------------------------- 
//    Extra scene rando scene. Dungeon entrance forest scene
rm_num  = $89;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'137');


row3=row0+$14; y3=row3<<3;
row4=row0+$10; y4=row4<<3;
row5=row0+$16; y5=row5<<3;
row6=row0+$06; y6=row6<<3;
data_spawn(rm+STR_PRIO,SpStA,$2,  $3A<<3,y5); // SpawnByStab  2
data_spawn(rm+STR_PRXM,Ache01,$1,  $28<<3,y6); // Ache  1 
data_spawn(rm+STR_PRXM,Ache01,$1,  $40<<3,y6); // Ache  1 
data_spawn(rm+STR_PRXM,Ache01,$1,  $50<<3,y6); // Ache  1 
data_spawn(rm+STR_PRXM,Ache01,$1,  $67<<3,y6); // Ache  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXL1_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  8A  --------------------------- 
//    Extra scene rando scene. Dungeon scene with big lava pit and two horizontal moving platforms with spikes in between both
rm_num  = $8A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'138');


row3=row0+$0C; y3=row3<<3;
row4=row0+$12; y4=row4<<3;
//row5=row0+$16; y5=row5<<3;
//row6=row0+$06; y6=row6<<3;
//data_spawn(rm+STR_PRXM,BubbA,$2,  $3F<<3,(row0+$06)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  2
_val1=$10; // hspd
clms3=$4; _w=clms3<<3;
x3=$18<<3; x4=($30<<3)-_w; _data=hex_str(y4,4)+hex_str(x3,4) + hex_str(y4,4)+hex_str(x4,4);
data_Platform(PlatformA,$1,  x3,y4,  global.PI_MOB_ORG, 1, 1, _data, _val1,$00, _w);
x3=$34<<3; x4=($4C<<3)-_w; _data=hex_str(y4,4)+hex_str(x3,4) + hex_str(y4,4)+hex_str(x4,4);
data_Platform(PlatformA,$1,  x3,y4,  global.PI_MOB_ORG, 1, 0, _data, _val1,$00, _w);
x3=$50<<3; x4=($68<<3)-_w; _data=hex_str(y4,4)+hex_str(x3,4) + hex_str(y4,4)+hex_str(x4,4);
data_Platform(PlatformA,$1,  x3,y4,  global.PI_MOB_ORG, 1, 1, _data, _val1,$00, _w);


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXM0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  8B  --------------------------- 
//    Extra scene rando scene. Tiny dungeon room, both exits are doors
rm_num  = $8B;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'139', STR_Dark+'00');


row3=row0+$10; y3=row3<<3;
row4=row0+$14; y4=row4<<3;
//row5=row0+$14; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($1A<<3)+4,(row0+$12)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clm3=$18; clm4=$1E;
data_exit(EXM0,etB0,1,  clm3,row3,  $02,ROWS2,  clm3+1,row3,  hex_str(rm_num-1)+EXR0_); // MID 0, 
data_exit(EXM1,etB0,1,  clm4,row4,  $02,ROWS2,  clm4-1,row4,  hex_str(rm_num+1)+EXL0_); // MID 1, 


data_path_conditions(exit_name_m0, exit_name_m1);
data_path_conditions(exit_name_m1, exit_name_m0);

data_scene_rando(rm);








//   --------------------------  8C  --------------------------- 
//    Extra scene rando scene. Dungeon scene with 2 separated hallways, both with L and R exits
rm_num  = $8C;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'140', STR_Dark+'00');


row3=row0+$06; y3=row3<<3;
row4=row0+$16; y4=row4<<3;
row5=row3+$01; y5=row5<<3;
row6=row4+$01; y6=row6<<3;
row7=row3+$02; y7=row7<<3;
row8=row4+$02; y8=row8<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0B<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $54<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0F<<3)+4,y6); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($1F<<3)+4,y6); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($3F<<3)+4,y6); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4F<<3)+4,y6); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,BubbA,$1,  $20<<3,(row0+$13)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$1,  $3E<<3,(row0+$17)<<3,  STR_Direction+hex_str($1|$8)); // Bubble  2
data_spawn(rm+STR_PRXM,Myu_A,$1,  $10<<3,y7); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $1F<<3,y7); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $2F<<3,y7); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $3F<<3,y7); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $4E<<3,y7); // Myu  1 
data_spawn(rm+STR_PRXM,Aneru01,$1,  $1C<<3,y8); // Aneru  1
data_spawn(rm+STR_PRXM,Aneru01,$1,  $2F<<3,y8); // Aneru  1
data_spawn(rm+STR_PRXM,Aneru01,$1,  $43<<3,y8); // Aneru  1


row5=row0; rows4=$0E;
row6=row5+rows4;
data_exit(EXL0,etA0,1,  CLM2,row5,  CLMS2,rows4,  CLM3,row3,  hex_str(rm_num-1)+EXM1_); // LFT 0, 
data_exit(EXL1,etA0,1,  CLM2,row6,  CLMS2,ROWS6,  CLM3,row4,  rm_num_+EXR0_); // LFT 1, 
data_exit(EXR0,etA0,1,  clm2,row5,  CLMS2,rows4,  clmA,row3,  rm_num_+EXL1_); // RGT 0, 
data_exit(EXR1,etA0,1,  clm2,row6,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 1, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r1, exit_name_l1);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l1, exit_name_r1);

data_scene_rando(rm);








//   --------------------------  8D  --------------------------- 
//    Extra scene rando scene. Dungeon room, short room with 2 left exit and non-exit elevator
rm_num  = $8D;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'141', STR_Dark+'00');


row3=row0+$06; y3=row3<<3; // PC spawn row Left0 exit
row4=row0+$16; y4=row4<<3; // PC spawn row Left1 exit
row5=row3+$01; y5=row5<<3;
row6=row4+$01; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $12<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $1F<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($09<<3)+4,y6); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($13<<3)+4,y6); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($1D<<3)+4,y6); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($27<<3)+4,y6); // v1: Light w/ CANDLE or FIRE

row5=row0+$14;
_dk = data_spawn(rm+STR_PRIO,ElevA,1,  $34,row5);
_val=EXL0_;
g.dm_spawn[?_dk+STR_Elevator+STR_Spawn+STR_Row+STR_Exit+"01"] = _val;
g.dm_spawn[?_dk+STR_Elevator+STR_Spawn+STR_Row+_val] = row0+$03;

_val=EXL1_;
g.dm_spawn[?_dk+STR_Elevator+STR_Spawn+STR_Row+STR_Exit+"02"] = _val;
g.dm_spawn[?_dk+STR_Elevator+STR_Spawn+STR_Row+_val] = row5;


rows4=$0E;
row5=row0-PAGE_ROWS; rows5=abs(row0-row5)+rows4;
row6=row5+rows4; rows6=(rows0-row6)+PAGE_ROWS;
data_exit(EXL0,etA0,1,  CLM2,row5,  CLMS2,rows5,  CLM3,row3,  hex_str(rm_num-1)+EXR1_); // LFT 0, 
data_exit(EXL1,etA0,1,  CLM2,row6,  CLMS2,rows6,  CLM3,row4,  hex_str(rm_num+1)+EXL0_); // LFT 1, 


data_path_conditions(exit_name_l0, exit_name_l1);
data_path_conditions(exit_name_l1, exit_name_l0);

data_scene_rando(rm);








//   --------------------------  8E  --------------------------- 
//    Extra scene rando scene. Dungeon scene with big lava pit and two horizontal moving platforms with spike covered pillars in between both
rm_num  = $8E;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'142');


row3=row0+$0C; y3=row3<<3;
row4=row0+$12; y4=row4<<3;
//row5=row0+$16; y5=row5<<3;
//row6=row0+$06; y6=row6<<3;
//data_spawn(rm+STR_PRXM,BubbA,$2,  $3F<<3,(row0+$06)<<3,  STR_Direction+hex_str($2|$4)); // Bubble  2
_val1=$10; // hspd
clms3=$4; _w=clms3<<3;
x3=$17<<3; x4=($2F<<3)-_w; _data=hex_str(y4,4)+hex_str(x3,4) + hex_str(y4,4)+hex_str(x4,4);
data_Platform(PlatformA,$1,  x3,y4,  global.PI_MOB_ORG, 1, 1, _data, _val1,$00, _w);
x3=$34<<3; x4=($4C<<3)-_w; _data=hex_str(y4,4)+hex_str(x3,4) + hex_str(y4,4)+hex_str(x4,4);
data_Platform(PlatformA,$1,  x3,y4,  global.PI_MOB_ORG, 1, 0, _data, _val1,$00, _w);
x3=$51<<3; x4=($69<<3)-_w; _data=hex_str(y4,4)+hex_str(x3,4) + hex_str(y4,4)+hex_str(x4,4);
data_Platform(PlatformA,$1,  x3,y4,  global.PI_MOB_ORG, 1, 1, _data, _val1,$00, _w);


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXL1_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  8F  --------------------------- 
//    Extra scene rando scene. Dungeon scene with Eyenocc puzzle to get to right exit
rm_num  = $8F;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'143');


row3=row0+$12; y3=row3<<3;
row4=row0+$02; y4=row4<<3;
row5=row0+$16; y5=row5<<3;
_val1=$18; // hspd
clms3=$4; _w=clms3<<3;
x3=$0C<<3; x4=($30<<3)-_w; _data=hex_str(y5,4)+hex_str(x3,4) + hex_str(y5,4)+hex_str(x4,4);
data_Platform(PlatformA,$1,  x3,y5,  global.PI_MOB_ORG, 1, 1, _data, _val1,$00, _w);

clm3=$0A; clm4=$1B; clm5=$2C; clm6=$34;
row6=row0+$04; y6=row6<<3;
row7=row0+$00; y7=row7<<3;
row8=row0+$10; y8=row8<<3;
_data  = object_get_name(Eyenocc)+STR_Sequence;
_data += hex_str(row7)+hex_str(clm3);
_data += hex_str(row7)+hex_str(clm4);
_data += hex_str(row0+$06)+hex_str(clm4);
_data += "_";
_data += hex_str(row7)+hex_str(clm4);
_data += hex_str(row7)+hex_str(clm5);
_data += hex_str(row8)+hex_str(clm5);
_data += hex_str(row8)+hex_str(clm6);
_data += hex_str(row0+$0E)+hex_str(clm6);
_data += "_";
data_spawn(rm+STR_PRIO,Eyenocc,$1,  clm3<<3,row6<<3,  _data); // Eyenocc  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0, STR_JUMP);

data_scene_rando(rm);








//   --------------------------  90  --------------------------- 
//    Extra scene rando scene. Dungeon scene with timed burnable to make it to right exit
rm_num  = $90;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'144', STR_Dark+'00');


row3=row0+$16; y3=row3<<3;
row4=row0+$06; y4=row4<<3;
row5=row3+$01; y5=row5<<3;
clm3=$15; x3=clm3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,(row0+$06)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,(row0+$0C)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,(row0+$12)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,LoDoA,$2,  $24<<3,(row0+$12)<<3,  STR_Side+hex_str($1), STR_Respawn+"01"); // Locked Door
data_spawn(rm+STR_PRIO,SpTrB,$2,  $17<<3,(row0+$00)<<3,  STR_Speed+hex_str(3),STR_Direction+string(-1)); // SpikeTrapB v2: Short, Auto horizontal


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0, STR_FIRE);

data_scene_rando(rm);








//   --------------------------  91  --------------------------- 
//    Extra scene rando scene. Dungeon scene with steep stairs from left to right exit and pitfalls
rm_num  = $91;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'145', STR_View+'02');


row3=$34; y3=row3<<3;
row4=$08; y4=row4<<3;
//row5=$01; y5=row5<<3;
clm3=$0C; x3=clm3<<3;
_data1=hex_str(viewW()-$18,4);
data_spawn(rm+STR_PRIO,SpPoA,$1,  0,0); // BubbleSpawner  1 
data_spawn(rm+STR_PRXM,Snaraa,$1,  x3,$11<<3,  dk_AgroDistance+_data1); // Snaraa
data_spawn(rm+STR_PRXM,Snaraa,$1,  x3,$1D<<3,  dk_AgroDistance+_data1); // Snaraa
data_spawn(rm+STR_PRXM,Snaraa,$1,  x3,$29<<3,  dk_AgroDistance+_data1); // Snaraa


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  92  --------------------------- 
//    Extra scene rando scene. Dungeon scene with steep stairs from left to right exit and pitfalls 2
rm_num  = $92;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'146', STR_View+'02');


row3=$34; y3=row3<<3;
row4=$08; y4=row4<<3;
//row5=$01; y5=row5<<3;
clm3=$0A; x3=clm3<<3;
_data1=hex_str(viewW()-$18,4);
data_spawn(rm+STR_PRIO,SpPoA,$1,  0,0); // BubbleSpawner  1 
data_spawn(rm+STR_PRXM,Snaraa,$1,  x3,$0D<<3,  dk_AgroDistance+_data1); // Snaraa
data_spawn(rm+STR_PRXM,Snaraa,$1,  x3,$15<<3,  dk_AgroDistance+_data1); // Snaraa
data_spawn(rm+STR_PRXM,Snaraa,$1,  x3,$21<<3,  dk_AgroDistance+_data1); // Snaraa
data_spawn(rm+STR_PRXM,Snaraa,$1,  x3,$29<<3,  dk_AgroDistance+_data1); // Snaraa


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  93  --------------------------- 
//    Extra scene rando scene. Dungeon scene outside, even flooring held up by multiple pillars from the bottom of screen
rm_num  = $93;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'147');


row3=row0+$12; y3=row3<<3;
row4=row3+$02; y4=row4<<3;
//row5=$01; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);
data_spawn(rm+STR_PRIO,SpWoA,$1,  $00,$00); // WosuSpawner  1
data_spawn(rm+STR_PRXM,IrKnA,$2,  $1F<<3,y3); // IronKnuckle  2
data_spawn(rm+STR_PRXM,IrKnA,$3,  $3F<<3,y3); // IronKnuckle  3
data_spawn(rm+STR_PRXM,IrKnA,$2,  $5F<<3,y3); // IronKnuckle  2


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  94  --------------------------- 
//    Extra scene rando scene. Dungeon scene lava floor with ascending and decending platforms with small crumble tile platform in middle
rm_num  = $94;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'148');


row3=row0+$10; y3=row3<<3;
row4=row0+$08; y4=row4<<3;
//row5=$01; y5=row5<<3;
data_spawn(rm+STR_PRIO,SpPoA,$1,  0,0); // BubbleSpawner  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $16<<3,y4); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $28<<3,y4); // Bot  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  95  --------------------------- 
//    Extra scene rando scene. Dungeon scene long low ceiling hallway with Balshot01 turrets at the end
rm_num  = $95;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'149', STR_Dark+'00');


row3=row0+$12; y3=row3<<3;
row4=row0+$16; y4=row4<<3;
row5=row3+$01; y5=row5<<3;
clm3=$50; x3=clm3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0A<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $55<<3,y5); // v1: Light w/ CANDLE or FIRE
_val1=$3F;
data_spawn(rm+STR_PRIO,Balshot01,$1,  x3,y4,          STR_Direction+string(-1), STR_Cooldown+hex_str(_val1)); // Balshot01  1 
data_spawn(rm+STR_PRIO,Balshot01,$1,  x3,y4+($02<<3), STR_Direction+string(-1), STR_Cooldown+hex_str(_val1), STR_Delay+hex_str(_val1>>1)); // Balshot01  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  96  --------------------------- 
//    Extra scene rando scene. Dungeon scene long low ceiling hallway with Balshot01 turrets at the end 2
rm_num  = $96;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'150', STR_Dark+'00');


row3=row0+$12; y3=row3<<3;
row4=row0+$0E; y4=row4<<3;
row5=row3+$02; y5=row5<<3;
clm3=$50; x3=clm3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0A<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $55<<3,y5); // v1: Light w/ CANDLE or FIRE
_val1=$3F;
data_spawn(rm+STR_PRIO,Balshot01,$1,  x3,y4,          STR_Direction+string(-1), STR_Cooldown+hex_str(_val1),                              STR_Projectile+STR_Object+object_get_name(Fireball1), STR_Projectile+STR_Attack+STR_Level+"04"); // Balshot01  1 
data_spawn(rm+STR_PRIO,Balshot01,$1,  x3,y4+($02<<3), STR_Direction+string(-1), STR_Cooldown+hex_str(_val1), STR_Delay+hex_str(_val1>>1), STR_Projectile+STR_Object+object_get_name(Fireball1), STR_Projectile+STR_Attack+STR_Level+"04"); // Balshot01  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0, STR_SHIELD+"|"+STR_REFLECT);

data_scene_rando(rm);








//   --------------------------  97  --------------------------- 
//    Extra scene rando scene. Dungeon scene with Balshot01 turret protected by solid wall
rm_num  = $97;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'151', STR_Dark+'00');


row3=row0+$10; y3=row3<<3;
row4=row0+$14; y4=row4<<3;
row5=row0+$16; y5=row5<<3;
row6=row3+$01; y6=row6<<3;
row7=row4+$01; y7=row7<<3;
clm3=$50; x3=clm3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0A<<3,y6); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $24<<3,y7); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $3B<<3,y7); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $55<<3,y6); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,Balshot01,$1,  $12<<3,y5,  STR_Direction+string(1), STR_Cooldown+"3F", STR_Projectile+STR_Object+object_get_name(Fireball1), STR_Projectile+STR_Attack+STR_Level+"04"); // Balshot01  1 
data_spawn(rm+STR_PRXM,GumaA,$1,  $27<<3,y4); // Guma  1
data_spawn(rm+STR_PRXM,GumaA,$1,  $3F<<3,y4); // Guma  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  98  --------------------------- 
//    Extra scene rando scene. Dungeon scene with many high thin solid walls that need JUMP with crumble tiles in between them, and lava under the crumble tiles
rm_num  = $98;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'152');


row3=row0+$10; y3=row3<<3;
row4=row0+$0A; y4=row4<<3;
row5=row0+$13; y5=row5<<3;
row6=row3+$02; y6=row6<<3;
data_spawn(rm+STR_PRXM,Myu_A,$1,  $0B<<3,y6); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $54<<3,y6); // Myu  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0, STR_JUMP);
data_path_conditions(exit_name_l0, exit_name_r0, STR_JUMP);

data_scene_rando(rm);








//   --------------------------  99  --------------------------- 
//    Extra scene rando scene. Dungeon scene with very wide lava pit with Bloobys inbetween that needs JUMP
rm_num  = $99;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'153');


row3=row0+$10; y3=row3<<3;
row4=row3+$02; y4=row4<<3;
//row5=row0+$13; y5=row5<<3;
data_spawn(rm+STR_PRXM,Blooby,$1,  $18<<3,y4,  1,$00); // Blooby 1
data_spawn(rm+STR_PRXM,Blooby,$1,  $27<<3,y4,  1,$00); // Blooby 1
data_spawn(rm+STR_PRXM,Blooby,$1,  $36<<3,y4,  1,$00); // Blooby 1
data_spawn(rm+STR_PRXM,Blooby,$1,  $45<<3,y4,  1,$00); // Blooby 1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXM0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0, STR_JUMP+"+"+STR_STABDOWN);
data_path_conditions(exit_name_l0, exit_name_r0, STR_JUMP+"+"+STR_STABDOWN);

data_scene_rando(rm);








//   --------------------------  9A  --------------------------- 
//    Extra scene rando scene. Vertical dungeon scene with many SmasherTraps lining each side trying to crush pc between them
rm_num  = $9A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'154', STR_View+'02');


row3=$34; y3=row3<<3; // EXM0 pc yt
row4=$02; y4=row4<<3; // EXR0 pc yt
row5=$36; y5=row5<<3; // bottom most trap yc
clms3=$04; _w=clms3<<3; // Smasher w
rows3=$04; _h=rows3<<3; // Smasher h
clm3=$14;  x3=clm3<<3; //  left Smasher head start x
clm4=clm1; x4=clm4<<3; //  left Smasher head end x
clm5=$2C;  x5=clm5<<3; // right Smasher head start x
clm6=clm4; x6=clm6<<3; // right Smasher head end x
_pi=global.PI_BGR2;
_val4=$01; // speed
_delay=$80; _val1=$1C; _val2=$C; _val3=$78;
_data1=STR_Trigger+STR_Position+hex_str($20<<3,4)+hex_str($38<<3,4);
for(_i=0; _i<$0C; _i++)
{
    _y=(row5-(rows3*_i))<<3;
    
    // Left Smasher
    _data="";
    _data+="0000"        +"0000";        // w, h
    _data+=hex_str(x3,4) +hex_str(_y,4); // attack x head start x, attack x head start y
    _data+=hex_str(x4,4) +hex_str(_y,4); // attack x head end x,   attack x head end y
    _data+="0000"        +"0000";        // attack y head start x, attack y head start y
    _data+="0000"        +"0000";        // attack y head end x,   attack y head end y
    data_spawn(rm+STR_PRIO,SmasherTrap01,1,  0,0,  dk_PI+hex_str(_pi), _data1, STR_Speed+hex_str(_val4), STR_Delay+hex_str(_delay,4), STR_Trap+STR_Data+_data);
    
    // Right Smasher
    _data="";
    _data+="0000"        +"0000";        // w, h
    _data+=hex_str(x5,4) +hex_str(_y,4); // attack x head start x, attack x head start y
    _data+=hex_str(x6,4) +hex_str(_y,4); // attack x head end x,   attack x head end y
    _data+="0000"        +"0000";        // attack y head start x, attack y head start y
    _data+="0000"        +"0000";        // attack y head end x,   attack y head end y
    data_spawn(rm+STR_PRIO,SmasherTrap01,1,  0,0,  dk_PI+hex_str(_pi), _data1, STR_Speed+hex_str(_val4), STR_Delay+hex_str(_delay,4), STR_Trap+STR_Data+_data);
    
    _delay+=max(_val1, _val3-(_val2*_i));
}


clm3=$1F;
data_exit(EXM0,etB0,1,  clm3,row3,  $02,ROWS2,  clm3,row3,  hex_str(rm_num-1)+EXR0_); // MID 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXM0_); // RGT 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row4,  hex_str(rm_num+1)+EXM0_); // LFT 0, 


data_path_conditions(exit_name_m0, exit_name_r0);
data_path_conditions(exit_name_m0, exit_name_l0);

data_path_conditions(exit_name_r0, exit_name_m0);
data_path_conditions(exit_name_r0, exit_name_l0);

data_path_conditions(exit_name_l0, exit_name_m0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  9B  --------------------------- 
//    Extra scene rando scene. Vertical dungeon scene with many SmasherTraps lining each side trying to crush pc between them. SmasherTraps are walls
rm_num  = $9B;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'155', STR_View+'02', STR_Dark+'00');


row3=$34; y3=row3<<3; // EXM0 pc yt
row4=$02; y4=row4<<3; // EXR0 pc yt
row5=$03; y5=row5<<3;
row6=$36; y6=row6<<3; // bottom most trap yc
row7=row3+$01; y7=row7<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0B<<3)+4,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($33<<3)+4,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $1D<<3,y7,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $22<<3,y7,  STR_Lit); // v1: Light w/ CANDLE or FIRE
clms3=$20; _w=clms3<<3; // Smasher w
//clms3=$04; _w=clms3<<3; // Smasher w
rows3=$04; _h=rows3<<3; // Smasher h
clm3=$14;  x3=clm3<<3; //  left Smasher head start x
clm4=clm1; x4=clm4<<3; //  left Smasher head end x
clm5=$2C;  x5=clm5<<3; // right Smasher head start x
clm6=clm4; x6=clm6<<3; // right Smasher head end x
_pi=global.PI_BGR1;
_val4=$01; // speed
_delay=$80; _val1=$1C; _val2=$C; _val3=$78;
_data1=STR_Trigger+STR_Position+hex_str($20<<3,4)+hex_str($38<<3,4);
for(_i=0; _i<$0C; _i++)
{
    _y=(row6-(rows3*_i))<<3;
    
    // Left Smasher
    _data="";
    _data+=hex_str(_w,4) +hex_str(_h,4); // w, h
    _data+=hex_str(x3,4) +hex_str(_y,4); // attack x head start x, attack x head start y
    _data+=hex_str(x4,4) +hex_str(_y,4); // attack x head end x,   attack x head end y
    _data+="0000"        +"0000";        // attack y head start x, attack y head start y
    _data+="0000"        +"0000";        // attack y head end x,   attack y head end y
    data_spawn(rm+STR_PRIO,SmasherTrap01,2,  0,0,  dk_PI+hex_str(_pi), _data1, STR_Speed+hex_str(_val4), STR_Delay+hex_str(_delay,4), STR_Trap+STR_Data+_data);
    
    // Right Smasher
    _data="";
    _data+=hex_str(_w,4) +hex_str(_h,4); // w, h
    _data+=hex_str(x5,4) +hex_str(_y,4); // attack x head start x, attack x head start y
    _data+=hex_str(x6,4) +hex_str(_y,4); // attack x head end x,   attack x head end y
    _data+="0000"        +"0000";        // attack y head start x, attack y head start y
    _data+="0000"        +"0000";        // attack y head end x,   attack y head end y
    data_spawn(rm+STR_PRIO,SmasherTrap01,2,  0,0,  dk_PI+hex_str(_pi), _data1, STR_Speed+hex_str(_val4), STR_Delay+hex_str(_delay,4), STR_Trap+STR_Data+_data);
    
    _delay+=max(_val1, _val3-(_val2*_i));
}


clm3=$1F;
data_exit(EXM0,etB0,1,  clm3,row3,  $02,ROWS2,  clm3,row3,  hex_str(rm_num-1)+EXR0_); // MID 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row4,  hex_str(rm_num+1)+EXL0_); // LFT 0, 


data_path_conditions(exit_name_m0, exit_name_r0);
data_path_conditions(exit_name_m0, exit_name_l0);

data_path_conditions(exit_name_r0, exit_name_m0);
data_path_conditions(exit_name_r0, exit_name_l0);

data_path_conditions(exit_name_l0, exit_name_m0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  9C  --------------------------- 
//    Extra scene rando scene. Burnable puzzle with waterfalls that can put out fire unless they're turned off by a switch
rm_num  = $9C;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'156', STR_Dark+'00');


row3=row0+$14; y3=row3<<3;
row4=row0+$08; y4=row4<<3;
row5=row3+$01; y5=row5<<3;
row6=row0+$00; y6=row6<<3;
clm3=$32; x3=clm3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0F<<3,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $2A<<3,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,BlckB,$1,  x3,(row6+$00)<<3,  dk_PI+hex_str(global.PI_BGR2)); // BlockB
data_spawn(rm+STR_PRIO,BlckB,$1,  x3,(row6+$02)<<3,  dk_PI+hex_str(global.PI_BGR2)); // BlockB
data_spawn(rm+STR_PRIO,SwchB,$1,  $2A<<3,(row0+$0F)<<3,  dk_PI+hex_str(global.PI_BGR2)); // 
data_spawn_2a(STR_Challenge,Challenge_SwitchB,$4,  0,0,  global.PI_BGR3);


row7=ROW0; row8=row3-((row3-(row4+$04))>>1);
rows7=row8-row7; rows8=(rows0-row8)+PAGE_ROWS;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,row7,  CLMS2,rows7,  clmA,row4,  hex_str(rm_num+1)+EXL1_); // RGT 0, 
data_exit(EXR1,etA0,1,  clm2,row8,  CLMS2,rows8,  clmA,row3,  rm_num_+EXL0_); // RGT 1, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_r1);

data_path_conditions(exit_name_r1, exit_name_l0);

data_path_conditions(exit_name_l0, exit_name_r0, STR_JUMP+"+"+STR_FIRE);
data_path_conditions(exit_name_l0, exit_name_r1);

data_scene_rando(rm);








//   --------------------------  9D  --------------------------- 
//    Extra scene rando scene. Dungeon scene with right+left exits, and high up right+left exits accessable only from adjacent rooms
rm_num  = $9D;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'157', STR_Dark+'00');


row3=row0+$16; y3=row3<<3;
row4=row0+$04; y4=row4<<3;
row5=row3+$01; y5=row5<<3;
row6=row4+$01; y6=row6<<3;
row7=row0+$0C; y7=row7<<3;
row8=row4+$02; y8=row8<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $76<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $1E<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $23<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $32<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $37<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $48<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $4D<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $5C<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $61<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($20<<3)+4,y6); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($34<<3)+4,y6); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4A<<3)+4,y6); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($5E<<3)+4,y6); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$1,  $34<<3,y7); // Drop spawner 1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $4A<<3,y7); // Drop spawner 1
data_spawn(rm+STR_PRXM,BoBoA,$1,  $1E<<3,y7); // BossBot  1
data_spawn(rm+STR_PRXM,BoBoA,$1,  $5C<<3,y7); // BossBot  1
data_spawn(rm+STR_PRXM,Aneru01,$1,  $34<<3,y8); // Aneru  1
data_spawn(rm+STR_PRXM,Aneru01,$1,  $4A<<3,y8); // Aneru  1
//data_spin_trap(FiRoA,1,  $60<<3,y4,  -1,  8,1,4, 2*90); // Firerope
//data_spawn(rm+STR_PRIO,SpDrA,$2,  $67<<3,y4); // Drop spawner v2. Drops Flame1
//data_spawn(rm+STR_PRXM,FokuA,$1,  $36<<3,(row0+$13)<<3); // Fokkeru  1
//data_spawn(rm+STR_PRXM,BubbA,$2,  $76<<3,(row5+$02)<<3); // Bubble  2


row6=row0+$0A; rows6=(rows0-row6)+PAGE_ROWS;
row5=-PAGE_ROWS; rows5=row6-row5;
data_exit(EXL0,etA0,1,  CLM2,row5,  CLMS2,rows5,  CLM3,row4,  rm_num_+EXR1_); // LFT 0, 
data_exit(EXL1,etA0,1,  CLM2,row6,  CLMS2,rows6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 1, 
data_exit(EXR0,etA0,1,  clm2,row5,  CLMS2,rows5,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 
data_exit(EXR1,etA0,1,  clm2,row6,  CLMS2,rows6,  clmA,row3,  rm_num_+EXL0_); // RGT 1, 


data_path_conditions(exit_name_r0, exit_name_r1);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_l1);

data_path_conditions(exit_name_r1, exit_name_l1);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, exit_name_r1);
data_path_conditions(exit_name_l0, exit_name_l1);

data_path_conditions(exit_name_l1, exit_name_r1);

data_scene_rando(rm);








//   --------------------------  9E  --------------------------- 
//    Extra scene rando scene. Outside scene with beach on left, walkable water on bottom, high dungeon wall on right requiring Eyenocc
rm_num  = $9E;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'158');


row3=row0+$14; y3=row3<<3;
row4=row0+$00; y4=row4<<3;
row5=row0+$1A; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1',  $0000,  3,StarSky_1_init);
data_spawn(rm+STR_PRIO,SpStA,$1,  $54<<3,(row0+$12)<<3); // SpawnByStab  2
data_spawn(rm+STR_PRXM,Boon01,$1,  $1E<<3,(row0+$08)<<3); // Boon  1 
data_spawn(rm+STR_PRXM,Boon01,$1,  $40<<3,(row0+$08)<<3); // Boon  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $22<<3,y5); // Octorok  1
data_spawn(rm+STR_PRXM,Octorok01,$1,  $34<<3,y5); // Octorok  1
data_spawn(rm+STR_PRXM,Octorok01,$1,  $48<<3,y5); // Octorok  1
data_spawn(rm+STR_PRXM,Octorok01,$1,  $51<<3,(row0+$16)<<3); // Octorok  1

clm3=$3A; clm4=$48; clm5=$54;
row6=row0+$02; y6=row6<<3;
row7=row0+$0D; y7=row7<<3;
_data  = object_get_name(Eyenocc)+STR_Sequence;
_data += hex_str(row6)+hex_str(clm4);
_data += hex_str(row7)+hex_str(clm4);
_data += hex_str(row7)+hex_str(clm5);
_data += "_";
data_spawn(rm+STR_PRIO,Eyenocc,$1,  clm3<<3,row6<<3,  _data); // Eyenocc  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXR1_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0, STR_JUMP+"+"+STR_STABUP);

data_scene_rando(rm);








//   --------------------------  9F  --------------------------- 
//    Extra scene rando scene. Tall dungeon with lava pit and 2 vertical moving platforms
rm_num  = $9F;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'159', STR_View+'02');


row3=$0C; y3=row3<<3;
row4=$54; y4=row4<<3;
_val1=$10; // vspd
clms3=$3; _w=clms3<<3;
x3=($0C<<3)+4; y5=$30<<3; y6=$58<<3; _data=hex_str(y5,4)+hex_str(x3,4) + hex_str(y6,4)+hex_str(x3,4);
data_Platform(PlatformA,$1,  x3,y5,  global.PI_MOB_ORG, 1, 1, _data, $00,_val1, _w);
x3=($28<<3)+4; y5=$10<<3; y6=$30<<3; _data=hex_str(y5,4)+hex_str(x3,4) + hex_str(y6,4)+hex_str(x3,4);
data_Platform(PlatformA,$1,  x3,y5,  global.PI_MOB_ORG, 1, 1, _data, $00,_val1, _w);


row6=$30; rows6=(rows0-row6)+PAGE_ROWS;
row5=-PAGE_ROWS; rows5=row6-row5;
data_exit(EXR0,etA0,1,  clm2,row5,  CLMS2,rows5,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 
data_exit(EXR1,etA0,1,  clm2,row6,  CLMS2,rows6,  clmA,row4,  hex_str(rm_num-1)+EXR0_); // RGT 1, 


data_path_conditions(exit_name_r0, exit_name_r1);
data_path_conditions(exit_name_r1, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  A0  --------------------------- 
//    Extra scene rando scene. Need to lure enemy to switch to open locked door
rm_num  = $A0;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'160', STR_Dark+'00');


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0-$02; y5=row5<<3;
clm3=$4C; x3=clm3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0B<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $54<<3,y4); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,LoDoA,$2,  $48<<3,(row0+$14)<<3); // LockedDoor
data_spawn(rm+STR_PRXM,Octorok01,$2,  x3,y5); // Octorok  1
//data_spawn(rm+STR_PRXM,Bot_A,$1,  x3,y5); // Bot  1 
data_spawn(rm+STR_PRIO,SwchB,$1,  $4A<<3,(row0+$09)<<3,  dk_PI+hex_str(global.PI_BGR2), "_Other_Objects_Can_Press"); // Can be pressed by enemy
data_spawn_2a(STR_Challenge,Challenge_SwitchB,$1,  $4C<<3,(row0+$14)<<3); // xy is locked door xy. Challenge will spawn locked door


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  A1  --------------------------- 
//    Extra scene rando scene. Dungeon with spikes that come out of floor
rm_num  = $A1;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'161', STR_Dark+'00');


row3=row0+$12; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$18; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0B<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $34<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpikeTrapD,$1,  $16<<3,y5,  STR_Depth+string(val(g.dm_TILE_DEPTH[?"BG03"])), "_Spike"+STR_Count+hex_str($14), STR_Attack+STR_Direction+"08");
//data_spawn(rm+STR_PRXM,Octorok01,$2,  x3,y5); // Octorok  1
//data_spawn(rm+STR_PRXM,Bot_A,$1,  x3,y5); // Bot  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  A2  --------------------------- 
//    Extra scene rando scene. Dungeon with several groups of spikes that alternate attacking
rm_num  = $A2;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'162', STR_Dark+'00');


row3=row0+$12; y3=row3<<3;
row4=row3+$00; y4=row4<<3;
row5=row0+$18; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $07<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $10<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $4F<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $58<<3,y4); // v1: Light w/ CANDLE or FIRE
_clm3=$18; _clms3=$08; _i=0;
_data1=STR_Depth+string(val(g.dm_TILE_DEPTH[?"BG03"]));
_data2="_Spike"+STR_Count+hex_str(_clms3);
_data3=STR_Attack+STR_Direction+"08";
_val1=$60;
_data4=STR_Cooldown+STR_Duration+hex_str(_val1);
_data5=STR_Attack+STR_Duration+hex_str(_val1);
repeat(6) data_spawn(rm+STR_PRIO,SpikeTrapD,$1,  (_clm3+(_clms3*_i++))<<3,y5,  _data1, _data2, _data3, _data4, _data5, "_SubState"+hex_str(1+(_i&$1)));
data_spawn(rm+STR_PRXM,Moa_B,$1,  (clm1-$01)<<3,(row0+$0B)<<3); // FieryMoa  1
//data_spawn(rm+STR_PRXM,Bot_A,$1,  x3,y5); // Bot  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  A3  --------------------------- 
//    Extra scene rando scene. Outside, tall ledge to right exit, bgr dungeon wall ruins
rm_num  = $A3;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'163');


row3=row0+$16; y3=row3<<3;
row4=row0+$00; y4=row4<<3;
row5=row3+$02; y5=row5<<3;
data_spawn(rm+STR_PRXM,Boon01,$1,  (clm1-$01)<<3,(row0+$08)<<3); // Boon  1 
//data_spawn(rm+STR_PRXM,Octorok01,$2,  x3,y5); // Octorok  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $27<<3,y5); // Bot  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  A4  --------------------------- 
//    Extra scene rando scene. Dungeon hallway with ceiling SmasherTrap over item
rm_num  = $A4;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'164', STR_Dark+'00');


row3=row0+$14; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$0C; y5=row5<<3;
x3=($10<<3)+4; _dist=$10<<3; _i=0;
repeat(4) data_spawn(rm+STR_PRIO,TorchA,$1,  x3+(_i++*_dist),y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$1,  $28<<3,y5); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $48<<3,y5); // DropSpawner  1
//data_spawn(rm+STR_PRXM,Octorok01,$2,  x3,y5); // Octorok  1
//data_spawn(rm+STR_PRXM,Bot_A,$1,  $27<<3,y5); // Bot  1 
//row5=row0+$0C; y5=row5<<3; // trap yb
//rows3=row5; _h=rows3<<3; // Smasher h
row6=row0+$0C; y6=row6<<3; //  Smasher head start y
row7=row0+$18; y7=row7<<3; //  Smasher head end y
clm3=$60; x3=clm3<<3; // Smasher head xc
clms3=$20; _w=clms3<<3; // Smasher w
rows3=$20; _h=rows3<<3; // Smasher h
_data1=hex_str($6C<<3,4)+hex_str((row0+$18)<<3,4); // trigger xl, yt
//_data1=hex_str($6E<<3,4)+hex_str((row0+$18)<<3,4); // trigger xl, yt
_data2=hex_str($02<<3,4)+hex_str($02<<3,4); // trigger w, h
_data="";
_data+=hex_str(_w,4) +hex_str(_h,4); // w, h
_data+="0000"        +"0000";        // attack x head start x, attack x head start y
_data+="0000"        +"0000";        // attack x head end x,   attack x head end y
_data+=hex_str(x3,4) +hex_str(y6,4); // attack y head start x, attack y head start y
_data+=hex_str(x3,4) +hex_str(y7,4); // attack y head end x,   attack y head end y
data_spawn(rm+STR_PRIO,SmasherTrap01,2,  0,0,  dk_PI+hex_str(global.PI_BGR1), STR_Trigger+STR_Type+"02", STR_Trigger+STR_Position+_data1, STR_Trigger+STR_Size+_data2, STR_Trigger+STR_Depth+string(DEPTH_BG3), STR_Speed+hex_str($01), STR_Delay+hex_str($50,4), STR_Trap+STR_Data+_data);


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num+1)+EXR0_); // LFT 0, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmE0,$1,  ($6E<<3)+2,y4); // Magic Jar (Full)


data_path_conditions(exit_name_l0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  A5  --------------------------- 
//    Extra scene rando scene. Forest with many bushes and broken trees in background
rm_num  = $A5;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'165');


row3=row0+$17; y3=row3<<3;
//row4=row0+$03; y4=row4<<3;
_i=0;
//data_NIAO_1a(rm+STR_NIAO+string(_i++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_i++), $0000, 1,StarSky_1_init);
data_spawn(rm+STR_PRXM,MagoA,$1,  $1B<<3,y3); // Mago  1
data_spawn(rm+STR_PRXM,MagoA,$1,  $43<<3,y3); // Mago  1
//data_spawn(rm+STR_PRXM,Ache01,$1,  $31<<3,(row0+$05)<<3); // Ache  1 
//data_spawn(rm+STR_PRXM,Bot_A,$1,  $20<<3,(row0+$08)<<3); // Bot  1


clm3=clm1-$01;
data_exit(EXM0,etB0,1,  clm3,row3,  $02,ROWS2,  clm3-1,row3,  hex_str(rm_num+1)+EXM0_); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num-1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_m0, exit_name_r0);
data_path_conditions(exit_name_m0, exit_name_l0);

data_path_conditions(exit_name_r0, exit_name_m0);
data_path_conditions(exit_name_r0, exit_name_l0);

data_path_conditions(exit_name_l0, exit_name_m0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  A6  --------------------------- 
//    Extra scene rando scene. Halloween spooky house outside scene
rm_num  = $A6;
set_rm_data(area+hex_str(rm_num), STR_Overworld+dk_MazeIsland, STR_Tile+area_MI+'166');


row3=row0+$16; y3=row3<<3;
row4=row0+$15; y4=row4<<3;
row5=row0+$19; y5=row5<<3;
_i=0;
data_NIAO_1a(rm+STR_NIAO+string(_i++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_i++), $0000, 1,StarSky_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_i++), $0000, 1,Moon1_init);
//data_NIAO_1a(rm+STR_NIAO+string(_i++), $0000, 1,Jackolantern1_init, -1,  $0F<<3,y5, DEPTH_BG1-1);
data_NIAO_1a(rm+STR_NIAO+string(_i++), $0000, 1,Jackolantern1_init, -1,  $1B<<3,y5, DEPTH_BG1-1);
data_NIAO_1a(rm+STR_NIAO+string(_i++), $0000, 1,Jackolantern1_init, -1,  $2B<<3,y5, DEPTH_BG1-1);
data_NIAO_1a(rm+STR_NIAO+string(_i++), $0000, 1,Jackolantern1_init, -1,  $1D<<3,(row0+$06)<<3, DEPTH_BG1-1);
_data  = hex_str(($0C<<3)+4,4)+hex_str(((row0+$17)<<3)+0,4);
_data += hex_str(($2A<<3)+4,4)+hex_str(((row0+$12)<<3)+4,4);
data_NIAO_1a(rm+STR_NIAO+string(_i++), $0000, 1,AdditionalBGGraphics_init,  global.PI_BGR1,  spr_Skull_2a_WRB,0,DEPTH_BG3-1,_data);
_data  = hex_str(($25<<3)+0,4)+hex_str(((row0+$15)<<3)+0,4);
data_NIAO_1a(rm+STR_NIAO+string(_i++), $0000, 1,AdditionalBGGraphics_init,  global.PI_MOB_ORG,  spr_Item_Child,0,DEPTH_BG3-1,_data);
//data_spawn(rm+STR_PRIO,TorchA,$3,  ($0B<<3)+4,y4,  STR_Lit); // 
data_spawn(rm+STR_PRIO,TorchA,$3,  $16<<3,y4,  STR_Lit); // 
data_spawn(rm+STR_PRXM,Moa_A,$3,  clm1<<3,(row0+$09)<<3); // Moa  3 
//data_spawn(rm+STR_PRXM,Ache01,$1,  $31<<3,(row0+$05)<<3); // Ache  1 
//data_spawn(rm+STR_PRXM,Bot_A,$1,  $30<<3,(row3+$02)<<3); // Bot  1


clm3=$10;
clms3=$05; clm4=clms3-$01; clm5=clms0-clms3-$01;
data_exit(EXM0,etB0,1,  clm3,row3,  $02,ROWS2,  clm3+$01,row3,  hex_str(rm_num-1)+EXM0_); // MID 0, 
data_exit(EXL0,etA0,1,  clm4,ROW0,  CLMS2,ROWS6,  clm4+$04,row3,  hex_str(rm_num+1)+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm5,ROW0,  CLMS2,ROWS6,  clm5-$04,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_m0, exit_name_r0);
data_path_conditions(exit_name_m0, exit_name_l0);

data_path_conditions(exit_name_r0, exit_name_m0);
data_path_conditions(exit_name_r0, exit_name_l0);

data_path_conditions(exit_name_l0, exit_name_m0);
data_path_conditions(exit_name_l0, exit_name_r0);

//data_scene_rando(rm);








//   --------------------------  A7  --------------------------- 
//    Extra scene rando scene. Burnable puzzle with waterfalls that can put out fire unless they're turned off by a switch
rm_num  = $A7;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'167', STR_Dark+'00');


row3=row0+$14; y3=row3<<3;
row4=row0+$08; y4=row4<<3;
row5=row3+$01; y5=row5<<3;
row6=row0+$00; y6=row6<<3;
clm3=$32; x3=clm3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0F<<3,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $2A<<3,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SwchB,$1,  $2A<<3,(row0+$0F)<<3,  dk_PI+hex_str(global.PI_BGR2)); // 
data_spawn_2a(STR_Challenge,Challenge_SwitchB,$4,  0,0,  global.PI_BGR3);


row7=ROW0; row8=row3-((row3-(row4+$04))>>1);
rows7=row8-row7; rows8=(rows0-row8)+PAGE_ROWS;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXM0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,row7,  CLMS2,rows7,  clmA,row4,  hex_str(rm_num+1)+EXL0_); // RGT 0, 
data_exit(EXR1,etA0,1,  clm2,row8,  CLMS2,rows8,  clmA,row3,  rm_num_+EXL0_); // RGT 1, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, exit_name_r1);

data_path_conditions(exit_name_r1, exit_name_l0);

data_path_conditions(exit_name_l0, exit_name_r0, STR_JUMP+"+"+STR_FIRE);
data_path_conditions(exit_name_l0, exit_name_r1);

data_scene_rando(rm);








//   --------------------------  A8  --------------------------- 
//    Extra scene rando scene. Hallway spike challenge with ceileing spikes
rm_num  = $A8;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'168', STR_Dark+'00');


row3=row0+$10; y3=row3<<3;
row4=row0+$14; y4=row4<<3;
row5=row4+$01; y5=row5<<3;
row6=row4+$04; y6=row6<<3;
row7=row4+$02; y7=row7<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0D<<3)+4,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($13<<3)+4,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($6B<<3)+4,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($71<<3)+4,y5); // v1: Light w/ CANDLE or FIRE
_clms3=$08;
_data1=STR_Depth+string(val(g.dm_TILE_DEPTH[?"BG03"]));
_data2="_Spike"+STR_Count+hex_str(_clms3);
_data3=STR_Attack+STR_Direction+"08"; 
_data4=STR_Cooldown+STR_Duration+hex_str($60);
_data5=STR_Attack+STR_Duration+hex_str($60);
data_spawn(rm+STR_PRIO,SpikeTrapD,$1,  $18<<3,y6,  _data1, _data2, _data3, _data4, _data5, "_SubState"+"01");
data_spawn(rm+STR_PRIO,SpikeTrapD,$1,  $24<<3,y6,  _data1, _data2, _data3, _data4, _data5, "_SubState"+"01");
data_spawn(rm+STR_PRIO,SpikeTrapD,$1,  $30<<3,y6,  _data1, _data2, _data3, _data4, _data5, "_SubState"+"01");
data_spawn(rm+STR_PRIO,SpikeTrapD,$1,  $48<<3,y6,  _data1, _data2, _data3, _data4, _data5, "_SubState"+"01");
data_spawn(rm+STR_PRIO,SpikeTrapD,$1,  $54<<3,y6,  _data1, _data2, _data3, _data4, _data5, "_SubState"+"01");
data_spawn(rm+STR_PRIO,SpikeTrapD,$1,  $60<<3,y6,  _data1, _data2, _data3, _data4, _data5, "_SubState"+"01");
data_spawn(rm+STR_PRXM,Aneru01,$1,  $14<<3,y7); // Aneru  1
data_spawn(rm+STR_PRXM,Aneru01,$1,  $3A<<3,y7); // Aneru  1
data_spawn(rm+STR_PRXM,Aneru01,$1,  $44<<3,y7); // Aneru  1
data_spawn(rm+STR_PRXM,Aneru01,$1,  $6A<<3,y7); // Aneru  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  A9  --------------------------- 
//    Extra scene rando scene. Liquid pit with platforms across that have internittent spikes
rm_num  = $A9;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'169', STR_Dark+'00');


row3=row0+$10; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$0E; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($09<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($27<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($3F<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($57<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($75<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpPoA,$1,  0,0); // BubbleSpawner  1 
//data_spawn(rm+STR_PRXM,Ra__A,$1,  $38<<3,y5); // Ra  1
//data_spawn(rm+STR_PRXM,Ra__A,$1,  $46<<3,y5); // Ra  1
_clms3=$04;
_data1=STR_Depth+string(val(g.dm_TILE_DEPTH[?"BG03"]));
_data2="_Spike"+STR_Count+hex_str(_clms3);
_data3=STR_Attack+STR_Direction+"08"; 
_data4=STR_Cooldown+STR_Duration+hex_str($60);
_data5=STR_Attack+STR_Duration+hex_str($60);
data_spawn(rm+STR_PRIO,SpikeTrapD,$1,  $1A<<3,y3,  _data1, _data2, _data3, _data4, _data5, "_SubState"+"01");
data_spawn(rm+STR_PRIO,SpikeTrapD,$1,  $32<<3,y3,  _data1, _data2, _data3, _data4, _data5, "_SubState"+"01");
data_spawn(rm+STR_PRIO,SpikeTrapD,$1,  $4A<<3,y3,  _data1, _data2, _data3, _data4, _data5, "_SubState"+"01");
data_spawn(rm+STR_PRIO,SpikeTrapD,$1,  $62<<3,y3,  _data1, _data2, _data3, _data4, _data5, "_SubState"+"01");


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  AA  --------------------------- 
//    Extra scene rando scene. Need 2 switches pressed by Cling Bubbles
rm_num  = $AA;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'170', STR_Dark+'00');


row3=row0+$14; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$0D; y5=row5<<3;
row6=row0+$02; y6=(row6<<3)-4;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0B<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $34<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,BubbA,$20,  $18<<3,y6,  STR_Direction+hex_str($2)); // v$20: Bubble-cling
data_spawn(rm+STR_PRXM,BubbA,$20,  $26<<3,y6,  STR_Direction+hex_str($1)); // v$20: Bubble-cling
data_spawn(rm+STR_PRIO,SwchB,$1,  $06<<3,y5,  dk_PI+hex_str(global.PI_BGR2), "_Other_Objects_Can_Press"); // Can be pressed by enemy
data_spawn(rm+STR_PRIO,SwchB,$1,  $38<<3,y5,  dk_PI+hex_str(global.PI_BGR2), "_Other_Objects_Can_Press"); // Can be pressed by enemy
data_spawn_2a(STR_Challenge,Challenge_SwitchB,$1,  $28<<3,(row0+$12)<<3); // xy is locked door xy. Challenge will spawn locked door


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  hex_str(rm_num+1)+EXL0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0, STR_GLOVE+"+"+STR_STABDOWN);

data_scene_rando(rm);








//   --------------------------  AB  --------------------------- 
//    Extra scene rando scene. A long bridge of only 1 tile deep break blocks with a lava pit under it. Breaking any blocks is dangerous
rm_num  = $AB;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'171');


row3=row0+$0C; y3=row3<<3;
row4=row3+$02; y4=row4<<3;
row5=row3+$01; y5=row5<<3;
row6=row3-$02; y6=row6<<3; // For Ra
//row6=row0+$02; y6=row6<<3; // For Tektites
row7=row0+$06; y7=(row7<<3)+4;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($07<<3)+4,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($77<<3)+4,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//Atta, Bago, Bot, Bubble, Moa, Myu, Octorok, Ra,
//data_spawn(rm+STR_PRXM,TektA,$1,  ($27)<<3,y6); // Tektite  1 
//data_spawn(rm+STR_PRXM,TektA,$1,  ($3F)<<3,y6); // Tektite  1 
//data_spawn(rm+STR_PRXM,TektA,$1,  ($57)<<3,y6); // Tektite  1 
//data_spawn(rm+STR_PRXM,TektA,$1,  (clm1-$01)<<3,(row0+$02)<<3); // Tektite  1 
data_spawn(rm+STR_PRXM,BubbA,$22,  $27<<3,y7,  STR_Direction+hex_str($2)); // v$20: Bubble-cling
data_spawn(rm+STR_PRXM,BubbA,$22,  $37<<3,y7,  STR_Direction+hex_str($2)); // v$20: Bubble-cling
data_spawn(rm+STR_PRXM,BubbA,$22,  $47<<3,y7,  STR_Direction+hex_str($2)); // v$20: Bubble-cling
data_spawn(rm+STR_PRXM,BubbA,$22,  $57<<3,y7,  STR_Direction+hex_str($2)); // v$20: Bubble-cling
/*
data_spawn(rm+STR_PRXM,BubbA,$22,  $27<<3,y7,  STR_Direction+hex_str($2), "_TowardsPC"+hex_str($3)); // v$20: Bubble-cling
data_spawn(rm+STR_PRXM,BubbA,$22,  $37<<3,y7,  STR_Direction+hex_str($2), "_TowardsPC"+hex_str($3)); // v$20: Bubble-cling
data_spawn(rm+STR_PRXM,BubbA,$22,  $47<<3,y7,  STR_Direction+hex_str($2), "_TowardsPC"+hex_str($3)); // v$20: Bubble-cling
data_spawn(rm+STR_PRXM,BubbA,$22,  $57<<3,y7,  STR_Direction+hex_str($2), "_TowardsPC"+hex_str($3)); // v$20: Bubble-cling
*/
data_spawn(rm+STR_PRXM,Ra__A,$1,  $27<<3,y6); // Ra  1
data_spawn(rm+STR_PRXM,Ra__A,$1,  $37<<3,y6); // Ra  1
data_spawn(rm+STR_PRXM,Ra__A,$1,  $47<<3,y6); // Ra  1
data_spawn(rm+STR_PRXM,Ra__A,$1,  $57<<3,y6); // Ra  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $1F<<3,y4); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $2F<<3,y4); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $3F<<3,y4); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $4F<<3,y4); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $5F<<3,y4); // Bot  1 
//data_spawn(rm+STR_PRXM,Moa_A,$3,  clm1<<3,(row0+$09)<<3); // Moa  3 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  hex_str(rm_num-1)+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  rm_num_+EXR0_); // RGT 0, 


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);




