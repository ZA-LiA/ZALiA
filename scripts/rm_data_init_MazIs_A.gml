/// rm_data_init_MazIs_A()


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






// ------------------------------ MAZE ISLAND ------------------------------ 
area = area_MI;










//   --------------------------  00  --------------------------- 
//    Bridge to Maze Island
rm_num  = $00;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'021', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND);


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);
y3=(row0+$19)<<3; x3=($22<<3)+4; _val=$1F;   _a=0;
data_spawn(rm+STR_PRXM,Bagin01,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  x3+(_val*_a++),y3); // Bagin
//                                                              //
data_spawn(rm+STR_PRXM,Bagin01,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,Bagin01,$1,  x3+(_val*_a++),y3); // Bagin


row3=row0+$08;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_path_conditions(exit_name_r0, exit_name_l0, STR_STABDOWN);
data_path_conditions(exit_name_l0, exit_name_r0, STR_STABDOWN);

data_scene_rando(rm);








//   --------------------------  01  --------------------------- 
//    Outside. 
rm_num  = $01;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'001', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm_name+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
data_spawn(rm+STR_PRXM,Octorok01,$2,  $20<<3,(row0+$14)<<3); // Octorok  2
data_spawn(rm+STR_PRXM,Octorok01,$2,  $4C<<3,(row0+$10)<<3); // Octorok  2
data_spawn(rm+STR_PRXM,Octorok01,$2,  $5C<<3,(row0+$10)<<3); // Octorok  2
data_spawn(rm+STR_PRXM,TektA,$1,  $62<<3,(row0+$0C)<<3); // Tektite  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$16,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0A,  0); // RGT 0, to Overworld


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  02  --------------------------- 
//    Outside. 
rm_num  = $02;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'001', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm_name + STR_NIAO + '0', $0000, 1, Cloud_1_init); //   
data_spawn(rm+STR_PRXM,ZoraA,$1,  $2E<<3,(row0+$12)<<3); // $AE: Zora  1
data_spawn(rm+STR_PRXM,TektA,$1,  $40<<3,(row0+$10)<<3); // $AB: Tektite  1
data_spawn(rm+STR_PRXM,TektA,$1,  $68<<3,(row0+$0C)<<3); // $AB: Tektite  1

data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$16,  0);        // LFT 0, to Overworld  
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$0A,  0);        // RGT 0, to Overworld  


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  03  --------------------------- 
//    Cave.
rm_num  = $03;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_MI+'002', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,(row0+$0B)<<3); // v1: Light w/ CANDLE or FIRE


data_exit(EXU0,etA0,0,  $26,row_e0,  $08,ROWS5,  $2D,$02,  0); // UP  0, Pit up, to Overworld 
//data_exit(EXU0,etA0,0,  $1E,row_e0,  CLMS5,ROWS5,  $2D,$02,  0); // UP  0, Pit up, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0A,  0); // LFT 0, to Overworld 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  ($34<<3)-2,(row0+$18)<<3,  STR_Treasure+STR_Map+"02"); // MAGIC PIECE


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01"+STR_Pit+"8",rm);
//data_path_conditions(exit_name_l0, exit_name_l0);
data_path_conditions(exit_name_l0, _dk_spawn_item0);

data_path_conditions(exit_name_u0, exit_name_l0);
data_path_conditions(exit_name_u0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  04  --------------------------- 
//    Cave.
rm_num  = $04;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_MI+'003', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,(row0+$0B)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $38<<3,(row0+$17)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GeruA,$2,  $50<<3,(row0+$16)<<3); // Geru  2


data_exit(EXU0,etA0,0,  $2C,row_e0,  $08,ROWS5,  $2F,row_e4,  0); // UP  0, Pit up to Overworld
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0A,  0); // LFT 0, to Overworld


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmC4,$1,  ($77<<3)-3,(row0+$16)<<3); // CHILD


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01"+STR_Pit+"8",rm);
//data_path_conditions(exit_name_l0, exit_name_l0);
data_path_conditions(exit_name_l0, _dk_spawn_item0);

data_path_conditions(exit_name_u0, exit_name_l0);
data_path_conditions(exit_name_u0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  05  --------------------------- 
//    Outside. 
rm_num  = $05;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'000', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm_name + STR_NIAO + '0', $0000, 1, Cloud_1_init); //   
data_spawn(rm+STR_PRXM,ZoraA,$1,  $200,$B0); // $AE: Zora  1
data_spawn(rm+STR_PRXM,ZoraA,$1,  $240,$B0); // $AE: Zora  1
data_spawn(rm+STR_PRXM,TektA,$1,  $320,$B0); // $AB: Tektite  1

data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$16,  0);        // LFT 0, to Overworld  
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$16,  0);        // RGT 0, to Overworld  


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  06  --------------------------- 
//    Outside. 
rm_num  = $06;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'000', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm_name + STR_NIAO + '0', $0000, 1, Cloud_1_init); //  $2F
data_spawn(rm+STR_PRXM,ZoraA,$1,  $A0,$B0); // $AE: Zora  1
data_spawn(rm+STR_PRXM,ZoraA,$1,  $240,$B0); // $AE: Zora  1
data_spawn(rm+STR_PRXM,ZoraA,$1,  $280,$B0); // $AE: Zora  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$16,  0);        // LFT 0, to Overworld  
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$16,  0);        // RGT 0, to Overworld  


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  07  --------------------------- 
//    Outside. 
rm_num  = $07;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'004', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm_name + STR_NIAO + '0', $0000, 1, Cloud_1_init); // $30
data_spawn(rm+STR_PRXM,Bot_A,$1,  $A0,$80); // $8E: Bot  1
data_spawn(rm+STR_PRXM,ZoraA,$1,  $180,$B0); // $AE: Zora  1
data_spawn(rm+STR_PRXM,ZoraA,$1,  $1A0,$B0); // $AE: Zora  1
data_spawn(rm+STR_PRXM,TektA,$1,  $300,$B0); // $AB: Tektite  1

