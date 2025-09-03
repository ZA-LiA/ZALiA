/// GameObjectData_Create()

if (DEV)
{
    var _START_TIME = current_time;
    show_debug_message("");
    show_debug_message("GameObjectData_Create() START");
}


var _i, _val, _spr;
var _obj;



/*  
E8FA-E941: 48 bytes
BODY_HB_DATA = "020C0317020C030A04080B0300182208FE0C003000080008030203700008F6200E040010FC1810100010001808100030F4280020006000800E04100E010608030020081804101818" + "020CF620" + "120C0317" + "0A0C0317" + "00100020";
BODY_HB_DATA = "020C0317" + "020C030A" + "04080B03" + "00182208" + "FE0C0030" + "00080008" + "03020370" + "0008F620" + "0E040010" + "FC181010" + "00100018" + "08100030" + "F4280020" + "00600080" + "0E04100E" + "01060803" + "00200818" + "04101818" + "020CF620" + "120C0317" + "0A0C0317" + "00100020";
id = ed3 & $1F
data = subStr(BODY_HB_DATA, (id<<3)+1, 8)

id      data        -    xOff    wdth    yOff    hght   -    xOff    yOff    wdth    hght

$00:    020C0317    -    $02     $0C     $03     $17    -      2,      3,     12,     23,   - 16x32 GO, RebonackA (facing R), Thunderbird, ..
$01:    020C030A    -    $02     $0C     $03     $0A    -      2,      3,     12,     10,   - 16x16 GO, 
$02:    04080B03    -    $04     $08     $0B     $03    -      4,     11,      8,      3,   - Myu, 
$03:    00182208    -    $00     $18     $22     $08    -      0,     34,     24,      8,   - Elevator, 
$04:    FE0C0030    -    $FE     $0C     $00     $30    -     -2,      0,     12,     48,   - LockedDoor, 
$05:    00080008    -    $00     $08     $00     $08    -      0,      0,      8,      8,   - Geldarm, 
$06:    03020370    -    $03     $02     $03     $70    -      3,      3,      2,    112,   - CrystalHolder 1, 
$07:    0008F620    -    $00     $08     $F6     $20    -      0,    -10,      8,     32,   - Horsehead, Helmethead, HelmetheadHead, 
$08:    0E040010    -    $0E     $04     $00     $10    -     14,      0,      4,     16,   - RebonackA, 
$09:    FC181010    -    $FC     $18     $10     $10    -     -4,     16,     24,     16,   - Aruroda, 
$0A:    00100018    -    $00     $10     $00     $18    -      0,      0,     16,     24,   - Barba, 
$0B:    08100030    -    $08     $10     $00     $30    -      8,      0,     16,     48,   - Carock, 
$0C:    F4280020    -    $F4     $28     $00     $20    -    -12,      0,     40,     32,   - ?, 
$0D:    00600080    -    $00     $60     $00     $80    -      0,      0,     96,    128,   - Barrier, 
$0E:    0E04100E    -    $0E     $04     $10     $0E    -     14,     16,      4,     14,   - ShadowLink(yOff changes to 0 and height to 29 right before collision check), 
$0F:    01060803    -    $01     $06     $08     $03    -      1,      8,      6,      3,   - RestoreFairy, Item, Blaze, 
$10:    00200818    -    $00     $20     $08     $18    -      0,      8,     32,     24,   - BossBot, 
$11:    04101818    -    $04     $10     $18     $18    -      4,     24,     16,     24,   - Gooma, 

$12:    020CF620    -    $02     $0C     $F6     $20    -      2,    -10,     12,     32,   - fix: Horsehead, Helmethead, 
$13:    120C0317    -    $12     $0C     $03     $17    -     18,      3,     12,     23,   - fix: RebonackA (facing L), ..
$14:    0A0C0317    -    $0A     $0C     $03     $17    -     10,      3,     12,     23,   - fix: Thunderbird, 

$15:    00100020    -    $00     $10     $00     $20    -      0,      0,     16,     32,   - Pushable
*/









//AREA_AL = "AreaAll"; // Same length as "_WestA_"
AREA_TA = Area_TownA;
AREA_PG = Area_PalcG;
AREA_PF = Area_PalcF;
AREA_PE = Area_PalcE;
AREA_PD = Area_PalcD;
AREA_PC = Area_PalcC;
AREA_PB = Area_PalcB;
AREA_PA = Area_PalcA;
AREA_MI = Area_MazIs;
AREA_EA = Area_EastA;
AREA_DM = Area_DthMt;
AREA_WA = Area_WestA;






// HB: body HitBox. Clm for g.dg_BODY_HB
HB00 = BODY_HB_IDX_DYNAMIC; // -2, For manually updated hb that still want collision checks
//              // 
HBa  = $01; // 16x16 GO, 
HBb  = $02; // 16x32 GO, RebonackA (facing R), RebonackB, Tektite (tall), Zora (standing)
//              // 
HBc  = $03; // RestoreFairy, Item(width==8), Blaze, 
HBd  = $04; // Geldarm, 
HBe  = $05; // Barba, 
HBf  = $06; // Pushable, 
HBg  = $07; // BossBot, TonnA
//              // 
HBh  = $08; // PlatformB v2(RAFT), 
HBi  = $09; // ShadowLink, 
HBj  = $0A; // Aruroda, Tektite (short), Zora (not standing)
HBk  = $0B; // Myu, 
//              // 
HBl  = $0C; // fix: Thunderbird
HBm  = $0D; // fix: RebonackA (facing L), ..
HBn  = $0E; // fix: Horsehead, 
HBo  = $0F; // Carock, 
HBp  = $10; // Gooma, 
//              // 
HBq  = $11; // LockedDoor, 
HBr  = $12; // Elevator, 
//              // 
HBs  = $13; // Barrier, 
HBt  = $14; // NPC (except Sign), 
HBu  = $15; // CrystalHolder 1, 
HBv  = $16; // HelmetheadHead, 
HBw  = $17; // Snaraa
//HBw  = $17; // Helmethead
HBx  = $18; // SpikeTrapB, 
HBy  = $30; // Projectile 8x8
HBz  = $31; // Projectile 16x8
HBaa = $50; // 16x16 circle 1. SpikeTrap, 
HBab = $19; // PlatformA
HBac = $29; // TorchA
HBad = $2A; // TonnA
//              // 
HBae = $2D; // Zelda(sleeping)
//              // 
HBaf = $1D; // Cucco
//              // 
HBag = $32; // Item(width==16)
//              // 
HBah = $33; // Helmethead
//              // 
HBai = $22; // GiantBubble(fix)
//              // 
HBaj = $62; // Ganon_Form3(48x32)
//              // 









// CS: Colliding Side. Clm for g.dg_CS_OFFSETS
// Reserving the clm 0-3 for PC
CSa = $04; // 16x16
CSb = $05; // 16x32
CSc = $06; // 8x16
CSd = $07; // 8x8
CSe = $08; // Pushable, 
CSf = $09; // SpikeTrapA, 
CSg = $14; // SpikeTrapB, 
CSh = $0B; // BlockB, 
CSi = $0C; // Bubble(skull only)
CSj = $0D; // ElevatorA, ElevatorB, 
CSk = $0E; // PlatformA, 
CSl = $0F; // TonnA, 
CSm = $10; // HelmetheadHead, 
CSn = $02; // Cucco norm
CSo = $03; // Cucco crouching
CSp = $1E; // 16x32 w/ lower CS_TOP







// PI: Palette Index
PIa = global.PI_MOB_ORG; // 7.  orange
PIb = global.PI_MOB_RED; // 8.  red
PIc = global.PI_MOB_BLU; // 9.  blue
PId = global.PI_MOB_PUR; // 10. purple

PIe = global.PI_BGR1; // 
PIf = global.PI_BGR2; // 
PIg = global.PI_BGR3; // 
PIh = global.PI_BGR4; // 

PIi = global.PI_PC1; // 

PIj = global.PI_GUI1; // 








// Proj body to PC body interaction.
// 0: none 
PBa1 = $01; // PC Body contact does not destroy proj
PBb1 = $02; // die/explode/disintegrate 
//PBc1 = $03; // 
//PBd1 = $04; // 



// Proj body to PC shld interaction.
// $000000: none/passive. Unblockable
// $01: die/explode/disintegrate. 
// $02: Bounce off and fall.      
// $04: Reverse direction.        
// $08: Stick, Remove REFLECT, 
// $0100: REFLECT needed if $01 bit
// $0200: REFLECT needed if $02 bit
// $0400: REFLECT needed if $04 bit
// $0800: REFLECT needed if $08 bit
// $010000: Sound 1
PSa1 =     $01; // die/explode/disintegrate. 
PSa2 = $010001; // die/explode/disintegrate.                 With Sound 1
PSa3 =   $0101; // die/explode/disintegrate. REFLECT needed. 
PSa4 = $010101; // die/explode/disintegrate. REFLECT needed. With Sound 1
PSa5 = $020101; // die/explode/disintegrate. REFLECT needed. With Sound 2

PSb1 =     $02; // Bounce off and fall.      
PSb2 = $010002; // Bounce off and fall.                      With Sound 1
PSb3 =   $0202; // Bounce off and fall.      REFLECT needed. 
PSb4 = $010202; // Bounce off and fall.      REFLECT needed. With Sound 1

PSc1 =     $04; // Reverse direction.        
PSc2 = $010004; // Reverse direction.                        With Sound 1
PSc3 =   $0404; // Reverse direction.        REFLECT needed. 
PSc4 = $010404; // Reverse direction.        REFLECT needed. With Sound 1
PSc5 = $010405; // Reverse dir or die.       REFLECT needed to reverse dir. With Sound 1

/*
// 1: die/explode/disintegrate. 2: 1, but need REFLECT. 
// 3: Bounce off and fall.      4: 3, but need REFLECT. 
// 5: Reverse direction.        6: 5, but need REFLECT. 
P2Sa = $00; // none/passive. 
P2Sb = $01; // die/explode/disintegrate. 
P2Sc = $02; // die/explode/disintegrate,    but need REFLECT.
P2Sd = $03; // Bounce off and fall.
P2Se = $04; // Bounce off and fall,         but need REFLECT.
P2Sf = $05; // Reverse direction.
P2Sg = $06; // Reverse direction,           but need REFLECT.
*/




/*  Lonk attack damage
dl_ATK_DMG[|$00] = $01; // If I ever use an attack level 0
dl_ATK_DMG[|$01] = $02; // atk level 1
dl_ATK_DMG[|$02] = $03; // atk level 2
dl_ATK_DMG[|$03] = $04; // atk level 3
dl_ATK_DMG[|$04] = $06; // atk level 4
dl_ATK_DMG[|$05] = $09; // atk level 5
dl_ATK_DMG[|$06] = $0C; // atk level 6
dl_ATK_DMG[|$07] = $12; // atk level 7
dl_ATK_DMG[|$08] = $18; // atk level 8
dl_ATK_DMG[|$09] = $1C; // atk level 9
*/
/*  GOB HP
ds_list_add(dl_HP,  $00); //  $00 =    0
ds_list_add(dl_HP,  $01); //  $01 =    1
ds_list_add(dl_HP,  $02); //  $02 =    2
ds_list_add(dl_HP,  $03); //  $03 =    3
ds_list_add(dl_HP,  $04); //  $04 =    4
ds_list_add(dl_HP,  $06); //  $06 =    6
ds_list_add(dl_HP,  $08); //  $08 =    8
ds_list_add(dl_HP,  $0A); //  $0A =   10
// $8-F
ds_list_add(dl_HP,  $0C); //  $0C =   12
ds_list_add(dl_HP,  $0E); //  $0E =   14
ds_list_add(dl_HP,  $10); //  $10 =   16
ds_list_add(dl_HP,  $12); //  $12 =   18
ds_list_add(dl_HP,  $14); //  $14 =   20
ds_list_add(dl_HP,  $18); //  $18 =   24
ds_list_add(dl_HP,  $1C); //  $1C =   28
ds_list_add(dl_HP,  $20); //  $20 =   32
// $10-17
ds_list_add(dl_HP,  $28); //  $28 =   40
ds_list_add(dl_HP,  $30); //  $30 =   48
ds_list_add(dl_HP,  $38); //  $38 =   56
ds_list_add(dl_HP,  $40); //  $40 =   64
ds_list_add(dl_HP,  $48); //  $48 =   72
ds_list_add(dl_HP,  $50); //  $50 =   80
ds_list_add(dl_HP,  $60); //  $60 =   96
ds_list_add(dl_HP,  $70); //  $70 =  112
// $18-1F
ds_list_add(dl_HP,  $80); //  $80 =  128
ds_list_add(dl_HP,  $90); //  $90 =  144
ds_list_add(dl_HP,  $A8); //  $A8 =  168
ds_list_add(dl_HP,  $C0); //  $C0 =  192
ds_list_add(dl_HP,  $D8); //  $D8 =  216
ds_list_add(dl_HP,  $F8); //  $F8 =  248
ds_list_add(dl_HP,  $FA); //  $FA =  250
ds_list_add(dl_HP,  $FF); //  $FF =  255
// $20-27
ds_list_add(dl_HP, $120); // $120 =  288
ds_list_add(dl_HP, $150); // $150 =  336
ds_list_add(dl_HP, $190); // $190 =  400
ds_list_add(dl_HP, $1E0); // $1E0 =  480
ds_list_add(dl_HP, $240); // $240 =  560
ds_list_add(dl_HP, $2B0); // $2B0 =  688
ds_list_add(dl_HP, $330); // $330 =  816
ds_list_add(dl_HP, $3C0); // $3C0 =  960
//                                                          // 

*/
// HP. Value is index of g.dl_HP
HPaa = $00; // 
HPab = $01; // 
HPac = $02; // 
HPad = $03; // 
HPae = $04; // 
HPaf = $05; // 
HPag = $06; // 
HPah = $07; // 
//              // 
HPai = $08; // 
HPaj = $09; // 
HPak = $0A; // 
HPal = $0B; // 
HPam = $0C; // 
HPan = $0D; // 
HPao = $0E; // 
HPap = $0F; // 
//              // 
HPaq = $10; // 
HPar = $11; // 
HPas = $12; // 
HPat = $13; // 
HPau = $14; // 
HPav = $15; // 
HPaw = $16; // 
HPax = $17; // 
//              // 
HPay = $18; // 
HPaz = $19; // 
HPba = $1A; // 
HPbb = $1B; // 
HPbc = $1C; // 
HPbd = $1D; // 
HPbe = $1E; // 
HPbf = $1F; // 
//              // 
HPMax = $1F;
//              // 










/*
dl_XP[|  $0] =    0; //    0 ==   $0
dl_XP[|  $1] =    1; //    1 ==   $1
dl_XP[|  $2] =    2; //    2 ==   $2
dl_XP[|  $3] =    3; //    3 ==   $3
dl_XP[|  $4] =    4; //    4 ==   $4
dl_XP[|  $5] =    5; //    5 ==   $5
dl_XP[|  $6] =    6; //    6 ==   $6
dl_XP[|  $7] =    7; //    7 ==   $7
dl_XP[|  $8] =    8; //    8 ==   $8
dl_XP[|  $9] =    9; //    9 ==   $9

dl_XP[|  $A] =   10; //   10 ==   $A
dl_XP[|  $B] =   15; //   15 ==   $F
dl_XP[|  $C] =   20; //   20 ==  $14
dl_XP[|  $D] =   25; //   25 ==  $19

dl_XP[|  $E] =   30; //   30 ==  $1E
dl_XP[|  $F] =   40; //   40 ==  $28
dl_XP[| $10] =   50; //   50 ==  $32
dl_XP[| $11] =   60; //   60 ==  $3C
dl_XP[| $12] =   70; //   70 ==  $46
dl_XP[| $13] =   80; //   80 ==  $50
dl_XP[| $14] =   90; //   90 ==  $5A

dl_XP[| $15] =  100; //  100 ==  $64
dl_XP[| $16] =  150; //  150 ==  $96
dl_XP[| $17] =  200; //  200 ==  $C8
dl_XP[| $18] =  250; //  250 ==  $FA

dl_XP[| $19] =  300; //  300 == $12C
dl_XP[| $1A] =  400; //  400 == $190
dl_XP[| $1B] =  500; //  500 == $1F4
dl_XP[| $1C] =  600; //  600 == $258
dl_XP[| $1D] =  700; //  700 == $2BC
dl_XP[| $1E] =  800; //  800 == $320
dl_XP[| $1F] =  900; //  900 == $384

dl_XP[| $20] = 1000; // 1000 == $3E8
dl_XP[| $21] = 1200; // 1200 == $44C
dl_XP[| $22] = 1500; // 1500 == $5CC
*/
XPa0 = $00; // 
XPa1 = $01; // 
XPa2 = $02; // 
XPa3 = $03; // 
XPa4 = $04; // 
XPa5 = $05; // 
XPa6 = $06; // 
XPa7 = $07; // 
XPa8 = $08; // 
XPa9 = $09; // 

XPb0 = $0A; // 
XPb1 = $0B; // 
XPb2 = $0C; // 
XPb3 = $0D; // 

XPc0 = $0E; // 
XPc1 = $0F; // 
XPc2 = $10; // 
XPc3 = $11; // 
XPc4 = $12; // 
XPc5 = $13; // 
XPc6 = $14; // 

XPd0 = $15; // 
XPd1 = $16; // 
XPd2 = $17; // 
XPd3 = $18; // 

XPe0 = $19; // 
XPe1 = $1A; // 
XPe2 = $1B; // 
XPe3 = $1C; // 
XPe4 = $1D; // 
XPe5 = $1E; // 
XPe6 = $1F; // 

XPf0 = $20; // 
XPf1 = $21; // 
XPf2 = $22; // 





