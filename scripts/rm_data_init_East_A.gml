/// rm_data_init_East_A()


var _obj, _ver, _val, _depth;
var _spr, _pi;
var _dist1,_dist2;
var _i, _a, _x,_xl, _y,_yt, _w,_h;
var _color_idx,_color_idx2,_color_idx3;
var _pages, _data, _map_area;
var _config_ver;
var _file, _area_name,_rm_name;
var _exit;
//var _exit_name = REEN_DEFAULT;
var _DEPTH1 = DEPTH_NPC2;
var _WHALE_ISL_OUTSIDE_RM_NAME = undefined;





var _MapAreaName_NABOORU_FIELD      = "NABOORU FIELD";
var _MapAreaName_NABOORU_BAY        = "NABOORU BAY";
var _MapAreaName_NABOORU_FOREST     = "NABOORU FOREST";

var _MapAreaName_DARUNIA_MOUNTAINS  = "DARUNIA MOUNTAINS";
var _MapAreaName_DARUNIA_FIELD      = "DARUNIA FIELD";
var _MapAreaName_DARUNIA_FOREST     = "DARUNIA FOREST";

var _MapAreaName_KASUTO_RIVER       = "KASUTO RIVER";
var _MapAreaName_KASUTO_CEMETERY    = "KASUTO CEMETERY";

var _MapAreaName_SEASHORE           = "SEASHORE";
var _MapAreaName_VALLEY_OF_DEATH    = "VALLEY OF DEATH";
var _MapAreaName_WHALE_ISLAND       = "WHALE ISLAND";
var _MapAreaName_DRAGMIRE           = "DRAGMIRE";






// ------------------------------ EAST HYRULE ------------------------------  
area = area_EA;
dark_id = 0; // 0: Cave











//   --------------------------  00  ---------------------------  
//   Bridge N of Old Kasuto  
rm_num  = $00;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'000', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_KASUTO_RIVER);


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);


data_spawn(rm+STR_PRXM,ZoraA,$1,  $1D0,$60); // $AE: Zora  1 
data_spawn(rm+STR_PRIO,SpBaA,$1,  $0,$C0); // $60: BagoSpawner  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$0E,  0);   // LFT 0, to Overworld   
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$0E,  0);   // RGT 0, to Overworld   


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  01  ---------------------------  
//   Bridge to Old Kasuto  
rm_num  = $01;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'000', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_KASUTO_RIVER);


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);


data_spawn(rm+STR_PRXM,ZoraA,$1,  $1D0,$60); // $AE: Zora  1 
data_spawn(rm+STR_PRIO,SpBaA,$1,  $0,$C0); // $60: BagoSpawner  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$0E,  0);   // LFT 0, to Overworld   
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$0E,  0);   // RGT 0, to Overworld   


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  02  ---------------------------  
//   Gauntlet 1  
rm_num  = $02;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'002', STR_ow_axis+'01');


row3=row0+$17; y3=row3<<3; row4=row0+$0B; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
data_spawn(rm+STR_PRXM,GeruA,$1,  $38<<3,y3); // Geru  1 
data_spawn(rm+STR_PRXM,GeruB,$1,  $1E<<3,y4); // RockGeru  1 
data_spawn(rm+STR_PRXM,GeruB,$1,  $3E<<3,y4); // RockGeru  1 
data_spawn(rm+STR_PRXM,GeruB,$1,  $6C<<3,y4); // RockGeru  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  03  ---------------------------  
//   Gauntlet 2  
rm_num  = $03;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'002', STR_ow_axis+'01');


row3=row0+$17; y3=row3<<3; row4=row0+$0B; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
data_spawn(rm+STR_PRXM,ZoraA,$1,  $3A<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,GeruB,$1,  $1E<<3,y4); // RockGeru  1 
data_spawn(rm+STR_PRXM,GeruB,$1,  $3E<<3,y4); // RockGeru  1 
data_spawn(rm+STR_PRXM,GeruB,$1,  $6C<<3,y4); // RockGeru  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  04  ---------------------------  
//   Gauntlet 3  
rm_num  = $04;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'002', STR_ow_axis+'01');


row3=row0+$17; y3=row3<<3; row4=row0+$0B; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
data_spawn(rm+STR_PRXM,GeruA,$1,  $38<<3,y3); // Geru  1 
data_spawn(rm+STR_PRXM,GeruB,$1,  $1E<<3,y4); // RockGeru  1 
data_spawn(rm+STR_PRXM,GeruB,$1,  $3E<<3,y4); // RockGeru  1 
data_spawn(rm+STR_PRXM,GeruB,$1,  $6C<<3,y4); // RockGeru  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  05  ---------------------------  
//   Gauntlet to volcano area  
rm_num  = $05;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'002', STR_ow_axis+'01');


row3=row0+$17; y3=row3<<3; row4=row0+$0B; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
data_spawn(rm+STR_PRXM,Moa_A,$2,  $00<<3,(row0+$11)<<3); // Moa  2 
//data_spawn(rm+STR_PRXM,Moa_A,$2,  $00<<3,(row0+$15)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $3A<<3,(row0+$0F)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $6A<<3,(row0+$11)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,GeruB,$1,  $1E<<3,y4); // RockGeru  1 
data_spawn(rm+STR_PRXM,GeruB,$1,  $3E<<3,y4); // RockGeru  1 
data_spawn(rm+STR_PRXM,GeruB,$1,  $6C<<3,y4); // RockGeru  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_CROSS);








//   --------------------------  06  ---------------------------  
//   Darunia Mtn N trap  
rm_num  = $06;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'006', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_DARUNIA_MOUNTAINS);


row3=row0+$17; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
data_spawn(rm+STR_PRIO,SpPoA,$1,  $00<<3,(row0+$00)<<3); // BubbleSpawner  1 
data_spawn(rm+STR_PRXM,OctoA,$2,  $1A<<3,(row0+$0D)<<3); // Octorok  2 
data_spawn(rm+STR_PRXM,OctoA,$2,  $24<<3,(row0+$0F)<<3); // Octorok  2 
data_spawn(rm+STR_PRXM,OctoA,$2,  $42<<3,(row0+$13)<<3); // Octorok  2 
data_spawn(rm+STR_PRXM,OctoA,$2,  $62<<3,(row0+$17)<<3); // Octorok  2 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$09,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  07  ---------------------------  
//   Heart container in sea near Palace 5
rm_num  = $07;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'007', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_NABOORU_BAY, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$18,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$18,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_HP,CONT_PIECE_OBJ_VER_HP,  ($39<<3)+$5,(row0+$10)<<3,  STR_Treasure+STR_Map+"02"); // HEART PIECE


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  08  ---------------------------  
//   Cave directly N of NABOORU  
rm_num  = $08;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'008', STR_ow_axis+'00', STR_show_ow_pos+'00');


row3=row0+$16; y3=row3<<3; y4=(row0+$06)<<3; y5=(row3+$01)<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $78<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,AcheA,$2,  $80,y4); // $88: Ache  2 
data_spawn(rm+STR_PRXM,AcheA,$2,  $160,y4); // $88: Ache  2 
data_spawn(rm+STR_PRXM,AcheA,$2,  $260,y4); // $88: Ache  2 
data_spawn(rm+STR_PRXM,ZoraA,$1,  $300,y3); // $AE: Zora  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0);   // LFT 0, to Overworld   
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0);   // RGT 0, to Overworld   


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  09  ---------------------------  
//   Cave S of NABOORU 1a  
rm_num  = $09;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'009', STR_ow_axis+'01', STR_show_ow_pos+'00');


data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,$0B<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $78<<3,$0B<<3); // v1: Light w/ CANDLE or FIRE

data_spawn(rm+STR_PRXM,TektA,$1,  $C0,$70); // $AB: Tektite  1 
data_spawn(rm+STR_PRXM,TektA,$1,  $1D0,$90); // $AB: Tektite  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$0A,  0);   // LFT 0, to Overworld   
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$0A,  '0A'+'20');        // RGT 0,   


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  0A  ---------------------------  
//   Cave S of NABOORU 1b  
rm_num  = $0A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'010', STR_ow_axis+'01', STR_show_ow_pos+'00');


row3=row0+$16; y3=row3<<3; y4=(row0+$06)<<3; y5=(row3+$01)<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,y5); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $58<<3,$19<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,ArurA,$1,  $290,y3); // $8A: Aruroda  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '09'+'10');        // LFT 0,   


data_spawn(rm+STR_PRIO,ItmF0,$8,  $370,y3); // PBag 500 


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);












//   --------------------------  0B  ---------------------------  
//   Kasuto Swamp cave 1a  
rm_num  = $0B;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'011', STR_ow_axis+'00', STR_show_ow_pos+'00');


row3=row0+$16; y3=row3<<3; y4=(row0+$06)<<3; y5=(row3+$01)<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $78<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GiruA,$1,  $1C0,(row0+$14)<<3); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $210,(row0+$0E)<<3); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $2D0,(row0+$06)<<3); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $310,(row0+$0A)<<3); // $99: Girubokku  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0);   // LFT 0, to Overworld   
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '0C'+'20');        // RGT 0,   


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  0C  ---------------------------  
//   Kasuto Swamp cave 1b  
rm_num  = $0C;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'010', STR_ow_axis+'00', STR_show_ow_pos+'00');


row3=row0+$16; y3=row3<<3; y4=(row0+$06)<<3; y5=(row3+$01)<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,y5,  STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $58<<3,y5,  STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE

data_spawn(rm+STR_PRXM,ArurA,$1,  $290,y3); // $8A: Aruroda  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '0B'+'10');        // LFT 0,   


data_spawn(rm+STR_PRIO,ItmF0,$8,  $350,y3); // PBag 500 


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);










//   --------------------------  0D  ---------------------------  
//   Cave to New Kasuto 1a  
rm_num  = $0D;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'013', STR_ow_axis+'00', STR_show_ow_pos+'00');


row3=row0+$16; y3=row3<<3; y4=(row0+$06)<<3; y5=(row3+$01)<<3; y6=(row0+$14)<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $78<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,TektA,$1,  $D0,y6); // $AB: Tektite  1 
data_spawn(rm+STR_PRXM,TektA,$1,  $190,y6); // $AB: Tektite  1 
data_spawn(rm+STR_PRXM,TektA,$1,  $330,y6); // $AB: Tektite  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0);   // LFT 0, to Overworld   
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '0E'+'20');        // RGT 0,   


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  0E  ---------------------------  
//   Cave to New Kasuto 1b  
rm_num  = $0E;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'009', STR_ow_axis+'00', STR_show_ow_pos+'00');


data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,$0B<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $78<<3,$0B<<3); // v1: Light w/ CANDLE or FIRE

data_spawn(rm+STR_PRXM,GeruA,$1,  $110,$40); // $97: Geru  1 
data_spawn(rm+STR_PRXM,GeruA,$2,  $340,$90); // $97: Geru  2 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$0A,  '0D'+'10');        // LFT 0,   
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$0A,  0);   // RGT 0, to Overworld   


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  0F  ---------------------------  
//     Fast Travel - Northern Islands to North of Mido
rm_num  = $0F;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'061', STR_ow_axis+'00', dk_SceneMusicThemeException+"01");


row3=row0+$16; y3=row3<<3;
row4=row3-$02; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init);


clm3=clm0-1;
data_exit(EXM0,etB2,1,  clm3,row4,  $03,ROWS2,  clm3-1,row4,  area_WA+'41'+EXM0_); // MID 0, to North of Mido
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld








//   --------------------------  10  ---------------------------  
//   Cave to Palace 7  
rm_num  = $10;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'040', STR_ow_axis+'00', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_VALLEY_OF_DEATH);


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $77<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GeruA,$3,  $14<<3,y3); // Geru  3
data_spawn(rm+STR_PRXM,GeruA,$2,  $54<<3,y3); // Geru  2


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  11  ---------------------------  
//     Sea cave near Darunia
rm_num  = $11;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_WA+'239', STR_ow_axis+'01', STR_show_ow_pos+'00');


x3=(clms0-$09)<<3; row3=row0+$16; y3=row3<<3; y4=(row3+$01)<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,y4); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,y4,  STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $58<<3,y4,  STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,OctoA,$1,  $1E<<3,y3); // Octorok  1
data_spawn(rm+STR_PRXM,OctoA,$1,  $26<<3,y3); // Octorok  1
data_spawn(rm+STR_PRXM,OctoA,$1,  $2A<<3,y3); // Octorok  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, to Overworld 


data_spawn(rm+STR_PRIO,ItmF0,$8,  $2C<<3,y3); // PBag 500 
//data_spawn(rm+STR_PRIO,ItmE0,$1,  $2C<<3,y3); // Magic Jar (Full)


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);








//   --------------------------  12  ---------------------------  
//     Sea cave NE of Nabooru
rm_num  = $12;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'255', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_NABOORU_BAY);


row3=row0+$18; y3=row3<<3;
row4=row0+$16; y4=row4<<3;
data_spawn(rm+STR_PRXM,OctoA,$1,  $13<<3,y4); // Octorok  1


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_HP,CONT_PIECE_OBJ_VER_HP,  ($0B<<3)+6,y4,  STR_Treasure+STR_Map+"02"); // HEART PIECE


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_00",rm);









//   --------------------------  13  ---------------------------  
//   Cave in volcano area W end  
rm_num  = $13;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'040', STR_ow_axis+'00', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_VALLEY_OF_DEATH, dk_SceneMusicThemeException+"01");


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $77<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GeruA,$3,  $14<<3,y3); // Geru  3 
data_spawn(rm+STR_PRXM,ArurA,$1,  $54<<3,y3); // Aruroda  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '14'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  14  ---------------------------  
//   Cave in volcano area E end  
rm_num  = $14;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'084', STR_ow_axis+'00', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_VALLEY_OF_DEATH, dk_SceneMusicThemeException+"01");
//set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'009', STR_ow_axis+'00', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_VALLEY_OF_DEATH);



data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,$0B<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $78<<3,$0B<<3); // v1: Light w/ CANDLE or FIRE

data_spawn(rm+STR_PRXM,GiruA,$1,  $70,$70); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $C0,$60); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1A0,$70); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $1E0,$80); // $A2: Moa  2 
data_spawn(rm+STR_PRXM,GiruA,$1,  $210,$60); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $330,$70); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $310,$90); // $A2: Moa  2 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$0A,  '13'+'10');        // LFT 0,   
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$0A,  0);   // RGT 0, to Overworld   


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_CROSS);







//   --------------------------  15  ---------------------------  
//     Kasuto Lake (above Palace 6 desert)
rm_num  = $15;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'066', STR_ow_axis+'00', STR_show_ow_pos+'00', dk_SceneMusicThemeException+"01");


y3=(row0+$0A)<<3;
y4=(row0+$0E)<<3;
y5=(row0+$1A)<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,OctoA,$1,  $1E<<3,y5); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $34<<3,y4); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $2C<<3,y5); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $6A<<3,y5); // Octorok  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$18,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$18,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  $50<<3,y3,  STR_Treasure+STR_Map+"02"); // MAGIC PIECE


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);






//   --------------------------  16  ---------------------------  
//     Lake to the right of River Devil
rm_num  = $16;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'068', STR_ow_axis+'00', STR_show_ow_pos+'00', dk_SceneMusicThemeException+"01");


y3 = (row0+$1A)<<3;
y4 = (row0+$16)<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,OctoA,$1,  $10<<3,y3); // $A8: Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $1A<<3,y4); // $A8: Octorok  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$18,  0); // LFT 0, to Overworld 


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  $2C<<3,(row0+$0E)<<3,  STR_Treasure+STR_Map+"02"); // MAGIC PIECE


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);






//   --------------------------  17  ---------------------------  
//   Darunia Mtn S trap  
rm_num  = $17;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'006', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_DARUNIA_MOUNTAINS);


row3=row0+$17; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
//data_spawn(rm+STR_PRIO,SpPoA,$1,  0,0); // BubbleSpawner  1 
data_spawn(rm+STR_PRXM,OctoA,$2,  $1A<<3,(row0+$0D)<<3); // Octorok  2 
data_spawn(rm+STR_PRXM,OctoA,$2,  $28<<3,(row0+$0F)<<3); // Octorok  2 
data_spawn(rm+STR_PRXM,OctoA,$2,  $38<<3,(row0+$11)<<3); // Octorok  2 
data_spawn(rm+STR_PRXM,OctoA,$2,  $40<<3,(row0+$13)<<3); // Octorok  2 
data_spawn(rm+STR_PRXM,OctoA,$2,  $4C<<3,(row0+$13)<<3); // Octorok  2 
data_spawn(rm+STR_PRXM,OctoA,$2,  $62<<3,(row0+$17)<<3); // Octorok  2 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$09,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  18  ---------------------------  
//   volcano area trap 2  
rm_num  = $18;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'024', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_VALLEY_OF_DEATH, dk_SceneMusicThemeException+"01");


row3=row0+$14; y3=row3<<3;
data_spawn(rm+STR_PRXM,GeruA,$1,  $16<<3,y3); // Geru  1 
data_spawn(rm+STR_PRXM,GeruA,$1,  $57<<3,y3); // Geru  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $34<<3,y3); // Girubokku  1 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $40<<3,(row0+$10)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $4E<<3,(row0+$12)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $54<<3,(row0+$16)<<3); // Moa  2 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_CROSS+STR_JUMP);







//   --------------------------  19  ---------------------------  
//   volcano area trap 3  
rm_num  = $19;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'024', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_VALLEY_OF_DEATH, dk_SceneMusicThemeException+"01");


