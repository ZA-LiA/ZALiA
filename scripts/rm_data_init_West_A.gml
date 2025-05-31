/// rm_data_init_West_A()


var _i, _a,_b, _dist;
var _val,_val1,_val2,_val3,_val4;
var _x,_x1,_x2,_y,_yt,_y2,_y3, _w,_w2,_w3, _h,_h2,_h3;
var _clm,_clm2, _row,_row2, _clms,_rows;
var _pi,_color_idx, _obj,_ver;
var _dk, _dk1,_dk2,_dk3,_dk4;
var _file, _exit, _open, _owrc,_owrc0;
var _page,_pages,_pages_x,_pages_y;
var _page  = 0;
var _pages = 0;
var _data  = 0;
var _tsrc;






// NOTE: For Map Area Names:
// 19 characters(including spaces) fits, but is tight. 18 characters will be the limit.
var _MapAreaName_NORTH_CASTLE        = MapAreaName_NORTH_CASTLE;
var _MapAreaName_NORTH_CASTLE_LAKE   = MapAreaName_NORTH_CASTLE_LAKE;
//var _MapAreaName_NORTH_CASTLE_FOREST = MapAreaName_NORTH_CASTLE_FOREST;
var _MapAreaName_NORTH_CASTLE_FIELD  = MapAreaName_NORTH_CASTLE_FIELD;
var _MapAreaName_PARAPA_DESERT       = MapAreaName_PARAPA_DESERT;
var _MapAreaName_TANTARI_DESERT      = MapAreaName_TANTARI_DESERT;
//var _MapAreaName_RAURU_WOODS         = "RAURU WOODS";
//var _MapAreaName_RAURU_PASS          = "RAURU PASS"; // Boulder next to Rauru
var _MapAreaName_RUTO_MOUNTAINS      = "RUTO MOUNTAINS";
var _MapAreaName_MORUGE_SWAMP        = "MORUGE SWAMP";
var _MapAreaName_SARIA_RIVER         = "SARIA RIVER";
var _MapAreaName_SARIA_FIELD         = "SARIA FIELD";
var _MapAreaName_SARIA_RIVER_WOODS   = "SARIA RIVER WOODS";
var _MapAreaName_SARIA_CEMETERY      = "SARIA CEMETERY";
var _MapAreaName_SARIA_BAY           = "SARIA BAY";
var _MapAreaName_MIDORO_SWAMP        = "MIDORO SWAMP";
var _MapAreaName_MIDORO_FIELD        = "MIDORO FIELD";
var _MapAreaName_ROYAL_CEMETERY      = "ROYAL CEMETERY";
//var _MapAreaName_KINGS_TOMB          = "KINGS TOMB";



map_clm_off =  0;
map_row_off =  0;












// ------------------------------ WEST HYRULE ------------------------------  
area = area_WA;








//   --------------------------  00  ---------------------------  
//    NORTH CASTLE
rm_num  = $00;
set_rm_data(area+hex_str(rm_num), STR_Overworld+STR_Standard, STR_Tile+RM_NPALACE_FILE_NAME, STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_NORTH_CASTLE);


row3=row0+$13; y3=row3<<3;
row4=row3-$02; y4=row4<<3;
row5=row3+$04; y5=row5<<3;
data_spawn_cutscene(Cutscene_GameEnd_1A,1, 0,0);
_dist=($04<<3)+4; // _dist: dist to center of the 2 torches
data_spawn(rm+STR_PRIO,TorchA,$1,  (x0-_dist)-4,y3,  dk_PI+hex_str(global.PI_BGR4),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  (x0+_dist)-4,y3,  dk_PI+hex_str(global.PI_BGR4),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,Zelda,$1,  (clm1-$02)<<3,y4-($01<<3)); // Zelda!!
data_spawn(rm+STR_PRIO,Zelda,$2,  (clm1+$02)<<3,y4);          // Zelda, 2nd Quest


clm4=clm1-1; clm5=clm4+3;
data_exit(EXM0,etB0,0,  clm4,row5,  CLMS2,ROWS2,  clm4,row5,  rm_num_+EXM0_); // MID 0, 
data_exit(EXM1,etB0,0,  clm5,row5,  CLMS2,ROWS2,  clm5,row5,  '3B'+EXM0_); // MID 1. Goes to end game cutscene
g.dm_rm[?"GameEnd1B_TO_EXIT_NAME"] = exit_name_m1;
//g.GameEnd1B_TO_EXIT_NAME = exit_name_m1;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '18'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '03'+EXL1_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmC5,$1,  (clm1-$03)<<3,y3,  STR_Qualified+STR_Quest+STR_Nums+"02"); // BOTTLE







//   --------------------------  01  ---------------------------  
//    Bridge near Saria  
rm_num  = $01;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'001', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_SARIA_RIVER);


row3=row0+$0E; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);  
data_spawn(rm+STR_PRIO,SpBaA,$1,  0,0); // BagoSpawner  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);






//   --------------------------  02  ---------------------------  
//    Bridge to Saria Bay
rm_num  = $02;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'001', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_SARIA_RIVER);


row3=row0+$0E; y3=row3<<3;
row4=row0+$13; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRIO,SpPoA,$1,  0,0); // BubbleSpawner  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $18<<3,y4); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $3C<<3,y4); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $5A<<3,y4); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $60<<3,y4); // Lowder  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  03  ---------------------------  
//    North Castle EAST entrance
rm_num  = $03;
set_rm_data(area+hex_str(rm_num), STR_Overworld+STR_Standard, STR_Color+COLOR3_, STR_Tile+area_WA+'003', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_NORTH_CASTLE);


row3=row0+$15; y3=row3<<3;
row4=row0-$01; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,Bot_A,$1,  $35<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $42<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$2,  $66<<3,y3); // Bot  2


row3  = row0-$16;
row4  = row0+$04;
row5  = row0+$16;
rows2 = row4-row3;
rows3 = row5-row4;
data_exit(EXL0,etA0,1,  CLM2,row3,  CLMS2,rows2,  CLM3,row0-$03,  '31'+EXR0_); // LFT 0, 
data_exit(EXL1,etA0,1,  CLM2,row4,  CLMS2,rows3,  CLM3,row0+$10,  RM_NAME_NPALACE+EXR0_); // LFT 1,   
data_exit(EXL2,etA0,1,  CLM2,row5,  CLMS2,$08,  CLM3,row5,  '42'+EXR0_); // LFT 2,   
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$14,  0); // RGT 0, to Overworld


//data_rando_scene01("_00"+"_01"+"_03"+"_00"+"_00",rm);







//   --------------------------  04  ---------------------------  
//    Death Mtn bridge west side  
rm_num  = $04;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'023', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_SARIA_BAY);


row3=row0+$0C; y3=row3<<3;
row4=row3+$02; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,MoblA,$2,  $20<<3,y3); // Moblin  2 
data_spawn(rm+STR_PRXM,MoblA,$3,  $48<<3,y3); // Moblin  3 
data_spawn(rm+STR_PRXM,LowdA,$1,  $4C<<3,y4); // Lowder  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$08,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '05'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  05  ---------------------------  
//    Death Mtn bridge east side  
rm_num  = $05;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'022', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_SARIA_BAY);


row3=row0+$0A; y3=row3<<3;
row4=row3+$02; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRIO,SpPoA,$1,  0,0); // BubbleSpawner  1 
data_spawn(rm+STR_PRXM,DairA,$2,  $38<<3,y4); // Daira  2 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row4,  '04'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  06  ---------------------------  
//    Poison bubble trap on path to HEART 1  
rm_num  = $06;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'006', STR_ow_axis+'01');


row3=row0+$0C; y3=row3<<3;
row4=row0+$1A; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRIO,SpPoA,$1,  0,0); // BubbleSpawner  1 
data_spawn(rm+STR_PRXM,BagiA,$1,  $0D<<3,y4,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $1D<<3,y4); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $39<<3,y4,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $41<<3,y4); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $51<<3,y4,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $71<<3,y4,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Bagin


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  07  ---------------------------  
//    Parapa desert cave  
rm_num  = $07;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'007', STR_ow_axis+'01', STR_show_ow_pos+'00');


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  (clms0-$09)<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,LowdA,$1,  $34<<3,y3); // Lowder  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  08  ---------------------------  
//    Cave short cut out of Palace 2 swamp to top of Bagu forest.
rm_num  = $08;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'008', STR_ow_axis+'01', STR_show_ow_pos+'00');


x3=$08<<3; x4=rm_w-x3;
row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row3+$02; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x4,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,OctoA,$1,  $0F<<3,y5); // Octorok  1
data_spawn(rm+STR_PRXM,OctoA,$1,  $2F<<3,y5); // Octorok  1
data_spawn(rm+STR_PRXM,OctoA,$1,  $4F<<3,y5); // Octorok  1
data_spawn(rm+STR_PRXM,OctoA,$1,  $6F<<3,y5); // Octorok  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_GLOVE);








//   --------------------------  09  ---------------------------  
//    JUMP cave 1  
rm_num  = $09;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'009', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_RUTO_MOUNTAINS);


row3=row0+$16; y3=row3<<3;
row4=row3-$02; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,(row3+$01)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  (clms0-$09)<<3,(row4+$01)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GoriA,$2,  $4C<<3,y3); // Goriya  2 
data_spawn(rm+STR_PRXM,OctoA,$1,  $1E<<3,y4); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $24<<3,y3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $2A<<3,y3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $34<<3,y3); // Octorok  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '0A'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  0A  ---------------------------  
//    JUMP cave 2
rm_num  = $0A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'009', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_RUTO_MOUNTAINS);


row3=row0+$16; y3=row3<<3;
row4=row3-$02; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,(row3+$01)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  (clms0-$09)<<3,(row4+$01)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GoriA,$2,  $56<<3,y3); // Goriya  2 
data_spawn(rm+STR_PRXM,LowdA,$1,  $12<<3,y3); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $2A<<3,y3); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $3E<<3,y3); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $5A<<3,y3); // Lowder  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '09'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '0B'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);










//   --------------------------  0B  ---------------------------  
//    JUMP cave 3  
rm_num  = $0B;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'011', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_RUTO_MOUNTAINS);


row3=row0+$16; y3=row3<<3;
row4=row0+$0A; y4=row4<<3;
row5=row0+$06; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($00+$09)<<3,(row3+$01)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  (clms0-$09)<<3,(row4+$01)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,AcheA,$1,  $12<<3,y5); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $1A<<3,y5); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$2,  $30<<3,y5); // Ache  2 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0A'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  0); // RGT 0, to Overworld 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_JUMP);








//   --------------------------  0C  ---------------------------  
//    PBag cave N of Midoro swamp
rm_num  = $0C;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'012', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_MIDORO_FIELD);


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $78<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,MegmA,$1,  $20<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $28<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,GoriA,$1,  $4C<<3,y3); // Goriya  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $5C<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $60<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $6C<<3,y3); // Megmat  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0D'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);