/*
//                                  // 
// enemy attack level = $00  (NO DMG)
dg_enemy_damage[#$00,$00] =   0;
dg_enemy_damage[#$01,$00] =   0;
dg_enemy_damage[#$02,$00] =   0;
dg_enemy_damage[#$03,$00] =   0;
dg_enemy_damage[#$04,$00] =   0;
dg_enemy_damage[#$05,$00] =   0;
dg_enemy_damage[#$06,$00] =   0;
dg_enemy_damage[#$07,$00] =   0;
dg_enemy_damage[#$08,$00] =   0;
//                                  // 
// enemy attack level = $01           
dg_enemy_damage[#$00,$01] = $10; // f.level_lif = 1
dg_enemy_damage[#$01,$01] = $0C; // f.level_lif = 2
dg_enemy_damage[#$02,$01] = $0C; // f.level_lif = 3
dg_enemy_damage[#$03,$01] = $0C; // f.level_lif = 4
dg_enemy_damage[#$04,$01] = $08; // f.level_lif = 5
dg_enemy_damage[#$05,$01] = $04; // f.level_lif = 6
dg_enemy_damage[#$06,$01] = $04; // f.level_lif = 7
dg_enemy_damage[#$07,$01] = $04; // f.level_lif = 8
dg_enemy_damage[#$08,$01] = $03; // f.level_lif = 9
//                                  // 
// enemy attack level = $02           
dg_enemy_damage[#$00,$02] = $20;
dg_enemy_damage[#$01,$02] = $1C;
dg_enemy_damage[#$02,$02] = $14;
dg_enemy_damage[#$03,$02] = $10;
dg_enemy_damage[#$04,$02] = $0C;
dg_enemy_damage[#$05,$02] = $0C;
dg_enemy_damage[#$06,$02] = $08;
dg_enemy_damage[#$07,$02] = $08;
dg_enemy_damage[#$08,$02] = $06;
//                                  // 
// enemy attack level = $03           
dg_enemy_damage[#$00,$03] = $30;
dg_enemy_damage[#$01,$03] = $28;
dg_enemy_damage[#$02,$03] = $24;
dg_enemy_damage[#$03,$03] = $20;
dg_enemy_damage[#$04,$03] = $18;
dg_enemy_damage[#$05,$03] = $14;
dg_enemy_damage[#$06,$03] = $10;
dg_enemy_damage[#$07,$03] = $0C;
dg_enemy_damage[#$08,$03] = $08;
//                                  // 
// enemy attack level = $04           
dg_enemy_damage[#$00,$04] = $60;
dg_enemy_damage[#$01,$04] = $48;
dg_enemy_damage[#$02,$04] = $38;
dg_enemy_damage[#$03,$04] = $30;
dg_enemy_damage[#$04,$04] = $28;
dg_enemy_damage[#$05,$04] = $20;
dg_enemy_damage[#$06,$04] = $1C;
dg_enemy_damage[#$07,$04] = $18;
dg_enemy_damage[#$08,$04] = $12;
//                                  // 
// enemy attack level = $05           
dg_enemy_damage[#$00,$05] = $90;
dg_enemy_damage[#$01,$05] = $78;
dg_enemy_damage[#$02,$05] = $60;
dg_enemy_damage[#$03,$05] = $48;
dg_enemy_damage[#$04,$05] = $38;
dg_enemy_damage[#$05,$05] = $30;
dg_enemy_damage[#$06,$05] = $28;
dg_enemy_damage[#$07,$05] = $20;
dg_enemy_damage[#$08,$05] = $18;
//                                  // 
// enemy attack level = $06           
dg_enemy_damage[#$00,$06] = $E0;
dg_enemy_damage[#$01,$06] = $A0;
dg_enemy_damage[#$02,$06] = $80;
dg_enemy_damage[#$03,$06] = $70;
dg_enemy_damage[#$04,$06] = $60;
dg_enemy_damage[#$05,$06] = $50;
dg_enemy_damage[#$06,$06] = $40;
dg_enemy_damage[#$07,$06] = $30;
dg_enemy_damage[#$08,$06] = $24;
//                                  // 
// enemy attack level = $07           
dg_enemy_damage[#$00,$07] = $E0;
dg_enemy_damage[#$01,$07] = $C0;
dg_enemy_damage[#$02,$07] = $A0;
dg_enemy_damage[#$03,$07] = $90;
dg_enemy_damage[#$04,$07] = $80;
dg_enemy_damage[#$05,$07] = $70;
dg_enemy_damage[#$06,$07] = $60;
dg_enemy_damage[#$07,$07] = $50;
dg_enemy_damage[#$08,$07] = $3C;
//                                  // 
// enemy attack level = $08
dg_enemy_damage[#$00,$08] = $F0;
dg_enemy_damage[#$01,$08] = $D0;
dg_enemy_damage[#$02,$08] = $B0;
dg_enemy_damage[#$03,$08] = $A0;
dg_enemy_damage[#$04,$08] = $90;
dg_enemy_damage[#$05,$08] = $80;
dg_enemy_damage[#$06,$08] = $70;
dg_enemy_damage[#$07,$08] = $60;
dg_enemy_damage[#$08,$08] = $48;
//                                  // 
// enemy attack level = $09
                            _val=$70;
dg_enemy_damage[#$00,$09] = _val;
dg_enemy_damage[#$01,$09] = _val;
dg_enemy_damage[#$02,$09] = _val;
dg_enemy_damage[#$03,$09] = _val;
dg_enemy_damage[#$04,$09] = _val;
dg_enemy_damage[#$05,$09] = _val;
dg_enemy_damage[#$06,$09] = _val;
dg_enemy_damage[#$07,$09] = _val;
dg_enemy_damage[#$08,$09] = _val;
//                                  // 
// enemy attack level = $0A
                            _val+=$10;
dg_enemy_damage[#$00,$0A] = _val;
dg_enemy_damage[#$01,$0A] = _val;
dg_enemy_damage[#$02,$0A] = _val;
dg_enemy_damage[#$03,$0A] = _val;
dg_enemy_damage[#$04,$0A] = _val;
dg_enemy_damage[#$05,$0A] = _val;
dg_enemy_damage[#$06,$0A] = _val;
dg_enemy_damage[#$07,$0A] = _val;
dg_enemy_damage[#$08,$0A] = _val;
//                                  // 
// enemy attack level = $0B
                            _val+=$10;
dg_enemy_damage[#$00,$0B] = _val;
dg_enemy_damage[#$01,$0B] = _val;
dg_enemy_damage[#$02,$0B] = _val;
dg_enemy_damage[#$03,$0B] = _val;
dg_enemy_damage[#$04,$0B] = _val;
dg_enemy_damage[#$05,$0B] = _val;
dg_enemy_damage[#$06,$0B] = _val;
dg_enemy_damage[#$07,$0B] = _val;
dg_enemy_damage[#$08,$0B] = _val;
//                                  // 
// enemy attack level = $0C
                            _val+=$10;
dg_enemy_damage[#$00,$0C] = _val;
dg_enemy_damage[#$01,$0C] = _val;
dg_enemy_damage[#$02,$0C] = _val;
dg_enemy_damage[#$03,$0C] = _val;
dg_enemy_damage[#$04,$0C] = _val;
dg_enemy_damage[#$05,$0C] = _val;
dg_enemy_damage[#$06,$0C] = _val;
dg_enemy_damage[#$07,$0C] = _val;
dg_enemy_damage[#$08,$0C] = _val;
//                                  // 
// enemy attack level = $0D
dg_enemy_damage[#$00,$0D] = _val;
dg_enemy_damage[#$01,$0D] = _val;
dg_enemy_damage[#$02,$0D] = _val;
dg_enemy_damage[#$03,$0D] = _val;
dg_enemy_damage[#$04,$0D] = _val;
dg_enemy_damage[#$05,$0D] = _val;
dg_enemy_damage[#$06,$0D] = _val;
dg_enemy_damage[#$07,$0D] = _val;
dg_enemy_damage[#$08,$0D] = _val;
//                                  // 
// enemy attack level = $0E
                            _val+=$10;
dg_enemy_damage[#$00,$0E] = _val;
dg_enemy_damage[#$01,$0E] = _val;
dg_enemy_damage[#$02,$0E] = _val;
dg_enemy_damage[#$03,$0E] = _val;
dg_enemy_damage[#$04,$0E] = _val;
dg_enemy_damage[#$05,$0E] = _val;
dg_enemy_damage[#$06,$0E] = _val;
dg_enemy_damage[#$07,$0E] = _val;
dg_enemy_damage[#$08,$0E] = _val;
//                                  // 
// enemy attack level = $0F
                            _val+=$10;
dg_enemy_damage[#$00,$0F] = _val;
dg_enemy_damage[#$01,$0F] = _val;
dg_enemy_damage[#$02,$0F] = _val;
dg_enemy_damage[#$03,$0F] = _val;
dg_enemy_damage[#$04,$0F] = _val;
dg_enemy_damage[#$05,$0F] = _val;
dg_enemy_damage[#$06,$0F] = _val;
dg_enemy_damage[#$07,$0F] = _val;
dg_enemy_damage[#$08,$0F] = _val;
//                                  // 
*/



// GOB.react_swrd
// PC sword to GO body hb reaction. Each byte is reaction type. Each bit of a byte is sword atk type
// 0: no reaction
// $01: stab high, $02: stab low, $04: thrust dw, $08: thrust up, $10: , $20: , $40: , $80: 
// $000000FF: take dmg, $0000FF00: body is like a shield/solid, $FF0000: extra pushback/bounce
// $FF000000: Only action on sword collision is include CS_SW1 in cs
SWDa = $000000FF; // dmg   all atk
SWDb = $00000003; // dmg   stab high & low only (Thunderbird, ShadowLink, ..)
SWDc = $0000FF00; // solid all atk. (Tektite, Zora, BlockB, Pushable, ..)
SWDd = $000000FF & ~$8; // dmg   all atk  except thrust up  (Stalfos)
SWDe = $FF0000FF; // Only action on sword collision is include CS_SW1 in cs, and collidable with all attacks
SWDf = $00000007; // dmg   w/ upthrust does not collide
SWDg = $00000004; // dmg   downthrust only
SWDh = $FF000003; // Only action on sword collision is include CS_SW1 in cs, and collidable only with low & high attack
SWDi = $00000300; // solid to stab high, stab low



// PC projectile bits. 0: none, 1: Beam, 2: FIRE, 4: 
// 0 means no reaction, projectile will just move right through.
// body is vulnerable:      $0000FF
// disintigrate on body:    $00FF00
// ?                        $FF0000
PRJa = $01; // Beam can damage
PRJb = $02; // FIRE can damage
PRJc = PRJa  | PRJb; // Beam & FIRE can damage
PRJd = $FF00; // Any proj disintegrate on body collision AND does not damage
PRJe = $0100 | PRJb; // FIRE can damage, Beam disintegrate on collision
PRJf = $FF01; // Any proj disintegrate on body collision AND Beam can damage



// id for effect THNUNDER has on GO. 0: no effect
THNa = $01; // -All HP
THNb = $02; // -$32 HP
THNc = $03; // -$02 HP (Thunderbird)



// id for effect SPELL has on GO. 0: no effect
SPLa = $01; // Turn into Bot
SPLb = $02; // Turn into Ache
SPLc = $03; // Turn into RestoreFairy



// id for XP Drain effect. 0: none, 1: All
DRNa = $00; // None
DRNb = $01; // Drain   5 xp
//DRNb = $01; // Drain All xp
DRNc = $02; // Drain  10 xp
DRNd = $03; // Drain  20 xp



// Respawn type. 0: never, 1: off screen, 2: refresh area, 3: refresh rm, 4: 30 seconds (on or off screen)
RSPa = $00; // never
RSPb = $01; // off screen (unlim)
RSPc = $02; // refresh area
RSPd = $03; // refresh rm
RSPe = $04; // off screen timed (unlim)



// Drop type. 0: none, 1: small, 2: big, 3: bomb, ...
DRPa = $00; // none
DRPb = g.DROP_JAR1 | g.DROP_BAG1; // Jar $10,  PBag  50
DRPc = g.DROP_JAR2 | g.DROP_BAG3; // Jar full, PBag 200
//DRPd = g.DROP_BOM1; // bomb





BRIGHT1=1;
BRIGHT2=2;






var _PI1    = PIb;
var _PI2    = PIc;
//                  // 
var _HB1    = HBa;
var _HB2    = HBb;
var _HB3    = HBb;
//                  // 
var _CS1    = CSa;
var _CS2    = CSb;
//                  // 
var _HP1    = $1E;
var _HP2    = HPbf;
var _HP3    = $1E;
//                  // 
var _ATK    = $01;
var _ATK1   = $01;
var _ATK2   = $04;
//                  // 
var _XP1    = $10;
var _XP2    = $0C;
//                  // 
var _RSP    = RSPb;
//                  // 
var _DRP    = DRPa;
//                  // 
var _SWD    = SWDa;
//                  // 
var _PRJ    = PRJc;
//                  // 
var _SPL    = SPLa;
//                  // 
var _THN    = THNb;
//                  // 
var _DRN    = DRNa;
//                  // 
var _PB1    = PBa1;
//                  // 
var _PS1    = PSa1;
//                  // 
var _bright1= BRIGHT1;








o_name = "";




// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------















// -----------------------------------------------------------------------------
// GameObject  --------------------------------------------------------
o_name = object_get_name(GameObject);
data_go_prop1(    GameObject, "GameObject", spr_Placement_16x16);
data_go_scr(  o_name,   0,   0,   0,   0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBa, CSa,   0,    0,   0, RSPc,    0,    0,    0,    0,    0,    0);


// -----------------------------------------------------------------------------
// GameObjectB  -------------------------------------------------------
o_name = object_get_name(GameObjectB);
data_go_prop1(    GameObjectB, "GameObjectB", spr_Placement_16x16);
data_go_scr(  o_name,   GameObjectB_init, 0, GameObjectB_step,   0,   0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBa, CSa,   0,    0,   0, RSPc,    0,    0,    0,    0,    0,    0);













// -----------------------------------------------------------------------------
// Cutscene: Build Saria bridge  ----------------------------------
o_name = object_get_name(Cutscene_SariaBridge);
data_go_prop1(    Cutscene_SariaBridge, o_name, spr_Placement_16x16);
data_go_scr(  o_name,   Cutscene_init, Cutscene_SariaBridge_init, Cutscene_SariaBridge_update);


// -----------------------------------------------------------------------------
// Cutscene: Build Magical-Key house  -----------------------------
o_name = object_get_name(Cutscene_MagicalKeyHouse);
data_go_prop1(    Cutscene_MagicalKeyHouse, o_name, spr_Placement_16x16);
data_go_scr(  o_name,   Cutscene_init, Cutscene_MagicalKeyHouse_init, Cutscene_MagicalKeyHouse_update);


// -----------------------------------------------------------------------------
// Cutscene: Enter house through chimney/fireplace  -----------------------
o_name = object_get_name(Cutscene_EnterFromChimney);
data_go_prop1(    Cutscene_EnterFromChimney, o_name, spr_Placement_16x16);
data_go_scr(  o_name,   Cutscene_init, Cutscene_EnterFromChimney_init_2, Cutscene_EnterFromChimney_update_1a);
//data_go_scr(  o_name,   Cutscene_init, Cutscene_DaruniaChimney_init, Cutscene_DaruniaChimney_update);


// -----------------------------------------------------------------------------
// Cutscene: ShadowBoss scene controller  -----------------------
o_name = object_get_name(Cutscene_ShadowBoss_1); // Pre-fight.
data_go_prop1(    Cutscene_ShadowBoss_1, o_name, spr_Placement_16x16);
data_go_scr(  o_name,   Cutscene_init, Cutscene_ShadowBoss_1_init, Cutscene_ShadowBoss_1_update);

o_name = object_get_name(Cutscene_ShadowBoss_2); // Post-fight.
data_go_prop1(    Cutscene_ShadowBoss_2, o_name, spr_Placement_16x16);
data_go_scr(  o_name,   Cutscene_init, Cutscene_ShadowBoss_2_init, Cutscene_ShadowBoss_2_update, 0, Cutscene_ShadowBoss_2_draw);


// -----------------------------------------------------------------------------
// Cutscene: Game end, waking Zelda  ----------------------------------
o_name = object_get_name(Cutscene_GameEnd_1A);
data_go_prop1(    Cutscene_GameEnd_1A, o_name, spr_Placement_16x16);
data_go_scr(  o_name,   Cutscene_init, Cutscene_GameEnd_1A_init, Cutscene_GameEnd_1A_update, 0, Cutscene_GameEnd_1A_draw, Cutscene_GameEnd_1A_end);


// -----------------------------------------------------------------------------
// Cutscene: End Game Credits  ----------------------------------
o_name = object_get_name(Cutscene_GameEnd_1B);
data_go_prop1(    Cutscene_GameEnd_1B, o_name, spr_Placement_16x16);
data_go_scr(  o_name,   Cutscene_init, Cutscene_GameEnd_1B_init, Cutscene_GameEnd_1B_update, 0, Cutscene_GameEnd_1B_draw);


// -----------------------------------------------------------------------------
// Cutscene: Moai opening its mouth  ----------------------------------
o_name = object_get_name(Cutscene_MoaiOpenMouth_1);
data_go_prop1(    Cutscene_MoaiOpenMouth_1, o_name, spr_Moai_mouth_1a_1);
data_go_scr(  o_name,   Cutscene_MoaiOpenMouth_init_1, Cutscene_MoaiOpenMouth_1_init_2, Cutscene_MoaiOpenMouth_1_update, Cutscene_MoaiOpenMouth_1_udp, Cutscene_MoaiOpenMouth_1_draw);


// -----------------------------------------------------------------------------
// Cutscene: Moai opening its mouth  ----------------------------------
o_name = object_get_name(Cutscene_MoaiOpenMouth2);
data_go_prop1(    Cutscene_MoaiOpenMouth2, o_name, spr_Moai_mouth_3a); // taller & wider mouth
data_go_scr(  o_name,   Cutscene_MoaiOpenMouth_init_1, Cutscene_MoaiOpenMouth2_init_2, Cutscene_MoaiOpenMouth2_update, Cutscene_MoaiOpenMouth_1_udp, Cutscene_MoaiOpenMouth2_draw);


// -----------------------------------------------------------------------------
// Cutscene: Water starts from source and falls to ground  ----------------------------------
o_name = object_get_name(Cutscene_CreateWaterfall);
data_go_prop1(    Cutscene_CreateWaterfall, o_name, spr_Placement_16x16);
data_go_scr(  o_name,   Cutscene_CreateWaterfall_init_1, Cutscene_CreateWaterfall_init_2, Cutscene_CreateWaterfall_update, Cutscene_CreateWaterfall_udp, Cutscene_CreateWaterfall_draw, Cutscene_CreateWaterfall_end);


