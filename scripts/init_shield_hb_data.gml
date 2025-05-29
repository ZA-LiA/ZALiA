/// init_shield_hb_data()


var _i, _a;
var _w,_h, _w2,_h2;


// 0005 shldYOffset: array E59C-E5A2: 12 00 05 10 05 02 02
// 0007 shldH:       array E5A3-E5A9: 08 0D 20 10 20 0D 10
// 0004 shldXOffset: array E5AA-E5B0: 00 00 00 FC 00 FF 02
// 0006 shldW:       array E5B1-E5B7: 02 02 10 18 0F 12 14


// NO HB
dg_ShieldHB[#$00, 0] =    0; // xoff RGT
dg_ShieldHB[#$00, 1] =    0; // xoff LFT
dg_ShieldHB[#$00, 2] =    0; // yoff
dg_ShieldHB[#$00, 3] =    0; // w
dg_ShieldHB[#$00, 4] =    0; // h
//                                                          //
// LOW.  Geru, IronKnuckle, Fokka,                          //
dg_ShieldHB[#$01, 0] =   14 + HB_ADJ_X;         // xoff RGT
dg_ShieldHB[#$01, 1] =    0 + HB_ADJ_X;         // xoff LFT
dg_ShieldHB[#$01, 2] =   18 + HB_ADJ_Y;         // yoff
dg_ShieldHB[#$01, 3] =    2 + HB_ADJ_W;         // w
dg_ShieldHB[#$01, 4] =    8 + HB_ADJ_H;         // h
//                                                          //
// HIGH. Geru, IronKnuckle, Fokka, RebonackB, Stalfos,      //
dg_ShieldHB[#$02, 0] =   dg_ShieldHB[#$01, 0];  // xoff RGT
dg_ShieldHB[#$02, 1] =   dg_ShieldHB[#$01, 1];  // xoff LFT
dg_ShieldHB[#$02, 2] =    0 + HB_ADJ_Y;         // yoff
dg_ShieldHB[#$02, 3] =   dg_ShieldHB[#$01, 3];  // w
dg_ShieldHB[#$02, 4] =   13 + HB_ADJ_H;         // h
//                                                          //
// Helmethead,                                              //
dg_ShieldHB[#$03, 0] =    0 + HB_ADJ_X;         // xoff RGT
dg_ShieldHB[#$03, 1] =   dg_ShieldHB[#$03, 0];  // xoff LFT
dg_ShieldHB[#$03, 2] =    5 + HB_ADJ_Y;         // yoff
dg_ShieldHB[#$03, 3] =   16 + HB_ADJ_W;         // w
dg_ShieldHB[#$03, 4] =   32 + HB_ADJ_H;         // h
//                                                          //
//                                                          //
dg_ShieldHB[#$04, 0] =   -4 + HB_ADJ_X;         // xoff RGT
dg_ShieldHB[#$04, 1] =   dg_ShieldHB[#$04, 0];  // xoff LFT
dg_ShieldHB[#$04, 2] =   16 + HB_ADJ_Y;         // yoff
dg_ShieldHB[#$04, 3] =   24 + HB_ADJ_W;         // w
dg_ShieldHB[#$04, 4] =   16 + HB_ADJ_H;         // h
//                                                          //
// RebonackA,                                               //
dg_ShieldHB[#$05, 0] =   17 + HB_ADJ_X;         // xoff RGT
dg_ShieldHB[#$05, 1] =    1 + HB_ADJ_X;         // xoff LFT
dg_ShieldHB[#$05, 2] =    5 + HB_ADJ_Y;         // yoff
dg_ShieldHB[#$05, 3] =   15 + HB_ADJ_W;         // w
dg_ShieldHB[#$05, 4] =   32 + HB_ADJ_H;         // h
//                                                          //
// Girubokku,                                               //
dg_ShieldHB[#$06, 0] =   -1 + HB_ADJ_X;         // xoff RGT
dg_ShieldHB[#$06, 1] =   dg_ShieldHB[#$06, 0];  // xoff LFT
dg_ShieldHB[#$06, 2] =    2;                    // yoff
dg_ShieldHB[#$06, 3] =   18 + HB_ADJ_W;         // w
dg_ShieldHB[#$06, 4] =   13 + HB_ADJ_H;         // h
//                                                          //
// Gooma,                                                   //
dg_ShieldHB[#$07, 0] =    2 + HB_ADJ_X;         // xoff RGT
dg_ShieldHB[#$07, 1] =   dg_ShieldHB[#$07, 0];  // xoff LFT
dg_ShieldHB[#$07, 2] =    2 + HB_ADJ_Y;         // yoff
dg_ShieldHB[#$07, 3] =   20 + HB_ADJ_W;         // w
dg_ShieldHB[#$07, 4] =   16 + HB_ADJ_H;         // h
//                                                          //
// Horsehead(OG = 2),                                       //
dg_ShieldHB[#$08, 0] =    0 + HB_ADJ_X;         // xoff RGT
dg_ShieldHB[#$08, 1] =   dg_ShieldHB[#$08, 0];  // xoff LFT
dg_ShieldHB[#$08, 2] =    3 + HB_ADJ_Y;         // yoff
dg_ShieldHB[#$08, 3] =   16 + HB_ADJ_W;         // w
dg_ShieldHB[#$08, 4] =   32 + HB_ADJ_H;         // h
//                                                          //
// LOW.  ShadowBoss,                                        //
_w = 6 + HB_ADJ_W;
dg_ShieldHB[#$09, 0] =   19 + HB_ADJ_X;         // xoff RGT
dg_ShieldHB[#$09, 1] =    7 + HB_ADJ_X;         // xoff LFT
dg_ShieldHB[#$09, 2] =   17 + HB_ADJ_Y;         // yoff
dg_ShieldHB[#$09, 3] =   _w;                     // w
dg_ShieldHB[#$09, 4] =    9 + HB_ADJ_H;         // h
//                                                          //
// HIGH. ShadowBoss,                                        //
dg_ShieldHB[#$0A, 0] =   dg_ShieldHB[#$09, 0];  // xoff RGT
dg_ShieldHB[#$0A, 1] =   dg_ShieldHB[#$09, 1];  // xoff LFT
dg_ShieldHB[#$0A, 2] =    4 + HB_ADJ_Y;         // yoff
dg_ShieldHB[#$0A, 3] =   dg_ShieldHB[#$09, 3];  // w
dg_ShieldHB[#$0A, 4] =   dg_ShieldHB[#$09, 4];  // h




