/// rm_data_init_Palc_H()


var _i, _a, _val, _dist;
var _x,_y, _w,_h;
var _clm,_row, _clms,_rows, _rc;
var _pi, _obj,_ver;
var _rm_num, _rm, _file, _exit,_exit1, _owrc;
var _page,_pages;
var _data, _datakey,_dk;
var _tsrc;
var _DEPTH1 = DEPTH_FG8-3;
var _RC1 = $0200; // for CloudCover1_init

map_clm_off =  0;
map_row_off =  0;








// *************************   PALACE 8   *************************** 
// ------------------------------------------------------------------------------- 
area = area_PH;

var _DUNGEON_NUM  = $08;
var _DUNGEON_NUM_ = hex_str(_DUNGEON_NUM);

mus0 = STR_Dungeon+_DUNGEON_NUM_;
//mus0 = MUS_DUNGEON1;

var _DARK_DATA=STR_Dark+"01";
ow_axis =  0; // 0:horizontal, 1:vertical


var _DUNGEON_NAME = STR_Dragmire_Tower;
g.dm_dungeon[?STR_Dungeon+_DUNGEON_NUM_+STR_Name] = _DUNGEON_NAME;
g.dm_dungeon[?STR_Dungeon+area         +STR_Name] = _DUNGEON_NAME;
g.dm_dungeon[?STR_Dungeon+STR_Num+_DUNGEON_NAME]  = _DUNGEON_NUM;
g.dm_dungeon[?STR_Dungeon+_DUNGEON_NUM_+STR_Area] = area;
g.dm_dungeon[?_DUNGEON_NAME+STR_Area]             = area;



var _BGR_COLOR = p.CI_BLU3_;






//   --------------------------  00  --------------------------- 
//      
rm_num  = $00;
set_rm_data(area+hex_str(rm_num), mus0, STR_Color+_BGR_COLOR, STR_Tile+area_PH+'000', STR_ow_axis+hex_str(ow_axis));


                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init); // 
//data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 2,CloudCover1_init); // 
//data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 3,StarSky_1_init); // 


//clm3=$70; // Elevator center clm
//data_exit(EXD0,etC0,1,  clm3-4,row_e2,  CLMS4,ROWS5,  clm3-1,row_e3,  '00'+EXD0_); // DWN 0, Elevator down  
//data_Elev(EXD0_, clm3,row0+$15, "04");                                       // Elevator DW $40,  
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$17,  0); // LFT 0, to Overworld  
g.dm_rm[?get_dk_dungeon_entrance(_DUNGEON_NUM)] = _exit;
//data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$13,  hex_str(rm_num)+EXR0_); // RGT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$13,  '01'+EXL0_); // RGT 0, 


_a=$00;  _datakey=MAP_DATAKEY1+rm+STR_Page;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B1;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_D1;
g.dm_rm[?_datakey+hex_str(_a-1)+STR_ScaleY] = -1;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_D0;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B1;


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  01  --------------------------- 
//      
rm_num  = $01;
set_rm_data(area+hex_str(rm_num), mus0, STR_Color+_BGR_COLOR, STR_Tile+area_PH+'001', STR_ow_axis+hex_str(ow_axis));


                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init); // 
//data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 2,CloudCover1_init); // 
//data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 3,StarSky_1_init); // 
row3=row0+$17; row4=row3-$04; // row3: Ground row
//data_spawn(rm+STR_PRIO,SpStA,$1,  $27<<3,(row0+$13)<<3); // SpawnByStab 1


clm3=clm1; // Elevator center clm
data_exit(EXU0,etC0,1,  clm3-4,row0-$0F,  CLMS4,ROWS5,  clm3-1,row0+$05,  '02'+EXD0_); // UP  0, Elevator up 
data_Elev(EXU0_, clm3,row3-$06);                                                 // Elevator UP $80, 
//data_Elev(EXU0_, clm3,row3-$06, "02");                                                 // Elevator UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row4,  '00'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '06'+EXL0_); // RGT 0, 


_a=$00;  _datakey=MAP_DATAKEY1+rm+STR_Page;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_Z0;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B1;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_D1;
g.dm_rm[?_datakey+hex_str(_a-1)+STR_ScaleY] = -1;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B1;
//g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B0;








//   --------------------------  02  --------------------------- 
//      
rm_num  = $02;
set_rm_data(area+hex_str(rm_num), mus0, STR_Color+_BGR_COLOR, STR_Tile+area_PH+'005', STR_View+'02', STR_ow_axis+hex_str(ow_axis));


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init); // 
data_spawn(rm+STR_PRIO,SpMoA,$1,  $00<<3,$00<<3); // MobySpawner 1