row3=row0+$14; y3=row3<<3;
data_spawn(rm+STR_PRXM,GeruA,$2,  $16<<3,y3); // Geru  2
data_spawn(rm+STR_PRXM,GeruA,$2,  $57<<3,y3); // Geru  2
data_spawn(rm+STR_PRXM,GiruA,$1,  $34<<3,y3); // Girubokku  1 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $40<<3,(row0+$16)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $4C<<3,(row0+$12)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $52<<3,(row0+$14)<<3); // Moa  2 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_CROSS+STR_JUMP);






//   --------------------------  1A  ---------------------------  
//   volcano area trap 1  
rm_num  = $1A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'024', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_VALLEY_OF_DEATH, dk_SceneMusicThemeException+"01");


row3=row0+$14; y3=row3<<3;
data_spawn(rm+STR_PRXM,GeruA,$1,  $16<<3,y3); // Geru  1
data_spawn(rm+STR_PRXM,GeruA,$1,  $57<<3,y3); // Geru  1
data_spawn(rm+STR_PRXM,GiruA,$1,  $34<<3,y3); // Girubokku  1 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $40<<3,(row0+$10)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $4E<<3,(row0+$12)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $54<<3,(row0+$16)<<3); // Moa  2 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_CROSS+STR_JUMP);






//   --------------------------  1B  ---------------------------  
//    
rm_num  = $1B;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'015', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_VALLEY_OF_DEATH, dk_SceneMusicThemeException+"01");


row3=row0+$12; y3=row3<<3;
row4=row0+$14; y4=row4<<3;


clm3=$1F; clms3=$03;
data_exit(EXM0,etB3,1,  clm3,row4,  clms3,ROWS2,  clm3-1,row4,  area_TA+'54'+EXM1_); // MID 0, Fast-travel to Town
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 








//   --------------------------  1C  ---------------------------  
//     Secret field tile left end of field E of Darunia
rm_num  = $1C;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'070', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DARUNIA_FIELD, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3, StarSky_1_init); // 
data_spawn(rm+STR_PRXM,TektA,$1,  x0,(row0+$14)<<3); // $AB: Tektite  1 
data_spawn(rm+STR_PRXM,BoonA,$1,  $28<<3,(row0+$08)<<3); // $8D: Boon  1 


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$17,  0); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmF0,$7,  $15<<3,(row0+$19)<<3); // PBag $7: 400


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_00",rm);







//   --------------------------  1D  ---------------------------  
//   Desert encounter N         - ENCOUNTER -   
rm_num  = $1D;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'029', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);

data_spawn(rm+STR_PRXM,LeevA,$1,  $30,$B0); // $9D: Leever  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $A0,$B0); // $A8: Octorok  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $E0,$B0); // $9D: Leever  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $110,$B0); // $9D: Leever  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $1D0,$B0); // $9D: Leever  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $210,$B0); // $A8: Octorok  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $260,$B0); // $9D: Leever  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $2B0,$B0); // $9D: Leever  1 

data_spawn(rm+STR_PRXM,LeevA,$1,  $60,$B0,STR_Strong+STR_Encounter); // $9D: Leever  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $E0,$B0,STR_Strong+STR_Encounter); // $9D: Leever  1 
data_spawn(rm+STR_PRXM,ZoraA,$1,  $110,$B0,STR_Strong+STR_Encounter); // $AE: Zora  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $1E0,$B0,STR_Strong+STR_Encounter); // $9D: Leever  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $230,$B0,STR_Strong+STR_Encounter); // $9D: Leever  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $2A0,$B0,STR_Strong+STR_Encounter); // $9D: Leever  1 


data_exit(EXM0,etB0,0,  $30,row0+$16,  CLMS2,ROWS2,  CLM5,row0+$16,  0);  // MID 0, to Overworld   
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$16,  0);  // LFT 0, to Overworld   
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$16,  0);  // RGT 0, to Overworld   







//   --------------------------  1E  ---------------------------  
//   Desert encounter S         - ENCOUNTER -   
rm_num  = $1E;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'029', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);


data_spawn(rm+STR_PRXM,ArurA,$1,  $80,$B0); // $8A: Aruroda  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $270,$B0); // $8A: Aruroda  1 

data_spawn(rm+STR_PRXM,LeevA,$1,  $60,$B0,STR_Strong+STR_Encounter); // $9D: Leever  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $80,$B0,STR_Strong+STR_Encounter); // $8A: Aruroda  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $130,$B0,STR_Strong+STR_Encounter); // $9D: Leever  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $1F0,$B0,STR_Strong+STR_Encounter); // $9D: Leever  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $260,$B0,STR_Strong+STR_Encounter); // $8A: Aruroda  1 


data_exit(EXM0,etB0,0,  $30,row0+$16,  CLMS2,ROWS2,  CLM5,row0+$16,  0);  // MID 0, to Overworld   

data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$16,  0);  // LFT 0, to Overworld   
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$16,  0);  // RGT 0, to Overworld   







//   --------------------------  1F  ---------------------------  
//     Cave west edge of volcano area
rm_num  = $1F;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'095', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_VALLEY_OF_DEATH, dk_SceneMusicThemeException+"01");


row3=row0+$14; y3=row3<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  (clms0-$B)<<3,(row3+$01)<<3); // v1: Light w/ CANDLE or FIRE


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_HP,CONT_PIECE_OBJ_VER_HP,  ($0E<<3)-3,y3,  STR_Treasure+STR_Map+"02"); // HEART PIECE


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_00",rm);








//   --------------------------  20  ---------------------------  
//    Southern tip of far N island. BOOTS and RAFT locked
rm_num  = $20;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'071', STR_ow_axis+'00', STR_show_ow_pos+'00', dk_SceneMusicThemeException+"01");


row4 = row0+$14;
y3   =(row0+$1A)<<3;
y4   =(row0+$16)<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,OctoA,$1,  $1A<<3,y3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $28<<3,y4); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $48<<3,y3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $5C<<3,y4); // Octorok  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row4,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$18,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_HP,CONT_PIECE_OBJ_VER_HP,  $65<<3,row4<<3,  STR_Treasure+STR_Map+"01"); // HEART PIECE


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);






//   --------------------------  21  ---------------------------  
//   PBag secret S of Palace 5  
rm_num  = $21;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'033', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_NABOORU_BAY, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,LeevA,$1,  $0C<<3,$18<<3); // $9D: Leever  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $1C<<3,$18<<3); // $9D: Leever  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $20<<3,$18<<3); // $9D: Leever  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $2A<<3,$18<<3); // $9D: Leever  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $6E<<3,$18<<3); // $9D: Leever  1 


row3 = row2-2;
data_exit(EXM0,etB0,0,  $30,row3,  CLMS2,ROWS2,  CLM5,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,ItmF0,$8,  $50<<3,$12<<3); // PBag 500 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_JUMP);







//   --------------------------  22  ---------------------------  
//   Field encounter N         - ENCOUNTER -   
rm_num  = $22;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'034', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");
data_NIAO_1a(rm+STR_NIAO + '0', $0000, 1, Cloud_1_init); // 


data_spawn(rm+STR_PRXM,TektA,$1,  $D0,$B0); // $AB: Tektite  1 
data_spawn(rm+STR_PRXM,TektA,$1,  $120,$B0); // $AB: Tektite  1 
data_spawn(rm+STR_PRXM,TektA,$1,  $290,$B0); // $AB: Tektite  1 

data_spawn(rm+STR_PRXM,TektA,$1,  $80,$B0,STR_Strong+STR_Encounter); // $AB: Tektite  1 
data_spawn(rm+STR_PRXM,BoonA,$1,  $180,$40,STR_Strong+STR_Encounter); // $8D: Boon  1 
data_spawn(rm+STR_PRXM,TektA,$1,  $260,$B0,STR_Strong+STR_Encounter); // $AB: Tektite  1 


data_exit(EXM0,etB0,0,  $30,row0+$16,  CLMS2,ROWS2,  CLM5,row0+$16,  0);  // MID 0, to Overworld   
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$16,  0);  // LFT 0, to Overworld   
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$16,  0);  // RGT 0, to Overworld   







//   --------------------------  23  ---------------------------  
//     Dark forest. Forest next to bridge to Maze Is
rm_num  = $23;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'072', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DARUNIA_FOREST);


y3 = (row0+$0D)<<3;
//y3 = (row0+$12)<<3;
y4 = (row0+$14)<<3;
data_spawn(rm+STR_PRXM,GiruA,$1,  $08<<3,y3); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $12<<3,y4); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1A<<3,y3); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $38<<3,y4); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $42<<3,y3); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,y3); // $99: Girubokku  1 


clm3 = $38;
row3 = row0+$18;
row5 = -PAGE_ROWS;
data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,row5,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,row5,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,Kakusu008,$1,  $50<<3,(row0+$1A)<<3,  STR_Treasure+STR_Map+"02"); // 








//   --------------------------  24  ---------------------------  
//    Anju's friend 1(Malo) - outside
rm_num  = $24;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Color+COLOR2_, STR_Tile+area_EA+'079', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_NABOORU_BAY);


row3=row0+$14;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,Bot_A,$1,  $2E<<3,(row0+$16)<<3); // Bot  1 


data_exit(EXM0,etB0,1,  clm1,row3,  CLMS2,ROWS2,  clm1-1,row3,  '25'+EXL0_); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$18,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$18,  0); // RGT 0, to Overworld 


data_rando_scene01("_01"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  25  ---------------------------  
//    Anju's friend Malo, BOOK sequence 1.   owrc: 156,131 = $BC,$83 = $83BC
rm_num  = $25;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'066', STR_ow_axis+hex_str(0));


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_9,$A,  $16<<3,y3,  dk_PI+hex_str(PIc), STR_Palette+p.PAL_NPC_BLU1, STR_Dialogue+DK090A, STR_Sprite+STR_Bill, STR_Depth+string(_DEPTH1)); // BOOK sequence 1, Anju's friend.  STR_Bill: Thin man


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '24'+EXM0_); // LFT 0, 








//   --------------------------  26  ---------------------------  
//   PBag secret W of Nabooru  
rm_num  = $26;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'038', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_NABOORU_FIELD, dk_SceneMusicThemeException+"01");


row3=row0+$16; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
data_spawn(rm+STR_PRXM,GiruA,$1,  $16<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $20<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3C<<3,(row0+$10)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $44<<3,(row0+$0C)<<3); // Girubokku  1 


clm3=$30;
data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  0); // MID 0, to Overworld
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_spawn(rm+STR_PRIO,ItmF0,$4,  $54<<3,(row0+$0A)<<3); // PBag v4:200 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  27  ---------------------------  
//   Forest encounter N         - ENCOUNTER -   
rm_num  = $27;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'039', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");


y3 = (row0+$12)<<3;
y4 = (row0+$14)<<3;
data_spawn(rm+STR_PRXM,GiruA,$1,  $08<<3,y3); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $12<<3,y4); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1A<<3,y3); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $38<<3,y4); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $42<<3,y3); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,y3); // $99: Girubokku  1 

data_spawn(rm+STR_PRXM,DeelA,$2,  $30,$40,STR_Strong+STR_Encounter); // $92: Deeler  2 
data_spawn(rm+STR_PRXM,GiruA,$1,  $70,$90,STR_Strong+STR_Encounter); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,DeelA,$1,  $90,$40,STR_Strong+STR_Encounter); // $92: Deeler  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $D0,$A0,STR_Strong+STR_Encounter); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,DeelA,$2,  $120,$40,STR_Strong+STR_Encounter); // $92: Deeler  2 
data_spawn(rm+STR_PRXM,DeelA,$1,  $1F0,$40,STR_Strong+STR_Encounter); // $92: Deeler  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $200,$90,STR_Strong+STR_Encounter); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,DeelA,$2,  $230,$40,STR_Strong+STR_Encounter); // $92: Deeler  2 
data_spawn(rm+STR_PRXM,GiruA,$1,  $290,$A0,STR_Strong+STR_Encounter); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,DeelA,$1,  $2A0,$40,STR_Strong+STR_Encounter); // $92: Deeler  1 


row3 = row0+$12;
data_exit(EXM0,etB0,0,  $30,row3,  CLMS2,ROWS2,  CLM5,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, to Overworld 






//   --------------------------  28  ---------------------------  
//   Forest encounter S         - ENCOUNTER -   
rm_num  = $28;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'039', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");


data_spawn(rm+STR_PRXM,GeruA,$1,  $70,$90); // $97: Geru  1 
data_spawn(rm+STR_PRXM,DeelA,$1,  $80,$40); // $92: Deeler  1 
data_spawn(rm+STR_PRXM,GeruA,$1,  $250,$90); // $97: Geru  1 
data_spawn(rm+STR_PRXM,DeelA,$1,  $2A0,$40); // $92: Deeler  1 

data_spawn(rm+STR_PRXM,GeruA,$2,  $70,$90,STR_Strong+STR_Encounter); // $97: Geru  2 
data_spawn(rm+STR_PRXM,DeelA,$2,  $80,$40,STR_Strong+STR_Encounter); // $92: Deeler  2 
data_spawn(rm+STR_PRXM,DeelA,$2,  $240,$40,STR_Strong+STR_Encounter); // $92: Deeler  2 
data_spawn(rm+STR_PRXM,GeruA,$2,  $250,$90,STR_Strong+STR_Encounter); // $97: Geru  2 


row3 = row0+$12;
data_exit(EXM0,etB0,0,  $30,row3,  CLMS2,ROWS2,  CLM5,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, to Overworld 






//   --------------------------  29  ---------------------------  
//     Route to NECKLACE outside
rm_num  = $29;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'074', STR_ow_axis+'01');


y3 = (row0+$08)<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,BoonA,$1,  $18<<3,y3); // $8D: Boon  1 
data_spawn(rm+STR_PRXM,BoonA,$1,  $40<<3,y3); // $8D: Boon  1 


row3  = row0+$08;
row4  = row3+6;
rows3 = PAGE_ROWS+row3+4;
rows4 = rows0-row4+PAGE_ROWS;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$18,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,-PAGE_ROWS,  CLMS2,rows3,  clmA,row3,  '2A'+EXL0_); // RGT 0, 
data_exit(EXR1,etA0,1,  clm2,row4,  CLMS2,rows4,  clmA,row0+$18,  '2A'+EXL1_); // RGT 1, 


//data_rando_scene01("_00"+"_02"+"_01"+"_00"+"_00",rm);






//   --------------------------  2A  ---------------------------  
//     Hylian text for spell combo to NECKLACE
rm_num  = $2A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+color_str(p.C_BLU3), STR_Tile+area_EA+'075', STR_ow_axis+'01');


data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
row3=row0+$08; y3=row3<<3;
row4=row0+$18; y4=row4<<3;
row5=row0+$0E; y5=row5<<3;
//data_spawn(rm+STR_PRXM,OctoA,$1,  $1A<<3,y5); // Octorok  1 
//data_spawn(rm+STR_PRXM,OctoA,$1,  $1E<<3,y5); // Octorok  1 
//data_spawn(rm+STR_PRXM,OctoA,$1,  $49<<3,(row0+$12)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $1A<<3,y5); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $1E<<3,y5); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $49<<3,(row0+$12)<<3); // Geldarm  1 
data_spawn(rm+STR_PRIO,NPC_C,$2,  $30<<3,(row0+$0A)<<3,  dk_PI+hex_str(global.PI_BGR4), STR_Dialogue+DK0C01); // Spell combo text


rows3 = PAGE_ROWS+row3+$04;
row5  = row3+$06;
rows4 = rows0-row5+PAGE_ROWS;
data_exit(EXD0,etA1,1,  -PAGE_CLMS,row_e2,  clms1,ROWS5,  $30,row_e3,  '50'+EXU0_); // DWN 0, Pit down 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows3,  CLM3,row3,  '29'+EXR0_); // LFT 0, 
data_exit(EXL1,etA0,1,  CLM2,row5,  CLMS2,rows4,  CLM3,row4,  '29'+EXR1_); // LFT 1, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,ItmE0,$2,  $3A<<3,(row0+$0C)<<3); // v2: Magic Jar, Blue(1 container, $10 mp)








//   --------------------------  2B  --------------------------  
//     Mtn pass far N island
rm_num  = $2B;
//set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'148', STR_ow_axis+'00');
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'059', STR_ow_axis+'00');


row3=row0+$17; y3=row3<<3;
row4=row0+$07; y4=row4<<3;
row5=row3+$02; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init); // 
data_NIAO_1a(rm+STR_NIAO+'1',  $0000,  3,StarSky_1_init); // 
data_spawn(rm+STR_PRXM,LowdA,$1,  $50<<3,(row0+$0B)<<3); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $6E<<3,(row0+$07)<<3); // Lowder  1 
data_spawn(rm+STR_PRXM,GoriA,$3,  $64<<3,(row0+$0A)<<3); // Goriya  3
/*
data_spawn(rm+STR_PRXM,LowdA,$1,  $4C<<3,y5); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $6E<<3,y4); // Lowder  1 
data_spawn(rm+STR_PRXM,GoriA,$3,  $64<<3,y3); // Goriya  3
*/


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '41'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);






//   --------------------------  2C  ---------------------------  
//   PBag secret, forest E of Palace 6  
rm_num  = $2C;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'044', STR_ow_axis+'00');


row3=row0+$17; y3=row3<<3; row4=row0+$0B; y4=row4<<3;
data_spawn(rm+STR_PRXM,GeruA,$2,  $36<<3,y3); // Geru  2 


