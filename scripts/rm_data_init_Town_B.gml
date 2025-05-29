/// rm_data_init_Town_B()


//     NPC_0 v1    Invisible
//     NPC_0 v2    Town Sign
//     NPC_0 v3    Mirror
//     NPC_0 v4    Fountain
//     NPC_0 v5    Stone head
//     NPC_0 v6    Plaque

//     NPC_1 v1    Idle Simple

//     NPC_2 v1    Traffic

//     NPC_3 v1    Special Walker
//     NPC_3 v2    Special Walker
//     NPC_3 v3    Special Walker
//     NPC_3 v4    Special Walker

//     NPC_4 v1    Life
//     NPC_4 v2    Magic
//     NPC_4 v3    Save

//     NPC_5 v1    Quest

//     NPC_6 v1    Skill Knight Downthrust
//     NPC_6 v2    Skill Knight Upthrust

//     NPC_7 v1    Spell Giver

//     NPC_9 v1    Bagu
//     NPC_9 v2    Riverman
//     NPC_9 v3    Moblin NPC
//     NPC_9 v4    Ache NPC
//     NPC_9 v5    Bot NPC
//     NPC_9 v6    Error
//     NPC_9 v7    Error's friend
//     NPC_9 v8    //
//     NPC_9 v9    Midus
//     NPC_9 vA    Anju's friend 1
//     NPC_9 vB    Anju
//     NPC_9 vC    Anju's friend 2
//     NPC_9 vD    Town fairy requesting rescue of Rescue Fairy
//     NPC_9 vE    Boulder circle hint

//     NPC_A v1    Triforce Keeper

//     NPC_B v1    Shop, Minigame

//     NPC_Z v1     Zelda

//     NPC_ v



var _i, _a,_b, _val, _dist;
var _x,_x1,_x2,_y,_yt,_y2,_y3, _w,_w2,_w3, _h,_h2,_h3;
var _clm,_clm2, _row,_row2, _clms,_rows;
var _str1,_str2,_str3;
var _pi, _obj,_ver;
var _file, _exit, _open, _owrc;
var _rm;
var _page,_pages,_pages_x,_pages_y;
var _page  = 0;
var _pages = 0;
var _data  = 0;
var _dk;
var _dk_CONTINUE = STR_Continue+STR_Exit+STR_Town+STR_Num;
var _tsrc;
var _CLOUD_RC1  = $0600;
var _CLOUD_RC2  = $0800;
var _cloud_rc   = $0000;
var _CLOUD_RC_NEWK = _CLOUD_RC2;
var _depth;
var _DEPTH1 = DEPTH_NPC2;
var _PI1    = global.PI_MOB_BLU; // For skulls
var _COLOR1_= p.CI_CYN4_;
/*
var _Recover_NPC_HP = STR_Girubokku;
var _Recover_NPC_MP = STR_Daira;
//var _Recover_NPC_MP = STR_Octorok;
var _Save_NPC       = STR_Aneru;
//var _Recover_NPC_HP = STR_Daira;
//var _Recover_NPC_MP = STR_Goriya;
//var _Save_NPC       = STR_Geru;
*/




var _spell  = 0;
var _dlg    = 0;






// NOTE: 19 characters(including spaces) fits, but is tight.
// Therefore, 18 characters will be the limit.

var _MapAreaName_RAURU              = "RAURU";
var _MapAreaName_RUTO               = "RUTO";
var _MapAreaName_SARIA              = "SARIA";
var _MapAreaName_MIDO               = "MIDO";
var _MapAreaName_NABOORU            = "NABOORU";
var _MapAreaName_DARUNIA            = "DARUNIA";
var _MapAreaName_NEW_KASUTO         = "NEW KASUTO";
var _MapAreaName_KASUTO             = "KASUTO";
var _MapAreaName_BULBLIN            = "BULBLIN";

var _area_name = _MapAreaName_BULBLIN;









// ================================================================
area = area_TB; 

town_num =  9; // 9: Monster town
dark_id  = -1; // 
ow_axis  = $0; // ow_axis bits: $0:horizontal, $1:vertical, $2:flip x/yscale

owrc0   = g.OWRC_TOWN_BULB1;
owrc0   = -1;
mus1    = MUS_HOUSE1;


