data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$16,  0);        // LFT 0, to Overworld  
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$16,  0);        // RGT 0, to Overworld  


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  08  --------------------------- 
//    Outside. 
rm_num  = $08;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'004', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm_name + STR_NIAO + '0', $0000, 1, Cloud_1_init); // $30
data_spawn(rm+STR_PRXM,Octorok01,$1,  $D0,$60); // $A8: Octorok  1
data_spawn(rm+STR_PRXM,TektA,$1,  $F0,$70); // $AB: Tektite  1
data_spawn(rm+STR_PRXM,Octorok01,$1,  $2A0,$80); // $A8: Octorok  1
data_spawn(rm+STR_PRXM,TektA,$1,  $2D0,$90); // $AB: Tektite  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$16,  0);        // LFT 0, to Overworld  
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$16,  0);        // RGT 0, to Overworld  


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmE0,$1,  $200,$90); // Magic Jar (Full)


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00"+STR_JAR,rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, _dk_spawn_item0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  09  --------------------------- 
//    Outside. 
rm_num  = $09;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'006', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init); // 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $12<<3,(row0+$06)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $40<<3,(row0+$0A)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $6E<<3,(row0+$10)<<3); // Moa  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $0C<<3,(row0+$08)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $4E<<3,(row0+$10)<<3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $62<<3,(row0+$12)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $24<<3,(row0+$16)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $30<<3,(row0+$16)<<3); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$06,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$14,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,Kakusu010,$1,  $10<<3,(row0+$16)<<3,  STR_Treasure+STR_Map+"02"); // Hiding in Ra statue. Invisible & Still until damaged.


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








//   --------------------------  0A  --------------------------- 
//    Outside. Shoals.
rm_num  = $0A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'016', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init); // 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$18,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$18,  0); // RGT 0, to Overworld 


y3=(row0+$0E)<<3;
_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmG0,$1,  $2A<<3,y3,  STR_Treasure+STR_Map+"02"); // Extra Life Doll 
//data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  $2A<<3,y3,  STR_Treasure+STR_Map+"02"); // MAGIC PIECE


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_r0, _dk_spawn_item0);

data_path_conditions(exit_name_l0, exit_name_r0);
data_path_conditions(exit_name_l0, _dk_spawn_item0);

data_scene_rando(rm);








//   --------------------------  0B  --------------------------- 
//    


//   --------------------------  0C  --------------------------- 
//    


//   --------------------------  0D  --------------------------- 
//    


//   --------------------------  0E  --------------------------- 
//    


//   --------------------------  0F  --------------------------- 
//    


//   --------------------------  10  --------------------------- 
//    


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


// Breaking up `rm_data_init_MazIs_A` because things go slow with it open.
rm_data_init_MazIs_A_1(); // These are the extra Scene Rando scenes $40-7F
rm_data_init_MazIs_A_2(); // These are the extra Scene Rando scenes $80-









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


//   -----------------------------------------------------------
mus0 = STR_Dungeon+'01';
//mus0 = MUS_DUNGEON1;
var _DARK_DATA=STR_Dark+"01";
ow_axis =  0; // 0:horizontal, 1:vertical
_ow_axis = STR_ow_axis+'00';
var _Pushable_PI = global.PI_BGR4;
var _COLUMN_TYPE='02'; // 2: Midoro Palace

//   --------------------------  B0  --------------------------- 
//    PalcZ. Entrance
rm_num  = $B0;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, _DARK_DATA, STR_Tile+area_PZ+'000', _ow_axis);


row3=row0+$14; y3=row3<<3; // PC spawn row Left exit
row4=row0+$16; y4=row4<<3; // PC spawn row Right exit
row5=row0+$17; y5=row5<<3;

x3=$57<<3;
y3=((row0+$18)<<3)+3;
_data = hex_str((x3>>8)&$FF)+hex_str((x3>>0)&$FF) + hex_str((y3>>8)&$FF)+hex_str((y3>>0)&$FF);
data_NIAO_1a(rm+STR_NIAO+"0",  $0000,1,AdditionalBGGraphics_init,  global.PI_BGR3,  spr_Skull_2a_WRB,0,DEPTH_BG3-1,_data);

_pi=global.PI_BGR4;
data_spawn(rm+STR_PRIO,TorchA,$3,  $58<<3,y5,  dk_PI+hex_str(_pi)); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$3,  $69<<3,y5,  dk_PI+hex_str(_pi)); // v1: Light w/ CANDLE or FIRE


clm3=$61; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  'B3'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$14);                                               // Elevator DW $40, 
_exit1=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  'B1'+EXL0_); // RGT 0, 








//   --------------------------  B1  --------------------------- 
//    PalcZ. Right of entrance scene. Cave scene w/ large pit down
rm_num  = $B1;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, _DARK_DATA, STR_Tile+area_PZ+'007', _ow_axis);


row3=row0+$0C; y3=row3<<3; // PC spawn row Left+Right exit
//row4=row0+$16; y4=row4<<3;
//row5=row0+$17; y5=row5<<3;
//


clms3=clms0+(PAGE_CLMS<<1); clm3=-PAGE_CLMS;
_exit=data_exit(EXD0,etA1,1,  clm3,row_e2,  clms3,ROWS5,  clms1,row_e3,  _exit1); // DWN 0, Pit down 
//data_pit(_exit, 0,8);
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  'B0'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  'B2'+EXL0_); // RGT 0, 








//   --------------------------  B2  --------------------------- 
//    PalcZ. Right of entrance scene. 
rm_num  = $B2;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, _DARK_DATA, STR_Tile+area_PZ+'002', _ow_axis);


row3=row0+$14; y3=row3<<3; // PC spawn row Left exit
row4=row3+$03; y4=row4<<3;
//row5=row0+$17; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0D<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$1,  $54 <<3,(row0+$0B)<<3,  STR_Type+_COLUMN_TYPE); // DropSpawner  1
//data_spawn(rm+STR_PRIO,SpDrA,$1,  $5E<<3,(row0+$0B)<<3,  STR_Type+_COLUMN_TYPE); // DropSpawner  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  'B1'+EXR0_); // LFT 0, 








//   --------------------------  B3  --------------------------- 
//    PalcZ. Elevator shaft to entrance.
rm_num  = $B3;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'001', _ow_axis);


row3=row0+$14; y3=row3<<3;
//row4=row0+$16; y4=row4<<3;
//row5=row0+$17; y5=row5<<3;