clm3=$30;
data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,ItmF0,$8,  $4A<<3,y3); // PBag v8: 500 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  2D  ---------------------------  
//   Fairy secret W of Nabooru  
rm_num  = $2D;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'045', STR_ow_axis+'00', dk_SceneMusicThemeException+"01", dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
//data_NIAO_1a(rm+STR_NIAO+'1',  $0000,  3,StarSky_1_init);
data_spawn(rm+STR_PRIO,ReFaA,$1,  clm1<<3,(row0+$13)<<3); // RestoreFairy  1 


clm3=$0F;
data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  2E  ---------------------------  
//   To Palace 6 desert heart container
rm_num  = $2E;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'047', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_SEASHORE);


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,Moa_A,$1,  $0B<<3,(row0+$10)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $1F<<3,(row0+$0F)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $35<<3,(row0+$12)<<3); // Moa  1 


row4=row0+$16;
clm3=$1F; row3=row0+$14;
data_exit(EXM0,etB0,1,  clm3,row3,  CLMS2,ROWS2,  clm3-1,row3,  '34'+EXL0_); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row4,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  0); // RGT 0, to Overworld 


data_rando_scene01("_01"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  2F  ---------------------------  
//    
rm_num  = $2F;






//   --------------------------  30  ---------------------------  
//   Swamp encounter         - ENCOUNTER -   
rm_num  = $30;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'048', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);


data_spawn(rm+STR_PRXM,GiruA,$1,  $30,$80); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $70,$A0); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $E0,$90); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,BoonA,$1,  $130,$40); // $8D: Boon  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1D0,$90); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $230,$A0); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $290,$90); // $99: Girubokku  1 

data_spawn(rm+STR_PRXM,OctoA,$1,  $40,$B0,STR_Strong+STR_Encounter); // $A8: Octorok  1 
data_spawn(rm+STR_PRXM,BoonA,$1,  $150,$40,STR_Strong+STR_Encounter); // $8D: Boon  1 
data_spawn(rm+STR_PRXM,OctoA,$2,  $230,$B0,STR_Strong+STR_Encounter); // $A8: Octorok  2 
data_spawn(rm+STR_PRXM,OctoA,$1,  $290,$B0,STR_Strong+STR_Encounter); // $A8: Octorok  1 


data_exit(EXM0,etB0,0,  clm1,row0+$18,  CLMS2,ROWS2,  clm1+1,row0+$18,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$18,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$18,  0); // RGT 0, to Overworld 








//   --------------------------  31  ---------------------------  
//     Whale Island outside
rm_num  = $31;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Color+COLOR2_, STR_Tile+area_EA+'082', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_WHALE_ISLAND);
_WHALE_ISL_OUTSIDE_RM_NAME=rm;

data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
//data_spawn(rm+STR_PRXM,LowdA,$1,  $30<<3,(row0+$0A)<<3); // Lowder  1 


row3=row0+$14;  row4=row3+1;
data_exit(EXM0,etB0,1,  clm1,row3,  CLMS2,ROWS2,  clm1-1,row3,  area_EA+'63'+EXL0_); // MID 0, 
//data_exit(EXM0,etB0,1,  clm1,row3,  CLMS2,ROWS2,  clm1-1,row3,  area_TA+'76'+EXL0_); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row4,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  0); // RGT 0, to Overworld 


data_rando_scene01("_01"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  32  ---------------------------  
//   Swamp encounter (South Continent)    - ENCOUNTER -   
rm_num  = $32;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'003', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,BoonA,$1,  $26<<3,(row0+$08)<<3); // Boon  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $06<<3,(row0+$10)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $0E<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1C<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3A<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $46<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,(row0+$12)<<3); // Girubokku  1 

data_spawn(rm+STR_PRIO,SpRoA,$1,  $00<<3,$00<<3,STR_Strong+STR_Encounter); // RockSpawner  1 
//data_spawn(rm+STR_PRIO,SpRoA,$1,  $00<<3,$00<<3,STR_Strong+STR_Encounter); // RockSpawner  1 
data_spawn(rm+STR_PRXM,BoonA,$1,  $20<<3,(row0+$08)<<3,STR_Strong+STR_Encounter); // Boon  1 
data_spawn(rm+STR_PRXM,BoonA,$1,  $40<<3,(row0+$08)<<3,STR_Strong+STR_Encounter); // Boon  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $06<<3,(row0+$10)<<3,STR_Strong+STR_Encounter); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $0E<<3,(row0+$14)<<3,STR_Strong+STR_Encounter); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1C<<3,(row0+$12)<<3,STR_Strong+STR_Encounter); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3A<<3,(row0+$12)<<3,STR_Strong+STR_Encounter); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $46<<3,(row0+$14)<<3,STR_Strong+STR_Encounter); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,(row0+$12)<<3,STR_Strong+STR_Encounter); // Girubokku  1 


row3 = row0+$18;
row4 = -PAGE_ROWS;
data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,row4,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,row4,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 






//   --------------------------  33  ---------------------------  
//   Lonk doll. Extra life secret in swamp  
rm_num  = $33;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'052', STR_ow_axis+'00', dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
y3 = (row0+$8)<<3;
data_spawn(rm+STR_PRXM,BoonA,$1,  $20<<3,y3); // $8D: Boon  1 


row3 = row2-2;
data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1+1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,ItmF0,$9,  $32<<3,(row2-2)<<3); // PBag $9: 700


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);





//   --------------------------  34  ---------------------------  
//   HEART near 3-Eye Rock Palace
rm_num  = $34;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(1), STR_Tile+area_EA+'049', STR_ow_axis+'00', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_SEASHORE);


row3=row0+$16;  y3=(row3+$01)<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($17<<3)+4,y3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($27<<3)+4,y3); // v1: Light w/ CANDLE or FIRE


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '2E'+EXM0_); // LFT 0, 


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_HP,CONT_PIECE_OBJ_VER_HP,  ($32<<3)+2,(row3+$02)<<3,  STR_Treasure+STR_Map+"02"); // HEART PIECE


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);






//   --------------------------  35  ---------------------------  
//   Cemetery encounter         - ENCOUNTER -   
rm_num  = $35;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR4_, STR_Tile+area_EA+'053', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);


data_spawn(rm+STR_PRXM,Moa_A,$2,  $50,$90); // $A2: Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $B0,$A0); // $A2: Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $E0,$60); // $A2: Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $100,$A0); // $A2: Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $190,$40); // $A2: Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $1D0,$90); // $A2: Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $200,$B0); // $A2: Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $260,$80); // $A2: Moa  2 

data_spawn(rm+STR_PRXM,GeruA,$3,  $40,$90,STR_Strong+STR_Encounter); // $97: Geru  3 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $90,$90,STR_Strong+STR_Encounter); // $A2: Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $130,$90,STR_Strong+STR_Encounter); // $A2: Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $1C0,$80,STR_Strong+STR_Encounter); // $A2: Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $280,$90,STR_Strong+STR_Encounter); // $A2: Moa  2 
data_spawn(rm+STR_PRXM,GeruA,$3,  $2B0,$90,STR_Strong+STR_Encounter); // $97: Geru  3 


row3 = row2-8;
data_exit(EXM0,etB0,0,  clm1,row2-2,  CLMS2,ROWS2,  clm1+1,row2-2,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0);  // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0);  // RGT 0, to Overworld 





//   --------------------------  36  ---------------------------  
//     Kasuto Cemetery (right before volcano area)
rm_num  = $36;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR4_, STR_Tile+area_EA+'087', STR_ow_axis+'00');


data_NIAO_1a(rm+STR_NIAO+'0', $0000,1, Cloud_1_init); // 
x3   = $3F<<3;
data_spawn(rm+STR_PRXM,Moa_A,$2,  $0A<<3,(row0+$12)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $16<<3,(row0+$14)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $24<<3,(row0+$0C)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $30<<3,(row0+$14)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $42<<3,(row0+$08)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $58<<3,(row0+$12)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $60<<3,(row0+$16)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $76<<3,(row0+$10)<<3); // Moa  2 


clm3 = clm1-$0C;
row3 = row0+$16;
data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, to Overworld 


x3   = $3F<<3;
row3 = row0+$15;
row4 = row3+$02;
data_spawn(rm+STR_PRIO,Kakusu011,$1,  x3,row4<<3,  STR_Treasure+STR_Map+"02"); // Reveal w/ spell sequence
data_spawn(rm+STR_PRIO,NPC_C,$3,  x3,row3<<3,  STR_Dialogue+DK0C02); // Spell combo text






//   --------------------------  37  ---------------------------  
//    THUNDER Kakusu
rm_num  = $37;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'088', STR_ow_axis+'01');


data_NIAO_1a(rm+STR_NIAO+'0',  $0400,1,  Cloud_1_init);
row3=row0+$11; y3=row3<<3; // Top of PC's head
row4=row3+$00; y4=row4<<3; //y4-=2; // Max YT spawn for Girubokku
row5=row4-$03; y5=row5<<3;
row6=row5-$02; y6=row6<<3;
_depth=STR_Depth+string(DEPTH_ENEMY);
data_spawn(rm+STR_PRXM,GiruA,$1,  $10<<3,y6,  STR_Depth+string(_depth)); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1A<<3,y4,  STR_Depth+string(_depth)); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $22<<3,y5,  STR_Depth+string(_depth)); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $38<<3,y4,  STR_Depth+string(_depth)); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $42<<3,y6,  STR_Depth+string(_depth)); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,y5,  STR_Depth+string(_depth)); // Girubokku  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,Kakusu012,$1,  $6C<<3,(row0+$04)<<3,  STR_Treasure+STR_Map+"02"); // Out of reach, need THUNDER








//   --------------------------  38  ---------------------------  
//   Field encounter (South Continent)         - ENCOUNTER -   
rm_num  = $38;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'004', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
row3 = row0+$17;
y3  = (row0+$08)<<3;
y4  = row3<<3;
data_spawn(rm+STR_PRXM,BoonA,$1,  clm1<<3,y3); // Boon  1 
data_spawn(rm+STR_PRXM,TektA,$1,  $1A<<3,y4); // Tektite  1 
data_spawn(rm+STR_PRXM,TektA,$1,  $24<<3,y4); // Tektite  1 
data_spawn(rm+STR_PRXM,TektA,$1,  $52<<3,y4); // Tektite  1 

data_spawn(rm+STR_PRIO,SpRoA,$1,  $00<<3,$00<<3,STR_Strong+STR_Encounter); // RockSpawner  1 
data_spawn(rm+STR_PRXM,BoonA,$1,  $20<<3,y3,STR_Strong+STR_Encounter); // Boon  1 
data_spawn(rm+STR_PRXM,BoonA,$1,  $40<<3,y3,STR_Strong+STR_Encounter); // Boon  1 
data_spawn(rm+STR_PRXM,TektA,$1,  $10<<3,y4,STR_Strong+STR_Encounter); // Tektite  1 
data_spawn(rm+STR_PRXM,TektA,$1,  $22<<3,y4,STR_Strong+STR_Encounter); // Tektite  1 
data_spawn(rm+STR_PRXM,TektA,$1,  $42<<3,y4,STR_Strong+STR_Encounter); // Tektite  1 
data_spawn(rm+STR_PRXM,TektA,$1,  $56<<3,y4,STR_Strong+STR_Encounter); // Tektite  1 


row4 = -PAGE_ROWS;
data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,row4,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,row4,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 






//   --------------------------  39  ---------------------------  
//   Path encounter         - ENCOUNTER -   
rm_num  = $39;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'057', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_B1), dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);


row3 = row2-2;
data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1+1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, to Overworld 





//   --------------------------  3A  ---------------------------  
//   Extra life doll near W end of Maze Isl Bridge  
rm_num  = $3A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'058', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_NABOORU_BAY, dk_SceneMusicThemeException+"01");


row3=row0+$15; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init);


clm3=$33; clm4=clm3+sign_(clm3<clm1);
data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm4,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


x3=$0F<<3; x4=x3+($04<<3);
data_spawn(rm+STR_PRIO,ItmF0,$4,  x3,y3); // PBag v4: 200
//data_spawn(rm+STR_PRIO,ItmG0,$1,  x3,y3,  STR_Qualified+STR_Quest+STR_Nums+"01"); // 1UP DOLL
//data_spawn(rm+STR_PRIO,ItmF0,$4,  x4,y3,  STR_Qualified+STR_Quest+STR_Nums+"02"); // PBag v4: 200


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  3B  ---------------------------  
//   Red Bottle secret in desert E of Nabooru  
rm_num   = $3B;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'057', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_NABOORU_BAY, dk_SceneMusicThemeException+"01");


row3 = row2-2;
x3 = (clm1+8)<<3;
y3 = row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,GiruA,$1,  $B0,$80); // $99: Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $180,$90); // $99: Girubokku  1 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,ItmE0,$1,  x3,y3); // Magic Jar (Full)


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00"+STR_JAR,rm);







//   --------------------------  3C  ---------------------------  
//   Final area volcano         - ENCOUNTER -   
rm_num  = $3C;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'060', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");


row3=row0+$12; y3=row3<<3;
row4=row3-$02; y4=row4<<3;
row5=row3-$04; y5=row5<<3;
data_spawn(rm+STR_PRXM,Moa_A,$2,  $0A<<3,y5); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $20<<3,y4); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $32<<3,y5); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $52<<3,y4); // Moa  2 
data_spawn(rm+STR_PRXM,GiruA,$1,  $16<<3,y4); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $42<<3,y3); // Girubokku  1 

data_spawn(rm+STR_PRXM,Moa_A,$2,  $0E<<3,y5,STR_Strong+STR_Encounter); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $1C<<3,y4,STR_Strong+STR_Encounter); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $32<<3,y5,STR_Strong+STR_Encounter); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $4C<<3,y4,STR_Strong+STR_Encounter); // Moa  2 
data_spawn(rm+STR_PRXM,GeruA,$3,  $0A<<3,y3,STR_Strong+STR_Encounter); // Geru  3 
data_spawn(rm+STR_PRXM,GeruA,$3,  $44<<3,y3,STR_Strong+STR_Encounter); // Geru  3 


data_exit(EXM0,etB0,0,  $2F,row3,  CLMS2,ROWS2,  CLM5,row3,  0); // MID 0, to Overworld 
//data_exit(EXM0,etB0,0,  $30,row3,  CLMS2,ROWS2,  CLM5,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3+$02,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3-$02,  0); // RGT 0, to Overworld 








//   --------------------------  3D  ---------------------------  
//   Beach encounter (South Continent, Dragmire)         - ENCOUNTER -   
rm_num  = $3D;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'005', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");


row3=row0+$14; y3=row3<<3;
row4=row3+$02; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);

data_spawn(rm+STR_PRXM,LeevA,$1,  $0C<<3,y4); // Leever  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $3E<<3,y4); // Leever  1 
data_spawn(rm+STR_PRXM,ZoraA,$1,  $3A<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $10<<3,y3); // Aruroda  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $4E<<3,y3); // Aruroda  1 

data_spawn(rm+STR_PRXM,ZoraA,$1,  $3A<<3,y3,STR_Strong+STR_Encounter); // Zora  1 
data_spawn(rm+STR_PRXM,ZoraA,$1,  $18<<3,y3,STR_Strong+STR_Encounter); // Zora  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $10<<3,y3,STR_Strong+STR_Encounter); // Aruroda  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $4C<<3,y3,STR_Strong+STR_Encounter); // Aruroda  1 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 






//   --------------------------  3E  ---------------------------  
//   Red Bottle secret in volcano area right after guantlett
rm_num  = $3E;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'062', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_VALLEY_OF_DEATH, dk_SceneMusicThemeException+"01");


row3 = row2-2;
data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1+1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,ItmE0,$1,  $40,$B0); // Magic Jar (Full)


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00"+STR_JAR,rm);





//   --------------------------  3F  ---------------------------  
//     volcano pbag secret
rm_num  = $3F;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'063', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_VALLEY_OF_DEATH, dk_SceneMusicThemeException+"01");


row3 = row2-2;
data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1+1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,ItmF0,$8,  $60,$B0); // PBag 500 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  40  ---------------------------  
//   Beach encounter N         - ENCOUNTER -   
rm_num  = $40;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'005', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");


row3=row0+$14; y3=row3<<3;
row4=row3+$02; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);

data_spawn(rm+STR_PRXM,GeldA,$1,  $14<<3,y4); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $42<<3,y4); // Geldarm  1 
//data_spawn(rm+STR_PRXM,OctoA,$1,  $14<<3,y4); // Octorok  1 
//data_spawn(rm+STR_PRXM,OctoA,$1,  $42<<3,y4); // Octorok  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $06<<3,y4); // Leever  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $1C<<3,y4); // Leever  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $22<<3,y4); // Leever  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $3A<<3,y4); // Leever  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $4C<<3,y4); // Leever  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $56<<3,y4); // Leever  1 

data_spawn(rm+STR_PRIO,SpMoA,$1,  0,0,  STR_Strong+STR_Encounter); // MobySpawner  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $14<<3,y4,STR_Strong+STR_Encounter); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $42<<3,y4,STR_Strong+STR_Encounter); // Geldarm  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $0C<<3,y4,STR_Strong+STR_Encounter); // Leever  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $1C<<3,y4,STR_Strong+STR_Encounter); // Leever  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $3C<<3,y4,STR_Strong+STR_Encounter); // Leever  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $46<<3,y4,STR_Strong+STR_Encounter); // Leever  1 
data_spawn(rm+STR_PRXM,LeevA,$1,  $54<<3,y4,STR_Strong+STR_Encounter); // Leever  1
//data_spawn(rm+STR_PRXM,ZoraA,$1,  $22<<3,y3,STR_Strong+STR_Encounter); // Zora  1  


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 