//   --------------------------  0D  ---------------------------  
//    PBag cave N of Midoro Swamp
rm_num  = $0D;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'238', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_MIDORO_FIELD);
//set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'098', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_MIDORO_FIELD);


x3=(clms0-$09)<<3;
row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,y4); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  x3,y4); // v1: Light w/ CANDLE or FIRE


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0C'+EXL0_); // RGT 0, 
//data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '46'+EXR0_); // LFT 0, 


data_spawn(rm+STR_PRIO,ItmF0,$7,  ((clm0-$0A)<<3)+2,row3<<3); // PBag v7: 400 (OG: 200)


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_00",rm);








//   --------------------------  0E  ---------------------------  
//    MEDICINE cave 1  
rm_num  = $0E;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'014', STR_ow_axis+'00', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_MORUGE_SWAMP);


row3=row0+$12; y3=row3<<3;
row4=row3+$04; y4=row4<<3;
row5=row3+$01; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $78<<3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpBaA,$1,  0,0); // BagoSpawner  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $2A<<3,y4); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $30<<3,y4); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $44<<3,y4); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $34<<3,y4); // Lowder  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0F'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  0F  ---------------------------  
//    MEDICINE cave 2  
rm_num  = $0F;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'035', STR_ow_axis+'00', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_MORUGE_SWAMP);


row3=row0+$12; y3=row3<<3;
row4=row0+$0A; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($00+$09)<<3,(row3+$01)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  (clms0-$09)<<3,(row4+$01)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,DairA,$2,  $16<<3,y3); // Daira  2 
data_spawn(rm+STR_PRXM,DairA,$2,  $3E<<3,y3); // Daira  2 
data_spawn(rm+STR_PRXM,DairA,$1,  $5D<<3,y3); // Daira  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0E'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '5A'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_JUMP);








//   --------------------------  10  ---------------------------  
//    Midoro Field Heart Container Cave 1
rm_num  = $10;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'007', STR_ow_axis+'00', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_MIDORO_FIELD);


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  (clms0-$09)<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GoriA,$3,  $50<<3,y3); // Goriya  3 
data_spawn(rm+STR_PRXM,LowdA,$1,  $40<<3,y3); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $54<<3,y3); // Lowder  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $1A<<3,y3); // Myu  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '11'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  11  ---------------------------  
//    Midoro Field Heart Container Cave 2
rm_num  = $11;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'239', STR_ow_axis+'00', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_MIDORO_FIELD);


row3=row0+$15; y3=row3<<3;
row3=row3+$01; y4=row4<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,y4); // v1: Light w/ CANDLE or FIRE


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '10'+EXR0_); // LFT 0,


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_HP,CONT_PIECE_OBJ_VER_HP,  ($27<<3)+5,(row3+$02)<<3,  STR_Treasure+STR_Map+"01"); // HEART PIECE


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);








//   --------------------------  12  ---------------------------  
//    Cave. Route to Palace 3. FAIRY spell requirement in OG
rm_num  = $12;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'248', STR_ow_axis+'00', STR_show_ow_pos+'00');


row3=row0+$0C; y3=row3<<3;
row4=row0+$0A; y4=row4<<3;
row5=row0+$16; y5=row5<<3;
_pi=global.PI_BGR1;
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,(row3+$01)<<3,  dk_PI+hex_str(_pi)); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $78<<3,(row4+$01)<<3,  dk_PI+hex_str(_pi)); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($2F<<3)+4,(row5+$01)<<3,  dk_PI+hex_str(_pi)); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,LowdA,$1,  $2C<<3,y5); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $36<<3,y5); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $3E<<3,y5); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $42<<3,y5); // Lowder  1 


data_exit(EXU0,etA0,0,  $2C,row_e0,  $08,ROWS5,  $2F,row_e4,  0); // UP  0, Pit up 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '13'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_01"+STR_Pit+"8",rm);








//   --------------------------  13  ---------------------------  
//    Cave. Route to Palace 3. FAIRY spell requirement (cucco). Cross large body of water with cucco and JUMP
rm_num  = $13;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'044', STR_View+'00', STR_ow_axis+'01', STR_show_ow_pos+'00');


row3=row0+$14; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
_pi=global.PI_BGR1;
data_spawn(rm+STR_PRIO,TorchA,$1,  $06<<3,y4,  dk_PI+hex_str(_pi)); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $78<<3,y4,  dk_PI+hex_str(_pi)); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bot_A,$1,  $11<<3,(row0+$12)<<3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $18<<3,(row0+$14)<<3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $6C<<3,(row0+$14)<<3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $74<<3,(row0+$16)<<3); // Bot  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '12'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '2A'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_JUMP+STR_FAIRY);








//   --------------------------  14  ---------------------------  
//    Fairy secret next to JUMP caves S exit  
rm_num  = $14;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_WA+'020', STR_ow_axis+'00', dk_SceneMusicThemeException+"01");


row3=row0+$17; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);
data_spawn(rm+STR_PRIO,ReFaA,$1,  x0,(row0+$11)<<3); // RestoreFairy  1 


clm3=clm1-$01;
data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  0); // MID 0, to Overworld
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  15  ---------------------------  
//    Bagu woods 1  
rm_num  = $15;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_WA+'021', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_SARIA_RIVER_WOODS);


row3=row0+$17; y3=row3<<3;
row4=row3-$04; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,MegmA,$1,  $12<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $1C<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $3C<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $42<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $50<<3,y3); // Megmat  1 


clm3=$30;
data_exit(EXM0,etB0,0,  clm3,row4,  CLMS2,ROWS2,  clm3+1,row4,  0); // MID 0, to Overworld
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  16  ---------------------------  
//    Bagu woods 2  
rm_num  = $16;  
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_WA+'021', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_SARIA_RIVER_WOODS);


row3=row0+$17; y3=row3<<3;
row4=row3-$04; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,MegmA,$1,  $12<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $1C<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $20<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $42<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $50<<3,y3); // Megmat  1 


clm3=$30;
data_exit(EXM0,etB0,0,  clm3,row4,  CLMS2,ROWS2,  clm3+1,row4,  0); // MID 0, to Overworld
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  17  ---------------------------  
//    Bagu woods 3  
rm_num  = $17;  
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_WA+'021', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_SARIA_RIVER_WOODS);


row3=row0+$17; y3=row3<<3;
row4=row3-$04; y4=row4<<3;
row5=row3-$02; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,MegmA,$1,  $12<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $1C<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $20<<3,y5); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $44<<3,y5); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $5E<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $60<<3,y5); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $64<<3,y5); // Megmat  1 


clm3=$30;
data_exit(EXM0,etB0,0,  clm3,row4,  CLMS2,ROWS2,  clm3+1,row4,  0); // MID 0, to Overworld
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  18  ---------------------------  
//    North Castle west entrance
rm_num  = $18;
set_rm_data(area+hex_str(rm_num), STR_Overworld+STR_Standard, STR_Color+COLOR3_, STR_Tile+area_WA+'024', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_NORTH_CASTLE);


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,OctoA,$1,  $1B<<3,(row0+$15)<<3); // Octorok  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$19,  '19'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$12,  '00'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  19  ---------------------------  
//    North Castle lake west - 1  
rm_num  = $19;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'025', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_NORTH_CASTLE_LAKE);


row3=row0+$19; y3=row3<<3;
row4=row0+$1B; y4=row4<<3;
row5=row0+$17; y5=row5<<3;
row6=row0+$13; y6=row6<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,OctoA,$1,  $1E<<3,y4); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $24<<3,y5); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $2A<<3,y6); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $34<<3,y6); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $54<<3,y4); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $6C<<3,y4); // Octorok  1 


data_exit(EXD0,etA1,1,  $00,row_e2,  clms0,ROWS5,  $2F,row_e3,  '48'+EXU0_); // DWN 0, Pit down 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '1A'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '18'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_01"+"_00"+STR_Pit+"4",rm);








//   --------------------------  1A  ---------------------------  
//    North Castle lake west - 2  
rm_num  = $1A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'005', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_NORTH_CASTLE_LAKE);


row3=row0+$16; y3=row3<<3;
row4=row0+$19; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0);  // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '19'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmF0,$1,  $12<<3,(row3+$02)<<3); // PBag v1 50


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  1B  ---------------------------  
//    Bagu woods 4  
rm_num  = $1B;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_WA+'021', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_SARIA_RIVER_WOODS);


row3=row0+$17; y3=row3<<3;
row4=row3-$04; y4=row4<<3;
row5=row3-$02; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,MegmA,$1,  $12<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $1C<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $3C<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $42<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $50<<3,y3); // Megmat  1 


clm3=$30;
data_exit(EXM0,etB0,0,  clm3,row4,  CLMS2,ROWS2,  clm3+1,row4,  0); // MID 0, to Overworld
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  1C  ---------------------------  
//    Bagu woods 5  
rm_num  = $1C;  
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_WA+'021', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_SARIA_RIVER_WOODS);


row3=row0+$17; y3=row3<<3;
row4=row3-$04; y4=row4<<3;
row5=row3-$02; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,MegmA,$1,  $12<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $1C<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $3C<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $42<<3,y3); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $50<<3,y3); // Megmat  1 


clm3=$30;
data_exit(EXM0,etB0,0,  clm3,row4,  CLMS2,ROWS2,  clm3+1,row4,  0); // MID 0, to Overworld
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  1D  ---------------------------  
//    Desert encounter 1         - ENCOUNTER -   
rm_num  = $1D;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR2_, STR_Tile+area_WA+'029', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");


row3=row0+$16; y3=row3<<3;
row4=row0+$10; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
// Weak   Encounter
data_spawn(rm+STR_PRIO,SpRoA,$1,  0,0); // RockSpawner  1 
// Strong Encounter
data_spawn(rm+STR_PRIO,SpRoA,$1,  0,0,  STR_Strong+STR_Encounter); // RockSpawner  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $0C<<3,y3,  STR_Strong+STR_Encounter); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $50<<3,y3,  STR_Strong+STR_Encounter); // Bot  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $10<<3,y4,  STR_Strong+STR_Encounter); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $22<<3,y4,  STR_Strong+STR_Encounter); // Geldarm  1  *MOD adding balance.
data_spawn(rm+STR_PRXM,GeldA,$1,  $38<<3,y4,  STR_Strong+STR_Encounter); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $4C<<3,y4,  STR_Strong+STR_Encounter); // Geldarm  1 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1+1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 








//   --------------------------  1E  ---------------------------  
//    Desert encounter 2         - ENCOUNTER -   
rm_num  = $1E;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR2_, STR_Tile+area_WA+'030', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);

