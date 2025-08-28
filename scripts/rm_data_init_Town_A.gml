


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
var _pi, _obj,_ver;
var _PI1 = global.PI_BGR1;
var _PI2 = global.PI_BGR2;
var _PI3 = global.PI_BGR3;
var _PI4 = global.PI_BGR4;
var _PI5 = global.PI_BGR4; // For town fast travel room torches only
//var _PI5 = global.PI_BGR3; // For town fast travel room torches only
//var _PI5 = global.PI_MOB_PUR; // For town fast travel room torches only
var _file, _open, _owrc, _name;
var _exit,_exit1,_exit2;
var _rm;
var _page,_pages,_pages_x,_pages_y;
var _page  = 0;
var _pages = 0;
var _data  = 0;
var _dk, _datakey, _dialogue_datakey;
var _tsrc;
var _CLOUD_RC1  = $0600;
var _CLOUD_RC2  = $0800;
var _cloud_rc   = $0000;
var _CLOUD_RC_NEWK = _CLOUD_RC2;
var _DEPTH1 = DEPTH_NPC2;
var _town_name1,_town_name2;
var _town_num=0;
var _ow_axis=0;
var _dark_idx = -1;



var _spell  = 0;
var _dialogue_datakey    = 0;











area     = area_TA; 

dark_id  =  0; //  
ow_axis  = $0; // ow_axis bits: $0:horizontal, $1:vertical, $2:flip x/yscale








//   --------------------------  00  --------------------------- 
//                  Kings Tomb, Outside   ***Moved to WestA_24
rm_num  = $00; 
rm_name = area + hex_str(rm_num);







//  ------------------------  RAURU  -----------------------------
ow_axis=$0; // ow_axis bits: $0:horizontal, $1:vertical, $2:flip x/yscale
//   --------------------------  01  --------------------------- 
//                  Rauru West 
_town_name1 = STR_Rauru;
rm_num  = $01;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR2_, STR_Tile+area_TA+'000', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_RAURU);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


row3=row0+$17; y3=row3<<3;
row4=row3+$02; y4=row4<<3;
row5=row0+$1A; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), _CLOUD_RC1, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($17<<3)+0,y5);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($42<<3)+4,y5);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($73<<3)+4,y5);
data_spawn(rm+STR_PRIO,NPC_0,$2,  $07<<3,y3,  dk_PI+hex_str(global.PI_BGR4),STR_Dialogue+DK0000); // Sign 
data_spawn(rm+STR_PRIO,NPC_1,$1,  $2F<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0102,STR_Sprite+STR_Joey, STR_Rando+STR_Hint); // kid w/ CANDLE directions
data_spawn(rm+STR_PRXM,NPC_3,$4,  $32<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK030B,STR_Sprite+STR_Jill, STR_Rando+STR_Hint); // Special Walker, Thin lady, Purple
data_spawn(rm+STR_PRIO,NPC_5,$1,  $44<<3,y3,  STR_Dialogue+DK0500,STR_Sprite+STR_Zoey,STR_Quest+STR_ID+QuestID_Rauru_Spell); // Quest
data_spawn(rm+STR_PRXM,NPC_3,$3,  $74<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0306,STR_Sprite+STR_Bill, STR_Rando+STR_Hint); // Special Walker, Thin man, Red
data_spawn(rm+STR_PRIO,NPC_4,$2,  $6C<<3,y3,  dk_PI+hex_str(PIa),STR_Dialogue+DK0402,STR_Sprite+STR_Barb); // Restore MP
data_spawn(rm+STR_PRIO,SpNPA,$1,  $1E<<3,y3);

clm3=$18; clm4=$26; clm5=$44;
//data_spawn(rm+STR_PRIO,TorchA,$3,  ((clm4-$02)<<3)+4,y3-4,  dk_PI+hex_str(global.PI_BGR4),STR_Lit); // v3: shorter torch. Fast travel house indicator


                _a=EXM0;
      data_exit(_a++,etB0,1,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  '75'+EXR0_); // MID 0, 
_exit=data_exit(_a++,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4+1,row3,  'B2'+EXU0_); // MID 1,  fast travel
_datakey = _town_name1+dk_FastTravel+STR_Exit+'A';
g.dm_rm[?_exit+dk_FastTravel+STR_Exit+STR_Datakey] = _datakey;
g.dm_rm[?_datakey] = _exit;
g.dm_rm[?_exit+"_Draw"+STR_Open+STR_Exit] = true;
      data_exit(_a++,etB0,0,  clm5,row3,  CLMS2,ROWS2,  clm5-1,row3,  '50'+EXL0_); // MID 2,  
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0);          // LFT 0, to Overworld 
g.dm_rm[?_town_name1+STR_Rando+STR_Town+"_End"+STR_Exit+"_Left"] = _exit;
      data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '02'+EXL0_); // RGT 0, 
//







//   --------------------------  02  --------------------------- 
//                  Rauru East 
_town_name1 = STR_Rauru;
rm_num  = $02;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR2_, STR_Tile+area_TA+'001', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_RAURU);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


clm3=$58;
row3=row0+$17; y3=row3<<3;
row5=row0+$1A; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), _CLOUD_RC1, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($12<<3)+4,y5);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($6C<<3)+4,y5);
data_spawn(rm+STR_PRIO,SpNPA,$1,  $1E<<3,y3); // NPC Spawner
data_spawn(rm+STR_PRIO,NPC_0,$2,  $6A<<3,y3,  dk_PI+hex_str(global.PI_BGR4),STR_Dialogue+DK0000); // Sign
data_spawn(rm+STR_PRIO,NPC_1,$1,  $0D<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0111,STR_Sprite+STR_Mary, STR_Rando+STR_Hint); // Idle Simple, Big lady, Purple. HEART Hint
data_spawn(rm+STR_PRIO,NPC_1,$1,  $44<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0109,STR_Sprite+STR_Barb, STR_Rando+STR_Hint); // Idle Simple, Old lady, Red
data_spawn(rm+STR_PRIO,NPC_4,$1,  $1A<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0400,STR_Sprite+STR_Jill); // Restore HP
data_spawn(rm+STR_PRIO,NPC_4,$3,  clm3<<3,y3,  STR_Dialogue+DK0404,STR_Sprite+STR_Zoey); // Save


clm4  = $38;
clm3 += 4;      _a = EXM0;
_exit=data_exit(_a++,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4+1,row3,  '41'+EXR0_); // MID 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'A'] = _exit;
_exit=data_exit(_a++,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  rm_num_+hex_str(_a-1)); // MID, Gameover-Continue spawn in front of save house.
g.dm_town[?CONTINUE_DATAKEY+hex_str(town_num)] = _exit;
      data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '01'+EXR0_); // LFT 0, 
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0);          // RGT 0, to Overworld 
g.dm_rm[?_town_name1+STR_Rando+STR_Town+"_End"+STR_Exit+"_Right"] = _exit;
//











//  ------------------------  RUTO  -----------------------------
ow_axis=$0; // ow_axis bits: $0:horizontal, $1:vertical, $2:flip x/yscale
//   --------------------------  03  --------------------------- 
//     Ruto, backside. Outside. Entrance to N Mtns.
_town_name1 = STR_Ruto;
rm_num  = $03;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR3_, STR_Tile+area_WA+'241', STR_ow_axis+hex_str(ow_axis^$1), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_RUTO);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


row4=row0+$17;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
data_spawn(rm+STR_PRIO,NPC_0,$2,  $1C<<3,row4<<3,  dk_PI+hex_str(Sign_PI),STR_Dialogue+DK0018); // Sign
//data_spawn(rm+STR_PRXM,Bot_A,$2,  $14<<3,(row0+$13)<<3); // Bot  2 


      data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$01,  area_WA+"FF"+EXR0_); // LFT 0, 
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row4,  "42"+EXL0_); // RGT 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'D'] = _exit;

g.dm_rm[?rm+STR_Rando+dk_LandLocked] = true;









//   --------------------------  04  --------------------------- 
//                  Ruto West 
_town_name1 = STR_Ruto;
rm_num  = $04;
rm_num_ = hex_str(rm_num);
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR2_, STR_Tile+area_TA+'002', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_RUTO);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


clm3=$2E; clm5=$66;
row3=row0+$17; y3=row3<<3;
row5=row0+$1A; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($44<<3)+0,y5);
data_spawn(rm+STR_PRIO,SpNPA,$1,  $1E<<3,y3);
data_spawn(rm+STR_PRIO,NPC_0,$2,  $10<<3,y3,  dk_PI+hex_str(Sign_PI),STR_Dialogue+DK0001); // Sign
data_spawn(rm+STR_PRIO,NPC_1,$1,  $1A<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0106,STR_Sprite+STR_Zoey, STR_Rando+STR_Hint); // Idle Simple, Pot lady, Purple
data_spawn(rm+STR_PRXM,NPC_3,$1,  $74<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0300,STR_Sprite+STR_Bill, STR_Rando+STR_Hint); // Special Walker, Thin man, Purple
data_spawn(rm+STR_PRIO,NPC_5,$1,  clm5<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0501,STR_Sprite+STR_Jill,STR_Quest+STR_ID+QuestID_Ruto_Spell); // Quest
data_spawn(rm+STR_PRIO,NPC_4,$3,  clm3<<3,y3,  STR_Dialogue+DK0404,STR_Sprite+STR_Zoey); // Save


clm3 += 4;
clm4  = $4C;    _a = EXM0;
_exit=data_exit(_a++,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4-1,row3,  '42'+EXR0_); // MID 0, to Ruto Mountains
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'A'] = _exit;
      data_exit(_a++,etB0,0,  clm5,row3,  CLMS2,ROWS2,  clm5-1,row3,  '51'+EXL0_); // MID 1, Quest
_exit=data_exit(_a++,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  rm_num_+hex_str(_a-1)); // MID, Gameover-Continue spawn in front of save house.
g.dm_town[?CONTINUE_DATAKEY+hex_str(town_num)] = _exit;
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0);          // LFT 0, to Overworld 
g.dm_rm[?_town_name1+STR_Rando+STR_Town+"_End"+STR_Exit+"_Left"] = _exit;
      data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '18'+EXL0_); // RGT 0, 
//








//   --------------------------  05  --------------------------- 
//                  Ruto East 
_town_name1 = STR_Ruto;
rm_num  = $05;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR2_, STR_Tile+area_TA+'029', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_RUTO);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


row3=row0+$17; y3=row3<<3;
row5=row0+$1A; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($14<<3)+0,(row0+$12)<<3);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($6A<<3)+4,y5);
data_spawn(rm+STR_PRIO,SpNPA,$1,  $1E<<3,y3);
data_spawn(rm+STR_PRIO,NPC_4,$2,  $2E<<3,y3,  dk_PI+hex_str(PIa),STR_Dialogue+DK0402,STR_Sprite+STR_Barb); // 
data_spawn(rm+STR_PRXM,NPC_3,$3,  $3C<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0307,STR_Sprite+STR_Mary, STR_Rando+STR_Hint); // 
data_spawn(rm+STR_PRIO,NPC_4,$1,  $62<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0400,STR_Sprite+STR_Jill); // 
data_spawn(rm+STR_PRIO,NPC_0,$2,  $6C<<3,y3,  dk_PI+hex_str(Sign_PI),STR_Dialogue+DK0001); // 


clm3=$46; clm4=clm3; clm5=$14;
//data_spawn(rm+STR_PRIO,TorchA,$3,  ((clm4-2)<<3)+4,y3-4,  dk_PI+hex_str(_PI3),STR_Lit); // v3: shorter torch. Fast travel house indicator


      data_exit(EXM0,etB0,1,  clm5,row3,  CLMS2,ROWS2,  clm5+1,row3,  '43'+EXL0_); // MID 0, to Error
_exit=data_exit(EXM1,etB0,1,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  'B6'+EXU0_); // MID 1, fast travel
_datakey = _town_name1+dk_FastTravel+STR_Exit+'A';
g.dm_rm[?_exit+dk_FastTravel+STR_Exit+STR_Datakey] = _datakey;
g.dm_rm[?_datakey] = _exit;
g.dm_rm[?_exit+"_Draw"+STR_Open+STR_Exit] = true;

      data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '18'+EXR0_); // LFT 0, 
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0);          // RGT 0, to Overworld 
g.dm_rm[?_town_name1+STR_Rando+STR_Town+"_End"+STR_Exit+"_Right"] = _exit;
//






//  ------------------------  SARIA  -----------------------------
ow_axis=$1|$2; // ow_axis bits: $0:horizontal, $1:vertical, $2:flip x/yscale
var _ROW_SARIA = $15;
//   --------------------------  06  --------------------------- 
//                  Saria River Crossing 
_town_name1 = STR_Saria;
rm_num  = $06;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR2_, STR_Tile+area_TA+'004', STR_OWRC+hex_str(g.OWRC_TOWN_SARI2), STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_SARIA);
g.dm_rm[?STR_Saria+STR_Bridge+STR_Scene] = rm;
g.dm_rm[?rm+STR_Rando+dk_LandLocked] = true;
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


x3=$14<<3;
row3=row0+_ROW_SARIA; y3=row3<<3;
row5=row0+$18; y5=row5<<3;
data_spawn_cutscene(Cutscene_SariaBridge,1, 0,0); // 
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($61<<3)+4,y5);
data_spawn(rm+STR_PRIO,NPC_0,$2,  x3,y3,  dk_PI+hex_str(global.PI_BGR2),STR_Dialogue+DK0002); // Sign


clm3=$32;
clm4=$5C;       _a=EXM0;
_exit=data_exit(_a++,etB0,1,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  '44'+EXR0_); // MID 0, 
      data_exit(_a++,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4-1,row3,  '45'+EXR0_); // MID 1, 
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0);          // LFT 0, to Overworld 
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '07'+EXL0_); // RGT 0, 
//







//   --------------------------  07  --------------------------- 
//                  Saria West 
_town_name1 = STR_Saria;
rm_num  = $07;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR2_, STR_Tile+area_TA+'005', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_SARIA);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


row3=row0+_ROW_SARIA; y3=row3<<3;
row5=row0+$18; y5=row5<<3;
                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($10<<3)+0,y5);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($53<<3)+0,y5-($01<<3));
data_NIAO_1a(rm+STR_NIAO+string(_a++), (row3<<8)|$0055, 1,Fountain_1_init);
//data_NIAO_1a(rm+STR_NIAO+string(_a++), (row3<<8)|$0055, 1,Fountain_1_init, global.PI_MOB_BLU,0);

data_spawn(rm+STR_PRIO,SpNPA,$1,  $1E<<3,y3); // NPC Spawner
data_spawn(rm+STR_PRIO,NPC_5,$1,  $2A<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0502,STR_Sprite+STR_Zoey,STR_Quest+STR_ID+QuestID_Saria_Spell); // Quest 
data_spawn(rm+STR_PRIO,NPC_4,$2,  $72<<3,y3,  dk_PI+hex_str(PIa),STR_Dialogue+DK0402,STR_Sprite+STR_Barb); // Restore MP
data_spawn(rm+STR_PRXM,NPC_3,$4,  $48<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK030C,STR_Sprite+STR_Mary, STR_Rando+STR_Hint); // Special Walker, Big lady, Purple