//   --------------------------  41  ---------------------------  
//     Mtn pass far N island
rm_num  = $41;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'055', STR_ow_axis+'00');


y3=(row0+$0D)<<3;
data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init); // 
data_NIAO_1a(rm+STR_NIAO+'1',  $0000,  3,StarSky_1_init); // 
data_spawn(rm+STR_PRXM,Bot_A,$2,  $4F<<3,(row0+$11)<<3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $5B<<3,(row0+$15)<<3); // Bot  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $26<<3,y3); // Octorok 1
data_spawn(rm+STR_PRXM,OctoA,$1,  $2C<<3,y3); // Octorok 1
data_spawn(rm+STR_PRXM,OctoA,$1,  $32<<3,y3); // Octorok 1
data_spawn(rm+STR_PRXM,OctoA,$1,  $3C<<3,y3-($02<<3)); // Octorok 1
/*
data_spawn(rm+STR_PRXM,OctoA,$3,  $26<<3,y3); // Octorok 3
data_spawn(rm+STR_PRXM,OctoA,$3,  $2C<<3,y3); // Octorok 3
data_spawn(rm+STR_PRXM,OctoA,$3,  $32<<3,y3); // Octorok 3
data_spawn(rm+STR_PRXM,OctoA,$3,  $3C<<3,y3-($02<<3)); // Octorok 3
*/


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0B,  '2B'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$17,  0);          // RGT 0, to Overworld 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  42  ---------------------------  
//   South Continent/Island.  Fast travel back to West
rm_num  = $42;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'042', STR_ow_axis+'01');


row3=row0+$12;  y3=row3<<3;
row4=row0+$14;  y4=row4<<3;
row5=row0+$16;  y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $19<<3,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $27<<3,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRXM,Bot_A,$1,  $12<<3,y3); // Bot  1 


clm3=$1F;
data_exit(EXM0,etB3,1,  clm3,row4,  $03,ROWS2,  clm3-1,row4,  area_WA+'49'+EXM0_); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld


data_rando_scene01("_01"+"_00"+"_01"+"_00"+"_00",rm);








//   --------------------------  43  ---------------------------  
//   Forest encounter (South Continent)         - ENCOUNTER -   
rm_num  = $43;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'012', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");


row3=row0+$15;  y3=row3<<3;
data_spawn(rm+STR_PRXM,ZoraA,$1,  $3A<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,ZoraA,$1,  $18<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $06<<3,(row0+$10)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $0E<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1C<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3A<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $46<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,(row0+$12)<<3); // Girubokku  1 

data_spawn(rm+STR_PRXM,ArurA,$1,  $10<<3,y3,STR_Strong+STR_Encounter); // Aruroda  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $4C<<3,y3,STR_Strong+STR_Encounter); // Aruroda  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $06<<3,(row0+$10)<<3,STR_Strong+STR_Encounter); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $0E<<3,(row0+$14)<<3,STR_Strong+STR_Encounter); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1C<<3,(row0+$12)<<3,STR_Strong+STR_Encounter); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3A<<3,(row0+$12)<<3,STR_Strong+STR_Encounter); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $46<<3,(row0+$14)<<3,STR_Strong+STR_Encounter); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,(row0+$12)<<3,STR_Strong+STR_Encounter); // Girubokku  1 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 






//   --------------------------  44  ---------------------------  
//   Forest encounter (Dragon Island)         - ENCOUNTER -   
rm_num  = $44;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'050', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");


row3=row0+$17;  y3=row3<<3;  y4=(row0+$02)<<3;  y5=(row0+$08)<<3;
data_spawn(rm+STR_PRXM,AttaA,$1,  $1F<<3,y4); // Atta  1
data_spawn(rm+STR_PRXM,AttaA,$1,  $23<<3,y4); // Atta  1
data_spawn(rm+STR_PRXM,AttaA,$1,  $3B<<3,y4); // Atta  1
data_spawn(rm+STR_PRXM,AttaA,$1,  $4F<<3,y4); // Atta  1
data_spawn(rm+STR_PRXM,AcheA,$1,  $0C<<3,y5); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $18<<3,y5); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $22<<3,y5); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $3C<<3,y5); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $47<<3,y5); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $53<<3,y5); // Ache  1 

data_spawn(rm+STR_PRXM,GeruA,$3,  $0F<<3,y3,STR_Strong+STR_Encounter); // Geru 3 
data_spawn(rm+STR_PRXM,GeruA,$3,  $4F<<3,y3,STR_Strong+STR_Encounter); // Geru 3 
data_spawn(rm+STR_PRXM,AttaA,$1,  $1F<<3,y4,STR_Strong+STR_Encounter); // Atta  1
data_spawn(rm+STR_PRXM,AttaA,$1,  $23<<3,y4,STR_Strong+STR_Encounter); // Atta  1
data_spawn(rm+STR_PRXM,AttaA,$1,  $3B<<3,y4,STR_Strong+STR_Encounter); // Atta  1
data_spawn(rm+STR_PRXM,AttaA,$1,  $4F<<3,y4,STR_Strong+STR_Encounter); // Atta  1
data_spawn(rm+STR_PRXM,AcheA,$1,  $0C<<3,y5,STR_Strong+STR_Encounter); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $18<<3,y5,STR_Strong+STR_Encounter); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $22<<3,y5,STR_Strong+STR_Encounter); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $3C<<3,y5,STR_Strong+STR_Encounter); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $47<<3,y5,STR_Strong+STR_Encounter); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $53<<3,y5,STR_Strong+STR_Encounter); // Ache  1 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 






//   --------------------------  45  ---------------------------  
//   Swamp encounter (Dragmire Island)         - ENCOUNTER -   
rm_num  = $45;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'052', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");


row3=row0+$18;  y3=row3<<3;  y5=(row0+$08)<<3;
data_spawn(rm+STR_PRIO,Spawner_Boggnipp,$1,  $00<<3,(row0+$1A)<<3); // Boggnipp Spawner
data_spawn(rm+STR_PRXM,Moa_A,$2,  $0C<<3,(row0+$12)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $18<<3,(row0+$14)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $22<<3,(row0+$16)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $3C<<3,(row0+$16)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $47<<3,(row0+$14)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $53<<3,(row0+$12)<<3); // Moa  2 

data_spawn(rm+STR_PRIO,Spawner_Boggnipp,$1,  $00<<3,(row0+$1A)<<3,STR_Strong+STR_Encounter); // Boggnipp Spawner
data_spawn(rm+STR_PRXM,GeruA,$3,  $0F<<3,y3,STR_Strong+STR_Encounter); // Geru 3 
data_spawn(rm+STR_PRXM,GeruA,$3,  $4F<<3,y3,STR_Strong+STR_Encounter); // Geru 3 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $0C<<3,(row0+$12)<<3,STR_Strong+STR_Encounter); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $18<<3,(row0+$14)<<3,STR_Strong+STR_Encounter); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $22<<3,(row0+$16)<<3,STR_Strong+STR_Encounter); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $3C<<3,(row0+$16)<<3,STR_Strong+STR_Encounter); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $47<<3,(row0+$14)<<3,STR_Strong+STR_Encounter); // Moa  2 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $53<<3,(row0+$12)<<3,STR_Strong+STR_Encounter); // Moa  2 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 






//   --------------------------  46  ---------------------------  
//     South Continent. Winding forest trap rm.
rm_num  = $46;
/*
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'093', STR_ow_axis+'00', dk_SceneMusicThemeException+"01");


data_spawn(rm+STR_PRIO,SpGrA,$1,  $00<<3,(row0+$00)<<3); // GruntSpawner  1 
y3 = (row0+$13)<<3;
y4 = (row0+$08)<<3;
data_spawn(rm+STR_PRIO,BlazA,$2,  ($20<<3)+4,y3); // Blaze v2
data_spawn(rm+STR_PRIO,BlazA,$2,  ($40<<3)+4,y3); // Blaze v2
data_spawn(rm+STR_PRIO,BlazA,$2,  ($60<<3)+4,y3); // Blaze v2
data_spawn(rm+STR_PRXM,DeelA,$2,  $18<<3,y4); // Deeler  2
data_spawn(rm+STR_PRXM,DeelA,$1,  $32<<3,y4); // Deeler  1
data_spawn(rm+STR_PRXM,DeelA,$2,  $4E<<3,y4); // Deeler  2
data_spawn(rm+STR_PRXM,DeelA,$1,  $68<<3,y4); // Deeler  1


row3 = row0+$15;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, to Overworld 
*/






//   --------------------------  47  ---------------------------  
//     South Continent. Swamp trap rm.
rm_num  = $47;
/*
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'094', STR_ow_axis+'00', dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
y3 = (row0+$08)<<3;
data_spawn(rm+STR_PRXM,BoonA,$1,  $10<<3,y3); // Boon  1 
data_spawn(rm+STR_PRXM,BoonA,$1,  $70<<3,y3); // Boon  1 
y3 = (row0+$12)<<3;
y4 = (row0+$14)<<3;
y5 = (row0+$16)<<3;
data_spawn(rm+STR_PRXM,GiruA,$1,  $08<<3,y5); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $14<<3,y4); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $28<<3,y3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $42<<3,y3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $56<<3,y4); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $70<<3,y5); // Girubokku  1 
data_spawn(rm+STR_PRXM,OctoA,$2,  x0,(row0+$1A)<<3); // Octorok  2 


row3 = row0+$18;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, to Overworld 
*/






//   --------------------------  48  ---------------------------  
//     South Continent. SWORD item
rm_num  = $48;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'089', STR_ow_axis+'01', dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init); // 
data_spawn(rm+STR_PRXM,GiruA,$1,  $08<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $12<<3,(row0+$10)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $24<<3,(row0+$08)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $38<<3,(row0+$0C)<<3); // Girubokku  1 
//data_spawn(rm+STR_PRXM,Bot_A,$1,  $30<<3,(row0+$00)<<3); // Bot  1 
//data_spawn(rm+STR_PRXM,Bot_A,$1,  $11<<3,(row0+$16)<<3); // Bot  1 


row3=row0+$16;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '4F'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmA7,$1,  ($1F<<3)+4,(row0+$15)<<3); // SWORD


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);






//   --------------------------  49  ---------------------------  
//     South Continent. Cave to SWORD item area
rm_num  = $49;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(0), STR_Tile+area_DM+'001', STR_ow_axis+'01', STR_show_ow_pos+'00', dk_SceneMusicThemeException+"01");


row3=row0+$0A; y3=row3<<3;
row4=row0+$16; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,(row3+$01)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $77<<3,(row4+$01)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bot_A,$1,  $1C<<3,(row0+$0C)<<3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $3C<<3,(row0+$10)<<3); // Bot  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $20<<3,(row0+$0A)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $41<<3,(row0+$14)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,GeruA,$3,  $18<<3,(row0+$0C)<<3); // Geru  3
data_spawn(rm+STR_PRXM,GeruA,$2,  $48<<3,(row0+$12)<<3); // Geru  2


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  0); // RGT 0, to Overworld 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);






//   --------------------------  4A  ---------------------------  
//     South Continent. Cave on N side of land. 
rm_num  = $4A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(0), STR_Tile+area_WA+'239', STR_ow_axis+'01', STR_show_ow_pos+'00', dk_SceneMusicThemeException+"01");


x3=(clms0-$09)<<3; row3=row0+$16; y3=row3<<3; y4=(row3+$01)<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,y4,  STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $58<<3,y4,  STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,OctoA,$1,  $1E<<3,y3); // Octorok  1
data_spawn(rm+STR_PRXM,OctoA,$1,  $26<<3,y3); // Octorok  1
data_spawn(rm+STR_PRXM,OctoA,$1,  $2A<<3,y3); // Octorok  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, to Overworld 


data_spawn(rm+STR_PRIO,ItmF0,$8,  $2E<<3,y3); // PBag v8: 500 


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);






//   --------------------------  4B  ---------------------------  
//     South Continent. Route to South penninsula.
rm_num  = $4B;
/*
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'090', STR_ow_axis+'00', dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
                                         y3 = (row0+$18)<<3;
data_spawn(rm+STR_PRXM,BagiA,$1,  $09<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $21<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $25<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $3D<<3,y3); // Bagin


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$08,  '4C'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$12,  0); // RGT 0, to Overworld 
*/






//   --------------------------  4C  ---------------------------  
//     South Continent. Route to South penninsula.
rm_num  = $4C;
/*
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'091', STR_ow_axis+'00', dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRIO,SpPoA,$1,  $1E<<3,y2); // BubbleSpawner  1 
                                           y3 = (row0+$18)<<3;
data_spawn(rm+STR_PRXM,BagiA,$1,  $16<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $2D<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $41<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $57<<3,y3); // Bagin


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0-$04,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$06,  '4B'+EXL0_); // RGT 0, 
*/






//   --------------------------  4D  ---------------------------  
//     South Continent. South penninsula.
rm_num  = $4D;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'092', STR_ow_axis+'00', dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRIO,ReFaA,$1,  x0,(row0+$11)<<3); // RestoreFairy  1 


clm3 = clm1-1;
row3 = row0+$16;
data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, to Overworld 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);






//   --------------------------  4E  ---------------------------  
//     South Continent. Shortcut to leave
rm_num  = $4E;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'037', STR_ow_axis+'00', dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init); // 
                                         y3 = (row0+$18)<<3;
data_spawn(rm+STR_PRXM,BagiA,$1,  $38<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $46<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $55<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $6A<<3,y3); // Bagin


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$10,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0C,  0); // RGT 0, to Overworld 






//   --------------------------  4F  ---------------------------  
//     South Continent. Shortcut out of SWORD room
rm_num  = $4F;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'099', STR_ow_axis+'00', dk_SceneMusicThemeException+"01");


row3=row0+$19; y3=row3<<3;
row4=row0+$15; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1',  $0000,  3,StarSky_1_init);
data_spawn(rm+STR_PRXM,GiruA,$1,  $10<<3,(row0+$18)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $20<<3,(row0+$16)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $48<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,TektA,$1,  $30<<3,(row0+$16)<<3); // Tektite  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '48'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  0); // RGT 0, to Overworld 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  50  ---------------------------  
//     NECKLACE item caves entrance
rm_num  = $50;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'076', STR_ow_axis+'01', STR_show_ow_pos+'00');


data_spawn(rm+STR_PRXM,OctoA,$1,  $0E<<3,(row0+$10)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $34<<3,(row0+$0C)<<3); // Myu  1 


data_exit(EXU0,etA0,0,  $2A,row_e0,  $0A,ROWS5,  $2D,row_e4,  '2A'+EXD0_); // UP  0, Pit up 
//data_exit(EXU0,etA0,0,  -$20,row_e0,  clms1,ROWS5,  $2D,row_e4,  '2A'+EXD0_); // UP  0, Pit up 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$10,  '51'+EXR0_); // LFT 0, 


data_spawn(rm+STR_PRIO,ItmE0,$1,  $25<<3,(row0+$0D)<<3); // Magic Jar (Full)


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01"+STR_Pit+"8"+STR_JAR,rm);









//   --------------------------  51  ---------------------------  
//     NECKLACE item
rm_num  = $51;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'077', STR_ow_axis+'01', STR_show_ow_pos+'00');
_val = p.PAL_MOB_SET2;
dm_palette[?        rm+dk_MOB] = _val;
p.dm_scene_palette[?rm+dk_MOB] = _val;


x4 = clm1<<3; // arena center x
x3 = x4-$10;
y3 = (row0+$10)<<3;
data_spawn(rm+STR_PRIO,CaroA,$2,  x3,y3,  STR_Arena+'_x'+hex_str(x4)); // Carock  2


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$04,  '52'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0C,  '50'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmAC,$1,  x4-4,(row0+$00)<<3); // PENDANT









//   --------------------------  52  ---------------------------  
//     NECKLACE item caves exit
rm_num  = $52;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'078', STR_ow_axis+'01', STR_show_ow_pos+'00');


y3 = (row0+$18)<<3;
data_spawn(rm+STR_PRXM,BagiA,$1,  $0D<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $21<<3,y3); // Bagin


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$00,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$10,  '51'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_JUMP);






//   --------------------------  53  ---------------------------  
//     Nabooru quest cave system. Dead end
ow_axis =  1; // 0:horizontal, 1:vertical
rm_num  = $53;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'026', STR_Dark+"01", STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


x3=(clms0-$09)<<3;
row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0A<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,DeelA,$1,  $28<<3,((row0+$0A)<<3)-3,  STR_Distance+hex_str($0D<<3)); // Deeler  1
data_spawn(rm+STR_PRXM,GoriA,$3,  $24<<3,y3); // Goriya  3


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '56'+EXR0_); // LFT 0, 


data_spawn(rm+STR_PRIO,ItmF0,$6,  $28<<3,y3); // PBag v6: 300 


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);









//   --------------------------  54  ---------------------------  
//     Nabooru well shaft
rm_num  = $54;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'014', STR_Dark+"01", STR_View+'02', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