clm3=clm1; // Elevator center clm
data_exit(EXU0,etC0,1,  clm3-4,-$0F,  CLMS4,ROWS5,  clm3-1,$05,  '03'+EXD0_); // UP  0, Elevator up 
data_exit(EXD0,etC0,1,  clm3-4,row_e2,  CLMS4,ROWS5,  clm3-1,row_e3,  '01'+EXU0_); // DWN 0, Elevator down 
//data_Elev(EXU0_, clm3,row3-$06);                                             // Elevator UP $80, 
data_Elev(EXD0_+EXU0_,  clm3,row0+$15);                                      // Elevator DW $40, UP $80, 


_a=$00;  _datakey=MAP_DATAKEY1+rm+STR_Page;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_C0+$02; // $4A
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;

g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_D2; // $54
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;

g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_D2; // $54
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;

g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_C0+$02; // $4A
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;


data_rando_scene01("_00"+"_00"+"_00"+"_01"+"_01",rm);









//   --------------------------  03  --------------------------- 
//      
rm_num  = $03;
set_rm_data(area+hex_str(rm_num), mus0, STR_Color+_BGR_COLOR, STR_Tile+area_PH+'005', STR_View+'02', STR_ow_axis+hex_str(ow_axis));


                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,CloudCover1_init, -1,-1, _DEPTH1); // 1: TOP, FGR
data_spawn(rm+STR_PRIO,SpMoA,$1,  $00<<3,$00<<3); // MobySpawner 1


clm3=clm1; // Elevator center clm
data_exit(EXU0,etC0,1,  clm3-4,-$0F,  CLMS4,ROWS5,  clm3-1,$05,  '04'+EXD0_); // UP  0, Elevator up 
data_exit(EXD0,etC0,1,  clm3-4,row_e2,  CLMS4,ROWS5,  clm3-1,row_e3,  '02'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row0+$15);                                       // Elevator DW $40, UP $80, 


_a=$00;  _datakey=MAP_DATAKEY1+rm+STR_Page;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_C0+$02; // $4A
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;

g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_D2; // $54
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;

g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_D2; // $54
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;

g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_C0+$02; // $4A
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;


data_rando_scene01("_00"+"_00"+"_00"+"_01"+"_01",rm);







//   --------------------------  04  --------------------------- 
//      
rm_num  = $04;
set_rm_data(area+hex_str(rm_num), mus0, STR_Color+_BGR_COLOR, STR_Tile+area_PH+'003', STR_ow_axis+hex_str(ow_axis));


                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++),  _RC1, 2,CloudCover1_init, -1,-1, _DEPTH1); // 2: BTM, FGR
//data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 3,StarSky_1_init); // 
row3=row0+$1A; row4=row3-$04; // row3: ground row
y3  =(row0+$12)<<3;
//data_spawn(rm+STR_PRIO,SpBuA,$2,  $26<<3,y3); // BulletSpawner  2


clm3=$20; // Elevator center clm
data_exit(EXD0,etC0,1,  clm3-4,row_e2,  CLMS4,ROWS5,  clm3-1,row_e3,  '03'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$15);                                           // Elevator DW $40, 
clm3=$34; clms3=$30;
_exit=data_exit(EXD1,etA1,1,  clm3,row_e2,  clms3,ROWS5,  clm3+(clms3>>1),row_e3,  '00'+EXL0_); // DWN 0, Pit down 
data_pit(_exit, 0,2);
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row4,  '05'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$12,  '1B'+EXL0_); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmE0,$4,  $07<<3,(row3-$04)<<3); // v4: Magic Jar, Red(full), infinite respawn








//   --------------------------  05  --------------------------- 
//      
rm_num  = $05;
set_rm_data(area+hex_str(rm_num), mus0, STR_Color+_BGR_COLOR, STR_Tile+area_PH+'004', STR_ow_axis+hex_str(ow_axis));


                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++),  _RC1, 2,CloudCover1_init, -1,-1, _DEPTH1); // 2: BTM, FGR
//data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 3,StarSky_1_init); // 
row3=row0+$1A; row4=row3-$04; // row3: ground row
y3  =(row0+$12)<<3;
//data_spawn(rm+STR_PRIO,SpBuA,$2,  $26<<3,y3); // BulletSpawner  2