clm3=$20; // clm3: elevator center clm
rows3=$0C;
x4 = (clm3-$07)<<3;
x5 = (clm3+$06)<<3;
y3 = $0A<<3;
y4 = y3+(rows3<<3);
y5 = y4+(rows3<<3);
y6 = y5+(rows3<<3);
y7 = y6+(rows3<<3);
_pi=global.PI_BGR4;
data_spawn(rm+STR_PRIO,TorchA,$3,  x4,y3,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x5,y3,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x4,y4,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x5,y4,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x4,y5,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x5,y5,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x4,y6,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x5,y6,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x4,y7,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x5,y7,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
_dist=($01<<3)+2;
x4-=$01<<3;  x4 = hex_str((x4>>8)&$FF)+hex_str((x4>>0)&$FF);
x5+=$02<<3;  x5 = hex_str((x5>>8)&$FF)+hex_str((x5>>0)&$FF);
y3+=_dist;   y3 = hex_str((y3>>8)&$FF)+hex_str((y3>>0)&$FF);
y4+=_dist;   y4 = hex_str((y4>>8)&$FF)+hex_str((y4>>0)&$FF);
y5+=_dist;   y5 = hex_str((y5>>8)&$FF)+hex_str((y5>>0)&$FF);
y6+=_dist;   y6 = hex_str((y6>>8)&$FF)+hex_str((y6>>0)&$FF);
y7+=_dist;   y7 = hex_str((y7>>8)&$FF)+hex_str((y7>>0)&$FF);
_data  = x4+y3 + x5+y3;
_data += x4+y4 + x5+y4;
_data += x4+y5 + x5+y5;
_data += x4+y6 + x5+y6;
_data += x4+y7 + x5+y7;
data_NIAO_1a(rm+STR_NIAO+"0",  $0000,1,AdditionalBGGraphics_init,  global.PI_BGR3,  spr_Skull_2a_WRB,0,DEPTH_BG3-1,_data);


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  'B0'+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  'B4'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row0+$15);                                        // Elevator DW $40, UP $80, 








//   --------------------------  B4  --------------------------- 
//    PalcZ. Bottom of elevator shaft to entrance.
rm_num  = $B4;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'003', _ow_axis);


row3=row0+$16; y3=row3<<3; // PC spawn row Right exit
row4=row3+$01; y4=row4<<3;
row5=row0+$0A; y5=row5<<3;

clm3=$10; x3=clm3<<3; clms3=$03; // clm3: elevator center clm
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3-clms3)<<3)-4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3+clms3)<<3)-4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$1,  $2B<<3,y5,  STR_Type+_COLUMN_TYPE); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $4B<<3,y5,  STR_Type+_COLUMN_TYPE); // DropSpawner  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  'B3'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row_e5);                                                 // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  'B5'+EXL0_); // RGT 0, 








//   --------------------------  B5  --------------------------- 
//    PalcZ. Depress switches to unlock door challenge.
rm_num  = $B5;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'004', _ow_axis);


row3=row0+$14; y3=row3<<3; // PC spawn row Left+Right exit
row4=row3+$01; y4=row4<<3;
row5=row0+$1B; y5=row5<<3;
row6=row0+$12; y6=row6<<3;
row7=row0+$13; y7=row7<<3;
_dist=($0B<<3)+4;
data_spawn(rm+STR_PRIO,TorchA,$1,       _dist-4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  rm_w-_dist-8,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($26<<3)+4,y7,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($38<<3)+4,y7,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,PushA,$3,  $22<<3,(row0+$16)<<3,  dk_PI+hex_str(_Pushable_PI)); // Pushable
data_spawn(rm+STR_PRIO,SwchB,$1,  $22<<3,y5,  dk_PI+hex_str(global.PI_BGR2)); // 
data_spawn(rm+STR_PRIO,SwchB,$1,  $3C<<3,y5,  dk_PI+hex_str(global.PI_BGR2)); // 
data_spawn_2a(STR_Challenge,Challenge_SwitchB,$3,  $00<<3,(row0+$00)<<3,  -1);


clms4=$02; clm4=clm1-(clms4>>1);
data_exit(EXU0,etA4,0,  $00,row_e0,  clms0,ROWS5,  $20,row_e4,  'B6'+EXD0_); // UP  0, Pit up 
data_exit(EXM0,etB0,0,  clm4,row6,  clms4,ROWS2,  clm4-1,row6,  'B8'+EXM0_, 1); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  'B4'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  'B7'+EXL1_); // RGT 0, 








//   --------------------------  B6  --------------------------- 
//    PalcZ. Pushable origin scene
rm_num  = $B6;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'005', _ow_axis);


row3=row0+$16; y3=row3<<3; // PC spawn row Right exit
row4=row3+$01; y4=row4<<3;
//row5=row0+$17; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($10<<3)-4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($20<<3)-4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($40<<3)-4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($50<<3)-4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE

_dk=data_spawn(rm+STR_PRIO,PushA,$3,  $17<<3,(row0+$12)<<3,  dk_PI+hex_str(_Pushable_PI)); // Pushable
data_spawn(rm+STR_PRIO,PushableRefresher,$1,  $06<<3,(row0+$14)<<3,  dk_PI+hex_str(global.PI_BGR1),  object_get_name(PushA)+dk_SpawnDatakey+_dk);

clms3=clms0; clm3=$00;
_exit=data_exit(EXD0,etA1,1,  clm3,row_e2,  clms3,ROWS5,  clms1,row_e3,  'B5'+EXU0_); // DWN 0, Pit down 
//data_pit(_exit, 0,8);
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  'B7'+EXL0_); // RGT 0, 








//   --------------------------  B7  --------------------------- 
//    PalcZ. Elevator shaft
/*
rm_num  = $B7;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'006', STR_View+'02', _ow_axis);


row3=$0A; y3=row3<<3; // PC spawn row Left0 exit
row4=$54; y4=row4<<3; // PC spawn row Left1 exit
row5=$52; y5=row5<<3;
row6=row4+$01; y6=row6<<3;
clm3=$10; clms3=$03; // clm3: elevator center clm
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3-clms3)<<3)-4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3-clms3)<<3)-4,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3+clms3)<<3)-4,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE

clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
_dk=data_spawn(rm+STR_PRIO,ElevA,1,  clm3,row5);
g.dm_spawn[?_dk+STR_Elevator+STR_Spawn+STR_Row+EXL0_] = $07;
g.dm_spawn[?_dk+STR_Elevator+STR_Spawn+STR_Row+EXL1_] = row5;


//data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  0); // UP  0, Elevator up  
//data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  0); // DWN 0, Elevator down 
//data_Elev(EXD0_+EXU0_,  clm3,row0+$15);                                        // Elevator DW $40, UP $80, 
rows3=$08; rows4=rows3<<1;
data_exit(EXL0,etA0,1,  CLM2,row3-rows3,  CLMS2,rows4,  CLM3,row3,  'B6'+EXR0_); // LFT 0, 
data_exit(EXL1,etA0,1,  CLM2,row4-rows3,  CLMS2,rows4,  CLM3,row4,  'B5'+EXR0_); // LFT 1, 
*/