// Weak Encounter
y3=(row0+$10)<<3;
y4=(row0+$0C)<<3;
data_spawn(rm+STR_PRIO,SpRoA,$1,  0,0); // RockSpawner  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $10<<3,y3); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $1C<<3,y3); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $26<<3,y3); // Geldarm  1  *MOD adding balance.
data_spawn(rm+STR_PRXM,GeldA,$1,  $38<<3,y4); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $42<<3,y3); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $53<<3,y3); // Geldarm  1 
// Strong Encounter
y3=(row0+$16)<<3;
y4=(row0+$14)<<3;
data_spawn(rm+STR_PRXM,LowdA,$1,  $0E<<3,y3,  STR_Strong+STR_Encounter); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $54<<3,y3,  STR_Strong+STR_Encounter); // Lowder  1 
data_spawn(rm+STR_PRXM,GoriA,$3,  $14<<3,y4,  STR_Strong+STR_Encounter); // Goriya  3 
data_spawn(rm+STR_PRXM,GoriA,$3,  $4C<<3,y4,  STR_Strong+STR_Encounter); // Goriya  3 


row3=row0+$14;
row4=row3-$02;
data_exit(EXM0,etB0,0,  clm1,row4,  CLMS2,ROWS2,  clm1+1,row4,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 







//   --------------------------  1F  ---------------------------  
//    Link doll secret. W of Mido cemetery  
rm_num  = $1F;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR2_, STR_Tile+area_WA+'031', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_ROYAL_CEMETERY, dk_SceneMusicThemeException+"01");


row3=row0+$16; y3=row3<<3;
row4=row3-$06; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,Bot_A,$1,  $0C<<3,(row3+$04)<<3); // Bot  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $1D<<3,y4);
data_spawn(rm+STR_PRXM,GeldA,$1,  $23<<3,y4);
data_spawn(rm+STR_PRXM,GeldA,$1,  $25<<3,y4);
data_spawn(rm+STR_PRXM,GeldA,$1,  $34<<3,y4);


clm3=$2D;
data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3-1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,ItmF0,$5,  ($14<<3)+2,row3<<3); // PBag v5: 250 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);









//   --------------------------  20  ---------------------------  
//    Fairy secret E of Saria (in sandy area)  
rm_num  = $20;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_WA+'032', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_SARIA_BAY, dk_SceneMusicThemeException+"01");


row3=row0+$17; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);


clm3=clm1-$01;
data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  0); // MID 0, to Overworld
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  (clm1+$12)<<3,(row3+$02)<<3,  STR_Treasure+STR_Map+"01"); // MAGIC PIECE


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  21  ---------------------------  
//    Cave. Tantari desert. TROPHY  
rm_num  = $21;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'071', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_TANTARI_DESERT);


row3=row0+$08; y3=row3<<3;
data_spawn_2a(STR_Challenge,Challenge_IntermittentPlatformSequence,$2,  0,0,  -1,  STR_HIDDEN+hex_str(TID_HIDE_1&$F)); // 
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,(row0+$15)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $78<<3,(row0+$0D)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,AcheA,$1,  $18<<3,y3); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $64<<3,y3); // Ache  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$14,  '36'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0C,  0); // RGT 0, to Overworld 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00"+object_get_name(Challenge_IntermittentPlatformSequence),rm);







//   --------------------------  22  ---------------------------  
//    Field encounter 1         - ENCOUNTER -   
rm_num  = $22;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR2_, STR_Tile+area_WA+'034', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");


row3=row0+$16; y3=row3<<3;
row4=row3+$02; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
// Weak Encounter
data_spawn(rm+STR_PRXM,Bot_A,$1,  $18<<3,y4); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$2,  $1C<<3,y4); // Bot  2 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $42<<3,y4); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$2,  $48<<3,y4); // Bot  2 
data_spawn(rm+STR_PRXM,Bot_A,$2,  $52<<3,y4); // Bot  2 
// Strong Encounter
data_spawn(rm+STR_PRIO,SpGrA,$1,  0,0,  STR_Strong+STR_Encounter); // GruntSpawner  1 
data_spawn(rm+STR_PRXM,Bot_A,$2,  $04<<3,y4,  STR_Strong+STR_Encounter); // Bot  2 
data_spawn(rm+STR_PRXM,Bot_A,$2,  $20<<3,y4,  STR_Strong+STR_Encounter); // Bot  2 
data_spawn(rm+STR_PRXM,Bot_A,$2,  $44<<3,y4,  STR_Strong+STR_Encounter); // Bot  2 


clm3=$30;
data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 








//   --------------------------  23  ---------------------------  
//    Field encounter 2         - ENCOUNTER -   
rm_num  = $23;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR2_, STR_Tile+area_WA+'034', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");


row3=row0+$16; y3=row3<<3;
row4=row3+$02; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
// Weak Encounter
data_spawn(rm+STR_PRXM,Bot_A,$1,  $1C<<3,y4); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $3C<<3,y4); // Bot  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $20<<3,y4); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $42<<3,y4); // Megmat  1 
// Strong Encounter
data_spawn(rm+STR_PRXM,MegmA,$1,  $0C<<3,y4,  STR_Strong+STR_Encounter); // Megmat  1 
data_spawn(rm+STR_PRXM,GoriA,$1,  $20<<3,y3,  STR_Strong+STR_Encounter); // Goriya  1 
data_spawn(rm+STR_PRXM,GoriA,$1,  $3E<<3,y3,  STR_Strong+STR_Encounter); // Goriya  1 


clm3=$30;
data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 








//   --------------------------  24  ---------------------------  
//    Kings Tomb(Outside) 
rm_num  = $24;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Color+COLOR2_, STR_Tile+area_WA+'036', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_ROYAL_CEMETERY, dk_SceneMusicThemeException+"01");


row3=row0+$17; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
_dist=($04<<3)+4; _pi=global.PI_BGR2; // _dist: dist between rm center and torch center
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRIO,TorchA,$3,  (x0-_dist)-4,y3,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  (x0+_dist)-4,y3,  dk_PI+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,NPC_C,$1,  x0-8,(row0+$15)<<3,  dk_PI+hex_str(_pi),STR_Dialogue+DK0C00); // Tomb dlg
data_spawn(rm+STR_PRIO,NPC_1,$1,  $2D<<3,y3,  dk_PI+hex_str(PId), STR_Palette+p.PAL_NPC_PUR1, STR_Dialogue+DK010C, STR_Sprite+STR_Barb); // Idle Simple, Old lady, Purple


data_exit(EXD0,etA1,1,  $00,row_e2,  clms0,ROWS5,  clm1-1,row_e3,  '60'+EXU0_); // DWN 0, Pit down 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld  
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld  








//   --------------------------  25  ---------------------------  
//    Bagu House, Outside 
rm_num  = $25;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_WA+'037', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_SARIA_RIVER_WOODS);


row3=row0+$17; y3=row3<<3;


clm3=clm1-$01;
data_exit(EXM0,etB0,1,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  area_TA+'5F'+EXR0_); // MID 0,  to inside Bagu house
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, 








//   --------------------------  26  ---------------------------  
//    OG HEART 1. Ruins S of Parapa desert  
rm_num  = $26;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'038', STR_ow_axis+'00');


row3=row0+$17; y3=row3<<3;
row4=row3-$06; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,GoriA,$1,  $48<<3,y3); // Goriya  1 


clm3=$30;
data_exit(EXM0,etB0,0,  clm3,row4,  CLMS2,ROWS2,  clm3+1,row4,  0); // MID 0, to Overworld
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_HP,CONT_PIECE_OBJ_VER_HP,  $40<<3,(row3+$02)<<3,  STR_Treasure+STR_Map+"01"); // HEART PIECE


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  27  ---------------------------  
//    Forest encounter 1         - ENCOUNTER -   
rm_num  = $27;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_WA+'039', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");


row3=row0+$17; y3=row3<<3;
row4=row0+$0B; y4=row4<<3;
// Weak Encounter
data_spawn(rm+STR_PRXM,DeelA,$1,  $08<<3,y4); // Deeler  1 
data_spawn(rm+STR_PRXM,DeelA,$1,  $26<<3,y4); // Deeler  1 
data_spawn(rm+STR_PRXM,DeelA,$1,  $4E<<3,y4); // Deeler  1 
data_spawn(rm+STR_PRIO,SpGrA,$1,  $00<<3,(row0+$00)<<3); // GruntSpawner  1 
// Strong Encounter
clm3=$08; x3=clm3<<3;
clm4=clms0-clm3; x4=clm4<<3;
data_spawn(rm+STR_PRXM,DeelA,$1,  x3,y4,  STR_Strong+STR_Encounter); // Deeler  1 
data_spawn(rm+STR_PRXM,DeelA,$1,  x4,y4,  STR_Strong+STR_Encounter); // Deeler  1 
data_spawn(rm+STR_PRXM,MoblA,$1,  $16<<3,y3,  STR_Strong+STR_Encounter); // Moblin  1 
data_spawn(rm+STR_PRXM,MoblA,$1,  $4C<<3,y3,  STR_Strong+STR_Encounter); // Moblin  1 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 








//   --------------------------  28  ---------------------------  
//    Forest encounter 2         - ENCOUNTER -   
rm_num  = $28;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_WA+'040', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");


row3=row0+$17; y3=row3<<3;
row4=row0+$0B; y4=row4<<3;
// Weak Encounter
data_spawn(rm+STR_PRXM,MoblA,$2,  $0E<<3,y3); // Moblin  2 
data_spawn(rm+STR_PRXM,MoblA,$2,  $52<<3,y3); // Moblin  2 
data_spawn(rm+STR_PRXM,DeelA,$2,  $16<<3,y4); // Deeler  2 
data_spawn(rm+STR_PRXM,DeelA,$2,  $4E<<3,y4); // Deeler  2 
data_spawn(rm+STR_PRXM,DeelA,$1,  $3A<<3,y4); // Deeler  1 
// Strong Encounter
data_spawn(rm+STR_PRIO,SpMoA,$1,  0,0,  STR_Strong+STR_Encounter); // MobySpawner  1 
data_spawn(rm+STR_PRXM,MoblA,$3,  $0A<<3,y3,  STR_Strong+STR_Encounter); // Moblin  3 
data_spawn(rm+STR_PRXM,MoblA,$3,  $52<<3,y3,  STR_Strong+STR_Encounter); // Moblin  3 
data_spawn(rm+STR_PRXM,DeelA,$2,  $0E<<3,y4,  STR_Strong+STR_Encounter); // Deeler  2 
data_spawn(rm+STR_PRXM,DeelA,$2,  $4A<<3,y4,  STR_Strong+STR_Encounter); // Deeler  2 


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 








//   --------------------------  29  ---------------------------  
//    Secret in field tile right above North Castle Lake
rm_num  = $29;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR2_, STR_Tile+area_WA+'041', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_NORTH_CASTLE_FIELD, dk_SceneMusicThemeException+"01");