_exit1='00'+EXL0_;
clms3=PAGE_CLMS<<2; clm3=-clms3; clms4=clms0; clms5=clms3+clms4;
//clms3=PAGE_CLMS<<2; clm3=-clms3; clms4=$24; clms5=clms3+clms4;
_exit=data_exit(EXD0,etA1,1,  clm3,row_e2,  clms5,ROWS5,  clms4>>1,row_e3,  _exit1); // DWN 0, Pit down 
//clm3=$00;  clms3=$24;  _exit1='00'+EXL0_;
//_exit=data_exit(EXD0,etA1,1,  clm3,row_e2,  clms3,ROWS5,  clm3+(clms3>>1),row_e3,  _exit1); // DWN 0, Pit down 
data_pit(_exit, 0,8);
data_exit(EXL0,etA1,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row1,  _exit1); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$12,  '04'+EXL0_); // RGT 0, 


//data_spawn(rm+STR_PRIO,ItmE0,$1,  $07<<3,(row3-$04)<<3); // v1: Magic Jar, Red(full mp)


_a=0;    _datakey=MAP_DATAKEY1+rm+STR_Page;
g.dm_rm[?_datakey+"00"+STR_TSRC]   = MAP_TSRC_B0+2;
g.dm_rm[?_datakey+"00"+STR_ScaleX] = -1;
g.dm_rm[?_datakey+"01"+STR_TSRC]   = MAP_TSRC_B0+1;






//   --------------------------  06  --------------------------- 
//     Fast Travel - Dragmire Tower to Dragmire
rm_num  = $06;
set_rm_data(area+hex_str(rm_num), mus0, STR_Color+_BGR_COLOR, STR_Tile+area_PH+'007', STR_ow_axis+hex_str(ow_axis));


                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init); // 
row3=row0+$15; y3=row3<<3; // row3: Ground row
row4=row3+$02; y4=row4<<3;
//data_spawn(rm+STR_PRIO,SpStA,$1,  $27<<3,(row0+$13)<<3); // SpawnByStab 1


clm3=clm0-1;
data_exit(EXM0,etB3,1,  clm3,row4,  $03,ROWS2,  clm3-1,row4,  area_EA+'65'+EXM0_); // MID 0, to Dragmire
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '01'+EXR0_); // LFT 0, 


_a=$00;  _datakey=MAP_DATAKEY1+rm+STR_Page;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B1;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B0;


//data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);








//   --------------------------  07  --------------------------- 
//      
rm_num  = $07;


//   --------------------------  08  --------------------------- 
//      
rm_num  = $08;


//   --------------------------  09  --------------------------- 
//      
rm_num  = $09;


//   --------------------------  0A  --------------------------- 
//      
rm_num  = $0A;


//   --------------------------  0B  --------------------------- 
//      
rm_num  = $0B;


//   --------------------------  0C  --------------------------- 
//      
rm_num  = $0C;


//   --------------------------  0D  --------------------------- 
//      
rm_num  = $0D;


//   --------------------------  0E  --------------------------- 
//      
rm_num  = $0E;


//   --------------------------  0F  --------------------------- 
//      
rm_num  = $0F;


//   --------------------------  10  --------------------------- 
//      
rm_num  = $10;


//   --------------------------  11  --------------------------- 
//      
rm_num  = $11;


//   --------------------------  12  --------------------------- 
//      
rm_num  = $12;


//   --------------------------  13  --------------------------- 
//      
rm_num  = $13;


//   --------------------------  14  --------------------------- 
//      
rm_num  = $14;


//   --------------------------  15  --------------------------- 
//      
rm_num  = $15;


//   --------------------------  16  --------------------------- 
//      
rm_num  = $16;


//   --------------------------  17  --------------------------- 
//      
rm_num  = $17;


//   --------------------------  18  --------------------------- 
//      
rm_num  = $18;


//   --------------------------  19  --------------------------- 
//      
rm_num  = $19;


//   --------------------------  1A  --------------------------- 
//      
rm_num  = $1A;


//   --------------------------  1B  --------------------------- 
//      
rm_num  = $1B;
set_rm_data(area+hex_str(rm_num), mus0, STR_Color+_BGR_COLOR, STR_Tile+area_PH+'006', STR_ow_axis+hex_str(ow_axis));


                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,  1,Cloud_1_init); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0200,  2,CloudCover1_init, -1,-1, _DEPTH1,3); // 2: BTM, FGR
//data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0300,  2,CloudCover1_init, -1,-1, _DEPTH1,3); // 2: BTM, FGR
row3=row0+$19; row4=row3-$04; // row3: Ground row
//row3=row0+$1B; row4=row3-$04; // row3: Ground row
//data_spawn(rm+STR_PRIO,SpStA,$1,  $27<<3,(row0+$13)<<3); // SpawnByStab 1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row4,  '04'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '1C'+EXL0_); // RGT 0, 