//   --------------------------  00  --------------------------- 
//      Bulblin 1.  Outside, Left end.  
_town_name1 = STR_Bulblin;
rm_num  = $00;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+_COLOR1_, STR_Tile+area+'000', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+_MapAreaName_BULBLIN);


                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
y5=((row0+$16)<<3)+4; _y     = hex_str((y5>>8)&$FF)+hex_str((y5>>0)&$FF);
x5=($15<<3)+4;        _data  = hex_str((x5>>8)&$FF)+hex_str((x5>>0)&$FF) + _y;
x5=($3F<<3)+4;        _data += hex_str((x5>>8)&$FF)+hex_str((x5>>0)&$FF) + _y;
x5=($42<<3)+4;        _data += hex_str((x5>>8)&$FF)+hex_str((x5>>0)&$FF) + _y;
x5=($71<<3)+4;        _data += hex_str((x5>>8)&$FF)+hex_str((x5>>0)&$FF) + _y;
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,1,AdditionalBGGraphics_init,  _PI1,  spr_Skull_2a_WRB,0,DEPTH_BG7-1,_data);

row3=row0+$17; y3=row3<<3;
row4=row0+$11; y4=row4<<3;
data_spawn(rm+STR_PRIO,SpGrA,$1,  $00<<3,$00<<3); // GruntSpawner  1 
data_spawn(rm+STR_PRXM,GeruB,$2,  $28<<3,y4,  STR_Clms+hex_str($0C)); // RockGeru  2
data_spawn(rm+STR_PRXM,GeruB,$2,  $48<<3,y4,  STR_Clms+hex_str($08)); // RockGeru  2
data_spawn(rm+STR_PRXM,GeruB,$2,  $60<<3,y4,  STR_Clms+hex_str($0C)); // RockGeru  2
data_spawn(rm+STR_PRXM,Moa_B,$1,  clm1<<3,(row0+$07)<<3); // FieryMoa  1
data_spawn(rm+STR_PRXM,Moa_A,$2,  $10<<3,(row0+$0B)<<3); // Moa 2
data_spawn(rm+STR_PRXM,Moa_A,$2,  $30<<3,(row0+$11)<<3); // Moa 2
data_spawn(rm+STR_PRXM,Moa_A,$2,  $50<<3,(row0+$0F)<<3); // Moa 2
data_spawn(rm+STR_PRXM,Moa_A,$2,  $70<<3,(row0+$07)<<3); // Moa 2

clm4=$2E; clm5=$1E;
data_spawn(rm+STR_PRIO,SpNPA,$1,  0,0);
data_spawn(rm+STR_PRIO,NPC_0,$2,  $0C<<3,y3,  dk_PI+hex_str(global.PI_BGR4),STR_Dialogue+DK0040); // Sign
data_spawn(rm+STR_PRXM,NPC_3,$1,  $6C<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0340,STR_Sprite+STR_Moa); // Special Walker, 
data_spawn(rm+STR_PRIO,NPC_4,$2,  $66<<3,y3,  dk_PI+hex_str(PIa),STR_Dialogue+DK0441,STR_Sprite+STR_Daira); // Restore MP
data_spawn(rm+STR_PRIO,NPC_4,$3,  clm5<<3,y3+$10,  dk_PI+hex_str(PId),STR_Dialogue+DK0442,STR_Sprite+STR_Aneru); // Save


_exit=data_exit(EXM0,etB0,0,  clm5+4,row3,  CLMS2,ROWS2,  clm5+5,row3,  rm_num_+EXM0_); // MID 0, Gameover-Continue spawn in front of save house.
g.dm_town[?CONTINUE_DATAKEY+hex_str(town_num)] = _exit;
      data_exit(EXM1,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4+1,row3,  '40'+EXR0_,-1,  global.PI_BGR3); // MID 1, 
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
g.dm_rm[?_town_name1+STR_Rando+STR_Town+"_End"+STR_Exit+"_Left"] = _exit;
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '01'+EXL0_); // RGT 0, 











//   --------------------------  01  --------------------------- 
//      Bulblin 2.  Outside, Mid 1.  
_town_name1 = STR_Bulblin;
rm_num  = $01;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+_COLOR1_, STR_Tile+area+'001', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+_MapAreaName_BULBLIN);


                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