row3=row0+$17; y3=row3<<3;
_dist=rm_w>>2;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,MoblA,$2,  x0-_dist-8,y3); // Moblin  2 
data_spawn(rm+STR_PRXM,MoblA,$2,  x0-8,y3); // Moblin  2 
data_spawn(rm+STR_PRXM,MoblA,$2,  x0+_dist-8,y3); // Moblin  2 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_HP,CONT_PIECE_OBJ_VER_HP,  (clm1-1)<<3,(row3-$02)<<3,  STR_Treasure+STR_Map+"01"); // HEART PIECE
data_spawn(rm+STR_PRIO,ItmF0,$2,  $16<<3,(row0+$00)<<3); // PBag v2: 100


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  2A  ---------------------------  
//    Cave. Route to Palace 3
rm_num  = $2A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'007', STR_ow_axis+'00', STR_show_ow_pos+'00');


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  (clms0-$09)<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GoriA,$3,  $30<<3,y3); // Goriya  3 
data_spawn(rm+STR_PRXM,LowdA,$1,  $34<<3,(row3+$02)<<3); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $20<<3,y3); // Lowder  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $1A<<3,(row3+$02)<<3); // Myu  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '13'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  2B  ---------------------------  
//    pBag Forest tile secret S of Tantari desert  
rm_num  = $2B;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_WA+'043', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_NORTH_CASTLE_FIELD, dk_SceneMusicThemeException+"01");


row3=row0+$17; y3=row3<<3;
row4=row0+$07; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);
data_spawn(rm+STR_PRXM,AcheA,$1,  $38<<3,y4); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $3C<<3,y4); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $44<<3,y4); // Ache  1 


clm3=$30;
data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,ItmF0,$1,  $4C<<3,y3); // PBag v1: 50


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  2C  ---------------------------  
//    MAGIC Container piece in Tantari Desert
rm_num  = $2C;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'240', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_TANTARI_DESERT, dk_SceneMusicThemeException+"01");


row3=row0+$16; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRIO,SpRoA,$1,  0,0); // RockSpawner  1 


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clms0-$08,row3,  0); // RGT 0, to   Overworld 


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  $11<<3,(row3+$02)<<3,  STR_Treasure+STR_Map+"01"); // MAGIC PIECE


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_00",rm);








//   --------------------------  2D  ---------------------------  
//    MAGIC 1. Cave S of North Castle with Magic Container 1  
rm_num  = $2D;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'045', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_NORTH_CASTLE_FIELD);


row3=row0+$12; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row3+$02; y5=row5<<3;
row6=row3+$04; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,LowdA,$1,  $2C<<3,y5); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $34<<3,y5); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $3C<<3,y5); // Lowder  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $5C<<3,y6); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $62<<3,y6); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $68<<3,y6); // Octorok  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  $76<<3,(row0+$0E)<<3,  STR_Treasure+STR_Map+"01"); // MAGIC PIECE


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);








//   --------------------------  2E  ---------------------------  
//   pBag secret E of Saria (in field area)  
rm_num  = $2E;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_WA+'043', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_SARIA_FIELD, dk_SceneMusicThemeException+"01");


row3=row0+$17; y3=row3<<3;
row4=row3-$02; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);
data_spawn(rm+STR_PRXM,MegmA,$1,  $10<<3,y4); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $14<<3,y4); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $1C<<3,y4); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $40<<3,y4); // Megmat  1 
//data_spawn(rm+STR_PRXM,MegmA,$1,  $4C<<3,y4); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $5E<<3,y4); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $66<<3,y4); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $74<<3,y4); // Megmat  1 


clm3=$30;
data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,ItmF0,$2,  $4C<<3,y3); // PBag v2: 100


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  2F  ---------------------------  
//    Island N of Tantari Desert
rm_num  = $2F;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_WA+'043', STR_ow_axis+'01', dk_SceneMusicThemeException+"01");


row3=row0+$17; y3=row3<<3;
row4=row0+$07; y4=row4<<3;
row5=row3-$02; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);
data_spawn(rm+STR_PRXM,AcheA,$2,  $38<<3,y4); // Ache  2 
data_spawn(rm+STR_PRXM,AcheA,$1,  $3C<<3,y4); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$2,  $44<<3,y4); // Ache  2 
data_spawn(rm+STR_PRXM,MegmA,$1,  $10<<3,y5); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $1C<<3,y5); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $4C<<3,y5); // Megmat  1 
data_spawn(rm+STR_PRXM,MegmA,$1,  $5E<<3,y5); // Megmat  1 


clm3=$30;
data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,ItmF0,$5,  $4C<<3,y3); // PBag v5: 250


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  30  ---------------------------  
//    Swamp encounter 1         - ENCOUNTER -   
rm_num  = $30;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR2_, STR_Tile+area_WA+'048', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");


row3=row0+$18; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
// Weak Encounter
data_spawn(rm+STR_PRXM,OctoA,$2,  $08<<3,y3); // Octorok  2 
data_spawn(rm+STR_PRXM,OctoA,$1,  $0E<<3,y3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $1E<<3,y3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $46<<3,y3); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $56<<3,y3); // Octorok  1 
// Strong Encounter
data_spawn(rm+STR_PRIO,SpMoA,$1,  0,0,  STR_Strong+STR_Encounter); // MobySpawner  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $10<<3,y3,  STR_Strong+STR_Encounter); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $22<<3,y3,  STR_Strong+STR_Encounter); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $26<<3,y3,  STR_Strong+STR_Encounter); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$2,  $4E<<3,y3,  STR_Strong+STR_Encounter); // Octorok  2 
data_spawn(rm+STR_PRXM,OctoA,$1,  $5A<<3,y3,  STR_Strong+STR_Encounter); // Octorok  1 


clm3=$30;
data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 








//   --------------------------  31  ---------------------------  
//    Above North Castle East entrance
rm_num  = $31;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'072', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_NORTH_CASTLE);


row3=row0+$06; y3=row3<<3;
row4=row0+$12; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);


clm3=$0E;
data_exit(EXM0,etB0,1,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  '32'+EXL0_); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '3C'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '03'+EXL0_); // RGT 0, 








//   --------------------------  32  ---------------------------  
//    Kakusu room above North Castle East entrance
rm_num  = $32;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR2_, STR_Tile+area_WA+'073', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_NORTH_CASTLE);


row3=row0+$16; y3=row3<<3;
row4=row0+$01; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
_pi=global.PI_BGR4;
//data_spawn(rm+STR_PRIO,TorchA,$1,  ($0D<<3)+4,y3,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  ($29<<3)+4,y3,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '31'+EXM0_); // LFT 0, 


data_spawn(rm+STR_PRIO,Kakusu006,$1,  $30<<3,(row0+$14)<<3,  STR_Treasure+STR_Map+"01"); // Hiding in IronKnuckle statue. Invisible & Still until damaged.


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);








//   --------------------------  33  ---------------------------  
//    Link doll extra life in Moruge Swamp
rm_num  = $33;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR2_, STR_Tile+area_WA+'051', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MORUGE_SWAMP, dk_SceneMusicThemeException+"01");


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);


clm3=$1F;
data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+$01,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_HP,CONT_PIECE_OBJ_VER_HP,  ($2E<<3)-2,y3,  STR_Treasure+STR_Map+"01"); // HEART PIECE
//data_spawn(rm+STR_PRIO,ItmF0,$2,  x3-($10<<3),y3); // PBag v2: 100


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  34  ---------------------------  
//    Secret tile in East Midoro Swamp
rm_num  = $34;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR2_, STR_Tile+area_WA+'004', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MIDORO_SWAMP, dk_SceneMusicThemeException+"01");


row3=row0+$18; y3=row3<<3;
row4=row0+$0A; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRIO,SpDrA,$1,  $0E<<3,y4,  STR_Type+hex_str(2)); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $1A<<3,y4,  STR_Type+hex_str(2)); // DropSpawner  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  $14<<3,(row0+$16)<<3,  STR_Treasure+STR_Map+"01"); // MAGIC PIECE


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  35  ---------------------------  
//    Cemetery encounter 1         - ENCOUNTER -   
rm_num  = $35;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR4_, STR_Tile+area_WA+'053', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");


row3=row0+$10; y3=row3<<3;
row4=row3+$02; y4=row4<<3;
row5=row0+$14; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
// Weak Encounter
data_spawn(rm+STR_PRXM,Moa_A,$1,  $04<<3,(row0+$16)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $10<<3,(row0+$10)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $1C<<3,(row0+$16)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $20<<3,(row0+$14)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $3A<<3,(row0+$0C)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $3E<<3,(row0+$14)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $52<<3,(row0+$10)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $5C<<3,(row0+$12)<<3); // Moa  1 
// Strong Encounter
data_spawn(rm+STR_PRXM,DairA,$2,  $12<<3,y4,  STR_Strong+STR_Encounter); // Daira  2 
data_spawn(rm+STR_PRXM,DairA,$2,  $4A<<3,y4,  STR_Strong+STR_Encounter); // Daira  2 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $0A<<3,(row0+$0E)<<3,  STR_Strong+STR_Encounter); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $1A<<3,(row0+$14)<<3,  STR_Strong+STR_Encounter); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $3E<<3,(row0+$12)<<3,  STR_Strong+STR_Encounter); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $54<<3,(row0+$0E)<<3,  STR_Strong+STR_Encounter); // Moa  1 


clm3=$30;
data_exit(EXM0,etB0,0,  clm3,row5,  CLMS2,ROWS2,  clm3+1,row5,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 








//   --------------------------  36  ---------------------------  
//    TROPHY cave 2
rm_num  = $36;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'238', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_TANTARI_DESERT);


x3=(clms0-$09)<<3;
row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GoriA,$2,  $24<<3,y3); // Goriya  2 


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '21'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmC0,$1,  ($13<<3)+5,(row3+$02)<<3); // TROPHY


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_00",rm);








//   --------------------------  37  ---------------------------  
//    MIRROR item
rm_num  = $37;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR4_, STR_Tile+area_WA+'010', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_SARIA_CEMETERY);


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRIO,NPC_0,$1,  $47<<3,(row0+$10)<<3,  STR_Dialogue+DK000E); // Headstone with Dragon Quest reference
data_spawn(rm+STR_PRXM,Bot_A,$1,  $18<<3,(row0+$16)<<3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $38<<3,(row0+$14)<<3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $5A<<3,(row0+$14)<<3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $6E<<3,(row0+$16)<<3); // Bot  1 
clm3=$16;
data_spawn(rm+STR_PRXM,GoriA,$2,  clm3<<3,y3); // Goriya  2
data_spawn(rm+STR_PRXM,GoriA,$2,  (clms0-clm3-$02)<<3,y3); // Goriya  2


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_spawn(rm+STR_PRIO,ItmC2,$1,  $43<<3,(row0+$12)<<3); // MIRROR 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  38  ---------------------------  
//    Royal Cemetery container piece
rm_num  = $38;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR4_, STR_Tile+area_WA+'056', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_ROYAL_CEMETERY, dk_SceneMusicThemeException+"01");


