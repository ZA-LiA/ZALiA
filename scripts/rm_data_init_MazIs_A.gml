/// rm_data_init_MazIs_A()


var _i, _a,_b, _x,_xl, _y,_yt, _w,_h;
var _val,_val1,_val2,_val3,_val4;
var _rm, _pages, _data, _dk;
var _len, _dir, _dur, _dist;
var _file;
//var _exit_name = REEN_DEFAULT;
var _ow_axis = 0;




var _MapAreaName_MAZE_ISLAND = "MAZE ISLAND";






// ------------------------------ MAZE ISLAND ------------------------------ 
area = area_MI;










//   --------------------------  00  --------------------------- 
//    Bridge to Maze Island
rm_num  = $00;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'021', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND);


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init); // 
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init); // 
y3=(row0+$19)<<3; x3=($22<<3)+4; _val=$1F;   _a=0;
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
//                                                              //
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin


row3=row0+$08;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 






//   --------------------------  01  --------------------------- 
//    Outside. 
rm_num  = $01;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'001', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm_name+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
data_spawn(rm+STR_PRXM,OctoA,$2,  $20<<3,(row0+$14)<<3); // Octorok  2
data_spawn(rm+STR_PRXM,OctoA,$2,  $4C<<3,(row0+$10)<<3); // Octorok  2
data_spawn(rm+STR_PRXM,OctoA,$2,  $5C<<3,(row0+$10)<<3); // Octorok  2
data_spawn(rm+STR_PRXM,TektA,$1,  $62<<3,(row0+$0C)<<3); // Tektite  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$16,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0A,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








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


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  03  --------------------------- 
//    Cave.
rm_num  = $03;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_MI+'002', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,(row0+$0B)<<3); // v1: Light w/ CANDLE or FIRE


data_exit(EXU0,etA0,0,  $26,row_e0,  $08,ROWS5,  $2D,$02,  0); // UP  0, Pit up, to Overworld 
//data_exit(EXU0,etA0,0,  $1E,row_e0,  CLMS5,ROWS5,  $2D,$02,  0); // UP  0, Pit up, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0A,  0); // LFT 0, to Overworld 


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  ($34<<3)-2,(row0+$18)<<3,  STR_Treasure+STR_Map+"02"); // MAGIC PIECE


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01"+STR_Pit+"8",rm);








//   --------------------------  04  --------------------------- 
//    Cave.
rm_num  = $04;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_MI+'003', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,(row0+$0B)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $38<<3,(row0+$17)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GeruA,$2,  $50<<3,(row0+$16)<<3); // Geru  2


data_exit(EXU0,etA0,0,  $2C,row_e0,  $08,ROWS5,  $2F,row_e4,  0); // UP  0, Pit up to Overworld
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0A,  0); // LFT 0, to Overworld


data_spawn(rm+STR_PRIO,ItmC4,$1,  ($77<<3)-3,(row0+$16)<<3); // CHILD


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01"+STR_Pit+"8",rm);








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


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);





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


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








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


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  08  --------------------------- 
//    Outside. 
rm_num  = $08;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'004', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm_name + STR_NIAO + '0', $0000, 1, Cloud_1_init); // $30
data_spawn(rm+STR_PRXM,OctoA,$1,  $D0,$60); // $A8: Octorok  1
data_spawn(rm+STR_PRXM,TektA,$1,  $F0,$70); // $AB: Tektite  1
data_spawn(rm+STR_PRXM,OctoA,$1,  $2A0,$80); // $A8: Octorok  1
data_spawn(rm+STR_PRXM,TektA,$1,  $2D0,$90); // $AB: Tektite  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$16,  0);        // LFT 0, to Overworld  
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$16,  0);        // RGT 0, to Overworld  


data_spawn(rm+STR_PRIO,ItmE0,$1,  $200,$90); // Magic Jar (Full)


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00"+STR_JAR,rm);








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


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  0A  --------------------------- 
//    Outside. Shoals.
rm_num  = $0A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'016', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init); // 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$18,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$18,  0); // RGT 0, to Overworld 


y3=(row0+$0E)<<3;
data_spawn(rm+STR_PRIO,ItmG0,$1,  $2A<<3,y3,  STR_Treasure+STR_Map+"02"); // Extra Life Doll 
//data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  $2A<<3,y3,  STR_Treasure+STR_Map+"02"); // MAGIC PIECE


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








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


// ----------------------------------------------------------
// The following $40-$7F are so Scene Rando has more scenes
mus0 = STR_Dungeon+"01";

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
data_exit(EXM0,etB0,1,  clm3,row4,  $03,ROWS2,  clm3-1,row4,  0); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_01"+"_01"+"_01"+"_00"+"_00",rm);








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
data_exit(EXM0,etB0,1,  clm3,row4,  $03,ROWS2,  clm3-1,row4,  0); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_01"+"_01"+"_01"+"_00"+"_00",rm);








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
//data_spawn(rm+STR_PRXM,OctoA,$1,  $0D<<3,y6); // Octorok  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $2F<<3,y3+$10); // Bot  1


clm3=$1F;
data_exit(EXM0,etB0,1,  clm3,row5,  $03,ROWS2,  clm3-1,row5,  0); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row4,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_01"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  43  --------------------------- 
//    Extra scene rando scene. Field, Ruins with doorway, 2 sections wide room
rm_num  = $43;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'067');


row3=row0+$16; y3=row3<<3;
row4=row3-$03; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,AcheA,$1,  $31<<3,(row0+$05)<<3); // Ache  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $20<<3,(row0+$08)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $0F<<3,(row0+$16)<<3); // Bot  1


clm3=$1F;
data_exit(EXM0,etB0,1,  clm3,row4,  $02,ROWS2,  clm3-1,row4,  0); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_01"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  44  --------------------------- 
//    Extra scene rando scene. Dungeon, flat floor, 9 pillars, curtains
rm_num  = $44;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_MI+'068');


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


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  45  --------------------------- 
//    Extra scene rando scene. Dungeon, very small corner room with down elevator and right exit
rm_num  = $45;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_MI+'069');