_a=$00;  _datakey=MAP_DATAKEY1+rm+STR_Page;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B1;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_D0;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B1;


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  1C  --------------------------- 
//      Ganon1
rm_num  = $1C;
set_rm_data(area+hex_str(rm_num), mus0, STR_Color+_BGR_COLOR, STR_Tile+area_PH+'064', STR_ow_axis+hex_str(ow_axis));


                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 2,CloudCover1_init); // 2: BTM, BGR
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0300, 2,CloudCover1_init, -1,-1, _DEPTH1,3); // 2: BTM, FGR

clms3=(sprite_get_width(g.Ganon1_SPRITE1)>>3)>>1;  rows3=sprite_get_height(g.Ganon1_SPRITE1)>>3;
data_spawn(rm+STR_PRIO,Ganon1,$1,  (clm1-clms3)<<3,(rows0-rows3)<<3,  STR_Arena+'_x'+hex_str(x0));
g.dm_rm[?STR_Boss+STR_Scene+STR_Name+_DUNGEON_NAME] = rm;


clm3=$04;  clm4=clms0-clm3;  clms3=clm4-clm3;
_exit=data_exit(EXD0,etA1,1,  clm3,row_e2,  clms3,$10,  clm1-1,row_e3,  '20'+EXU0_); // DWN 0, Pit down 
//data_pit(_exit, -2,2);
data_pit(_exit, 0,2);
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$16,  "1B"+EXR0_); // LFT 0, 
//data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$16,  hex_str(rm_num)+EXR0_); // RGT 0, 


         _datakey=MAP_DATAKEY1+rm+STR_Page;
g.dm_rm[?_datakey+"03"+STR_TSRC] = MAP_TSRC_E0+$02;


//   --------------------------  1D  --------------------------- 
//      
rm_num  = $1D;


//   --------------------------  1E  --------------------------- 
//      
rm_num  = $1E;


//   --------------------------  1F  --------------------------- 
//      
rm_num  = $1F;


//  -----------------------------------------------------------------------
mus1 = 0;
_rc = $0400;
//   --------------------------  20  --------------------------- 
//      Ganon2
rm_num  = $20;
set_rm_data(area+hex_str(rm_num), mus1, STR_Tile+area_PH+'032', STR_ow_axis+hex_str(ow_axis));


data_spawn(rm+STR_PRIO,SpStA,$1,  $3B<<3,(row0+$0E)<<3); // SpawnByStab 1
//data_spawn(rm+STR_PRIO,SpStA,$1,  $4D<<3,(row0+$0C)<<3); // SpawnByStab 1
data_spawn(rm+STR_PRIO,SpStA,$1,  $65<<3,(row0+$10)<<3); // SpawnByStab 1
data_spawn(rm+STR_PRIO,Ganon2,$1,  (clms0+$01)<<3,(row0+$05)<<3);
//STR_Arena+'_x'+hex_str(rm_w>>1)

clm3=$70; row3=row0+$17;
//data_exit(EXU0,etA4,0,  $78,row_e0,  $0C,$10,  $7A,row_e4,  '1C'+EXD0_); // UP  0, Pit up 
data_exit(EXU0,etA4,0,  clm3,row_e0,  clms0-clm3,$10,  clm3+$02,row_e4,  '1C'+EXD0_); // UP  0, Pit up 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXU0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '21'+EXL0_); // RGT 0, 


_a=$00;       _datakey=MAP_DATAKEY1+rm+STR_Page;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B0;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_D0;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_D0;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B0+$03;
//g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_D1;
//g.dm_rm[?_datakey+hex_str(_a-1)+STR_ScaleY] = -1;
//g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B1;


//data_spawn(rm+STR_PRIO,ItmE0,$4,  $66<<3,(row0+$17)<<3); // Magic Jar v4 (full) unlimited respawn








//   --------------------------  21  --------------------------- 
//      Ganon3. Hop to final room
rm_num  = $21;
set_rm_data(area+hex_str(rm_num), mus1, STR_Tile+area_PH+'033', STR_ow_axis+hex_str(ow_axis));


                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++),   _rc, 1,Cloud_1_init); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 2,CloudCover1_init); // 2: BTM, BGR
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 3,StarSky_1_init); // 
row3=row0+$1B; row4=row3-$04; // row3: Ground row
data_spawn(rm+STR_PRIO,SpStA,$1,  $27<<3,(row0+$13)<<3); // SpawnByStab 1
data_spawn(rm+STR_PRIO,Ganon3,$1,  $25<<3,row4<<3,  STR_Arena+'_x'+hex_str(rm_w>>1),STR_Phase+"02");


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row4,  '20'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '22'+EXL0_); // RGT 0, 


_a=$00;  _datakey=MAP_DATAKEY1+rm+STR_Page;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_BLANK;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B1;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_D0;
g.dm_rm[?_datakey+hex_str(_a++)+STR_TSRC] = MAP_TSRC_B1;