// -----------------------------------------------------------------------------
// Cutscene: Ground under PC crumbles  ----------------------------------
o_name = object_get_name(Cutscene_FloorTrap_1);
data_go_prop1(    Cutscene_FloorTrap_1, o_name, spr_Placement_16x16);
data_go_scr(  o_name,   Cutscene_FloorTrap_1_init_1, Cutscene_FloorTrap_1_init_2, Cutscene_FloorTrap_1_update, 0, Cutscene_FloorTrap_1_draw, Cutscene_FloorTrap_1_end);













// -----------------------------------------------------------------------------
// Challenge_BlockConfiguration  --------------------------------------------------------
o_name = object_get_name(Challenge_BlockConfiguration);
data_go_prop1(    Challenge_BlockConfiguration, "Challenge_BlockConfiguration", spr_Placement_16x16);
data_go_scr(  o_name,   Challenge_init, Challenge_BlockConfiguration_init, Challenge_BlockConfiguration_update, 0, 0, Challenge_BlockConfiguration_end);


// -----------------------------------------------------------------------------
// Challenge_IntermittentPlatformSequence  --------------------------------------------------------
o_name = object_get_name(Challenge_IntermittentPlatformSequence);
data_go_prop1(    Challenge_IntermittentPlatformSequence, "Challenge_IntermittentPlatformSequence", spr_Placement_16x16);
data_go_scr(  o_name,   Challenge_init, Challenge_IntermittentPlatformSequence_init, Challenge_IntermittentPlatformSequence_update, 0, Challenge_IntermittentPlatformSequence_draw, Challenge_IntermittentPlatformSequence_end);


// -----------------------------------------------------------------------------
// Challenge_SwitchA  --------------------------------------------------------
o_name = object_get_name(Challenge_SwitchA);
data_go_prop1(    Challenge_SwitchA, "Challenge_SwitchA", spr_Placement_16x16);
data_go_scr(  o_name,   Challenge_init, Challenge_SwitchA_init, Challenge_SwitchA_update, 0, 0, Challenge_SwitchA_end);


// -----------------------------------------------------------------------------
// Challenge_SwitchB  --------------------------------------------------------
o_name = object_get_name(Challenge_SwitchB);
data_go_prop1(    Challenge_SwitchB, "Challenge_SwitchB", spr_Placement_16x16);
data_go_scr(  o_name,   Challenge_init, Challenge_SwitchB_init, Challenge_SwitchB_update, 0, 0, Challenge_SwitchB_end);


// -----------------------------------------------------------------------------
// Challenge_SwitchC  --------------------------------------------------------
o_name = object_get_name(Challenge_SwitchC);
data_go_prop1(    Challenge_SwitchC, "Challenge_SwitchC", spr_Placement_16x16);
data_go_scr(  o_name,   Challenge_init, Challenge_SwitchC_init, Challenge_SwitchC_update, 0, Challenge_SwitchC_draw, Challenge_SwitchC_end);


// -----------------------------------------------------------------------------
// Challenge_SwitchC  --------------------------------------------------------
o_name = object_get_name(Challenge_SwitchD);
data_go_prop1(    Challenge_SwitchD, "Challenge_SwitchD", spr_Placement_16x16);
data_go_scr(  o_name,   Challenge_init, Challenge_SwitchC_init, Challenge_SwitchC_update, 0, Challenge_SwitchC_draw, Challenge_SwitchC_end);




// -----------------------------------------------------------------------------
// TogglingPathDirectionA  --------------------------------------------------------
// Path Router, tpr: Toggling Path Router, tpd: Toggling Path Direction
o_name = object_get_name(TogglingPathDirectionA);
data_go_prop1(    TogglingPathDirectionA, "TogglingPathDirectionA", spr_Placement_16x16);
data_go_scr(  o_name,   TogglingPathDirectionA_init1, TogglingPathDirectionA_init2, TogglingPathDirectionA_update, TogglingPathDirectionA_udp, TogglingPathDirectionA_draw, TogglingPathDirectionA_end);


// -----------------------------------------------------------------------------
// TogglingPathDirectionB  --------------------------------------------------------
o_name = object_get_name(TogglingPathDirectionB);
data_go_prop1(    TogglingPathDirectionB, "TogglingPathDirectionB", spr_Placement_16x16);
data_go_scr(  o_name,   TogglingPathDirectionB_init1, TogglingPathDirectionB_init2, TogglingPathDirectionB_update, TogglingPathDirectionB_udp, TogglingPathDirectionB_draw, TogglingPathDirectionB_end);


// -----------------------------------------------------------------------------
// Challenge_DefeatAllA  --------------------------------------------------------
o_name = object_get_name(Challenge_DefeatAllA);
data_go_prop1(    Challenge_DefeatAllA, "Challenge_DefeatAllA", spr_Placement_16x16);
data_go_scr(  o_name,   Challenge_DefeatAllA_init_1, Challenge_DefeatAllA_init_2, Challenge_DefeatAllA_update, 0, 0, Challenge_DefeatAllA_end);


// -----------------------------------------------------------------------------
// Challenge_LightTorchesA  --------------------------------------------------------
o_name = object_get_name(Challenge_LightTorchesA);
data_go_prop1(    Challenge_LightTorchesA, "Challenge_LightTorchesA", spr_Placement_16x16);
data_go_scr(  o_name,   Challenge_LightTorchesA_init_1, Challenge_LightTorchesA_init_2, Challenge_LightTorchesA_update, 0, 0, Challenge_LightTorchesA_end);

// -----------------------------------------------------------------------------
// Challenge_SpellSequenceA  --------------------------------------------------------
o_name = object_get_name(Challenge_SpellSequenceA);
data_go_prop1(    Challenge_SpellSequenceA, "Challenge_SpellSequenceA", spr_Placement_16x16);
data_go_scr(  o_name,   Challenge_SpellSequenceA_init_1, Challenge_SpellSequenceA_init_2, Challenge_SpellSequenceA_update, Challenge_SpellSequenceA_udp, Challenge_SpellSequenceA_draw, Challenge_SpellSequenceA_end);

// -----------------------------------------------------------------------------
// Challenge_PushableMatching1  --------------------------------------------------------
o_name = object_get_name(Challenge_PushableMatching1);
data_go_prop1(    Challenge_PushableMatching1, "Challenge_PushableMatching1", spr_Placement_16x16);
data_go_scr(  o_name,   Challenge_PushableMatching1_init_1, Challenge_PushableMatching1_init_2, Challenge_PushableMatching1_update, 0, Challenge_PushableMatching1_draw, Challenge_PushableMatching1_end);

// -----------------------------------------------------------------------------
// Challenge_Secret01  --------------------------------------------------------
o_name = object_get_name(Challenge_Secret01);
data_go_prop1(    Challenge_Secret01, "Challenge_Secret01", spr_Placement_16x16);
data_go_scr(  o_name,   Challenge_Secret01_init_1, Challenge_Secret01_init_2, Challenge_Secret01_update, Challenge_Secret01_udp, Challenge_Secret01_draw, Challenge_Secret01_end);













// -----------------------------------------------------------------------------
// Switch  --------------------------------------------------------
o_name = object_get_name(SwchA);
data_go_prop1(    SwchA, "SwitchA", spr_Switch_part_1a_1);
data_go_scr(  o_name,   Switch_init, SwitchA_init2, SwitchA_update, SwitchA_udp, SwitchA_draw);


o_name = object_get_name(SwchB);
data_go_prop1(    SwchB, "SwitchB", spr_SwitchB_1a);
data_go_scr(  o_name,   Switch_init, SwitchB_init, SwitchB_update, SwitchB_udp, 0);








// -----------------------------------------------------------------------------
// RestoreFairy  --------------------------------------------------------
o_name = object_get_name(ReFaA);
data_go_prop1(    ReFaA, "RestoreFairy", g.dl_Fairy_SPRITES[|0]); // spr_FairyA
data_go_scr(  o_name,   GameObjectB_init, RestoreFairy_init2, RestoreFairy_update, RestoreFairy_udp);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0, RSPc,    0,    0,    0,    0,    0,    0);


// -----------------------------------------------------------------------------
// ElevatorA  --------------------------------------------------------
o_name = object_get_name(ElevA);
data_go_prop1(    ElevA, "Elevator", spr_Placement_24x48);
data_go_scr(  o_name,   ElevatorA_init1, Elevator_init2, Elevator_update, Elevator_udp, Elevator_draw, Elevator_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBr, CSj,   0,    0,   0, RSPd,    0,    0,    0,    0,    0,    0);


// -----------------------------------------------------------------------------
// ElevatorB  --------------------------------------------------------
o_name = object_get_name(ElevatorB);
data_go_prop1(    ElevatorB, "ElevatorB", spr_Placement_24x48);
data_go_scr(  o_name,   ElevatorB_init1, ElevatorB_init2, ElevatorB_update, ElevatorB_udp, ElevatorB_draw, Elevator_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBr, CSj,   0,    0,   0, RSPd,    0,    0,    0,    0,    0,    0);


// -----------------------------------------------------------------------------
// LockedDoor  --------------------------------------------------------
o_name = object_get_name(LoDoA);
data_go_prop1(    LoDoA, "LockedDoor", spr_Locked_Door1B);
data_go_scr(  o_name,   GameObjectB_init, LockedDoor_init2, LockedDoor_update, LockedDoor_udp, LockedDoor_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBq, CSa,   0,    0,   0,    0,    0,    0,    0,    0,    0,    0);
data_go_prop2(o_name+"02", PIa, HBq, CSa,   0,    0,   0,    0,    0,    0,    0,    0,    0,    0);
data_go_prop2(o_name+"03", PIa, HBq, CSa,   0,    0,   0,    0,    0,    0,    0,    0,    0,    0);


// -----------------------------------------------------------------------------
// ArenaGateA  --------------------------------------------------------
o_name = object_get_name(ArenaGateA);
data_go_prop1(    ArenaGateA, "ArenaGateA", spr_Placement_08x16);
data_go_scr(  o_name,   ArenaGateA_init1, ArenaGateA_init2, ArenaGateA_update, ArenaGateA_udp, ArenaGateA_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBq, CSa,   0,    0,   0,    0,    0,    0,    0,    0,    0,    0);


// -----------------------------------------------------------------------------
// FallingBlock  --------------------------------------------------------
o_name = object_get_name(FaBlA);
data_go_prop1(    FaBlA, "FallingBlock", spr_Block_01a);
data_go_scr(  o_name,   GameObjectB_init, FallingBlock_init2, FallingBlock_update, FallingBlock_udp);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIe, HBa, CSa,HPMax, $01,   0,    0,    0, SWDe,    0,    0,    0,    0);


// -----------------------------------------------------------------------------
// BlockB  --------------------------------------------------------
o_name = object_get_name(BlckB);
data_go_prop1(    BlckB, "BlockB", spr_Block_02a);
data_go_scr(  o_name,   GameObjectB_init, BlockB_init2, BlockB_update, BlockB_udp, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIh, $66, CSh,   0,  $01,   0,    0,    0, SWDc,    0,    0,    0,    0);


// -----------------------------------------------------------------------------
// CrystalHolder  --------------------------------------------------------
o_name = object_get_name(CrHoA);
data_go_prop1(    CrHoA, "CrystalHolder", spr_Crystal_1a);
data_go_scr(  o_name,   GameObjectB_init, CrystalHolder_init2, CrystalHolder_update, CrystalHolder_udp);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBu, CSb,   0,    0,   0, RSPd,    0,    0,    0,    0,    0,    0);


// -----------------------------------------------------------------------------
// SpawnByStab  --------------------------------------------------------
o_name = object_get_name(SpStA);
data_go_prop1(    SpStA, "SpawnByStab", spr_Placement_16x16);
data_go_scr(  o_name,   GameObjectB_init, SpawnByStab_init2, SpawnByStab_update, 0, 0);

// Tested in OG: ENIGMA does turn a SpawnByStab into a Bot
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBa, CSa,HPbf,  $00,   0, RSPc,    0, SWDa,    0,    0, SPLa,   0);
data_go_prop2(o_name+"02", PIb, HBa, CSa,HPbf,  $00,   0, RSPc,    0, SWDa,    0,    0, SPLa,   0);


// -----------------------------------------------------------------------------
// Barrier  --------------------------------------------------------
o_name = object_get_name(BarrA);
data_go_prop1(    BarrA, "Barrier", spr_Barrier_1a);
data_go_scr(  o_name,   GameObjectB_init, Barrier_init2, Barrier_update, Barrier_udp, Barrier_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBs, CSa,   0,  $06,   0, RSPc,    0,    0,    0,    0,    0,    0);


o_name = object_get_name(Barrier2);
data_go_prop1(    Barrier2, "Barrier2", spr_Block_02a);
data_go_scr(  o_name,   Barrier2_init1, Barrier2_init2, Barrier2_update, Barrier2_udp, Barrier2_draw, Barrier2_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBa, CSa,   0,    0,   0, RSPc,    0,    0,    0,    0,    0,    0);


// -----------------------------------------------------------------------------
// Pushable  --------------------------------------------------------
_ATK1 = $02;
o_name = object_get_name(PushA);
data_go_prop1(    PushA, "Pushable", spr_Placement_16x32);
data_go_scr(  o_name,   GameObjectB_init, Pushable_init2, Pushable_update, 0, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa,   0, CSe,   0,_ATK1,   0, RSPd,    0, SWDc,    0,    0,    0,    0);
data_go_prop2(o_name+"02", PIa,   0, CSe,   0,_ATK1,   0, RSPd,    0, SWDc,    0,    0,    0,    0);
data_go_prop2(o_name+"03", PIa,   0, CSe,   0,_ATK1,   0, RSPd,    0, SWDc,    0,    0,    0,    0);


// -----------------------------------------------------------------------------
// PushableRefresher  --------------------------------------------------------
o_name = object_get_name(PushableRefresher);
data_go_prop1(    PushableRefresher, "PushableRefresher", spr_PillarHead01b);
data_go_scr(  o_name,   PushableRefresher_init1, PushableRefresher_init2, PushableRefresher_update, PushableRefresher_udp, PushableRefresher_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIe, HBa,   0,   0,    0,   0, RSPd,    0, SWDh,    0,    0,    0,    0);


// -----------------------------------------------------------------------------
// SpikeTrap  --------------------------------------------------------
_ATK1=$03; _ATK2=$06;
o_name = object_get_name(SpTrA);
data_go_prop1(    SpTrA, "SpikeTrapA", spr_Spike_ball_2a);
data_go_scr(  o_name,   GameObjectB_init, SpikeTrapA_init2, SpikeTrapA_update, SpikeTrapA_udp, SpikeTrapA_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc,HBaa, CSf,   0,_ATK1,   0, RSPd,    0, SWDc,    0,    0,    0,    0);
//data_go_prop2(o_name+"01", PIc,HBaa, CSf,   0,_ATK1,   0, RSPd,    0, SWDc,    0,    0,    0,    0); // Horizontal
//data_go_prop2(o_name+"02", PIc,HBaa, CSf,   0,_ATK1,   0, RSPd,    0, SWDc,    0,    0,    0,    0); // Vertical


o_name = object_get_name(SpTrB);
data_go_prop1(    SpTrB, "SpikeTrapB", spr_Myu_2a);
data_go_scr(  o_name,   GameObjectB_init, SpikeTrapB_init2, SpikeTrapB_update, SpikeTrapB_udp, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBx, CSg,   0,  $03,   0, RSPd,    0, SWDc,    0,    0,    0,    0); // Horizontal
data_go_prop2(o_name+"02", PIc, HBx, CSg,   0,  $03,   0, RSPd,    0, SWDc,    0,    0,    0,    0); // Horizontal, Treats edges as walls


o_name = object_get_name(SpTrC);
data_go_prop1(    SpTrC, "SpikeTrapC", spr_Spike_ball_1a);
data_go_scr(  o_name,   SpikeTrapC_init1, SpikeTrapC_init2, SpikeTrapC_update, SpikeTrapC_udp, SpikeTrapC_draw, SpikeTrapC_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, $51, CSf,   0,  $03,   0, RSPd,    0, SWDc,    0,    0,    0,    0); // 


// -----------------------------------------------------------------------------
// FireRope  --------------------------------------------------------
_bright1=2;
o_name = object_get_name(FiRoA);
data_go_prop1(    FiRoA, "FireRope", spr_Placement_08x08);
data_go_scr(  o_name,   FireRope_init1, FireRope_init2, FireRope_update, FireRope_udp, FireRope_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa,  -1,   0,   0,  $03,   0, RSPd,    0,    0,    0,    0,    0,    0,    _bright1); // 


// -----------------------------------------------------------------------------
// PlatformA  --------------------------------------------------------
o_name = object_get_name(PlatformA);
data_go_prop1(    PlatformA, "PlatformA", spr_Placement_24x08);
data_go_scr(  o_name,   PlatformA_init_1, PlatformA_init_2, PlatformA_update, PlatformA_udp, PlatformA_draw, PlatformA_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa,HBab, CSk,   0,    0,   0, RSPd,    0,    0,    0,    0,    0,    0);
data_go_prop2(o_name+"02", PIa,HBab, CSk,   0,    0,   0, RSPd,    0,    0,    0,    0,    0,    0);

// PlatformB  --------------------------------------------------------
o_name = object_get_name(PlatformB);
data_go_prop1(    PlatformB, "PlatformB", spr_cloud_2a);
data_go_scr(  o_name,   PlatformB_init_1, PlatformB_init_2, PlatformB_update, PlatformB_udp, PlatformB_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, $55,   0,   0,    0,   0, RSPd,    0,    0,    0,    0,    0,    0);
data_go_prop2(o_name+"02", PIa, HBh,   0,   0,    0,   0, RSPd,    0,    0,    0,    0,    0,    0);