clm4=$2A; clm5=$12; clm6=$36;
                _a=EXM0;
      data_exit(_a++,etB0,1,  clm5,row3,  CLMS2,ROWS2,  clm5+1,row3,  '90'+EXL0_); // MID 0, Minigame 1
      data_exit(_a++,etB0,0,  clm4,row3,  CLMS2,ROWS2,  clm4+1,row3,  '52'+EXL0_); // MID 1, Quest
_exit=data_exit(_a++,etB0,1,  clm6,row3,  CLMS2,ROWS2,  clm6+1,row3,  '46'+EXL0_); // MID 2, Bot NPC
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'A'] = _exit;

_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '06'+EXR0_); // LFT 0, 
g.dm_rm[?_town_name1+STR_Rando+STR_Town+"_End"+STR_Exit+"_Left"] = _exit;

      data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '08'+EXL0_); // RGT 0, 
//








//   --------------------------  08  --------------------------- 
//                  Saria East 
_town_name1 = STR_Saria;
rm_num  = $08;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR2_, STR_Tile+area_TA+'006', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_SARIA);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


clm3=$56;
row3=row0+_ROW_SARIA; y3=row3<<3;
row5=row0+$18; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($4E<<3)+4,y5);
data_spawn(rm+STR_PRIO,SpNPA,$1,  $1E<<3,y3); // NPC Spawner
data_spawn(rm+STR_PRIO,NPC_4,$1,  $38<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0400,STR_Sprite+STR_Jill); // Restore HP
data_spawn(rm+STR_PRIO,NPC_1,$1,  $64<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0103,STR_Sprite+STR_Bill, STR_Rando+STR_Hint); // Idle Simple, Thin man, Red
data_spawn(rm+STR_PRIO,NPC_0,$2,  $74<<3,y3,  dk_PI+hex_str(Sign_PI),STR_Dialogue+DK0002); // Sign
data_spawn(rm+STR_PRIO,NPC_4,$3,  clm3<<3,y3,  STR_Dialogue+DK0404,STR_Sprite+STR_Zoey); // Save


clm3+=$04;  clm4=$2C;
//data_spawn(rm+STR_PRIO,TorchA,$3,  ((clm4-2)<<3)+4,y3-4,  dk_PI+hex_str(_PI3),STR_Lit); // v3: shorter torch. Fast travel house indicator


                _a=EXM0;
_exit=data_exit(_a++,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4+1,row3,  'BA'+EXU0_); // MID 0, fast travel
//_exit=data_exit(_a++,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4+1,row3,  'B8'+EXL0_); // MID 0, Bot NPC. fast travel
_datakey = _town_name1+dk_FastTravel+STR_Exit+'A';
g.dm_rm[?_exit+dk_FastTravel+STR_Exit+STR_Datakey] = _datakey;
g.dm_rm[?_datakey] = _exit;
g.dm_rm[?_exit+"_Draw"+STR_Open+STR_Exit] = true;

_exit=data_exit(_a++,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  rm_num_+hex_str(_a-1)); // MID, Gameover-Continue spawn in front of save house.
g.dm_town[?CONTINUE_DATAKEY+hex_str(town_num)] = _exit;

      data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '07'+EXR0_); // LFT 0, 
//
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0);          // RGT 0, to Overworld 
g.dm_rm[?_town_name1+STR_Rando+STR_Town+"_End"+STR_Exit+"_Right"] = _exit;











//  ------------------------  MIDO  -----------------------------
ow_axis=$1; // ow_axis bits: $0:horizontal, $1:vertical, $2:flip x/yscale
//   --------------------------  09  --------------------------- 
//                  Mido West 
_town_name1 = STR_Mido;
rm_num  = $09;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR2_, STR_Tile+area_TA+'007', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_MIDO);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


row3=row0+$17; y3=row3<<3;
row5=row0+$1A; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($29<<3)+4,y5);
data_spawn(rm+STR_PRIO,SpNPA,$1,  $1E<<3,y3);
data_spawn(rm+STR_PRIO,NPC_0,$2,  $10<<3,y3,  dk_PI+hex_str(Sign_PI),STR_Dialogue+DK0003); // Sign 
data_spawn(rm+STR_PRXM,NPC_3,$2,  $20<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0308,STR_Sprite+STR_Bill, STR_Rando+STR_Hint); // Special Walker, Thin man, Red
data_spawn(rm+STR_PRIO,NPC_5,$1,  $62<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0503,STR_Sprite+STR_Barb,STR_Quest+STR_ID+QuestID_Mido_Spell); // Quest 


clm3=$2C;
//data_spawn(rm+STR_PRIO,TorchA,$3,  ((clm3-$02)<<3)+4,y3-4,  dk_PI+hex_str(_PI3),STR_Lit); // v3: shorter torch. Fast travel house indicator
_exit=data_exit(EXM0,etB0,1,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  'BE'+EXU0_); // MID 0, to fast travel
_datakey = _town_name1+dk_FastTravel+STR_Exit+'A';
g.dm_rm[?_exit+dk_FastTravel+STR_Exit+STR_Datakey] = _datakey;
g.dm_rm[?_datakey] = _exit;
g.dm_rm[?_exit+"_Draw"+STR_Open+STR_Exit] = true;

clm4=$62;
      data_exit(EXM1,etB0,0,  clm4,row3,  CLMS2,ROWS2,  clm4-1,row3,  '53'+EXL0_); // MID 1, Quest
//
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0);          // LFT 0, to Overworld 
g.dm_rm[?_town_name1+STR_Rando+STR_Town+"_End"+STR_Exit+"_Left"] = _exit;
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0A'+EXL0_); // RGT 0, 









//   --------------------------  0A  --------------------------- 
//                  Mido Midtown 
_town_name1 = STR_Mido;
rm_num  = $0A;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR2_, STR_Tile+area_TA+'030', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_MIDO);
//set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR2_, STR_Tile+area_TA+'008', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_MIDO);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


row3=row0+$17; y3=row3<<3;
row5=row0+$1A; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($40<<3)+4,(row0+$10)<<3);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($77<<3)+0,y5);
data_spawn(rm+STR_PRIO,SpNPA,$1,  $1E<<3,y3); // NPC Spawner

g.dm_rm[?"MidoChurchDoor"+dk_DialogueDatakey] = DK0008;
data_spawn(rm+STR_PRIO,NPC_0,$1,  $3C<<3,y3,  STR_Dialogue+g.dm_rm[?"MidoChurchDoor"+dk_DialogueDatakey]); // Church door dlg
//g.DialogueDK_MIDO_CHURCH_DOOR = DK0008;
//data_spawn(rm+STR_PRIO,NPC_0,$1,  $3C<<3,y3,  STR_Dialogue+g.DialogueDK_MIDO_CHURCH_DOOR); // Church door dlg
data_spawn(rm+STR_PRXM,NPC_3,$1,  $52<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0301,STR_Sprite+STR_Joey, STR_Rando+STR_Hint); // Special Walker, Child, Purple


                _a=EXM0;  clm3=$3C; clm4=$62; clm5=$10;  row4=row0+$0D;
      data_exit(_a++,etB0,1,  clm3,row4,  CLMS2,ROWS2,  clm3+1,row4,  '5A'+EXL0_); // MID 0, Church door    top level
_exit=data_exit(_a++,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  '54'+EXL0_); // MID 1, Church door ground level
g.dm_rm[?_exit+"_Draw"+STR_Open+STR_Exit] = true;
g.dm_rm[?dk_MidoChurch+STR_Exit+STR_Name] = _exit;
//g.ExitName_MIDO_CHURCH = exit_name_m1;
_exit=data_exit(_a++,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4-1,row3,  '6F'+EXL0_); // MID 2, to Fairy friend of Rescue Fairy
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'A'] = _exit;
      data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '09'+EXR0_); // LFT 0, 
      data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0B'+EXL0_); // RGT 0, 
//








//   --------------------------  0B  --------------------------- 
//                  Mido East 
_town_name1 = STR_Mido;
rm_num  = $0B;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR2_, STR_Tile+area_TA+'009', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_MIDO);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


clm3=$62;
row3=row0+$17; y3=row3<<3;
row5=row0+$1A; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($50<<3)+0,y5);
data_spawn(rm+STR_PRIO,SpNPA,$1,  $1E<<3,y3); // NPC Spawner
data_spawn(rm+STR_PRIO,NPC_0,$2,  $72<<3,y3,  dk_PI+hex_str(Sign_PI),STR_Dialogue+DK0003); // Sign
data_spawn(rm+STR_PRXM,NPC_3,$4,  $26<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK030D,STR_Sprite+STR_Mary, STR_Rando+STR_Hint); // Special Walker, Big lady, Purple
data_spawn(rm+STR_PRIO,NPC_4,$2,  $32<<3,y3,  dk_PI+hex_str(PIa),STR_Dialogue+DK0402,STR_Sprite+STR_Barb); // Restore MP
data_spawn(rm+STR_PRIO,NPC_4,$1,  $46<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0400,STR_Sprite+STR_Jill); // Restore HP
data_spawn(rm+STR_PRIO,NPC_4,$3,  clm3<<3,y3,  STR_Dialogue+DK0404,STR_Sprite+STR_Zoey); // Save


                _a = EXM0;  clm4=$16; clm3+=$04;
      data_exit(_a++,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4+1,row3,  '48'+EXL0_); // MID 0, 
_exit=data_exit(_a++,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  rm_num_+hex_str(_a-1)); // MID, Gameover-Continue spawn in front of save house.
g.dm_town[?CONTINUE_DATAKEY+hex_str(town_num)] = _exit;
      data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0A'+EXR0_); // LFT 0, 
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0);          // RGT 0, to Overworld 
g.dm_rm[?_town_name1+STR_Rando+STR_Town+"_End"+STR_Exit+"_Right"] = _exit;











//  ------------------------  NABOORU  ---------------------------
ow_axis=$0; // ow_axis bits: $0:horizontal, $1:vertical, $2:flip x/yscale
//   --------------------------  0C  --------------------------- 
//                  Nabooru West 
_town_name1 = STR_Nabooru;
rm_num  = $0C; 
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR2_, STR_Tile+area_TA+'010', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_NABOORU);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


clm6=$14; clm7=clm6+$04;
row3=row0+$17; y3=row3<<3;
row5=row0+$1A; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($1F<<3)+0,y5);
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $1768,  1,Fountain_1_init);
//data_NIAO_1a(rm+STR_NIAO+string(_a++),  $1768,  1,Fountain_1_init,  global.PI_BGR3,0);
data_spawn(rm+STR_PRIO,SpNPA,$1,  $1E<<3,y3);
data_spawn(rm+STR_PRIO,NPC_0,$2,  $20<<3,y3,  dk_PI+hex_str(global.PI_BGR4),STR_Dialogue+DK0004); // Sign
data_spawn(rm+STR_PRXM,NPC_3,$3,  $4A<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0309,STR_Sprite+STR_Mary, STR_Rando+STR_Hint); // Special Walker, Big lady, Red
data_spawn(rm+STR_PRIO,NPC_1,$1,  $6C<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0107,STR_Sprite+STR_Zoey, STR_Rando+STR_Hint); // Idle Simple, Pot lady, Purple
data_spawn(rm+STR_PRIO,NPC_4,$3,  clm6<<3,y3,  STR_Dialogue+DK0405,STR_Sprite+STR_Zoey); // Save


clm3=$2A; clm4=$34; clm5=$52;
row4=row0+$09; // top of chimney
                _a=EXM0;
      data_exit(_a++,etB0,1,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  '6E'+EXL0_); // MID 0, 
      data_exit(_a++,etD0,1,  clm4,row4-$01,  CLMS3,ROWS2,  clm4+1,row4-$04,  '6E'+EXM0_); // MID 1, Chimney to 
_exit=data_exit(_a++,etB0,1,  clm5,row3,  CLMS2,ROWS2,  clm5-1,row3,  '49'+EXR0_); // MID 2, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'A'] = _exit;

_exit=data_exit(_a++,etB0,0,  clm7,row3,  CLMS2,ROWS2,  clm7+1,row3,  rm_num_+hex_str(_a-1)); // MID, Gameover-Continue spawn in front of save house.
g.dm_town[?CONTINUE_DATAKEY+hex_str(town_num)] = _exit;

_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0);          // LFT 0, to Overworld 
g.dm_rm[?_town_name1+STR_Rando+STR_Town+"_End"+STR_Exit+"_Left"] = _exit;

      data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0D'+EXL0_); // RGT 0, 
//









//   --------------------------  0D  --------------------------- 
//                  Nabooru Midtown 
rm_num  = $0D;
set_rm_data(area+hex_str(rm_num), STR_Nabooru, STR_Color+COLOR2_, STR_Tile+area_TA+'011', STR_ow_axis+hex_str(ow_axis), STR_Town+STR_Nabooru, MapAreaName_DATAKEY+MapAreaName_NABOORU);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


clm3=$60; clm4=$2A;
row3=row0+$17; y3=row3<<3;
row5=row0+$1A; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($42<<3)+0,y5-($01<<3));
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($5E<<3)+4,y5);
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $1744,  1,Fountain_1_init);
//data_NIAO_1a(rm+STR_NIAO+string(_a++),  $1744,  1,Fountain_1_init, global.PI_BGR3,0);
data_spawn(rm+STR_PRIO,SpNPA,$1,   $1E<<3,y3);
data_spawn(rm+STR_PRXM,NPC_3,$1,   $32<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0302,STR_Sprite+STR_Joey, STR_Rando+STR_Hint); // Special Walker, Child, Purple
data_spawn(rm+STR_PRIO,NPC_5,$1,  clm3<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0504,STR_Sprite+STR_Jill,STR_Quest+STR_ID+QuestID_Nabooru_Spell); // Quest 


data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3-1,row3,  '55'+EXL0_); // MID 0, Quest
data_exit(EXM1,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4-1,row3,  '89'+EXL0_); // MID 1, ITM_MAP1

data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0C'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '0E'+EXL0_); // RGT 0, 









//   --------------------------  0E  --------------------------- 
//                  Nabooru East 
_town_name1 = STR_Nabooru;
rm_num  = $0E;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR2_, STR_Tile+area_TA+'012', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_NABOORU);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