//   --------------------------  22  --------------------------- 
//      Ganon3. Final Battle
rm_num  = $22;
set_rm_data(area+hex_str(rm_num), mus1, STR_Color+p.CI_VLT4_, STR_Tile+area_PH+'255', STR_ow_axis+hex_str(ow_axis));
//p.dm_scene_palette[?rm+dk_MOB] = p.PAL_MOB_SET3;


                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++),   _rc, 1,Cloud_1_init, global.PI_BGR4,0); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,CloudCover1_init); // 1: TOP, BGR
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 2,CloudCover1_init); // 2: BTM, BGR
data_NIAO_1a(rm+STR_NIAO+string(_a++),  _RC1, 2,CloudCover1_init, -1,-1, _DEPTH1); // 2: BTM, FGR
//data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,CloudCover1_init); // 
//data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 2,CloudCover1_init); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 3,StarSky_1_init); // 
row3=row0+$1C; row4=row3-$04; // row3: Ground row
data_spawn(rm+STR_PRIO,Ganon3,$1,  $27<<3,row4<<3,  STR_Arena+'_x'+hex_str(rm_w>>1),STR_Phase+"00");


clm3=$04;  clms3=clms0-(clm3<<1);
//_exit=data_exit(EXD0,etA1,1,  clm3,row_e2,  clms3,$10,  clm1-1,row_e3,  '00'+EXL0_); // DWN 0, Pit down 
//data_pit(_exit, 0,2);
//_val = val(global.OVERWORLD.dm[?g.GameEnd1B_TO_EXIT_NAME+STR_goto_reen], g.GameEnd1B_RM_NAME+EXM0_);
_val = val(g.dm_rm[?g.GameEnd1B_TO_EXIT_NAME+STR_goto_reen], g.GameEnd1B_RM_NAME+EXM0_);
data_exit(EXM0,etB0,0,  clm1-1,row4,  CLMS2,ROWS2,  clm1-2,row4,  _val); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row4,  '21'+EXR0_); // LFT 0, 
//data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  rm_num_+EXL0_); // RGT 0, 









//   --------------------------  23  --------------------------- 
//      
rm_num  = $23;


//   --------------------------  24  --------------------------- 
//      
rm_num  = $24;


//   --------------------------  25  --------------------------- 
//      
rm_num  = $25;


//   --------------------------  26  --------------------------- 
//      
rm_num  = $26;


//   --------------------------  27  --------------------------- 
//      
rm_num  = $27;


//   --------------------------  28  --------------------------- 
//      
rm_num  = $28;


//   --------------------------  29  --------------------------- 
//      
rm_num  = $29;


//   --------------------------  2A  --------------------------- 
//      
rm_num  = $2A;


//   --------------------------  2B  --------------------------- 
//      
rm_num  = $2B;


//   --------------------------  2C  --------------------------- 
//      
rm_num  = $2C;


//   --------------------------  2D  --------------------------- 
//      
rm_num  = $2D;


//   --------------------------  2E  --------------------------- 
//      
rm_num  = $2E;


//   --------------------------  2F  --------------------------- 
//      
rm_num  = $2F;


//   --------------------------  30  --------------------------- 
//      
rm_num  = $30;


//   --------------------------  31  --------------------------- 
//      
rm_num  = $31;


//   --------------------------  32  --------------------------- 
//      
rm_num  = $32;


//   --------------------------  33  --------------------------- 
//      
rm_num  = $33;


//   --------------------------  34  --------------------------- 
//      
rm_num  = $34;


//   --------------------------  35  --------------------------- 
//      
rm_num  = $35;


//   --------------------------  36  --------------------------- 
//      
rm_num  = $36;


//   --------------------------  37  --------------------------- 
//      
rm_num  = $37;


//   --------------------------  38  --------------------------- 
//      
rm_num  = $38;


//   --------------------------  39  --------------------------- 
//      
rm_num  = $39;


//   --------------------------  3A  --------------------------- 
//      
rm_num  = $3A;


//   --------------------------  3B  --------------------------- 
//      
rm_num  = $3B;


//   --------------------------  3C  --------------------------- 
//      
rm_num  = $3C;


//   --------------------------  3D  --------------------------- 
//      
rm_num  = $3D;


//   --------------------------  3E  --------------------------- 
//      
rm_num  = $3E;


//   --------------------------  3F  --------------------------- 
//      
rm_num  = $3F;


//   --------------------------  40  --------------------------- 
//      
rm_num  = $40;







//   --------------------------  41  --------------------------- 
//      
rm_num  = $41;


//   --------------------------  42  --------------------------- 
//      
rm_num  = $42;