y5=((row0+$16)<<3)+4; _y     = hex_str((y5>>8)&$FF)+hex_str((y5>>0)&$FF);
x5=($23<<3)+4;        _data  = hex_str((x5>>8)&$FF)+hex_str((x5>>0)&$FF) + _y;
x5=($2B<<3)+4;        _data += hex_str((x5>>8)&$FF)+hex_str((x5>>0)&$FF) + _y;
x5=($2E<<3)+4;        _data += hex_str((x5>>8)&$FF)+hex_str((x5>>0)&$FF) + _y;
x5=($5C<<3)+4;        _data += hex_str((x5>>8)&$FF)+hex_str((x5>>0)&$FF) + _y;
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,1,AdditionalBGGraphics_init,  _PI1,  spr_Skull_2a_WRB,0,DEPTH_BG7-1,_data);

row3=row0+$17; y3=row3<<3;
row4=row0+$11; y4=row4<<3;
data_spawn(rm+STR_PRIO,SpGrA,$1,  $00<<3,$00<<3); // GruntSpawner  1 
data_spawn(rm+STR_PRXM,GeruB,$2,  $12<<3,y4,  STR_Clms+hex_str($0A)); // RockGeru  2
data_spawn(rm+STR_PRXM,GeruB,$2,  $3E<<3,y4,  STR_Clms+hex_str($1A)); // RockGeru  2
data_spawn(rm+STR_PRXM,GeruB,$2,  $62<<3,y4,  STR_Clms+hex_str($0E)); // RockGeru  2
data_spawn(rm+STR_PRXM,Moa_B,$1,  clm1<<3,(row0+$07)<<3); // FieryMoa  1
data_spawn(rm+STR_PRXM,Moa_A,$2,  $10<<3,(row0+$0B)<<3); // Moa 2
data_spawn(rm+STR_PRXM,Moa_A,$2,  $30<<3,(row0+$11)<<3); // Moa 2
data_spawn(rm+STR_PRXM,Moa_A,$2,  $50<<3,(row0+$0F)<<3); // Moa 2
data_spawn(rm+STR_PRXM,Moa_A,$2,  $70<<3,(row0+$07)<<3); // Moa 2

data_spawn(rm+STR_PRIO,SpNPA,$1,  $00<<3,y3);
data_spawn(rm+STR_PRXM,NPC_3,$2,  $48<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0341,STR_Sprite+STR_Stalfos); // Special Walker, 
data_spawn(rm+STR_PRIO,NPC_4,$1,  $16<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0440,STR_Sprite+STR_Girubokku); // Restore HP


clm4=$36; clm5=$66;
data_exit(EXM0,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4+1,row3,  '41'+EXL0_,-1,  global.PI_BGR3); // MID 0, 
data_exit(EXM1,etB0,1,  clm5,row3,  CLMS2,ROWS2,  clm5+1,row3,  '42'+EXL0_,-1,  global.PI_BGR3); // MID 1, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '00'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '02'+EXL0_); // RGT 0, 












//   --------------------------  02  --------------------------- 
//      Bulblin 3.  Outside, Right end.  
_town_name1 = STR_Bulblin;
rm_num  = $02;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+_COLOR1_, STR_Tile+area+'002', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+_MapAreaName_BULBLIN);


                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
y5=((row0+$16)<<3)+4; _y     = hex_str((y5>>8)&$FF)+hex_str((y5>>0)&$FF);
x5=($26<<3)+4;        _data  = hex_str((x5>>8)&$FF)+hex_str((x5>>0)&$FF) + _y;
x5=($48<<3)+4;        _data += hex_str((x5>>8)&$FF)+hex_str((x5>>0)&$FF) + _y;
x5=($4C<<3)+4;        _data += hex_str((x5>>8)&$FF)+hex_str((x5>>0)&$FF) + _y;
x5=($65<<3)+4;        _data += hex_str((x5>>8)&$FF)+hex_str((x5>>0)&$FF) + _y;
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,1,AdditionalBGGraphics_init,  _PI1,  spr_Skull_2a_WRB,0,DEPTH_BG7-1,_data);