row3=row0+$17; y3=row3<<3;
row5=row0+$1A; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($29<<3)+4,y5);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($69<<3)+4,y5);
data_NIAO_1a(rm+STR_NIAO+string(_a++),  (row3<<8)|$46,  1,Fountain_1_init);
//data_NIAO_1a(rm+STR_NIAO+string(_a++),  (row3<<8)|$46,  1,Fountain_1_init,  global.PI_BGR3,0);
clm5=$38;
//data_spawn(rm+STR_PRIO,TorchA,$3,  ((clm5-$02)<<3)+4,y3-4,  dk_PI+hex_str(_PI3),STR_Lit); // v3: shorter torch. Fast travel house indicator
data_spawn(rm+STR_PRIO,SpNPA,$1,  $1E<<3,y3); // NPC Spawner
data_spawn(rm+STR_PRIO,NPC_1,$1,  $43<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0101,STR_Sprite+STR_Bill, STR_Rando+STR_Hint); // Idle Simple, Thin man, Purple. "WITH BOOTS I COULD WALK ON WATER"
data_spawn(rm+STR_PRIO,NPC_4,$2,  $1A<<3,y3,  dk_PI+hex_str(PIa),STR_Dialogue+DK0403,STR_Sprite+STR_Barb); // Restore MP
data_spawn(rm+STR_PRIO,NPC_4,$1,  $58<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0401,STR_Sprite+STR_Jill); // Restore HP
data_spawn(rm+STR_PRIO,NPC_0,$2,  $6C<<3,y3,  dk_PI+hex_str(global.PI_BGR4),STR_Dialogue+DK0004); // Sign


                _a=EXM0;
_exit=data_exit(_a++,etB0,1,  clm5,row3,  CLMS2,ROWS2,  clm5+1,row3,  'C2'+EXU0_); // MID 0, fast travel
_datakey = _town_name1+dk_FastTravel+STR_Exit+'A';
g.dm_rm[?_exit+dk_FastTravel+STR_Exit+STR_Datakey] = _datakey;
g.dm_rm[?_datakey] = _exit;
g.dm_rm[?_exit+"_Draw"+STR_Open+STR_Exit] = true;

      data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0D'+EXR0_); // LFT 0, 
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0);          // RGT 0, to Overworld 
g.dm_rm[?_town_name1+STR_Rando+STR_Town+"_End"+STR_Exit+"_Right"] = _exit;










//  ------------------------  DARUNIA  ---------------------------
ow_axis=$0; // ow_axis bits: $0:horizontal, $1:vertical, $2:flip x/yscale
//   --------------------------  0F  --------------------------- 
//                  Darunia West 
_town_name1 = STR_Darunia;
rm_num  = $0F;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR4_, STR_Tile+area_TA+'013', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_DARUNIA);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


row3=row0+$17; y3=row3<<3;
row5=row0+$1A; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($2F<<3)+0,y5);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($35<<3)+0,y5);
data_spawn(rm+STR_PRIO,NPC_0,$2,  $08<<3,y3,  dk_PI+hex_str(Sign_PI),STR_Dialogue+DK0005); // Sign
data_spawn(rm+STR_PRIO,NPC_1,$1,  $4C<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0104,STR_Sprite+STR_Joey, STR_Rando+STR_Hint); // Idle Simple, Child, Red
data_spawn(rm+STR_PRIO,NPC_5,$1,  $66<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0505,STR_Sprite+STR_Barb,STR_Quest+STR_ID+QuestID_Darunia_Spell); // Quest 
data_spawn(rm+STR_PRIO,SpNPA,$1,  $1E<<3,y3);


clm3=$66; clm4=$26;
      data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3-1,row3,  '56'+EXL0_); // MID 0, 
      data_exit(EXM1,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4+1,row3,  '7C'+EXL0_); // MID 1, 
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0);          // LFT 0, to Overworld 
g.dm_rm[?_town_name1+STR_Rando+STR_Town+"_End"+STR_Exit+"_Left"] = _exit;
      data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '10'+EXL0_); // RGT 0, 
//









//   --------------------------  10  --------------------------- 
//                  Darunia Midtown 
_town_name1 = STR_Darunia;
rm_num  = $10;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR4_, STR_Tile+area_TA+'014', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_DARUNIA);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


clm3=$46; clm4=$70;
row3=row0+$17; y3=row3<<3;
row5=row0+$1A; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($0D<<3)+0,y5);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($2E<<3)+4,y5);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($6D<<3)+4,y5);
data_spawn(rm+STR_PRIO,SpNPA,$1,  $1E<<3,y3); // NPC Spawner
data_spawn(rm+STR_PRXM,NPC_3,$1,  $4E<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0303,STR_Sprite+STR_Bill, STR_Rando+STR_Hint); // Special Walker, Thin man, Red
data_spawn(rm+STR_PRIO,NPC_0,$1,  clm4<<3,y3,  STR_Dialogue+DK0009); // Darunia door dlg 
data_spawn(rm+STR_PRIO,NPC_4,$3,  clm3<<3,y3,  STR_Dialogue+DK0405,STR_Sprite+STR_Zoey); // Save


clm5=$18; clm6=$1F; clm7=$56;
row4=row0+$0C; row5=row0+$05;
                _a=EXM0;
      data_exit(_a++,etD0,1,  clm4,row4,  CLMS3,ROWS2,  clm4+1,row4-$02,  '57'+EXM0_); // MID 0, Chimney to UPTHRUST 
      data_exit(_a++,etB0,0,  clm4,row3,  CLMS2,ROWS2,  clm4-1,row3,  '57'+EXL0_); // MID 1, UPTHRUST House front door
      data_exit(_a++,etB0,1,  clm5,row3,  CLMS2,ROWS2,  clm5+1,row3,  '91'+EXL0_); // MID 2, to Downstab bounce challenge minigame
      data_exit(_a++,etB0,0,  clm6,row5,  CLMS2,ROWS2,  clm6+0,row5,  '91'+EXR0_); // MID 3, to Downstab bounce challenge minigame. Top of game exit to chimney
//
_exit=data_exit(_a++,etB0,0,  clm7,row3,  CLMS2,ROWS2,  clm7-1,row3,  '4A'+EXR0_); // MID 4, to town backside
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'A'] = _exit;
g.dm_rm[?_exit+"_Draw"+STR_Open+STR_Exit] = true;

clm3+=$04;
_exit=data_exit(_a++,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  rm_num_+hex_str(_a-1)); // MID 4, Gameover-Continue spawn in front of save house.
g.dm_town[?CONTINUE_DATAKEY+hex_str(town_num)] = _exit;

      data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0F'+EXR0_); // LFT 0, 
      data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '11'+EXL0_); // RGT 0, 
//








//   --------------------------  11  --------------------------- 
//                  Darunia East 
_town_name1 = STR_Darunia;
rm_num  = $11;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR4_, STR_Tile+area_TA+'015', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_DARUNIA);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


row3=row0+$17; y3=row3<<3;
row5=row0+$1A; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($21<<3)+0,y5);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($63<<3)+4,y5);
data_spawn(rm+STR_PRIO,SpNPA,$1,  $1E<<3,y3);
data_spawn(rm+STR_PRIO,NPC_4,$2,  $12<<3,y3,  dk_PI+hex_str(PIa),STR_Dialogue+DK0403,STR_Sprite+STR_Barb); // Restore MP
data_spawn(rm+STR_PRIO,NPC_4,$1,  $32<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0401,STR_Sprite+STR_Jill); // Restore HP
data_spawn(rm+STR_PRXM,NPC_3,$4,  $58<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK030E,STR_Sprite+STR_Mary, STR_Rando+STR_Hint); // Special Walker, Big lady, Purple
data_spawn(rm+STR_PRIO,NPC_0,$2,  $70<<3,y3,  dk_PI+hex_str(Sign_PI),STR_Dialogue+DK0005); // 
clm3=$4A;
//data_spawn(rm+STR_PRIO,TorchA,$3,  ((clm3-2)<<3)+4,y3-4,  dk_PI+hex_str(_PI3),STR_Lit); // v3: shorter torch. Fast travel house indicator


_exit=data_exit(EXM0,etB0,1,  clm3,row3,  CLMS2,ROWS2,  clm3-1,row3,  'C6'+EXU0_); // MID 0, fast travel
_datakey = _town_name1+dk_FastTravel+STR_Exit+'A';
g.dm_rm[?_exit+dk_FastTravel+STR_Exit+STR_Datakey] = _datakey;
g.dm_rm[?_datakey] = _exit;
g.dm_rm[?_exit+"_Draw"+STR_Open+STR_Exit] = true;

      data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '10'+EXR0_); // LFT 0, 
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0);          // RGT 0, to Overworld 
g.dm_rm[?_town_name1+STR_Rando+STR_Town+"_End"+STR_Exit+"_Right"] = _exit;







//  ------------------------  NEW KASUTO  ------------------------
ow_axis=$0; // ow_axis bits: $0:horizontal, $1:vertical, $2:flip x/yscale
//   --------------------------  12  --------------------------- 
//                  New Kasuto West 
_town_name1 = STR_New_Kasuto;
rm_num  = $12;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR2_, STR_Tile+area_TA+'016', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_NEW_KASUTO);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


clm3=$12; clm4=$3A;
row3=row0+$17; y3=row3<<3;
row5=row0+$1A; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), _CLOUD_RC_NEWK, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($48<<3)+0,y5);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($6D<<3)+4,y5);
data_spawn(rm+STR_PRIO,SpNPA,$1,  $1E<<3,y3);
data_spawn(rm+STR_PRIO,NPC_0,$2,  $08<<3,y3,  dk_PI+hex_str(global.PI_BGR4),STR_Dialogue+DK0006); // Sign
data_spawn(rm+STR_PRIO,NPC_1,$1,  $22<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0108,STR_Sprite+STR_Zoey, STR_Rando+STR_Hint); // Idle Simple, Pot lady, Purple
data_spawn(rm+STR_PRXM,NPC_3,$2,  $58<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0305,STR_Sprite+STR_Bill, STR_Rando+STR_Hint); // Special Walker, Thin man, Red
data_spawn(rm+STR_PRIO,NPC_4,$2,  $6A<<3,y3,  dk_PI+hex_str(PIa),STR_Dialogue+DK0406,STR_Sprite+STR_Barb); // Restore MP
data_spawn(rm+STR_PRIO,NPC_5,$1,  clm4<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0506,STR_Sprite+STR_Barb,STR_Quest+STR_ID+QuestID_NewKasuto_Container); // Quest
data_spawn(rm+STR_PRIO,NPC_4,$3,  clm3<<3,y3,  STR_Dialogue+DK0405,STR_Sprite+STR_Zoey); // Save


                _a=EXM0; clm5=$4A; clm3+=$04; clm6=$2A;
      data_exit(_a++,etB0,0,  clm4,row3,  CLMS2,ROWS2,  clm4+1,row3,  '58'+EXL0_); // MID 0, Quest
//
_exit=data_exit(_a++,etB0,1,  clm5,row3,  CLMS2,ROWS2,  clm5-1,row3,  '4C'+EXR0_); // MID 1, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'A'] = _exit;

_exit=data_exit(_a++,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  rm_num_+hex_str(_a-1)); // MID 2, Gameover-Continue spawn in front of save house.
g.dm_town[?CONTINUE_DATAKEY+hex_str(town_num)] = _exit;

_exit=data_exit(_a++,etB0,0,  clm6,row3,  CLMS2,ROWS2,  clm6-1,row3,  rm_num_+hex_str(_a-1)); // MID 3, 
//_exit=data_exit(_a++,etB0,0,  clm6,row3,  CLMS2,ROWS2,  clm6-1,row3,  rm+EXL0_); // MID 3, 
_datakey = _town_name1+dk_FastTravel+STR_Exit+'A';
g.dm_rm[?_exit+dk_FastTravel+STR_Exit+STR_Datakey] = _datakey;
g.dm_rm[?_datakey] = _exit;
g.dm_rm[?_exit+"_Draw"+STR_Open+STR_Exit] = true;

_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0);          // LFT 0, to Overworld 
g.dm_rm[?_town_name1+STR_Rando+STR_Town+"_End"+STR_Exit+"_Left"] = _exit;

      data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '13'+EXL0_); // RGT 0, 
//






//   --------------------------  13  --------------------------- 
//                  New Kasuto East 
rm_num  = $13;
set_rm_data(area+hex_str(rm_num), STR_New_Kasuto, STR_Color+COLOR2_, STR_Tile+area_TA+'017', STR_ow_axis+hex_str(ow_axis), STR_Town+STR_New_Kasuto, MapAreaName_DATAKEY+MapAreaName_NEW_KASUTO);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


row3=row0+$17; y3=row3<<3;
row5=row0+$1A; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), _CLOUD_RC_NEWK, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($54<<3)+4,y5);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $1766, 1,Fountain_1_init);
//data_NIAO_1a(rm+STR_NIAO+string(_a++), $1766, 1,Fountain_1_init, global.PI_MOB_BLU,0);
data_spawn(rm+STR_PRIO,SpNPA,$1,  $1E<<3,y3);                    // NPC Spawner
data_spawn(rm+STR_PRXM,NPC_3,$3,  $2E<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK030A,STR_Sprite+STR_Bill, STR_Rando+STR_Hint); // 
data_spawn(rm+STR_PRXM,NPC_3,$1,  $6C<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0304,STR_Sprite+STR_Jack, STR_Rando+STR_Hint); // 
data_spawn(rm+STR_PRIO,NPC_4,$1,  $12<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0401,STR_Sprite+STR_Jill); // 


          _a=EXM0; clm4=$3A; clm5=$56;
data_exit(_a++,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4+1,row3,  '59'+EXL0_); // MID 0, 
data_exit(_a++,etB0,1,  clm5,row3,  CLMS2,ROWS2,  clm5-1,row3,  '88'+EXL0_); // MID 1, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '12'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '1A'+EXL0_); // RGT 0, 
//data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '14'+EXL0_); // RGT 0, 









//   --------------------------  14  --------------------------- 
//                  New Kasuto East End 
rm_num  = $14;
set_rm_data(area+hex_str(rm_num), STR_New_Kasuto, STR_Color+COLOR2_, STR_Tile+area_TA+'027', STR_ow_axis+hex_str(ow_axis^$1), STR_Town+STR_New_Kasuto, MapAreaName_DATAKEY+MapAreaName_NEW_KASUTO);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


clm3=$15; clm4=clm3+4;
row3=row0+$17; y3=row3<<3;
row5=row0+$1A; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), _CLOUD_RC_NEWK, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
data_spawn_cutscene(Cutscene_MagicalKeyHouse,1,  clm3<<3,(row0+$1B)<<3,  global.PI_BGR4,DEPTH_BG4);


_exit=data_exit(EXM0,etB0,0,  clm4,row3,  CLMS2,ROWS2,  clm4+1,row3,  '6A'+EXL0_); // MID 0, 
g.dm_rm[?dk_MagicalKeyHouse+dk_SceneName] = rm;
g.dm_rm[?dk_MagicalKeyHouse+dk_ExitName]  = _exit;
//g.MKH_RM_NAME   = rm;
//g.MKH_EXIT_NAME = _exit;
      data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '71'+EXR0_); // LFT 0, 