row3=row0+$16; y3=row3<<3;
row4=row0+$09; y4=row4<<3;
row5=row3-$02; y5=row5<<3;
row6=row3-$04; y6=row6<<3;
row7=row3-$06; y7=row7<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,Moa_B,$1,  $30<<3,y4,  STR_Reset+'_y'+hex_str(y4)); // FieryMoa  1
data_spawn(rm+STR_PRXM,Moa_B,$1,  $4C<<3,y4,  STR_Reset+'_y'+hex_str(y4+$10)); // FieryMoa  1
if (true)
//if (DEV&&1)
{
    clm3=$40; x3=clm3<<3; // Headstone xl
    _dk = data_spawn(rm+STR_PRIO,NPC_0,$1,  x3,y6,  STR_Dialogue+DK0012); // Headstone dialogue
    data_spawn_2a(STR_Challenge,Challenge_Secret01,$1,  x3,y6, -1, STR_NPC+STR_Spawn+STR_Datakey+_dk); // x and y arguments are headstone xl/yt, and yt of ghost
    //data_spawn_2a(STR_Challenge,Challenge_Secret01,$1,  x3-($0C<<3),y6, -1, 'headstone_xc='+hex_str(x3));
    //data_spawn_2a(STR_Challenge,Challenge_Secret01,$1,  x3-($0C<<3),y6, -1, 'headstone_xc='+hex_str(x3), 'headstone_yb='+hex_str((row0+$14)<<3));
    clm4=$22; x4=clm4<<3;
    clm5=$5C; x5=clm5<<3;
    y8=y5;
    y9=y8;
}
else
{
    clm4=$28; x4=clm4<<3;
    clm5=$42; x5=clm5<<3;
    y8=y6;
    y9=y7;
}

data_spawn(rm+STR_PRXM,GoriA,$3,  x4,y8); // Goriya  3
data_spawn(rm+STR_PRXM,GoriA,$3,  x5,y9); // Goriya  3


clm6=$14;
data_exit(EXM0,etB0,0,  clm6,row5,  CLMS2,ROWS2,  clm6+$01,row5,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_HP,CONT_PIECE_OBJ_VER_HP,  $3B<<3,y6,  STR_Treasure+STR_Map+"01"); // HEART PIECE


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  39  ---------------------------  
//    Path encounter 1         - ENCOUNTER -   
rm_num  = $39;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR2_, STR_Tile+area_WA+'057', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_B1), dk_SceneMusicThemeException+"01");


row3=row0+$16; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);


clm3=clm0-1;
data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+$01,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 








//   --------------------------  3A  ---------------------------  
//    Red bottle secret on path tile in Palace 2 E swamp  
rm_num  = $3A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR2_, STR_Tile+area_WA+'058', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MIDORO_SWAMP, dk_SceneMusicThemeException+"01");


row3=row0+$16; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,ItmE0,$1,  ($1A<<3)+3,y3); // Magic Jar (Full)


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00"+STR_JAR,rm);








//   --------------------------  3B  ---------------------------  
//    End Game Credits
rm_num  = $3B;
set_rm_data(area+hex_str(rm_num), dk_WakeZelda, STR_Tile+area_WA+'059', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_NORTH_CASTLE);
//set_rm_data(area+hex_str(rm_num), dk_WakeZelda, STR_Tile+area_WA+'059', STR_ow_axis+'00', STR_OWRC+hex_str(val(g.dm_rm[?rm+STR_OWRC])), MapAreaName_DATAKEY+_MapAreaName_NORTH_CASTLE);
g.dm_rm[?"GameEnd1B_RM_NAME"] = rm_name;
//g.GameEnd1B_RM_NAME = rm_name;


data_spawn_cutscene(Cutscene_GameEnd_1B,1,  0,0);
row3=row0+$13; y3=row3<<3;
row4=row3+$04; y4=row4<<3;
row5=row4+$02; y5=row5<<3;
_pi=global.PI_BGR4;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($2D<<3)+4,y4,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($33<<3)+0,y5,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4C<<3)+0,y5,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($51<<3)+4,y4,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE

y6=y4-1; // -1 to offset the +1 DRAW_YOFF to make sprite flush w/ ground
data_spawn(rm+STR_PRIO,Zelda,$1,  x0+8,y6,  STR_Dialogue+DK0Z00); // Zelda!!


clm3=(x0-PC_W_)>>3;
_exit=EXIT_NAME_GAME_START;
data_exit(EXM0,etB0,0,  clm3-1,row4,  CLMS2,ROWS2,  clm3,row4,  _exit); // MID 0, 

// This is just to help things go smoother in case data gets changed later.
//global.OVERWORLD.dm[?g.GameEnd1B_TO_EXIT_NAME+STR_goto_reen] = exit_name_m0;
g.dm_rm[?string(val(g.dm_rm[?"GameEnd1B_TO_EXIT_NAME"]))+STR_goto_reen] = exit_name_m0;
//g.dm_rm[?g.GameEnd1B_TO_EXIT_NAME+STR_goto_reen]   = exit_name_m0;
//g.dm_rm[?g.GameEnd1B_TO_EXIT_NAME+STR_GoTo+STR_Rm] = rm_name;

_val=string_copy(_exit, string_length(_exit)-3, 2); // rm num
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  _val+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  _val+EXL0_); // RGT 0, 








//   --------------------------  3C  ---------------------------  
//    Upper North Castle Hallway
rm_num  = $3C;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'01', STR_Tile+area_WA+'047', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_NORTH_CASTLE);
//set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'01', STR_Tile+area_WA+'047', STR_ow_axis+'00', STR_OWRC+hex_str(val(g.dm_rm[?rm+STR_OWRC])), MapAreaName_DATAKEY+_MapAreaName_NORTH_CASTLE);


row3=row0+$07; y3=row3<<3;
row4=row0+$17; y4=row4<<3;
row5=row3+$01; y5=row5<<3;
row6=row5+$08; y6=row6<<3;
row7=row4+$01; y7=row7<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($13<<3)+4,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($2F<<3)+4,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4F<<3)+4,y7,  STR_Lit); // v1: Light w/ CANDLE or FIRE


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '42'+EXM0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '31'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmF0,$4,  $39<<3,(row6-$01)<<3); // PBag 4: 200


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  3D  ---------------------------  
//    Cave under North Castle Lake
rm_num  = $3D;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'050', STR_ow_axis+'00', STR_show_ow_pos+'00');


row3=row0+$16; y3=row3<<3;
row4=row0+$12; y4=row4<<3;
row5=row0+$0B; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0C<<3,(row0+$15)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $36<<3,(row3+$01)<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,MegmA,$1,  $10<<3,y4); // Megmat  1
data_spawn(rm+STR_PRXM,MegmA,$1,  $20<<3,y5); // Megmat  1
data_spawn(rm+STR_PRXM,MegmA,$1,  $30<<3,y4); // Megmat  1


clm3=$10; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '3E'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row0+$12);                                               // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '48'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_01",rm);








//   --------------------------  3E  ---------------------------  
//    Caves under North Castle Lake
rm_num  = $3E;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'054', STR_ow_axis+'00', STR_show_ow_pos+'00');


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  $13<<3,y4); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Bot_A,$1,  $32<<3,y3); // Bot  1 


clm3=$20; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '3D'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,row0+$13);                                        // Elevator DW $40, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_00"+"_01"+"_00",rm);








//   --------------------------  3F  ---------------------------  
//    MAGIC Container piece in N Parapa Desert
rm_num  = $3F;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'093', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_PARAPA_DESERT);


row3=row0+$10; y3=row3<<3;
row4=row0+$19; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRIO,SpRoA,$1,  0,0); // RockSpawner  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $2D<<3,y4); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $41<<3,y4); // Bot  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3+$04,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  ($4B<<3)-5,(row0+$16)<<3,  STR_Treasure+STR_Map+"01"); // MAGIC PIECE


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  40  ---------------------------  
//    Fast Travel to Northern Islands (Outside house)
rm_num  = $40;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'046', STR_ow_axis+'01');
//set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'099', STR_ow_axis+'01');


row3=row0+$16; y3=row3<<3;
row4=row3+$02; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,Bot_A,$1,  $0F<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$2,  $2C<<3,y4); // Bot  2


clm3=clm0-1;
_exit=data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  area_WA+'41'+EXR0_); // MID 0, 
g.dm_rm[?_exit+"_Draw"+STR_Open+STR_Exit] = true; // This is to track if the door to the house has been opened
g.dm_rm[?dk_FastTravel+"03"+STR_Exit+STR_Name] = _exit;
//g.ExitName_FAST_TRAVEL3 = _exit; // This is to track if the door to the house has been opened
      data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '5C'+EXR0_); // LFT 0, (Rando Only) to shortcut between south Parapa and here
      data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0,  to Overworld
//







//   --------------------------  41  ---------------------------  
//    Fast Travel to Northern Islands (Inside house)
rm_num  = $41;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_TA+'101', STR_ow_axis+'01');


row3=row0+$17; y3=row3<<3;


clm3=$0E;
data_exit(EXM0,etB3,1,  clm3,row3,  $03,ROWS2,  clm3-1,row3,  area_EA+'0F'+EXM0_); // MID 0, to Northern Isls
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '40'+EXM0_); // RGT 0, 








//   --------------------------  42  ---------------------------  
//    Platforming challenge at North Castle
rm_num  = $42;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_WA+'076', STR_View+'02', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_NORTH_CASTLE);


row3=row0+$17; y3=row3<<3;
row4=$0B; y4=row4<<3;


clm3=$0C;
data_exit(EXM0,etB0,1,  clm3,row4,  CLMS2,ROWS2,  clm3+1,row4,  '3C'+EXL0_); // MID 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '03'+EXL2_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmF0,$6,  $1B<<3,$0D<<3); // PBag 6: 300








//   --------------------------  43  ---------------------------  
//    Parapa Desert trap rm right before Parapa Palace
rm_num  = $43;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR2_, STR_Tile+area_WA+'078', STR_ow_axis+'03', MapAreaName_DATAKEY+_MapAreaName_PARAPA_DESERT);


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRIO,SpRoA,$1,  0,0); // RockSpawner  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $0F<<3,y3); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $1D<<3,y3); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $2F<<3,y3); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $3E<<3,y3); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $60<<3,y3); // Geldarm  1 
data_spawn(rm+STR_PRXM,GoriA,$1,  $4E<<3,y3,  STR_Qualified+STR_Quest+STR_Nums+"02"); // Goriya  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3+$02,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA-$02,row3,  0); // RGT 0, to Overworld 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  44  ---------------------------  
//    Sea Cave N end of Ruto Mtns
rm_num  = $44;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_EA+'255', STR_ow_axis+'00', STR_show_ow_pos+'00');


row3=row0+$18; y3=row3<<3;
row4=row0+$16; y4=row4<<3;
data_spawn(rm+STR_PRXM,OctoA,$1,  $13<<3,y4); // Octorok  1
data_spawn(rm+STR_PRXM,OctoA,$1,  $17<<3,y4); // Octorok  1
data_spawn(rm+STR_PRXM,OctoA,$1,  $1D<<3,y4); // Octorok  1


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,ItmF0,$6,  ($0A<<3)-1,y4); // PBag v6: 300