// PlatformCloud  --------------------------------------------------------
o_name = object_get_name(PlatformCloud);
data_go_prop1(    PlatformCloud, "PlatformCloud", spr_Placement_08x08);
data_go_scr(  o_name,   PlatformCloud_init1, PlatformCloud_init2, PlatformCloud_update, PlatformCloud_udp, PlatformCloud_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",  -1,HB00,   0,   0,    0,   0, RSPd,    0,    0,    0,    0,    0,    0);


// PlatformRaft  --------------------------------------------------------
o_name = object_get_name(PlatformRaft);
data_go_prop1(    PlatformRaft, "PlatformRaft", spr_Placement_64x08);
//data_go_prop1(    PlatformRaft, "PlatformRaft", spr_Placement_08x08);
data_go_scr(  o_name,   PlatformRaft_init_1, PlatformRaft_init_2, PlatformRaft_update, PlatformRaft_udp, PlatformRaft_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",  -1,HB00,   0,   0,    0,   0, RSPd,    0,    0,    0,    0,    0,    0);


// -----------------------------------------------------------------------------
// TorchA  --------------------------------------------------------
o_name = object_get_name(TorchA);
data_go_prop1(    TorchA, "TorchA", spr_Torch_1a);
data_go_scr(  o_name,   TorchA_init1, TorchA_init2, TorchA_update, TorchA_udp, TorchA_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIe,HBac, CSc,HPbf,    0,   0, RSPd,    0, SWDe, PRJb,    0,    0,    0,    1);
data_go_prop2(o_name+"02", PIe,HBac, CSc,HPbf,    0,   0, RSPd,    0,    0, PRJb,    0,    0,    0,    1);
data_go_prop2(o_name+"03", PIe,HBac, CSc,HPbf,    0,   0, RSPd,    0, SWDe, PRJb,    0,    0,    0,    1);


// -----------------------------------------------------------------------------
// Cucco  --------------------------------------------------------
o_name = object_get_name(Cucco);
data_go_prop1(    Cucco, "Cucco", spr_Placement_16x16);
data_go_scr(  o_name,   Cucco_init, Cucco_init2, Cucco_update, Cucco_udp, Cucco_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa,HBaf, CSn,HPbf,    0,   0, RSPd,    0, SWDa, PRJb,    0,    0,    0);


// -----------------------------------------------------------------------------
// Eyenocc  --------------------------------------------------------
o_name = object_get_name(Eyenocc);
data_go_prop1(    Eyenocc, "Eyenocc", spr_Eyenocc01_1);
data_go_scr(  o_name,   Eyenocc_init1, Eyenocc_init2, Eyenocc_update, Eyenocc_udp, Eyenocc_draw, Eyenocc_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIh, $66, CSh,HPMax,   0,   0,    0,    0, SWDa, PRJd,    0,    0,    0);







// -----------------------------------------------------------------------------
// MiniGame  ------------------------------------------------
o_name = object_get_name(MnGmA);
data_go_prop1(    MnGmA, "MiniGame_A", spr_Placement_16x16);
data_go_scr(  o_name,   init_MiniGame, MiniGameA_init, MiniGameA_update, 0, MiniGameA_draw, MiniGame_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",   0, HBt,   0,   0,    0,   0,    0,    0,    0,    0,    0,    0,    0);
data_go_prop2(o_name+"02",   0, HBt,   0,   0,    0,   0,    0,    0,    0,    0,    0,    0,    0);


// -----------------------------------------------------------------------------
// Mini-game Target  ------------------------------------------------
o_name = object_get_name(TargA);
data_go_prop1(    TargA, "MiniGame_Target_A", spr_Placement_16x16);
data_go_scr(  o_name,   Target_init, TargetA_init2, TargetA_update, TargetA_udp, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PId, HBa, CSa,   0,    0,   0,    0,    0, SWDb,    0, THNb,    0,    0);
data_go_prop2(o_name+"02", PId, HBa, CSa,   0,    0,   0, RSPb,    0, SWDa, PRJc,    0,    0,    0);









// -----------------------------------------------------------------------------
// Item  --------------------------------------------------------
_HB1 = HBag; // HBag: Item(width==16)
o_name = object_get_name(Item);
data_go_prop1(    Item, "Item", spr_Placement_16x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSa,   0,    0,   0,    0,    0,    0,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmA0); // CANDLE                                                                         //
data_go_prop1(    ItmA0, "CANDLE", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmA1); // GLOVE                                                                          //
data_go_prop1(    ItmA1, "GLOVE", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmA2); // RAFT                                                                           //
data_go_prop1(    ItmA2, "RAFT", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmA3); // BOOTS                                                                          //
data_go_prop1(    ItmA3, "BOOTS", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmA4); // FLUTE                                                                          //
data_go_prop1(    ItmA4, "FLUTE", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmA5); // CROSS                                                                          //
data_go_prop1(    ItmA5, "CROSS", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmA6); // HAMMER                                                                         //
data_go_prop1(    ItmA6, "HAMMER", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmA7); // SWORD
data_go_prop1(    ItmA7, "SWORD", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0,    0,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmA8); // RESCUE FAIRY
data_go_prop1(    ItmA8, "RESCUE_FAIRY", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, $35, CSc,   0,    0,   0,    0,    0,    0,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmA9); // POWER BRACELET
data_go_prop1(    ItmA9, "BRACELET", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmAA); // BOOK
data_go_prop1(    ItmAA, "BOOK", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmAB); // MEAT
data_go_prop1(    ItmAB, "MEAT", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmAC); // NECKLACE
data_go_prop1(    ItmAC, "NECKLACE", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmAD); // MASK
data_go_prop1(    ItmAD, "MASK", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmAE); // SHIELD
data_go_prop1(    ItmAE, "SHIELD", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmAF); // RING
data_go_prop1(    ItmAF, "RING", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmK5); // TABLET
data_go_prop1(    ItmK5, "TABLET", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmK6); // SKELETON KEY
data_go_prop1(    ItmK6, "SKELETON_KEY", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmK7); // FEATHER
data_go_prop1(    ItmK7, "FEATHER", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmK8); // ITEM MAP - WEST
data_go_prop1(    ItmK8, "ITEM_MAP1", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmK9); // ITEM MAP - EAST
data_go_prop1(    ItmK9, "ITEM_MAP2", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmKA); // MAGICAL KEY
data_go_prop1(    ItmKA, "MAGICAL_KEY", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
//                                                                                                          //
//                                                                                                          //
o_name = object_get_name(ItmB0); // HEART CONTAINER                                                                //
data_go_prop1(    ItmB0, "HEART_CONTAINER", spr_Placement_16x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb,_HB1, CSa,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
data_go_prop2(o_name+"02", PIb,_HB1, CSa,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0); // win from minigame
//                                                                                                          //
o_name = object_get_name(ItmB1); // MAGIC CONTAINER                                                                //
data_go_prop1(    ItmB1, "MAGIC_CONTAINER", spr_Placement_16x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa,_HB1, CSa,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
data_go_prop2(o_name+"02", PIa,_HB1, CSa,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0); // win from minigame
//                                                                                                          //
//                                                                                                          //
//                                                                                                          //
o_name = object_get_name(ItmC0); // TROPHY                                                                         //
data_go_prop1(    ItmC0, "TROPHY", spr_Placement_16x16);                                               //
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa,_HB1, CSa,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmC1); // NOTE                                                                           //
data_go_prop1(    ItmC1, "NOTE", spr_Placement_08x16); // Bagu note                                    //
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmC2); // MIRROR                                                                         //
data_go_prop1(    ItmC2, "MIRROR", spr_Placement_08x16);                                               //
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
//                                                                                                          //
_PI1 = PIa;
o_name = object_get_name(ItmC3); // MEDICINE/FLOWER                                                                //                                                                     //
data_go_prop1(    ItmC3, "MEDICINE", g.SPR_ITEM_MEDICINE);                                             //
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", _PI1, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
//                                                                                                          //
o_name = object_get_name(ItmC4); // CHILD                                                                          //
data_go_prop1(    ItmC4, "CHILD", spr_Placement_16x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa,_HB1, CSa,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
o_name = object_get_name(ItmC5); // BLOOD BOTTLE
data_go_prop1(    ItmC5, "BLOOD_BOTTLE", spr_Placement_16x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb,_HB1, CSa,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);
//                                                                                                          //
//                                                                                                          //
//                                                                                                          //
//                                                                                                          //
/*
//                                                                                                          //
o_name = object_get_name(ItmK0); // BOTTLE
data_go_prop1(    ItmK0, "BOTTLE", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSa,   0,    0,   0,    0,    0,    0,    0,    0,    0,    0);
*/
//                                                                                                          //
o_name = object_get_name(ItmK1); // BOTTLE & FOUNTAIN WATER WATER NABOORU QUEST
data_go_prop1(    ItmK1, "WATER", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBc, CSa,   0,    0,   0,    0,    0,    0,    0,    0,    0,    0);
//                                                                                                          //
//                                                                                                          //
//                                                                                                          //
o_name = object_get_name(ItmD0); // Key                                                                            //
data_go_prop1(    ItmD0, "Key", spr_Placement_08x16);                                                  //
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBc, CSc,   0,    0,   0,    0,    0, SWDa,    0,    0,    0,    0);
//                                                                                                          //
//                                                                                                          //
o_name = object_get_name(ItmE0); // Jar                                                                            //
data_go_prop1(    ItmE0, "Jar_Magic", spr_Placement_08x16);                                            //
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBc, CSc,   0,    0,   0,    0,    0, SWDa,    0); // Red  (Full) - Refresh area to respawn
data_go_prop2(o_name+"02", PIc, HBc, CSc,   0,    0,   0,    0,    0, SWDa,    0); // Blue ($10)  - Unlim respawn
data_go_prop2(o_name+"03", PIc, HBc, CSc,   0,    0,   0,    0,    0, SWDa,    0); // Blue ($10)  - Refresh area to respawn
data_go_prop2(o_name+"04", PIb, HBc, CSc,   0,    0,   0,    0,    0, SWDa,    0); // Red  (Full) - Unlim respawn
//                                                                                                          //
//                                                                                                          //
//                                                                                                          //
o_name = object_get_name(ItmF0); // P-Bag                                                                          //
data_go_prop1(    ItmF0, "Bag_Points", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
_PI1=PIa; _HB1=HBc; _CS1=CSc; _SWD=SWDa;
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",_PI1,_HB1,_CS1,   0,    0,XPc2,    0,    0, _SWD,    0); //   50
data_go_prop2(o_name+"02",_PI1,_HB1,_CS1,   0,    0,XPd0,    0,    0, _SWD,    0); //  100
data_go_prop2(o_name+"03",_PI1,_HB1,_CS1,   0,    0,XPd1,    0,    0, _SWD,    0); //  150
data_go_prop2(o_name+"04",_PI1,_HB1,_CS1,   0,    0,XPd2,    0,    0, _SWD,    0); //  200
data_go_prop2(o_name+"05",_PI1,_HB1,_CS1,   0,    0,XPd3,    0,    0, _SWD,    0); //  250
data_go_prop2(o_name+"06",_PI1,_HB1,_CS1,   0,    0,XPe0,    0,    0, _SWD,    0); //  300
data_go_prop2(o_name+"07",_PI1,_HB1,_CS1,   0,    0,XPe1,    0,    0, _SWD,    0); //  400
data_go_prop2(o_name+"08",_PI1,_HB1,_CS1,   0,    0,XPe2,    0,    0, _SWD,    0); //  500
data_go_prop2(o_name+"09",_PI1,_HB1,_CS1,   0,    0,XPe4,    0,    0, _SWD,    0); //  700
data_go_prop2(o_name+"0A",_PI1,_HB1,_CS1,   0,    0,XPf0,    0,    0, _SWD,    0); // 1000
//                                                                                                          //
//                                                                                                          //
//                                                                                                          //
o_name = object_get_name(ItmG0); // Extra Life                                                                     //
data_go_prop1(    ItmG0, "Extra_Life", spr_Placement_08x16);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIi, HBc, CSc,   0,    0,   0,    0,    0, SWDg,    0);
//                                                                                                          //
//                                                                                                          //
//                                                                                                          //
o_name = object_get_name(ItmH0); // Triforce                                                                       //
data_go_prop1(    ItmH0, "Triforce", spr_Triforce_1a);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc,_HB1, CSa,   0,    0,   0,    0,    0,    0,    0);
//                                                                                                          //
//                                                                                                          //
//                                                                                                          //
o_name = object_get_name(ItmS0); // Spell Item
data_go_prop1(    ItmS0, "Spell", spr_SpellItem01);
data_go_scr(  o_name,   Item_init, Item_init_2, Item_update, Item_udp, Item_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa,_HB1, CSa,   0,    0,   0,    0,    0, SWDg,    0,    0,    0,    0);

















// -----------------------------------------------------------------------------
// NPC_0  --------------------------------------------------------
o_name = object_get_name(NPC_0);
data_go_prop1(    NPC_0, "NPC_0", spr_Placement_16x32); // Sign & Invisible
data_go_scr(  o_name,   NPC_init1, NPC_init2, NPC_0_update, NPC_1_udp, NPC_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBb, CSb,   0,    0,   0, RSPb,    0,    0,    0,    0,    0,    0); // Ivisible
data_go_prop2(o_name+"02", PIa, HBb, CSb,   0,    0,   0, RSPb,    0,    0,    0,    0,    0,    0); // Town Sign
data_go_prop2(o_name+"03", PIa, HBb, CSb,   0,    0,   0, RSPb,    0,    0,    0,    0,    0,    0); // Mirror
data_go_prop2(o_name+"04", PIa, HBb, CSb,   0,    0,   0, RSPb,    0,    0,    0,    0,    0,    0); // Fountain
data_go_prop2(o_name+"05", PIb, HBt,   0,   0,    0,   0, RSPd,    0,    0,    0,    0,    0,    0); // Stone Head
data_go_prop2(o_name+"06", PIa, HBb, CSb,   0,    0,   0, RSPb,    0,    0,    0,    0,    0,    0); // Plaque



_RSP=RSPd;
// -----------------------------------------------------------------------------
// NPC_1  --------------------------------------------------------
o_name = object_get_name(NPC_1);
data_go_prop1(    NPC_1, "NPC_1", spr_Placement_16x32); // Idle Simple
data_go_scr(  o_name,   NPC_init1, NPC_init2,   NPC_1_update,   NPC_1_udp,   NPC_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // 


// -----------------------------------------------------------------------------
// NPC_2  --------------------------------------------------------
o_name = object_get_name(NPC_2);
data_go_prop1(    NPC_2, "NPC_2", spr_Placement_16x32); // Walk Traffic from spawner
data_go_scr(  o_name,   NPC_init1, NPC_init2,   NPC_3_update,   NPC_1_udp,   NPC_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // 


// -----------------------------------------------------------------------------
// NPC_3  --------------------------------------------------------
o_name = object_get_name(NPC_3);
data_go_prop1(    NPC_3, "NPC_3", spr_Placement_16x32); // Walk Special
data_go_scr(  o_name,   NPC_init1, NPC_init2,   NPC_3_update,   NPC_1_udp,   NPC_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // 
data_go_prop2(o_name+"02", PIb, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // 
data_go_prop2(o_name+"03", PIb, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // 
data_go_prop2(o_name+"04", PIb, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // 


// -----------------------------------------------------------------------------
// NPC_4  --------------------------------------------------------
o_name = object_get_name(NPC_4);
data_go_prop1(    NPC_4, "NPC_4", spr_Placement_16x32); // Heal, Save
data_go_scr(  o_name,   NPC_init1, NPC_init2,   NPC_4_update,   NPC_4_udp,   NPC_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Life
data_go_prop2(o_name+"02", PIa, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Magic
data_go_prop2(o_name+"03", PIc, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Save


// -----------------------------------------------------------------------------
// NPC_5  --------------------------------------------------------
o_name = object_get_name(NPC_5);
data_go_prop1(    NPC_5, "NPC_5", spr_Placement_16x32); // Quest
data_go_scr(  o_name,   NPC_init1, NPC_init2,   NPC_4_update,   NPC_4_udp,   NPC_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // 


// -----------------------------------------------------------------------------
// NPC_6  --------------------------------------------------------
o_name = object_get_name(NPC_6);
data_go_prop1(    NPC_6, "NPC_6", spr_Placement_16x32); // Skill Knight
data_go_scr(  o_name,   NPC_init1, NPC_init2,   NPC_7_update,   NPC_1_udp,   NPC_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PId, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Skill Knight Downthrust
data_go_prop2(o_name+"02", PId, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Skill Knight Upthrust


// -----------------------------------------------------------------------------
// NPC_7  --------------------------------------------------------
o_name = object_get_name(NPC_7);
data_go_prop1(    NPC_7, "NPC_7", spr_Placement_16x32); // Spell Giver
data_go_scr(  o_name,   NPC_init1, NPC_init2,   NPC_7_update,   NPC_7_udp,   NPC_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // 
data_go_prop2(o_name+"02", PIa, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // CUCCO spell


// -----------------------------------------------------------------------------
// NPC_8  --------------------------------------------------------
o_name = object_get_name(NPC_8);
data_go_prop1(    NPC_8, "NPC_8", spr_Placement_16x32); // Mido fairy requesting RESCUE FAIRY rescue
data_go_scr(  o_name,   NPC_init1, NPC_init2, NPC_8_update, NPC_8_udp, NPC_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // 


// -----------------------------------------------------------------------------
// NPC_9  --------------------------------------------------------
o_name = object_get_name(NPC_9);
data_go_prop1(    NPC_9, "NPC_9", spr_Placement_16x32); // Idle Special
data_go_scr(  o_name, NPC_init1, NPC_init2, NPC_9_update, NPC_9_udp, NPC_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Bagu
data_go_prop2(o_name+"02", PId, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Riverman
data_go_prop2(o_name+"03", PIb, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Moblin NPC
data_go_prop2(o_name+"04", PId, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Ache NPC
data_go_prop2(o_name+"05", PId, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Bot  NPC
data_go_prop2(o_name+"06", PIb, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Error
data_go_prop2(o_name+"07", PIb, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Error's friend
data_go_prop2(o_name+"08", PIb, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Scroblin
data_go_prop2(o_name+"09", PIb, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Midus
data_go_prop2(o_name+"0A", PIc, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Anju friend 1. BOOK sequence 1
data_go_prop2(o_name+"0B", PId, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Anju.          BOOK sequence 2
data_go_prop2(o_name+"0C", PId, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Anju friend 2. BOOK sequence 3
data_go_prop2(o_name+"0D", PId, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Town fairy requesting rescue of Rescue Fairy
data_go_prop2(o_name+"0E", PId, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Boulder circle sequence 1
data_go_prop2(o_name+"0F", PId, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Ache in monster town


// -----------------------------------------------------------------------------
// NPC_A.  Triforce Keeper  --------------------------------------
o_name = object_get_name(NPC_A);
data_go_prop1(    NPC_A, "NPC_A", spr_Placement_16x16); // 
data_go_scr(  o_name, NPC_init1, NPC_init2, NPC_A_update, NPC_A_udp, NPC_A_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBt, CSa,   0,    0,   0, RSPa,    0,    0,    0,    0,    0,    0); // 


// -----------------------------------------------------------------------------
// NPC_B.  Mini Game Owner  --------------------------------------
o_name = object_get_name(NPC_B);
data_go_prop1(    NPC_B, "NPC_B", spr_Placement_16x32); // 
data_go_scr(  o_name, NPC_init1, NPC_B_init, NPC_B_update, NPC_1_udp, -1, NPC_B_end);
//data_go_scr(  o_name,   NPC_init1, NPC_B_init,   NPC_B_step,   NPC_1_udp,   NPC_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Target Game
data_go_prop2(o_name+"02", PIb, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // 
data_go_prop2(o_name+"03", PIb, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Downstab Bounce Vertical Climb


// -----------------------------------------------------------------------------
// NPC_C.  Spell Sequence  ----------------------------------------
o_name = object_get_name(NPC_C);
data_go_prop1(    NPC_C, "NPC_C", spr_Placement_16x32); // Sign & Invisible
data_go_scr(  o_name, NPC_init1, NPC_init2, NPC_C_update, NPC_C_udp, NPC_C_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBb, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // King's Tomb, Passage to NECKLACE item
data_go_prop2(o_name+"02", PIa, HBb, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Passage to NECKLACE item
data_go_prop2(o_name+"03", PIa, HBb, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // Kakusu in Kasuto Cemetery


// -----------------------------------------------------------------------------
// NPC_D.  Shop Owner  --------------------------------------
o_name = object_get_name(NPC_D);
data_go_prop1(    NPC_D, "NPC_D", spr_Placement_16x32); // 
data_go_scr(  o_name, NPC_init1, NPC_D_init2, NPC_D_update, NPC_D_udp, NPC_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // 
data_go_prop2(o_name+"02", PIb, HBt, CSb,   0,    0,   0, _RSP,    0,    0,    0,    0,    0,    0); // 


// -----------------------------------------------------------------------------
// Zelda  -------------------------------------------------------
o_name = object_get_name(Zelda);
data_go_prop1(    Zelda, "Zelda", spr_Zelda_Placement_1); // 
data_go_scr(  o_name,   NPC_init1, Zelda_init2, Zelda_update, Zelda_udp, Zelda_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb,HBae, CSb,   0,    0,   0,    0,    0,    0,    0,    0,    0,    0); // 
data_go_prop2(o_name+"02", PIb, HBt, CSb,   0,    0,   0,    0,    0,    0,    0,    0,    0,    0); // 









// -----------------------------------------------------------------------------
// BagoSpawner  --------------------------------------------------------
o_name = object_get_name(SpBaA);
data_go_prop1(    SpBaA, "BagoSpawner", spr_Placement_16x16);
data_go_scr(  o_name,   Spawner_Bago_init1, Spawner_Bago_init2, Spawner_Bago_update, 0, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb,   0,   0,   0,    0,   0, RSPb,    0,    0,    0,    0,    0, DRNc);
data_go_prop2(o_name+"02", PIb,   0,   0,   0,    0,   0, RSPb,    0,    0,    0,    0,    0, DRNc);


// -----------------------------------------------------------------------------
// BoggnippSpawner  --------------------------------------------------------
o_name = object_get_name(Spawner_Boggnipp);
data_go_prop1(    Spawner_Boggnipp, "BoggnippSpawner", spr_Placement_16x16);
data_go_scr(  o_name,   Spawner_Boggnipp_init1, Spawner_Boggnipp_init2, Spawner_Boggnipp_update, 0, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb,   0,   0,   0,    0,   0, RSPb,    0,    0,    0,    0,    0, DRNc);


// -----------------------------------------------------------------------------
// BubbleSpawner  --------------------------------------------------------
o_name = object_get_name(SpPoA);
data_go_prop1(    SpPoA, "BubbleSpawner", spr_Placement_16x16);
data_go_scr(  o_name,   GameObjectB_init, Spawner_PoisonBubble_init2, Spawner_PoisonBubble_update);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa,   0,   0,   0,    0,   0, RSPb,    0,    0,    0,    0,    0, DRNc);
data_go_prop2(o_name+"02", PIa,   0,   0,   0,    0,   0, RSPb,    0,    0,    0,    0,    0, DRNc);
data_go_prop2(o_name+"03", PIa,   0,   0,   0,    0,   0, RSPb,    0,    0,    0,    0,    0,    0); // 2nd quest Gooma


// -----------------------------------------------------------------------------
// BulletSpawner  --------------------------------------------------------
o_name = object_get_name(SpBuA);
data_go_prop1(    SpBuA, "BulletSpawner", spr_Placement_16x16);
data_go_scr(  o_name,   GameObjectB_init, Spawner_Bullet_init2, Spawner_Bullet_update, 0, 0, Spawner_Bullet_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa,   0,   0,   0,    0,   0, RSPb,    0,    0,    0,    0,    0,    0); // shoot right
data_go_prop2(o_name+"02", PIa,   0,   0,   0,    0,   0, RSPb,    0,    0,    0,    0,    0,    0); // shoot left


// -----------------------------------------------------------------------------
// DropSpawner  --------------------------------------------------------
o_name = object_get_name(SpDrA);
data_go_prop1(    SpDrA, "DropSpawner", spr_Placement_16x16);
data_go_scr(  o_name,   GameObjectB_init, Spawner_Drop_init2, Spawner_Drop_update, Spawner_Drop_udp, Spawner_Drop_draw, Spawner_Drop_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb,   0,   0,   0,    0,   0, RSPd,    0,    0,    0,    0,    0,    0);
data_go_prop2(o_name+"02", PIb,   0,   0,   0,    0,   0, RSPd,    0,    0,    0,    0,    0,    0);
data_go_prop2(o_name+"03", PIb,   0,   0,   0,    0,   0, RSPd,    0,    0,    0,    0,    0,    0);


// -----------------------------------------------------------------------------
// GruntSpawner  --------------------------------------------------------
o_name = object_get_name(SpGrA);
data_go_prop1(    SpGrA, "GruntSpawner", spr_Placement_16x16);
data_go_scr(  o_name,   GameObjectB_init, Spawner_Grunt_init2, Spawner_Grunt_update);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",   0,   0,   0,   0,    0,   0, RSPb,    0,    0,    0,    0,    0,    0);


// -----------------------------------------------------------------------------
// MauSpawner  --------------------------------------------------------
o_name = object_get_name(SpMaA);
data_go_prop1(    SpMaA, "MauSpawner", spr_Placement_16x16);
data_go_scr(  o_name,   GameObjectB_init, Spawner_Mau_init2, Spawner_Mau_update);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb,   0,   0,   0,    0,   0, RSPb,    0,    0,    0,    0,    0, DRNc);


// -----------------------------------------------------------------------------
// MobySpawner  --------------------------------------------------------
o_name = object_get_name(SpMoA);
data_go_prop1(    SpMoA, "MobySpawner", spr_Placement_16x16);
data_go_scr(  o_name,   GameObjectB_init, Spawner_Moby_init2, Spawner_Moby_update);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",   0,   0,   0,   0,    0,   0, RSPb,    0,    0,    0,    0,    0,    0);


// -----------------------------------------------------------------------------
// RockSpawner  --------------------------------------------------------
o_name = object_get_name(SpRoA);
data_go_prop1(    SpRoA, "RockSpawner", spr_Placement_16x16);
data_go_scr(  o_name,   GameObjectB_init, Spawner_Rock_init2, Spawner_Rock_update, 0, 0, Spawner_Rock_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",   0,   0,   0,   0,    0,   0, RSPb,    0,    0,    0,    0,    0, DRNc);
data_go_prop2(o_name+"02",   0,   0,   0,   0,    0,   0, RSPb,    0,    0,    0,    0,    0, DRNc);


// -----------------------------------------------------------------------------
// WosuSpawner  --------------------------------------------------------
o_name = object_get_name(SpWoA);
data_go_prop1(    SpWoA, "WosuSpawner", spr_Placement_16x16);
data_go_scr(  o_name,   Spawner_Wosu_init1, Spawner_Wosu_init2, Spawner_Wosu_update, 0, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",   0,   0,   0,   0,    0,   0, RSPb,    0,    0,    0,    0,    0,    0);


// -----------------------------------------------------------------------------
// Spawner_FallingBlock  --------------------------------------------------------
o_name = object_get_name(Spawner_FallingBlock);
data_go_prop1(    Spawner_FallingBlock, o_name, spr_Placement_16x16);
data_go_scr(  o_name,   GameObjectB_init, Spawner_FallingBlock_init2, Spawner_FallingBlock_update, 0, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",   0,   0,   0,   0,    0,   0, RSPb,    0,    0,    0,    0,    0,    0);
data_go_prop2(o_name+"02",   0,   0,   0,   0,    0,   0, RSPb,    0,    0,    0,    0,    0,    0);


// -----------------------------------------------------------------------------
// NPC_Spawner  --------------------------------------------------------
o_name = object_get_name(SpNPA);
data_go_prop1(    SpNPA, "NPC Spawner", spr_Placement_16x16);
data_go_scr(  o_name,   GameObjectB_init, Spawner_NPC_init2, Spawner_NPC_update, 0, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",   0,   0,   0,   0,    0,   0, RSPb,    0,    0,    0,    0,    0,    0);








// -----------------------------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------------------------




_RSP = RSPa;

// -----------------------------------------------------------------------------
// Horsehead  --------------------------------------------------------
o_name = object_get_name(HorsA); // *
data_go_prop1(    HorsA, "Horsehead", spr_Horsehead_body1A);
data_go_scr(  o_name,   Horsehead_init1, Horsehead_init2, Horsehead_update, Horsehead_udp, Horsehead_draw, Horsehead_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBn, CSb, $0F,  $03, $15, _RSP,    0, SWDa, PRJd,    0,    0,    0);


// -----------------------------------------------------------------------------
// Helmethead  --------------------------------------------------------
o_name = object_get_name(HelmA); // *
data_go_prop1(    HelmA, "Helmethead", spr_Helmethead_body_1);
data_go_scr(  o_name,   Helmethead_init1, Helmethead_init2, Helmethead_update, Helmethead_udp, Helmethead_draw, Helmethead_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc,HBah, CSb, $11,  $04, $17, _RSP,    0, SWDa, PRJd,    0,    0,    0);
//data_go_prop2(o_name+"02", PIc,HBah, CSb, $1B,  $06, $1D, _RSP,    0, SWDa, PRJd,    0,    0,    0);
//

// -----------------------------------------------------------------------------
// RebonackA  --------------------------------------------------------
o_name = object_get_name(ReboA); // *
data_go_prop1(    ReboA, "RebonackA", spr_Placement_32x32);
data_go_scr(  o_name,   RebonackA_init1, RebonackA_init2, RebonackA_update, RebonackA_udp, RebonackA_draw, Boss_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBm, CSb,HPau,  $04,XPe0, _RSP,    0, SWDa, PRJd,    0,    0,    0);
data_go_prop2(o_name+"02", PIc, HBm, CSb,HPau,  $04,XPe0, _RSP,    0, SWDa, PRJd,    0,    0,    0);


// -----------------------------------------------------------------------------
// RebonackB  --------------------------------------------------------
o_name = object_get_name(ReboB); // *
data_go_prop1(    ReboB, "RebonackB", spr_Iron_Knuckle_Idle1);
data_go_scr(  o_name,   Boss_init_1, RebonackB_init2, RebonackB_update, RebonackB_udp, IronKnuckle_draw, Boss_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBb, CSb, $11,  $01, $19, _RSP,    0, SWDa, PRJd,    0,    0,    0);
//data_go_prop2(o_name+"01", PIc, HBb, CSb, $06,  $01, $19, _RSP,    0, SWDa, PRJd,    0,    0,    0);
data_go_prop2(o_name+"02", PId, HBb, CSb, $1B,  $03, $1C, _RSP,    0, SWDa, PRJd,    0,    0,    0); // Dark Knight

data_REFLECT_vuln(o_name+"01", object_get_name(Mace1)+"01", object_get_name(Mace1)+"02", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Mace1)+"01", object_get_name(Mace1)+"02", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Carock  --------------------------------------------------------
o_name = object_get_name(CaroA); // *
data_go_prop1(    CaroA, "Carock", spr_Carock_1a);
data_go_scr(  o_name,   Boss_init_1, Carock_init2, Carock_update, Carock_udp, Carock_draw, Carock_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBo, CSb, $0A,  $04, $1A, _RSP,    0, SWDa, PRJd,    0,    0,    0);
data_go_prop2(o_name+"02", PIb, HBo, CSb, $0C,  $05, $1B, _RSP,    0, SWDa, PRJd,    0,    0,    0);


// -----------------------------------------------------------------------------
// Gooma  --------------------------------------------------------
o_name = object_get_name(GoomA); // *
data_go_prop1(    GoomA, "Gooma", spr_Gooma_Placement);
data_go_scr(  o_name,   Boss_init_1, Gooma_init2, Gooma_update, Gooma_udp, Gooma_draw, Boss_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBp, CSb, $19,  $06, $1B, _RSP,    0, SWDa, PRJd,    0,    0,    0);
data_go_prop2(o_name+"02", PIb, HBp, CSb, $24,  $08, $22, _RSP,    0, SWDa, PRJd,    0,    0,    0);


// -----------------------------------------------------------------------------
// Barba  --------------------------------------------------------
o_name = object_get_name(BarbA); // *
data_go_prop1(    BarbA, "Barba", spr_Barba_Placement);
data_go_scr(  o_name,   Boss_init_1, Barba_init2, Barba_update, Barba_udp, Barba_draw, Barba_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBe, CSb, $1B,  $06, $1D, _RSP,    0, SWDa, PRJd,    0,    0,    0);


// -----------------------------------------------------------------------------
// Thunderbird  --------------------------------------------------------
o_name = object_get_name(ThunA); // *
data_go_prop1(    ThunA, "Thunderbird", spr_Thunderbird_Placement);
data_go_scr(  o_name,   Boss_init_1, Thunderbird_init2, Thunderbird_update, Thunderbird_udp, Thunderbird_draw, Boss_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBl, CSa, $1B,  $06, $20, _RSP,    0, SWDb, PRJd, THNc,    0,    0);


// -----------------------------------------------------------------------------
// ShadowBoss  --------------------------------------------------------
o_name = object_get_name(ShLiA); // *
data_go_prop1(    ShLiA, "ShadowBoss", spr_Placement_32x32);
data_go_scr(  o_name,   Boss_init_1, ShadowBoss_init2, ShadowBoss_update, ShadowBoss_udp, ShadowBoss_draw, Boss_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PId, HBi, CSa, $06,  $05, $16, _RSP,    0, SWDb, PRJd,    0,    0,    0);
//data_go_prop2(o_name+"01", PId, HBi, CSa, $08,  $05, $16, _RSP,    0, SWDb, PRJd,    0,    0,    0);


// -----------------------------------------------------------------------------
_HP1=$1F;
_RSP=RSPd; // RSPd: Refresh room. Ganon scripts will determine if can stay spawned.
// Ganon1  --------------------------------------------------------
o_name = object_get_name(Ganon1); // *
data_go_prop1(    Ganon1, "Ganon1", g.Ganon1_SPRITE1);
data_go_scr(  o_name,   Ganon1_init1, Ganon1_init2, Ganon1_update, Ganon1_udp, Ganon1_draw, Ganon1_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, $60, $1A,_HP1,  $09, $00, _RSP,    0, SWDc, PRJd,    0,    0,    0);

// Ganon2  --------------------------------------------------------
o_name = object_get_name(Ganon2); // *
data_go_prop1(    Ganon2, "Ganon2", g.Ganon2_SPRITE1);
data_go_scr(  o_name,   Ganon2_init1, Ganon2_init2, Ganon2_update, Ganon2_udp, Ganon2_draw, Ganon2_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, $61, $1B,_HP1,  $08, $20, _RSP,    0, SWDc, PRJd,    0,    0,    0);

// Ganon3  --------------------------------------------------------
o_name = object_get_name(Ganon3); // *
data_go_prop1(    Ganon3, "Ganon3", g.Ganon3_SPRITE1);
data_go_scr(  o_name,   Ganon3_init1, Ganon3_init2, Ganon3_update, Ganon3_udp, Ganon3_draw, Ganon3_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PId,HBaj, $1C, $0D,  $0A, $00, _RSP,    0, SWDc, PRJd,    0,    0,    0);
//data_go_prop2(o_name+"01", PId,HBaj, $1C,_HP1,  $0A, $00, _RSP,    0, SWDc, PRJd,    0,    0,    0);















_PI1    = PIa;
_HB1    = HBa;
_CS1    = CSa;
_HP1    = $06;
_HP2    = _HP1+2;
_HP3    = $14;
_ATK1   = $02;
_ATK2   = $04;
_XP1    =  XPc2;  // XPc2:   index $10 (50 xp)
_XP2    = _XP1+4; // XPc2+4: index $14 (90 xp)
_RSP    = RSPa;
_DRP    = DRPa;
_SWD    = SWDa;
_PRJ    = PRJc;
_THN    = THNb;
_SPL    = $00;
_DRN    = DRNa;
_spr    = spr_Placement_16x16;
// -----------------------------------------------------------------------------
// Kakusu  --------------------------------------------------------
o_name = object_get_name(Kakusu000); // Kakusu000 not part of the hunt. Just in case I need a blank kakusu instance. Can use to test versions.
data_go_prop1(    Kakusu000, o_name, _spr);
data_go_scr(  o_name,   Kakusu_init, Kakusu_init2, Kakusu_update, Kakusu_udp, Kakusu_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",_PI1,_HB1,_CS1,_HP1,_ATK1,_XP1, _RSP, _DRP, _SWD, _PRJ, _THN, _SPL, _DRN);


o_name = object_get_name(Kakusu001); // DthMt_0F, Jump on all pillars to reveal
data_go_prop1(    Kakusu001, o_name, _spr);
data_go_scr(  o_name,   Kakusu_init, Kakusu001_init2, Kakusu001_update, Kakusu_udp, Kakusu001_draw, Kakusu001_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",_PI1,_HB1,_CS1,_HP3,_ATK1,_XP1, _RSP, _DRP, _SWD, _PRJ,    0, _SPL, _DRN);


o_name = object_get_name(Kakusu002); // DthMt_2C, Under bridge at top of DthMt
data_go_prop1(    Kakusu002, o_name, _spr);
data_go_scr(  o_name,   Kakusu_init, Kakusu002_init2, Kakusu_update, Kakusu_udp, Kakusu_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",_PI1,_HB1,_CS1,_HP1,_ATK1,_XP2, _RSP, _DRP, _SWD, PRJd,    0,    0, _DRN);


o_name = object_get_name(Kakusu003); // PalcC_FE, Fall from high and downstab to kill
data_go_prop1(    Kakusu003, o_name, _spr);
data_go_scr(  o_name,   Kakusu_init, Kakusu003_init2, Kakusu_update, Kakusu_udp, Kakusu_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",_PI1,_HB1,_CS1,HPbf,_ATK1,_XP2, _RSP, _DRP, _SWD, PRJd,   $0,   $0, _DRN);


o_name = object_get_name(Kakusu004); // WestA_F8. North Ruto Mountains
data_go_prop1(    Kakusu004, o_name, _spr);
data_go_scr(  o_name,   Kakusu_init, Kakusu004_init2, Kakusu_update, Kakusu_udp, Kakusu_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",_PI1,_HB1,_CS1, $01,_ATK1,_XP1, _RSP, _DRP, _SWD, PRJd,    0,    0, _DRN);


o_name = object_get_name(Kakusu005); // PalcA_FC, Light all torches to reveal
data_go_prop1(    Kakusu005, o_name, _spr);
data_go_scr(  o_name,   Kakusu_init, Kakusu005_init2, Kakusu005_update, Kakusu_udp, Kakusu_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",_PI1,_HB1,_CS1,_HP3,_ATK2,_XP1, _RSP, _DRP, _SWD, PRJd,    0,    0, _DRN);


o_name = object_get_name(Kakusu006); // WestA_32, Room above North Castle East entrance
data_go_prop1(    Kakusu006, o_name, _spr);
data_go_scr(  o_name,   Kakusu006_init1, Kakusu006_init2, Kakusu006_update, Kakusu_udp, Kakusu_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",_PI1,_HB1,_CS1,_HP3,_ATK2,_XP2, _RSP, _DRP, _SWD, PRJe,    0, _SPL, _DRN);


o_name = object_get_name(Kakusu007); // WestA_42, North Castle platforming challenge
data_go_prop1(    Kakusu007, o_name, _spr);
data_go_scr(  o_name,   Kakusu_init, Kakusu007_init2, Kakusu_update, Kakusu_udp, Kakusu_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",_PI1,_HB1,_CS1,_HP1,_ATK1,_XP1, _RSP, _DRP, _SWD, _PRJ,    0, _SPL, _DRN);


o_name = object_get_name(Kakusu008); // EastA_23, Dark Forest in Darunia Forest
data_go_prop1(    Kakusu008, o_name, _spr);
data_go_scr(  o_name,   Kakusu_init, Kakusu008_init2, Kakusu_update, Kakusu_udp, Kakusu_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",_PI1,_HB1,_CS1,_HP3,_ATK2,_XP1, _RSP, _DRP, _SWD, PRJd,    0, _SPL, _DRN);


o_name = object_get_name(Kakusu009); // TownA_7E, Kill with falling block
data_go_prop1(    Kakusu009, o_name, _spr);
data_go_scr(  o_name,   Kakusu_init, Kakusu009_init2, Kakusu_update, Kakusu_udp, Kakusu_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",_PI1,_HB1,_CS1,_HP1,_ATK1,_XP1, _RSP, _DRP, _SWD, _PRJ,    0, _SPL, _DRN);


o_name = object_get_name(Kakusu010); // MazIs_30, Maze Island. Hiding in statue under the rock ground
data_go_prop1(    Kakusu010, o_name, _spr);
data_go_scr(  o_name,   Kakusu006_init1, Kakusu010_init2, Kakusu006_update, Kakusu_udp, Kakusu_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",_PI1,_HB1,_CS1,_HP3,_ATK2,_XP1, _RSP, _DRP, _SWD, PRJd,    0,    0, _DRN);


o_name = object_get_name(Kakusu011); // East_36, Kasuto Cemetery. Spell combo to reveal
data_go_prop1(    Kakusu011, o_name, _spr);
data_go_scr(  o_name,   Kakusu_init, Kakusu011_init2, Kakusu011_update, Kakusu_udp, Kakusu_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",_PI1,_HB1,_CS1,_HP3,_ATK1,_XP1, _RSP, _DRP, _SWD, PRJd,    0, _SPL, _DRN);


o_name = object_get_name(Kakusu012); // East_37, High up on pillar. Must use THUNDER
data_go_prop1(    Kakusu012, o_name, _spr);
data_go_scr(  o_name,   Kakusu_init, Kakusu012_init2, Kakusu_update, Kakusu_udp, Kakusu_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",_PI1,_HB1,_CS1,_HP3,_ATK2,_XP2, _RSP, _DRP, _SWD, PRJd, THNa,    0, _DRN);


o_name = object_get_name(Kakusu013); // Currently unused
data_go_prop1(    Kakusu013, o_name, _spr);
data_go_scr(  o_name,   Kakusu_init, Kakusu013_init2, Kakusu013_update, Kakusu_udp, Kakusu_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",_PI1,_HB1,_CS1, $10,_ATK2,_XP1, _RSP, _DRP, _SWD, _PRJ,    0, _SPL, _DRN);


o_name = object_get_name(Kakusu014); // Block Matching Puzzle
data_go_prop1(    Kakusu014, o_name, _spr);
data_go_scr(  o_name,   Kakusu_init, Kakusu014_init2, Kakusu014_update, Kakusu014_udp, Kakusu_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",_PI1,_HB1,_CS1, $10,_ATK2,_XP1, _RSP, _DRP, _SWD, _PRJ,    0,    0, _DRN);















// -----------------------------------------------------------------------------
// Ache  --------------------------------------------------------
o_name = object_get_name(AcheA);
data_go_prop1(    AcheA, "Ache", spr_Ache1);
data_go_scr(  o_name,   GameObjectB_init, Ache_init2, Ache_update, Ache_udp, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBa, CSa, $03,  $01, $03, RSPb, DRPb, SWDa, PRJc, THNb, SPLa,    0);
// Acheman  -----------------------------------------------------
data_go_prop2(o_name+"02", PIb, HBb, CSb, $06,  $03, $0A, RSPb,    0, SWDa, PRJc, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Aneru  --------------------------------------------------------
o_name = object_get_name(AnerA);
data_go_prop1(    AnerA, "Aneru", spr_Aneru1);
data_go_scr(  o_name,   GameObjectB_init, Aneru_init2, Aneru_update, Aneru_udp, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBa, CSa, $08,  $02, $0C, RSPc, DRPb, SWDa, PRJc, THNb, SPLa,    0);
data_go_prop2(o_name+"02", PIc, HBa, CSa, $08,  $02, $0C, RSPc, DRPb, SWDa, PRJc, THNb, SPLa,    0);
data_go_prop2(o_name+"03", PIb, HBa, CSa, $08,  $05, $0E, RSPc, DRPb, SWDa, PRJc, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Rock2)+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Rock2)+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"03", object_get_name(Rock2)+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Aruroda  --------------------------------------------------------
o_name = object_get_name(ArurA);
data_go_prop1(    ArurA, "Aruroda", spr_Aruroda_body1);
data_go_scr(  o_name,   GameObjectB_init, Aruroda_init2, Aruroda_update, Aruroda_udp, Aruroda_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBj, CSb, $0F,  $05, $16, RSPc, DRPc, SWDa,    0, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02");


// -----------------------------------------------------------------------------
// Atta  --------------------------------------------------------
o_name = object_get_name(AttaA);
data_go_prop1(    AttaA, "Atta", spr_Atta_1a);
data_go_scr(  o_name,   GameObjectB_init, Atta_init2, Atta_update, Atta_udp, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBa, CSa, $0F,  $02, $0D, RSPc, DRPc, SWDa, PRJc, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02");


// -----------------------------------------------------------------------------
// Backwall  --------------------------------------------------------
o_name = object_get_name(Backwall);
data_go_prop1(    Backwall, "Backwall", spr_Placement_16x16);
data_go_scr(  o_name,   Backwall_init1, Backwall_init2, Backwall_update, Backwall_udp, Backwall_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa,   0,   0,   0,  $08,   0, RSPd,    0,    0,    0,    0,    0,    0);


// -----------------------------------------------------------------------------
// Bagin  --------------------------------------------------------
o_name = object_get_name(BagiA);
data_go_prop1(    BagiA, "Bagin", spr_Bagin_1a);
data_go_scr(  o_name,   GameObjectB_init, Bagin_init2, Bagin_update, Bagin_udp, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBa, CSa, $03,  $03, $05, RSPd, DRPa, SWDa, PRJc, THNb, SPLa,    0);
data_go_prop2(o_name+"02", PIb, HBa, CSa, $03,  $03, $07, RSPd, DRPa, SWDa, PRJc, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Bago  --------------------------------------------------------
o_name = object_get_name(BagoA);
data_go_prop1(    BagoA, "Bago", spr_Bago1);
data_go_scr(  o_name,   GameObjectB_init, Bago_init2, Bago_update, Bago_udp, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBa, CSa, $03,  $03, $05, RSPc, DRPb, SWDa, PRJc, THNb, SPLa, DRNc);
data_go_prop2(o_name+"02", PIb, HBa, CSa, $06,  $04, $0C, RSPc, DRPb, SWDa, PRJc, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Balshot  --------------------------------------------------------
o_name = object_get_name(Balshot);
data_go_prop1(Balshot, "Balshot", spr_Balshot);
data_go_scr(  o_name, Balshot_init1, Balshot_init2, Balshot_update);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIe, HBa, CSh, $01,  $03,XPa0, RSPd, DRPa,  $00,  $00,  $00,  $00,  $00);

//data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Blaze  --------------------------------------------------------
_PI1 = PIa;
_SWD = SWDe;
_PRJ = PRJd;
_THN = THNb;
_bright1 = 0;
//_bright1 = BRIGHT1;
o_name = object_get_name(BlazA);
data_go_prop1(    BlazA, "Blaze", spr_Flame1);
data_go_scr(  o_name,   Blaze_init1, Blaze_init2, Blaze_update, Blaze_udp, Blaze_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBc, CSc, $06,  $03, $05, RSPd,    0,    0, _PRJ, _THN,    0,    0,    _bright1);
data_go_prop2(o_name+"02", PIb, HBc, CSc, $06,  $03, $05, RSPd,    0,    0, _PRJ, _THN,    0,    0,    _bright1);
data_go_prop2(o_name+"03",_PI1,HBag, CSa, $01,  $02, $00, RSPd,    0, _SWD, _PRJ, _THN,    0,    0,    _bright1);
data_go_prop2(o_name+"04",_PI1, HBy, CSd, $01,  $02, $00, RSPd,    0, _SWD, _PRJ, _THN,    0,    0,    _bright1);
data_go_prop2(o_name+"05",_PI1, $56, $22, $01,  $00, $00, RSPb,    0, _SWD, _PRJ, _THN,    0,    0,    _bright1);
data_go_prop2(o_name+"06", PIc, HBc, CSc, $01,  $02, $00, RSPd,    0, SWDa,    0, _THN,    0,    0,    _bright1);



// -----------------------------------------------------------------------------
// Blooby  --------------------------------------------------------
o_name = object_get_name(Blooby);
data_go_prop1(    Blooby, "Blooby", spr_Blooby_2a_1);
data_go_scr(  o_name,   Blooby_init1, Blooby_init2, Blooby_update, Blooby_udp);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PId, HBa, CSa,HPMax, $03,XPa0, RSPd, DRPa, SWDf,    0,    0,    0,    0);
data_go_prop2(o_name+"02", PId, HBa, CSa,HPMax, $03,XPa0, RSPd, DRPa, SWDf,    0,    0,    0,    0);




// -----------------------------------------------------------------------------
// Boggnipp  --------------------------------------------------------
o_name = object_get_name(Boggnipp);
data_go_prop1(    Boggnipp, "Boggnipp", spr_Boggnipp_1a);
data_go_scr(  o_name,   Boggnipp_init1, Boggnipp_init2, Boggnipp_update, Boggnipp_udp);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBa, CSa, $03,  $03, $05, RSPd, DRPb, SWDa, PRJc, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Boon  --------------------------------------------------------
o_name = object_get_name(BoonA);
data_go_prop1(    BoonA, "Boon", spr_Boon1);
data_go_scr(  o_name,   GameObjectB_init, Boon_init2, Boon_update, Boon_udp, Boon_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBa, CSa, $06,  $02, $10, RSPc, DRPc, SWDa, PRJc, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// BossBot  --------------------------------------------------------
o_name = object_get_name(BoBoA);
data_go_prop1(    BoBoA, "BossBot", spr_Placement_32x32);
data_go_scr(  o_name,   GameObjectB_init, BossBot_init2, BossBot_update, BossBot_udp, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBg, $1D, $12,  $04,   0, RSPc,    0, SWDa, PRJc,    0,    0,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Bot  --------------------------------------------------------
o_name = object_get_name(Bot_A); // *
data_go_prop1(    Bot_A, "Bot", spr_Bot_Norm);
data_go_scr(  o_name,   GameObjectB_init, Bot_init2, Bot_update, Bot_udp, Bot_draw, Bot_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBa, CSa, $04,  $02, $02, RSPb, DRPb, SWDa, PRJc, THNb, SPLa,   0);
// Bit ---------------------------------------------------------
data_go_prop2(o_name+"02", PIb, HBa, CSa, $03,  $01, $02, RSPb, DRPb, SWDa, PRJc, THNb, SPLa,   0);
data_go_prop2(o_name+"03", PId, HBa, CSa, $03,  $01, $02, RSPb, DRPb, SWDa, PRJc, THNb, SPLa,  -1);
// Nyb ---------------------------------------------------------
data_go_prop2(o_name+"04", PId, HBa, CSa, $03,  $01, $02, RSPb, DRPb, SWDa, PRJc, THNb, SPLa,   0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"03", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"04", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Bubble  --------------------------------------------------------
o_name = object_get_name(BubbA);
data_go_prop1(    BubbA, "Bubble", spr_Bubble1);
data_go_scr(  o_name,   GameObjectB_init, Bubble_init2, Bubble_update, Bubble_udp, Bubble_draw, Bubble_end);
//_SPL  = 0; // mod. Make Bubble immune to SPELL/ENIGMA
_SPL  = SPLa; // OG. 
_RSP  = RSPd; // 'refresh rm' respawn to prevent increased spawn freq
//_RSP  = RSPb; // OG: 'off-screen' respawn
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBa, CSa,HPbe,  $01,XPc2, _RSP,    0, SWDa, PRJc,    0, _SPL,    0); // $01. Reg speed. 
data_go_prop2(o_name+"02", PIb, HBa, CSa,HPbe,  $01,XPc2, _RSP,    0, SWDa, PRJc,    0, _SPL,    0); // $02. Fast speed
data_go_prop2(o_name+"04", PIb, HBa, CSa,HPbe,  $01,XPc2, _RSP,    0, SWDa, PRJc,    0, _SPL,    0); // $04. Reg speed. Change dir on stab.
data_go_prop2(o_name+"06", PIb, HBa, CSa,HPbe,  $01,XPc2, _RSP,    0, SWDa, PRJc,    0, _SPL,    0); // $06. Fast speed. Change dir on stab.

data_go_prop2(o_name+"10", PIb, HBa, CSa,HPbe,  $01,XPc2, _RSP,    0, SWDa, PRJc,    0, _SPL,    0); // $10. Dormant Bubble. Reg speed. 
data_go_prop2(o_name+"12", PIb, HBa, CSa,HPbe,  $01,XPc2, _RSP,    0, SWDa, PRJc,    0, _SPL,    0); // $12. Dormant Bubble. Fast speed. 

data_go_prop2(o_name+"20", PIb, HBa, CSa,HPbe,  $01,XPc2, _RSP,    0, SWDa, PRJc,    0, _SPL,    0); // $20. Wall Bubble. Reg speed. 
data_go_prop2(o_name+"22", PIb, HBa, CSa,HPbe,  $01,XPc2, _RSP,    0, SWDa, PRJc,    0, _SPL,    0); // $20. Wall Bubble. Fast speed. 
// GiantBubble ---------------------------------------------
data_go_prop2(o_name+"08", PIc,HBai, CSa,HPbf,  $04,   0, _RSP,    0, SWDa,    0,    0,    0,    0); // $08. GiantBubble. Reg speed
data_go_prop2(o_name+"0A", PIc,HBai, CSa,HPbf,  $04,   0, _RSP,    0, SWDa,    0,    0,    0,    0); // $0A. GiantBubble. Fast speed

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"04", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"06", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"08", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"0A", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"10", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"12", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"20", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"22", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Capper  --------------------------------------------------------
o_name = object_get_name(CappA); // *
data_go_prop1(    CappA, "Capper", spr_Bot_Norm);
data_go_scr(  o_name,   GameObjectB_init, Capper_init, Capper_update, Capper_udp, Capper_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBa, CSa, $04,  $02, $02, RSPb, DRPb, SWDa, PRJc, THNb, SPLa,   0);
data_go_prop2(o_name+"02", PIc, HBa, CSa, $04,  $02, $02, RSPb, DRPb, SWDa, PRJc, THNb, SPLa,   0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Daira  --------------------------------------------------------
o_name = object_get_name(DairA);
data_go_prop1(    DairA, "Daira", spr_Daira1);
data_go_scr(  o_name,   GameObjectB_init, Daira_init2, Daira_update, Daira_udp, Daira_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBb, CSb, $0B,  $03, $12, RSPc, DRPc, SWDa, PRJd, THNb, SPLa,    0);
data_go_prop2(o_name+"02", PIb, HBb, CSb, $0D,  $03, $15, RSPc, DRPc, SWDa, PRJd, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Mace1)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Axe)+"01", object_get_name(Mace1)+"01");


// -----------------------------------------------------------------------------
// Deeler  --------------------------------------------------------
_RSP  = RSPd; // 'refresh rm'
//_RSP  = RSPc; // OG: Refresh area
o_name = object_get_name(DeelA);
data_go_prop1(    DeelA, "Deeler", spr_Deeler1);
data_go_scr(  o_name,   GameObjectB_init, Deeler_init2, Deeler_update, Deeler_udp, Deeler_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBa, CSa, $03,  $01, $02, _RSP, DRPb, SWDa, PRJc, THNb, SPLa,   0);
data_go_prop2(o_name+"02", PIc, HBa, CSa, $04,  $01, $03, _RSP, DRPb, SWDa, PRJc, THNb, SPLa,   0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Doomknocker  --------------------------------------------------------
o_name = object_get_name(DoomA);
data_go_prop1(    DoomA, "Doomknocker", spr_Doomknocker_body1);
data_go_scr(  o_name,   GameObjectB_init, Doomknocker_init2, Doomknocker_update, Doomknocker_udp, Doomknocker_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBb, CSp, $0F,  $04, $15, RSPc,    0, SWDa, PRJd, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Mace2)+"01");


// -----------------------------------------------------------------------------
// Fokka  --------------------------------------------------------
o_name = object_get_name(FokkA);
data_go_prop1(    FokkA, "Fokka", spr_Fokka_Idle1);
data_go_scr(  o_name,   GameObjectB_init, Fokka_init2, Fokka_update, Fokka_udp, Fokka_draw, Fokka_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBb, CSb, $11,  $06, $16, RSPc,    0, SWDa, PRJd, THNb,    0,    0);
data_go_prop2(o_name+"02", PIc, HBb, CSb, $16,  $06, $18, RSPc,    0, SWDa, PRJd, THNb,    0,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Fokkeru  --------------------------------------------------------
o_name = object_get_name(FokuA);
data_go_prop1(    FokuA, "Fokkeru", spr_Fokkeru_top1);
data_go_scr(  o_name,   GameObjectB_init, Fokkeru_init2, Fokkeru_update, Fokkeru_udp, Fokkeru_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBb, CSp, $19,  $05, $17, RSPc,    0, SWDa, PRJd, THNb,    0,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Geldarm  --------------------------------------------------------
_RSP  = RSPd; // 'refresh rm' 
//_RSP  = RSPc; // OG: Refresh area
o_name = object_get_name(GeldA);
data_go_prop1(    GeldA, "Geldarm", spr_Placement_08x16);
data_go_scr(  o_name,   GameObjectB_init, Geldarm_init2, Geldarm_update, Geldarm_udp, Geldarm_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PId, HBd, CSb, $06,  $02, $05, _RSP, DRPb, SWDa, PRJc, THNb,    0,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Gellzem  --------------------------------------------------------
o_name = object_get_name(GlzmA);
data_go_prop1(    GlzmA, "Gellzem", spr_Placement_08x16);
data_go_scr(  o_name,   GameObjectB_init, Gellzem_init2, Gellzem_update, Gellzem_udp, Gellzem_draw, Gellzem_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb,HB00, CSb, $06,  $02, $0D, RSPc, DRPb, SWDa, PRJc, THNb,    0,    0);
data_go_prop2(o_name+"02", PIb,HB00, CSb, $06,  $02, $0F, RSPc, DRPb, SWDa, PRJc, THNb,    0,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Geru  --------------------------------------------------------
o_name = object_get_name(GeruA);
data_go_prop1(    GeruA, "Geru", spr_Geru_1A);
data_go_scr(  o_name,   GameObjectB_init, Geru_init2, Geru_update, Geru_udp, Geru_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBb, CSb, $0F,  $04, $15, RSPc, DRPc, SWDa, PRJd, THNb,    0,    0); // orange
data_go_prop2(o_name+"02", PIb, HBb, CSb, $11,  $05, $16, RSPc, DRPc, SWDa, PRJd, THNb,    0,    0); // red
data_go_prop2(o_name+"03", PIc, HBb, CSb, $12,  $05, $17, RSPc, DRPc, SWDa, PRJd, THNb,    0,    0); // blue

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Axe)+"01", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01");
data_REFLECT_vuln(o_name+"03", object_get_name(Axe)+"01", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01");


// -----------------------------------------------------------------------------
// RockGeru  --------------------------------------------------------
o_name = object_get_name(GeruB);
data_go_prop1(    GeruB, "RockGeru", spr_Geru_3A);
data_go_scr(  o_name,   GameObjectB_init, RockGeru_init2, RockGeru_update, RockGeru_udp, RockGeru_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBb, CSb, $01,  $03, $10, RSPc,    0, SWDa, PRJd, THNb, SPLa,    0);
data_go_prop2(o_name+"02", PIb, HBb, CSb, $01,  $03, $10, RSPc,    0, SWDa, PRJd, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Axe)+"01", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01");


// -----------------------------------------------------------------------------
// Girubokku  --------------------------------------------------------
o_name = object_get_name(GiruA);
data_go_prop1(    GiruA, "Girubokku", spr_Girubokku1);
data_go_scr(  o_name,   GameObjectB_init, Girubokku_init2, Girubokku_update, Girubokku_udp, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBa, CSa, $0A,  $05, $0C, RSPc, DRPb, SWDa, PRJc, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Goriya  --------------------------------------------------------
o_name = object_get_name(GoriA);
data_go_prop1(    GoriA, "Goriya", spr_Goriya_A1);
data_go_scr(  o_name,   GameObjectB_init, Goriya_init2, Goriya_update, Goriya_udp, Goriya_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBb, CSb, $08,  $02, $0C, RSPc, DRPb, SWDa, PRJd, THNb, SPLa,    0);
data_go_prop2(o_name+"02", PIb, HBb, CSb, $09,  $02, $0C, RSPc, DRPb, SWDa, PRJd, THNb, SPLa,    0);
data_go_prop2(o_name+"03", PIc, HBb, CSb, $0B,  $02, $0E, RSPc, DRPb, SWDa, PRJd, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"03", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Growkke  --------------------------------------------------------
o_name = object_get_name(Growkke);
data_go_prop1(    Growkke, "Growkke", spr_Placement_08x16);
data_go_scr(  o_name,   Growkke_init1, Growkke_init2, Growkke_update, Growkke_udp, Growkke_draw, Growkke_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc,HB00, CSb,HPMax, $02,XPb0, RSPc, DRPb, SWDa, PRJc, THNb,    0,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Guma  --------------------------------------------------------
o_name = object_get_name(GumaA);
data_go_prop1(    GumaA, "Guma", spr_Guma1);
data_go_scr(  o_name,   GameObjectB_init, Guma_init2, Guma_update, Guma_udp, Guma_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBb, CSp, $0A,  $03, $10, RSPc, DRPc, SWDa, PRJd, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// IronKnuckle  --------------------------------------------------------
o_name = object_get_name(IrKnA);
data_go_prop1(    IrKnA, "IronKnuckle", spr_Iron_Knuckle_Idle1);
data_go_scr(  o_name,   GameObjectB_init, IronKnuckle_init2, IronKnuckle_update, IronKnuckle_udp, IronKnuckle_draw, IronKnuckle_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBb, CSb, $0A,  $03, $10, RSPc, DRPc, SWDa, PRJd, THNb, SPLa,    0);
data_go_prop2(o_name+"02", PIb, HBb, CSb, $0D,  $04, $15, RSPc, DRPc, SWDa, PRJd, THNb, SPLa,    0);
data_go_prop2(o_name+"03", PIc, HBb, CSb, $12,  $04, $16, RSPc, DRPc, SWDa, PRJd, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Axe)+"01", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"03", object_get_name(Axe)+"01", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Leever  --------------------------------------------------------
o_name = object_get_name(LeevA);
data_go_prop1(    LeevA, "Leever", spr_Leever1);
data_go_scr(  o_name,   GameObjectB_init, Leever_init2, Leever_update, Leever_udp, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBa, CSa, $0A,  $05, $0A, RSPc, DRPb, SWDa, PRJc, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Lowder  --------------------------------------------------------
_RSP  = RSPd; // 'refresh rm'
//_RSP  = RSPc; // OG: Refresh area
o_name = object_get_name(LowdA);
data_go_prop1(    LowdA, "Lowder", spr_Lowder1);
data_go_scr(  o_name,   GameObjectB_init, Lowder_init2, Lowder_update, Lowder_udp, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBa, CSa, $04,  $01, $03, _RSP, DRPb, SWDa, PRJc, THNb, SPLa,    0);
data_go_prop2(o_name+"02", PIb, HBa, CSa, $04,  $01, $03, _RSP, DRPb, SWDa, PRJc, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Magnot  --------------------------------------------------------
o_name = object_get_name(MagnA);
data_go_prop1(    MagnA, "Magnot", spr_Magnot_1a);
data_go_scr(  o_name,   GameObjectB_init, Magnot_init2, Magnot_update, Magnot_udp, Magnot_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PId,HBaa, CSf, $01,  $03, $0A, RSPd,    0, SWDc,    0, THNb, SPLa,    0); // Horizontal
data_go_prop2(o_name+"02", PId,HBaa, CSf, $01,  $03, $0A, RSPd,    0, SWDc,    0, THNb, SPLa,    0); // Vertical


// -----------------------------------------------------------------------------
// Mago  --------------------------------------------------------
o_name = object_get_name(MagoA);
data_go_prop1(    MagoA, "Mago", spr_Mago1);
data_go_scr(  o_name,   GameObjectB_init, Mago_init2, Mago_update, Mago_udp, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBb, CSb, $0F,  $04, $17, RSPc,    0, SWDa, PRJd, THNb,    0,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Mau  --------------------------------------------------------
o_name = object_get_name(Mau_A);
data_go_prop1(    Mau_A, "Mau", spr_Mau1);
data_go_scr(  o_name,   GameObjectB_init, Mau_init2, Mau_update, Mau_udp, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBa, CSa, $02,  $02, $05, RSPc,  $00, SWDa, PRJc, THNb, SPLa, DRNc);
data_go_prop2(o_name+"02", PIb, HBa, CSa, $02,  $02, $07, RSPc,  $00, SWDa, PRJc, THNb, SPLa, DRNc);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Megmat  --------------------------------------------------------
o_name = object_get_name(MegmA);
data_go_prop1(    MegmA, "Megmat", spr_Megmat1);
data_go_scr(  o_name,   GameObjectB_init, Megmat_init2, Megmat_update, Megmat_udp, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBa, CSa, $04,  $02, $05, RSPc, DRPb, SWDa, PRJc, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Moa  --------------------------------------------------------
o_name = object_get_name(Moa_A); // *
data_go_prop1(    Moa_A, "Moa", spr_Placement_16x16);
data_go_scr(  o_name,   GameObjectB_init, Moa_init2, Moa_update, Moa_udp, Moa_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBa, CSa, $06,  $03, $0A, RSPc, DRPb, SWDa, PRJc, THNb, SPLa, DRNd);
data_go_prop2(o_name+"02", PIc, HBa, CSa, $11,  $04, $10, RSPc, DRPb, SWDa, PRJc, THNb, SPLa, DRNd);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// FieryMoa  --------------------------------------------------------
o_name = object_get_name(Moa_B);
data_go_prop1(    Moa_B, "FieryMoa", spr_Placement_16x16);
data_go_scr(  o_name,   GameObjectB_init, FieryMoa_init2, FieryMoa_update, Moa_udp, Moa_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBa, CSa, $0A,  $04, $10, RSPc, DRPc, SWDa, PRJc, THNb, SPLa, DRNc);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");

// -----------------------------------------------------------------------------
// Moblin  --------------------------------------------------------
o_name = object_get_name(MoblA);
data_go_prop1(    MoblA, "Moblin", spr_Moblin_High_DrawA);
data_go_scr(  o_name,   GameObjectB_init, Moblin_init2, Moblin_update, Moblin_udp, Moblin_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBb, CSb, $04,  $02, $0A, RSPc, DRPb, SWDa, PRJc, THNb, SPLa,   0);
data_go_prop2(o_name+"02", PIb, HBb, CSb, $08,  $02, $0C, RSPc, DRPb, SWDa, PRJc, THNb, SPLa,   0);
data_go_prop2(o_name+"03", PIc, HBb, CSb, $0B,  $02, $0C, RSPc, DRPb, SWDa, PRJc, THNb, SPLa,   0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"03", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Grunt  --------------------------------------------------------
o_name = object_get_name(MoblB);
data_go_prop1(    MoblB, "Grunt", spr_Grunt_body1);
data_go_scr(  o_name,   GameObjectB_init, Grunt_init2, Grunt_update, Grunt_udp, Grunt_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBb, CSb, $02,  $02,   0, RSPc, DRPb, SWDa, PRJc, THNb, SPLa, DRNc);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Moby  --------------------------------------------------------
o_name = object_get_name(MobyA);
data_go_prop1(    MobyA, "Moby", spr_Moby1);
data_go_scr(  o_name,   GameObjectB_init, Moby_init2, Moby_update, Moby_udp, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBa, CSa, $03,  $01, $02, RSPc,    0, SWDa, PRJc, THNb, SPLa, DRNc);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Myu  --------------------------------------------------------
o_name = object_get_name(Myu_A);
data_go_prop1(    Myu_A, "Myu", spr_Myu1);
data_go_scr(  o_name,   GameObjectB_init, Myu_init2, Myu_update, Myu_udp, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBk, CSa, $03,  $02, $03, RSPb, DRPb, SWDa, PRJc, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Octorok  --------------------------------------------------------
//_RSP  = RSPd; // 'refresh rm'
_RSP  = RSPc; // OG: Refresh area
o_name = data_go_prop1(OctoA, "Octorok", spr_Octorok_Idle);
data_go_scr(  o_name,   GameObjectB_init, Octorok_init2, Octorok_update, Octorok_udp, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBa, CSa, $04,  $02, $0A, _RSP, DRPb, SWDa, PRJc, THNb, SPLa,    0);
data_go_prop2(o_name+"02", PIb, HBa, CSa, $04,  $02, $0A, _RSP, DRPb, SWDa, PRJc, THNb, SPLa,    0);
data_go_prop2(o_name+"03", PId, HBa, CSa, $04,  $02, $0A, _RSP, DRPb, SWDa, PRJd,    0,    0,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"03", object_get_name(Axe)+"01", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Ra  --------------------------------------------------------
o_name = object_get_name(Ra__A);
data_go_prop1(    Ra__A, "Ra", spr_Ra1);
data_go_scr(  o_name,   GameObjectB_init, Ra_init2, Ra_update, 0, 0);
//                                          pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
if (g.mod_Ra_HP) data_go_prop2(o_name+"01", PIc, HBa, CSa, $0F,  $01, $0C, RSPb, DRPb, SWDa, PRJc,    0, SPLa, DRNc); // mod. Reduced HP
else             data_go_prop2(o_name+"01", PIc, HBa, CSa, $12,  $01, $0C, RSPb, DRPb, SWDa, PRJc,    0, SPLa, DRNc); // OG. HP is too damn high
data_go_prop2(o_name+"02", PIc, HBa, CSa, $12,  $01, $0C, RSPb, DRPb, SWDa, PRJc,    0, SPLa, DRNc);
data_go_prop2(o_name+"03", PIa, HBa, CSa, $16,  $04, $0E, RSPb, DRPb, SWDa, PRJc,    0, SPLa, DRNc);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"03", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Snaraa  --------------------------------------------------------
o_name = object_get_name(Snaraa);
data_go_prop1(    Snaraa, "Snaraa", spr_Snaraa_1a_1_WRB);
data_go_scr(  o_name,   Snaraa_init1, Snaraa_init2, Snaraa_update, Snaraa_udp, Snaraa_draw, Snaraa_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBw, CSa, $0D,  $02, $05, RSPd, DRPb, SWDa, PRJc, THNb, SPLa, DRNc);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Stalfos  --------------------------------------------------------
if (g.mod_STALFOS_CONTROL1) _SWD = SWDd;
else                        _SWD = SWDa;
o_name = object_get_name(StalA);
data_go_prop1(    StalA, "Stalfos", spr_Stalfos_body1);
data_go_scr(  o_name,   GameObjectB_init, Stalfos_init2, Stalfos_update, Stalfos_udp, Stalfos_draw, Stalfos_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBb, CSb, $06,  $02, $0E, RSPc, DRPc, _SWD, PRJd, THNb, SPLa,    0);
// Parutamu  -------------------------------------------------------
data_go_prop2(o_name+"02", PIc, HBb, CSb, $08,  $02, $10, RSPc, DRPc, _SWD, PRJd, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Axe)+"01", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Stallakk  --------------------------------------------------------
o_name = object_get_name(Stallakk);
data_go_prop1(    Stallakk, "Stallakk", spr_Placement_16x32);
data_go_scr(  o_name,   Stallakk_init1, Stallakk_init2, Stallakk_update, Stallakk_udp, Stallakk_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, $67, $19, $07,  $03, $0D, RSPd, DRPb, SWDa, PRJd, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01");


// -----------------------------------------------------------------------------
// Tektite  --------------------------------------------------------
o_name = object_get_name(TektA);
data_go_prop1(    TektA, "Tektite", spr_Tektite1);
data_go_scr(  o_name,   GameObjectB_init, Tektite_init2, Tektite_update, Tektite_udp, Tektite_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBb, CSp, $0D,  $03, $10, RSPc, DRPc, SWDc, PRJb, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02");


// -----------------------------------------------------------------------------
// TonnA  --------------------------------------------------------
o_name = object_get_name(TonnA);
data_go_prop1(    TonnA, "TonnA", spr_Placement_40x32);
data_go_scr(  o_name,   TonnA_init1, TonnA_init2, TonnA_update, TonnA_udp, TonnA_draw, TonnA_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc,HBad, CSl, $13,  $04, $0E, RSPc, DRPc, SWDa, PRJe, THNb,    0,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Tyell  --------------------------------------------------------
_RSP  = RSPd; // 'refresh rm'
//_RSP  = RSPc; // OG: Refresh area
o_name = object_get_name(Tyell);
data_go_prop1(    Tyell, "Tyell", spr_Placement_16x16);
data_go_scr(  o_name,   Tyell_init1, Tyell_init2, Tyell_update, Tyell_udp, Tyell_draw, Tyell_end);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIg, HBa, CSh,HPbf,  $01, $00, _RSP,  $00, SWDa,  $00,  $00,  $00,    0);
data_go_prop2(o_name+"02", PIg, HBa, CSh,HPbf,  $01, $00, _RSP,  $00, SWDa,  $00,  $00,  $00,    0);

o_name = object_get_name(TyellManager);
data_go_prop1(    TyellManager, "TyellManager", spr_Placement_16x16);
data_go_scr(  o_name,   TyellManager_init1, TyellManager_init2, TyellManager_update);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", $00, $00, $00, $00,  $00, $00, RSPd,  $00,  $00,  $00,  $00,  $00,  $00);


// -----------------------------------------------------------------------------
// Wheep  --------------------------------------------------------
o_name = object_get_name(Wheep);
data_go_prop1(    Wheep, "Wheep", spr_Wheep_1a);
data_go_scr(  o_name,   Wheep_init1, Wheep_init2, Wheep_update, Wheep_udp);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, $50, CSa, $02,  $03, $07, RSPd,  $00, SWDa, PRJc, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Wizard  --------------------------------------------------------
o_name = object_get_name(WizaA);
data_go_prop1(    WizaA, "Wizard", spr_Wizard1);
data_go_scr(  o_name,   GameObjectB_init, Wizard_init2, Wizard_update, Wizard_udp, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBb, CSb, $01,  $04, $15, RSPc, DRPc,    0, PRJd, THNb,    0,    0);


// -----------------------------------------------------------------------------
// Wosu  --------------------------------------------------------
o_name = object_get_name(WosuA);
data_go_prop1(    WosuA, "Wosu", spr_Wosu1);
data_go_scr(  o_name,   GameObjectB_init, Wosu_init2, Wosu_update, Wosu_udp, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBb, CSp, $02,  $01,   0, RSPb,    0, SWDa, PRJc, THNb, SPLa, DRNc);
data_go_prop2(o_name+"02", PIa, HBb, CSp, $02,  $01,   0, RSPb,    0, SWDa, PRJc, THNb, SPLa, DRNc);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");
data_REFLECT_vuln(o_name+"02", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Rock2)+"01", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");


// -----------------------------------------------------------------------------
// Zora  --------------------------------------------------------
o_name = object_get_name(ZoraA);
data_go_prop1(    ZoraA, "Zora", spr_Zora_body_B);
data_go_scr(  o_name,   GameObjectB_init, Zora_init2, Zora_update, Zora_udp, Zora_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBj, CSb, $11,  $04, $10, RSPc, DRPc, SWDc, PRJb, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02");


// -----------------------------------------------------------------------------
// Fenser(HelmetHead Head)  --------------------------------------------------------
o_name = object_get_name(HeHeA);
data_go_prop1(    HeHeA, "Fenser", spr_Helmethead_head_1);
data_go_scr(  o_name,   Fenser_init1, Fenser_init2, Fenser_update, 0, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBv, CSm, $15,  $02,   0, RSPc,    0, SWDa, PRJd, THNb,    0,    0);


// -----------------------------------------------------------------------------
// Stalfoon  --------------------------------------------------------
o_name = object_get_name(StfnA); // *
data_go_prop1(    StfnA, "Stalfoon", spr_Stalfoon_1a);
data_go_scr(  o_name,   GameObjectB_init, Stalfoon_init2, Stalfoon_update, Stalfoon_udp, Stalfoon_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBa, CSa, $0D,  $02, $10, RSPc, DRPc, SWDa, PRJc, THNb, SPLa,    0);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Bullet1)+"01", object_get_name(Bullet1)+"02", object_get_name(Bullet2)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");












// ------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------

/*
// AREA_AL = "AreaAll"; // Same length as "_WestA_"
AREA_TA = Area_TownA;
AREA_PG = Area_PalcG;
AREA_PF = Area_PalcF;
AREA_PE = Area_PalcE;
AREA_PD = Area_PalcD;
AREA_PC = Area_PalcC;
AREA_PB = Area_PalcB;
AREA_PA = Area_PalcA;
AREA_MI = Area_MazIs;
AREA_EA = Area_EastA;
AREA_DM = Area_DthMt;
AREA_WA = Area_WestA;

// Proj body to PC body interaction.
// 0: none
PBa1 = $01; // PC Body contact does not destroy proj
PBb1 = $02; // die/explode/disintegrate 
// PBc1 = $03; // 
// PBd1 = $04; // 



// Proj body to PC shld interaction.
// $000000: none/passive. Unblockable
//     $01: die/explode/disintegrate. 
//     $02: Bounce off and fall.      
//     $04: Reverse direction.        
//     $08: Stick, Remove REFLECT, 
//   $0100: REFLECT needed if $01 bit
//   $0200: REFLECT needed if $02 bit
//   $0400: REFLECT needed if $04 bit
//   $0800: REFLECT needed if $08 bit
// $010000: Sound 1
PSa1 =     $01; // die/explode/disintegrate. 
PSa2 = $010001; // die/explode/disintegrate.                 With Sound 1
PSa3 =   $0101; // die/explode/disintegrate. REFLECT needed. 
PSa4 = $010101; // die/explode/disintegrate. REFLECT needed. With Sound 1
PSa5 = $020101; // die/explode/disintegrate. REFLECT needed. With Sound 2

PSb1 =     $02; // Bounce off and fall.      
PSb2 = $010002; // Bounce off and fall.                      With Sound 1
PSb3 =   $0202; // Bounce off and fall.      REFLECT needed. 
PSb4 = $010202; // Bounce off and fall.      REFLECT needed. With Sound 1

PSc1 =     $04; // Reverse direction.        
PSc2 = $010004; // Reverse direction.                        With Sound 1
PSc3 =   $0404; // Reverse direction.        REFLECT needed. 
PSc4 = $010404; // Reverse direction.        REFLECT needed. With Sound 1
PSc5 = $010405; // Reverse dir or die.       REFLECT needed to reverse dir. With Sound 1
*/



// -----------------------------------------------------------------------------
// Projectile Hostile  --------------------------------------------------------
o_name = object_get_name(ProjectileHostile);
data_go_scr(  o_name,   Projectile_init, 0, 0, 0, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBy, CSd,   0,  $01,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",PBb1,PSa2);




// -----------------------------------------------------------------------------
// Axe  --------------------------------------------------------
o_name = object_get_name(Axe);
data_go_scr(  o_name,   Projectile_init, init_Axe, update_Axe, usd_Axe, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBy, CSd,   0,  $04,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",PBb1,PSa5);
if (g.mod_REFLECT_more_obj) data_go_prop3(o_name+"01",PBb1,PSa5|PSc3);


// -----------------------------------------------------------------------------
// Bolo  --------------------------------------------------------
o_name = object_get_name(Bolo);
data_go_scr(  o_name,   Projectile_init, init_Bolo, update_Bolo, usd_Bolo, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBy, CSd,   0,  $03,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",PBb1,PSa5);


// -----------------------------------------------------------------------------
// Boomerang  --------------------------------------------------------
o_name = object_get_name(Boomerang);
data_go_scr(  o_name,   Projectile_init, init_Boomerang, update_Boomerang, usd_Boomerang, draw_Boomerang);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBy, CSd,   0,  $03,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",PBb1,PSb2);


// -----------------------------------------------------------------------------
// Bullet1  --------------------------------------------------------
o_name = object_get_name(Bullet1);
data_go_scr(  o_name,   Projectile_init, init_Bullet1, update_Bullet1, usd_Bullet1, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBy, CSd,   0,  $01,   0,    0,    0,    0,    0,    0,    0,    0);
data_go_prop2(o_name+"02", PIc, HBy, CSd,   0,  $01,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",PBb1,PSa2);
data_go_prop3(o_name+"02",PBb1,PSa2);
if (g.mod_REFLECT_more_obj) data_go_prop3(o_name+"01",PBb1,PSa2|PSc3);
if (g.mod_REFLECT_more_obj) data_go_prop3(o_name+"02",PBb1,PSa2|PSc3);


// -----------------------------------------------------------------------------
// Bullet2  --------------------------------------------------------
o_name = object_get_name(Bullet2);
data_go_scr(  o_name,   Projectile_init, init_Bullet2, update_Bullet2, usd_Bullet1, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBy, CSd,   0,  $04,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",PBb1,PSa2);
if (g.mod_REFLECT_more_obj) data_go_prop3(o_name+"01",PBb1,PSa2|PSc3);


// -----------------------------------------------------------------------------
// Drop  --------------------------------------------------------
o_name = object_get_name(Drop);
data_go_scr(  o_name,   Projectile_init, init_Drop, update_Drop, usd_Drop, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBy, CSd,   0,  $01,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",PBb1,PSa4);


// -----------------------------------------------------------------------------
// Fireball1  --------------------------------------------------------
o_name = object_get_name(Fireball1);
data_go_scr(  o_name,   Projectile_init, init_Fireball1, update_Fireball1, usd_Fireball1, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBy, CSd,   0,  $02,   0,    0,    0,    0,    0,    0,    0,    0);
data_go_prop2(o_name+"02", PIa, HBy, CSd,   0,  $04,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",PBb1,PSa4);
data_go_prop3(o_name+"02",PBb1,PSa4);
if (g.mod_REFLECT_more_obj) data_go_prop3(o_name+"01",PBb1,PSa4|PSc3);
if (g.mod_REFLECT_more_obj) data_go_prop3(o_name+"02",PBb1,PSa4|PSc3);


// -----------------------------------------------------------------------------
// Fireball2  --------------------------------------------------------
o_name = object_get_name(Fireball2); // Barba, Thunderbird, 
data_go_scr(  o_name,   Projectile_init, init_Fireball2, update_Fireball2, usd_Fireball2, 0);
_PI1  = PIb;
_HB1  = HBy;
_CS1  = CSd;
_PB1  = PBb1;
_PS1  = PSa4;
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01",_PI1,_HB1,_CS1,   0,  $06,   0,    0,    0,    0,    0,    0,    0,    0);
data_go_prop2(o_name+"02",_PI1,_HB1,_CS1,   0,  $07,   0,    0,    0,    0,    0,    0,    0,    0);
data_go_prop2(o_name+"03",_PI1,_HB1,_CS1,   0,  $05,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",_PB1,_PS1);
data_go_prop3(o_name+"02",_PB1,_PS1);
data_go_prop3(o_name+"03",_PB1,_PS1);


// -----------------------------------------------------------------------------
// Flame1  --------------------------------------------------------
o_name = object_get_name(Flame1);
data_go_scr(  o_name,   Projectile_init, init_Flame1, update_Flame1, usd_Flame1, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBy, CSd,   0,  $04,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",PBa1,PSa4);


// -----------------------------------------------------------------------------
// Flame2  --------------------------------------------------------
o_name = object_get_name(Flame2);
data_go_scr(  o_name,   Projectile_init, init_Flame2, update_Flame2, usd_Flame2, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBy, CSd,   0,  $05,   0,    0,    0,    0,    0,    0,    0,    0);
data_go_prop2(o_name+"02", PIb, HBy, CSd,   0,  $05,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",PBa1,PSa4);
data_go_prop3(o_name+"02",PBa1,PSa4);


// -----------------------------------------------------------------------------
// Mace1  --------------------------------------------------------
o_name = object_get_name(Mace1);
data_go_scr(  o_name,   Projectile_init, init_Mace1, update_Mace1, usd_Mace1, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBy, CSd,   0,  $05,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",PBb1,PSa5);
if (g.mod_REFLECT_more_obj) data_go_prop3(o_name+"01",PBb1,PSa5|PSc3);


// -----------------------------------------------------------------------------
// Mace2  --------------------------------------------------------
o_name = object_get_name(Mace2);
data_go_scr(  o_name,   Projectile_init, init_Mace2, update_Mace2, usd_Mace2, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIc, HBy, CSd,   0,  $04,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",PBb1,PSa5);
if (g.mod_REFLECT_more_obj) data_go_prop3(o_name+"01",PBb1,PSa5|PSc3);


// -----------------------------------------------------------------------------
// RisingBubble  --------------------------------------------------------
o_name = object_get_name(RisingBubble);
data_go_scr(  o_name,   Projectile_init, init_RisingBubble, update_RisingBubble, usd_RisingBubble, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBy, CSd,   0,  $01,   0,    0,    0,    0,    0,    0,    0,    0);
data_go_prop2(o_name+"02", PIb, HBy, CSd,   0,  $01,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",PBb1,PSa4);
data_go_prop3(o_name+"02",PBb1,PSa4);


// -----------------------------------------------------------------------------
// Rock1  --------------------------------------------------------
o_name = object_get_name(Rock1);
data_go_scr(  o_name,   Projectile_init, init_Rock1, update_Rock1, usd_Rock, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBy, CSd,   0,  $01,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",PBb1,PSa2);


// -----------------------------------------------------------------------------
// Rock2  --------------------------------------------------------
o_name = object_get_name(Rock2);
data_go_scr(  o_name,   Projectile_init, init_Rock2, update_Rock2, usd_Rock, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBy, CSd,   0,  $02,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",PBb1,PSb2);
if (g.mod_REFLECT_more_obj) data_go_prop3(o_name+"01",PBb1,PSb2|PSc3);
/*
PSa5|PSc3
// Proj body to PC shld interaction.
// $000000: none/passive. Unblockable
//     $01: die/explode/disintegrate. 
//     $02: Bounce off and fall.      
//     $04: Reverse direction.        
//     $08: Stick, Remove REFLECT, 
//   $0100: REFLECT needed if $01 bit
//   $0200: REFLECT needed if $02 bit
//   $0400: REFLECT needed if $04 bit
//   $0800: REFLECT needed if $08 bit
// $010000: Sound 1

PSa1 =     $01; // die/explode/disintegrate. 
PSa2 = $010001; // die/explode/disintegrate.                 With Sound 1
PSa3 =   $0101; // die/explode/disintegrate. REFLECT needed. 
PSa4 = $010101; // die/explode/disintegrate. REFLECT needed. With Sound 1
PSa5 = $020101; // die/explode/disintegrate. REFLECT needed. With Sound 2

PSb1 =     $02; // Bounce off and fall.      
PSb2 = $010002; // Bounce off and fall.                      With Sound 1
PSb3 =   $0202; // Bounce off and fall.      REFLECT needed. 
PSb4 = $010202; // Bounce off and fall.      REFLECT needed. With Sound 1

PSc1 =     $04; // Reverse direction.        
PSc2 = $010004; // Reverse direction.                        With Sound 1
PSc3 =   $0404; // Reverse direction.        REFLECT needed. 
PSc4 = $010404; // Reverse direction.        REFLECT needed. With Sound 1
PSc5 = $010405; // Reverse dir or die.       REFLECT needed to reverse dir. With Sound 1
*/


// -----------------------------------------------------------------------------
// Rock3  --------------------------------------------------------
o_name = object_get_name(Rock3);
data_go_scr(  o_name,   Projectile_init, init_Rock3, update_Rock3, usd_Rock, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBy, CSd,   0,  $02,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",PBb1,PSa4);


// -----------------------------------------------------------------------------
// SoundWave  --------------------------------------------------------
o_name = object_get_name(SoundWave);
data_go_scr(  o_name,   Projectile_init, init_SoundWave, update_SoundWave, usd_SoundWave, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBy, CSd,   0,  $04,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",PBb1,PSc5);


// -----------------------------------------------------------------------------
// Spear  --------------------------------------------------------
o_name = object_get_name(Spear);
data_go_scr(  o_name,   Projectile_init, init_Spear, update_Spear, usd_Spear, draw_Spear);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBz, CSd,   0,  $02,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",PBb1,PSb2);


// -----------------------------------------------------------------------------
// SpikeBall  --------------------------------------------------------
o_name = object_get_name(SpikeBall1);
data_go_scr(  o_name,   SpikeBall1_init_1, SpikeBall1_init_2, SpikeBall1_update, SpikeBall1_udp);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb,HBaa, CSf,   0,  $03,   0,    0,    0,    0,    0,    0,    0,    0);
data_go_prop2(o_name+"02", PId,HBaa, CSf,   0,  $03,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",PBb1,PSb2);
data_go_prop3(o_name+"02",PBb1,PSb2);


// -----------------------------------------------------------------------------
// SwordBeam  --------------------------------------------------------
o_name = object_get_name(SwordBeam);
data_go_scr(  o_name,   Projectile_init, init_SwordBeam, update_SwordBeam, usd_SwordBeam, 0);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIb, HBy, CSd,   0,  $04,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",PBb1,PSb2);

// This is really cool but makes it way too easy to kill knights b/c there's no AI for them to try to block the reflected beam.
// TODO: Add logic to knights for blocking reflected projectiles?
//if (g.mod_REFLECT_more_obj) data_go_prop3(o_name+"01",PBb1,PSb2|PSc3);


// -----------------------------------------------------------------------------
// BossExplosion  --------------------------------------------------------
o_name = object_get_name(BossExplosion);
data_go_scr(  o_name,   Projectile_init, init_BossExplosion, update_BossExplosion, usd_BossExplosion, draw_BossExplosion);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBa, CSa,   0,    0,   0,    0,    0,    0,    0,    0,    0,    0);
//                        body,shld, 
data_go_prop3(o_name+"01",   0,   0);








//dev_AutomateGameObjectData1();

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
instance_destroy();
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------




if (DEV)
{
    show_debug_message("GameObjectData_Create() END. "+string(current_time-_START_TIME));
    show_debug_message("");
}