row3=row0+$14; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($35<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clm3=$2E; // Elevator center clm
data_exit(EXD0,etC0,1,  clm3-4,row_e2,  CLMS4,ROWS5,  clm3-1,row_e3,  0); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$13);                                          // Elevator DW $40, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_00"+"_01"+"_00",rm);








//   --------------------------  46  --------------------------- 
//    Extra scene rando scene. Dungeon, very small corner room with down elevator and left exit
rm_num  = $46;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_MI+'070');


row3=row0+$14; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($09<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clm3=$12; // Elevator center clm
data_exit(EXD0,etC0,1,  clm3-4,row_e2,  CLMS4,ROWS5,  clm3-1,row_e3,  0); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$13);                                          // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_01"+"_00",rm);








//   --------------------------  47  --------------------------- 
//    Extra scene rando scene. Dungeon, very small corner room with up elevator and right exit
rm_num  = $47;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_MI+'071');


row3=row0+$0A; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($35<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clm3=$2E; // Elevator center clm
data_exit(EXU0,etC0,1,  clm3-4,row_e0,  CLMS4,ROWS5,  clm3-1,row_e1,  0); // UP  0, Elevator up 
data_Elev(EXU0_, clm3,row0+$08);                                          // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_01",rm);








//   --------------------------  48  --------------------------- 
//    Extra scene rando scene. Dungeon, very small corner room with up elevator and left exit
rm_num  = $48;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_MI+'072');


row3=row0+$0A; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($09<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clm3=$12; // Elevator center clm
data_exit(EXU0,etC0,1,  clm3-4,row_e0,  CLMS4,ROWS5,  clm3-1,row_e1,  0); // UP  0, Elevator up 
data_Elev(EXU0_, clm3,row0+$08);                                          // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01",rm);








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
data_exit(EXU0,etC0,1,  clm3-4,row_e0,  CLMS4,ROWS5,  clm3-1,row_e1,  0); // UP  0, Elevator up 
data_Elev(EXU0_, clm3,row0+$12);                                          // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_01",rm);








//   --------------------------  4A  --------------------------- 
//    Extra scene rando scene. Dungeon entrance, in the style of the triforce barrier ruins
rm_num  = $4A;
set_rm_data(area+hex_str(rm_num), mus0, STR_Color+COLOR2_, STR_Tile+area_MI+'074');


row3=row0+$17; y3=row3<<3;
row6=row0+$09; y6=row6<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,Moa_A,$1,  $28<<3,(row0+$0E)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $34<<3,(row0+$0C)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $40<<3,y6); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $4A<<3,y6); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $58<<3,y6); // Ache  1 


clm3=$70; // Elevator center clm
data_exit(EXD0,etC0,1,  clm3-4,row_e2,  CLMS4,ROWS5,  clm3-1,row_e3,  0); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$13);                                          // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_01"+"_00",rm);








//   --------------------------  4B  --------------------------- 
//    Extra scene rando scene. Cave, Water, has a "walk across short gaps" section
rm_num  = $4B;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'075');


row3=row0+$08; y3=row3<<3;
row4=row0+$13; y4=row4<<3;
row5=row0+$19; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,BagiA,$1,  $16<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $1E<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $2A<<3,y5); // Bagin


clm3=$50; // Elevator center clm
data_exit(EXU0,etC0,1,  clm3-4,row_e0,  CLMS4,ROWS5,  clm3-1,row_e1,  0); // UP  0, Elevator up 
data_Elev(EXU0_, clm3,row0+$10);                                          // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01",rm);








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
data_exit(EXD0,etC0,1,  clm3-4,row_e2,  CLMS4,ROWS5,  clm3-1,row_e3,  0); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$13);                                          // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_01"+"_00",rm);








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


data_exit(EXU0,etA4,0,  $20,row_e0,  $10,ROWS5,  $27,row_e4,  0); // UP  0, Pit up 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01"+STR_Pit+"8",rm);








//   --------------------------  4E  --------------------------- 
//    Extra scene rando scene. Beach, Water, Basic beach scene
rm_num  = $4E;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'078');


row3=row0+$18; y3=row3<<3;
row4=row3-$04; y4=row4<<3;
row5=row3+$02; y5=row5<<3;
row6=row0+$16; y6=row6<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,OctoA,$1,  $2B<<3,y5); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $3A<<3,y5); // Octorok  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $1A<<3,y6); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $22<<3,y6); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $32<<3,y6); // Geldarm  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








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


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  50  --------------------------- 
//    Extra scene rando scene. Cave, Basic cave, 2 section-wide room
rm_num  = $50;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'080');


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $36<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,DairA,$1,  $1F<<3,y3); // Daira  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  51  --------------------------- 
//    Extra scene rando scene. Cave, Water, Old underground VOD tunnels scene
rm_num  = $51;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'081');


row3=row0+$12; y3=row3<<3;
row4=row0+$10; y4=row4<<3;
row5=row0+$19; y5=row5<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $36<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,OctoA,$1,  $47<<3,(row0+$14)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $38<<3,(row0+$0E)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,BagiA,$1,  $1E<<3,y5); // Bagin


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  52  --------------------------- 
//    Extra scene rando scene. Cave, Water, Old underground VOD tunnels scene
rm_num  = $52;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'082');


row3=row0+$12; y3=row3<<3;
row4=row0+$0E; y4=row4<<3;
row5=row0+$19; y5=row5<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $36<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,OctoA,$1,  $43<<3,(row0+$10)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,BagiA,$1,  $1E<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $2C<<3,y5); // Bagin


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  53  --------------------------- 
//    Extra scene rando scene. Cave, Water, Old underground VOD tunnels scene
rm_num  = $53;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'083');