data_spawn(rm+STR_PRIO,TorchA,$1,  $31<<3,$75<<3, STR_Lit); // v1: Light w/ CANDLE or FIRE
_pi = global.PI_MOB_RED;
data_spawn(rm+STR_PRXM,Wheep,$1,  $14<<3,$3E<<3,  dk_PI+hex_str(_pi)); // Wheep
data_spawn(rm+STR_PRXM,Wheep,$1,  $1E<<3,$52<<3,  dk_PI+hex_str(_pi)); // Wheep
data_spawn(rm+STR_PRXM,Wheep,$1,  $1A<<3,$53<<3,  dk_PI+hex_str(_pi)); // Wheep
//data_spawn(rm+STR_PRXM,Wheep,$1,  $1E<<3,$53<<3,  dk_PI+hex_str(_pi)); // Wheep
//data_spawn(rm+STR_PRXM,Wheep,$1,  $1A<<3,$54<<3,  dk_PI+hex_str(_pi)); // Wheep
data_spawn(rm+STR_PRXM,Wheep,$1,  $12<<3,$62<<3,  dk_PI+hex_str(_pi)); // Wheep
data_spawn(rm+STR_PRXM,Wheep,$1,  $0F<<3,$69<<3,  dk_PI+hex_str(_pi)); // Wheep
data_spawn(rm+STR_PRXM,Wheep,$1,  $16<<3,$6E<<3,  dk_PI+hex_str(_pi)); // Wheep


data_exit(EXU0,etA0,0,  $11,-$0F,  $04,ROWS5,  $12,$02,  area_TA+'19'+EXD0_); // UP  0, Pit up 
//data_exit(EXU0,etA0,0,  $00,-$0F,  clms0,ROWS5,  $12,$02,  area_TA+'19'+EXD0_); // UP  0, Pit up 
row3  = $40;
rows3 = PAGE_ROWS;
row4  = row3+rows3;
rows4 = rows0 - row4 + PAGE_ROWS
data_exit(EXL0,etA0,1,  CLM2,row3,  CLMS2,rows3,  CLM3,$54,  '5F'+EXR0_); // LFT 0, 
data_exit(EXL1,etA0,1,  CLM2,row4,  CLMS2,rows4,  CLM3,$74,  '5F'+EXR1_); // LFT 1, 
//data_exit(EXL0,etA0,1,  CLM2,row3,  CLMS2,rows3,  CLM3,$54,  '5D'+EXR0_); // LFT 0, 
//data_exit(EXL1,etA0,1,  CLM2,row4,  CLMS2,rows4,  CLM3,$74,  '5E'+EXR0_); // LFT 1, 
row3  = $20;
rows3 = PAGE_ROWS<<1;
row4  = row3+rows3;
rows4 = rows0 - row4 + PAGE_ROWS
data_exit(EXR0,etA0,1,  clm2,row3,  CLMS2,rows3,  clmA,$3C,  '5C'+EXL0_); // RGT 0, 
data_exit(EXR1,etA0,1,  clm2,row4,  CLMS2,rows4,  clmA,$73,  '5C'+EXL1_); // RGT 1, 










//   --------------------------  55  ---------------------------  
//    
rm_num  = $55;








//   --------------------------  56  ---------------------------  
//     Nabooru quest cave system. 
rm_num  = $56;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'141', STR_Dark+"01", STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


data_spawn(rm+STR_PRIO,TorchA,$1,  ($07<<3)+4,(row0+$0D)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
_val = -3;
data_spawn(rm+STR_PRXM,DeelA,$1,  $13<<3,((row0+$06)<<3)+_val,  STR_Distance+hex_str($0B<<3)); // Deeler  1
data_spawn(rm+STR_PRXM,DeelA,$1,  $2D<<3,((row0+$06)<<3)+_val,  STR_Distance+hex_str($0C<<3)); // Deeler  1
data_spawn(rm+STR_PRXM,LowdA,$1,  $15<<3,(row0+$12)<<3); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $20<<3,(row0+$10)<<3); // Lowder  1 


data_exit(EXD0,etA0,1,  CLM0,row_e2,  clms1,ROWS5,  $2A,row_e3,  '57'+EXU0_); // DWN 0, Pit down 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0C,  '5C'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$10,  '53'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_00"+STR_Pit+"4",rm);








//   --------------------------  57  ---------------------------  
//     Nabooru quest cave system. 
rm_num  = $57;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'017', STR_View+'02', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');
//set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'017', STR_Dark+"01", STR_View+'02', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


_pi = global.PI_MOB_RED;
data_spawn(rm+STR_PRXM,Wheep,$1,  $22<<3,$10<<3,  dk_PI+hex_str(_pi)); // Wheep
data_spawn(rm+STR_PRXM,Wheep,$1,  $1E<<3,$1E<<3,  dk_PI+hex_str(_pi)); // Wheep
data_spawn(rm+STR_PRXM,Wheep,$1,  $26<<3,$28<<3,  dk_PI+hex_str(_pi)); // Wheep
data_spawn(rm+STR_PRXM,Wheep,$1,  $1A<<3,$30<<3,  dk_PI+hex_str(_pi)); // Wheep
data_spawn(rm+STR_PRXM,Wheep,$1,  $1F<<3,$31<<3,  dk_PI+hex_str(_pi)); // Wheep
data_spawn(rm+STR_PRXM,Wheep,$1,  $25<<3,$3E<<3,  dk_PI+hex_str(_pi)); // Wheep
data_spawn(rm+STR_PRXM,Wheep,$1,  $27<<3,$44<<3,  dk_PI+hex_str(_pi)); // Wheep
data_spawn(rm+STR_PRXM,Wheep,$1,  $22<<3,$50<<3,  dk_PI+hex_str(_pi)); // Wheep
data_spawn(rm+STR_PRXM,Wheep,$1,  $19<<3,$51<<3,  dk_PI+hex_str(_pi)); // Wheep
data_spawn(rm+STR_PRXM,Wheep,$1,  $1D<<3,$57<<3,  dk_PI+hex_str(_pi)); // Wheep


clms3 =  PAGE_CLMS;
data_exit(EXU0,etA0,0,  $1A,-$0F,  $0C,ROWS5,  $1F,$02,  '56'+EXD0_); // UP  0, Pit up 
//data_exit(EXU0,etA0,0,  $00,-$0F,  clms0,ROWS5,  $1F,$02,  '56'+EXD0_); // UP  0, Pit up 
clm3 = -PAGE_CLMS;
data_exit(EXD0,etA0,1,  clm3,row0+$1F,  clms1,ROWS5,  $1F,row_e3,  '58'+EXU0_); // DWN 0, Pit down 


data_rando_scene01("_00"+"_00"+"_00"+"_01"+"_01"+STR_Pit+"C",rm);









//   --------------------------  58  ---------------------------  
//     Nabooru quest cave system. Left adjacent of Nabooru water source rm
rm_num  = $58;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'023', STR_Dark+"01", STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


data_spawn(rm+STR_PRIO,TorchA,$1,  $36<<3,(row0+$0D)<<3); // v1: Light w/ CANDLE or FIRE, v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$1,  $70<<3,(row0+$0A)<<3, STR_Lit); // v1: Light w/ CANDLE or FIRE, v3: Short sprite
y3=(row0+$1A)<<3;
data_spawn(rm+STR_PRXM,BagiA,$1,  $45<<3,y3,  STR_Depth+string(DEPTH_ENEMY)); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $4D<<3,y3,  STR_Depth+string(DEPTH_ENEMY)); // Bagin
data_spawn(rm+STR_PRXM,Myu_A,$1,  $0D<<3,(row0+$12)<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $30<<3,(row0+$0E)<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $60<<3,(row0+$0E)<<3); // Myu  1 


data_exit(EXU0,etA0,0,  $08,row_e0,  $6C,ROWS5,  $25,row_e4,  '57'+EXD0_); // UP  0, Pit up 
//data_exit(EXU0,etA0,0,  $00,row_e0,  clms0,ROWS5,  $25,row_e4,  '57'+EXD0_); // UP  0, Pit up 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$09,  '59'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmE0,$1,  $09<<3,(row0+$0C)<<3); // Magic Jar (Full)


//data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_01"+STR_Pit+"C"+STR_JAR,rm);









//   --------------------------  59  ---------------------------  
//     Nabooru quest cave system. Nabooru water source rm
rm_num  = $59;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'022', STR_Dark+"01", STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


g.dm_rm[?rm+STR_Ground+STR_Row] = row0+$17;
g.dm_rm[?"NabooruQuest_RM_NAME"] = rm;
//g.NabooruQuest_RM_NAME = rm;
row3=row0+$13; y3=row3<<3;
row4=row0+$11; y4=row4<<3;
row5=row0+$05; y5=row5<<3;
data_spawn_cutscene(Cutscene_CreateWaterfall,1, 0,0);
data_spawn(rm+STR_PRIO,TorchA,$1,  ($18<<3)+4,y4, STR_Lit); // v1: Light w/ CANDLE or FIRE, v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$1,  ($22<<3)+4,y4, STR_Lit); // v1: Light w/ CANDLE or FIRE, v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$1,  ($3F<<3)+4,y4, STR_Lit); // v1: Light w/ CANDLE or FIRE, v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$1,  ($49<<3)+4,y4, STR_Lit); // v1: Light w/ CANDLE or FIRE, v3: Short sprite
data_spawn(rm+STR_PRXM,MagoA,$1,  $18<<3,y3); // Mago  1
data_spawn(rm+STR_PRXM,MagoA,$1,  $30<<3,y3); // Mago  1
data_spawn(rm+STR_PRXM,MagoA,$1,  $48<<3,y3); // Mago  1

_pi=global.PI_BGR2; _val=$02;
var _DATA1=STR_Data+"01"+string(DEPTH_BG2);
data_spawn(rm+STR_PRIO,TyellManager,$1,  0,0);
                                   clm3=$1F;  _a=0;
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm3+(_val*_a++))<<3,y5,  dk_PI+hex_str(_pi),_DATA1); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm3+(_val*_a++))<<3,y5,  dk_PI+hex_str(_pi),_DATA1); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm3+(_val*_a++))<<3,y5,  dk_PI+hex_str(_pi),_DATA1); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm3+(_val*_a++))<<3,y5,  dk_PI+hex_str(_pi),_DATA1); // Tyell v1: Vertical
                                               _a++;    // pillar
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm3+(_val*_a++))<<3,y5,  dk_PI+hex_str(_pi),_DATA1); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm3+(_val*_a++))<<3,y5,  dk_PI+hex_str(_pi),_DATA1); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm3+(_val*_a++))<<3,y5,  dk_PI+hex_str(_pi),_DATA1); // Tyell v1: Vertical
                                   clm3=$34;  _a=0;
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm3+(_val*_a++))<<3,y5,  dk_PI+hex_str(_pi),_DATA1); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm3+(_val*_a++))<<3,y5,  dk_PI+hex_str(_pi),_DATA1); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm3+(_val*_a++))<<3,y5,  dk_PI+hex_str(_pi),_DATA1); // Tyell v1: Vertical
                                               _a++;    // pillar
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm3+(_val*_a++))<<3,y5,  dk_PI+hex_str(_pi),_DATA1); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm3+(_val*_a++))<<3,y5,  dk_PI+hex_str(_pi),_DATA1); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm3+(_val*_a++))<<3,y5,  dk_PI+hex_str(_pi),_DATA1); // Tyell v1: Vertical
data_spawn(rm+STR_PRIO,Tyell,$1,  (clm3+(_val*_a++))<<3,y5,  dk_PI+hex_str(_pi),_DATA1); // Tyell v1: Vertical


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '58'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '5A'+EXL0_); // RGT 0, 









//   --------------------------  5A  ---------------------------  
//     Nabooru quest cave system. Right adjacent of Nabooru water source rm
rm_num  = $5A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'142', STR_Dark+"01", STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


row3=row0+$06; y3=row3<<3;
row4=row0+$11; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($08<<3)+4,(row0+$0E)<<3, STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,DeelA,$2,  $20<<3,y3-3,  STR_Distance+hex_str($09<<3)); // Deeler  2
data_spawn(rm+STR_PRXM,Bot_A,$1,  $10<<3,y4); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $29<<3,y4); // Bot  1 


clm3=$30; // clm3: Elevator center clm
data_exit(EXU0,etC0,1,  clm3-$04,row_e0,  CLMS4,ROWS5,  clm3-$01,row_e1,  '5B'+EXD0_); // UP  0, Elevator up 
data_Elev(EXU0_, clm3,row0+$0E);                                                 // Elevator UP $80,  
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0D,  '59'+EXR0_); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01",rm);








//   --------------------------  5B  ---------------------------  
//     Caves exit after completing Nabooru quest
rm_num  = $5B;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'021', STR_ow_axis+hex_str(ow_axis));


data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init); // 
row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRXM,MegmA,$1,  $06<<3,(row3-$06)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $0E<<3,(row3-$02)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $1F<<3,(row0+$0F)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $30<<3,(row3-$00)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $38<<3,(row3-$04)<<3); // Megmat  1 


clm3=$20; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
      data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '5A'+EXU0_); // DWN 0, Elevator down 
      data_Elev(EXD0_, clm3,row0+$13);                                               // Elevator DW $40, 
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
g.dm_rm[?STR_Nabooru+STR_Quest+STR_Exit+"0101"] = _exit;
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 
g.dm_rm[?STR_Nabooru+STR_Quest+STR_Exit+"0102"] = _exit;


data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_00",rm);






//   --------------------------  5C  ---------------------------  
//     Nabooru quest cave system. Right adjacent to well
rm_num  = $5C;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'143', STR_Dark+"01", STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


data_spawn(rm+STR_PRIO,TorchA,$1,  ($08<<3)+4,(row0+$14)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($55<<3)+4,(row0+$06)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GoriA,$2,  $26<<3,(row0+$14)<<3); // Goriya  2 
data_spawn(rm+STR_PRXM,DairA,$1,  $37<<3,(row0+$16)<<3); // Daira  1
data_spawn(rm+STR_PRXM,Myu_A,$1,  $1C<<3,(row0+$00)<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $38<<3,(row0+$04)<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $4C<<3,(row0+$06)<<3); // Myu  1 


row3  = -PAGE_ROWS;
row4  = row0+$08;
rows3 = row4-row3;
rows4 = rows0 - row4 + PAGE_ROWS
data_exit(EXL0,etA0,1,  CLM2,row3,  CLMS2,rows3,  CLM3,row0-$04,  '54'+EXR0_); // LFT 0, 
data_exit(EXL1,etA0,1,  CLM2,row4,  CLMS2,rows4,  CLM3,row0+$12,  '54'+EXR1_); // LFT 1, 
row3  = -PAGE_ROWS;
data_exit(EXR0,etA0,1,  clm2,row3,  CLMS2,rows1,  clmA,row0+$04,  '56'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmF0,$4,  $56<<3,(row0+$18)<<3); // PBag v4: 200 


//data_rando_scene01("_00"+"_01"+"_02"+"_00"+"_00",rm);








//   --------------------------  5D  ---------------------------  
//    
rm_num  = $5D;







//   --------------------------  5E  ---------------------------  
//    
rm_num  = $5E;








//   --------------------------  5F  ---------------------------  
//     Nabooru quest cave system. 
rm_num  = $5F;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'020', STR_Dark+"01", STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


data_spawn(rm+STR_PRIO,TorchA,$1,  $34<<3,(row0+$17)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
y3=(row0+$1A)<<3;
data_spawn(rm+STR_PRXM,Bot_A,$1,  $1F<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $2C<<3,(row0+$00)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$2,  $36<<3,(row0-$02)<<3); // Bot  2
data_spawn(rm+STR_PRXM,OctoA,$1,  $0E<<3,y3); // Octorok  1
data_spawn(rm+STR_PRXM,OctoA,$2,  $16<<3,y3); // Octorok  2
data_spawn(rm+STR_PRXM,OctoA,$1,  $20<<3,(row0+$04)<<3); // Octorok  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$18,  '61'+EXR0_); // LFT 0, 
row4  = row0+$08;
rows3 = row4-ROW0;
rows4 = rows0 - row4 + PAGE_ROWS
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows3,  clmA,row0-$04,  '54'+EXL0_); // RGT 0, 
data_exit(EXR1,etA0,1,  clm2,row4,  CLMS2,rows4,  clmA,row0+$15,  '54'+EXL1_); // RGT 1, 
//data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows3,  clmA,row0-$04,  '5D'+EXL0_); // RGT 0, 
//data_exit(EXR1,etA0,1,  clm2,row4,  CLMS2,rows4,  clmA,row0+$15,  '5E'+EXL0_); // RGT 1, 


//data_rando_scene01("_00"+"_02"+"_01"+"_00"+"_00",rm);









//   --------------------------  60  ---------------------------  
//    
rm_num  = $60;








//   --------------------------  61  ---------------------------  
//   Nabooru quest cave system. 
rm_num  = $61;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'035', STR_Dark+"01", STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');
_val = p.PAL_NPC_SET1;
dm_palette[?        rm+dk_MOB] = _val;
p.dm_scene_palette[?rm+dk_MOB] = _val;


row3=row0+$18; y3=row3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0C<<3)+4,(row0+$17)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,MegmA,$1,  $0A<<3,(row0+$16)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $15<<3,(row0+$14)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $20<<3,(row0+$00)<<3); // Megmat  1 


clm3=$10; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '62'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row0+$14);                                               // Elevator UP $80,  
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '5F'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmE0,$1,  $09<<3,y3); // Magic Jar (Full)


//data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_01"+STR_JAR,rm);






//   --------------------------  62  ---------------------------  
//     Nabooru Caves: Left exit
rm_num  = $62;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'021', STR_ow_axis+'00');


row3=row0+$17; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,GoriA,$3,  $0A<<3,y3); // Goriya  3
data_spawn(rm+STR_PRXM,GoriA,$3,  $2A<<3,y3); // Goriya  3
data_spawn(rm+STR_PRXM,MegmA,$1,  $06<<3,(row3-$06)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $38<<3,(row3-$04)<<3); // Megmat  1 


