/// init_body_hb_data()


var _i, _a;
var _w,_h, _w2,_h2;


for(_i=ds_grid_width(dg_BODY_HB)-1; _i>=0; _i--)
{
    // 16x16 GO, 
    dg_BODY_HB[#_i,0] =    2 + HB_ADJ_X; // xoff
    dg_BODY_HB[#_i,1] =    3 + HB_ADJ_Y; // yoff
    dg_BODY_HB[#_i,2] =   12 + HB_ADJ_W; // w
    dg_BODY_HB[#_i,3] =   10 + HB_ADJ_H; // h    
}

// NO HB
dg_BODY_HB[#$00,0] =    0; // xoff
dg_BODY_HB[#$00,1] =    0; // yoff
dg_BODY_HB[#$00,2] =    0; // w
dg_BODY_HB[#$00,3] =    0; // h


// 16x16 GO, 
dg_BODY_HB[#$01,0] =    2 + HB_ADJ_X; // xoff
dg_BODY_HB[#$01,1] =    3 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$01,2] =   12 + HB_ADJ_W; // w
dg_BODY_HB[#$01,3] =   10 + HB_ADJ_H; // h
//                                  //
// 16x32 GO, RebonackA (facing R), RebonackB, Tektite (tall), 
dg_BODY_HB[#$02,0] =    2 + HB_ADJ_X; // xoff
dg_BODY_HB[#$02,1] =    3 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$02,2] =   12 + HB_ADJ_W; // w
dg_BODY_HB[#$02,3] =   23 + HB_ADJ_H; // h
//                                  //
//                                  //
//                                  //
// RestoreFairy, Item(width==8), Blaze, 
dg_BODY_HB[#$03,0] =    1 + HB_ADJ_X; // xoff
dg_BODY_HB[#$03,1] =    8 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$03,2] =    6 + HB_ADJ_W; // w
dg_BODY_HB[#$03,3] =    3 + HB_ADJ_H; // h
//                                  //
// Geldarm,
dg_BODY_HB[#$04,0] =    0 + HB_ADJ_X; // xoff
dg_BODY_HB[#$04,1] =    0 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$04,2] =    8 + HB_ADJ_W; // w
dg_BODY_HB[#$04,3] =    8 + HB_ADJ_H; // h
//                                  //
// Barba,  
dg_BODY_HB[#$05,0] =    0 + HB_ADJ_X; // xoff
dg_BODY_HB[#$05,1] =    0 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$05,2] =   16 + HB_ADJ_W; // w
dg_BODY_HB[#$05,3] =   24 + HB_ADJ_H; // h
//                                  //
// 
dg_BODY_HB[#$06,0] =    0; // xoff
dg_BODY_HB[#$06,1] =    0; // yoff
dg_BODY_HB[#$06,2] =    0; // w
dg_BODY_HB[#$06,3] =    0; // h
//                                  //
// BossBot, 
dg_BODY_HB[#$07,0] =    0 + HB_ADJ_X; // xoff
dg_BODY_HB[#$07,1] =    8 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$07,2] =   32 + HB_ADJ_W; // w
dg_BODY_HB[#$07,3] =   24 + HB_ADJ_H; // h
//                                  //
//                                  //
//                                  //
// PlatformB v2(RAFT), 
_w = sprite_get_width(spr_Placement_64x08);
dg_BODY_HB[#$08,0] =    0; // xoff
dg_BODY_HB[#$08,1] =    0; // yoff
dg_BODY_HB[#$08,2] =   _w; // w
dg_BODY_HB[#$08,3] =    8; // h
//                                  //
// ShadowBoss, 
if (0){ // Wider hb
    dg_BODY_HB[#$09,0] =   12 + HB_ADJ_X; // xoff  OG  14
    dg_BODY_HB[#$09,1] =    0 + HB_ADJ_Y; // yoff  OG   0
    dg_BODY_HB[#$09,2] =    8 + HB_ADJ_W; // w     OG   4
    dg_BODY_HB[#$09,3] =   29 + HB_ADJ_H; // h     OG  29
}else
{   // OG. NOTE: Data has diff values. 
    // They are changed right before collision check.
    // So these ARE THE CORRECT VALUES.
    dg_BODY_HB[#$09,0] =   14 + HB_ADJ_X; // xoff  OG  14
    dg_BODY_HB[#$09,1] =    0 + HB_ADJ_Y; // yoff  OG   0
    dg_BODY_HB[#$09,2] =    4 + HB_ADJ_W; // w     OG   4
    dg_BODY_HB[#$09,3] =   29 + HB_ADJ_H; // h     OG  29
}
//                                  //
// Aruroda, Tektite (short), 
dg_BODY_HB[#$0A,0] =   -4 + HB_ADJ_X; // xoff
dg_BODY_HB[#$0A,1] =   16 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$0A,2] =   24 + HB_ADJ_W; // w
dg_BODY_HB[#$0A,3] =   16 + HB_ADJ_H; // h
//                                  //
// Myu, 
dg_BODY_HB[#$0B,0] =    4 + HB_ADJ_X; // xoff
dg_BODY_HB[#$0B,1] =   11 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$0B,2] =    8 + HB_ADJ_W; // w
dg_BODY_HB[#$0B,3] =    3 + HB_ADJ_H; // h
//                                  //
//                                  //
//                                  //
// fix: Thunderbird, 
dg_BODY_HB[#$0C,0] =   10 + HB_ADJ_X; // xoff
dg_BODY_HB[#$0C,1] =    3 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$0C,2] =   12 + HB_ADJ_W; // w
dg_BODY_HB[#$0C,3] =   23 + HB_ADJ_H; // h 
//                                  //
// fix: RebonackA (facing L), ..
dg_BODY_HB[#$0D,0] =   18 + HB_ADJ_X; // xoff
dg_BODY_HB[#$0D,1] =    3 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$0D,2] =   12 + HB_ADJ_W; // w
dg_BODY_HB[#$0D,3] =   23 + HB_ADJ_H; // h
//                                  //
// fix: Horsehead. OG: xoff = 0, w = 8, yoff = -10
dg_BODY_HB[#$0E,0] =    2 + HB_ADJ_X; // xoff
dg_BODY_HB[#$0E,1] =  -10 + HB_ADJ_Y; // yoff    6
//dg_BODY_HB[#$0E,1] =   -2 + HB_ADJ_Y; // yoff    6
dg_BODY_HB[#$0E,2] =   12 + HB_ADJ_W; // w
dg_BODY_HB[#$0E,3] =   32 + HB_ADJ_H; // h
//                                  //
// Carock, 
dg_BODY_HB[#$0F,0] =    8 + HB_ADJ_X; // xoff
dg_BODY_HB[#$0F,1] =    0 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$0F,2] =   16 + HB_ADJ_W; // w
dg_BODY_HB[#$0F,3] =   48 + HB_ADJ_H; // h
//                                  //
// Gooma, 
dg_BODY_HB[#$10,0] =    4 + HB_ADJ_X; // xoff
dg_BODY_HB[#$10,1] =   24 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$10,2] =   16 + HB_ADJ_W; // w
dg_BODY_HB[#$10,3] =   24 + HB_ADJ_H; // h
//                                  //
//                                  //
//                                  //
// LockedDoor, 
dg_BODY_HB[#$11,0] =   -2 + HB_ADJ_X; // xoff
dg_BODY_HB[#$11,1] =    0 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$11,2] =   12 + HB_ADJ_W; // w
dg_BODY_HB[#$11,3] =   48 + HB_ADJ_H; // h
//                                  //
// Elevator, 
dg_BODY_HB[#$12,0] =    0 + HB_ADJ_X; // xoff
dg_BODY_HB[#$12,1] =   34 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$12,2] =   24 + HB_ADJ_W; // w
dg_BODY_HB[#$12,3] =    8 + HB_ADJ_H; // h
//                                  //
//                                  //
//                                  //
// Barrier, 
dg_BODY_HB[#$13,0] =    0 + HB_ADJ_X; // xoff
dg_BODY_HB[#$13,1] =    0 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$13,2] =   96 + HB_ADJ_W; // w
dg_BODY_HB[#$13,3] =  128 + HB_ADJ_H; // h
//                                  //
// NPC (except Sign), 
dg_BODY_HB[#$14,0] =  -12 + HB_ADJ_X; // xoff
dg_BODY_HB[#$14,1] =    0 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$14,2] =   40 + HB_ADJ_W; // w
dg_BODY_HB[#$14,3] =   32 + HB_ADJ_H; // h
//                                  //
// CrystalHolder 1, 
dg_BODY_HB[#$15,0] =    3 + HB_ADJ_X; // xoff
dg_BODY_HB[#$15,1] =    3 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$15,2] =    2 + HB_ADJ_W; // w
dg_BODY_HB[#$15,3] =  112 + HB_ADJ_H; // h
//                                  //
// HelmetheadHead, 
dg_BODY_HB[#$16,0] =    0 + HB_ADJ_X; // xoff
dg_BODY_HB[#$16,1] =  -10 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$16,2] =    8 + HB_ADJ_W; // w
dg_BODY_HB[#$16,3] =   32 + HB_ADJ_H; // h
//                                  //
// Snaraa, 
dg_BODY_HB[#$17,0] =    2 + HB_ADJ_X; // xoff
dg_BODY_HB[#$17,1] =    1 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$17,2] =   12 + HB_ADJ_W; // w
dg_BODY_HB[#$17,3] =   12 + HB_ADJ_H; // h
//                                  //
//                                  //
// SpikeTrapB, 
dg_BODY_HB[#$18,0] =    2; // xoff
dg_BODY_HB[#$18,1] =    9; // yoff
dg_BODY_HB[#$18,2] =   12; // w
dg_BODY_HB[#$18,3] =    7; // h
//                                  //
// PlatformA
dg_BODY_HB[#$19,0] =    0; // xoff
dg_BODY_HB[#$19,1] =    0; // yoff
dg_BODY_HB[#$19,2] =   24; // w
dg_BODY_HB[#$19,3] =    8; // h
//                                  //
// PC normal
var         _I1 = $1A;
dg_BODY_HB[#_I1,0] =    1 + HB_ADJ_X; // xoff
dg_BODY_HB[#_I1,1] =    0 + HB_ADJ_Y; // yoff
dg_BODY_HB[#_I1,2] =   13 + HB_ADJ_W; // w
dg_BODY_HB[#_I1,3] =   29 + HB_ADJ_H; // h
//                                  //
// PC normal crouching
var         _I2 = _I1+1; // 1B
dg_BODY_HB[#_I2,0] = dg_BODY_HB[#_I1,0]; // xoff
dg_BODY_HB[#_I2,1] =    4 + HB_ADJ_Y; // yoff
dg_BODY_HB[#_I2,2] = dg_BODY_HB[#_I1,2]; // w
dg_BODY_HB[#_I2,3] = dg_BODY_HB[#_I1,3] - dg_BODY_HB[#_I2,1]; // h
//                                  //
// PC fairy
var         _I3 = _I2+1; // 1C
dg_BODY_HB[#_I3,0] = dg_BODY_HB[#_I1,0]; // xoff
dg_BODY_HB[#_I3,1] = dg_BODY_HB[#_I1,1]; // yoff
dg_BODY_HB[#_I3,2] = dg_BODY_HB[#_I1,2]; // w
dg_BODY_HB[#_I3,3] = dg_BODY_HB[#_I1,3]; // h
//                                  //
// PC cucco
var         _I4 = _I3+1; // 1D
dg_BODY_HB[#_I4,0] =   2; // xoff
dg_BODY_HB[#_I4,1] =   3; // yoff
dg_BODY_HB[#_I4,2] =  13; // w
dg_BODY_HB[#_I4,3] =  11; // h
//                                  //
// PC cucco crouching
var         _I5 = _I4+1; // 1E
dg_BODY_HB[#_I5,0] = dg_BODY_HB[#_I4,0]; // xoff
dg_BODY_HB[#_I5,1] = dg_BODY_HB[#_I4,1] + 5; // yoff
dg_BODY_HB[#_I5,2] = dg_BODY_HB[#_I4,2]; // w
dg_BODY_HB[#_I5,3] = dg_BODY_HB[#_I4,3] - 5; // h



/*  Reserve $1F-27 for PC
//                                  //
// 
dg_BODY_HB[#$1F,0] =    0; // xoff
dg_BODY_HB[#$1F,1] =    0; // yoff
dg_BODY_HB[#$1F,2] =    0; // w
dg_BODY_HB[#$1F,3] =    0; // h
//                                  //
// 
dg_BODY_HB[#$20,0] =    0; // xoff
dg_BODY_HB[#$20,1] =    0; // yoff
dg_BODY_HB[#$20,2] =    0; // w
dg_BODY_HB[#$20,3] =    0; // h
//                                  //
// 
dg_BODY_HB[#$21,0] =    0; // xoff
dg_BODY_HB[#$21,1] =    0; // yoff
dg_BODY_HB[#$21,2] =    0; // w
dg_BODY_HB[#$21,3] =    0; // h
*/



//                                  //
// GiantBubble
dg_BODY_HB[#$22,0] =    2 + HB_ADJ_X; // xoff
dg_BODY_HB[#$22,1] =    3 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$22,2] =   12 + HB_ADJ_W; // w
dg_BODY_HB[#$22,3] =   15 + HB_ADJ_H; // h
//                                  //
//                                  //









//                                  //
// 16x16 Block, Tyell
_w = $10; _h = $10;
dg_BODY_HB[#$28,0] =    1; // xoff
dg_BODY_HB[#$28,1] =    1; // yoff
dg_BODY_HB[#$28,2] =   _w-(dg_BODY_HB[#$28,0]<<1); // w
dg_BODY_HB[#$28,3] =   _h-(dg_BODY_HB[#$28,1]<<1); // h
//                                  //
// TorchA
_w = $08; _h = $10;
dg_BODY_HB[#$29,0] =    1; // xoff
dg_BODY_HB[#$29,1] =   -8; // yoff
dg_BODY_HB[#$29,2] =   _w    - (dg_BODY_HB[#$29,0]<<1); // w
dg_BODY_HB[#$29,3] =   _h    -  dg_BODY_HB[#$29,1] + 2; // h
//                                  //
// TonnA, 
_w = $28; _h = $20;
dg_BODY_HB[#$2A,0] =    2; // xoff
dg_BODY_HB[#$2A,1] =    3; // yoff
dg_BODY_HB[#$2A,2] =   _w-(dg_BODY_HB[#$2A,0]<<1); // w
dg_BODY_HB[#$2A,3] =   _h-(dg_BODY_HB[#$2A,1]<<1); // h
//                                  //
// Zora (short), 
dg_BODY_HB[#$2B,0] =    4 + HB_ADJ_X; // xoff
dg_BODY_HB[#$2B,1] =   16 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$2B,2] =   24 + HB_ADJ_W; // w
dg_BODY_HB[#$2B,3] =   16 + HB_ADJ_H; // h
//                                  //
// Zora (tall), 
dg_BODY_HB[#$2C,0] =   10 + HB_ADJ_X; // xoff
dg_BODY_HB[#$2C,1] =    5 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$2C,2] =   12 + HB_ADJ_W; // w
dg_BODY_HB[#$2C,3] =   23 + HB_ADJ_H; // h
//                                  //
// Zelda (sleeping), 
_w = sprite_get_width( spr_Zelda_Placement_1); _w2 = 16;
_h = sprite_get_height(spr_Zelda_Placement_1); _h2 =  4;
dg_BODY_HB[#$2D,0] = ((_w-_w2)>>1) + HB_ADJ_X; // xoff
dg_BODY_HB[#$2D,1] =   _h - 2 - _h2 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$2D,2] =   _w2 + HB_ADJ_W; // w
dg_BODY_HB[#$2D,3] =   _h2 + HB_ADJ_H; // h
//                                  //
//                                  //
//                                  //
//                                  //
//                                  //
// Projectile 8x8
var _ADJ = -1; // MOD. Adding some balance.
dg_BODY_HB[#$30,0] =    3 + HB_ADJ_X + _ADJ; // xoff.  OG: 3
dg_BODY_HB[#$30,1] =    7 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$30,2] =    3 + HB_ADJ_W; // w
dg_BODY_HB[#$30,3] =    2 + HB_ADJ_H; // h
//                                  //
// Projectile 16x8
dg_BODY_HB[#$31,0] =    3 + HB_ADJ_X + _ADJ; // xoff.  OG: 3
dg_BODY_HB[#$31,1] =    7 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$31,2] =   10 + HB_ADJ_W; // w
dg_BODY_HB[#$31,3] =    2 + HB_ADJ_H; // h
//                                  //
// Item(width==16), 
dg_BODY_HB[#$32,0] =    4; // xoff
dg_BODY_HB[#$32,1] =    6; // yoff
dg_BODY_HB[#$32,2] =    8; // w
dg_BODY_HB[#$32,3] =    4; // h
//                                  //
// fix: Helmethead. OG: xoff = 0, w = 8
dg_BODY_HB[#$33,0] =    2 + HB_ADJ_X; // xoff
dg_BODY_HB[#$33,1] =  -10 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$33,2] =   12 + HB_ADJ_W; // w
dg_BODY_HB[#$33,3] =   32 + HB_ADJ_H; // h
//                                  //
// Helmethead(headless). 
dg_BODY_HB[#$34,0] = dg_BODY_HB[#$33,0]; // xoff
dg_BODY_HB[#$34,1] =    0; // yoff
dg_BODY_HB[#$34,2] = dg_BODY_HB[#$33,2]; // w
dg_BODY_HB[#$34,3] =   22; // h
//                                  //
// RescueFairy(hb goes further down for cucco)
dg_BODY_HB[#$35,0] =    1 + HB_ADJ_X; // xoff
dg_BODY_HB[#$35,1] =    8 + HB_ADJ_Y; // yoff
dg_BODY_HB[#$35,2] =    6 + HB_ADJ_W; // w
dg_BODY_HB[#$35,3] =   30 + HB_ADJ_H; // h
//                                  //
//                                  //
//                                  //
//                                  //
//                                  //
// CIRCLE 16x16 HB 1. SpikeTrapA, 
dg_BODY_HB[#$50,0] =    8; // xoff
dg_BODY_HB[#$50,1] =    8; // yoff
dg_BODY_HB[#$50,2] =    0; // w
dg_BODY_HB[#$50,3] =    0; // h
dg_BODY_HB[#$50,4] =    7; // radius
//                                  //
//                                  //
//                                  //
// SpikeTrapC.  CIRCLE 16x16 -------------------------------------
// SpikeTrapC has 4 possibilities. 
// Since its bitmap dimensions are odd, this balance the hb depending on the where pc is.
_a = 7; // x&y off
_w = 5; // radius
//                          // 
// SpikeTrapC (ABOVE & LEFT of pc)
            _i=$51;
dg_BODY_HB[#_i,0] =   _a; // xoff
dg_BODY_HB[#_i,1] =   _a; // yoff
dg_BODY_HB[#_i,2] =    0; // w
dg_BODY_HB[#_i,3] =    0; // h
dg_BODY_HB[#_i,4] =   _w; // radius
//                          // 
//                          // 
// SpikeTrapC (ABOVE & RIGHT of pc)
            _i++; // $52
dg_BODY_HB[#_i,0] =   _a+1; // xoff
dg_BODY_HB[#_i,1] =   _a; // yoff
dg_BODY_HB[#_i,2] =    0; // w
dg_BODY_HB[#_i,3] =    0; // h
dg_BODY_HB[#_i,4] =   _w; // radius
//                          // 
//                          // 
// SpikeTrapC (BELOW & LEFT of pc)
            _i++; // $53
dg_BODY_HB[#_i,0] =   _a; // xoff
dg_BODY_HB[#_i,1] =   _a+1; // yoff
dg_BODY_HB[#_i,2] =    0; // w
dg_BODY_HB[#_i,3] =    0; // h
dg_BODY_HB[#_i,4] =   _w; // radius
//                          // 
//                          // 
// SpikeTrapC (BELOW & RIGHT of pc)
            _i++; // $54
dg_BODY_HB[#_i,0] =   _a+1; // xoff
dg_BODY_HB[#_i,1] =   _a+1; // yoff
dg_BODY_HB[#_i,2] =    0; // w
dg_BODY_HB[#_i,3] =    0; // h
dg_BODY_HB[#_i,4] =   _w; // radius
//                          // 
//                                  //
// PlatformB
_w = sprite_get_width( spr_cloud_2a);
_h = sprite_get_height(spr_cloud_2a);
            _i++; // $55
dg_BODY_HB[#_i,0] =  4; // xoff
dg_BODY_HB[#_i,1] =  8; // yoff
dg_BODY_HB[#_i,2] = _w-(dg_BODY_HB[#_i,0]<<1); // w
dg_BODY_HB[#_i,3] =  8; // h
//dg_BODY_HB[#_i,3] = _h-(dg_BODY_HB[#_i,1]<<1); // h
//                                  //
//                                  //
//                                  //
//                                  //
//                                  //
// Blaze v5(tiny flame), 
_w=2; _h=2;
dg_BODY_HB[#$56,0] =     4-(_w>>1); // xoff
dg_BODY_HB[#$56,1] =     8-1-_h; // yoff
dg_BODY_HB[#$56,2] =     _w; // w
dg_BODY_HB[#$56,3] =     _h; // h
//                                  //
//                                  //
//                                  //
//                                  //
//                                  //
//                                  //
// Ganon1(64x136)
            _i=$60; // $60
dg_BODY_HB[#_i,0] =    0; // xoff
dg_BODY_HB[#_i,1] =    0; // yoff
dg_BODY_HB[#_i,2] =    sprite_get_width( g.Ganon1_SPRITE1); // w
dg_BODY_HB[#_i,3] =    sprite_get_height(g.Ganon1_SPRITE1); // h
//                                  //
//                                  //
// Ganon-Form2(128x176)
            _i++; // $61
dg_BODY_HB[#_i,0] =    0; // xoff
dg_BODY_HB[#_i,1] =    0; // yoff
dg_BODY_HB[#_i,2] =    sprite_get_width( g.Ganon2_SPRITE1); // w
dg_BODY_HB[#_i,3] =    sprite_get_height(g.Ganon2_SPRITE1); // h
//                                  //
//                                  //
// Ganon-Form3(48x32)
_w=sprite_get_width( g.Ganon3_SPRITE1);
_h=sprite_get_height(g.Ganon3_SPRITE1);
            _i++; // $62
dg_BODY_HB[#_i,0] =     8; // xoff
dg_BODY_HB[#_i,1] =     8; // yoff
dg_BODY_HB[#_i,2] =    _w-(dg_BODY_HB[#_i,0]<<1); // w
dg_BODY_HB[#_i,3] =    24; // h
_a=_i;
//                                  //
//                                  //
// Ganon-Form3(48x32)(on side, top facing right)
            _i++; // $63
dg_BODY_HB[#_i,2] = dg_BODY_HB[#_a,3]; // w
dg_BODY_HB[#_i,3] = dg_BODY_HB[#_a,2]; // h
dg_BODY_HB[#_i,0] = _w-dg_BODY_HB[#_i,2]-dg_BODY_HB[#_a,1]; // xoff
dg_BODY_HB[#_i,1] = dg_BODY_HB[#_a,0]; // yoff
//                                  //
// Ganon-Form3(48x32)(on side, top facing left)
            _i++; // $64
dg_BODY_HB[#_i,0] = dg_BODY_HB[#_a,1]; // xoff
dg_BODY_HB[#_i,1] = dg_BODY_HB[#_i-1,0]; // yoff
dg_BODY_HB[#_i,2] = dg_BODY_HB[#_i-1,2]; // w
dg_BODY_HB[#_i,3] = dg_BODY_HB[#_i-1,3]; // h
//                                  //
//                                  //
// Ganon-Form3-Attack4(shooting across screen)
            _i++; // $65
dg_BODY_HB[#_i,0] = dg_BODY_HB[#_a,0]; // xoff
dg_BODY_HB[#_i,1] = dg_BODY_HB[#_a,1]; // yoff
dg_BODY_HB[#_i,2] = dg_BODY_HB[#_a,2]; // w
dg_BODY_HB[#_i,3] = dg_BODY_HB[#_a,3]; // h
//                                  //
//                                  //
//                                  //
//                                  //
//                                  //
//                                  //
//                                  //
//                                  //
// BlockB(16x16)
            _i++; // $66
dg_BODY_HB[#_i,0] =     0; // xoff
dg_BODY_HB[#_i,1] =     0; // yoff
dg_BODY_HB[#_i,2] =    16; // w
dg_BODY_HB[#_i,3] =    16; // h
//                                  //
//                                  //
//                                  //
//                                  //
//                                  //
// Stallak, 
_w=sprite_get_width( spr_Placement_16x32);
_h=sprite_get_height(spr_Placement_16x32);
            _i++; // $67
dg_BODY_HB[#_i,0] =    2; // xoff
dg_BODY_HB[#_i,1] =    3; // yoff
dg_BODY_HB[#_i,2] =   _w-(dg_BODY_HB[#_i,0]<<1); // w
dg_BODY_HB[#_i,3] =   23; // h 
//                                  //