//









//  ------------------------  OLD KASUTO  ------------------------
ow_axis=$0; // ow_axis bits: $0:horizontal, $1:vertical, $2:flip x/yscale
var _FIRE_PI = global.PI_MOB_RED;
//   --------------------------  15  --------------------------- 
//                  Old Kasuto West 
_town_name1 = STR_Old_Kasuto;
rm_num  = $15;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR5_, STR_Tile+area_TA+'019', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_KASUTO);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;
_val = p.PAL_MOB_SET5;
dm_palette[?        rm+dk_MOB] = _val;
p.dm_scene_palette[?rm+dk_MOB] = _val;


row5=row0+$1A; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);

switch(g.mod_OldKasutoFire){
case 1:{// Fire is not harmful, just decoration.
data_NIAO_1a(rm+STR_NIAO+string(_a++), $191C, 1,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0B2C, 1,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $134A, 1,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0F4F, 2,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $1419, 3,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $1442, 3,Fire1_init, _FIRE_PI); // 
//data_spawn(rm+STR_PRXM,Moa_B,$1,  (clm1-1)<<3,(row0+$08)<<3); // FieryMoa  1
break;}
case 2:{// Fire IS harmful
data_spawn(rm+STR_PRIO,BlazA,$6,  $1C<<3,(row0+$19)<<3,  STR_Size+hex_str(3)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $2C<<3,(row0+$0B)<<3,  STR_Size+hex_str(3)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $4A<<3,(row0+$13)<<3,  STR_Size+hex_str(3)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $4F<<3,(row0+$0F)<<3,  STR_Size+hex_str(2)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $19<<3,(row0+$14)<<3,  STR_Size+hex_str(1)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $42<<3,(row0+$14)<<3,  STR_Size+hex_str(1)); // Blaze v6
break;}
}//switch(g.mod_OldKasutoFire)

data_spawn(rm+STR_PRXM,Moa_A,$2,  $10<<3,(row0+$17)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $14<<3,(row0+$13)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $30<<3,(row0+$15)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $34<<3,(row0+$13)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $50<<3,(row0+$15)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $54<<3,(row0+$13)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $70<<3,(row0+$15)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $70<<3,(row0+$17)<<3);

data_spawn(rm+STR_PRIO,NPC_0,$2,  $0C<<3,(row0+$17)<<3,  dk_PI+hex_str(Sign_PI),STR_Dialogue+DK0007); // Sign


clm3=$4E; clm4=$6A; row3=row0+$17;
      data_exit(EXM0,etB0,1,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  '4D'+EXR0_); // MID 0, 
_exit=data_exit(EXM1,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4-1,row3,  '4F'+EXR0_); // MID 1,  BRACELET Hint
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'A'] = _exit;

_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  0);            // LFT 0, to Overworld 
g.dm_rm[?_town_name1+STR_Rando+STR_Town+"_End"+STR_Exit+"_Left"] = _exit;

      data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '16'+EXL0_);   // RGT 0, 
//









//   --------------------------  16  --------------------------- 
//                  Old Kasuto Midtown 
_town_name1 = STR_Old_Kasuto;
rm_num  = $16;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR5_, STR_Tile+area_TA+'031', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_KASUTO);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;
_val = p.PAL_MOB_SET5;
dm_palette[?        rm+dk_MOB] = _val;
p.dm_scene_palette[?rm+dk_MOB] = _val;


row3=row0+$17; y3=row3<<3;
row5=row0+$1A; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);

switch(g.mod_OldKasutoFire){
case 1:{// Fire is not harmful, just decoration.
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0D20, 1,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0D4D, 1,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $112B, 2,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $1154, 2,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $146D, 3,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0C64, 3,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0E52, 3,Fire1_init, _FIRE_PI); // 
//data_spawn(rm+STR_PRXM,Moa_B,$1,  (clm1-1)<<3,(row0+$07)<<3); // FieryMoa  1
break;}
case 2:{// Fire IS harmful
data_spawn(rm+STR_PRIO,BlazA,$6,  $20<<3,(row0+$0D)<<3,  STR_Size+hex_str(3)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $4D<<3,(row0+$0D)<<3,  STR_Size+hex_str(3)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $2B<<3,(row0+$11)<<3,  STR_Size+hex_str(2)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $54<<3,(row0+$11)<<3,  STR_Size+hex_str(2)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $52<<3,(row0+$0E)<<3,  STR_Size+hex_str(1)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $64<<3,(row0+$0C)<<3,  STR_Size+hex_str(1)); // Blaze v6
break;}
}//switch(g.mod_OldKasutoFire)

data_spawn(rm+STR_PRXM,Moa_A,$2,  $10<<3,(row0+$17)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $14<<3,(row0+$13)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $30<<3,(row0+$13)<<3); 
//data_spawn(rm+STR_PRXM,Moa_A,$2,  $30<<3,(row0+$15)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $34<<3,(row0+$13)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $50<<3,(row0+$15)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $54<<3,(row0+$13)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $70<<3,(row0+$15)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $70<<3,(row0+$17)<<3);


clm3=$1A; clm4=$30; clm5=$3F; clm6=$62;
data_exit(EXM0,etB0,1,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  '5C'+EXL0_); // MID 0, HEART PIECE
data_exit(EXM1,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4+1,row3,  '7A'+EXL0_); // MID 1, 
data_exit(EXM2,etB0,1,  clm5,row3,  CLMS2,ROWS2,  clm5-1,row3,  '5B'+EXL0_); // MID 2, THUNDER
data_exit(EXM3,etB0,1,  clm6,row3,  CLMS2,ROWS2,  clm6-1,row3,  '5D'+EXR0_); // MID 3, 
//                                                                              // 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '15'+EXR0_);   // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '17'+EXL0_);   // RGT 0, 
/*
set_rm_data(area+hex_str(rm_num), STR_Old_Kasuto, STR_Color+COLOR5_, STR_Tile+area_TA+'020', STR_ow_axis+hex_str(ow_axis), STR_Town+STR_Old_Kasuto, MapAreaName_DATAKEY+MapAreaName_KASUTO);


                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init); // 

if (g.mod_OldKasutoFire==1){
data_NIAO_1a(rm+STR_NIAO+string(_a++), $1344, 1,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $1748, 1,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $1157, 2,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0B30, 2,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0A1C, 3,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0C32, 3,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $184B, 3,Fire1_init, _FIRE_PI); // 
//data_spawn(rm+STR_PRXM,Moa_B,$1,  (clm1-1)<<3,(row0+$07)<<3); // FieryMoa  1
}else if (g.mod_OldKasutoFire==2){
data_spawn(rm+STR_PRIO,BlazA,$6,  $44<<3,(row0+$13)<<3,  STR_Size+hex_str(3)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $48<<3,(row0+$17)<<3,  STR_Size+hex_str(3)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $57<<3,(row0+$11)<<3,  STR_Size+hex_str(2)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $30<<3,(row0+$0B)<<3,  STR_Size+hex_str(2)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $1C<<3,(row0+$0A)<<3,  STR_Size+hex_str(1)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $32<<3,(row0+$0C)<<3,  STR_Size+hex_str(1)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $4B<<3,(row0+$18)<<3,  STR_Size+hex_str(1)); // Blaze v6
}

data_spawn(rm+STR_PRXM,Moa_A,$2,  $10<<3,(row0+$17)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $14<<3,(row0+$13)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $30<<3,(row0+$15)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $34<<3,(row0+$13)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $50<<3,(row0+$15)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $54<<3,(row0+$13)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $70<<3,(row0+$15)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $70<<3,(row0+$17)<<3);


clm3=$14; clm4=$2E; clm5=$68; row3=row0+$17;
data_exit(EXM0,etB0,1,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  '4F'+EXR0_); // MID 0, 
data_exit(EXM1,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4+1,row3,  '7A'+EXL0_); // MID 1, 
data_exit(EXM2,etB0,1,  clm5,row3,  CLMS2,ROWS2,  clm5-1,row3,  '5B'+EXL0_); // MID 2, THUNDER
//                                                                              // 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '15'+EXR0_);   // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '1B'+EXL0_);   // RGT 0, 
*/









//   --------------------------  17  --------------------------- 
//                  Old Kasuto East 
_town_name1 = STR_Old_Kasuto;
rm_num  = $17;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR5_, STR_Tile+area_TA+'021', STR_ow_axis+hex_str(ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_KASUTO);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;
_val = p.PAL_MOB_SET5;
dm_palette[?        rm+dk_MOB] = _val;
p.dm_scene_palette[?rm+dk_MOB] = _val;


row5=row0+$1A; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);

switch(g.mod_OldKasutoFire){
case 1:{// Fire is not harmful, just decoration.
data_NIAO_1a(rm+STR_NIAO+string(_a++), $1338, 1,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0D2A, 1,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $1535, 2,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $103F, 3,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0F54, 3,Fire1_init, _FIRE_PI); // 
//data_spawn(rm+STR_PRXM,Moa_B,$1,  (clm1-1)<<3,(row0+$07)<<3); // FieryMoa  1
break;}
case 2:{// Fire IS harmful
data_spawn(rm+STR_PRIO,BlazA,$6,  $2A<<3,(row0+$0D)<<3,  STR_Size+hex_str(3)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $38<<3,(row0+$13)<<3,  STR_Size+hex_str(3)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $35<<3,(row0+$15)<<3,  STR_Size+hex_str(2)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $3F<<3,(row0+$10)<<3,  STR_Size+hex_str(1)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $54<<3,(row0+$0F)<<3,  STR_Size+hex_str(1)); // Blaze v6
break;}
}//switch(g.mod_OldKasutoFire)

data_spawn(rm+STR_PRXM,Moa_A,$2,  $10<<3,(row0+$17)<<3);
data_spawn(rm+STR_PRXM,Moa_A,$2,  $34<<3,(row0+$13)<<3);
data_spawn(rm+STR_PRXM,Moa_A,$2,  $50<<3,(row0+$15)<<3);
data_spawn(rm+STR_PRXM,Moa_A,$2,  $6C<<3,(row0+$17)<<3);

data_spawn(rm+STR_PRIO,NPC_0,$2,  $6E<<3,(row0+$17)<<3,  dk_PI+hex_str(Sign_PI),STR_Dialogue+DK0007); // Sign


clm3=$26; clm4=$58; row3=row0+$17;
_exit=data_exit(EXM0,etB0,0,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  rm_num_+EXM0_); // MID 0, 
//_exit=data_exit(EXM0,etB0,1,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  '5E'+EXL0_); // MID 0, 
_datakey = _town_name1+dk_FastTravel+STR_Exit+'A';
g.dm_rm[?_exit+dk_FastTravel+STR_Exit+STR_Datakey] = _datakey;
g.dm_rm[?_datakey] = _exit;
g.dm_rm[?_exit+"_Draw"+STR_Open+STR_Exit] = true;

      data_exit(EXM1,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4-1,row3,  '4E'+EXL0_); // MID 1, to New Kasuto hint
//                                                                              // 
      data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '16'+EXR0_); // LFT 0, 
//
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0);          // RGT 0, to Overworld 
g.dm_rm[?_town_name1+STR_Rando+STR_Town+"_End"+STR_Exit+"_Right"] = _exit;










//   --------------------------  18  --------------------------- 
//    Ruto, midtown
_town_name1 = STR_Ruto;
rm_num  = $18;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR2_, STR_Tile+area_TA+'024', STR_ow_axis+hex_str(0), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_RUTO);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


row3=row0+$17; y3=row3<<3;
row5=row0+$1A; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);

// Returned TRPOPHY
y5=(row3-$00)<<3;     _y     = hex_str((y5>>8)&$FF)+hex_str((y5>>0)&$FF);
x5=($20<<3);          _data  = hex_str((x5>>8)&$FF)+hex_str((x5>>0)&$FF) + _y;
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,1,AdditionalBGGraphics_init,  global.PI_MOB_ORG,  g.SPR_ITEM_TROPHY,0,DEPTH_BG7-1,_data);

data_spawn(rm+STR_PRIO,SpNPA,$1,  $1E<<3,y3); // NPC Spawner


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '04'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '05'+EXL0_); // RGT 0, 









//   --------------------------  19  --------------------------- 
//    Nabooru, backside
_town_name1 = STR_Nabooru;
rm_num  = $19;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR2_, STR_Tile+area_TA+'025', STR_ow_axis+hex_str(1), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_NABOORU);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;
_val = p.PAL_MOB_SET1;
dm_palette[?        rm+dk_MOB] = _val;
p.dm_scene_palette[?rm+dk_MOB] = _val;


row5=row0+$1A; y5=row5<<3;
_a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
y3  = (row0+$19)<<3;
data_spawn(rm+STR_PRXM,Bot_A,$2,  $3C<<3,y3); // Bot  2 


clm4  = -PAGE_CLMS;
row3  = row0+$17;
clm5  = $64;
      data_exit(EXD0,etA1,1,  clm4,row_e2,  clms1,ROWS5,  $1F,row_e3,  area_EA+'54'+EXU0_); // DWN 0, Pit down 
//
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0);          // LFT 0, to Overworld
g.dm_rm[?_town_name1+"_Backside"+STR_Overworld+STR_Exit] = _exit;

_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '49'+EXL0_); // RGT 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'D'] = _exit;

_exit=data_exit(EXM0,etB0,0,  clm5,row3,  CLMS2,ROWS2,  clm5-1,row3,  '78'+EXR0_); // MID 0, Fast Travel to Dragon Isl
g.dm_rm[?_exit+"_Draw"+STR_Open+STR_Exit] = true;
g.dm_rm[?dk_FastTravel+"02"+STR_Exit+STR_Name] = _exit;
//g.ExitName_FAST_TRAVEL2 = _exit;


g.dm_rm[?rm+STR_Rando+dk_LandLocked] = true;










//   --------------------------  1A  --------------------------- 
//    New Kasuto, East end
_town_name1 = STR_New_Kasuto;
rm_num  = $1A; 
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Color+COLOR2_, STR_Tile+area_TA+'026', STR_ow_axis+hex_str(0), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_NEW_KASUTO);
g.dm_rm[?rm+STR_Town+STR_Outside] = true;


row5=row0+$1A; y5=row5<<3;
                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), _CLOUD_RC_NEWK, 1,Cloud_1_init); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Moon1_init);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($21<<3)+4,y5);


clm3  = $36;
row3  = row0+$17;
row4  = -PAGE_ROWS;
data_exit(EXM0,etB0,1,  clm3,row3,  CLMS2,ROWS2,  clm3-1,row3,  '71'+EXL0_); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,row4,  CLMS2,ROWS6,  CLM3,row3,  '13'+EXR0_); // LFT 0, 
//
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  0); // RGT 0, to Overworld. **This is for town rando only.
g.dm_rm[?_town_name1+STR_Rando+STR_Town+"_End"+STR_Exit+"_Right"] = _exit;
//global.OVERWORLD.dm[?_exit+STR_goto_reen] = Area_OvrwA+hex_str(g.OWRC_TOWN_NEWK1);
g.dm_rm[?_exit+STR_goto_reen] = Area_OvrwA+hex_str(g.OWRC_TOWN_NEWK1);