//   --------------------------  B8  --------------------------- 
//    
rm_num  = $B8;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'009', _ow_axis);


row3=row0+$13; y3=row3<<3; // PC spawn row
row4=row0+$0F; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($17<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($27<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($37<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($47<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
/* // Next to doors
data_spawn(rm+STR_PRIO,TorchA,$1,  $0E<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $13<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $4C<<3,y7,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $51<<3,y7,  STR_Lit); // v1: Light w/ CANDLE or FIRE
*/

clm3=clm1-1; x3=clm3<<3;
y5=row4<<3;
y6=y5-($03<<3);
//y5=(row3+$02)<<3; y5-=2;
//y6=y5-$10; y6-=4;
_val1=hex_str($28); // Speed
_val2=hex_str($3);  // Movement Direction. $1,2 bits: Horizontal, $4,8 bits: Vertical. Include both bits so first movement is towards pc
_val3=hex_str($28); // Idle Duration after hitting solid
data_spawn(rm+STR_PRIO,SpTrA,$1,  x3,y5,  STR_Speed+_val1,STR_Direction+_val2,STR_Duration+_val3, "_Skull"); // SpikeTrapA $1
data_spawn(rm+STR_PRIO,SpTrA,$1,  x3,y6,  STR_Speed+_val1,STR_Direction+_val2,STR_Duration+_val3, "_Skull"); // SpikeTrapA $1


clm3=$0D; clm4=$51; clms3=$02;
data_exit(EXM0,etB0,1,  clm3,row3,  clms3,ROWS2,  clm3+1,row3,  rm_num_+EXM1_, 0); // MID 0, 
data_exit(EXM1,etB0,1,  clm4,row3,  clms3,ROWS2,  clm4-1,row3,  'B9'+EXR0_, 0); // MID 1, 








//   --------------------------  B9  --------------------------- 
//    
rm_num  = $B9;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'010', STR_View+'02', _ow_axis);


row3=$08; y3=row3<<3; // PC spawn row Right exit
row4=row3+$01; y4=row4<<3;
row5=$74; y5=row5<<3; // PC spawn row Mid exit
data_spawn(rm+STR_PRIO,TorchA,$1,  $34<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($20<<3)-4,$77<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clms4=$02; clm4=$2A;
//clms4=$02; clm4=clm1-(clms4>>1);
data_exit(EXM0,etB0,1,  clm4,row5,  clms4,ROWS2,  clm4-1,row5,  'BA'+EXM0_, 0); // MID 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  'B8'+EXM1_); // RGT 0, 








//   --------------------------  BA  --------------------------- 
//    
rm_num  = $BA;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'011', STR_View+'02', _ow_axis);


row3=$08; y3=row3<<3; // PC spawn row Right exit
row4=row3+$01; y4=row4<<3;
row5=$6E; y5=row5<<3; // PC spawn row Mid exit
data_spawn(rm+STR_PRIO,TorchA,$1,  $34<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  ($20<<3)-4,$77<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,Backwall01,$1,  $00<<3,$7A<<3,  STR_Depth+string(DEPTH_FG2-1), STR_Min+'_Y'+hex_str($0D<<3), STR_Direction+'08', STR_Speed+'08', STR_Delay+'80'); // Backwall01 $1


clms4=$02; clm4=clm1-$01;
//clms4=$02; clm4=clm1-(clms4>>1);
data_exit(EXM0,etB0,0,  clm4,row6,  clms4,ROWS2,  clm4-1,row5,  'B9'+EXM0_, 1); // MID 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  'BB'+EXL0_); // RGT 0, 








//   --------------------------  BB  --------------------------- 
//    
rm_num  = $BB;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'016', _ow_axis);


row3=row0+$0E; y3=row3<<3; // PC spawn row Right,Left exit
row4=row3+$02; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($1C<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($22<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clm3=clm1; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  rm_num_+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  rm_num_+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row0+$0D);                               // Elevator DW $40, UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  'BA'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  rm_num_+EXL0_); // RGT 0, 

_dk=rm+STR_Exit+STR_Sequence; _a=0;
g.dm_rm[?_dk+hex_str(++_a)] = rm+EXD0_;
g.dm_rm[?_dk+hex_str(++_a)] = rm+EXR0_;
g.dm_rm[?_dk+hex_str(++_a)] = rm+EXR0_;
g.dm_rm[?_dk+hex_str(++_a)] = rm+EXU0_;
g.dm_rm[?_dk+STR_Count] = _a;
g.dm_rm[?_dk+STR_Complete+STR_Exit+STR_Name] = Area_MazIs+hex_str(rm_num+1)+EXD0_;








//   --------------------------  BC  --------------------------- 
//    
rm_num  = $BC;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'020', STR_View+'02', _ow_axis);


clm6=$19; x6=clm6<<3;
clm7=$26; x7=clm7<<3;
row3=$1C; y3=row3<<3;
row4=$40; y4=row4<<3;
row5=$64; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x7,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x7,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x7,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clm3=$0A; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm left  side
clm6=$36; clm7=clm6-$04; clm8=clm6-$01; // clm6: elevator center clm right side
data_exit(EXU0,etC0,1,  clm7,row_e0,  CLMS4,ROWS5,  clm8,row_e1,  rm_num_+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_,  clm6,$18); // Elevator UP $80, 
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  'BB'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,$63); // Elevator DW $40, 

data_Elev(0,  clm3,$2B); // Elevator confined w/in scene. Doesn't go to an exit.
data_Elev(0,  clm6,$4F); // Elevator confined w/in scene. Doesn't go to an exit.
//    


//   --------------------------  BD  --------------------------- 
//    


//   --------------------------  BE  --------------------------- 
//    


//   --------------------------  BF  --------------------------- 
//    


//   --------------------------  C0  --------------------------- 
//    Using this for viewing old unused Tiled files
rm_num  = $C0;
set_rm_data(area+hex_str(rm_num), STR_Basement, STR_Tile+RM_NPALACE_FILE_NAME);


if (g.FileCleaning01_STATE) g.FileCleaning01_rm_name = rm;
row3=row0+$14; y3=row3<<3;
row4=row0+$10; y4=row4<<3;
row5=$1C; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $10<<3,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $12<<3,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clm3=$1E;
data_exit(EXM0,etB0,0,  clm3,row4,  $02,ROWS2,  clm3-1,row4,  rm_num_+EXM0_); // MID 0, 
//data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
//data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  C1  --------------------------- 
//    Testing: 


//   --------------------------  C2  --------------------------- 
//    Testing: 


//   --------------------------  C3  --------------------------- 
//    Testing: 


//   --------------------------  C4  --------------------------- 
//    Testing: 


//   --------------------------  C5  --------------------------- 
//    Testing: 


//   --------------------------  C6  --------------------------- 
//    Testing: 


//   --------------------------  C7  --------------------------- 
//    Testing: 


//   --------------------------  C8  --------------------------- 
//    Testing: 


//   --------------------------  C9  --------------------------- 
//    Testing: 


//   --------------------------  CA  --------------------------- 
//    Testing: 


//   --------------------------  CB  --------------------------- 
//    Testing: 


//   --------------------------  CC  --------------------------- 
//    Testing: 


//   --------------------------  CD  --------------------------- 
//    Testing: 


//   --------------------------  CE  --------------------------- 
//    Testing: 


//   --------------------------  CF  --------------------------- 
//    Testing: 


//   --------------------------  D0  --------------------------- 
//    Testing: 


//   --------------------------  D1  --------------------------- 
//    Testing: 


//   --------------------------  D2  --------------------------- 
//    Testing: 


//   --------------------------  D3  --------------------------- 
//    Testing: 


//   --------------------------  D4  --------------------------- 
//    Testing: 


//   --------------------------  D5  --------------------------- 
//    Testing: 


//   --------------------------  D6  --------------------------- 
//    Testing: 


//   --------------------------  D7  --------------------------- 
//    Testing: 


//   --------------------------  D8  --------------------------- 
//    Testing: 


//   --------------------------  D9  --------------------------- 
//    Testing: 


//   --------------------------  DA  --------------------------- 
//    Testing: 


//   --------------------------  DB  --------------------------- 
//    Testing: 


//   --------------------------  DC  --------------------------- 
//    Testing: 


//   --------------------------  DD  --------------------------- 
//    Testing: 


//   --------------------------  DE  --------------------------- 
//    Testing: 


//   --------------------------  DF  --------------------------- 
//    Testing: 


//   --------------------------  E0  --------------------------- 
//    
rm_num  = $E0;


//   --------------------------  E1  --------------------------- 
//    
rm_num  = $E1;


//   --------------------------  E2  --------------------------- 
//    
rm_num  = $E2;


//   --------------------------  E3  --------------------------- 
//    
rm_num  = $E3;


//   --------------------------  E4  --------------------------- 
//    
rm_num  = $E4;


//   --------------------------  E5  --------------------------- 
//    
rm_num  = $E5;


//   --------------------------  E6  --------------------------- 
//    
rm_num  = $E6;


//   --------------------------  E7  --------------------------- 
//    
rm_num  = $E7;


//   --------------------------  E8  --------------------------- 
//    
rm_num  = $E8;


//   --------------------------  E9  --------------------------- 
//    
rm_num  = $E9;


//   --------------------------  EA  --------------------------- 
//    
rm_num  = $EA;


//   --------------------------  EB  --------------------------- 
//    
rm_num  = $EB;


//   --------------------------  EC  --------------------------- 
//    Testing: Blooby platforming challenge. BloobyPlatforming_000.tmx
rm_num  = $EC;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'216', STR_View+'00', STR_ow_axis+'00');