//   --------------------------  43  --------------------------- 
//      
rm_num  = $43;


//   --------------------------  44  --------------------------- 
//      
rm_num  = $44;


//   --------------------------  45  --------------------------- 
//      
rm_num  = $45;


//   --------------------------  46  --------------------------- 
//      
rm_num  = $46;


//   --------------------------  47  --------------------------- 
//      
rm_num  = $47;


//   --------------------------  48  --------------------------- 
//      
rm_num  = $48;


//   --------------------------  49  --------------------------- 
//      
rm_num  = $49;


//   --------------------------  4A  --------------------------- 
//      
rm_num  = $4A;


//   --------------------------  4B  --------------------------- 
//      
rm_num  = $4B;


//   --------------------------  4C  --------------------------- 
//      
rm_num  = $4C;


//   --------------------------  4D  --------------------------- 
//      
rm_num  = $4D;


//   --------------------------  4E  --------------------------- 
//      
rm_num  = $4E;


//   --------------------------  4F  --------------------------- 
//      
rm_num  = $4F;


//   --------------------------  50  --------------------------- 
//      
rm_num  = $50;


//   --------------------------  51  --------------------------- 
//      
rm_num  = $51;


//   --------------------------  52  --------------------------- 
//      
rm_num  = $52;


//   --------------------------  53  --------------------------- 
//      
rm_num  = $53;


//   --------------------------  54  --------------------------- 
//      
rm_num  = $54;


//   --------------------------  55  --------------------------- 
//      
rm_num  = $55;


//   --------------------------  56  --------------------------- 
//      
rm_num  = $56;


//   --------------------------  57  --------------------------- 
//      
rm_num  = $57;


//   --------------------------  58  --------------------------- 
//      
rm_num  = $58;


//   --------------------------  59  --------------------------- 
//      
rm_num  = $59;


//   --------------------------  5A  --------------------------- 
//      
rm_num  = $5A;


//   --------------------------  5B  --------------------------- 
//      
rm_num  = $5B;


//   --------------------------  5C  --------------------------- 
//      
rm_num  = $5C;


//   --------------------------  5D  --------------------------- 
//      
rm_num  = $5D;


//   --------------------------  5E  --------------------------- 
//      
rm_num  = $5E;


//   --------------------------  5F  --------------------------- 
//      
rm_num  = $5F;


//   --------------------------  60  --------------------------- 
//      
rm_num  = $60;


//   --------------------------  61  --------------------------- 
//      
rm_num  = $61;


//   --------------------------  62  --------------------------- 
//      
rm_num  = $62;


//   --------------------------  63  --------------------------- 
//      
rm_num  = $63;


//   --------------------------  64  --------------------------- 
//      
rm_num  = $64;


//   --------------------------  65  --------------------------- 
//      
rm_num  = $65;


//   --------------------------  66  --------------------------- 
//      
rm_num  = $66;


//   --------------------------  67  --------------------------- 
//      
rm_num  = $67;


//   --------------------------  68  --------------------------- 
//      
rm_num  = $68;


//   --------------------------  69  --------------------------- 
//      
rm_num  = $69;


//   --------------------------  6A  --------------------------- 
//      
rm_num  = $6A;


//   --------------------------  6B  --------------------------- 
//      
rm_num  = $6B;


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
//      
rm_num  = $70;


//   --------------------------  71  --------------------------- 
//      
rm_num  = $71;


//   --------------------------  72  --------------------------- 
//      
rm_num  = $72;


//   --------------------------  73  --------------------------- 
//      
rm_num  = $73;


//   --------------------------  74  --------------------------- 
//      
rm_num  = $74;


//   --------------------------  75  --------------------------- 
//      
rm_num  = $75;


//   --------------------------  76  --------------------------- 
//      
rm_num  = $76;


//   --------------------------  77  --------------------------- 
//      
rm_num  = $77;


//   --------------------------  78  --------------------------- 
//      
rm_num  = $78;


//   --------------------------  79  --------------------------- 
//      
rm_num  = $79;


//   --------------------------  7A  --------------------------- 
//      
rm_num  = $7A;


//   --------------------------  7B  --------------------------- 
//      
rm_num  = $7B;


//   --------------------------  7C  --------------------------- 
//      
rm_num  = $7C;


//   --------------------------  7D  --------------------------- 
//      
rm_num  = $7D;


//   --------------------------  7E  --------------------------- 
//      
rm_num  = $7E;


//   --------------------------  7F  --------------------------- 
//      
rm_num  = $7F;


//   --------------------------  80  --------------------------- 
//      
rm_num  = $80;


//   --------------------------  81  --------------------------- 
//      
rm_num  = $81;