row3=row0+$12; y3=row3<<3;
row4=row0+$08; y4=row4<<3;
row5=row0+$1A; y5=row5<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $36<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,BagiA,$1,  $19<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $21<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $49<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $51<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,OctoA,$1,  $2B<<3,(row0+$14)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $39<<3,(row0+$10)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $59<<3,(row0+$0C)<<3); // Octorok  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








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


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








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


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  56  --------------------------- 
//    Extra scene rando scene. Dungeon, Stairs, 2 section-wide room
rm_num  = $56;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_MI+'086');


row3=row0+$17; y3=row3<<3;
row4=row0-$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0D<<3)+4,row3<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $36<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,OctoA,$1,  $15<<3,(row0+$15)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $19<<3,(row0+$11)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $1D<<3,(row0+$0D)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $21<<3,(row0+$09)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $25<<3,(row0+$05)<<3); // Octorok  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  57  --------------------------- 
//    Extra scene rando scene. Dungeon, Stairs on both ends
rm_num  = $57;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_MI+'087');


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0D<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($71<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,DoomA,$1,  $3F<<3,(row0+$03)<<3); // Doomknocker  1
data_spawn(rm+STR_PRXM,OctoA,$1,  $15<<3,(row0+$15)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $21<<3,(row0+$09)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $5D<<3,(row0+$09)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $69<<3,(row0+$15)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $1D<<3,(row0+$0D)<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $61<<3,(row0+$0D)<<3); // Myu  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  58  --------------------------- 
//    Extra scene rando scene. Dungeon, Pillars, Flat ground except for 4 1x2 block solids
rm_num  = $58;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_MI+'088');


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


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  59  --------------------------- 
//    Extra scene rando scene. Dungeon, Water, Flat ground with several pitfalls
rm_num  = $59;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_MI+'089');


row3=row0+$10; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$07; y5=row5<<3;
row6=row0+$1B; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $76<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,BagiA,$1,  $25<<3,y6); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $3F<<3,y6); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $59<<3,y6); // Bagin
data_spawn(rm+STR_PRXM,Ra__A,$1,  $2F<<3,y5); // Ra  1
data_spawn(rm+STR_PRXM,Ra__A,$1,  $4F<<3,y5); // Ra  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  5A  --------------------------- 
//    Extra scene rando scene. Field, Rocky ground, Flat ground, Some bgr bushes
rm_num  = $5A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'090');


row3=row0+$17; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,TektA,$1,  $1F<<3,y3); // Tektite  1 
data_spawn(rm+STR_PRXM,TektA,$1,  $3F<<3,y3); // Tektite  1 
data_spawn(rm+STR_PRXM,TektA,$1,  $5F<<3,y3); // Tektite  1 
data_spawn(rm+STR_PRXM,BoonA,$1,  $3F<<3,(row0+$08)<<3); // Boon  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  5B  --------------------------- 
//    Extra scene rando scene. Mtn Pass
rm_num  = $5B;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'091');


row3=row0+$17; y3=row3<<3;
row4=row0+$0F; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,OctoA,$1,  $2A<<3,(row0+$0B)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $4C<<3,(row0+$07)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $6B<<3,(row0+$0B)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $42<<3,(row0+$0D)<<3); // Lowder  1
data_spawn(rm+STR_PRXM,MegmA,$1,  $2E<<3,(row0+$0B)<<3); // Megmat  1
data_spawn(rm+STR_PRXM,MegmA,$1,  $58<<3,(row0+$07)<<3); // Megmat  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








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


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  5D  --------------------------- 
//    Extra scene rando scene. River Cave
rm_num  = $5D;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'093');


row3=row0+$18; y3=row3<<3;
row4=row3+$02; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,Boggnipp,$1,  $1B<<3,y4); // Boggnipp
data_spawn(rm+STR_PRXM,Boggnipp,$1,  $30<<3,y4); // Boggnipp
data_spawn(rm+STR_PRXM,Boggnipp,$1,  $4E<<3,y4); // Boggnipp
data_spawn(rm+STR_PRXM,Boggnipp,$1,  $63<<3,y4); // Boggnipp
data_spawn(rm+STR_PRXM,OctoA,$1,  $23<<3,y4); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $3F<<3,y4); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $5B<<3,y4); // Octorok  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  5E  --------------------------- 
//    Extra scene rando scene. Rock, Water
rm_num  = $5E;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'094');


row3=row0+$11; y3=row3<<3;
row4=row0+$0F; y4=row4<<3;
row5=row0+$08; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,BoonA,$1,  $1F<<3,y5); // Boon  1 
data_spawn(rm+STR_PRXM,BoonA,$1,  $3F<<3,y5); // Boon  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $29<<3,y3+($01<<3)); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $35<<3,y3); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $3F<<3,y3); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $45<<3,y3); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $4D<<3,y3); // Geldarm  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  5F  --------------------------- 
//    Extra scene rando scene. Rock, Water, River side
rm_num  = $5F;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'095');


row3=row0+$13; y3=row3<<3;
row4=row0+$18; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,OctoA,$1,  $19<<3,(row0+$15)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $3B<<3,(row0+$17)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $4C<<3,(row0+$1A)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $29<<3,(row0+$15)<<3); // Geldarm  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  60  --------------------------- 
//    Extra scene rando scene. Field, Ruins
rm_num  = $60;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'096');


row3=row0+$17; y3=row3<<3;
row4=row0+$15; y4=row4<<3;
row5=row0+$08; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,BoonA,$1,  $27<<3,y5); // Boon  1 
data_spawn(rm+STR_PRXM,BoonA,$1,  $57<<3,y5); // Boon  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $17<<3,y4); // Megmat  1
data_spawn(rm+STR_PRXM,MegmA,$1,  $2F<<3,y4); // Megmat  1
data_spawn(rm+STR_PRXM,MegmA,$1,  $4F<<3,y4); // Megmat  1
data_spawn(rm+STR_PRXM,MegmA,$1,  $67<<3,y4); // Megmat  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








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


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








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


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  63  --------------------------- 
//    Extra scene rando scene. Rock, Water
rm_num  = $63;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'099');