data_rando_scene01("_00"+"_01"+"_00"+"_00"+"_00",rm);








//   --------------------------  45  ---------------------------  
//    Island between Death Mtn and Royal Cemetery
rm_num  = $45;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_DM+'041', STR_ow_axis+'01');


row3=row0+$16; y3=row3<<3;
row4=row0+$10; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,GeldA,$1,  $09<<3,y4);
data_spawn(rm+STR_PRXM,GeldA,$1,  $0E<<3,y4);
data_spawn(rm+STR_PRXM,GeldA,$1,  $13<<3,y4);
data_spawn(rm+STR_PRXM,GeldA,$1,  $19<<3,y4);
data_spawn(rm+STR_PRXM,GeldA,$1,  $1E<<3,y4);
data_spawn(rm+STR_PRXM,GeldA,$1,  $25<<3,y4);
data_spawn(rm+STR_PRXM,GeldA,$1,  $29<<3,y4);
data_spawn(rm+STR_PRXM,GeldA,$1,  $39<<3,y4);


clm3=$2E;
data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3-$01,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,ItmF0,$8,  ($06<<3)+4,y3); // PBag v8: 500 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  46  ---------------------------  
//   Beach encounter         - ENCOUNTER -   
rm_num  = $46;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_EA+'005', STR_ow_axis+'00', STR_Encounter+hex_str(ENC_A1), dk_SceneMusicThemeException+"01");


row3=row0+$14; y3=row3<<3;
row4=row3+$02; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);

data_spawn(rm+STR_PRXM,GeldA,$1,  $14<<3,y4); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $42<<3,y4); // Geldarm  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $06<<3,y4); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $1C<<3,y4); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $22<<3,y4); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $3A<<3,y4); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $4C<<3,y4); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $56<<3,y4); // Octorok  1 

data_spawn(rm+STR_PRIO,SpMoA,$1,  0,0,  STR_Strong+STR_Encounter); // MobySpawner  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $14<<3,y4,STR_Strong+STR_Encounter); // Geldarm  1 
data_spawn(rm+STR_PRXM,GeldA,$1,  $42<<3,y4,STR_Strong+STR_Encounter); // Geldarm  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $0C<<3,y4,STR_Strong+STR_Encounter); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $1C<<3,y4,STR_Strong+STR_Encounter); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $3C<<3,y4,STR_Strong+STR_Encounter); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $46<<3,y4,STR_Strong+STR_Encounter); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $54<<3,y4,STR_Strong+STR_Encounter); // Octorok  1


data_exit(EXM0,etB0,0,  clm1,row3,  CLMS2,ROWS2,  clm1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 








//   --------------------------  47  ---------------------------  
//    Secret tile Midoro Swamp near P2
rm_num  = $47;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR2_, STR_Tile+area_WA+'088', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MIDORO_SWAMP, dk_SceneMusicThemeException+"01");


row3=row0+$18; y3=row3<<3;
row4=row0+$0A; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRIO,SpDrA,$1,  $1A<<3,y4,  STR_Type+hex_str(2)); // DropSpawner  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,ItmF0,$1,  $16<<3,(row0+$16)<<3); // PBag 1: 50


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);









//   --------------------------  48  ---------------------------  
//    Cave ruins under North Castle Lake
rm_num  = $48;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'074', STR_ow_axis+'00', STR_show_ow_pos+'00');


row3=row0+$0E; y3=row3<<3;
row4=row0+$11; y4=row4<<3;
row5=row0+$0E; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,(row3+$01)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($2A<<3)+4,(row0+$15)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $56<<3,(row4+$01)<<3); // v1: Light w/ CANDLE or FIRE
_val1=hex_str($4); // 
data_spawn(rm,SpTrA,$1,  $32<<3,y5,  STR_Direction+_val1); // SpikeTrapA $1
data_spawn(rm,SpTrA,$1,  $49<<3,y5,  STR_Direction+_val1); // SpikeTrapA $1
data_spawn(rm+STR_PRXM,Myu_A,$1,  $0E<<3,(row0+$12)<<3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $22<<3,(row0+$16)<<3); // Myu  1 


clm3=$27; clms3=$08; clm4=clm3+(clms3>>1)-1;
data_exit(EXU0,etA0,0,  clm3,row_e0,  clms3,ROWS5,  clm4,row_e4,  '19'+EXD0_); // UP  0, Pit up 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '3D'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '49'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmF0,$4,  $4F<<3,(row0+$09)<<3); // PBag 4: 200


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_01"+STR_Pit+"8",rm, STR_JUMP);








//   --------------------------  49  ---------------------------  
//    Cave ruins under North Castle Lake. Kakusu Tomb
rm_num  = $49;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'019', STR_ow_axis+'00', STR_show_ow_pos+'00');


row3=row0+$17; y3=row3<<3;
row4=row0+$14; y4=row4<<3;
row5=row4+$01; y5=row5<<3;
_pi=global.PI_BGR2;
data_spawn_cutscene(Cutscene_MoaiOpenMouth_1,1,  1,0);
data_spawn(rm+STR_PRIO,TorchA,$1,  ($28<<3)-4,y5,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($67<<3)-4,y5,  dk_PI+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE



clm3=$46;
data_exit(EXM0,etB2,0,  clm3,row3,  $03,$04,  clm3-1,row3,  area_EA+'42'+EXM0_); // MID 0, to Southern continent
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row4,  '48'+EXR0_); // LFT 0, 


data_spawn(rm+STR_PRIO,ItmE0,$1,  $76<<3,(row0+$17)<<3); // Magic Jar (Full)








//   --------------------------  4A  ---------------------------  
//    West Saria River(South Branch), Saria entrance
rm_num  = $4A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'062', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_SARIA_RIVER);


row3=row0+$18; y3=row3<<3;
row4=row0+$13; y4=row4<<3;
row5=row0+$1A; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,Boggnipp,$1,  $1F<<3,y5); // Boggnipp
data_spawn(rm+STR_PRXM,Boggnipp,$1,  $2F<<3,y5); // Boggnipp
data_spawn(rm+STR_PRXM,OctoA,$2,  $14<<3,y5); // Octorok  2
data_spawn(rm+STR_PRXM,OctoA,$2,  $20<<3,y5); // Octorok  2
data_spawn(rm+STR_PRXM,OctoA,$2,  $3C<<3,y5); // Octorok  2
data_spawn(rm+STR_PRXM,OctoA,$2,  $50<<3,y5); // Octorok  2
//data_spawn(rm+STR_PRXM,Bot_A,$1,  $67<<3,(row0+$16)<<3); // Bot  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '4C'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  area_TA+'44'+EXL0_); // RGT 0, To Saria


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
/*
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'094', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_SARIA_RIVER);


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,Bot_A,$1,  $0E<<3,y4); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $19<<3,y3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$2,  $28<<3,y3); // Bot  2 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$18,  '4B'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$13,  area_TA+'44'+EXL0_); // RGT 0, To Saria
*/








//   --------------------------  4B  ---------------------------  
//    
rm_num  = $4B;








//   --------------------------  4C  ---------------------------  
//    West Saria River(South Branch), Waterfall 2
rm_num  = $4C;  
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'082', STR_View+'02', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_SARIA_RIVER);


row3=row0+$18; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 2,Cloud_1_init);
data_spawn(rm+STR_PRXM,OctoA,$1,  $11<<3,$16<<3); // Octorok  1
data_spawn(rm+STR_PRXM,OctoA,$1,  $14<<3,$24<<3); // Octorok  1
data_spawn(rm+STR_PRXM,OctoA,$1,  $36<<3,$26<<3); // Octorok  1
data_spawn(rm+STR_PRXM,OctoA,$1,  $18<<3,$4E<<3); // Octorok  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,$30,  '4D'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '4A'+EXL0_); // RGT 0, 


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_JUMP);








//   --------------------------  4D  ---------------------------  
//    West Saria River(South Branch), Waterfall 3
rm_num  = $4D;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'087', STR_View+'02', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_SARIA_RIVER);


row3=$30; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 2,Cloud_1_init);
data_spawn(rm+STR_PRIO,SpPoA,$1,  0,0); // BubbleSpawner  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $12<<3,y3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$2,  $20<<3,y3); // Bot  2 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $2C<<3,y3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$2,  $32<<3,y3); // Bot  2 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,$06,  0); // LFT 0, to Overworld
//data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,$06,  '4E'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,$2E,  '4C'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmF0,$6,  ($35<<3)+4,$0A<<3); // PBag v6: 300


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm, STR_JUMP);









//   --------------------------  4E  ---------------------------  
//    West Saria River(South Branch), Mtn exit
rm_num  = $4E;
/*
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'049', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_SARIA_RIVER);


row3=row0+$18; y3=row3<<3;
row4=row0+$13; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,OctoA,$1,  $19<<3,(row0+$16)<<3); // Octorok  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row4,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '4D'+EXL0_); // RGT 0, 
*/








//   --------------------------  4F  ---------------------------  
//    West Saria River(North Branch), Mtn exit
rm_num  = $4F;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'063', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_SARIA_RIVER, dk_SceneMusicThemeException+"01");


row3=row0+$13; y3=row3<<3;
row4=row0+$18; y4=row4<<3;
row5=row0+$1A; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,Boggnipp,$1,  $3F<<3,y5); // Boggnipp
data_spawn(rm+STR_PRXM,Boggnipp,$1,  $6F<<3,y5); // Boggnipp
data_spawn(rm+STR_PRXM,OctoA,$2,  $18<<3,(row0+$17)<<3); // Octorok  2
data_spawn(rm+STR_PRXM,OctoA,$2,  $2C<<3,y5); // Octorok  2
data_spawn(rm+STR_PRXM,OctoA,$2,  $40<<3,y5); // Octorok  2
data_spawn(rm+STR_PRXM,OctoA,$2,  $54<<3,y5); // Octorok  2
data_spawn(rm+STR_PRXM,OctoA,$2,  $68<<3,y5); // Octorok  2
data_spawn(rm+STR_PRXM,OctoA,$2,  $7C<<3,y5); // Octorok  2


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
/*
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'083', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_SARIA_RIVER);


row3=row0+$18; y3=row3<<3;
row4=row0+$13; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,OctoA,$1,  $10<<3,(row0+$15)<<3); // Octorok  1
data_spawn(rm+STR_PRXM,OctoA,$1,  $28<<3,(row0+$16)<<3); // Octorok  1
data_spawn(rm+STR_PRXM,OctoA,$1,  $3B<<3,(row0+$17)<<3); // Octorok  1
data_spawn(rm+STR_PRXM,OctoA,$2,  $48<<3,(row0+$1A)<<3); // Octorok  2


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row4,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '50'+EXL0_); // RGT 0, 
*/