//   --------------------------  82  --------------------------- 
//      
rm_num  = $82;


//   --------------------------  83  --------------------------- 
//      
rm_num  = $83;


//   --------------------------  84  --------------------------- 
//      
rm_num  = $84;


//   --------------------------  85  --------------------------- 
//      
rm_num  = $85;


//   --------------------------  86  --------------------------- 
//      
rm_num  = $86;


//   --------------------------  87  --------------------------- 
//      
rm_num  = $87;


//   --------------------------  88  --------------------------- 
//      
rm_num  = $88;


//   --------------------------  89  --------------------------- 
//      
rm_num  = $89;


//   --------------------------  8A  --------------------------- 
//      
rm_num  = $8A;


//   --------------------------  8B  --------------------------- 
//      
rm_num  = $8B;


//   --------------------------  8C  --------------------------- 
//      
rm_num  = $8C;


//   --------------------------  8D  --------------------------- 
//      
rm_num  = $8D;


//   --------------------------  8E  --------------------------- 
//      
rm_num  = $8E;


//   --------------------------  8F  --------------------------- 
//      
rm_num  = $8F;


//   --------------------------  90  --------------------------- 
//      
rm_num  = $90;


//   --------------------------  91  --------------------------- 
//      
rm_num  = $91;


//   --------------------------  92  --------------------------- 
//      
rm_num  = $92;


//   --------------------------  93  --------------------------- 
//      
rm_num  = $93;


//   --------------------------  94  --------------------------- 
//      
rm_num  = $94;


//   --------------------------  95  --------------------------- 
//      
rm_num  = $95;


//   --------------------------  96  --------------------------- 
//      
rm_num  = $96;


//   --------------------------  97  --------------------------- 
//      
rm_num  = $97;


//   --------------------------  98  --------------------------- 
//      
rm_num  = $98;


//   --------------------------  99  --------------------------- 
//      
rm_num  = $99;


//   --------------------------  9A  --------------------------- 
//      
rm_num  = $9A;


//   --------------------------  9B  --------------------------- 
//      
rm_num  = $9B;


//   --------------------------  9C  --------------------------- 
//      
rm_num  = $9C;


//   --------------------------  9D  --------------------------- 
//      
rm_num  = $9D;


//   --------------------------  9E  --------------------------- 
//      
rm_num  = $9E;


//   --------------------------  9F  --------------------------- 
//      
rm_num  = $9F;


//   --------------------------  A0  --------------------------- 
//      
rm_num  = $A0;


//   --------------------------  A1  --------------------------- 
//      
rm_num  = $A1;


//   --------------------------  A2  --------------------------- 
//      
rm_num  = $A2;


//   --------------------------  A3  --------------------------- 
//      
rm_num  = $A3;


//   --------------------------  A4  --------------------------- 
//      
rm_num  = $A4;


//   --------------------------  A5  --------------------------- 
//      
rm_num  = $A5;


//   --------------------------  A6  --------------------------- 
//      
rm_num  = $A6;


//   --------------------------  A7  --------------------------- 
//      
rm_num  = $A7;


//   --------------------------  A8  --------------------------- 
//      
rm_num  = $A8;


//   --------------------------  A9  --------------------------- 
//      
rm_num  = $A9;


//   --------------------------  AA  --------------------------- 
//      
rm_num  = $AA;


//   --------------------------  AB  --------------------------- 
//      
rm_num  = $AB;


//   --------------------------  AC  --------------------------- 
//      
rm_num  = $AC;


//   --------------------------  AD  --------------------------- 
//      
rm_num  = $AD;


//   --------------------------  AE  --------------------------- 
//      
rm_num  = $AE;


//   --------------------------  AF  --------------------------- 
//      
rm_num  = $AF;


//   --------------------------  B0  --------------------------- 
//      
rm_num  = $B0;


//   --------------------------  B1  --------------------------- 
//      
rm_num  = $B1;


//   --------------------------  B2  --------------------------- 
//      
rm_num  = $B2;


//   --------------------------  B3  --------------------------- 
//      
rm_num  = $B3;


//   --------------------------  B4  --------------------------- 
//      
rm_num  = $B4;


//   --------------------------  B5  --------------------------- 
//      
rm_num  = $B5;


//   --------------------------  B6  --------------------------- 
//      
rm_num  = $B6;


//   --------------------------  B7  --------------------------- 
//      
rm_num  = $B7;


//   --------------------------  B8  --------------------------- 
//      
rm_num  = $B8;


//   --------------------------  B9  --------------------------- 
//      
rm_num  = $B9;


//   --------------------------  BA  --------------------------- 
//      
rm_num  = $BA;