row3 = row0+$17;
y3   = row3<<3;
y4   =(row0+$11)<<3;
data_spawn(rm+STR_PRIO,SpGrA,$1,  $00<<3,$00<<3); // GruntSpawner  1 
data_spawn(rm+STR_PRXM,GeruB,$2,  $16<<3,y4,  STR_Clms+hex_str($0A)); // RockGeru  2
data_spawn(rm+STR_PRXM,GeruB,$2,  $2E<<3,y4,  STR_Clms+hex_str($0E)); // RockGeru  2
data_spawn(rm+STR_PRXM,GeruB,$2,  $52<<3,y4,  STR_Clms+hex_str($0E)); // RockGeru  2
data_spawn(rm+STR_PRXM,Moa_B,$1,  clm1<<3,(row0+$07)<<3); // FieryMoa  1
data_spawn(rm+STR_PRXM,Moa_A,$2,  $10<<3,(row0+$0B)<<3); // Moa 2
data_spawn(rm+STR_PRXM,Moa_A,$2,  $30<<3,(row0+$11)<<3); // Moa 2
data_spawn(rm+STR_PRXM,Moa_A,$2,  $50<<3,(row0+$0F)<<3); // Moa 2
data_spawn(rm+STR_PRXM,Moa_A,$2,  $70<<3,(row0+$07)<<3); // Moa 2

clm4=$38; clm5=$1A;
data_spawn(rm+STR_PRIO,SpNPA,$1,  $00<<3,y3);
data_spawn(rm+STR_PRIO,NPC_0,$2,  $76<<3,y3,  dk_PI+hex_str(global.PI_BGR4),STR_Dialogue+DK0040); // Sign
data_spawn(rm+STR_PRIO,NPC_1,$1,  $40<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0142,STR_Sprite+STR_Acheman); // Idle Simple, 
data_spawn(rm+STR_PRXM,NPC_3,$3,  $4A<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0342,STR_Sprite+STR_Girubokku); // Special Walker, 
data_spawn(rm+STR_PRIO,NPC_5,$1,  clm5<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0540,STR_Sprite+STR_Daira,STR_Quest+STR_ID+QuestID_Bulblin_Spell); // Quest


                _a=EXM0;
      data_exit(_a++,etB0,0,  clm5,row3,  CLMS2,ROWS2,  clm5-1,row3,  '50'+EXL0_); // MID 1, Quest
      data_exit(_a++,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4+1,row3,  '43'+EXR0_,-1,  global.PI_BGR3); // MID 0, 
      data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '01'+EXR0_); // LFT 0, 
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld
g.dm_rm[?_town_name1+STR_Rando+STR_Town+"_End"+STR_Exit+"_Right"] = _exit;











//   --------------------------  03  --------------------------- 
//      
rm_num  = $03;












//   --------------------------  04  --------------------------- 
//      
rm_num  = $04;












//   --------------------------  05  --------------------------- 
//      
rm_num  = $05;












//   --------------------------  06  --------------------------- 
//      
rm_num  = $06;












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












//   --------------------------  1C  --------------------------- 
//      
rm_num  = $1C;












//   --------------------------  1D  --------------------------- 
//      
rm_num  = $1D;












//   --------------------------  1E  --------------------------- 
//      
rm_num  = $1E;












//   --------------------------  1F  --------------------------- 
//      
rm_num  = $1F;












//   --------------------------  20  --------------------------- 
//      
rm_num  = $20;












//   --------------------------  21  --------------------------- 
//      
rm_num  = $21;












//   --------------------------  22  --------------------------- 
//      
rm_num  = $22;












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












// =============================================================================================
// =============================================================================================
dark_id = -1;
//   --------------------------  40  --------------------------- 
//      
rm_num  = $40;
set_rm_data(area+hex_str(rm_num), mus1, STR_Tile+area_TB+'060', STR_ow_axis+hex_str(ow_axis), STR_Town+STR_Bulblin, MapAreaName_DATAKEY+_MapAreaName_BULBLIN);
g.dm_rm[?rm+STR_House] = true;


row3=row0+$17; y3=row3<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  ($14<<3)+4,(row3+$01)<<3,  dk_PI+hex_str(global.PI_BGR4),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,NPC_1,$1,  $0B<<3,y3,  dk_PI+hex_str(PIc),STR_Dialogue+DK0141,STR_Sprite+STR_Octorok); // Idle Simple, 


_exit = '00'+EXM1_;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  _exit); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  _exit); // RGT 0, 