clm3=$20; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
      data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '61'+EXU0_); // DWN 0, Elevator down 
      data_Elev(EXD0_, clm3,row0+$13);                                               // Elevator DW $40, 
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
g.dm_rm[?STR_Nabooru+STR_Quest+STR_Exit+"0201"] = _exit;
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 
g.dm_rm[?STR_Nabooru+STR_Quest+STR_Exit+"0202"] = _exit;


data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_00",rm);









//   --------------------------  63  ---------------------------  
//    Whale Isl. Anju's friend 2(Talo)
//owrc0   = $15DB; // 219,21 = $DB,$15 = $15DB
rm_num  = $63;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'118', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_WHALE_ISLAND);
_val = p.PAL_NPC_SET1;
dm_palette[?        rm+dk_MOB] = _val;
p.dm_scene_palette[?rm+dk_MOB] = _val;


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_9,$C,  $0F<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK090C,STR_Sprite+STR_Jack); // BOOK sequence 3.  Talo


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  _WHALE_ISL_OUTSIDE_RM_NAME+EXM0_); // LFT 0, 


data_spawn(rm+STR_PRIO,ItmAA,$1,  $15<<3,(row3-$02)<<3); // BOOK








//   --------------------------  64  ---------------------------  
//    Fast Travel - Dragmire to Nabooru
rm_num  = $64;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(0), STR_Tile+area_EA+'097', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE);


row3=row0+$10; y3=row3<<3;
row4=row0+$08; y4=row4<<3;
row5=row3+$04; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0B<<3,(row3+$01)<<3,  STR_Lit,STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,PushA,$2,  $29<<3,(row0+$08)<<3,  dk_PI+hex_str(global.PI_BGR2)); // Pushable


clm3=$1D; // clm3: left most clm of mid exit
data_exit(EXM0,etB3,1,  clm3,row5,  $03,ROWS2,  clm3-1,row5,  area_TA+'78'+EXM0_); // MID 0, to Nabooru
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '65'+EXL0_); // RGT 0, 








//   --------------------------  65  ---------------------------  
//    Fast Travel - Dragmire to Dragmire Tower
rm_num  = $65;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(0), STR_Tile+area_EA+'098', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE);


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0C<<3,y4,  STR_Lit,STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE


clm3=$13; // clm3: left most clm of mid exit
data_exit(EXM0,etB2,1,  clm3,row3,  $03,ROWS2,  clm3-1,row3,  area_PH+'06'+EXM0_); // MID 0, to Dragmire Tower
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '64'+EXR0_); // LFT 0, 








//   --------------------------  66  ---------------------------  
//     
rm_num  = $66;



//   --------------------------  67  ---------------------------  
//     
rm_num  = $67;



//  ==============================================================
//_spr = g.Pushable_SPR2;
_pi  = global.PI_BGR4;

//   --------------------------  68  ---------------------------  
//     Shortcut to New Kasuto from Palace 6 desert
rm_num  = $68;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'140', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_SEASHORE, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init); // 
data_spawn(rm+STR_PRIO,PushA,$2,  $1E<<3,(row0+$0B)<<3,  dk_PI+hex_str(_pi)); // Pushable


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$08,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0E,  0); // RGT 0, to Overworld 







//   --------------------------  69  ---------------------------  
//     Shortcut to New Kasuto below Palace 5
rm_num  = $69;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'139', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_SEASHORE, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init); // 
data_spawn(rm+STR_PRIO,PushA,$2,  $21<<3,(row0+$0A)<<3,  dk_PI+hex_str(_pi)); // Pushable


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0C,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$12,  0); // RGT 0, to Overworld 








//   --------------------------  6A  ---------------------------  
//     Outside of "IT'S A SECRET TO EVERYBODY" npc. Single house tile in forest on island NW of bridge to Maze Is 
rm_num  = $6A;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Color+color_str(p.C_BLU3), STR_Tile+area_EA+'096', STR_ow_axis+'00');


row3=row0+$17; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0',  $0600,  1,Cloud_1_init);


clm3=clm1-$01;
data_exit(EXM0,etB0,1,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  '6B'+EXL0_); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_rando_scene01("_01"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  6B  ---------------------------  
//    House in forest NW of bridge to MazeIs.     165,71 = $A5,$47 = $47A5
rm_num  = $6B;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'075', STR_ow_axis+hex_str(0));
_val = p.PAL_MOB_SET4;
dm_palette[?        rm+dk_MOB] = _val;
p.dm_scene_palette[?rm+dk_MOB] = _val;


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_9,$3,  $0D<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK010D); // Moblin NPC


                                                              _exit = '6A'+EXM0_;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  _exit); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  _exit); // RGT 0, 


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  $14<<3,y3,  STR_Treasure+STR_Map+"02"); // MAGIC PIECE








//   --------------------------  6C  ---------------------------  
//     
rm_num  = $6C;



//   --------------------------  6D  ---------------------------  
//     
rm_num  = $6D;



//   --------------------------  6E  ---------------------------  
//     
rm_num  = $6E;



//   --------------------------  6F  ---------------------------  
//     
rm_num  = $6F;



//   --------------------------  70  ---------------------------  
//    Cucco wiseman forest hiding spot
rm_num  = $70;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_EA+'041', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_NABOORU_FOREST);


row3=row0+$13; y3=row3<<3;
row4=row3+$02; y4=row4<<3;
//data_NIAO_1a(rm+STR_NIAO+"0",  $0000,  3,StarSky_1_init);
//data_NIAO_1a(rm+STR_NIAO+"1",  $0600,  1,Cloud_1_init);


clm3=$1C;
data_exit(EXM0,etB0,1,  clm3,row4,  CLMS2,ROWS2,  clm3-1,row4,  '71'+EXL0_); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 


data_rando_scene01("_01"+"_00"+"_01"+"_00"+"_00",rm);






//   --------------------------  71  ---------------------------  
//    FAIRY wiseman's 2nd attempt to give FAIRY spell   -CUCCO spell-
rm_num  = $71;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'095', STR_ow_axis+hex_str(0));


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_7,$2,  $17<<3,y3,  STR_Dialogue+DK0708, STR_Sprite+STR_Adam, STR_Spell+STR_ID+hex_str(SPL_FARY)); // CUCCO spell



                                                              _exit='70'+EXM0_;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  _exit); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  _exit); // RGT 0, 








//   --------------------------  72  ---------------------------  
//     
rm_num  = $72;



//   --------------------------  73  ---------------------------  
//     
rm_num  = $73;



//   ============================================================
_color_idx  = p.CI_VLT4_;
_color_idx2 = p.CI_BLU4_;
_pi  = global.PI_BGR1;
row4=$17;  row5=row4-$04;  y5=(row4<<3)+4;
//   --------------------------  74  ---------------------------  
//     Riding RAFT 1.  SEA.  West Launch Scene
rm_num  = $74;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+_color_idx2, STR_Tile+area_EA+'100', STR_ow_axis+'00');

                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init); // 
data_Platform(PlatformRaft,1,  $57<<3,y5, _pi, 1,0,STR_Dock); // RAFT


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$05,  '78'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row5,  '75'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_RAFT);






//   --------------------------  75  ---------------------------  
//     Riding RAFT 1-1.  SEA
rm_num  = $75;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+_color_idx, STR_Tile+area_EA+'102', STR_ow_axis+'00');

                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,CloudCover1_init, -1, 5); // 5: palidx permut
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init); // 
data_Platform(PlatformRaft,1,  $00<<3,y5, _pi); // RAFT
_a=4; _dist1=rm_w div _a;
for(_a=_a-1; _a>0; _a--) data_spawn(rm+STR_PRXM,BoonA,$1,  _dist1*_a,(row0+$08)<<3); // Boon  1 
data_spawn(rm+STR_PRIO,SpBaA,$2,  $00<<3,$00<<3); // BagoSpawner  2.  Bago depth behind water


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row5,  '74'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row5,  '76'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_RAFT);






//   --------------------------  76  ---------------------------  
//     Riding RAFT 1-2.  SEA
rm_num  = $76;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+_color_idx, STR_Tile+area_EA+'103', STR_ow_axis+'00');

                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,CloudCover1_init, -1, 5); // 5: palidx permut
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init); // 
data_Platform(PlatformRaft,1,  $00<<3,y5, _pi); // RAFT
_a=4; _dist1 = rm_w div _a;
for(_a=_a-1; _a>0; _a--) data_spawn(rm+STR_PRXM,BoonA,$1,  _dist1*_a,(row0+$08)<<3); // Boon  1 
data_spawn(rm+STR_PRIO,Spawner_Boggnipp,$1,  $00<<3,(row0+$18)<<3); // Boggnipp Spawner


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row5,  '75'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row5,  '77'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmF0,$7,  $59<<3,(row0+$07)<<3); // PBag 7: 500


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_RAFT);






//   --------------------------  77  ---------------------------  
//     Riding RAFT 1.  SEA.  East Launch Scene
rm_num  = $77;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+_color_idx2, STR_Tile+area_EA+'101', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE);

                                _a=0;
//data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,CloudCover1_init); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init); // 
data_Platform(PlatformRaft,1,  $24<<3,y5, _pi, -1,0,STR_Dock); // RAFT


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row5,  '76'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$10,  0); // RGT 0, to Overworld


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_RAFT);






//   --------------------------  78  ---------------------------  
//     TRIFORCE BARRIER
rm_num  = $78;
set_rm_data(area+hex_str(rm_num), STR_Overworld+dk_ValleyOfDeath, STR_Color+color_str(p.C_BLU3), STR_Tile+area_EA+'104', STR_ow_axis+'00');

                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init); // 
clm3 = $6C; // Barrier center
data_spawn(rm+STR_PRIO,Barrier2,$1,  clm3<<3,(row0+$0E)<<3); // Barrier2  1
g.dm_rm[?"TriforceBarrier1"+dk_SceneName] = rm;
//g.TriforceBarrier1_RM_NAME = rm;


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$18,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$10,  '74'+EXL0_); // RGT 0, 








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


//   =====================================================================
dark_id = 0;
//   --------------------------  80  ---------------------------  
//     Dragon Isle cave.  1st cave system, 
rm_num  = $80;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'120', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3=row0+$16;  y3=row3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  xt0+($02<<3),(row0+$17)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,(row0+$09)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GeruA,$3,  $48<<3,(row0+$08)<<3); // Geru  3 
data_spawn(rm+STR_PRXM,GoriA,$3,  $1E<<3,(row0+$16)<<3); // Goriya  3
data_spawn(rm+STR_PRXM,MegmA,$1,  $20<<3,(row0+$14)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $3D<<3,(row0+$08)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $4C<<3,(row0+$07)<<3); // Megmat  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$16,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$08,  '82'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  81  ---------------------------  
//     Dragon Isle cave.  1st cave system, 
rm_num  = $81;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'105', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,(row0+$09)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1-($02<<3),(row0+$17)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bot_A,$1,  $16<<3,(row0+$0A)<<3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $26<<3,(row0+$0E)<<3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $38<<3,(row0+$16)<<3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $4A<<3,(row0+$16)<<3); // Bot  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $16<<3,(row0+$06)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $1C<<3,(row0+$08)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $3A<<3,(row0+$12)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $40<<3,(row0+$13)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $44<<3,(row0+$14)<<3); // Megmat  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$08,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$16,  '82'+EXL1_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  82  ---------------------------  
//     Dragon Isle cave.  1st cave system, 
rm_num  = $82;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'114', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,(row0+$17)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,(row0+$13)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GeruA,$3,  $60<<3,(row0+$12)<<3); // Geru  3 
data_spawn(rm+STR_PRXM,LowdA,$1,  $26<<3,(row0+$16)<<3); // Lowder  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $14<<3,(row0+$02)<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $24<<3,(row0+$02)<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $56<<3,(row0+$00)<<3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $60<<3,(row0-$02)<<3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $18<<3,(row0+$16)<<3); // Bot  1 


row4=row0+$0A;  rows4=ROWS1+row4;
row5=row0+$06;  rows5=ROWS1+row5;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows4,  CLM3,row0+$00,  '80'+EXR0_); // LFT 0, 
data_exit(EXL1,etA0,1,  CLM2,row4,  CLMS2,ROWS1,  CLM3,row0+$16,  '81'+EXR0_); // LFT 1, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows5,  clmA,row0-$04,  '83'+EXL0_); // RGT 0, 
data_exit(EXR1,etA0,1,  clm2,row5,  CLMS2,ROWS1,  clmA,row0+$12,  '84'+EXL0_); // RGT 1, 


//data_rando_scene01("_00"+"_02"+"_02"+"_00"+"_00",rm);








//   --------------------------  83  ---------------------------  
//     Dragon Isle cave.  1st cave system, 
rm_num  = $83;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'116', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3=row0+$16;  y3=row3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,(row0+$17)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,MagnA,$2,  $12<<3,(row0+$0A)<<3); // Magnot 2
data_spawn(rm+STR_PRXM,OctoA,$2,  $18<<3,y3); // Octorok  2 
data_spawn(rm+STR_PRXM,OctoA,$2,  $28<<3,y3); // Octorok  2 
data_spawn(rm+STR_PRXM,MegmA,$1,  $20<<3,(row0+$10)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $30<<3,(row0+$12)<<3); // Megmat  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '82'+EXR0_); // LFT 0, 


data_spawn(rm+STR_PRIO,ItmE0,$1,  $34<<3,(row0+$16)<<3); // Magic Jar (Full)


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00"+STR_JAR,rm);








//   --------------------------  84  ---------------------------  
//     Dragon Isle cave.  1st cave system, 
rm_num  = $84;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'146', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3=row0+$18;  y3=row3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,(row0+$11)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,(row0+$15)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,BlazA,$2,  ($20<<3)+4,(row0+$18)<<3); // Blaze v2
data_spawn(rm+STR_PRIO,BlazA,$2,  ($30<<3)+4,(row0+$18)<<3); // Blaze v2
data_spawn(rm+STR_PRXM,GlzmA,$2,  $1F<<3,y3,  dk_PI+hex_str(global.PI_MOB_RED)); // Gellzam
data_spawn(rm+STR_PRXM,GeldA,$1,  $17<<3,y3); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $27<<3,y3); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $2B<<3,y3); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $31<<3,y3); // Geldarm  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$10,  '82'+EXR1_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$14,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  85  ---------------------------  
//     Dragon Isle cave.  1st cave system, 
rm_num  = $85;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'122', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,(row0+$0D)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1-($02<<3),(row0+$17)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GoriA,$3,  $20<<3,(row0+$16)<<3); // Goriya  3
data_spawn(rm+STR_PRXM,MegmA,$1,  $10<<3,(row0+$0E)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $18<<3,(row0+$14)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $22<<3,(row0+$16)<<3); // Bot  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0C,  '87'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$16,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  86  ---------------------------  
//     Dragon Isle cave.  1st cave system, 
rm_num  = $86;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'123', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,(row0+$17)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,(row0+$0D)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GoriA,$3,  $1E<<3,(row0+$16)<<3); // Goriya  3
data_spawn(rm+STR_PRXM,MegmA,$1,  $2E<<3,(row3+$0E)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $26<<3,(row3+$14)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $1C<<3,(row0+$16)<<3); // Bot  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$16,  '87'+EXR1_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0C,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  87  ---------------------------  
//     Dragon Isle cave.  1st cave system, 
rm_num  = $87;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'118', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3=row0+$1A;  y3=row3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,(row0+$07)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,(row0+$09)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,(row0+$15)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,LowdA,$1,  $2A<<3,(row0+$12)<<3); // Lowder  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $0C<<3,(row0+$12)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $43<<3,(row0+$0A)<<3); // Myu  1 
_val = DEPTH_BG1;
data_spawn(rm+STR_PRXM,BagiA,$1,  $21<<3,y3,  STR_Depth+string(_val)); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $33<<3,y3,  STR_Depth+string(_val)); // Bagin


row4=row0+$0E;  rows4=ROWS1+row4;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$06,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows4,  clmA,row0+$08,  '85'+EXL0_); // RGT 0, 
data_exit(EXR1,etA0,1,  clm2,row4,  CLMS2,ROWS1,  clmA,row0+$14,  '86'+EXL0_); // RGT 1, 








//   --------------------------  88  ---------------------------  
//     Dragon Isle cave.  1st cave system, 
rm_num  = $88;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'121', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,(row0+$06)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt0+($02<<3),(row0+$13)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1-($02<<3),(row0+$07)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,BubbA,$1,  $10<<3,(row0+$04)<<3,  STR_Direction+hex_str($1|$4)); // Bubble  1
data_spawn(rm+STR_PRXM,BubbA,$2,  $0C<<3,(row0+$10)<<3,  STR_Direction+hex_str($1|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $34<<3,(row0+$16)<<3,  STR_Direction+hex_str($2|$8)); // Bubble  2


row4=row0+$0C;  rows4=ROWS1+row4;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows4,  CLM3,row0+$04,  '8A'+EXR0_); // LFT 0, 
data_exit(EXL1,etA0,1,  CLM2,row4,  CLMS2,ROWS1,  CLM3,row0+$12,  '89'+EXR0_); // LFT 1, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$06,  0); // RGT 0, to Overworld


data_spawn(rm+STR_PRIO,ItmE0,$3,  $33<<3,(row0+$18)<<3); // Magic Jar v3 (1 container) Refresh area to respawn