//   --------------------------  1B  --------------------------- 
/*
//                  Old Kasuto Midtown 2
rm_num  = $1B;
set_rm_data(area+hex_str(rm_num), STR_Old_Kasuto, STR_Color+COLOR5_, STR_Tile+area_TA+'028', STR_ow_axis+hex_str(0), STR_Town+STR_Old_Kasuto, MapAreaName_DATAKEY+MapAreaName_KASUTO);

                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Cloud_1_init); // 

if (g.mod_OldKasutoFire==1){
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0D20, 1,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0D4C, 1,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $112B, 2,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $1154, 2,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $146D, 3,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0C64, 3,Fire1_init, _FIRE_PI); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0E52, 3,Fire1_init, _FIRE_PI); // 
//data_spawn(rm+STR_PRXM,Moa_B,$1,  (clm1-1)<<3,(row0+$07)<<3); // FieryMoa  1
}else if (g.mod_OldKasutoFire==2){
data_spawn(rm+STR_PRIO,BlazA,$6,  $20<<3,(row0+$0D)<<3,  STR_Size+hex_str(3)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $4C<<3,(row0+$0D)<<3,  STR_Size+hex_str(3)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $2B<<3,(row0+$11)<<3,  STR_Size+hex_str(2)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $54<<3,(row0+$11)<<3,  STR_Size+hex_str(2)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $52<<3,(row0+$0E)<<3,  STR_Size+hex_str(1)); // Blaze v6
data_spawn(rm+STR_PRIO,BlazA,$6,  $64<<3,(row0+$0C)<<3,  STR_Size+hex_str(1)); // Blaze v6
}

data_spawn(rm+STR_PRXM,Moa_A,$2,  $10<<3,(row0+$17)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $14<<3,(row0+$13)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $30<<3,(row0+$15)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $34<<3,(row0+$13)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $50<<3,(row0+$15)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $54<<3,(row0+$13)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $70<<3,(row0+$15)<<3); 
data_spawn(rm+STR_PRXM,Moa_A,$2,  $70<<3,(row0+$17)<<3);


clm3=$1A; clm4=$30; clm5=$62; row3=row0+$17;
data_exit(EXM0,etB0,1,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  '79'+EXR0_); // MID 0, 
data_exit(EXM1,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4+1,row3,  '5C'+EXL0_); // MID 1, HEART PIECE
data_exit(EXM2,etB0,1,  clm5,row3,  CLMS2,ROWS2,  clm5-1,row3,  '7B'+EXL0_); // MID 2, 
//                                                                              // 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '16'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '17'+EXL0_); // RGT 0, 
*/








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


//   --------------------------  40  --------------------------- 
/*
//                  Rauru West, House A, Room 1 
rm_num  = $40;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'064', STR_ow_axis+hex_str(0), STR_Town+STR_Rauru, MapAreaName_DATAKEY+MapAreaName_RAURU);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_1,$1,  $0A<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0102,STR_Sprite+STR_Joey); // Idle Simple, Child, Red.  kid w/ CANDLE directions


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '01'+'01'); // RGT 0, 
*/








//   --------------------------  41  --------------------------- 
//                  Rauru East, House A, Room 1 
_town_name1 = STR_Rauru;
rm_num  = $41;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'064', STR_ow_axis+hex_str(0), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_RAURU);
g.dm_rm[?rm+STR_Town+STR_House] = true;


clm3=$07; clm4=clm3+$05;
row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_1,$1,  $0A<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0114,STR_Sprite+STR_Jack, STR_Rando+STR_Hint); // Idle Simple, Big man, Purple


_exit1=val(g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'A'], Area_TownA+'02'+EXM0_);
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  _exit1); // RGT 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'B'] = _exit;

_exit2=_exit;
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  _exit2); // LFT 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'C'] = _exit;
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'D'] = _exit2;









//   --------------------------  42  --------------------------- 
//                  Ruto West, House A, Room 1 
_town_name1 = STR_Ruto;
rm_num  = $42;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Tile+area_TA+'086', STR_ow_axis+hex_str(1), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_RUTO);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_1,$1,  $0C<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK010A,STR_Sprite+STR_Mary, STR_Rando+STR_Hint); // Idle Simple, Big lady, Red


_exit1=val(g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'A'], Area_TownA+'04'+EXM0_); // 'A': front door outside
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  _exit1); // RGT 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'B'] = _exit;

_exit2=val(g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'D'], Area_TownA+'03'+EXR0_); // 'D':  back door outside
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  _exit2); // LFT 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'C'] = _exit;
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'D'] = _exit2;










//   --------------------------  43  --------------------------- 
//                  Ruto East, House A, Room 1 
rm_num  = $43;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'066', STR_ow_axis+hex_str(0), STR_Town+STR_Ruto, MapAreaName_DATAKEY+MapAreaName_RUTO);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_9,$6,  $14<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0902,STR_Sprite+STR_Jack,STR_Depth+string(_DEPTH1)); // Error


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '05'+EXM0_); // LFT 0, 









//   --------------------------  44  --------------------------- 
//                  Saria River Crossing, House A, Room 1 
_town_name1 = STR_Saria;
rm_num  = $44;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'085', STR_OWRC+hex_str(g.OWRC_TOWN_SARI2), STR_ow_axis+hex_str(0), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_SARIA);
g.dm_rm[?rm+STR_Town+STR_House] = true;


x3=$30<<3; row3=row0+$17; y3=row3<<3;
                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,2,Skull1_init,  global.PI_MOB_ORG,  $23<<3,(row0+$16)<<3, DEPTH_BG3+3);
data_spawn(rm+STR_PRIO,NPC_9,$2,  x3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0901,STR_Sprite+STR_Cole,STR_Quest+STR_ID+QuestID_Saria_Bridge); // Riverman


_exit1='06'+EXM0_;
_exit2=area_WA+"4A"+EXR0_;
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  _exit2); // LFT 0, to backside of Saris to Saria River
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  _exit1); // RGT 0, 


g.dm_rm[?rm+STR_Rando+dk_LandLocked] = true;









//   --------------------------  45  --------------------------- 
//                  Saria River Crossing, House B, Room 1 
rm_num  = $45;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'064', STR_OWRC+hex_str(g.OWRC_TOWN_SARI2), STR_ow_axis+hex_str(1), STR_Town+STR_Saria, MapAreaName_DATAKEY+MapAreaName_SARIA);
g.dm_rm[?rm+STR_Town+STR_House] = true;


x3=$0A<<3; row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_9,$2,  x3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0901,STR_Sprite+STR_Finn,STR_Quest+STR_ID+QuestID_Saria_Bridge); // Riverman


data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  "06"+EXM1_); // RGT 0, 


g.dm_rm[?rm+STR_Rando+dk_LandLocked] = true;









//   --------------------------  46  --------------------------- 
//                  Saria West, House C, Room 1.             Bot NPC 
_town_name1 = STR_Saria;
rm_num  = $46;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'066', STR_ow_axis+hex_str(1), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_SARIA);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_9,$5,  $14<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0905,STR_Sprite+STR_Bot); // Bot NPC 


/*
_exit1=val(g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'A'], Area_TownA+'07'+EXM2_);
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  _exit1); // RGT 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'B'] = _exit;

_exit2=_exit;
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  _exit2); // LFT 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'C'] = _exit;
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'D'] = _exit2;
*/

_exit1=val(g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'A'], Area_TownA+'07'+EXM2_);
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  _exit1); // LFT 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'B'] = _exit;

_exit2=_exit;
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  _exit2); // RGT 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'C'] = _exit;
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'D'] = _exit2;










//   --------------------------  47  --------------------------- 
//                  Saria West, House B, Room 1.             MIRROR
rm_num  = $47;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'067', STR_ow_axis+hex_str(1), STR_Town+STR_Saria, MapAreaName_DATAKEY+MapAreaName_SARIA);
g.dm_rm[?rm+STR_Town+STR_House] = true;


                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,2,Skull1_init,  global.PI_MOB_ORG,  $16<<3,(row0+$16)<<3, DEPTH_BG3+3);


row3=row0+$17;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '07'+'01'); // LFT 0, 









//   --------------------------  48  --------------------------- 
//                  Mido East, House A, Room 1 
rm_num  = $48;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'066', STR_ow_axis+hex_str(1), STR_Town+STR_Mido, MapAreaName_DATAKEY+MapAreaName_MIDO);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_9,$7,  $18<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0903,STR_Sprite+STR_Bill,STR_Depth+string(_DEPTH1)); // Error's friend


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '0B'+'00'); // LFT 0, 










//   --------------------------  49  --------------------------- 
//                  Nabooru West, House A, Room 1 
_town_name1 = STR_Nabooru;
rm_num  = $49;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Tile+area_TA+'086', STR_ow_axis+hex_str(0), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_NABOORU);
g.dm_rm[?rm+STR_Town+STR_House] = true;


data_spawn(rm+STR_PRIO,NPC_9,$4,  $10<<3,(row0+$0F)<<3,  dk_PI+hex_str(PId),STR_Dialogue+DK0904,STR_Sprite+STR_Ache); // Ache NPC 


row3=row0+$17; y3=row3<<3;
_exit1=val(g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'A'], Area_TownA+'0C'+EXM2_);
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  _exit1); // RGT 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'B'] = _exit;

_exit2=val(g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'D'], Area_TownA+'19'+EXR0_);
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  _exit2); // LFT 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'C'] = _exit;
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'D'] = _exit2;









//   --------------------------  4A  --------------------------- 
//                  Darunia Midtown, Darunia Backside House. Only in Town Rando
_town_name1 = STR_Darunia;
rm_num  = $4A;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'086', STR_ow_axis+hex_str(0), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_DARUNIA);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_0,$1,  $12<<3,y3,  STR_Dialogue+DK000F, STR_Rando+STR_Hint); // Rando NPC hint
//data_spawn(rm+STR_PRIO,NPC_1,$1,  $0A<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0101,STR_Sprite+STR_Bill); // Idle Simple, Thin man, Purple


_exit1=val(g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'A'], Area_TownA+'10'+EXM4_);
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  _exit1); // RGT 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'B'] = _exit;

_exit2=_exit;
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  _exit2); // LFT 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'C'] = _exit;
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'D'] = _exit2;








//   --------------------------  4B  --------------------------- 
/*
//                  Darunia East, House A, Room 1.           Nabooru hint 
rm_num  = $4B;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'066', STR_ow_axis+hex_str(0), STR_Town+STR_Darunia, MapAreaName_DATAKEY+MapAreaName_DARUNIA);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_0,$1,  $1A<<3,(row0+15)<<3,  STR_Dialogue+DK000B); // Nabooru hint 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '11'+'00'); // LFT 0, 
*/









//   --------------------------  4C  --------------------------- 
//                  New Kasuto West, House B, Room 1 
_town_name1 = STR_New_Kasuto;
rm_num  = $4C; 
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'064', STR_ow_axis+hex_str(0), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_NEW_KASUTO);
// _FILE_NAME example: "PalcA_003"
//g.dm_rm[?_RM_NAME+STR_file_name+STR_Quest+hex_str(_QUEST_NUM)] = _FILE_NAME;
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_0,$1,  $12<<3,y3,  STR_Dialogue+DK000C, STR_Rando+STR_Hint); // HEART 4 hint 


_exit1=val(g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'A'], Area_TownA+'12'+EXM1_);
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  _exit1); // RGT 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'B'] = _exit;

_exit2=_exit;
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  _exit2); // LFT 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'C'] = _exit;
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'D'] = _exit2;









//   --------------------------  4D  --------------------------- 
//                  Old Kasuto West, House A, Room 1 
rm_num  = $4D; 
set_rm_data(area+hex_str(rm_num), STR_Old_Kasuto, STR_Tile+area_TA+'064', STR_ow_axis+hex_str(0), STR_Town+STR_Old_Kasuto, MapAreaName_DATAKEY+MapAreaName_KASUTO);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '15'+EXM0_); // RGT 0, 









//   --------------------------  4E  --------------------------- 
//                  Old Kasuto East, House B, Room 1 
rm_num  = $4E;
set_rm_data(area+hex_str(rm_num), STR_Old_Kasuto, STR_Tile+area_TA+'067', STR_ow_axis+hex_str(0), STR_Town+STR_Old_Kasuto, MapAreaName_DATAKEY+MapAreaName_KASUTO);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,2,Skull1_init,  global.PI_MOB_ORG,  $16<<3,(row0+$16)<<3, DEPTH_BG3+3);
data_spawn(rm+STR_PRIO,NPC_1,$1,  $0F<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK010E,STR_Sprite+STR_Barb, STR_Rando+STR_Hint); // Idle Simple, Old lady.  New Kasuto hint


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '17'+EXM1_); // LFT 0, 









//   --------------------------  4F  --------------------------- 
//                  Old Kasuto West, House A, Room 1 
_town_name1 = STR_Old_Kasuto;
rm_num  = $4F;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Tile+area_TA+'064', STR_ow_axis+hex_str(0), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_KASUTO);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_0,$1,  $12<<3,y3,  STR_Dialogue+DK000D, STR_Rando+STR_Hint); // POWER BRACELET Hint


_exit1=val(g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'A'], Area_TownA+'15'+EXM1_);
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  _exit1); // RGT 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'B'] = _exit;

_exit2=_exit;
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  _exit2); // LFT 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'C'] = _exit;
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'D'] = _exit2;








//   --------------------------  50  --------------------------- 
//                  Rauru West, House B, Room 1.         - SHIELD - 
rm_num  = $50;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'068', STR_ow_axis+hex_str(0), STR_Town+STR_Rauru, MapAreaName_DATAKEY+MapAreaName_RAURU);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,2,Skull1_init,  global.PI_MOB_ORG,  $22<<3,(row0+$16)<<3, DEPTH_BG3+3);
data_spawn(rm+STR_PRIO,NPC_1,$1,  $28<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0105,STR_Sprite+STR_Zoey, STR_Rando+STR_Hint); // Idle Simple, Pot lady, Purple


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '01'+'02'); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '60'+EXL0_); // RGT 0, 








//   --------------------------  51  --------------------------- 
//                  Ruto West, House B, Room 1.         - JUMP - 
rm_num  = $51;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'068', STR_ow_axis+hex_str(0), STR_Town+STR_Ruto, MapAreaName_DATAKEY+MapAreaName_RUTO);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,2,Skull1_init,  global.PI_MOB_ORG,  $22<<3,(row0+$16)<<3, DEPTH_BG3+3);


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '04'+EXM1_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '61'+EXL0_); // RGT 0, to JUMP