row3=row0+$10; y3=row3<<3;
row4=row0+$18; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,BagiA,$1,  $1D<<3,y4); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $2E<<3,y4); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $41<<3,y4); // Bagin
data_spawn(rm+STR_PRXM,LowdA,$1,  $38<<3,(row0+$0C)<<3); // Lowder  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  64  --------------------------- 
//    Extra scene rando scene. Rock, Water
rm_num  = $64;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'100');


row3=row0+$08; y3=row3<<3;
row4=row0+$10; y4=row4<<3;
row5=row0+$18; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,LowdA,$1,  $17<<3,(row0+$12)<<3); // Lowder  1
data_spawn(rm+STR_PRXM,BagiA,$1,  $2A<<3,y5); // Bagin


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








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


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  66  --------------------------- 
//    Extra scene rando scene. Rock, Water
rm_num  = $66;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'102');


row3=row0+$04; y3=row3<<3;
row4=row0+$08; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRIO,SpRoA,$1,  0,0); // RockSpawner  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  67  --------------------------- 
//    Extra scene rando scene. 
rm_num  = $67;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'103');


row3=row0-$04; y3=row3<<3;
row4=row0+$06; y4=row4<<3;
row5=row0+$18; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,BagiA,$1,  $15<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $1D<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $2E<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $41<<3,y5); // Bagin


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  68  --------------------------- 
//    Extra scene rando scene. 
rm_num  = $68;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'104');


row3=row0+$12; y3=row3<<3;
row4=row0+$14; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  69  --------------------------- 
//    Extra scene rando scene. Dungeon, Water, Water pitfalls, Collapsable floors, Need jump to get across
rm_num  = $69;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_MI+'105');


row3=row0+$10; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$07; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0E<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $71<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRXM,Ra__A,$1,  $3E<<3,y5); // Ra  1
//data_spawn(rm+STR_PRXM,Ra__A,$1,  $44<<3,y5); // Ra  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_JUMP);








//   --------------------------  6A  --------------------------- 
//    Extra scene rando scene. Dungeon, Water, Need cucco to duck under low submerged wall
rm_num  = $6A;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_MI+'106');


row3=row0+$18; y3=row3<<3;
row4=row0+$16; y4=row4<<3;
row5=row3+$02; y5=row5<<3;
clm3=$0F; clms3=$18; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3+(clms3*_a++))<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3+(clms3*_a++))<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3+(clms3*_a++))<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpStA,$1,  $48<<3,y3-($06<<3)); // SpawnByStab  1
data_spawn(rm+STR_PRXM,GumaA,$1,  $46<<3,y3); // Guma  1
//data_spawn(rm+STR_PRXM,IrKnA,$3,  $46<<3,y3); // IronKnuckle  3


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_FAIRY);








//   --------------------------  6B  --------------------------- 
//    Extra scene rando scene. Cave, Water, Need cucco to duck under low submerged wall
rm_num  = $6B;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_MI+'107');


row3=row0+$18; y3=row3<<3;
row4=row0+$16; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $18<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,DairA,$1,  $1F<<3,y3); // Daira  1 
data_spawn(rm+STR_PRXM,DairA,$2,  $4E<<3,y3); // Daira  2 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_FAIRY);








//   --------------------------  6C  --------------------------- 
//    Extra scene rando scene. Cave, Water, Need JUMP + cucco to get across pitfall
rm_num  = $6C;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_MI+'108');


row3=row0+$0C; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0E<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $71<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_JUMP+STR_FAIRY);








//   --------------------------  6D  --------------------------- 
//    Extra scene rando scene. Previous used scene with hole on west side of Death Mtn
rm_num  = $6D;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'109');


row3=row0+$16; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init);
data_spawn(rm+STR_PRXM,Myu_A,$1,  $0D<<3,(row0+$18)<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $22<<3,(row0+$14)<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $2E<<3,(row0+$16)<<3); // Myu  1 


data_exit(EXD0,etA1,1,  $1C,row_e2,  $04,ROWS5,  $33,row_e3,  0); // DWN 0, Pit down 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_00"+STR_Pit+"4",rm);








//   --------------------------  6E  --------------------------- 
//    Extra scene rando scene. Dungeon, Up+Down Elevator, 4-Way Exits
rm_num  = $6E;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_MI+'110');


row3=row0+$10; y3=row3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($1C<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($22<<3)+4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bot_A,$1,  $28<<3,(row0+$12)<<3); // Bot  1


clm3=$20; // Elevator center clm
data_exit(EXU0,etC0,1,  clm3-$04,row_e0,  CLMS4,ROWS5,  clm3-$01,row_e1,  0); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm3-$04,row_e2,  CLMS4,ROWS5,  clm3-$01,row_e3,  0); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row0+$0D);                                       // Elevator DW $40, UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_01",rm);








//   --------------------------  6F  --------------------------- 
//    Extra scene rando scene. Dungeon, Down Elev on left, Up Elev on right
rm_num  = $6F;
set_rm_data(area+hex_str(rm_num), mus0, STR_Tile+area_MI+'111');


row3=row0+$10; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
clm3=$0F; clms3=$10; _a=0;
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3+(clms3*_a++))<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3+(clms3*_a++))<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3+(clms3*_a++))<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,DoomA,$1,  $1F<<3,y3); // Doomknocker  1


clm3=$0A; clm4=$36; // Elevator center clm
data_exit(EXU0,etC0,1,  clm4-$04,row_e0,  CLMS4,ROWS5,  clm4-$01,row_e1,  0); // UP  0, Elevator up  
data_Elev(EXU0_, clm4,row0+$0C);                                              // Elevator UP $80, 
data_exit(EXD0,etC0,1,  clm3-$04,row_e2,  CLMS4,ROWS5,  clm3-$01,row_e3,  0); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$0F);                                              // Elevator DW $40, UP $80, 


data_rando_scene01("_00"+"_00"+"_00"+"_01"+"_01",rm);








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