//   --------------------------  89  ---------------------------  
//     Dragon Isle cave.  1st cave system, 
rm_num  = $89;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'117', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,(row0+$17)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,MagnA,$2,  $2A<<3,(row0+$0A)<<3); // Magnot 2
data_spawn(rm+STR_PRXM,OctoA,$2,  $0F<<3,(row0+$16)<<3); // Octorok  2 
data_spawn(rm+STR_PRXM,OctoA,$2,  $18<<3,(row0+$18)<<3); // Octorok  2 
data_spawn(rm+STR_PRXM,MegmA,$1,  $20<<3,(row0+$10)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $26<<3,(row0+$12)<<3); // Megmat  1 


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$16,  '88'+EXL1_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_00",rm);








//   --------------------------  8A  ---------------------------  
//     Dragon Isle cave.  1st cave system, 
rm_num  = $8A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'147', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3=row0+$16; y3=row3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,(row0+$03)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,(row3+$01)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1-($02<<3),(row0+$09)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,PushA,$2,  $1A<<3,(row0+$08)<<3,  dk_PI+hex_str(global.PI_BGR4)); // Pushable
data_spawn(rm+STR_PRXM,BubbA,$2,  $18<<3,(row0+$09)<<3,  STR_Direction+hex_str($2|$8)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $2C<<3,(row0+$14)<<3,  STR_Direction+hex_str($1|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,DairA,$2,  $12<<3,y3); // Daira  2
data_spawn(rm+STR_PRXM,Myu_A,$1,  $10<<3,(row0+$08)<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $28<<3,(row0+$08)<<3); // Bot  1 


row4=row0+$0A; rows4=ROWS1+row4;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows4,  CLM3,row0+$02,  '8B'+EXR0_); // LFT 0, 
data_exit(EXL1,etA0,1,  CLM2,row4,  CLMS2,ROWS1,  CLM3,row3,  '8B'+EXR1_); // LFT 1, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$08,  '88'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmE0,$3,  $33<<3,y3); // Magic Jar v3 (1 container) Refresh area to respawn








//   --------------------------  8B  ---------------------------  
//     Dragon Isle cave.  1st cave system, 
rm_num  = $8B;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'119', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,(row0+$07)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,(row0+$16)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1-($02<<3),(row0+$09)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,(row0+$16)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,PushA,$2,  $25<<3,(row0+$06)<<3,  dk_PI+hex_str(global.PI_BGR4)); // Pushable
data_spawn(rm+STR_PRXM,Myu_A,$1,  $30<<3,y3); // Myu  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $0E<<3,y3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $10<<3,(row0+$08)<<3); // Bot  1 


row4  = row0+$0E;
rows4 = ROWS1+row4;
row5  = row0+$10;
rows5 = ROWS1+row5;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows4,  CLM3,row0+$06,  '8C'+EXR0_); // LFT 0, 
data_exit(EXL1,etA0,1,  CLM2,row4,  CLMS2,ROWS1,  CLM3,row0+$15,  0); // LFT 1, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows5,  clmA,row0+$08,  '8A'+EXL0_); // RGT 0, 
data_exit(EXR1,etA0,1,  clm2,row5,  CLMS2,ROWS1,  clmA,row0+$15,  '8A'+EXL1_); // RGT 1, 








//   --------------------------  8C  ---------------------------  
//     
rm_num  = $8C;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'123', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


data_spawn(rm+STR_PRIO,TorchA,$1,  xt0+($02<<3),(row0+$17)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,(row0+$0D)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,MegmA,$1,  $16<<3,(row0+$12)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $1A<<3,(row0+$13)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $1D<<3,(row0+$14)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $22<<3,(row0+$13)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $26<<3,(row0+$12)<<3); // Megmat  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$16,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0C,  '8B'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  8D  ---------------------------  
//     
rm_num  = $8D;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'125', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3 = row0+$1A;
y3   = row3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,(row0+$18)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,(row0+$13)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Boggnipp,$1,  (clm1-1)<<3,y3); // Boggnipp
data_spawn(rm+STR_PRXM,OctoA,$2,  $14<<3,y3); // Octorok  2 
data_spawn(rm+STR_PRXM,OctoA,$2,  $24<<3,y3); // Octorok  2 
data_spawn(rm+STR_PRXM,OctoA,$2,  $34<<3,y3); // Octorok  2 
data_spawn(rm+STR_PRXM,OctoA,$2,  $40<<3,y3); // Octorok  2 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $0F<<3,y3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $27<<3,y3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $37<<3,y3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $47<<3,y3); // Bot  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$18,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$12,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  8E  ---------------------------  
//     
rm_num  = $8E;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'113', STR_View+'00', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,$37<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,$1D<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GoriA,$3,  $20<<3,$30<<3); // Goriya  3
data_spawn(rm+STR_PRXM,DeelA,$2,  $12<<3,$28<<3); // Deeler  2 
data_spawn(rm+STR_PRXM,DeelA,$2,  $1C<<3,$24<<3); // Deeler  2 
data_spawn(rm+STR_PRXM,DeelA,$2,  $2F<<3,$16<<3); // Deeler  2 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,$36,  '8F'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,$1C,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  8F  ---------------------------  
//     
rm_num  = $8F;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'112', STR_View+'00', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,$09<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,$35<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,AttaA,$1,  $1E<<3,$16<<3); // Atta  1
data_spawn(rm+STR_PRXM,AttaA,$1,  $2F<<3,$1D<<3); // Atta  1
data_spawn(rm+STR_PRXM,AttaA,$1,  $3D<<3,$2E<<3); // Atta  1
data_spawn(rm+STR_PRXM,Myu_A,$1,  $0F<<3,$16<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $1B<<3,$1C<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $23<<3,$20<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $2C<<3,$26<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $3E<<3,$34<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $4E<<3,$36<<3); // Myu  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,$08,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,$34,  '8E'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_JUMP);








//   --------------------------  90  ---------------------------  
//     Dragmire. Deadend water shoals rm
rm_num  = $90;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR2_, STR_Tile+area_EA+'126', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3=row0+$18; y3=(row0+$08)<<3;
data_NIAO_1a(rm+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
data_spawn(rm+STR_PRXM,BoonA,$1,  $1F<<3,y3); // Boon  1 
data_spawn(rm+STR_PRXM,BoonA,$1,  $3F<<3,y3); // Boon  1 
data_spawn(rm+STR_PRXM,Boggnipp,$1,  $32<<3,(row0+$1A)<<3); // Boggnipp


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_spawn(rm+STR_PRIO,ItmE0,$1,  $53<<3,(row0+$08)<<3); // Magic Jar v1: Red(Full) Refresh area to respawn
data_spawn(rm+STR_PRIO,ItmF0,$A,  $3B<<3,(row0+$06)<<3); // PBag vA: 1000 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  91  ---------------------------  
//     Forest before Monster Town - 1
rm_num  = $91;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'012', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3 = row0+$15;
y3   = row3<<3;
//data_spawn(rm+STR_PRXM,ZoraA,$1,  $3A<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $4C<<3,y3); // Aruroda  1 
data_spawn(rm+STR_PRXM,ZoraA,$1,  $18<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $06<<3,(row0+$10)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $0E<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1C<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3A<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $46<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,(row0+$12)<<3); // Girubokku  1 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  92  ---------------------------  
//     Forest before Monster Town - 
rm_num  = $92;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'012', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3 = row0+$15;
y3   = row3<<3;
//data_spawn(rm+STR_PRXM,ZoraA,$1,  $3A<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $4C<<3,y3); // Aruroda  1 
data_spawn(rm+STR_PRXM,ZoraA,$1,  $18<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $06<<3,(row0+$10)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $0E<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1C<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3A<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $46<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,(row0+$12)<<3); // Girubokku  1 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  93  ---------------------------  
//     Forest before Monster Town - 
rm_num  = $93;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'012', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3 = row0+$15;
y3   = row3<<3;
//data_spawn(rm+STR_PRXM,ZoraA,$1,  $3A<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $4C<<3,y3); // Aruroda  1 
data_spawn(rm+STR_PRXM,ZoraA,$1,  $18<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $06<<3,(row0+$10)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $0E<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1C<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3A<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $46<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,(row0+$12)<<3); // Girubokku  1 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  94  ---------------------------  
//     Forest before Monster Town - 
rm_num  = $94;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'012', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3 = row0+$15;
y3   = row3<<3;
//data_spawn(rm+STR_PRXM,ZoraA,$1,  $3A<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $4C<<3,y3); // Aruroda  1 
data_spawn(rm+STR_PRXM,ZoraA,$1,  $18<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $06<<3,(row0+$10)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $0E<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1C<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3A<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $46<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,(row0+$12)<<3); // Girubokku  1 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  95  ---------------------------  
//     Forest before Monster Town - 
rm_num  = $95;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'012', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3 = row0+$15;
y3   = row3<<3;
//data_spawn(rm+STR_PRXM,ZoraA,$1,  $3A<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $4C<<3,y3); // Aruroda  1 
data_spawn(rm+STR_PRXM,ZoraA,$1,  $18<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $06<<3,(row0+$10)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $0E<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1C<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3A<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $46<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,(row0+$12)<<3); // Girubokku  1 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  96  ---------------------------  
//     Forest before Monster Town - 
rm_num  = $96;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'012', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3 = row0+$15;
y3   = row3<<3;
//data_spawn(rm+STR_PRXM,ZoraA,$1,  $3A<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $4C<<3,y3); // Aruroda  1 
data_spawn(rm+STR_PRXM,ZoraA,$1,  $18<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $06<<3,(row0+$10)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $0E<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1C<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3A<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $46<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,(row0+$12)<<3); // Girubokku  1 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  97  ---------------------------  
//     Forest before Monster Town - 
rm_num  = $97;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'012', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3 = row0+$15;
y3   = row3<<3;
//data_spawn(rm+STR_PRXM,ZoraA,$1,  $3A<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $4C<<3,y3); // Aruroda  1 
data_spawn(rm+STR_PRXM,ZoraA,$1,  $18<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $06<<3,(row0+$10)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $0E<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1C<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3A<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $46<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,(row0+$12)<<3); // Girubokku  1 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  98  ---------------------------  
//     Forest before Monster Town - 
rm_num  = $98;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'012', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3 = row0+$15;
y3   = row3<<3;
//data_spawn(rm+STR_PRXM,ZoraA,$1,  $3A<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $4C<<3,y3); // Aruroda  1 
data_spawn(rm+STR_PRXM,ZoraA,$1,  $18<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $06<<3,(row0+$10)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $0E<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1C<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3A<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $46<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,(row0+$12)<<3); // Girubokku  1 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  99  ---------------------------  
//     Forest before Monster Town - 
rm_num  = $99;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'012', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3 = row0+$15;
y3   = row3<<3;
//data_spawn(rm+STR_PRXM,ZoraA,$1,  $3A<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $4C<<3,y3); // Aruroda  1 
data_spawn(rm+STR_PRXM,ZoraA,$1,  $18<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $06<<3,(row0+$10)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $0E<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1C<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3A<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $46<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,(row0+$12)<<3); // Girubokku  1 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  9A  ---------------------------  
//     Forest before Monster Town - 
rm_num  = $9A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'012', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3 = row0+$15;
y3   = row3<<3;
//data_spawn(rm+STR_PRXM,ZoraA,$1,  $3A<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $4C<<3,y3); // Aruroda  1 
data_spawn(rm+STR_PRXM,ZoraA,$1,  $18<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $06<<3,(row0+$10)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $0E<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1C<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3A<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $46<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,(row0+$12)<<3); // Girubokku  1 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  9B  ---------------------------  
//     Forest before Monster Town - 
rm_num  = $9B;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'012', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3 = row0+$15;
y3   = row3<<3;
//data_spawn(rm+STR_PRXM,ZoraA,$1,  $3A<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $4C<<3,y3); // Aruroda  1 
data_spawn(rm+STR_PRXM,ZoraA,$1,  $18<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $06<<3,(row0+$10)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $0E<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1C<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3A<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $46<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,(row0+$12)<<3); // Girubokku  1 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  9C  ---------------------------  
//     Forest before Monster Town - 
rm_num  = $9C;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'012', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3 = row0+$15;
y3   = row3<<3;
//data_spawn(rm+STR_PRXM,ZoraA,$1,  $3A<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $4C<<3,y3); // Aruroda  1 
data_spawn(rm+STR_PRXM,ZoraA,$1,  $18<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $06<<3,(row0+$10)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $0E<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1C<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3A<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $46<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,(row0+$12)<<3); // Girubokku  1 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  9D  ---------------------------  
//     Forest before Monster Town - 
rm_num  = $9D;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'012', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3 = row0+$15;
y3   = row3<<3;
//data_spawn(rm+STR_PRXM,ZoraA,$1,  $3A<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $4C<<3,y3); // Aruroda  1 
data_spawn(rm+STR_PRXM,ZoraA,$1,  $18<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $06<<3,(row0+$10)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $0E<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1C<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3A<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $46<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,(row0+$12)<<3); // Girubokku  1 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  9E  ---------------------------  
//     Forest before Monster Town - 
rm_num  = $9E;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'012', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3 = row0+$15;
y3   = row3<<3;
//data_spawn(rm+STR_PRXM,ZoraA,$1,  $3A<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $4C<<3,y3); // Aruroda  1 
data_spawn(rm+STR_PRXM,ZoraA,$1,  $18<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $06<<3,(row0+$10)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $0E<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1C<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3A<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $46<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,(row0+$12)<<3); // Girubokku  1 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  9F  ---------------------------  
//     Forest before Monster Town - 
rm_num  = $9F;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'012', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3 = row0+$15;
y3   = row3<<3;
//data_spawn(rm+STR_PRXM,ZoraA,$1,  $3A<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,ArurA,$1,  $4C<<3,y3); // Aruroda  1 
data_spawn(rm+STR_PRXM,ZoraA,$1,  $18<<3,y3); // Zora  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $06<<3,(row0+$10)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $0E<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $1C<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3A<<3,(row0+$12)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $46<<3,(row0+$14)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $52<<3,(row0+$12)<<3); // Girubokku  1 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  A0  ---------------------------  
//     Dragon Isle, MASK Caves, Exit
rm_num  = $A0;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(0), STR_Tile+area_EA+'127', STR_ow_axis+'00', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE);


row3 = row0+$18;
y3   = row3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,(row0+$13)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,(row0+$03)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,MagnA,$2,  $37<<3,(row0+$08)<<3); // Magnot 2
data_spawn(rm+STR_PRIO,SpTrB,$2,  $40<<3,(row0+$16)<<3,  dk_PI+hex_str(global.PI_MOB_RED),STR_Speed+hex_str(4),STR_Direction+string(1)); // SpikeTrapB v2: Short, Auto horizontal
data_spawn(rm+STR_PRXM,MegmA,$1,  $1E<<3,(row0+$0A)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $23<<3,(row0+$08)<<3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $28<<3,(row0+$0B)<<3); // Megmat  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$12,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$02,  'A3'+EXL0_); // RGT 0, 







//   --------------------------  A1  ---------------------------  
//    MASK Caves 1
rm_num  = $A1;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(0), STR_Tile+area_EA+'128', STR_ow_axis+'00', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE);


row3=row0+$1A; y3=row3<<3;
row4=row0+$0E; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0A<<3,(row0+$13)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $7A<<3,(row4+$01)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,BagiA,$1,  $19<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $21<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,GoriA,$3,  $2E<<3,(row0+$12)<<3); // Goriya  3
data_spawn(rm+STR_PRXM,OctoA,$1,  $45<<3,(row0+$0A)<<3); // Octorok  1
data_spawn(rm+STR_PRXM,OctoA,$1,  $66<<3,(row4+$02)<<3); // Octorok  1
data_spawn(rm+STR_PRXM,Myu_A,$1,  $39<<3,(row0+$0C)<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $53<<3,(row0+$0C)<<3); // Myu  1 


data_exit(EXU0,etA0,0,  $0C,row_e0,  $08,ROWS5,  $0F,row_e4,  0); // UP  0, Pit up, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  'A2'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_01"+STR_Pit+"8",rm);








//   --------------------------  A2  ---------------------------  
//    MASK Caves 2
rm_num  = $A2;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(0), STR_Tile+area_EA+'146', STR_ow_axis+'00', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE);


row3=row0+$18; y3=row3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,(row0+$11)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,(row0+$15)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,BlazA,$2,  ($20<<3)+4,(row0+$18)<<3); // Blaze v2
data_spawn(rm+STR_PRIO,BlazA,$2,  ($30<<3)+4,(row0+$18)<<3); // Blaze v2
data_spawn(rm+STR_PRXM,GlzmA,$2,  $1F<<3,y3,  dk_PI+hex_str(global.PI_MOB_RED)); // Gellzam
data_spawn(rm+STR_PRXM,GeldA,$1,  $17<<3,y3); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $27<<3,y3); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $2B<<3,y3); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $31<<3,y3); // Geldarm  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$10,  'A1'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$14,  'A3'+EXL1_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  A3  ---------------------------  
//    MASK Caves 3
rm_num  = $A3;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(0), STR_Tile+area_EA+'129', STR_ow_axis+'00', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE);


row3 = row0+$18;
y3   = row3<<3;
clm4 = $29;
data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,(row0+$17)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  clm4<<3,(row0+$0A)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  clm4<<3,(row0+$18)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,DeelA,$1,  $0E<<3,(row0+$12)<<3); // Deeler  1 
data_spawn(rm+STR_PRXM,Bot_A,$2,  $10<<3,y3); // Bot  2 
data_spawn(rm+STR_PRXM,Bot_A,$2,  $19<<3,y3); // Bot  2 
data_spawn(rm+STR_PRXM,Bot_A,$2,  $23<<3,y3); // Bot  2 
data_spawn(rm+STR_PRXM,Bot_A,$2,  $1A<<3,(row0+$06)<<3); // Bot  2 