//   --------------------------  52  --------------------------- 
//                  Saria East, House A, Room 1.         - LIFE - 
rm_num  = $52;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'068', STR_ow_axis+hex_str(1), STR_Town+STR_Saria, MapAreaName_DATAKEY+MapAreaName_SARIA);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,2,Skull1_init,  global.PI_MOB_ORG,  $22<<3,(row0+$16)<<3, DEPTH_BG3+3);


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '07'+EXM1_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '62'+EXL0_); // RGT 0, 









//   --------------------------  53  --------------------------- 
//                  Mido West, House A, Room 1.         - FAIRY SPELL - 
rm_num  = $53;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'068', STR_ow_axis+hex_str(1), STR_Town+STR_Mido, MapAreaName_DATAKEY+MapAreaName_MIDO);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,2,Skull1_init,  global.PI_MOB_ORG,  $22<<3,(row0+$16)<<3, DEPTH_BG3+3);


data_spawn(rm+STR_PRIO,NPC_9,$E,  $31<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK090E,STR_Sprite+STR_Barb); // Boulder circle puzzle, Talk to wisemen hint


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '09'+'01'); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '63'+EXL0_); // RGT 0, 








//   --------------------------  54  --------------------------- 
//                  Mido Midtown, House A, Room 1.  Church         - DOWNTHRUST - 
_town_name1 = STR_Mido;
rm_num  = $54;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'083', STR_ow_axis+hex_str(1), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_MIDO);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row4=row0+$19; y4=row4<<3;
                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1,Jackolantern1_init, -1, ($10<<3)+0,y4);
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,2,Skull1_init,  global.PI_MOB_ORG,  $30<<3,y4, DEPTH_BG3+3);
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,2,Skull1_init,  global.PI_MOB_ORG,  $32<<3,y4, DEPTH_BG3+3);
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,2,Skull1_init,  global.PI_MOB_ORG,  $35<<3,y4, DEPTH_BG3+3);
data_NIAO_1a(rm+STR_NIAO+string(_a++), $1A15, 1, Fire1_init);

_a = EXM0;
_b = $01;
//clm3  = $28;
clm3  = $29;
row3  = row0+$08;
_exit=data_exit(_a++,etB0,0,  clm3-1,row0+$18,  CLMS2,ROWS2,  clm3,row3,  "5A"+EXD0_); // MID 0, Fireplace
data_spawn_cutscene(Cutscene_EnterFromChimney,1, clm3<<3,row3<<3, -1, _exit); // 

clm3 = $1E;
row3 = row0+$18;
_exit=data_exit(_a++,etB2,0,  clm3,row3,  $03,ROWS2,  clm3-1,row3,  area_EA+'1B'+EXM0_); // MID 1, to Great Palace entrance
//_exit=data_exit(_a++,etB2,0,  clm3,row3,  $03,ROWS2,  clm3-1,row3,  area_PG+'3C'+EXM0_); // MID 1, to Great Palace entrance
data_spawn_cutscene(Cutscene_MoaiOpenMouth2,1, 0,0, -1, _exit); // 


row3 = row0+$18;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '0A'+EXM1_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '64'+EXL0_); // RGT 0, 









//   --------------------------  55  --------------------------- 
//                  Nabooru Midtown, House A, Room 1.         - FIRE - 
rm_num  = $55;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'068', STR_ow_axis+hex_str(0), STR_Town+STR_Nabooru);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,2,Skull1_init,  global.PI_MOB_ORG,  $22<<3,(row0+$16)<<3, DEPTH_BG3+3);


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '0D'+'00'); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '65'+EXL0_); // RGT 0, 









//   --------------------------  56  --------------------------- 
//                  Darunia West, House A, Room 1.         - REFLECT - 
rm_num  = $56;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'068', STR_ow_axis+hex_str(0), STR_Town+STR_Darunia);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,2,Skull1_init,  global.PI_MOB_ORG,  $22<<3,(row0+$16)<<3, DEPTH_BG3+3);


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '0F'+'00'); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '66'+EXL0_); // RGT 0, 








//   --------------------------  57  --------------------------- 
//                  Darunia Midtown, House A, Room 1.         - UPTHRUST - 
rm_num  = $57;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'070', STR_ow_axis+hex_str(0), STR_Town+STR_Darunia);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,2,Skull1_init,  global.PI_MOB_ORG,  $18<<3,(row0+$16)<<3, DEPTH_BG3+3);
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,2,Skull1_init,  global.PI_MOB_ORG,  $1B<<3,(row0+$16)<<3, DEPTH_BG3+3);
clm3=$26; row4=row0+$08;
data_spawn_cutscene(Cutscene_EnterFromChimney,1, clm3<<3,row4<<3); // 


data_exit(EXM0,etB0,0,  clm3-1,row3,  CLMS2,ROWS2,  clm3,row4,  '10'+EXM0_); // MID 0, Fireplace
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '10'+EXM1_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '67'+EXL0_); // RGT 0, 








//   --------------------------  58  --------------------------- 
//                  New Kasuto West, House A, Room 1.         - MAGIC CONTAINER - 
rm_num  = $58;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'068', STR_ow_axis+hex_str(0), STR_Town+STR_New_Kasuto);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,2,Skull1_init,  global.PI_MOB_ORG,  $22<<3,(row0+$16)<<3, DEPTH_BG3+3);


data_spawn(rm+STR_PRIO,NPC_1,$1,  $32<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK010B,STR_Sprite+STR_Barb, STR_Rando+STR_Hint); // Idle Simple, Old lady, Red


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '12'+'00'); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '68'+EXL0_); // RGT 0, 









//   --------------------------  59  --------------------------- 
//                  New Kasuto East, House A, Room 1.         - SPELL - 
rm_num  = $59;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'071', STR_ow_axis+hex_str(0), STR_Town+STR_New_Kasuto);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,2,Skull1_init,  global.PI_MOB_ORG,  $20<<3,(row0+$16)<<3, DEPTH_BG3+3);
data_spawn(rm+STR_PRIO,NPC_0,$1,  $2B<<3,y3,  STR_Dialogue+DK000A); // Fireplace dlg 


data_exit(EXM0,etB0,1,  $2B,row3,  CLMS2,ROWS2,  $2A,row3,  '69'+EXL0_); // MID 0,      
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '13'+'00'); // LFT 0, 









//   --------------------------  5A  --------------------------- 
//                  Mido church upper floor
rm_num  = $5A;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'063', STR_ow_axis+hex_str(1), STR_Town+STR_Mido);
g.dm_rm[?rm+STR_Town+STR_House] = true;
//global.MIDO_CHURCH_UPPER_FLOOR_SCENE = rm;


row3=row0+$17; y3=row3<<3;
data_exit(EXD0,etA0,1,  $00,row_e2,  clms0,ROWS5,  clm1-$01,row_e3,  '54'+EXM0_); // DWN 0, Pit down 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0A'+EXM0_); // LFT 0, 


// 2nd Quest tile data. 1st Quest doesn't have break blocks.
set_rm_data_1a(rm,area_TA+'072',2);










//   --------------------------  5B  --------------------------- 
//                  Old Kasuto East, House B, Room 1.         - THUNDER - 
rm_num  = $5B;
set_rm_data(area+hex_str(rm_num), STR_Old_Kasuto, STR_Tile+area_TA+'068', STR_ow_axis+hex_str(0), STR_Town+STR_Old_Kasuto);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,2,Skull1_init,  global.PI_MOB_ORG,  $22<<3,(row0+$16)<<3, DEPTH_BG3+3);


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '16'+EXM2_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '6B'+EXL0_); // RGT 0, 









//   --------------------------  5C  --------------------------- 
//                  Old Kasuto Midtown, House B, Room 1 
rm_num  = $5C;
set_rm_data(area+hex_str(rm_num), STR_Old_Kasuto, STR_Tile+area_TA+'092', STR_ow_axis+hex_str(0), STR_Town+STR_Old_Kasuto);
g.dm_rm[?rm+STR_Town+STR_House] = true;


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '16'+EXM0_); // LFT 0, 


x3=(clms0-$09)<<3;
row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_HP,CONT_PIECE_OBJ_VER_HP,  x3,y3,  STR_Treasure+STR_Map+"02"); // HEART PIECE
//data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  x3,y3,  STR_Treasure+STR_Map+"02"); // MAGIC PIECE









//   --------------------------  5D  --------------------------- 
//                  Old Kasuto Midtown, House C, Room 1 
rm_num  = $5D;
set_rm_data(area+hex_str(rm_num), STR_Old_Kasuto, STR_Tile+area_TA+'064', STR_ow_axis+hex_str(0), STR_Town+STR_Old_Kasuto);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '16'+EXM3_); // RGT 0, 









//   --------------------------  5E  --------------------------- 
//                  Old Kasuto East, House A, Room 1 
rm_num  = $5E;
set_rm_data(area+hex_str(rm_num), STR_Old_Kasuto, STR_Tile+area_TA+'067', STR_ow_axis+hex_str(0), STR_Town+STR_Old_Kasuto);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,2,Skull1_init,  global.PI_MOB_ORG,  $16<<3,(row0+$16)<<3, DEPTH_BG3+3);


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '17'+EXM0_); // LFT 0, 









//   --------------------------  5F  --------------------------- 
//                  Bagu, Inside.      61,115 = $3D,$73 = $733D
rm_num  = $5F;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'074', STR_ow_axis+hex_str(0));
g.dm_rm[?rm+STR_Town+STR_House] = true;


clm3=$06; row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_9,$1,  clm3<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0900,STR_Sprite+STR_Jack); // Bagu 

                                                              _exit = area_WA+'25'+EXM0_;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  _exit); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  _exit); // RGT 0, 


data_spawn(rm+STR_PRIO,ItmC1,$1,  (clm3+$04)<<3,(row3+$02)<<3); // NOTE

g.dm_rm[?rm+STR_Rando+dk_LandLocked] = true;








//   --------------------------  60  --------------------------- 
//                  Rauru West, House B, Room 2  -  BASEMENT         - SHIELD/PROTECT - 
rm_num  = $60;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'096', STR_ow_axis+hex_str(0), STR_Town+STR_Rauru);


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_7,$1,  $38<<3,y3,  STR_Dialogue+DK0700, STR_Sprite+STR_Adam, STR_Spell+STR_ID+hex_str(SPL_PRTC));


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0B,  '50'+EXR0_); // LFT 0, 

g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_Rauru] = rm;








//   --------------------------  61  --------------------------- 
//                  Ruto West, House B, Room 2  -  BASEMENT         - JUMP - 
rm_num  = $61;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'100', STR_ow_axis+hex_str(0), STR_Town+STR_Ruto);


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_7,$1,  $4C<<3,y3,  STR_Dialogue+DK0701, STR_Sprite+STR_Adam, STR_Spell+STR_ID+hex_str(SPL_JUMP)); // JUMP spell


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0B,  '51'+EXR0_); // LFT 0, 


x3=$49<<3; x4=x3-($04<<3);
y4=(row0<<3)-($02<<3)
data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_HP,CONT_PIECE_OBJ_VER_HP,  x3,y4,  STR_Treasure+STR_Map+"01"); // HEART PIECE

g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_Ruto] = rm;








//   --------------------------  62  --------------------------- 
//                  Saria East, House A, Room 2  -  BASEMENT         - LIFE/HEAL - 
rm_num  = $62;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'096', STR_ow_axis+hex_str(1), STR_Town+STR_Saria);


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_7,$1,  $38<<3,y3,  STR_Dialogue+DK0702, STR_Sprite+STR_Adam, STR_Spell+STR_ID+hex_str(SPL_LIFE)); // HEAL spell


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0B,  '52'+EXR0_); // LFT 0, 

g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_Saria] = rm;








//   --------------------------  63  --------------------------- 
//                  Mido West, House A, Room 2  -  BASEMENT         - FAIRY - 
rm_num  = $63;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'099', STR_ow_axis+hex_str(1), STR_Town+STR_Mido);


row3=row0+$14; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_7,$1,  $38<<3,y3,  STR_Dialogue+DK0703, STR_Sprite+STR_Adam, STR_Spell+STR_ID+hex_str(SPL_FARY)); // FAIRY spell


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$08,  '53'+EXR0_); // LFT 0, 


data_spawn(rm+STR_PRIO,ItmF0,$4,  $75<<3,(row0+$16)<<3); // PBag v4: 200

g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_Mido] = rm;










//   --------------------------  64  --------------------------- 
//                  Mido Midtown, House A, Room 2  -  BASEMENT         - DOWNTHRUST - 
rm_num  = $64;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'096', STR_ow_axis+hex_str(1), STR_Town+STR_Mido);


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_6,$1,  $38<<3,y3,  STR_Dialogue+DK0600,STR_Sprite+STR_Finn); // DOWNTHRUST 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0B,  '54'+EXR0_); // LFT 0, 








//   --------------------------  65  --------------------------- 
//                  Nabooru Midtown, House A, Room 2  -  BASEMENT         - FIRE - 
rm_num  = $65;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'097', STR_ow_axis+hex_str(0), STR_Town+STR_Nabooru);


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_7,$1,  $38<<3,y3,  STR_Dialogue+DK0704, STR_Sprite+STR_Adam, STR_Spell+STR_ID+hex_str(SPL_FIRE)); // FIRE spell


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0B,  '55'+EXR0_); // LFT 0, 


data_spawn(rm+STR_PRIO,ItmF0,$6,  $6C<<3,(row0+$18)<<3); // PBag v6: 300

g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_Nabooru] = rm;








//   --------------------------  66  --------------------------- 
//                  Darunia West, House A, Room 2  -  BASEMENT         - REFLECT - 
rm_num  = $66;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'096', STR_ow_axis+hex_str(0), STR_Town+STR_Darunia);


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_7,$1,  $38<<3,y3,  STR_Dialogue+DK0705, STR_Sprite+STR_Adam, STR_Spell+STR_ID+hex_str(SPL_RFLC)); // REFLECT spell


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0B,  '56'+EXR0_); // LFT 0, 

g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_Darunia] = rm;








//   --------------------------  67  --------------------------- 
//                  Darunia Midtown, House A, Room 2  -  BASEMENT         - UPTHRUST - 
rm_num  = $67;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'096', STR_ow_axis+hex_str(0), STR_Town+STR_Darunia);


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_6,$2,  $38<<3,y3,  STR_Dialogue+DK0601,STR_Sprite+STR_Tony); // UPTHRUST 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0B,  '57'+EXR0_); // LFT 0, 









//   --------------------------  68  --------------------------- 
//                  New Kasuto West, House A, Room 2  -  BASEMENT         - MAGIC CONTAINER - 
rm_num  = $68;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'096', STR_ow_axis+hex_str(0), STR_Town+STR_New_Kasuto);


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0B,  '58'+EXR0_); // LFT 0, 


clm3=$30; y3=(row0+$19)<<3;
data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  (clm3+6)<<3,y3,  STR_Treasure+STR_Map+"02"); // MAGIC PIECE