//   --------------------------  50  ---------------------------  
//    West Saria River(North Branch), Moruge Swamp exit
rm_num  = $50;
/*
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'084', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_SARIA_RIVER);


row3=row0+$18; y3=row3<<3;
row4=row3+$02; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,Boggnipp,$1,  $2F<<3,y4); // Boggnipp
data_spawn(rm+STR_PRXM,Boggnipp,$1,  $5F<<3,y4); // Boggnipp
data_spawn(rm+STR_PRXM,OctoA,$2,  $18<<3,y4); // Octorok  2
data_spawn(rm+STR_PRXM,OctoA,$2,  $2C<<3,y4); // Octorok  2
data_spawn(rm+STR_PRXM,OctoA,$2,  $40<<3,y4); // Octorok  2
data_spawn(rm+STR_PRXM,OctoA,$2,  $54<<3,y4); // Octorok  2
data_spawn(rm+STR_PRXM,OctoA,$2,  $68<<3,y4); // Octorok  2
data_spawn(rm+STR_PRXM,OctoA,$2,  $7C<<3,y4); // Octorok  2


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '4F'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld
*/








//   --------------------------  51  ---------------------------  
//     
rm_num  = $51;


//   --------------------------  52  ---------------------------  
//    Saria Lake, BAIT Path Entrance
rm_num  = $52;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+color_str(p.C_VLT3), STR_Tile+area_EA+'099', STR_ow_axis+'00');


row3=row0+$15; y3=row3<<3; // PC yt right exit
row4=row0+$19; y4=row4<<3; // PC yt  left exit
row5=row3+$02; y5=row5<<3;
row6=row4+$02; y6=row6<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,MoblA,$2,  $1F<<3,y4); // Moblin  2 
data_spawn(rm+STR_PRXM,OctoA,$1,  $10<<3,y6); // Octorok  1
data_spawn(rm+STR_PRXM,OctoA,$1,  $2E<<3,y6); // Octorok  1
data_spawn(rm+STR_PRXM,OctoA,$1,  $4A<<3,y5); // Octorok  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row4,  '54'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0);          // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  53  ---------------------------  
//    Saria Lake, BAIT Path Exit
rm_num  = $53;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR7_, STR_Tile+area_WA+'005', STR_ow_axis+'00');


row3=row0+$19; y3=row3<<3; // PC yt right exit
row4=row0+$16; y4=row4<<3; // PC yt  left exit
row5=row3+$02; y5=row5<<3;
row6=row4+$02; y6=row6<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,OctoA,$2,  $2B<<3,y6); // Octorok  2
data_spawn(rm+STR_PRXM,Bot_A,$2,  $07<<3,y5); // Bot  2
data_spawn(rm+STR_PRXM,Bot_A,$2,  $10<<3,y5); // Bot  2
data_spawn(rm+STR_PRXM,Bot_A,$1,  $1C<<3,y5); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row4,  0);          // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '54'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  54  ---------------------------  
//    Saria Lake.  BAIT item
rm_num  = $54;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_WA+'085', STR_ow_axis+'00');


row3=row0+$19; y3=row3<<3;
row4=row0+$0A; y4=row4<<3;
data_spawn(rm+STR_PRXM,MoblA,$3,  $30<<3,y3); // Moblin  3 
data_spawn(rm+STR_PRXM,MoblA,$3,  $48<<3,y3); // Moblin  3 
data_spawn(rm+STR_PRXM,MoblA,$2,  $68<<3,y3); // Moblin  2 
data_spawn(rm+STR_PRXM,DeelA,$1,  $20<<3,y4); // Deeler  1 
data_spawn(rm+STR_PRXM,DeelA,$1,  $38<<3,y4); // Deeler  1 
data_spawn(rm+STR_PRXM,DeelA,$1,  $50<<3,y4); // Deeler  1 
data_spawn(rm+STR_PRXM,DeelA,$1,  $68<<3,y4); // Deeler  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '53'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '52'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmAB,$1,  ($0F<<3)+2,(row0+$14)<<3); // BAIT


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  55  ---------------------------  
//    Forest water scene at end of forest path above Saria Lake
rm_num  = $55;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_WA+'086', STR_ow_axis+'01');


row3=row0+$15; y3=row3<<3;
row4=row0+$17; y4=row4<<3;
row5=row0+$05; y5=row5<<3;
data_spawn(rm+STR_PRXM,AnerA,$1,  $1E<<3,y4); // Aneru  1
data_spawn(rm+STR_PRXM,AnerA,$1,  $2A<<3,y4); // Aneru  1
data_spawn(rm+STR_PRXM,AnerA,$1,  $37<<3,y4); // Aneru  1
data_spawn(rm+STR_PRXM,AnerA,$1,  $52<<3,y3); // Aneru  1
data_spawn(rm+STR_PRXM,AcheA,$1,  $12<<3,y5); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $1A<<3,y5); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $28<<3,y5); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $32<<3,y5); // Ache  1 
data_spawn(rm+STR_PRXM,AcheA,$1,  $40<<3,y5); // Ache  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld


data_spawn(rm+STR_PRIO,ItmF0,$7,  $40<<3,y4); // PBag v7: 400


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);








//   --------------------------  56  ---------------------------  
//     


//   --------------------------  57  ---------------------------  
//     


//   --------------------------  58  ---------------------------  
//    Shortcut through Parapa Desert leaving Parapa Palace
rm_num  = $58;  
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR2_, STR_Tile+area_WA+'017', STR_ow_axis+'03', MapAreaName_DATAKEY+_MapAreaName_PARAPA_DESERT);


row3=row0+$16; y3=row3<<3;
row4=row0+$03; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,Bot_A,$2,  $2F<<3,(row0+$18)<<3); // Bot  2
data_spawn(rm+STR_PRXM,Bot_A,$2,  $4F<<3,(row0+$00)<<3); // Bot  2
data_spawn(rm+STR_PRXM,Bot_A,$2,  $6C<<3,(row0+$03)<<3); // Bot  2
data_spawn(rm+STR_PRXM,GeldA,$1,  $0C<<3,(row0+$16)<<3); // Geldarm  1
data_spawn(rm+STR_PRXM,GeldA,$1,  $1C<<3,(row0+$16)<<3); // Geldarm  1
data_spawn(rm+STR_PRXM,GeldA,$1,  $3E<<3,(row0+$14)<<3); // Geldarm  1
data_spawn(rm+STR_PRXM,GeldA,$1,  $6F<<3,(row0+$03)<<3); // Geldarm  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  0); // RGT 0, to Overworld








//   --------------------------  59  ---------------------------  
//     Royal Cemetery to Death Mtn Shortcut transition scene. Single tile beach so Death Mtn overworld music plays.
rm_num  = $59;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR2_, STR_Tile+area_WA+'101', STR_ow_axis+'00');


row3=row0+$18; y3=row3<<3;
row4=row3-$04; y4=row4<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,OctoA,$1,  $0C<<3,(row4+$02)<<3); // Octorok  1
data_spawn(rm+STR_PRXM,DairA,$1,  $1A<<3,y4); // Daira  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  5A  ---------------------------  
//    Swamp scene for MEDICINE/FLOWER item
rm_num  = $5A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+color_str(p.C_RED1), STR_Tile+area_WA+'028', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MORUGE_SWAMP);


row3=row0+$0C; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0F'+EXR0_); // LFT 0, 


data_spawn(rm+STR_PRIO,ItmC3,$1,  ($36<<3)-3,(row0+$12)<<3); // MEDICINE/FLOWER


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);








//   --------------------------  5B  ---------------------------  
//    (Rando Only) - Shortcut from Rauru Forest to Midoro Field 
rm_num  = $5B;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'097', STR_ow_axis+'01');


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0A<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $35<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,PushA,$2,  $1F<<3,(row0+$0C)<<3,  dk_PI+hex_str(global.PI_BGR4)); // Pushable


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 








//   --------------------------  5C  ---------------------------  
//    (Rando Only) - Shortcut from South Parapa(heart piece location) to Whale Isl fast travel above Mido
rm_num  = $5C;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'100', STR_ow_axis+'01');


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0A<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $35<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '40'+EXL0_); // RGT 0, 








//   --------------------------  5D  ---------------------------  
//     


//   --------------------------  5E  ---------------------------  
//     


//   --------------------------  5F  ---------------------------  
//     


//   --------------------------  60  ---------------------------  
//    Under King's Tomb.  SHIELD item
rm_num  = $60;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_WA+'070', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_ROYAL_CEMETERY);


row3=row0+$0E; y3=row3<<3;
row4=row0+$16; y4=row4<<3;
data_spawn(rm+STR_PRXM,Myu_A,$1,  $10<<3,(row0+$12)<<3); // Myu  1
data_spawn(rm+STR_PRXM,Myu_A,$1,  $20<<3,y4); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $40<<3,y4); // Myu  1 


data_exit(EXU0,etA0,0,  $26,row_e0,  $0A,ROWS5,  $2B,row_e4,  '24'+EXD0_); // UP  0, Pit up 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld


data_spawn(rm+STR_PRIO,ItmE0,$1,  $33<<3,y4); // Magic Jar (Full)
data_spawn(rm+STR_PRIO,ItmAE,$1,  ($49<<3)+4,y4); // ItmAE: SHIELD


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01"+STR_Pit+"8",rm);








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




//   -----------------------------------------------------------
ow_axis = 1;


//   --------------------------  F2  ---------------------------  
//    


// ----------------------------------------------------------------
ow_axis=$1;

//   --------------------------  F3  ---------------------------  
//    Path to Rescue Fairy. Cave
rm_num  = $F3;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'243', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_RUTO_MOUNTAINS);


clm3=$50; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
row3=row0+$08; y3=row3<<3;
row4=row0+$0C; y4=row4<<3;
row5=row0+$16; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0F<<3,(row0+$15)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3-$04)<<3)+4,(row0+$13)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clms0-$06)<<3)+4,(row0+$0D)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GoriA,$2,  $28<<3,y5); // Goriya  2 
data_spawn(rm+STR_PRXM,LowdA,$1,  $20<<3,y5); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $70<<3,y5); // Lowder  1 


data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  'F4'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row0+$10);                                           // Elevator UP $80,  
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  'FE'+EXR2_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  'FC'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_01",rm);








//   --------------------------  F4  ---------------------------  
//    Path to Rescue Fairy. Outside, above 1st cave system
rm_num  = $F4;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'246', STR_ow_axis+hex_str(ow_axis), MapAreaName_DATAKEY+_MapAreaName_RUTO_MOUNTAINS);


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);


clm3=$40; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  'F3'+EXU0_); // DWN 0, Elevator down  
data_Elev(EXD0_, clm3,row0+$15);                                         // Elevator DW $40,  