//   --------------------------  BB  --------------------------- 
//      
rm_num  = $BB;


//   --------------------------  BC  --------------------------- 
//      
rm_num  = $BC;


//   --------------------------  BD  --------------------------- 
//      
rm_num  = $BD;


//   --------------------------  BE  --------------------------- 
//      
rm_num  = $BE;


//   --------------------------  BF  --------------------------- 
//      
rm_num  = $BF;


//   --------------------------  C0  --------------------------- 
//      
rm_num  = $C0;


//   --------------------------  C1  --------------------------- 
//      
rm_num  = $C1;


//   --------------------------  C2  --------------------------- 
//      
rm_num  = $C2;


//   --------------------------  C3  --------------------------- 
//      
rm_num  = $C3;


//   --------------------------  C4  --------------------------- 
//      
rm_num  = $C4;


//   --------------------------  C5  --------------------------- 
//      
rm_num  = $C5;


//   --------------------------  C6  --------------------------- 
//      
rm_num  = $C6;


//   --------------------------  C7  --------------------------- 
//      
rm_num  = $C7;


//   --------------------------  C8  --------------------------- 
//      
rm_num  = $C8;


//   --------------------------  C9  --------------------------- 
//      
rm_num  = $C9;


//   --------------------------  CA  --------------------------- 
//      
rm_num  = $CA;


//   --------------------------  CB  --------------------------- 
//      
rm_num  = $CB;


//   --------------------------  CC  --------------------------- 
//      
rm_num  = $CC;


//   --------------------------  CD  --------------------------- 
//      
rm_num  = $CD;


//   --------------------------  CE  --------------------------- 
//      
rm_num  = $CE;


//   --------------------------  CF  --------------------------- 
//      
rm_num  = $CF;


//   --------------------------  D0  --------------------------- 
//      
rm_num  = $D0;


//   --------------------------  D1  --------------------------- 
//      
rm_num  = $D1;


//   --------------------------  D2  --------------------------- 
//      
rm_num  = $D2;


//   --------------------------  D3  --------------------------- 
//      
rm_num  = $D3;


//   --------------------------  D4  --------------------------- 
//      
rm_num  = $D4;


//   --------------------------  D5  --------------------------- 
//      
rm_num  = $D5;


//   --------------------------  D6  --------------------------- 
//      
rm_num  = $D6;


//   --------------------------  D7  --------------------------- 
//      
rm_num  = $D7;


//   --------------------------  D8  --------------------------- 
//      
rm_num  = $D8;


//   --------------------------  D9  --------------------------- 
//      
rm_num  = $D9;


//   --------------------------  DA  --------------------------- 
//      
rm_num  = $DA;


//   --------------------------  DB  --------------------------- 
//      
rm_num  = $DB;


//   --------------------------  DC  --------------------------- 
//      
rm_num  = $DC;


//   --------------------------  DD  --------------------------- 
//      
rm_num  = $DD;


//   --------------------------  DE  --------------------------- 
//      
rm_num  = $DE;


//   --------------------------  DF  --------------------------- 
//      
rm_num  = $DF;


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
//      
rm_num  = $EC;


//   --------------------------  ED  --------------------------- 
//      
rm_num  = $ED;


//   --------------------------  EE  --------------------------- 
//      
rm_num  = $EE;


//   --------------------------  EF  --------------------------- 
//      
rm_num  = $EF;


//   --------------------------  F0  --------------------------- 
//      
rm_num  = $F0;


//   --------------------------  F1  --------------------------- 
//      
rm_num  = $F1;


//   --------------------------  F2  --------------------------- 
//      
rm_num  = $F2;


//   --------------------------  F3  --------------------------- 
//      
rm_num  = $F3;


//   --------------------------  F4  --------------------------- 
//      
rm_num  = $F4;


//   --------------------------  F5  --------------------------- 
//      
rm_num  = $F5;


//   --------------------------  F6  --------------------------- 
//      
rm_num  = $F6;


//   --------------------------  F7  --------------------------- 
//      
rm_num  = $F7;


//   --------------------------  F8  --------------------------- 
//      
rm_num  = $F8;


//   --------------------------  F9  --------------------------- 
//      
rm_num  = $F9;


//   --------------------------  FA  --------------------------- 
//      
rm_num  = $FA;


//   --------------------------  FB  --------------------------- 
//      
rm_num  = $FB;


//   --------------------------  FC  --------------------------- 
//      
rm_num  = $FC;


//   --------------------------  FD  --------------------------- 
//      
rm_num  = $FD;


//   --------------------------  FE  --------------------------- 
//      
rm_num  = $FE;


//   --------------------------  FF  --------------------------- 
//      
rm_num  = $FF;