//   --------------------------  69  --------------------------- 
//                  New Kasuto East, House A, Room 2  -  BASEMENT         - SPELL/ENIGMA - 
rm_num  = $69;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'096', STR_ow_axis+hex_str(0), STR_Town+STR_New_Kasuto);


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_7,$1,  $38<<3,y3,  STR_Dialogue+DK0706, STR_Sprite+STR_Adam, STR_Spell+STR_ID+hex_str(SPL_SPEL)); // ENIGMA spell


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0B,  '59'+EXM0_); // LFT 0, 

g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_New_Kasuto] = rm;








//   --------------------------  6A  --------------------------- 
//                  New Kasuto East End, House A, Room 1  -  BASEMENT         - BRACELET - 
rm_num  = $6A;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'117', STR_ow_axis+hex_str(0), STR_Town+STR_New_Kasuto);


data_spawn(rm+STR_PRIO,PushA,$1,  $59<<3,(row0+$10)<<3,  dk_PI+hex_str(global.PI_BGR3)); // Pushable


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$06,  '14'+EXM0_); // LFT 0, 


data_spawn(rm+STR_PRIO,ItmA9,$1,  ($4A<<3)+3,(row0+$12)<<3); // POWER BRACELET
data_spawn(rm+STR_PRIO,ItmF0,$7,  $78<<3,(row0+$13)<<3); // PBag v7: 400








//   --------------------------  6B  --------------------------- 
//                  Old Kasuto East, House B, Room 2  -  BASEMENT         - THUNDER - 
rm_num  = $6B;
set_rm_data(area+hex_str(rm_num), STR_Old_Kasuto, STR_Tile+area_TA+'096', STR_ow_axis+hex_str(0), STR_Town+STR_Old_Kasuto);


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_7,$1,  $38<<3,y3,  STR_Dialogue+DK0707, STR_Sprite+STR_Adam, STR_Spell+STR_ID+hex_str(SPL_THUN)); // THUNDER spell


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0B,  '5B'+EXR0_); // LFT 0, 

g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_Old_Kasuto] = rm;








//   --------------------------  6C  --------------------------- 
//    


//   --------------------------  6D  --------------------------- 
//    


//   --------------------------  6E  --------------------------- 
//    Nabooru
_town_name1 = STR_Nabooru;
rm_num  = $6E;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'077', STR_ow_axis+hex_str(0), STR_Town+_town_name1);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,LoDoA,$2,  ($1A<<3)+4,(row3-$02)<<3,  STR_Side+hex_str($1)); // 

clm3=$26; row4=row0+$08;
data_spawn_cutscene(Cutscene_EnterFromChimney,1,  clm3<<3,row4<<3); // 


clm3--;
data_exit(EXM0,etB0,0,  clm3-1,row3,  CLMS2,ROWS2,  clm3,row4,  '0C'+EXM1_); // MID 0, Fireplace
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0C'+EXM0_); // LFT 0, 


data_spawn(rm+STR_PRIO,ItmF0,$7,  ($30<<3)+4,(row3-$02)<<3); // PBag v7: 400






//   --------------------------  6F  --------------------------- 
//    Mido, Midtown
_town_name1 = STR_Mido;
rm_num  = $6F;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'089', STR_ow_axis+hex_str(1), STR_Town+_town_name1);
// *** area_TA+'089' is same as area_TA+'067' but w/ alt palette for heart piece.
g.dm_rm[?rm+STR_Town+STR_House] = true;


clm3=clm1+$05;
row3=row0+$17; y3=row3<<3;
row4=row0+$0C; y4=row4<<3;
                                _a=0;
//data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,2,Skull1_init,  global.PI_MOB_ORG,  $16<<3,(row0+$16)<<3, DEPTH_BG3+3);
data_spawn(rm+STR_PRIO,NPC_8,$1,  clm3<<3,y4,  dk_PI+hex_str(PIa),STR_Dialogue+DK0800); // Fairy friend of Rescue Fairy


_exit1=val(g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'A'], Area_TownA+'0A'+EXM2_);
_exit=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  _exit1); // LFT 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'B'] = _exit;

_exit2=_exit;
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  _exit2); // RGT 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'C'] = _exit;
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'D'] = _exit2;


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_HP,CONT_PIECE_OBJ_VER_HP,  clm3<<3,row4<<3,  STR_Treasure+STR_Map+"01"); // HEART PIECE








//   --------------------------  70  --------------------------- 
//    


//   --------------------------  71  --------------------------- 
//    New Kasuto, access to New K backend w/ Magical Key house
_town_name1 = STR_New_Kasuto;
rm_num  = $71;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Tile+area_TA+'086', STR_ow_axis+hex_str(1), STR_Town+_town_name1);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_1,$1,  $0D<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0115,STR_Sprite+STR_Barb, STR_Rando+STR_Hint); // SKELETON KEY location hint


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '1A'+EXM0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '14'+EXL0_); // RGT 0, 






//   --------------------------  72  --------------------------- 
//    


//   --------------------------  73  --------------------------- 
//    


//   --------------------------  74  --------------------------- 
//    


//   --------------------------  75  --------------------------- 
//    Rauru.   Anju, BOOK sequence 2
_town_name1 = STR_Rauru;
rm_num  = $75;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'088', STR_ow_axis+hex_str(0), STR_Town+_town_name1);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,2,Skull1_init,  global.PI_MOB_ORG,  $0A<<3,(row0+$16)<<3, DEPTH_BG3+3);
data_spawn(rm+STR_PRIO,NPC_9,$B,  $0F<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK090B,STR_Sprite+STR_Jill); // BOOK sequence 2, Anju.  SIa: Thin lady


                                                              _exit=area_TA+'01'+EXM0_;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  _exit); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  _exit); // RGT 0, 






//   --------------------------  76  --------------------------- 
//    


//   --------------------------  77  --------------------------- 
//    


//   --------------------------  78  --------------------------- 
//    Backside of Nabooru house, Fast travel to Dragon Isl
_town_name1 = STR_Nabooru;
rm_num  = $78;
set_rm_data(area+hex_str(rm_num), _town_name1, STR_Tile+area_TA+'101', STR_ow_axis+hex_str(0), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_NABOORU);


clm3=$0E; row3=row0+$17; y3=row3<<3;
_exit=data_exit(EXM0,etB2,1,  clm3,row3,  $03,ROWS2,  clm3-1,row3,  area_EA+'64'+EXM0_); // MID 0, to Dragon Isl
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '19'+EXM0_); // RGT 0, 
/*
clm3=$0E; row3=row0+$17; y3=row3<<3;
_exit1=val(g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'A'], Area_TownA+'19'+EXM0_);
_exit2=area_EA+'64'+EXM0_;
_exit=data_exit(EXM0,etB2,1,  clm3,row3,  $03,ROWS2,  clm3-1,row3,  _exit2); // MID 0, to Dragon Isl
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'C'] = _exit;
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'D'] = _exit2;
_exit=data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  _exit1); // RGT 0, 
g.dm_rm[?_town_name1+"_Backside"+STR_Exit+'B'] = _exit;
*/


g.dm_rm[?rm+STR_Rando+dk_LandLocked] = true;








// ===============================================
ow_axis = 0;
//   --------------------------  79  --------------------------- 
//                  Old Kasuto house
rm_num  = $79; 
set_rm_data(area+hex_str(rm_num), STR_Old_Kasuto, STR_Tile+area_TA+'064', STR_ow_axis+hex_str(ow_axis), STR_Town+STR_Old_Kasuto, MapAreaName_DATAKEY+MapAreaName_KASUTO);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row3,  '1B'+EXM0_); // RGT 0, 








//   --------------------------  7A  --------------------------- 
//                  Old Kasuto house
rm_num  = $7A;
set_rm_data(area+hex_str(rm_num), STR_Old_Kasuto, STR_Tile+area_TA+'066', STR_ow_axis+hex_str(ow_axis), STR_Town+STR_Old_Kasuto, MapAreaName_DATAKEY+MapAreaName_KASUTO);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '16'+EXM1_); // LFT 0, 








//   --------------------------  7B  --------------------------- 
//                  Old Kasuto house
rm_num  = $7B;
set_rm_data(area+hex_str(rm_num), STR_Old_Kasuto, STR_Tile+area_TA+'067', STR_ow_axis+hex_str(ow_axis), STR_Town+STR_Old_Kasuto, MapAreaName_DATAKEY+MapAreaName_KASUTO);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++),  $0000,2,Skull1_init,  global.PI_MOB_ORG,  $16<<3,(row0+$16)<<3, DEPTH_BG3+3);


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '1B'+EXM2_); // LFT 0, 








//   --------------------------  7C  --------------------------- 
//          Darunia West
rm_num  = $7C;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'084', STR_ow_axis+hex_str(0), STR_Town+STR_Darunia, MapAreaName_DATAKEY+MapAreaName_DARUNIA);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_1,$1,  $13<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK010F,STR_Sprite+STR_Mary, STR_Rando+STR_Hint); // Idle Simple, Large lady, Purple clothes


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0F'+EXM1_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '7E'+EXL0_); // RGT 0, 






//   --------------------------  7D  --------------------------- 
//    


//   --------------------------  7E  --------------------------- 
//          Darunia West, Basement
rm_num  = $7E;
set_rm_data(area+hex_str(rm_num), MUS_BASEMENT1, STR_Tile+area_TA+'111', STR_View+'02', STR_ow_axis+hex_str(0), STR_Town+STR_Darunia, MapAreaName_DATAKEY+MapAreaName_DARUNIA);


data_spawn(rm+STR_PRIO,BlckB,$1,  $2A<<3,(rows0-$4C)<<3); // BlockB


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0A,  '7C'+EXR0_); // LFT 0, 


clm3=$06; y3=$1C<<3;
data_spawn(rm+STR_PRIO,ItmF0,$4,  (clm3+(0<<3))<<3,y3); // PBag v4: 200 
data_spawn(rm+STR_PRIO,ItmF0,$6,  (clm3+(1<<3))<<3,y3); // PBag v6: 300 
data_spawn(rm+STR_PRIO,ItmF0,$4,  (clm3+(2<<3))<<3,y3); // PBag v4: 200 
data_spawn(rm+STR_PRIO,ItmF0,$6,  (clm3+(3<<3))<<3,y3); // PBag v6: 300 
data_spawn(rm+STR_PRIO,ItmF0,$4,  (clm3+(4<<3))<<3,y3); // PBag v4: 200 
data_spawn(rm+STR_PRIO,ItmF0,$6,  (clm3+(5<<3))<<3,y3); // PBag v6: 300 

_data  = "7827"+"781D"+"6C15"+"6415"+"5C2B"+"4C2B"+"3C15"+"3427"+"4415"+"5415"+"782B";
_data += "7815"+"5C15"+"4C2B"+"4C15"+"3C15"+"3419"+"3427"+"5415"+"6C15"+"781D"+"782B";
data_spawn(rm+STR_PRIO,Kakusu009,$1,  0,0,  STR_Treasure+STR_Map+"02",STR_Locations+_data); // BlockB must fall on to kill






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


// ====================================================================
clm6=$1B; _x1=($30<<3)+4; _y1=$16<<3;
//   --------------------------  88  --------------------------- 
//    ITEMS MAP (ITM_MAP2)
rm_num  = $88;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'087', STR_ow_axis+hex_str(1), STR_Town+STR_New_Kasuto, MapAreaName_DATAKEY+MapAreaName_NEW_KASUTO);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_D,$1,  clm6<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0D00,STR_Sprite+STR_Bill); // Shop Owner


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '13'+EXM1_); // LFT 0, 


data_spawn(rm+STR_PRIO,ItmK9,$1,  _x1,(row3-$02)<<3); // ITM_MAP2






//   --------------------------  89  --------------------------- 
//    Nabooru ITEM MAP (ITM_MAP1)
rm_num  = $89;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Tile+area_TA+'087', STR_ow_axis+hex_str(0), STR_Town+STR_Nabooru, MapAreaName_DATAKEY+MapAreaName_NABOORU);
g.dm_rm[?rm+STR_Town+STR_House] = true;


row3=row0+$17; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_D,$2,  clm6<<3,y3,  dk_PI+hex_str(PIb),STR_Dialogue+DK0D01,STR_Sprite+STR_Zoey); // Shop Owner


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '0D'+EXM1_); // LFT 0, 


data_spawn(rm+STR_PRIO,ItmK8,$1,  _x1,(row3-$02)<<3); // ITM_MAP1








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
//                  Saria,  Target Minigame 1
rm_num  = $90;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Color+COLOR2_, STR_Tile+area_TA+'255', STR_ow_axis+hex_str(0), STR_Town+STR_Saria, MapAreaName_DATAKEY+MapAreaName_SARIA);


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init); // 
row3=row0+$14; y3=row3<<3;
data_spawn(rm+STR_PRIO,NPC_B,$1,  $14<<3,y3,  dk_PI+hex_str(PId),STR_Dialogue+DK0B00,STR_Sprite+STR_Jack); // Target Minigame 1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row3,  '07'+EXM0_); // LFT 0, 


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_HP,CONT_PIECE_OBJ_VER_HP,  $07<<3,(row0+$08)<<3,  STR_Treasure+STR_Map+"01"); // HEART PIECE v2: win Minigame to acquire






//   --------------------------  91  --------------------------- 
//    Minigame - Pogo to the Top
rm_num  = $91;
set_rm_data(area+hex_str(rm_num), MUS_HOUSE1, STR_Color+color_str(p.C_CYN4), STR_Tile+area_TA+'252', STR_View+'02', STR_ow_axis+hex_str(0), STR_Town+STR_Darunia, MapAreaName_DATAKEY+MapAreaName_DARUNIA);


row3=row0+$14; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000,1,Cloud_1_init); // 
data_spawn(rm+STR_PRIO,NPC_B,$3,  $12<<3,y3,  dk_PI+hex_str(PIc),STR_Dialogue+DK0B01,STR_Sprite+STR_Bill); // 'Pogo to the Top' Minigame Owner


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,$74,  '10'+EXM2_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,$08,  '10'+EXM3_); // RGT 0, 


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_HP,CONT_PIECE_OBJ_VER_HP,  $37<<3,$0E<<3,  STR_Treasure+STR_Map+"02"); // HEART PIECE 






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


// ===================================================================
var _X1=$19<<3;
//var _X1=$1C<<3;
var _DIST1  = ($03<<3)+$00; // _DIST1 from elevator center to both torch centers
var _DIST2  = ($08<<3)+$06; // _DIST2 from rm edge to locked door center
var _DIST3  = ($04<<3)+$00; // _DIST3 from locked door center to sign center
//
mus0         = MUS_HOUSE1;
mus1         = MUS_BASEMENT1;
_dark_idx    = 1;
_ow_axis     = 0;
//   --------------------------  B0  --------------------------- 
//    


//   --------------------------  B1  --------------------------- 
//    