//   -----------------------------------------------------------
mus0 = STR_Dungeon+'01';
//mus0 = MUS_DUNGEON1;
var _DARK_DATA=STR_Dark+"01";
ow_axis =  0; // 0:horizontal, 1:vertical
_ow_axis = STR_ow_axis+'00';
var _Pushable_PI = global.PI_BGR4;
var _COLUMN_TYPE='02'; // 2: Midoro Palace

//   --------------------------  80  --------------------------- 
//    PalcZ. Entrance
rm_num  = $80;
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
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '83'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$14);                                               // Elevator DW $40, 
_exit1=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '81'+EXL0_); // RGT 0, 








//   --------------------------  81  --------------------------- 
//    PalcZ. Right of entrance scene. Cave scene w/ large pit down
rm_num  = $81;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, _DARK_DATA, STR_Tile+area_PZ+'007', _ow_axis);


row3=row0+$0C; y3=row3<<3; // PC spawn row Left+Right exit
//row4=row0+$16; y4=row4<<3;
//row5=row0+$17; y5=row5<<3;
//


clms3=clms0+(PAGE_CLMS<<1); clm3=-PAGE_CLMS;
_exit=data_exit(EXD0,etA1,1,  clm3,row_e2,  clms3,ROWS5,  clms1,row_e3,  _exit1); // DWN 0, Pit down 
//data_pit(_exit, 0,8);
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '80'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '82'+EXL0_); // RGT 0, 








//   --------------------------  82  --------------------------- 
//    PalcZ. Right of entrance scene. 
rm_num  = $82;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, _DARK_DATA, STR_Tile+area_PZ+'002', _ow_axis);


row3=row0+$14; y3=row3<<3; // PC spawn row Left exit
row4=row3+$03; y4=row4<<3;
//row5=row0+$17; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0D<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$1,  $54 <<3,(row0+$0B)<<3,  STR_Type+_COLUMN_TYPE); // DropSpawner  1
//data_spawn(rm+STR_PRIO,SpDrA,$1,  $5E<<3,(row0+$0B)<<3,  STR_Type+_COLUMN_TYPE); // DropSpawner  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '81'+EXR0_); // LFT 0, 








//   --------------------------  83  --------------------------- 
//    PalcZ. Elevator shaft to entrance.
rm_num  = $83;
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
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '80'+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '84'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row0+$15);                                        // Elevator DW $40, UP $80, 








//   --------------------------  84  --------------------------- 
//    PalcZ. Bottom of elevator shaft to entrance.
rm_num  = $84;
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
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '83'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row_e5);                                                 // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '85'+EXL0_); // RGT 0, 








//   --------------------------  85  --------------------------- 
//    PalcZ. Depress switches to unlock door challenge.
rm_num  = $85;
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
data_exit(EXU0,etA4,0,  $00,row_e0,  clms0,ROWS5,  $20,row_e4,  '86'+EXD0_); // UP  0, Pit up 
data_exit(EXM0,etB0,0,  clm4,row6,  clms4,ROWS2,  clm4-1,row6,  '88'+EXM0_, 1); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '84'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '87'+EXL1_); // RGT 0, 








//   --------------------------  86  --------------------------- 
//    PalcZ. Pushable origin scene
rm_num  = $86;
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
_exit=data_exit(EXD0,etA1,1,  clm3,row_e2,  clms3,ROWS5,  clms1,row_e3,  '85'+EXU0_); // DWN 0, Pit down 
//data_pit(_exit, 0,8);
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '87'+EXL0_); // RGT 0, 








//   --------------------------  87  --------------------------- 
//    PalcZ. Elevator shaft
rm_num  = $87;
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
data_exit(EXL0,etA0,1,  CLM2,row3-rows3,  CLMS2,rows4,  CLM3,row3,  '86'+EXR0_); // LFT 0, 
data_exit(EXL1,etA0,1,  CLM2,row4-rows3,  CLMS2,rows4,  CLM3,row4,  '85'+EXR0_); // LFT 1, 








//   --------------------------  88  --------------------------- 
//    
rm_num  = $88;
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
data_exit(EXM1,etB0,1,  clm4,row3,  clms3,ROWS2,  clm4-1,row3,  '89'+EXR0_, 0); // MID 1, 








//   --------------------------  89  --------------------------- 
//    
rm_num  = $89;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'010', STR_View+'02', _ow_axis);


row3=$08; y3=row3<<3; // PC spawn row Right exit
row4=row3+$01; y4=row4<<3;
row5=$74; y5=row5<<3; // PC spawn row Mid exit
data_spawn(rm+STR_PRIO,TorchA,$1,  $34<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($20<<3)-4,$77<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clms4=$02; clm4=$2A;
//clms4=$02; clm4=clm1-(clms4>>1);
data_exit(EXM0,etB0,1,  clm4,row5,  clms4,ROWS2,  clm4-1,row5,  '8A'+EXM0_, 0); // MID 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '88'+EXM1_); // RGT 0, 








//   --------------------------  8A  --------------------------- 
//    
rm_num  = $8A;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'011', STR_View+'02', _ow_axis);


row3=$08; y3=row3<<3; // PC spawn row Right exit
row4=row3+$01; y4=row4<<3;
row5=$6E; y5=row5<<3; // PC spawn row Mid exit
data_spawn(rm+STR_PRIO,TorchA,$1,  $34<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  ($20<<3)-4,$77<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,Backwall,$1,  $00<<3,$7A<<3,  STR_Depth+string(DEPTH_FG2-1), STR_Min+'_Y'+hex_str($0D<<3), STR_Direction+'08', STR_Speed+'08', STR_Delay+'80'); // Backwall $1


clms4=$02; clm4=clm1-$01;
//clms4=$02; clm4=clm1-(clms4>>1);
data_exit(EXM0,etB0,0,  clm4,row6,  clms4,ROWS2,  clm4-1,row5,  '89'+EXM0_, 1); // MID 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '8B'+EXL0_); // RGT 0, 