row3=$56; y3=row3<<3;
row4=$04; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRIO,Blooby,$2,  $2B<<3,$52<<3); // Blooby 2
data_spawn(rm+STR_PRIO,Blooby,$2,  $30<<3,$48<<3); // Blooby 2

data_spawn(rm+STR_PRIO,Blooby,$2,  $0A<<3,$3C<<3); // Blooby 2
data_spawn(rm+STR_PRIO,Blooby,$2,  $16<<3,$3A<<3); // Blooby 2

data_spawn(rm+STR_PRIO,Blooby,$2,  $24<<3,$30<<3); // Blooby 2
data_spawn(rm+STR_PRIO,Blooby,$2,  $2A<<3,$28<<3); // Blooby 2
data_spawn(rm+STR_PRIO,Blooby,$2,  $1D<<3,$27<<3); // Blooby 2

data_spawn(rm+STR_PRIO,Blooby,$2,  $1A<<3,$16<<3); // Blooby 2
data_spawn(rm+STR_PRIO,Blooby,$2,  $24<<3,$11<<3); // Blooby 2
data_spawn(rm+STR_PRIO,Blooby,$2,  $2E<<3,$0D<<3); // Blooby 2
//data_spawn(rm+STR_PRIO,Blooby,$1,  $1F<<3,(row0+$15)<<3,  1,$00); // Blooby 1

if(0){// For testing hyper hspd from stabbing a Blooby
data_spawn(rm+STR_PRIO,Blooby,$2,  $18<<3,$56<<3); // Blooby 2
data_spawn(rm+STR_PRIO,Blooby,$2,  $1E<<3,$56<<3); // Blooby 2
data_spawn(rm+STR_PRIO,Blooby,$2,  $14<<3,$58<<3); // Blooby 2
data_spawn(rm+STR_PRIO,Blooby,$2,  $26<<3,$58<<3); // Blooby 2
}

data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  ED  --------------------------- 
//    Testing: Eyenocc. DownstabChallenge_000.tmx
rm_num  = $ED;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'218', STR_ow_axis+'00');


row3=row0+$14; y3=row3<<3; // PC spawn row Left exit
row4=row0+$00; y4=row4<<3; // PC spawn row Right exit
row5=row0+$0F; y5=row5<<3;
row6=row0+$01; y6=row6<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
clm3=$73;
clm4=clm3-$03;
row7=row6+$0C;
_val  =object_get_name(Eyenocc)+STR_Sequence;
_val += hex_str(row7)+hex_str(clm3);
_val += hex_str(row7)+hex_str(clm4);
_val += "_";
data_spawn(rm+STR_PRIO,Eyenocc,$1,  clm3<<3,row6<<3,  _val); // Eyenocc  1 

data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  EE  --------------------------- 
//    Testing: Burnables Puzzle 2
rm_num  = $EE;
set_rm_data(area+hex_str(rm_num), STR_Dungeon+"01", STR_Tile+area_MI+'217', STR_ow_axis+'00');