//   --------------------------  B2  --------------------------- 
//    Town Fast Travel, Rauru, Basement2
_town_name1 = STR_Rauru;
rm_num  = $B2;
set_rm_data(area+hex_str(rm_num), mus1, STR_Dark+hex_str(_dark_idx), STR_Tile+area_TA+'123', STR_ow_axis+hex_str(_ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_RAURU);


clm3=clm1;     x3=clm3<<3; // clm3: Elevator center clm
row3=row0+$10; y3=row3<<3; // row3: Side exits PC spawn row
row4=row3+$02; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  (x3-_DIST1)-4,y4,  dk_PI+hex_str(_PI5),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  (x3+_DIST1)-4,y4,  dk_PI+hex_str(_PI5),STR_Lit); // v1: Light w/ CANDLE or FIRE

_dist=rm_w_-_DIST2; // _dist: from rm center to locked door center
_val=_dist-($04<<3);
row5=row3-$02; y5=row5<<3;
data_spawn(rm+STR_PRIO,LoDoA,$2,  (x0-_val)-4,y5,  STR_Side+hex_str($2)); // Locked Door
data_spawn(rm+STR_PRIO,LoDoA,$2,  (x0+_val)-4,y5,  STR_Side+hex_str($1)); // Locked Door

_dist-=_DIST3;
_dist-=$07<<3;
data_spawn(rm+STR_PRIO,NPC_0,$2,  (x0-_dist)-8,y3,  dk_PI+hex_str(_PI4),STR_Dialogue+DK0021); // Sign, "TO RUTO"
g.dm_spawn[?spawn_datakey+STR_Arrow]=2; // 2: Left  Arrow

data_spawn(rm+STR_PRIO,NPC_0,$2,  (x0+_dist)-8,y3,  dk_PI+hex_str(_PI4),STR_Dialogue+DK0023); // Sign, "TO MIDO"
g.dm_spawn[?spawn_datakey+STR_Arrow]=0; // 0: Right Arrow



_exit=data_exit(EXU0,etC0,1,  clm3-$04,row_e0,  CLMS4,ROWS5,  clm3-$01,row_e1,  '01'+EXM1_); // UP  0, Elevator UP 
_datakey = _town_name1+dk_FastTravel+STR_Exit+'B';
g.dm_rm[?_exit+dk_FastTravel+STR_Exit+STR_Datakey] = _datakey;
g.dm_rm[?_datakey] = _exit;
      data_Elev(EXU0_, clm3,row3-$01);                                                              // Elevator UP $80, 
      data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  'B6'+EXR0_); // LFT 0, to Ruto
      data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  'BE'+EXL0_); // RGT 0, to Mido
//

g.dm_rm[?rm+STR_Rando+dk_LandLocked] = true;







//   --------------------------  B3  --------------------------- 
//    


// ===================================================================
_ow_axis = 0;
//   --------------------------  B4  --------------------------- 
//    


//   --------------------------  B5  --------------------------- 
//    


//   --------------------------  B6  --------------------------- 
//    Town Fast Travel, Ruto, Basement2
_town_name1 = STR_Ruto;
rm_num  = $B6;
set_rm_data(area+hex_str(rm_num), mus1, STR_Dark+hex_str(_dark_idx), STR_Tile+area_TA+'130', STR_ow_axis+'03', STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_RUTO);


clm3=$28;      x3=clm3<<3; // clm3: Elevator center clm
row3=row0+$10; y3=row3<<3; // row3: Side exits PC spawn row
row4=row3+$02; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  (x3-_DIST1)-4,y4,  dk_PI+hex_str(_PI5),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  (x3+_DIST1)-4,y4,  dk_PI+hex_str(_PI5),STR_Lit); // v1: Light w/ CANDLE or FIRE

data_spawn(rm+STR_PRIO,LoDoA,$2,  ($0E<<3)+2,(row3-$02)<<3,  STR_Side+hex_str($2)); // Locked Door

x4 = (rm_w-(_DIST2+_DIST3)) - 8;
x4+=$02<<3;
data_spawn(rm+STR_PRIO,NPC_0,$2,  x4,y3,  dk_PI+hex_str(_PI4),STR_Dialogue+DK0020); // Sign, "TO RAURU"
g.dm_spawn[?spawn_datakey+STR_Arrow]=0; // 0: Right Arrow

data_spawn(rm+STR_PRIO,NPC_0,$2,  ($19<<3)+8,y3,  dk_PI+hex_str(_PI4),STR_Dialogue+DK0022); // Sign, "TO SARIA"
g.dm_spawn[?spawn_datakey+STR_Arrow]=2; // 2: Left  Arrow


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
_exit=data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '05'+EXM1_); // UP  0, Elevator UP 
_datakey = _town_name1+dk_FastTravel+STR_Exit+'B';
g.dm_rm[?_exit+dk_FastTravel+STR_Exit+STR_Datakey] = _datakey;
g.dm_rm[?_datakey] = _exit;
data_Elev(EXU0_, clm3,row3-$01); // Elevator UP $80, 

data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  'BA'+EXR0_); // LFT 0, to Saria
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  'B2'+EXL0_); // RGT 0, to Rauru
//

g.dm_rm[?rm+STR_Rando+dk_LandLocked] = true;
//MK_OWRC_TWN_RUTO1






//   --------------------------  B7  --------------------------- 
//    


// ===================================================================
_ow_axis     = 1;
//   --------------------------  B8  --------------------------- 
//    


//   --------------------------  B9  --------------------------- 
//    


//   --------------------------  BA  --------------------------- 
//    Town Fast Travel, Saria, Basement2
_town_name1 = STR_Saria;
rm_num  = $BA;
set_rm_data(area+hex_str(rm_num), mus1, STR_Dark+hex_str(_dark_idx), STR_Tile+area_TA+'129', STR_ow_axis+hex_str(_ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_SARIA);


clm3=$18;      x3=clm3<<3; // clm3: Elevator center clm
row3=row0+$10; y3=row3<<3; // row3: Side exits PC spawn row
row4=row3+$02; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  (x3-_DIST1)-4,y4,  dk_PI+hex_str(_PI5),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  (x3+_DIST1)-4,y4,  dk_PI+hex_str(_PI5),STR_Lit); // v1: Light w/ CANDLE or FIRE

_dist=rm_w_-_DIST2; // _dist: from rm center to locked door center
x4=(x0-_dist)-4;
x4+=$10;
data_spawn(rm+STR_PRIO,LoDoA,$2,  x4,(row3-$02)<<3,  STR_Side+hex_str($2)); // Locked Door

data_spawn(rm+STR_PRIO,NPC_0,$2,  ($21<<3)+8,y3,  dk_PI+hex_str(_PI4),STR_Dialogue+DK0021); // Sign, "TO RUTO"
g.dm_spawn[?spawn_datakey+STR_Arrow]=0; // 0: Right Arrow

_dist-=_DIST3;
data_spawn(rm+STR_PRIO,NPC_0,$2,  (x0-_dist)-8,y3,  dk_PI+hex_str(_PI4),STR_Dialogue+DK0023); // Sign, "TO MIDO"
g.dm_spawn[?spawn_datakey+STR_Arrow]=2; // 2: Left  Arrow


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
_exit=data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '08'+EXM0_); // UP  0, Elevator UP 
//_exit=data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  'B8'+EXR0_); // UP  0, Elevator UP 
_datakey = _town_name1+dk_FastTravel+STR_Exit+'B';
g.dm_rm[?_exit+dk_FastTravel+STR_Exit+STR_Datakey] = _datakey;
g.dm_rm[?_datakey] = _exit;
      data_Elev(EXU0_, clm3,row3-$01);                                                            // Elevator UP $80, 
      data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  'BE'+EXR0_); // LFT 0, to Mido
      data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  'B6'+EXL0_); // RGT 0, to Ruto
//

g.dm_rm[?rm+STR_Rando+dk_LandLocked] = true;







//   --------------------------  BB  --------------------------- 
//    


// ===================================================================

_ow_axis     = 1;
//   --------------------------  BC  --------------------------- 
//    


//   --------------------------  BD  --------------------------- 
//    


//   --------------------------  BE  --------------------------- 
//    Town Fast Travel, Mido, Basement2
_town_name1 = STR_Mido;
rm_num  = $BE;
set_rm_data(area+hex_str(rm_num), mus1, STR_Dark+hex_str(_dark_idx), STR_Tile+area_TA+'121', STR_ow_axis+hex_str(_ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_MIDO);



clm3=clm1;     x3=clm3<<3; // clm3: Elevator center clm
row3=row0+$10; y3=row3<<3; // row3: Side exits PC spawn row
row4=row3+$02; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  (x3-_DIST1)-4,y4,  dk_PI+hex_str(_PI5),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  (x3+_DIST1)-4,y4,  dk_PI+hex_str(_PI5),STR_Lit); // v1: Light w/ CANDLE or FIRE

_dist=rm_w_-(_DIST2+_DIST3);
_dist-=$06<<3;
data_spawn(rm+STR_PRIO,NPC_0,$2,  (x0-_dist)-8,y3,  dk_PI+hex_str(_PI4),STR_Dialogue+DK0020); // Sign, "TO RAURU"
g.dm_spawn[?spawn_datakey+STR_Arrow]=2; // 2: Left  Arrow

data_spawn(rm+STR_PRIO,NPC_0,$2,  (x0+_dist)-8,y3,  dk_PI+hex_str(_PI4),STR_Dialogue+DK0022); // Sign, "TO SARIA"
g.dm_spawn[?spawn_datakey+STR_Arrow]=0; // 0: Right Arrow



_exit=data_exit(EXU0,etC0,1,  clm3-$04,row_e0,  CLMS4,ROWS5,  clm3-$01,row_e1,  '09'+EXM0_); // UP  0, Elevator UP 
_datakey = _town_name1+dk_FastTravel+STR_Exit+'B';
g.dm_rm[?_exit+dk_FastTravel+STR_Exit+STR_Datakey] = _datakey;
g.dm_rm[?_datakey] = _exit;
      data_Elev(EXU0_, clm3,row3-$01);                                                              // Elevator UP $80, 
      data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  'B2'+EXR0_); // LFT 0, to Rauru
      data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  'BA'+EXL0_); // RGT 0, to Saria
//

g.dm_rm[?rm+STR_Rando+dk_LandLocked] = true;







//   --------------------------  BF  --------------------------- 
//    


// ===================================================================
_ow_axis     = 0;
//   --------------------------  C0  --------------------------- 
//    


//   --------------------------  C1  --------------------------- 
//    


//   --------------------------  C2  --------------------------- 
//    Town Fast Travel, Nabooru, Basement2
_town_name1 = STR_Nabooru;
rm_num  = $C2;
set_rm_data(area+hex_str(rm_num), mus1, STR_Dark+hex_str(_dark_idx), STR_Tile+area_TA+'110', STR_ow_axis+hex_str(_ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_NABOORU);



clm3=$20;      x3=clm3<<3; // clm3: Elevator center clm
row3=row0+$10; y3=row3<<3; // row3: Side exits PC spawn row
row4=row3+$02; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  (x3-_DIST1)-4,y4,  dk_PI+hex_str(_PI5),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  (x3+_DIST1)-4,y4,  dk_PI+hex_str(_PI5),STR_Lit); // v1: Light w/ CANDLE or FIRE

_dist=rm_w_-_DIST2; // _dist: from rm center to locked door center
data_spawn(rm+STR_PRIO,LoDoA,$2,  (x0-_dist)-4,(row3-$02)<<3,  STR_Side+hex_str($2)); // Locked Door

_dist-=_DIST3;
data_spawn(rm+STR_PRIO,NPC_0,$2,  (x0-_dist)-8,y3,  dk_PI+hex_str(_PI4),STR_Dialogue+DK0025); // Sign, "TO DARUNIA"
g.dm_spawn[?spawn_datakey+STR_Arrow]=2; // 2: Left  Arrow



_exit=data_exit(EXU0,etC0,1,  clm3-$04,row_e0,  CLMS4,ROWS5,  clm3-$01,row_e1,  '0E'+EXM0_); // UP  0, Elevator UP 
_datakey = _town_name1+dk_FastTravel+STR_Exit+'B';
g.dm_rm[?_exit+dk_FastTravel+STR_Exit+STR_Datakey] = _datakey;
g.dm_rm[?_datakey] = _exit;
      data_Elev(EXU0_, clm3,row3-$01);                                                              // Elevator UP $80, 
      data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  'C6'+EXR0_); // LFT 0, to Darunia
//

g.dm_rm[?rm+STR_Rando+dk_LandLocked] = true;







//   --------------------------  C3  --------------------------- 
//    


// ===================================================================
_ow_axis     = 0;
//   --------------------------  C4  --------------------------- 
//    


//   --------------------------  C5  --------------------------- 
//    


//   --------------------------  C6  --------------------------- 
//    Town Fast Travel, Darunia, Basement2
_town_name1 = STR_Darunia;
rm_num  = $C6;
set_rm_data(area+hex_str(rm_num), mus1, STR_Dark+hex_str(_dark_idx), STR_Tile+area_TA+'122', STR_ow_axis+hex_str(_ow_axis), STR_Town+_town_name1, MapAreaName_DATAKEY+MapAreaName_DARUNIA);


clm3=$28;      x3=clm3<<3; // clm3: Elevator center clm
row3=row0+$10; y3=row3<<3; // row3: Side exits PC spawn row

row4=row3+$02; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  (x3-_DIST1)-4,y4,  dk_PI+hex_str(_PI5),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  (x3+_DIST1)-4,y4,  dk_PI+hex_str(_PI5),STR_Lit); // v1: Light w/ CANDLE or FIRE

//data_spawn(rm+STR_PRIO,LoDoA,$2,  $36<<3,(row3-$02)<<3,  STR_Side+hex_str($2)); // Locked Door

_dist=rm_w_-(_DIST2+_DIST3);
data_spawn(rm+STR_PRIO,NPC_0,$2,  (x0+_dist)-8,y3,  dk_PI+hex_str(_PI4),STR_Dialogue+DK0024); // Sign, "TO NABOORU"
g.dm_spawn[?spawn_datakey+STR_Arrow]=0; // 0: Right Arrow



_exit=data_exit(EXU0,etC0,1,  clm3-$04,row_e0,  CLMS4,ROWS5,  clm3-$01,row_e1,  '11'+EXM0_); // UP  0, Elevator UP 
_datakey = _town_name1+dk_FastTravel+STR_Exit+'B';
g.dm_rm[?_exit+dk_FastTravel+STR_Exit+STR_Datakey] = _datakey;
g.dm_rm[?_datakey] = _exit;
      data_Elev(EXU0_, clm3,row3-$01);                                                              // Elevator UP $80, 
      data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  'C2'+EXL0_); // RGT 0, to Nabooru
//

g.dm_rm[?rm+STR_Rando+dk_LandLocked] = true;







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