//   --------------------------  41  --------------------------- 
//      
rm_num  = $41;
set_rm_data(area+hex_str(rm_num), mus1, STR_Tile+area_TB+'061', STR_ow_axis+hex_str(ow_axis), STR_Town+STR_Bulblin, MapAreaName_DATAKEY+_MapAreaName_BULBLIN);
g.dm_rm[?rm+STR_House] = true;


row3=row0+$17; y3=row3<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  ($10<<3)+4,(row3+$01)<<3,  dk_PI+hex_str(global.PI_BGR4),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,NPC_9,$8,  ($0D<<3)-4,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0940,STR_Sprite+STR_Moblin); // Idle Special,  Scroblin


clm4=$16; _a=EXM0;
data_exit(_a++,etB0,0,  clm4,row3,  CLMS2,ROWS2,  clm4-1,row3,  '64'+EXL0_,-1,  global.PI_BGR4); // MID 0, Path to Ganon Tower
_exit = '01'+EXM0_;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  _exit); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  _exit); // RGT 0, 












//   --------------------------  42  --------------------------- 
//      
rm_num  = $42;
set_rm_data(area+hex_str(rm_num), mus1, STR_Tile+area_TB+'062', STR_ow_axis+hex_str(ow_axis), STR_Town+STR_Bulblin, MapAreaName_DATAKEY+_MapAreaName_BULBLIN);
g.dm_rm[?rm+STR_House] = true;


row3=row0+$17; y3=row3<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  ($0D<<3)+4,(row3+$01)<<3,  dk_PI+hex_str(global.PI_BGR4),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,NPC_9,$F,  $16<<3,(row0+$10)<<3,  dk_PI+hex_str(PIc),STR_Dialogue+DK0941,STR_Sprite+STR_Ache); // Idle Simple, 


_exit = '01'+EXM1_;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  _exit); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  _exit); // RGT 0, 












//   --------------------------  43  --------------------------- 
//      
rm_num  = $43;
set_rm_data(area+hex_str(rm_num), mus1, STR_Tile+area_TB+'063', STR_ow_axis+hex_str(ow_axis), STR_Town+STR_Bulblin, MapAreaName_DATAKEY+_MapAreaName_BULBLIN);
g.dm_rm[?rm+STR_House] = true;


row3=row0+$17; y3=row3<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  ($17<<3)+4,(row3+$01)<<3,  dk_PI+hex_str(global.PI_BGR4),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,NPC_1,$1,  $0B<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0140,STR_Sprite+STR_Acheman,STR_Depth+string(_DEPTH1)); // Idle Simple, 


_exit = '02'+EXM1_;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  _exit); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  _exit); // RGT 0, 












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
//      Quest house,  SUMMON Spell
rm_num  = $50;
set_rm_data(area+hex_str(rm_num), mus1, STR_Tile+area_TB+'078', STR_ow_axis+hex_str(ow_axis), STR_Town+STR_Bulblin, MapAreaName_DATAKEY+_MapAreaName_BULBLIN);
g.dm_rm[?rm+STR_House] = true;


row3=row0+$17; y3=row3<<3;


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '02'+EXM0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '60'+EXL0_); // RGT 0, 












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
//      Quest basement,  SUMMON Spell
rm_num  = $60;
set_rm_data(area+hex_str(rm_num), mus1, STR_Tile+area_TB+'096', STR_ow_axis+hex_str(ow_axis), STR_Town+STR_Bulblin, MapAreaName_DATAKEY+_MapAreaName_BULBLIN);


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_7,$1,  $37<<3,y3-($02<<3),  dk_PI+hex_str(PId),STR_Dialogue+DK0740,STR_Sprite+STR_Zant, STR_Spell+STR_ID+hex_str(SPL_SUMM)); // SUMMON


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0B,  '50'+EXR0_); // LFT 0, 

g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_Bulblin] = rm;












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
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TB+'098', STR_View+'00', STR_ow_axis+hex_str(0), STR_show_ow_pos+'00', STR_Town+STR_Bulblin, MapAreaName_DATAKEY+_MapAreaName_BULBLIN);


row3=$08; y3=row3<<3;
row4=$36; y4=row4<<3;


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '41'+EXM0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  area_EA+'B0'+EXL0_); // RGT 0, 








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
















//  ================================================================