row3=row0+$14; y3=row3<<3; // PC spawn row Left exit
row4=row0+$06; y4=row4<<3; // PC spawn row Right exit
row5=row0+$16; y5=row5<<3;
//row6=row0+$08; y6=row6<<3;
data_spawn(rm+STR_PRIO,PushA,$2,  $5C<<3,(row0-$02)<<3,  dk_PI+hex_str(global.PI_BGR4)); // Pushable
data_spawn(rm+STR_PRXM,Octorok01,$1,  $20<<3,y5); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $30<<3,y5); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $40<<3,y5); // Octorok  1 
data_spawn(rm+STR_PRXM,Octorok01,$1,  $50<<3,y5); // Octorok  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  EF  --------------------------- 
//    Testing: Downstab pogo across room
rm_num  = $EF;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'218', STR_ow_axis+'00');


row3=row0+$14; y3=row3<<3; // PC spawn row Left exit
row4=row0+$00; y4=row4<<3; // PC spawn row Right exit
row5=row0+$0F; y5=row5<<3;
//row6=row0+$08; y6=row6<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
var _PI1=global.PI_MOB_BLU;
var _DUR=4; // SpTrC revolution duration
data_spin_trap(SpTrC,$1,  $30<<3,(row0+$10)<<3,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  $50<<3,(row0+$0C)<<3,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  $70<<3,(row0+$08)<<3,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spawn(rm+STR_PRIO,Blooby,$1,  $1F<<3,(row0+$15)<<3,  1,$00); // Blooby 1
data_spawn(rm+STR_PRIO,Blooby,$1,  $3F<<3,y5,  1,$00); // Blooby 1
data_spawn(rm+STR_PRIO,Blooby,$1,  $5F<<3,y5,  1,$00); // Blooby 1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  F0  --------------------------- 
//    Testing: Burnables Puzzle 1
rm_num  = $F0;
set_rm_data(area+hex_str(rm_num), STR_Dungeon+"01", STR_Tile+area_MI+'219', STR_ow_axis+'00');


row3=row0+$16; y3=row3<<3; // PC spawn row Left exit
row4=row0+$12; y4=row4<<3; // PC spawn row Right exit
row5=row0+$00; y5=row5<<3;
row6=row0+$08; y6=row6<<3;
var _PI1=global.PI_MOB_BLU;
var _DUR=4; // SpTrC revolution duration
data_spin_trap(SpTrC,$1,  $1C<<3,y6,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  $64<<3,y6,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spawn(rm+STR_PRXM,IrKnA,$3,  $18<<3,y5); // IronKnuckle  3
//data_spawn(rm+STR_PRXM,IrKnA,$3,  $60<<3,y5); // IronKnuckle  3
data_spawn(rm+STR_PRXM,GeruA,$1,  $60<<3,y5); // Geru  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $20<<3,y5); // Bot  1
//data_spawn(rm+STR_PRXM,Bot_A,$1,  $6A<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $68<<3,y5,  STR_Direction+hex_str($2|$4)); // Bubble  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  F1  --------------------------- 
//    Testing: Vertical challenge. Stab wall in middle of jump and use pushback to get to higher level. CHAL_VerticalClimb_007.tmx
rm_num  = $F1;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'221', STR_View+'02', STR_ow_axis+'00');


row3=row0+$0E; y3=row3<<3; // PC spawn row Right exit
row4=$0B; y4=row4<<3;


clm3=$0C;
data_exit(EXM0,etB0,1,  clm3,row4,  CLMS2,ROWS2,  clm3+1,row4,  rm_num_+EXM0_); // MID 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  F2  --------------------------- 
//    Super Mario Bros 1, 1-1 rendition. SMB1_000.tmx
rm_num  = $F2;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'222', STR_ow_axis+'00');


row3=row0+$17; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,Bot_A,$1,  $56<<3,y3); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  F3  --------------------------- 
//    Moai outside 1
rm_num  = $F3;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'081', STR_ow_axis+'00');


row3=row0+$17; y3=row3<<3;
row4=row0+$04; y4=row4<<3;
row5=row0+$19; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);
data_spawn(rm+STR_PRXM,Moa_B,$1,  $24<<3,y4); // FieryMoa  1
//data_spawn(rm+STR_PRXM,Moa_A,$1,  $12<<3,y4); // Moa  1 
//data_spawn(rm+STR_PRXM,Moa_A,$1,  $30<<3,y4); // Moa  1 
//data_spawn(rm+STR_PRXM,Moa_A,$1,  $5C<<3,y4); // Moa  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $1B<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $4B<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $68<<3,y5); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  F4  --------------------------- 
//     Testing: Slimes running across gaps. Gaps are 4 clms wide.
// Test unsuccessful, 4 clm gaps are too wide.
rm_num  = $F4;
set_rm_data(area+hex_str(rm_num), MUS_DUNGEON1, STR_Dark+'01', STR_Tile+area_MI+'224', STR_ow_axis+'00');


row3=row0+$10; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$00; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($09<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($75<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE

x3=$0C<<3; _dist=($06<<3)<<1;                             _i=0;
//repeat($0A) data_spawn(rm+STR_PRXM,Myu_A,$1,  x3+(_dist*_i++),y5); // 
repeat($0A) data_spawn(rm+STR_PRXM,Bot_A,$4,  x3+(_dist*_i++),y5); // v4: Nyb


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  hex_str(rm_num)+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  hex_str(rm_num)+EXR0_); // RGT 0, 








//   --------------------------  F5  --------------------------- 
//     Testing: Slimes running across gaps. Gaps are 3 clms wide.
// Test was successful. Slimes can run across 3 clm wide gaps as long as they are using the fast hspd.
rm_num  = $F5;
set_rm_data(area+hex_str(rm_num), MUS_DUNGEON1, STR_Dark+'01', STR_Tile+area_MI+'225', STR_ow_axis+'00');


row3=row0+$10; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$00; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $06<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $79<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE

x3=$03<<3; _dist=($05<<3)<<1;                             _i=0;
repeat($0C) data_spawn(rm+STR_PRXM,Bot_A,$4,  x3+(_dist*_i++),y5); // v4: Nyb
//x3=$03<<3; _dist=$05<<3;                                  _i=0;
//repeat($19) data_spawn(rm+STR_PRXM,Bot_A,$4,  x3+(_dist*_i++),y5); // v4: Nyb


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  hex_str(rm_num)+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  hex_str(rm_num)+EXR0_); // RGT 0, 








//   --------------------------  F6  --------------------------- 
//    Testing: Fokka Elevator Guantlet 1
rm_num  = $F6;
set_rm_data(area+hex_str(rm_num), MUS_DUNGEON1, STR_Tile+area_MI+'226', STR_View+'02', STR_ow_axis+'00', STR_show_ow_pos+'00');