//   --------------------------  8B  --------------------------- 
//    
rm_num  = $8B;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'016', _ow_axis);


row3=row0+$0E; y3=row3<<3; // PC spawn row Right,Left exit
row4=row3+$02; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($1C<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($22<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clm3=clm1; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  rm_num_+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  rm_num_+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row0+$0D);                               // Elevator DW $40, UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '8A'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  rm_num_+EXL0_); // RGT 0, 

_dk=rm+STR_Exit+STR_Sequence; _a=0;
g.dm_rm[?_dk+hex_str(++_a)] = rm+EXD0_;
g.dm_rm[?_dk+hex_str(++_a)] = rm+EXR0_;
g.dm_rm[?_dk+hex_str(++_a)] = rm+EXR0_;
g.dm_rm[?_dk+hex_str(++_a)] = rm+EXU0_;
g.dm_rm[?_dk+STR_Count] = _a;
g.dm_rm[?_dk+STR_Complete+STR_Exit+STR_Name] = Area_MazIs+hex_str(rm_num+1)+EXD0_;








//   --------------------------  8C  --------------------------- 
//    
rm_num  = $8C;
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
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '8B'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,$63); // Elevator DW $40, 

data_Elev(0,  clm3,$2B); // Elevator confined w/in scene. Doesn't go to an exit.
data_Elev(0,  clm6,$4F); // Elevator confined w/in scene. Doesn't go to an exit.








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
//    Testing: 


//   --------------------------  E1  --------------------------- 
//    Testing: Blooby platforming challenge. BloobyPlatforming_000.tmx
rm_num  = $E1;
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








//   --------------------------  E2  --------------------------- 
//    To see what WestA_002 looks like
rm_num  = $E2;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'002', STR_ow_axis+'00');


row3=row0+$17; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  E3  --------------------------- 
//    Testing: Eyenocc. DownstabChallenge_000.tmx
rm_num  = $E3;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'218', STR_ow_axis+'00');


row3=row0+$14; y3=row3<<3; // PC spawn row Left exit
row4=row0+$00; y4=row4<<3; // PC spawn row Right exit
row5=row0+$0F; y5=row5<<3;
row6=row0+$01; y6=row6<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
clm3=$73;
clm4=clm3-$03;
row7=row6+$0C;
_val  =object_get_name(Eyenocc)+"_"+STR_Sequence;
_val += hex_str(row7)+hex_str(clm3);
_val += hex_str(row7)+hex_str(clm4);
_val += "_";
data_spawn(rm+STR_PRIO,Eyenocc,$1,  clm3<<3,row6<<3,  _val); // Eyenocc  1 

data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  E4  --------------------------- 
//    Testing: Burnables Puzzle 2
rm_num  = $E4;
set_rm_data(area+hex_str(rm_num), STR_Dungeon+"01", STR_Tile+area_MI+'217', STR_ow_axis+'00');


row3=row0+$14; y3=row3<<3; // PC spawn row Left exit
row4=row0+$06; y4=row4<<3; // PC spawn row Right exit
row5=row0+$16; y5=row5<<3;
//row6=row0+$08; y6=row6<<3;
data_spawn(rm+STR_PRIO,PushA,$2,  $5C<<3,(row0-$02)<<3,  dk_PI+hex_str(global.PI_BGR4)); // Pushable
data_spawn(rm+STR_PRXM,OctoA,$1,  $20<<3,y5); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $30<<3,y5); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $40<<3,y5); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $50<<3,y5); // Octorok  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  E5  --------------------------- 
//    Testing: Downstab pogo across room
rm_num  = $E5;
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








//   --------------------------  E6  --------------------------- 
//    Testing: Burnables Puzzle 1
rm_num  = $E6;
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








//   --------------------------  E7  --------------------------- 
//    Idea: Spinning Spike Traps
rm_num  = $E7;
set_rm_data(area+hex_str(rm_num), STR_Dungeon+"01", STR_Tile+area_MI+'220', STR_ow_axis+'00');


row3=row0+$0A; y3=row3<<3; // PC spawn row Right+Left exit
row4=row3+$01; y4=row4<<3;
row5=row0+$10; y5=row5<<3;
var _DUR = 4; // SpTrC revolution duration
var _PI1 = global.PI_MOB_BLU; // To contrast w/ red walls
_dist=$0A<<3; 
x3=($0F<<3)+4; _a=0;
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  8, 1,_DUR,2*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  8, 1,_DUR,2*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
//                                                                          //
data_spin_trap(SpTrC,$1,  x0,               y5,  _PI1,  8, 1,_DUR-1,2*90); // SpTrC: spins on chain
//                                                                          //
x3=($48<<3)+4; _a=0;
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  8, 1,_DUR,2*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  8, 1,_DUR,2*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  E8  --------------------------- 
//    Testing: Vertical challenge. Stab wall in middle of jump and use pushback to get to higher level. CHAL_VerticalClimb_007.tmx
rm_num  = $E8;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'221', STR_View+'02', STR_ow_axis+'00');


row3=row0+$0E; y3=row3<<3; // PC spawn row Right exit
row4=$0B; y4=row4<<3;


clm3=$0C;
data_exit(EXM0,etB0,1,  clm3,row4,  CLMS2,ROWS2,  clm3+1,row4,  rm_num_+EXM0_); // MID 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  E9  --------------------------- 
//    Super Mario Bros 1, 1-1 rendition. SMB1_000.tmx
rm_num  = $E9;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'222', STR_ow_axis+'00');


row3=row0+$17; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,Bot_A,$1,  $56<<3,y3); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  EA  --------------------------- 
//    Testing: Horizontal moving platform. Dungeon_Room_043.tmx
rm_num  = $EA;
set_rm_data(area+hex_str(rm_num), MUS_DUNGEON1, STR_Tile+area_MI+'223', STR_ow_axis+'00');