clm3 = $30; // Elevator center
data_exit(EXD0,etC0,1,  clm3-4,row_e2,  CLMS4,ROWS_E0,  clm3-1,row_e3,  'A4'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$15);                                            // Elevator DW $40, 
row4 = row0+$08;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS1+row4,  CLM3,row0-$04,  'A0'+EXR0_); // LFT 0, 
data_exit(EXL1,etA0,1,  CLM2,row4,  CLMS2,rows1-row4,  CLM3,row0+$16,  'A2'+EXR0_); // LFT 1, 


//data_rando_scene01("_00"+"_00"+"_02"+"_01"+"_00",rm);








//  =======================================================================
//  MASK Item Dungeon
dark_id = 1;
ow_axis = 0;
var _Push1_CLM  = $0E;
var _Push2_CLM  = $15;
var _Push3_CLM  = $29;
var _Push4_CLM  = $30;

var _Push_PI    = global.PI_BGR4;
//var _Push_SPR   = g.Pushable_SPR2;

//   --------------------------  A4  ---------------------------  
//     
rm_num  = $A4;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'130', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE);


y4   =(row0+$10)<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($1C<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($22<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bot_A,$1,  $13<<3,(row0+$12)<<3); // Bot  1 


clm3  = $20; // Elevator center
data_exit(EXU0,etC0,1,  clm3-4,row_e0,  CLMS4,ROWS_E0,  clm3-1,row_e1,  'A3'+EXD0_); // UP  0, Elevator up 
data_exit(EXD0,etC0,1,  clm3-4,row_e2,  CLMS4,ROWS_E0,  clm3-1,row_e3,  'A5'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_, clm3,row0+$0D);                                            // Elevator DW $40, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0F,  'AA'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_00"+"_01"+"_01",rm);








//   --------------------------  A5  ---------------------------  
//     
rm_num  = $A5;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'136', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE);


y4   =(row0+$10)<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($1C<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($22<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bot_A,$2,  $0C<<3,(row0+$12)<<3); // Bot  2 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $13<<3,(row0+$12)<<3); // Bot  1 


clm3  = $20; // Elevator center
data_exit(EXU0,etC0,1,  clm3-4,row_e0,  CLMS4,ROWS_E0,  clm3-1,row_e1,  'A4'+EXD0_); // UP  0, Elevator up 
data_exit(EXD0,etC0,1,  clm3-4,row_e2,  CLMS4,ROWS_E0,  clm3-1,row_e3,  'A6'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_, clm3,row0+$0D);                                            // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$10,  'A7'+EXR0_); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_01"+"_01",rm);








//   --------------------------  A6  ---------------------------  
//     
rm_num  = $A6;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'131', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE);


row3 = row0+$18;
y4   =(row3+$01)<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,row2<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($2C<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($32<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clm3  = $30; // Elevator center
data_exit(EXU0,etC0,1,  clm3-4,row_e0,  CLMS4,ROWS_E0,  clm3-1,row_e1,  'A5'+EXD0_); // UP  0, Elevator up 
data_Elev(EXU0_, clm3,row0+$16);                                                     // Elevator UP $80
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$17,  'A7'+EXR1_); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01",rm);








//   --------------------------  A7  ---------------------------  
//     
rm_num  = $A7;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'138', STR_View+'02', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE);



row3=row0+$0E; y3=row3<<3;

x3=($3A<<3)+4; _pi=global.PI_BGR4; _depth=DEPTH_BG5-1;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,$2E<<3,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,(row3+$02)<<3,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE

row4=row0+$14; y4=row4<<3;
_val  = hex_str(row4+$06);
_data = _val+hex_str(_Push1_CLM) + _val+hex_str(_Push2_CLM) + _val+hex_str(_Push3_CLM) + _val+hex_str(_Push4_CLM);
data_spawn_2a(STR_Challenge,Challenge_PushableMatching1,1,  $37<<3,y4,  -1,  _data);
data_spawn(rm+STR_PRIO,PushA,$1,  $0F<<3,y4,  dk_PI+hex_str(_Push_PI)); // Pushable
data_spawn(rm+STR_PRIO,PushA,$1,  $2E<<3,y4,  dk_PI+hex_str(_Push_PI)); // Pushable
data_spawn(rm+STR_PRIO,PushA,$1,  $10<<3,$22<<3,  dk_PI+hex_str(_Push_PI)); // Pushable
data_spawn(rm+STR_PRIO,PushA,$1,  $27<<3,$26<<3,  dk_PI+hex_str(_Push_PI)); // Pushable


clm3  = $19;
data_exit(EXD0,etA1,1,  $0A,row_e2,  $2C,ROWS_E0,  clm3,row_e3,  'AA'+EXU0_); // DWN 0, Pit down 
data_pit(exit_name_d0, 0,2);
row5=$40; rows4=abs(ROW0)+row5; rows5=(rows0-row5)+ROWS1;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  'A8'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows4,  clmA,$2C,  'A5'+EXL0_); // RGT 0, 
data_exit(EXR1,etA0,1,  clm2,row5,  CLMS2,rows5,  clmA,row3,  'A6'+EXL0_); // RGT 1, 









//   --------------------------  A8  ---------------------------  
//     MASK
rm_num  = $A8;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'133', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE);


row3=row0+$16; y3=row3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $34<<3,(row3+$01)<<3); // v1: Light w/ CANDLE or FIRE


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  'A7'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmE0,$1,  $22<<3,y3); // v1 Magic Jar(Full)
data_spawn(rm+STR_PRIO,ItmAD,$1,  ($18<<3)+4,y3); // MASK
data_spawn(rm+STR_PRIO,ItmF0,$8,  $0E<<3,y3); // PBag v8 500 
data_spawn(rm+STR_PRIO,ItmF0,$8,  $2C<<3,y3); // PBag v8 500 


//data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_00",rm);








//   --------------------------  A9  ---------------------------  
//     


//   --------------------------  AA  ---------------------------  
//     
rm_num  = $AA;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'135', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE);


row3=row0+$14; y3=row3<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($06<<3)+4,(row3+$01)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,PushA,$1,  _Push1_CLM<<3,y3,  dk_PI+hex_str(_Push_PI)); // Pushable
data_spawn(rm+STR_PRIO,PushA,$1,  _Push2_CLM<<3,y3,  dk_PI+hex_str(_Push_PI)); // Pushable
data_spawn(rm+STR_PRIO,PushA,$1,  _Push3_CLM<<3,y3,  dk_PI+hex_str(_Push_PI)); // Pushable
data_spawn(rm+STR_PRIO,PushA,$1,  _Push4_CLM<<3,y3,  dk_PI+hex_str(_Push_PI)); // Pushable
y4=(row0+$0C)<<3;  _pi=global.PI_BGR2;
data_spawn(rm+STR_PRIO,SpDrA,$3,  $13<<3,y4,  dk_PI+hex_str(_pi),STR_Type+hex_str(4)); // Drop spawner v3. Drops Bot & Flame1
data_spawn(rm+STR_PRIO,SpDrA,$3,  $2B<<3,y4,  dk_PI+hex_str(_pi),STR_Type+hex_str(4)); // Drop spawner v3. Drops Bot & Flame1


data_exit(EXU0,etA4,0,  $0C,row_e0,  $28,ROWS_E0,  clm1-$01,row_e4,  'A7'+EXD0_); // UP  0, Pit up 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  'A4'+EXR0_); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01"+STR_Pit+"8",rm);








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


//   ============================================================================
ow_axis = 0;
dark_id = 0;
//   --------------------------  B0  ---------------------------  
//     Caves between monster town & Ganon Tower - 1
rm_num  = $B0;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'144', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE);


y4=(row0+$1A)<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,(row0+$13)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,(row0+$07)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Boggnipp,$1,  $3E<<3,y4); // Boggnipp
data_spawn(rm+STR_PRXM,Boggnipp,$1,  $50<<3,y4); // Boggnipp
data_spawn(rm+STR_PRXM,Boggnipp,$1,  $67<<3,y4); // Boggnipp


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$12,  area_TB+'64'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$06,  'B1'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_JUMP);








//   --------------------------  B1  ---------------------------  
//     Caves between monster town & Ganon Tower - 2
rm_num  = $B1;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'109', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE);


y4=(row0+$10)<<3;
data_spawn_2a(STR_Challenge,Challenge_IntermittentPlatformSequence,$3,  0,0,  -1, STR_HIDDEN+hex_str(TID_HIDE_1&$F)); // 
data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,(row0+$09)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,(row0+$14)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GiruA,$1,  $16<<3,(row0+$10)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $30<<3,(row0+$0C)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $3A<<3,(row0+$0E)<<3); // Girubokku  1 
data_spawn(rm+STR_PRXM,GiruA,$1,  $4A<<3,(row0+$08)<<3); // Girubokku  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$08,  'B0'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$13,  'B2'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00"+object_get_name(Challenge_IntermittentPlatformSequence),rm);








//   --------------------------  B2  ---------------------------  
//     Caves between monster town & Ganon Tower - 3
rm_num  = $B2;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'145', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE);


y3=(row0+$1A)<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,(row0+$14)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt1,(row0+$09)<<3); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRXM,BagiA,$1,  $19<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $21<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $49<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $51<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,OctoA,$1,  $28<<3,(row0+$14)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $5C<<3,(row0+$0C)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $70<<3,(row0+$0A)<<3); // Myu  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$12,  'B1'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$08,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  B3  ---------------------------  
//     Mount Dragmire. Path to tower
rm_num  = $B3;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'167', STR_ow_axis+'03', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


y3=(row0+$09)<<3;
data_spawn(rm+STR_PRXM,Blooby,$1,  $39<<3,y3,  1,$00); // Blooby 1
data_spawn(rm+STR_PRXM,Blooby,$1,  $48<<3,y3,  1,$00); // Blooby 1
data_spawn(rm+STR_PRXM,Blooby,$1,  $57<<3,y3,  1,$00); // Blooby 1
data_spawn(rm+STR_PRXM,Blooby,$1,  $66<<3,(row0+$0C)<<3,  1,$00); // Blooby 1
data_spawn(rm+STR_PRXM,OctoA,$1,  $24<<3,(row0+$17)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $53<<3,(row0+$17)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $68<<3,(row0+$19)<<3); // Octorok  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $40<<3,(row0+$15)<<3); // Myu  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$15,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$02,  0); // RGT 0, to Overworld








//   --------------------------  B4  ---------------------------  
//     Mount Dragmire. Path to tower
rm_num  = $B4;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'168', STR_ow_axis+'03', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


y3=(row0+$1A)<<3;
data_spawn(rm+STR_PRXM,Blooby,$1,  $70<<3,(row0+$12)<<3,  1,$00); // Blooby 1
data_spawn(rm+STR_PRXM,Myu_A,$1,  $22<<3,(row0+$15)<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $40<<3,(row0+$10)<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $58<<3,(row0+$0C)<<3); // Myu  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$11,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$00,  0); // RGT 0, to Overworld








//   --------------------------  B5  ---------------------------  
//     Mount Dragmire. Path to tower
rm_num  = $B5;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'169', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3=row0+$18;  y3=(row3+$02)<<3;  y4=(row0+$08)<<3;
data_NIAO_1a(rm+STR_NIAO+"0", $0000, 1,Cloud_1_init); // 
data_spawn(rm+STR_PRIO,SpMoA,$1,  $00<<3,(row0+$08)<<3); // MobySpawner  1 
data_spawn(rm+STR_PRIO,Spawner_Boggnipp,$1,  $00<<3,y3); // Boggnipp Spawner
//data_spawn(rm+STR_PRXM,BoonA,$1,  $1F<<3,y4); // Boon  1 
//data_spawn(rm+STR_PRXM,BoonA,$1,  $3F<<3,y4); // Boon  1 
//data_spawn(rm+STR_PRXM,BoonA,$1,  $5F<<3,y4); // Boon  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  B6  ---------------------------  
//     Mount Dragmire. Path to tower
rm_num  = $B6;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'170', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_DRAGMIRE, dk_SceneMusicThemeException+"01");


row3=row0+$0E; y3=row3<<3;
row4=row0-$04; y4=row4<<3;
data_spawn(rm+STR_PRXM,Blooby,$1,  $1D<<3,(row0+$18)<<3,  1,$00); // Blooby 1
data_spawn(rm+STR_PRXM,Blooby,$1,  $24<<3,(row0+$14)<<3,  1,$00); // Blooby 1
data_spawn(rm+STR_PRXM,Blooby,$1,  $2C<<3,(row0+$0D)<<3,  1,$00); // Blooby 1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  0); // RGT 0, to Overworld








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


//   =====================================================================
_map_area   = _MapAreaName_VALLEY_OF_DEATH;
ow_axis     = 1;
mus0        = MUS_THEWILD;
_pi         = global.PI_BGR2;
dark_id     = 0;
//   --------------------------  C0  ---------------------------  
//     Cave, route from Dark Link to bottom of Death Valley
rm_num  = $C0;
set_rm_data(area+hex_str(rm_num), mus0, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'160', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_VALLEY_OF_DEATH);


y3 = (row0+$13)<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($05<<3)+4,y3,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0C<<3)+4,y3,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($13<<3)+4,y3,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($64<<3)+4,(row0+$0B)<<3,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
y3 = (row0+$0C)<<3;
data_spawn(rm+STR_PRXM,GeruA,$1,  $2E<<3,(row0+$12)<<3); // Geru  3 
data_spawn(rm+STR_PRXM,LowdA,$1,  $3A<<3,y3); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $51<<3,y3); // Lowder  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $10<<3,(row0+$14)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $64<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $6E<<3,y3); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$12,  area_PG+"36"+EXR0_); // LFT 0, to Great Palace
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0A,  "C1"+EXL0_); // RGT 0, 
//data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0C,  "C1"+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  C1  ---------------------------  
//     Cave, route from Dark Link to bottom of Death Valley
rm_num  = $C1;
set_rm_data(area+hex_str(rm_num), mus0, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'164', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_VALLEY_OF_DEATH);


y3 = (row0+$15)<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($26<<3)+4,y3,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($38<<3)+4,y3,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($56<<3)+4,y3,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
y3 = (row0+$1A)<<3;
y4 = (row0+$08)<<3;
data_spawn(rm+STR_PRIO,SpPoA,$1,  $00<<3,(row0+$00)<<3); // BubbleSpawner  1 
data_spawn(rm+STR_PRXM,BagiA,$1,  $1A<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $44<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $4F<<3,y3); // Bagin
data_spawn(rm+STR_PRXM,AcheA,$1,  $24<<3,y4); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $2F<<3,y4); // Ache  1 
//data_spawn(rm+STR_PRXM,AcheA,$2,  $2F<<3,y4); // Ache  2 
data_spawn(rm+STR_PRXM,AcheA,$1,  $3A<<3,y4); // Ache  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$06,  "C0"+EXR0_); // LFT 0, to Great Palace
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$14,  "C2"+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  C2  ---------------------------  
//     Cave, route from Dark Link to bottom of Death Valley
rm_num  = $C2;
set_rm_data(area+hex_str(rm_num), mus0, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'161', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_VALLEY_OF_DEATH);



data_spawn(rm+STR_PRIO,TorchA,$1,  ($0B<<3)+4,(row0+$13)<<3,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($50<<3)+4,(row0+$15)<<3,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Blooby,$1,  $4D<<3,(row0+$0F)<<3,  1,$00); // Blooby 1
data_spawn(rm+STR_PRXM,BagiA,$1,  $2A<<3,(row0+$1A)<<3); // Bagin
data_spawn(rm+STR_PRXM,DairA,$1,  $1E<<3,(row0+$0E)<<3); // Daira  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$12,  "C1"+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$02,  "C3"+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_JUMP);








//   --------------------------  C3  ---------------------------  
//     Cave, route from Dark Link to bottom of Death Valley
rm_num  = $C3;
set_rm_data(area+hex_str(rm_num), mus0, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'162', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_VALLEY_OF_DEATH);


y3=(row0+$15)<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($22<<3)+4,y3,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($32<<3)+4,y3,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($49<<3)+4,y3,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GumaA,$1,  $1E<<3,(row0+$14)<<3); // Guma  1
data_spawn(rm+STR_PRXM,Moa_A,$2,  $30<<3,(row0+$10)<<3); // Moa  2 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $0C<<3,(row0+$12)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $48<<3,(row0+$09)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $4C<<3,(row0+$16)<<3); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0E,  "C2"+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$11,  "C6"+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_JUMP);








//   --------------------------  C4  ---------------------------  
//    


//   --------------------------  C5  ---------------------------  
//    


//   --------------------------  C6  ---------------------------  
//     Cave, route from Dark Link to bottom of Death Valley
rm_num  = $C6;
set_rm_data(area+hex_str(rm_num), mus0, STR_Dark+hex_str(dark_id), STR_Tile+area_EA+'166', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_VALLEY_OF_DEATH);


data_spawn(rm+STR_PRIO,SpPoA,$1,  $00<<3,(row0+$00)<<3); // BubbleSpawner  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $2B<<3,(row0+$12)<<3); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $39<<3,(row0+$0E)<<3); // Lowder  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $0E<<3,(row0+$12)<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $43<<3,(row0+$0A)<<3); // Myu  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$10,  "C3"+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$08,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








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