//row3=row0+$17; y3=row3<<3;
//row4=row0+$03; y4=row4<<3;
x3=$08<<3; x4=$36<<3;
data_spawn(rm+STR_PRXM,FokkA,$2,  x3,$28<<3); // Fokka  2
data_spawn(rm+STR_PRXM,FokkA,$2,  x4,$28<<3); // Fokka  2
data_spawn(rm+STR_PRXM,FokkA,$2,  x3,$48<<3); // Fokka  2
data_spawn(rm+STR_PRXM,FokkA,$2,  x4,$68<<3); // Fokka  2


clm3=clm1; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  hex_str(rm_num)+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  hex_str(rm_num)+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row_e5); // Elevator DW $40, UP $80, 








//   --------------------------  F7  --------------------------- 
//     Walking the dog scene
rm_num  = $F7;
set_rm_data(area+hex_str(rm_num), STR_Rauru, STR_Color+COLOR3_, STR_Tile+area_MI+'227', STR_ow_axis+'00', STR_show_ow_pos+'00');


data_NIAO_1a(rm+STR_NIAO+'0',  $0800,  1,Cloud_1_init); // 
clm3=$1F; // Door center clm
clm4=clm3-3; clm5=clm3+1; row3=row0+$18; row4=row3+1;
//data_spawn(rm+STR_PRIO,TorchA,$1,  (clm4<<3)+4,row4<<3,  STR_Lit,STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  (clm5<<3)+4,row4<<3,  STR_Lit,STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE


clm4=clm3+1; row3=row0+$18;
//data_exit(EXM0,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4+1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 








//   --------------------------  F8  --------------------------- 
//     Testing Small Dungeon Room 2. Dungeon_Room_027.tmx
rm_num  = $F8;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'228', STR_ow_axis+'00', STR_show_ow_pos+'00');


clm3=$10; clm4=clm3-$03; clm5=clm3+$01;
row3=row0+$0E; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row3+$02; y5=row5<<3;
row6=row0+$00; y6=row6<<3;
row7=row6+$02; y7=row7<<3;
//data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
//data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);
//data_spawn(rm+STR_PRIO,TorchA,$1,  (clm4<<3)+4,y4,  STR_Lit,STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  (clm5<<3)+4,y4,  STR_Lit,STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE
if(1){
data_spawn(rm+STR_PRXM,BubbA,$2,  $10<<3,y3,  STR_Direction+hex_str($1|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $20<<3,y5,  STR_Direction+hex_str($2|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $30<<3,y3,  STR_Direction+hex_str($1|$8)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $08<<3,y7,  STR_Direction+hex_str($2|$8)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $18<<3,y6,  STR_Direction+hex_str($1|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $28<<3,y7,  STR_Direction+hex_str($2|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $38<<3,y6,  STR_Direction+hex_str($1|$8)); // Bubble  2
}


clm3=$0F; clm4=clm3+$20;
data_exit(EXM0,etB0,1,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  0); // MID 0, to Overworld 
data_exit(EXM1,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4-1,row3,  0); // MID 1, to Overworld 








//   --------------------------  F9  --------------------------- 
//     Testing Small Dungeon Room 1. Dungeon_Room_026.tmx
rm_num  = $F9;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'229', STR_ow_axis+'00', STR_show_ow_pos+'00');


clm3=clm1; // Door center clm
clm4=clm3-3; clm5=clm3+1; row3=row0+$0E; row4=row3+1;
//data_spawn(rm+STR_PRIO,TorchA,$1,  (clm4<<3)+4,row4<<3,  STR_Lit,STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  (clm5<<3)+4,row4<<3,  STR_Lit,STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE


clm4=clm3-1;
data_exit(EXM0,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4+1,row3,  0); // MID 0, to Overworld 
//data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$18,  0); // LFT 0, to Overworld 
//data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0E,  0); // RGT 0, to Overworld 








//   --------------------------  FA  --------------------------- 
//     Big square room with 4-way long firerope in center. Dungeon_Room_022.tmx
rm_num  = $FA;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'01', STR_Tile+area_MI+'232', STR_ow_axis+'00', STR_show_ow_pos+'00');


//data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,$37<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $37<<3,$39<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $37<<3,$09<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
x3 = $20<<3;  y3 = $20<<3;
_len=$16; _dir=1; _dur=$10;
data_spin_trap(FiRoA,1,  x3,y3,  -1,  _len,_dir,_dur,  0*90); // Firerope
data_spin_trap(FiRoA,1,  x3,y3,  -1,  _len,_dir,_dur,  1*90); // Firerope
data_spin_trap(FiRoA,1,  x3,y3,  -1,  _len,_dir,_dur,  2*90); // Firerope
data_spin_trap(FiRoA,1,  x3,y3,  -1,  _len,_dir,_dur,  3*90); // Firerope


row3=-PAGE_ROWS; row4=row1; rows3=abs(row4-row3);
row5=rows0+PAGE_ROWS; rows5=row5-row4;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,$36,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,row3,  CLMS2,rows3,  clmA,$08,  0); // RGT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,row4,  CLMS2,rows5,  clmA,$38,  0); // RGT 0, to Overworld 








//   --------------------------  FB  --------------------------- 
//     
rm_num  = $FB;
set_rm_data(area+hex_str(rm_num), Audio.MUS_Z1_DNGN1, STR_Dark+'01', STR_Tile+area_MI+'235', STR_ow_axis+"00", STR_show_ow_pos+'00');


row3 = $10;
y3   = row3<<3;
y4   =(row3+1)<<3;
_pi  = global.PI_BGR4;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0B<<3)+4,y4,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($13<<3)+4,y4,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($2B<<3)+4,y4,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($33<<3)+4,y4,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4B<<3)+4,y4,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($53<<3)+4,y4,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
y4=$06<<3;  _pi=global.PI_BGR2;
data_spawn(rm+STR_PRIO,SpDrA,$1,  $0F<<3,y4,  dk_PI+hex_str(_pi),STR_Type+hex_str(4)); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $2F<<3,y4,  dk_PI+hex_str(_pi),STR_Type+hex_str(4)); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $4F<<3,y4,  dk_PI+hex_str(_pi),STR_Type+hex_str(4)); // DropSpawner  1