row3=row0+$08; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$16; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($09<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($75<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
clm3=$35; clm4=$48;
_data=hex_str(row5)+hex_str(clm3) + hex_str(row5)+hex_str(clm4);
data_Platform(PlatformA,$1,  clm3<<3,(row0+$16)<<3,  global.PI_MOB_ORG, 1, 0, _data);


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  EB  --------------------------- 
//    Moai outside 1
rm_num  = $EB;
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








//   --------------------------  EC  --------------------------- 
//     Testing: Slimes running across gaps. Gaps are 4 clms wide.
// Test unsuccessful, 4 clm gaps are too wide.
rm_num  = $EC;
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








//   --------------------------  ED  --------------------------- 
//     Testing: Slimes running across gaps. Gaps are 3 clms wide.
// Test was successful. Slimes can run across 3 clm wide gaps as long as they are using the fast hspd.
rm_num  = $ED;
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









//   --------------------------  EE  --------------------------- 
//    Testing: Fokka Elevator Guantlet 1
rm_num  = $EE;
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








//   --------------------------  EF  --------------------------- 
//     Walking the dog scene
rm_num  = $EF;
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








//   --------------------------  F0  --------------------------- 
//     Testing Small Dungeon Room 2. Dungeon_Room_027.tmx
rm_num  = $F0;
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








//   --------------------------  F1  --------------------------- 
//     Testing Small Dungeon Room 1. Dungeon_Room_026.tmx
rm_num  = $F1;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'229', STR_ow_axis+'00', STR_show_ow_pos+'00');


clm3=clm1; // Door center clm
clm4=clm3-3; clm5=clm3+1; row3=row0+$0E; row4=row3+1;
//data_spawn(rm+STR_PRIO,TorchA,$1,  (clm4<<3)+4,row4<<3,  STR_Lit,STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  (clm5<<3)+4,row4<<3,  STR_Lit,STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE


clm4=clm3-1;
data_exit(EXM0,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4+1,row3,  0); // MID 0, to Overworld 
//data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$18,  0); // LFT 0, to Overworld 
//data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0E,  0); // RGT 0, to Overworld 








//   --------------------------  F2  --------------------------- 
//     Big square room with 4-way long firerope in center. Dungeon_Room_022.tmx
rm_num  = $F2;
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








//   --------------------------  F3  --------------------------- 
//     Testing spikes
rm_num  = $F3;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_MI+'233', STR_ow_axis+'00', STR_show_ow_pos+'00');


data_spawn(rm+STR_PRIO,TorchA,$1,  $19<<3,(row0+$13)<<3,  STR_Lit,STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$18,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0E,  0); // RGT 0, to Overworld 








//  ==================================================================================
//  ==================================================================================
mus0 = Audio.MUS_Z1_DNGN1;
ow_axis = 0;
//   --------------------------  F4  --------------------------- 
//     .
rm_num  = $F4;
set_rm_data(area+hex_str(rm_num), STR_Battle+'02', STR_Tile+area_MI+'234', STR_ow_axis+hex_str(!ow_axis));


row4 = row0+$17;
y3 = (row0+$13)<<3;
//data_NIAO_1a( rm+STR_NIAO+'0', $0000, 1, Cloud_1_init); // 
//data_spawn(rm+STR_PRXM,LowdA,$1,  $18<<3,y3); // Lowder  1 


clm3 = $21;
data_exit(EXM0,etB0,1,  clm3-1,row4,  CLMS2,ROWS2,  clm3+1,row4,  'FB'+EXL0_); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row4,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  0); // RGT 0, to Overworld 








//   --------------------------  F5  --------------------------- 
//     .
rm_num  = $F5;
set_rm_data(area+hex_str(rm_num), mus0, STR_Dark+'01', STR_Tile+area_EA+'135', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


y3 =(row0+$17)<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  XT0,(row0+$16)<<3,  STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $19<<3,y3,  STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $25<<3,y3,  STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE
y3 =(row0+$0C)<<3;  _pi=global.PI_BGR2;
data_spawn(rm+STR_PRIO,SpDrA,$3,  $13<<3,y3,  dk_PI+hex_str(_pi),STR_Type+hex_str(4)); // Drop spawner v3. Drops Bot & Flame1
data_spawn(rm+STR_PRIO,SpDrA,$3,  $2B<<3,y3,  dk_PI+hex_str(_pi),STR_Type+hex_str(4)); // Drop spawner v3. Drops Bot & Flame1


//data_exit(EXU0,etA4,0,  $0A,row_e0,  $2C,ROWS_E0,  clm1-1,row_e4,  rm_num_+EXU0_); // UP  0, Pit up 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$15,  'F6'+EXR0_); // LFT 0, 


data_spawn(rm+STR_PRIO,ItmE0,$1,  $34<<3,(row0+$15)<<3); // Magic Jar (Full)








//   --------------------------  F6  --------------------------- 
//     .
rm_num  = $F6;
set_rm_data(area+hex_str(rm_num), mus0, STR_Dark+'01', STR_Tile+area_MI+'235', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


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


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  'F7'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  'F5'+EXL0_); // RGT 0, 
//data_exit(EXR1,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$18,  rm_num_+EXR1_); // RGT 1, 


data_spawn(rm+STR_PRIO,ItmF0,$1,  $33<<3,$4E<<3); // PBag 1: 50 







//   --------------------------  F7  --------------------------- 
//     .
rm_num  = $F7;
set_rm_data(area+hex_str(rm_num), mus0, STR_Dark+'01', STR_Tile+area_MI+'237', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


x3 = $57<<3; y3 =((row0+$19)<<3)+3;
_data  = hex_str((x3>>8)&$FF)+hex_str((x3>>0)&$FF) + hex_str((y3>>8)&$FF)+hex_str((y3>>0)&$FF);
data_NIAO_1a(rm+STR_NIAO+"0",  $0000,1,AdditionalBGGraphics_init,  global.PI_BGR3,  spr_Skull_2a_WRB,0,DEPTH_BG3-1,_data);
row4 = row0+$16;
row3 = row0+$17;
y3   = row3<<3;
_pi  = global.PI_BGR4;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($08<<3)+4,y3,  dk_PI+hex_str(_pi)); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($16<<3)+4,y3,  dk_PI+hex_str(_pi)); // v1: Light w/ CANDLE or FIRE
y3   =(row0+$13)<<3;
data_spawn(rm+STR_PRXM,Stallakk,$1,  $40<<3,(row3<<3)+3); // Stallakk  1 


