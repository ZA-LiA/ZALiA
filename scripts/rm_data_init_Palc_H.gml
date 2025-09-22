/// rm_data_init_Palc_H()


var _i, _a, _val,_val1, _dist;
var _x,_y, _w,_h;
var _clm,_row, _clms,_rows, _rc;
var _pi, _obj,_ver;
var _rm_num, _rm, _file, _exit,_exit1, _owrc;
var _page,_pages;
var _data, _datakey,_dk;
var _tsrc;
var _DEPTH1 = DEPTH_FG8-3;
var _RC1 = $0200; // for CloudCover1_init
var _dk_spawn_item0, _dk_spawn_item1, _dk_spawn_item2, _dk_spawn_item3, _dk_spawn_item4;

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



var _BGR_COLOR = color_str(p.C_BLU3);






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


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








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


data_path_conditions(exit_name_r0, exit_name_l0, STR_GLOVE);
data_path_conditions(exit_name_r0, exit_name_u0);

data_path_conditions(exit_name_l0, exit_name_r0, STR_GLOVE);
data_path_conditions(exit_name_l0, exit_name_u0);

data_path_conditions(exit_name_u0, exit_name_r0, STR_GLOVE);
data_path_conditions(exit_name_u0, exit_name_l0);

data_scene_rando(rm);








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


//data_rando_scene01("_00"+"_00"+"_00"+"_01"+"_01",rm);
data_path_conditions(exit_name_d0, exit_name_u0);
data_path_conditions(exit_name_u0, exit_name_d0);

data_scene_rando(rm);









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


//data_rando_scene01("_00"+"_00"+"_00"+"_01"+"_01",rm);
data_path_conditions(exit_name_d0, exit_name_u0);
data_path_conditions(exit_name_u0, exit_name_d0);

data_scene_rando(rm);







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


_dk_spawn_item0 = data_spawn(rm+STR_PRIO,ItmE0,$4,  $07<<3,(row3-$04)<<3); // v4: Magic Jar, Red(full), infinite respawn


data_path_conditions(exit_name_r0, exit_name_l0, STR_JUMP+"+"+STR_FAIRY);
data_path_conditions(exit_name_r0, exit_name_d0, STR_JUMP+"+"+STR_FAIRY);
data_path_conditions(exit_name_r0, exit_name_d1);
data_path_conditions(exit_name_r0, _dk_spawn_item0);

data_path_conditions(exit_name_l0, exit_name_r0, STR_JUMP+"+"+STR_FAIRY);
data_path_conditions(exit_name_l0, exit_name_d0);
data_path_conditions(exit_name_l0, exit_name_d1);
data_path_conditions(exit_name_l0, _dk_spawn_item0);

data_path_conditions(exit_name_d0, exit_name_r0, STR_JUMP+"+"+STR_FAIRY);
data_path_conditions(exit_name_d0, exit_name_l0);
data_path_conditions(exit_name_d0, exit_name_d1);
data_path_conditions(exit_name_d0, _dk_spawn_item0);

data_scene_rando(rm);








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


_a=0;    _datakey=MAP_DATAKEY1+rm+STR_Page;
g.dm_rm[?_datakey+"00"+STR_TSRC]   = MAP_TSRC_B0+2;
g.dm_rm[?_datakey+"00"+STR_ScaleX] = -1;
g.dm_rm[?_datakey+"01"+STR_TSRC]   = MAP_TSRC_B0+1;


//data_path_conditions(exit_name_r0, exit_name_d0);

//data_scene_rando(rm);








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


////data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_m0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_m0);

data_scene_rando(rm);








//   --------------------------  07  --------------------------- 
//     


//   --------------------------  08  --------------------------- 
//     


//   --------------------------  09  --------------------------- 
//    


//   --------------------------  0A  --------------------------- 
//    


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


//data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);
data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

data_scene_rando(rm);








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


data_path_conditions(exit_name_l0, exit_name_d0);

//data_scene_rando(rm);








//   --------------------------  1D  --------------------------- 
//    


//   --------------------------  1E  --------------------------- 
//    


//   --------------------------  1F  --------------------------- 
//    


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


_a=$00;  _datakey=MAP_DATAKEY1+rm+STR_Page;
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


//data_path_conditions(exit_name_r0, exit_name_r0);

//data_scene_rando(rm);








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


data_path_conditions(exit_name_r0, exit_name_l0);
data_path_conditions(exit_name_l0, exit_name_r0);

//data_scene_rando(rm);








//   --------------------------  22  --------------------------- 
//      Ganon3. Final Battle
rm_num  = $22;
set_rm_data(area+hex_str(rm_num), mus1, STR_Color+color_str(p.C_VLT4), STR_Tile+area_PH+'255', STR_ow_axis+hex_str(ow_axis));
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

_dk   = string(val(g.dm_rm[?"GameEnd1B_TO_EXIT_NAME"]))+STR_goto_reen;
_val1 = string(val(g.dm_rm[?"GameEnd1B_RM_NAME"]))+EXM0_;
//_dk = g.GameEnd1B_TO_EXIT_NAME+STR_goto_reen;
//_val = val(global.OVERWORLD.dm[?_dk], g.GameEnd1B_RM_NAME+EXM0_);
_val = val(g.dm_rm[?_dk], _val1);
//_val = val(g.dm_rm[?_dk], g.GameEnd1B_RM_NAME+EXM0_);
data_exit(EXM0,etB0,0,  clm1-1,row4,  CLMS2,ROWS2,  clm1-2,row4,  _val); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row4,  '21'+EXR0_); // LFT 0, 
//data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  rm_num_+EXL0_); // RGT 0, 


//data_path_conditions(exit_name_l0, exit_name_l0);

//data_scene_rando(rm);









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