data_spawn(rm+STR_PRXM,Stallakk,$1,  $1E<<3,y3,  STR_Direction+string(-1)); // Stallakk  1 
data_spawn(rm+STR_PRXM,Stallakk,$1,  $2D<<3,y3,  STR_Direction+string(1)); // Stallakk  1 
data_spawn(rm+STR_PRXM,Stallakk,$1,  $47<<3,y3,  STR_Direction+string(-1)); // Stallakk  1 
y4=$78<<3;
data_spawn(rm+STR_PRXM,Stallakk,$1,  $13<<3,$34<<3,  STR_Direction+string(1)); // Stallakk  1 
data_spawn(rm+STR_PRXM,Stallakk,$1,  $0A<<3,$5C<<3,  STR_Direction+string(1)); // Stallakk  1 
data_spawn(rm+STR_PRXM,Stallakk,$1,  $34<<3,$5C<<3,  STR_Direction+string(1)); // Stallakk  1 
data_spawn(rm+STR_PRXM,Stallakk,$1,  $08<<3,y4,  STR_Direction+string(1)); // Stallakk  1 
data_spawn(rm+STR_PRXM,Stallakk,$1,  $2E<<3,y4,  STR_Direction+string(-1)); // Stallakk  1 
data_spawn(rm+STR_PRXM,Stallakk,$1,  $38<<3,y4,  STR_Direction+string(1)); // Stallakk  1 

data_spawn(rm+STR_PRXM,BubbA,$2,  $18<<3,$34<<3,  STR_Direction+hex_str($1|$4)); // Bubble fast
data_spawn(rm+STR_PRXM,BubbA,$2,  $3C<<3,$3C<<3,  STR_Direction+hex_str($2|$4)); // Bubble fast
data_spawn(rm+STR_PRXM,BubbA,$2,  $38<<3,$66<<3,  STR_Direction+hex_str($2|$8)); // Bubble fast

_pi = global.PI_BGR2;
//data_spawn(rm+STR_PRXM,Snaraa,$1,  $38<<3,$0D<<3,  dk_PI+hex_str(_pi)); // Snaraa
y4=$26<<3;  y5=$7A<<3;
data_spawn(rm+STR_PRXM,Bot_A,$1,  $15<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $2B<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $16<<3,$36<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $20<<3,$42<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $10<<3,$5E<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $3E<<3,$5E<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $04<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $1E<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $2F<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $48<<3,y5); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, 
//data_exit(EXR1,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$18,  0); // RGT 1, 


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmF0,$1,  $33<<3,$4E<<3); // PBag 1: 50 








//   --------------------------  FC  --------------------------- 
//    Scenery art. Like inside North Palace. PalaceRoom_003.tmx
rm_num  = $FC;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'242', STR_ow_axis+'00');


                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1, Cloud_1_init); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 3, StarSky_1_init); // 


row3 = row0+$13;
row4 = row0+$17;
data_exit(EXM0,etB0,0,  clm1-1,row4,  CLMS2,ROWS2,  clm1-2,row4,  0); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 








//   --------------------------  FD  --------------------------- 
//    Scenery art. Overgrown field in front of forest
rm_num  = $FD;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'243', STR_ow_axis+'00');


row4 = row0+$17;
y3 = (row0+$13)<<3;
//data_NIAO_1a( rm+STR_NIAO+'0', $0000, 1, Cloud_1_init); // 
//data_spawn(rm+STR_PRXM,LowdA,$1,  $18<<3,y3); // Lowder  1 


row3 = -PAGE_ROWS;
data_exit(EXL0,etA0,1,  CLM2,row3,  CLMS2,rows1,  CLM3,row4,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,row3,  CLMS2,rows1,  clmA,row4,  0); // RGT 0, to Overworld 






//   --------------------------  FE  --------------------------- 
//    Testing: Bounceable object 'Blooby'. CHAL_VerticalClimb_008.tmx
rm_num  = $FE;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+color_str(p.C_CYN4), STR_Tile+area_MI+'254', STR_View+'02', STR_ow_axis+'00', STR_show_ow_pos+'00');


data_NIAO_1a(rm+STR_NIAO+'0', $0000,1, Cloud_1_init); // 
_val = "08"; // hspd
data_spawn(rm+STR_PRXM,Blooby,$1,  $27<<3,$70<<3,  STR_HSPD+STR_Direction+ "1",STR_HSPD+_val,"_XC_MIN"+hex_str($15<<3),"_XC_MAX"+hex_str($20<<3)); // Blooby 1
data_spawn(rm+STR_PRXM,Blooby,$1,  $2C<<3,$58<<3,  STR_HSPD+STR_Direction+"-1",STR_HSPD+_val,"_XC_MIN"+hex_str($24<<3),"_XC_MAX"+hex_str($27<<3)); // Blooby 1
data_spawn(rm+STR_PRXM,Blooby,$1,  $12<<3,$42<<3,  STR_HSPD+STR_Direction+ "1",STR_HSPD+_val,"_XC_MIN"+hex_str($24<<3),"_XC_MAX"+hex_str($2B<<3)); // Blooby 1
data_spawn(rm+STR_PRXM,Blooby,$1,  $20<<3,$2C<<3,  STR_HSPD+STR_Direction+"-1",STR_HSPD+_val,"_XC_MIN"+hex_str($15<<3),"_XC_MAX"+hex_str($2B<<3)); // Blooby 1
data_spawn(rm+STR_PRXM,Blooby,$1,  $15<<3,$1C<<3,  STR_HSPD+STR_Direction+ "1",STR_HSPD+_val,"_XC_MIN"+hex_str($11<<3),"_XC_MAX"+hex_str($2F<<3)); // Blooby 1


row3 = -PAGE_ROWS;
data_exit(EXL0,etA0,1,  CLM2,row3,  CLMS2,rows1,  CLM3,$74,  rm_num_+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,row3,  CLMS2,rows1,  clmA,$0C,  rm_num_+EXL0_); // RGT 0, 






//   --------------------------  FF  --------------------------- 
//    Scenery art. Forest with bush house.
rm_num  = $FF;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'255', STR_ow_axis+'00');


y3 = (row0+$13)<<3;
//data_NIAO_1a( rm+STR_NIAO+'0', $0000, 1, Cloud_1_init); // 
//data_spawn(rm+STR_PRXM,LowdA,$1,  $18<<3,y3); // Lowder  1 


clm3 = $2F;
row3 = -PAGE_ROWS;
row4 = row0+$17;
data_exit(EXM0,etB0,1,  clm3,row4,  CLMS2,ROWS2,  clm3-1,row4,  0); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,row3,  CLMS2,rows1,  CLM3,row4,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,row3,  CLMS2,rows1,  clmA,row4,  0); // RGT 0, to Overworld 