clm3  = $10; // Elevator center
data_exit(EXU0,etC0,1,  clm3-4,row_e0,  CLMS4,ROWS_E0,  clm3-1,row_e1,  'F8'+EXD0_); // UP  0, Elevator up 
data_Elev(EXU0_, clm3,row0+$14);                                            // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  'F6'+EXL0_); // RGT 0, 








//   --------------------------  F8  --------------------------- 
//     .
rm_num  = $F8;
set_rm_data(area+hex_str(rm_num), 0, STR_Dark+'01', STR_Tile+area_MI+'239', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


x3   = $19<<3;
x4   = $26<<3;
y3   = $0A<<3;
y4   = $16<<3;
y5   = $22<<3;
y6   = $2E<<3;
y7   = $3A<<3;
_pi  = global.PI_BGR4;
data_spawn(rm+STR_PRIO,TorchA,$3,  x3,y3,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x4,y3,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x3,y4,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x4,y4,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x3,y5,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x4,y5,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x3,y6,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x4,y6,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x3,y7,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x4,y7,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
_val=($01<<3)+2;
x3-=$01<<3;  x3 = hex_str((x3>>8)&$FF)+hex_str((x3>>0)&$FF);
x4+=$02<<3;  x4 = hex_str((x4>>8)&$FF)+hex_str((x4>>0)&$FF);
y3+=_val;    y3 = hex_str((y3>>8)&$FF)+hex_str((y3>>0)&$FF);
y4+=_val;    y4 = hex_str((y4>>8)&$FF)+hex_str((y4>>0)&$FF);
y5+=_val;    y5 = hex_str((y5>>8)&$FF)+hex_str((y5>>0)&$FF);
y6+=_val;    y6 = hex_str((y6>>8)&$FF)+hex_str((y6>>0)&$FF);
y7+=_val;    y7 = hex_str((y7>>8)&$FF)+hex_str((y7>>0)&$FF);
_data  = x3+y3 + x4+y3;
_data += x3+y4 + x4+y4;
_data += x3+y5 + x4+y5;
_data += x3+y6 + x4+y6;
_data += x3+y7 + x4+y7;
data_NIAO_1a(rm+STR_NIAO+"0",  $0000,1,AdditionalBGGraphics_init,  global.PI_BGR3,  spr_Skull_2a_WRB,0,DEPTH_BG3-1,_data);


clm3  = clm1; // Elevator center clm
data_exit(EXU0,etC0,1,  clm3-4,ROWE0,  CLMS4,ROWS_E0,  clm3-1,ROWE1,  'FA'+EXD0_); // UP  0, Elevator up 
data_exit(EXD0,etC0,1,  clm3-4,row_e2,  CLMS4,ROWS_E0,  clm3-1,row_e3,  'F7'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_, clm3,row0+$15);                                            // Elevator DW $40, 







//   --------------------------  F9  --------------------------- 
//     .
rm_num  = $F9;
set_rm_data(area+hex_str(rm_num), 0, STR_Dark+'01', STR_Tile+area_MI+'240', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


y3   =(row0+$13)<<3;
//data_spawn(rm+STR_PRXM,LowdA,$1,  $18<<3,y3); // Lowder  1 


data_exit(EXD0,etA0,1,  $0A,row_e2,  $2C,ROWS_E0,  clm3,row_e3,  rm_num_+EXL0_); // DWN 0, Pit down 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0C,  'FA'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0C,  rm_num_+EXL0_); // RGT 0, 








//   --------------------------  FA  --------------------------- 
//     .
rm_num  = $FA;
set_rm_data(area+hex_str(rm_num), 0, STR_Dark+'01', STR_Tile+area_MI+'241', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


x3 = $57<<3; y3 =((row0+$18)<<3)+3;
_data  = hex_str((x3>>8)&$FF)+hex_str((x3>>0)&$FF) + hex_str((y3>>8)&$FF)+hex_str((y3>>0)&$FF);
data_NIAO_1a(rm+STR_NIAO+"0",  $0000,1,AdditionalBGGraphics_init,  global.PI_BGR3,  spr_Skull_2a_WRB,0,DEPTH_BG3-1,_data);

row3 = row0+$17;
y3   = row3<<3;
_pi  = global.PI_BGR4;
//data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,row0+$15,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$3,  $58<<3,y3,  dk_PI+hex_str(_pi)); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$3,  $69<<3,y3,  dk_PI+hex_str(_pi)); // v1: Light w/ CANDLE or FIRE

y3   =(row0+$13)<<3;
//data_spawn(rm+STR_PRXM,LowdA,$1,  $18<<3,y3); // Lowder  1 


clm3  = $61; // Elevator center
data_exit(EXD0,etC0,1,  clm3-4,row_e2+$08,  CLMS4,ROWS_E0,  clm3-1,row_e3,  'F8'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$14);                                            // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$14,  'FB'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$16,  'F9'+EXL0_); // RGT 0, 








//   --------------------------  FB  --------------------------- 
//     .
rm_num  = $FB;
set_rm_data(area+hex_str(rm_num), 0, STR_Dark+'00', STR_Tile+area_MI+'238', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


_pi=global.PI_BGR4;
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,$0A<<3,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,$35<<3,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
y3   =(row0+$13)<<3;
//data_spawn(rm+STR_PRXM,LowdA,$1,  $18<<3,y3); // Lowder  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,$08,  'FB'+EXM0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,$34,  'FA'+EXL0_); // RGT 0, 








//  =====================================================================================
//  =====================================================================================
//  =====================================================================================
//  =====================================================================================
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