row4=ROW0;       rows4=  $05-row4;
row5=row4+rows4; rows5=rows1-row5;
data_exit(EXL0,etA0,1,  CLM2,row4,  CLMS2,rows4,  CLM3,$00,  'FE'+EXR0_); // LFT 0, 
data_exit(EXL1,etA0,1,  CLM2,row5,  CLMS2,rows5,  CLM3,$16,  'FE'+EXR1_); // LFT 1, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,$18,  'F5'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmF0,$8,  $55<<3,(row0+$02)<<3); // PBag v8: 500


//data_rando_scene01("_00"+"_01"+"_02"+"_01"+"_00",rm);








//   --------------------------  F5  ---------------------------  
//    Path to Rescue Fairy. Mtn side drop off to the right 2.
rm_num  = $F5;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'245', STR_View+'02', STR_ow_axis+hex_str(ow_axis), MapAreaName_DATAKEY+_MapAreaName_RUTO_MOUNTAINS);


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);


_exit='F8'+EXU0_;
data_exit(EXD0,etA0,1,  CLM0,row_e2,  clms1,ROWS5,  clm1,row_e3,  _exit); // DWN 0, Pit down
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,$1C,  'F4'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row1-$02,  _exit); // RGT 0, 








//   --------------------------  F6  ---------------------------  
//    Path to Rescue Fairy. Mtn side drop off to the right 1.
rm_num  = $F6;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'245', STR_View+'02', STR_ow_axis+hex_str(ow_axis), MapAreaName_DATAKEY+_MapAreaName_RUTO_MOUNTAINS);


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);


_exit='FE'+EXU0_;
data_exit(EXD0,etA0,1,  CLM0,row_e2,  clms1,ROWS5,  clm1,row_e3,  _exit); // DWN 0, Pit down
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,$1C,  'FA'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row1-$02,  _exit); // RGT 0, 









//   --------------------------  F7  ---------------------------  
//    Path to Rescue Fairy. Cave between long bridge rm($FF) and 1st ruins rm($FE)
rm_num  = $F7;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'009', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_RUTO_MOUNTAINS);


clm3=$08; x3=clm3<<3;
clm4=clms0-clm3-$01; x4=clm4<<3;
row3=row0+$16; y3=row3<<3;
row4=row0+$14; y4=row4<<3;
row5=row3+$01; y5=row5<<3;
row6=row4+$01; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x4,y6); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,Myu_A,$1,  $08<<3,y3); // Myu  1 
data_spawn(rm+STR_PRXM,Myu_A,$1,  $3E<<3,y3); // Myu  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $12<<3,y3); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $2A<<3,y3); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $3E<<3,y3); // Lowder  1 
data_spawn(rm+STR_PRXM,LowdA,$1,  $5A<<3,y3); // Lowder  1 
data_spawn(rm+STR_PRXM,GoriA,$2,  $56<<3,y3); // Goriya  2 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  'FE'+EXR3_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  'F8'+EXL0_); // RGT 0, 


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  F8  ---------------------------  
//    Path to Rescue Fairy. Outside, Cave ENTRANCE between long bridge rm($FF) and 1st ruins rm($FE)
rm_num  = $F8;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'042', STR_View+'02', STR_ow_axis+hex_str(ow_axis), MapAreaName_DATAKEY+_MapAreaName_RUTO_MOUNTAINS);


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,Bot_A,$1,  $0C<<3,(row0+$0F)<<3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $20<<3,(row0+$17)<<3); // Bot  1 


clm3=$08; clms3=clms0-clm3; clm4=clm3+$02;
data_exit(EXU0,etA0,0,  clm3,-$0F,  clms3,ROWS5,  clm4,$02,  'F5'+EXD0_); // UP  0, Pit up 
//data_exit(EXU0,etA0,0,  clm3,-$0F,  $04,ROWS5,  clm4,$02,  'F5'+EXD0_); // UP  0, Pit up 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,$29,  'F7'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,$37,  0); // RGT 0,  to Overworld


data_spawn(rm+STR_PRIO,Kakusu004,$1,  $08<<3,$1A<<3,  STR_Treasure+STR_Map+"01");








//   --------------------------  F9  ---------------------------  
//    


//   --------------------------  FA  ---------------------------  
//    Rescue Fairy Cave. RFAIRY
rm_num  = $FA;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'061', STR_View+'02', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_RUTO_MOUNTAINS);


x3=(clms0-$09)<<3;
row3=row0-$14; y3=row3<<3; // exit RGT 0  pc spawn yt
row4=row0+$16; y4=row4<<3; // exit RGT 1  pc spawn yt
row5=row3+$01; y5=row5<<3;
row6=row4+$01; y6=row6<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,y5); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x3,y6); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,LoDoA,$2,  $10<<3,$05<<3,  STR_Side+hex_str($1)); // Locked Door


row5=row3+$04;               // exit RGT 0  pc spawn yb
row6=row5+((row4-row5)>>1);  // exit RGT 0  bottom, exit RGT 1  top
//row6=(row4-row5)>>1;  // exit RGT 0  bottom, exit RGT 1  top
rows5=row6+abs(ROW0); // exit RGT 0  row count
rows6=rows1-row6;     // exit RGT 1  row count
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows5,  clmA,row3,  'F6'+EXL0_); // RGT 0, 
data_exit(EXR1,etA0,1,  clm2,row6,  CLMS2,rows6,  clmA,row4,  'FE'+EXL0_); // RGT 1, 


data_spawn(rm+STR_PRIO,ItmE0,$4,  $0B<<3,(row4-$01)<<3); // Magic Jar (Full), v4: unlim respawn
data_spawn(rm+STR_PRIO,ItmA8,$1,  $0A<<3,$08<<3); // ITM_FRY1. Rescue fairy








//   --------------------------  FB  ---------------------------  
//    


//   --------------------------  FC  ---------------------------  
//    Path to Rescue Fairy. Cave 2.
rm_num  = $FC; 
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_WA+'239', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_RUTO_MOUNTAINS);


row3=row0+$16; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $09<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,OctoA,$1,  $20<<3,y3); // Octorok 1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  'F3'+EXR0_); // LFT 0, 


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);








//   --------------------------  FD  ---------------------------  
//    


//   --------------------------  FE  ---------------------------  
//    Path to Rescue Fairy. Ruins 1.
rm_num  = $FE;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'254', STR_View+'00', STR_ow_axis+hex_str(ow_axis), MapAreaName_DATAKEY+_MapAreaName_RUTO_MOUNTAINS);


row3=$04; y3=row3<<3; // exit RGT 0   pc spawn yt
row4=$1C; y4=row4<<3; // exit RGT 1   pc spawn yt
row5=$53; y5=row5<<3; // exit RGT 2   pc spawn yt
row6=$73; y6=row6<<3; // exit RGT 3   pc spawn yt
data_NIAO_1a(rm+STR_NIAO+"0", $0000, 2,Cloud_1_init);
data_spawn(rm+STR_PRIO,BlazA,$2,  ($2C<<3)+4,$56<<3); // Blaze v2
data_spawn(rm+STR_PRIO,BlazA,$2,  ($28<<3)+4,$1F<<3); // Blaze v2


clm3=$06; clms3=clms0-clm3; clm4=$0F;
data_exit(EXU0,etA0,0,  clm3,-$0F,  clms3,ROWS5,  clm4,$02,  'F6'+EXD0_); // UP  0, Pit up 
//data_exit(EXU0,etA0,0,  CLM0,-$0F,  clms1,ROWS5,  $0F,$02,  'F6'+EXD0_); // UP  0, Pit up 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,$1C,  'FA'+EXR1_); // LFT 0, 

_clm=$21+clm0; _clm2=clms0-$04;

row7  = row3+$04;       // exit RGT 0  pc spawn yb
row7 += $01;            // exit RGT 0  bottom,  exit RGT 1  top
rows7 = row7+abs(ROW0); // exit RGT 0  row count

row8  = row4+$04;       // exit RGT 1  pc spawn yb
row8 +=(row5-row8)>>1;  // exit RGT 1  bottom,  exit RGT 2  top
rows8 = row8-row7;      // exit RGT 1  row count

row9  = row5+$04;       // exit RGT 2  pc spawn yb
row9 +=(row6-row9)>>1;  // exit RGT 2  bottom,  exit RGT 3  top
rows9 = row9-row8;      // exit RGT 2  row count

rowsA = rows1-row9;     // exit RGT 3  row count

data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows7,  clmA,row3,  'F4'+EXL0_); // RGT 0, 
data_exit(EXR1,etA0,1,  clm2,row7,  CLMS2,rows8,  clmA,row4,  'F4'+EXL1_); // RGT 1, 
data_exit(EXR2,etA0,1,  clm2,row8,  CLMS2,rows9,  clmA,row5,  'F3'+EXL0_); // RGT 2, 
data_exit(EXR3,etA0,1,  clm2,row9,  CLMS2,rowsA,  clmA,row6,  'F7'+EXL0_); // RGT 3, 
/*
_row=ROW0; _h3=$09-_row;
data_exit(EXR0,etA0,1,  _clm,_row,  CLMS2,_h3,  _clm2,$04,  'F4'+EXL0_); // RGT 0, 
_row+=_h3; _h3=$30-_row;
data_exit(EXR1,etA0,1,  _clm,_row,  CLMS2,_h3,  _clm2,$1C,  'F4'+EXL1_); // RGT 1, 
_row+=_h3; _h3=$30;
data_exit(EXR2,etA0,1,  _clm,_row,  CLMS2,_h3,  _clm2,$53,  'F3'+EXL0_); // RGT 2, 
_row+=_h3; _h3=$40;
data_exit(EXR3,etA0,1,  _clm,_row,  CLMS2,_h3,  _clm2,$73,  'F7'+EXL0_); // RGT 3, 
*/


data_spawn(rm+STR_PRIO,ItmF0,$6,  $37<<3,$3C<<3); // PBag v6: 500








//   --------------------------  FF  ---------------------------  
//    Path to Rescue Fairy. Long bridge 1
rm_num  = $FF;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_WA+'060', STR_ow_axis+hex_str(ow_axis), MapAreaName_DATAKEY+_MapAreaName_RUTO_MOUNTAINS);


row3=row0+$0A; y3=row3<<3;
row4=row0+$13; y4=row4<<3;
row5=row0+$1A; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
x3=($14<<3)+4; _dist=$1F; _a=0;
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_dist*_a++),y5); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_dist*_a++),y5); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_dist*_a++),y5); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_dist*_a++),y5); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_dist*_a++),y5); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_dist*_a++),y5); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_dist*_a++),y5); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_dist*_a++),y5); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_dist*_a++),y5); // Bagin
//                                                              //
data_spawn(rm+STR_PRXM,BagiA,$1,  $49<<3,y5); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  $55<<3,y5); // Bagin


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0,  to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  area_TA+'03'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmE0,$2,  $71<<3,(row0+$18)<<3); // v2: Magic Jar, Blue(1 container, $10 mp)
data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  ($40<<3)-2,(row0+$15)<<3,  STR_Treasure+STR_Map+"01"); // MAGIC PIECE




