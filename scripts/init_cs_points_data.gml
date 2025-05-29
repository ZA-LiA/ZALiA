/// init_cs_points_data()


var _i, _a;
var _w,_h, _w2,_h2;
var _yoff;



// **** Collision balancing notes.
//  Tested in OG:  CS_RGT x && CS_LFT x are off by 1.
//  To balance, either CS_RGT x or CS_LFT x should decrease by 1 
// TODO: Balance cs points?




ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 0: PC normal
// CS_TOP                                   //
dg_CS_OFF[# 0,$0] =   4;                // CS_TOP Lft x
dg_CS_OFF[# 0,$1] =   0;                // CS_TOP Lft y
dg_CS_OFF[# 0,$2] =  12;                // CS_TOP Rgt x
dg_CS_OFF[# 0,$3] =  dg_CS_OFF[# 0,$1]; // CS_TOP Rgt y
// CS_BTM                                   //
dg_CS_OFF[# 0,$4] =  dg_CS_OFF[# 0,$0]; // CS_BTM Lft x
dg_CS_OFF[# 0,$5] =  PC_H;              // CS_BTM Lft y
dg_CS_OFF[# 0,$6] =  dg_CS_OFF[# 0,$2]; // CS_BTM Rgt x
dg_CS_OFF[# 0,$7] =  dg_CS_OFF[# 0,$5]; // CS_BTM Rgt y
// CS_RGT                                   //
dg_CS_OFF[# 0,$8] =  15;                // CS_RGT Top x
dg_CS_OFF[# 0,$9] =   6;                // CS_RGT Top y
dg_CS_OFF[# 0,$A] =  dg_CS_OFF[# 0,$8]; // CS_RGT Btm x
dg_CS_OFF[# 0,$B] =  26;                // CS_RGT Btm y
// CS_LFT                                   //
dg_CS_OFF[# 0,$C] =   1;                // CS_LFT Top x
dg_CS_OFF[# 0,$D] =  dg_CS_OFF[# 0,$9]; // CS_LFT Top y
dg_CS_OFF[# 0,$E] =  dg_CS_OFF[# 0,$C]; // CS_LFT Btm x
dg_CS_OFF[# 0,$F] =  dg_CS_OFF[# 0,$B]; // CS_LFT Btm y


ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
if (g.mod_PCFairyCSOFF)
{
    // 1: PC fairy
    // CS_TOP                                   //
    dg_CS_OFF[# 1,$0] =   6;                  // CS_TOP Lft x
    dg_CS_OFF[# 1,$1] =   8;                  // CS_TOP Lft y
    dg_CS_OFF[# 1,$2] =   9;                  // CS_TOP Rgt x
    dg_CS_OFF[# 1,$3] =  dg_CS_OFF[# 1,$1]; // CS_TOP Rgt y
    // CS_BTM                                   //
    dg_CS_OFF[# 1,$4] =  dg_CS_OFF[# 1,$0]; // CS_BTM Lft x
    dg_CS_OFF[# 1,$5] =  23;                  // CS_BTM Lft y
    dg_CS_OFF[# 1,$6] =  dg_CS_OFF[# 1,$2]; // CS_BTM Rgt x
    dg_CS_OFF[# 1,$7] =  dg_CS_OFF[# 1,$5]; // CS_BTM Rgt y
    // CS_RGT                                   //
    dg_CS_OFF[# 1,$8] =  11;                  // CS_RGT Top x
    dg_CS_OFF[# 1,$9] =  12;                  // CS_RGT Top y
    dg_CS_OFF[# 1,$A] =  dg_CS_OFF[# 1,$8]; // CS_RGT Btm x
    dg_CS_OFF[# 1,$B] =  19;                  // CS_RGT Btm y
    // CS_LFT                                   //
    dg_CS_OFF[# 1,$C] =   4;                  // CS_LFT Top x
    dg_CS_OFF[# 1,$D] =  dg_CS_OFF[# 1,$9]; // CS_LFT Top y
    dg_CS_OFF[# 1,$E] =  dg_CS_OFF[# 1,$C]; // CS_LFT Btm x
    dg_CS_OFF[# 1,$F] =  dg_CS_OFF[# 1,$B]; // CS_LFT Btm y
}
else
{
    // -----------------------  OG  ----------------------
    // 1: PC fairy
    // CS_TOP                                   //
    dg_CS_OFF[# 1,$0] =   6;                  // CS_TOP Lft x
    dg_CS_OFF[# 1,$1] =   8;                  // CS_TOP Lft y
    dg_CS_OFF[# 1,$2] =  10;                  // CS_TOP Rgt x
    dg_CS_OFF[# 1,$3] =  dg_CS_OFF[# 1,$1]; // CS_TOP Rgt y
    // CS_BTM                                   //
    dg_CS_OFF[# 1,$4] =  dg_CS_OFF[# 1,$0]; // CS_BTM Lft x
    dg_CS_OFF[# 1,$5] =  26;                  // CS_BTM Lft y
    dg_CS_OFF[# 1,$6] =  dg_CS_OFF[# 1,$2]; // CS_BTM Rgt x
    dg_CS_OFF[# 1,$7] =  dg_CS_OFF[# 1,$5]; // CS_BTM Rgt y
    // CS_RGT                                   //
    dg_CS_OFF[# 1,$8] =  13;                  // CS_RGT Top x
    dg_CS_OFF[# 1,$9] =  12;                  // CS_RGT Top y
    dg_CS_OFF[# 1,$A] =   6;                  // CS_RGT Btm x
    dg_CS_OFF[# 1,$B] =  24;                  // CS_RGT Btm y
    // CS_LFT                                   //
    dg_CS_OFF[# 1,$C] =   3;                  // CS_LFT Top x
    dg_CS_OFF[# 1,$D] =  dg_CS_OFF[# 1,$9]; // CS_LFT Top y
    dg_CS_OFF[# 1,$E] =  -6;                  // CS_LFT Btm x
    dg_CS_OFF[# 1,$F] =  dg_CS_OFF[# 1,$B]; // CS_LFT Btm y
}


ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 2: PC cucco norm
// CS_TOP                                   //
dg_CS_OFF[# 2,$0] =   5;                  // CS_TOP Lft x
dg_CS_OFF[# 2,$1] =  dg_CS_OFF[# 0,$1]; // CS_TOP Lft y
dg_CS_OFF[# 2,$2] =  11;                  // CS_TOP Rgt x
dg_CS_OFF[# 2,$3] =  dg_CS_OFF[# 2,$1]; // CS_TOP Rgt y
// CS_BTM                                   //
dg_CS_OFF[# 2,$4] =  dg_CS_OFF[# 2,$0]; // CS_BTM Lft x
dg_CS_OFF[# 2,$5] =  16;                  // CS_BTM Lft y
dg_CS_OFF[# 2,$6] =  dg_CS_OFF[# 2,$2]; // CS_BTM Rgt x
dg_CS_OFF[# 2,$7] =  dg_CS_OFF[# 2,$5]; // CS_BTM Rgt y
// CS_RGT                                   //
dg_CS_OFF[# 2,$8] =  13;                  // CS_RGT Top x
dg_CS_OFF[# 2,$9] =   4;                  // CS_RGT Top y
dg_CS_OFF[# 2,$A] =  dg_CS_OFF[# 2,$8]; // CS_RGT Btm x
dg_CS_OFF[# 2,$B] =  12;                  // CS_RGT Btm y
// CS_LFT                                   //
dg_CS_OFF[# 2,$C] =   3;                  // CS_LFT Top x
dg_CS_OFF[# 2,$D] =  dg_CS_OFF[# 2,$9]; // CS_LFT Top y
dg_CS_OFF[# 2,$E] =  dg_CS_OFF[# 2,$C]; // CS_LFT Btm x
dg_CS_OFF[# 2,$F] =  dg_CS_OFF[# 2,$B]; // CS_LFT Btm y

ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 3: PC cucco crouching
// CS_TOP                                   //
dg_CS_OFF[# 3,$0] =  dg_CS_OFF[# 2,$0]; // CS_TOP Lft x
dg_CS_OFF[# 3,$1] =   7;                  // CS_TOP Lft y
dg_CS_OFF[# 3,$2] =  dg_CS_OFF[# 2,$2]; // CS_TOP Rgt x
dg_CS_OFF[# 3,$3] =  dg_CS_OFF[# 3,$1]; // CS_TOP Rgt y
// CS_BTM                                   //
dg_CS_OFF[# 3,$4] =  dg_CS_OFF[# 3,$0]; // CS_BTM Lft x
dg_CS_OFF[# 3,$5] =  dg_CS_OFF[# 2,$5]; // CS_BTM Lft y
dg_CS_OFF[# 3,$6] =  dg_CS_OFF[# 3,$2]; // CS_BTM Rgt x
dg_CS_OFF[# 3,$7] =  dg_CS_OFF[# 3,$5]; // CS_BTM Rgt y
// CS_RGT                                   //
dg_CS_OFF[# 3,$8] =  dg_CS_OFF[# 2,$8]; // CS_RGT Top x
dg_CS_OFF[# 3,$9] =  12;                  // CS_RGT Top y
dg_CS_OFF[# 3,$A] =  dg_CS_OFF[# 3,$8]; // CS_RGT Btm x
dg_CS_OFF[# 3,$B] =  dg_CS_OFF[# 3,$9]; // CS_RGT Btm y
// CS_LFT                                   //
dg_CS_OFF[# 3,$C] =  dg_CS_OFF[# 2,$C]; // CS_LFT Top x
dg_CS_OFF[# 3,$D] =  dg_CS_OFF[# 3,$9]; // CS_LFT Top y
dg_CS_OFF[# 3,$E] =  dg_CS_OFF[# 3,$C]; // CS_LFT Btm x
dg_CS_OFF[# 3,$F] =  dg_CS_OFF[# 3,$B]; // CS_LFT Btm y




ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 4: 16x16 size GO
// CS_TOP                                   //
dg_CS_OFF[# 4,$0] =   8;                  // CS_TOP Left x
dg_CS_OFF[# 4,$1] =   1;                  // CS_TOP Left y
dg_CS_OFF[# 4,$2] =  dg_CS_OFF[# 4,$0]; // CS_TOP Right x
dg_CS_OFF[# 4,$3] =  dg_CS_OFF[# 4,$1]; // CS_TOP Right y
// CS_BTM                                   //
dg_CS_OFF[# 4,$4] =  dg_CS_OFF[# 4,$0]; // CS_BTM Left x
dg_CS_OFF[# 4,$5] =  16;                  // CS_BTM Left y
dg_CS_OFF[# 4,$6] =  dg_CS_OFF[# 4,$4]; // CS_BTM Right x
dg_CS_OFF[# 4,$7] =  dg_CS_OFF[# 4,$5]; // CS_BTM Right y
// CS_RGT                                   //
dg_CS_OFF[# 4,$8] =  14;                  // CS_RGT Top x
dg_CS_OFF[# 4,$9] =   5;                  // CS_RGT Top y
dg_CS_OFF[# 4,$A] =  dg_CS_OFF[# 4,$8]; // CS_RGT Bottom x
dg_CS_OFF[# 4,$B] =  11;                  // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[# 4,$C] =   2;                  // CS_LFT Top x
dg_CS_OFF[# 4,$D] =  dg_CS_OFF[# 4,$9]; // CS_LFT Top y
dg_CS_OFF[# 4,$E] =  dg_CS_OFF[# 4,$C]; // CS_LFT Bottom x
dg_CS_OFF[# 4,$F] =  dg_CS_OFF[# 4,$B]; // CS_LFT Bottom y


ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 5: 16x32 size GO
// CS_TOP                                   //
dg_CS_OFF[# 5,$0] =  dg_CS_OFF[# 4,$0]; // CS_TOP Left   x
dg_CS_OFF[# 5,$1] =  10;                  // CS_TOP Left   y
dg_CS_OFF[# 5,$2] =  dg_CS_OFF[# 5,$0]; // CS_TOP Right  x
dg_CS_OFF[# 5,$3] =  dg_CS_OFF[# 5,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[# 5,$4] =  dg_CS_OFF[# 5,$0]; // CS_BTM Left   x
dg_CS_OFF[# 5,$5] =  32;                  // CS_BTM Left   y
dg_CS_OFF[# 5,$6] =  dg_CS_OFF[# 5,$4]; // CS_BTM Right  x
dg_CS_OFF[# 5,$7] =  dg_CS_OFF[# 5,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[# 5,$8] =  dg_CS_OFF[# 4,$8]; // CS_RGT Top    x
dg_CS_OFF[# 5,$9] =   7;                  // CS_RGT Top    y
dg_CS_OFF[# 5,$A] =  dg_CS_OFF[# 5,$8]; // CS_RGT Bottom x
dg_CS_OFF[# 5,$B] =  24;                  // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[# 5,$C] =  dg_CS_OFF[# 4,$C]; // CS_LFT Top    x
dg_CS_OFF[# 5,$D] =  dg_CS_OFF[# 5,$9]; // CS_LFT Top    y
dg_CS_OFF[# 5,$E] =  dg_CS_OFF[# 5,$C]; // CS_LFT Bottom x
dg_CS_OFF[# 5,$F] =  dg_CS_OFF[# 5,$B]; // CS_LFT Bottom y


ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 6: 8x16 size GO
// CS_TOP                                   //
dg_CS_OFF[# 6,$0] =   4;                  // CS_TOP Left   x
dg_CS_OFF[# 6,$1] =  dg_CS_OFF[# 4,$1]; // CS_TOP Left   y
dg_CS_OFF[# 6,$2] =  dg_CS_OFF[# 6,$0]; // CS_TOP Right  x
dg_CS_OFF[# 6,$3] =  dg_CS_OFF[# 6,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[# 6,$4] =  dg_CS_OFF[# 6,$0]; // CS_BTM Left   x
dg_CS_OFF[# 6,$5] =  dg_CS_OFF[# 4,$5]; // CS_BTM Left   y
dg_CS_OFF[# 6,$6] =  dg_CS_OFF[# 6,$2]; // CS_BTM Right  x
dg_CS_OFF[# 6,$7] =  dg_CS_OFF[# 6,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[# 6,$8] =   7;                  // CS_RGT Top    x
dg_CS_OFF[# 6,$9] =  dg_CS_OFF[# 4,$9]; // CS_RGT Top    y
dg_CS_OFF[# 6,$A] =  dg_CS_OFF[# 6,$8]; // CS_RGT Bottom x
dg_CS_OFF[# 6,$B] =  dg_CS_OFF[# 4,$B]; // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[# 6,$C] =   1;                  // CS_LFT Top    x
dg_CS_OFF[# 6,$D] =  dg_CS_OFF[# 6,$9]; // CS_LFT Top    y
dg_CS_OFF[# 6,$E] =  dg_CS_OFF[# 6,$C]; // CS_LFT Bottom x
dg_CS_OFF[# 6,$F] =  dg_CS_OFF[# 6,$B]; // CS_LFT Bottom y



ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
/*
// 7: 8x8 size GO
// CS_TOP                      //
dg_CS_OFF[# ,$0] =  ; // CS_TOP Left   x
dg_CS_OFF[# ,$1] =  ; // CS_TOP Left   y
dg_CS_OFF[# ,$2] =  dg_CS_OFF[# ,$0]; // CS_TOP Right  x
dg_CS_OFF[# ,$3] =  dg_CS_OFF[# ,$1]; // CS_TOP Right  y
// CS_BTM                      //
dg_CS_OFF[# ,$4] =  ; // CS_BTM Left   x
dg_CS_OFF[# ,$5] =  ; // CS_BTM Left   y
dg_CS_OFF[# ,$6] =  dg_CS_OFF[# ,$4]; // CS_BTM Right  x
dg_CS_OFF[# ,$7] =  dg_CS_OFF[# ,$5]; // CS_BTM Right  y
// CS_RGT                      //
dg_CS_OFF[# ,$8] =  ; // CS_RGT Top    x
dg_CS_OFF[# ,$9] =  ; // CS_RGT Top    y
dg_CS_OFF[# ,$A] =  ; // CS_RGT Bottom x
dg_CS_OFF[# ,$B] =  ; // CS_RGT Bottom y
// CS_LFT                      //
dg_CS_OFF[# ,$C] =  ; // CS_LFT Top    x
dg_CS_OFF[# ,$D] =  ; // CS_LFT Top    y
dg_CS_OFF[# ,$E] =  ; // CS_LFT Bottom x
dg_CS_OFF[# ,$F] =  ; // CS_LFT Bottom y
*/


ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 8: Pushable(16x32)
// CS_TOP                                   //
dg_CS_OFF[# 8,$0] =   1;                  // CS_TOP Left   x
dg_CS_OFF[# 8,$1] =  -1;                  // CS_TOP Left   y
dg_CS_OFF[# 8,$2] =  15;                  // CS_TOP Right  x
dg_CS_OFF[# 8,$3] =  dg_CS_OFF[# 8,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[# 8,$4] =  dg_CS_OFF[# 8,$0]; // CS_BTM Left   x
dg_CS_OFF[# 8,$5] =  32;                  // CS_BTM Left   y
dg_CS_OFF[# 8,$6] =  dg_CS_OFF[# 8,$2]; // CS_BTM Right  x
dg_CS_OFF[# 8,$7] =  dg_CS_OFF[# 8,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[# 8,$8] =  16;                  // CS_RGT Top    x
dg_CS_OFF[# 8,$9] =   6;                  // CS_RGT Top    y
dg_CS_OFF[# 8,$A] =  dg_CS_OFF[# 8,$8]; // CS_RGT Bottom x
dg_CS_OFF[# 8,$B] =  25;                  // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[# 8,$C] =  -1;                  // CS_LFT Top    x
dg_CS_OFF[# 8,$D] =  dg_CS_OFF[# 8,$9]; // CS_LFT Top    y
dg_CS_OFF[# 8,$E] =  dg_CS_OFF[# 8,$C]; // CS_LFT Bottom x
dg_CS_OFF[# 8,$F] =  dg_CS_OFF[# 8,$B]; // CS_LFT Bottom y


ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 9: 16x16 Spike trap A. SpTrA, 
// CS_TOP                                   //
dg_CS_OFF[# 9,$0] =   3;                  // CS_TOP Left   x
dg_CS_OFF[# 9,$1] =   0;                  // CS_TOP Left   y
dg_CS_OFF[# 9,$2] =  12;                  // CS_TOP Right  x
dg_CS_OFF[# 9,$3] =  dg_CS_OFF[# 9,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[# 9,$4] =  dg_CS_OFF[# 9,$0]; // CS_BTM Left   x
dg_CS_OFF[# 9,$5] =  15;                  // CS_BTM Left   y
dg_CS_OFF[# 9,$6] =  dg_CS_OFF[# 9,$2]; // CS_BTM Right  x
dg_CS_OFF[# 9,$7] =  dg_CS_OFF[# 9,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[# 9,$8] =  dg_CS_OFF[# 9,$5]; // CS_RGT Top    x
dg_CS_OFF[# 9,$9] =  dg_CS_OFF[# 9,$0]; // CS_RGT Top    y
dg_CS_OFF[# 9,$A] =  dg_CS_OFF[# 9,$8]; // CS_RGT Bottom x
dg_CS_OFF[# 9,$B] =  dg_CS_OFF[# 9,$2]; // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[# 9,$C] =  dg_CS_OFF[# 9,$1]; // CS_LFT Top    x
dg_CS_OFF[# 9,$D] =  dg_CS_OFF[# 9,$9]; // CS_LFT Top    y
dg_CS_OFF[# 9,$E] =  dg_CS_OFF[# 9,$C]; // CS_LFT Bottom x
dg_CS_OFF[# 9,$F] =  dg_CS_OFF[# 9,$B]; // CS_LFT Bottom y


ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
/*
// 10: 16x16 Spike trap B. SpTrB, 
// CS_TOP                                   //
dg_CS_OFF[#10,$0] =   3;                  // CS_TOP Left   x
dg_CS_OFF[#10,$1] =   8;                  // CS_TOP Left   y
dg_CS_OFF[#10,$2] =  12;                  // CS_TOP Right  x
dg_CS_OFF[#10,$3] =  dg_CS_OFF[#10,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#10,$4] =  dg_CS_OFF[#10,$0]; // CS_BTM Left   x
dg_CS_OFF[#10,$5] =  16;                  // CS_BTM Left   y
// dg_CS_OFF[#10,$5] =  15;                  // CS_BTM Left   y
dg_CS_OFF[#10,$6] =  dg_CS_OFF[#10,$2]; // CS_BTM Right  x
dg_CS_OFF[#10,$7] =  dg_CS_OFF[#10,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#10,$8] =  13;                  // CS_RGT Top    x
dg_CS_OFF[#10,$9] =  dg_CS_OFF[#10,$2]; // CS_RGT Top    y
dg_CS_OFF[#10,$A] =  dg_CS_OFF[#10,$8]; // CS_RGT Bottom x
dg_CS_OFF[#10,$B] =  dg_CS_OFF[#10,$2]; // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#10,$C] =  2;                   // CS_LFT Top    x
dg_CS_OFF[#10,$D] =  dg_CS_OFF[#10,$9]; // CS_LFT Top    y
dg_CS_OFF[#10,$E] =  dg_CS_OFF[#10,$C]; // CS_LFT Bottom x
dg_CS_OFF[#10,$F] =  dg_CS_OFF[#10,$B]; // CS_LFT Bottom y
*/



ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 11: 16x16 BlockB, 
// CS_TOP                                   //
dg_CS_OFF[#11,$0] =   3;                  // CS_TOP Left   x
dg_CS_OFF[#11,$1] =  -1;                  // CS_TOP Left   y
dg_CS_OFF[#11,$2] =  12;                  // CS_TOP Right  x
dg_CS_OFF[#11,$3] =  dg_CS_OFF[#11,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#11,$4] =  dg_CS_OFF[#11,$0]; // CS_BTM Left   x
dg_CS_OFF[#11,$5] =  16;                  // CS_BTM Left   y
dg_CS_OFF[#11,$6] =  dg_CS_OFF[#11,$2]; // CS_BTM Right  x
dg_CS_OFF[#11,$7] =  dg_CS_OFF[#11,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#11,$8] =  dg_CS_OFF[#11,$5]; // CS_RGT Top    x
dg_CS_OFF[#11,$9] =  dg_CS_OFF[#11,$0]; // CS_RGT Top    y
dg_CS_OFF[#11,$A] =  dg_CS_OFF[#11,$8]; // CS_RGT Bottom x
dg_CS_OFF[#11,$B] =  dg_CS_OFF[#11,$2]; // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#11,$C] =  dg_CS_OFF[#11,$1]; // CS_LFT Top    x
dg_CS_OFF[#11,$D] =  dg_CS_OFF[#11,$9]; // CS_LFT Top    y
dg_CS_OFF[#11,$E] =  dg_CS_OFF[#11,$C]; // CS_LFT Bottom x
dg_CS_OFF[#11,$F] =  dg_CS_OFF[#11,$B]; // CS_LFT Bottom y



ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 12: Bubble (skull only), 
// CS_TOP                                   //
dg_CS_OFF[#12,$0] =   8;                  // CS_TOP Left   x
dg_CS_OFF[#12,$1] =   3;                  // CS_TOP Left   y
dg_CS_OFF[#12,$2] =  dg_CS_OFF[#12,$0]; // CS_TOP Right  x
dg_CS_OFF[#12,$3] =  dg_CS_OFF[#12,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#12,$4] =  dg_CS_OFF[#12,$0]; // CS_BTM Left   x
dg_CS_OFF[#12,$5] =  14;                  // CS_BTM Left   y
dg_CS_OFF[#12,$6] =  dg_CS_OFF[#12,$4]; // CS_BTM Right  x
dg_CS_OFF[#12,$7] =  dg_CS_OFF[#12,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#12,$8] =  12;                  // CS_RGT Top    x
dg_CS_OFF[#12,$9] =   4;                  // CS_RGT Top    y
dg_CS_OFF[#12,$A] =  dg_CS_OFF[#12,$8]; // CS_RGT Bottom x
dg_CS_OFF[#12,$B] =  12;                  // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#12,$C] =   3;                  // CS_LFT Top    x
dg_CS_OFF[#12,$D] =  dg_CS_OFF[#12,$9]; // CS_LFT Top    y
dg_CS_OFF[#12,$E] =  dg_CS_OFF[#12,$C]; // CS_LFT Bottom x
dg_CS_OFF[#12,$F] =  dg_CS_OFF[#12,$B]; // CS_LFT Bottom y



ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 13: ElevatorA
_w = $18; _h = ELEV_H;
// CS_TOP                                   //
dg_CS_OFF[#13,$0] =   4;                  // CS_TOP Left   x
dg_CS_OFF[#13,$1] =   0;                  // CS_TOP Left   y
dg_CS_OFF[#13,$2] =  _w - dg_CS_OFF[#13,$0] - 1; // CS_TOP Right  x
dg_CS_OFF[#13,$3] =  dg_CS_OFF[#13,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#13,$4] =  dg_CS_OFF[#13,$0]; // CS_BTM Left   x
dg_CS_OFF[#13,$5] =  _h - 1;              // CS_BTM Left   y
dg_CS_OFF[#13,$6] =  dg_CS_OFF[#13,$2]; // CS_BTM Right  x
dg_CS_OFF[#13,$7] =  dg_CS_OFF[#13,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#13,$8] =  _w - 1;              // CS_RGT Top    x
dg_CS_OFF[#13,$9] =   4;                  // CS_RGT Top    y
dg_CS_OFF[#13,$A] =  dg_CS_OFF[#13,$8]; // CS_RGT Bottom x
dg_CS_OFF[#13,$B] =  _h - dg_CS_OFF[#13,$9] - 1; // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#13,$C] =   0;                  // CS_LFT Top    x
dg_CS_OFF[#13,$D] =  dg_CS_OFF[#13,$9]; // CS_LFT Top    y
dg_CS_OFF[#13,$E] =  dg_CS_OFF[#13,$C]; // CS_LFT Bottom x
dg_CS_OFF[#13,$F] =  dg_CS_OFF[#13,$B]; // CS_LFT Bottom y



ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 14: PlatformA
_w = $18; _h = 8;
// CS_TOP                                   //
dg_CS_OFF[#14,$0] =   4;                  // CS_TOP Left   x
dg_CS_OFF[#14,$1] =   0;                  // CS_TOP Left   y
dg_CS_OFF[#14,$2] =  _w - dg_CS_OFF[#14,$0] - 1; // CS_TOP Right  x
dg_CS_OFF[#14,$3] =  dg_CS_OFF[#14,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#14,$4] =  dg_CS_OFF[#14,$0]; // CS_BTM Left   x
dg_CS_OFF[#14,$5] =  _h - 1;              // CS_BTM Left   y
dg_CS_OFF[#14,$6] =  dg_CS_OFF[#14,$2]; // CS_BTM Right  x
dg_CS_OFF[#14,$7] =  dg_CS_OFF[#14,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#14,$8] =  _w - 1;              // CS_RGT Top    x
dg_CS_OFF[#14,$9] =   2;                  // CS_RGT Top    y
dg_CS_OFF[#14,$A] =  dg_CS_OFF[#14,$8]; // CS_RGT Bottom x
dg_CS_OFF[#14,$B] =  _h - dg_CS_OFF[#14,$9] - 1; // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#14,$C] =   0;                  // CS_LFT Top    x
dg_CS_OFF[#14,$D] =  dg_CS_OFF[#14,$9]; // CS_LFT Top    y
dg_CS_OFF[#14,$E] =  dg_CS_OFF[#14,$C]; // CS_LFT Bottom x
dg_CS_OFF[#14,$F] =  dg_CS_OFF[#14,$B]; // CS_LFT Bottom y



ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 15: TonnA
_w = $28; _h = $20;
// CS_TOP                                   //
dg_CS_OFF[#15,$0] =   7;                  // CS_TOP Left   x
dg_CS_OFF[#15,$1] =   0;                  // CS_TOP Left   y
dg_CS_OFF[#15,$2] =  _w - dg_CS_OFF[#15,$0] - 1; // CS_TOP Right  x
dg_CS_OFF[#15,$3] =  dg_CS_OFF[#15,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#15,$4] =  dg_CS_OFF[#15,$0]; // CS_BTM Left   x
dg_CS_OFF[#15,$5] =  _h;                  // CS_BTM Left   y
dg_CS_OFF[#15,$6] =  dg_CS_OFF[#15,$2]; // CS_BTM Right  x
dg_CS_OFF[#15,$7] =  dg_CS_OFF[#15,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#15,$8] =  _w - 1;              // CS_RGT Top    x
dg_CS_OFF[#15,$9] =   7;                  // CS_RGT Top    y
dg_CS_OFF[#15,$A] =  dg_CS_OFF[#15,$8]; // CS_RGT Bottom x
dg_CS_OFF[#15,$B] =  _h - dg_CS_OFF[#15,$9] - 1; // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#15,$C] =  _w - dg_CS_OFF[#15,$8] - 1;                  // CS_LFT Top    x
dg_CS_OFF[#15,$D] =  dg_CS_OFF[#15,$9]; // CS_LFT Top    y
dg_CS_OFF[#15,$E] =  dg_CS_OFF[#15,$C]; // CS_LFT Bottom x
dg_CS_OFF[#15,$F] =  dg_CS_OFF[#15,$B]; // CS_LFT Bottom y



ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 16: HelmetheadHead, 
_w = $08; _h = $10;
// CS_TOP                                   //
dg_CS_OFF[#16,$0] =   4;                  // CS_TOP Left   x
dg_CS_OFF[#16,$1] =   1;                  // CS_TOP Left   y
dg_CS_OFF[#16,$2] =  dg_CS_OFF[#16,$0]; // CS_TOP Right  x
dg_CS_OFF[#16,$3] =  dg_CS_OFF[#16,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#16,$4] =  dg_CS_OFF[#16,$0]; // CS_BTM Left   x
dg_CS_OFF[#16,$5] =  13;                  // CS_BTM Left   y
dg_CS_OFF[#16,$6] =  dg_CS_OFF[#16,$2]; // CS_BTM Right  x
dg_CS_OFF[#16,$7] =  dg_CS_OFF[#16,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#16,$8] =  _w - 1;              // CS_RGT Top    x
dg_CS_OFF[#16,$9] =   5;                  // CS_RGT Top    y
dg_CS_OFF[#16,$A] =  dg_CS_OFF[#16,$8]; // CS_RGT Bottom x
dg_CS_OFF[#16,$B] =  12;                  // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#16,$C] =  _w - dg_CS_OFF[#16,$8] - 1; // CS_LFT Top    x
dg_CS_OFF[#16,$D] =  dg_CS_OFF[#16,$9]; // CS_LFT Top    y
dg_CS_OFF[#16,$E] =  dg_CS_OFF[#16,$C]; // CS_LFT Bottom x
dg_CS_OFF[#16,$F] =  dg_CS_OFF[#16,$B]; // CS_LFT Bottom y



ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 17: Zora(short 32x16)
_w = $20; _h = $10;
// CS_TOP                                   //
dg_CS_OFF[#17,$0] =   8;                  // CS_TOP Left   x
dg_CS_OFF[#17,$1] =   0;                  // CS_TOP Left   y
dg_CS_OFF[#17,$2] =  _w - dg_CS_OFF[#17,$0] - 1; // CS_TOP Right  x
dg_CS_OFF[#17,$3] =  dg_CS_OFF[#17,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#17,$4] =  dg_CS_OFF[#17,$0]; // CS_BTM Left   x
dg_CS_OFF[#17,$5] =  _h;                  // CS_BTM Left   y
dg_CS_OFF[#17,$6] =  dg_CS_OFF[#17,$2]; // CS_BTM Right  x
dg_CS_OFF[#17,$7] =  dg_CS_OFF[#17,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#17,$8] =  _w - 3;              // CS_RGT Top    x
dg_CS_OFF[#17,$9] =   4;                  // CS_RGT Top    y
dg_CS_OFF[#17,$A] =  dg_CS_OFF[#17,$8]; // CS_RGT Bottom x
dg_CS_OFF[#17,$B] =  _h - dg_CS_OFF[#17,$9] - 1; // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#17,$C] =  _w - dg_CS_OFF[#17,$8] - 1; // CS_LFT Top    x
dg_CS_OFF[#17,$D] =  dg_CS_OFF[#17,$9]; // CS_LFT Top    y
dg_CS_OFF[#17,$E] =  dg_CS_OFF[#17,$C]; // CS_LFT Bottom x
dg_CS_OFF[#17,$F] =  dg_CS_OFF[#17,$B]; // CS_LFT Bottom y



ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 18: Zora(short 32x32)
_w = $20; _h = $20;
// CS_TOP                                   //
dg_CS_OFF[#18,$0] =   8;                  // CS_TOP Left   x
dg_CS_OFF[#18,$1] =  16;                  // CS_TOP Left   y
dg_CS_OFF[#18,$2] =  _w - dg_CS_OFF[#18,$0] - 1; // CS_TOP Right  x
dg_CS_OFF[#18,$3] =  dg_CS_OFF[#18,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#18,$4] =  dg_CS_OFF[#18,$0]; // CS_BTM Left   x
dg_CS_OFF[#18,$5] =  _h;                  // CS_BTM Left   y
dg_CS_OFF[#18,$6] =  dg_CS_OFF[#18,$2]; // CS_BTM Right  x
dg_CS_OFF[#18,$7] =  dg_CS_OFF[#18,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#18,$8] =  _w - 6;              // CS_RGT Top    x
dg_CS_OFF[#18,$9] =  20;                  // CS_RGT Top    y
dg_CS_OFF[#18,$A] =  dg_CS_OFF[#18,$8]; // CS_RGT Bottom x
dg_CS_OFF[#18,$B] =  _h - 4 - 1;          // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#18,$C] =  5;                   // CS_LFT Top    x
dg_CS_OFF[#18,$D] =  dg_CS_OFF[#18,$9]; // CS_LFT Top    y
dg_CS_OFF[#18,$E] =  dg_CS_OFF[#18,$C]; // CS_LFT Bottom x
dg_CS_OFF[#18,$F] =  dg_CS_OFF[#18,$B]; // CS_LFT Bottom y



ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 19: Zora(standing 32x32)
_w = $20; _h = $20;
// CS_TOP                                   //
dg_CS_OFF[#19,$0] =  (_w>>1) - 4;         // CS_TOP Left   x
dg_CS_OFF[#19,$1] =   4;                  // CS_TOP Left   y
dg_CS_OFF[#19,$2] =  _w - dg_CS_OFF[#19,$0] - 1; // CS_TOP Right  x
dg_CS_OFF[#19,$3] =  dg_CS_OFF[#19,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#19,$4] =  dg_CS_OFF[#19,$0]; // CS_BTM Left   x
dg_CS_OFF[#19,$5] =  _h;                  // CS_BTM Left   y
dg_CS_OFF[#19,$6] =  dg_CS_OFF[#19,$2]; // CS_BTM Right  x
dg_CS_OFF[#19,$7] =  dg_CS_OFF[#19,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#19,$8] =  (_w>>1) + 5;         // CS_RGT Top    x
dg_CS_OFF[#19,$9] =   6;                  // CS_RGT Top    y
dg_CS_OFF[#19,$A] =  dg_CS_OFF[#19,$8]; // CS_RGT Bottom x
dg_CS_OFF[#19,$B] =  _h - 4 - 1; // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#19,$C] =  (_w>>1) - 6;         // CS_LFT Top    x
dg_CS_OFF[#19,$D] =  dg_CS_OFF[#19,$9]; // CS_LFT Top    y
dg_CS_OFF[#19,$E] =  dg_CS_OFF[#19,$C]; // CS_LFT Bottom x
dg_CS_OFF[#19,$F] =  dg_CS_OFF[#19,$B]; // CS_LFT Bottom y



ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 20: 16x16 Spike trap B. SpTrB, 
_w = $02<<3;
_h = $02<<3;
// CS_TOP                                   //
dg_CS_OFF[#20,$0] =   3;                  // CS_TOP Left   x
dg_CS_OFF[#20,$1] =  _h-8;                // CS_TOP Left   y
dg_CS_OFF[#20,$2] =  _w-(dg_CS_OFF[#20,$0]+1); // CS_TOP Right  x
dg_CS_OFF[#20,$3] =  dg_CS_OFF[#20,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#20,$4] =  dg_CS_OFF[#20,$0]; // CS_BTM Left   x
dg_CS_OFF[#20,$5] =  _h;                  // CS_BTM Left   y
dg_CS_OFF[#20,$6] =  dg_CS_OFF[#20,$2]; // CS_BTM Right  x
dg_CS_OFF[#20,$7] =  dg_CS_OFF[#20,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#20,$8] =  dg_CS_OFF[#20,$2];  // CS_RGT Top    x
//dg_CS_OFF[#20,$8] =  _w-3;// CS_RGT Top    x
dg_CS_OFF[#20,$9] =  _h-4;                // CS_RGT Top    y
dg_CS_OFF[#20,$A] =  dg_CS_OFF[#20,$8]; // CS_RGT Bottom x
dg_CS_OFF[#20,$B] =  dg_CS_OFF[#20,$9]; // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#20,$C] =  dg_CS_OFF[#20,$0]; // CS_LFT Top    x
//dg_CS_OFF[#20,$C] =  _w-(dg_CS_OFF[#20,$8]-1); // CS_LFT Top    x
dg_CS_OFF[#20,$D] =  dg_CS_OFF[#20,$9]; // CS_LFT Top    y
dg_CS_OFF[#20,$E] =  dg_CS_OFF[#20,$C]; // CS_LFT Bottom x
dg_CS_OFF[#20,$F] =  dg_CS_OFF[#20,$D]; // CS_LFT Bottom y

ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 21: 16x16 Spike trap B. SpTrB, 
// CS_TOP                                   //
dg_CS_OFF[#21,$0] =  dg_CS_OFF[#20,$0]; // CS_TOP Left   x
dg_CS_OFF[#21,$1] =  dg_CS_OFF[#20,$1]; // CS_TOP Left   y
dg_CS_OFF[#21,$2] =  dg_CS_OFF[#20,$2]; // CS_TOP Right  x
dg_CS_OFF[#21,$3] =  dg_CS_OFF[#21,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#21,$4] =  dg_CS_OFF[#21,$0]; // CS_BTM Left   x
dg_CS_OFF[#21,$5] =  dg_CS_OFF[#20,$5]; // CS_BTM Left   y
dg_CS_OFF[#21,$6] =  dg_CS_OFF[#21,$2]; // CS_BTM Right  x
dg_CS_OFF[#21,$7] =  dg_CS_OFF[#21,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#21,$8] =  dg_CS_OFF[#20,$8]; // CS_RGT Top    x
dg_CS_OFF[#21,$9] =  _h+4;                // CS_RGT Top    y
dg_CS_OFF[#21,$A] =  dg_CS_OFF[#21,$8]; // CS_RGT Bottom x
dg_CS_OFF[#21,$B] =  dg_CS_OFF[#21,$9]; // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#21,$C] =  dg_CS_OFF[#20,$C]; // CS_LFT Top    x
dg_CS_OFF[#21,$D] =  dg_CS_OFF[#21,$9]; // CS_LFT Top    y
dg_CS_OFF[#21,$E] =  dg_CS_OFF[#21,$C]; // CS_LFT Bottom x
dg_CS_OFF[#21,$F] =  dg_CS_OFF[#21,$D]; // CS_LFT Bottom y


ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 22: Blaze v5(tiny flame)
_w=8; _h=8;
// CS_TOP                                   //
dg_CS_OFF[#22,$0] =  _w>>1; // CS_TOP Left   x
dg_CS_OFF[#22,$1] =  _h>>1; // CS_TOP Left   y
dg_CS_OFF[#22,$2] =  dg_CS_OFF[#22,$0]; // CS_TOP Right  x
dg_CS_OFF[#22,$3] =  dg_CS_OFF[#22,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#22,$4] =  dg_CS_OFF[#22,$0]; // CS_BTM Left   x
dg_CS_OFF[#22,$5] =  _h; // CS_BTM Left   y
dg_CS_OFF[#22,$6] =  dg_CS_OFF[#22,$4]; // CS_BTM Right  x
dg_CS_OFF[#22,$7] =  dg_CS_OFF[#22,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#22,$8] = (_w>>1)+1; // CS_RGT Top    x
dg_CS_OFF[#22,$9] =  dg_CS_OFF[#22,$1] + ((dg_CS_OFF[#22,$5]-dg_CS_OFF[#22,$1])>>1);                // CS_RGT Top    y
dg_CS_OFF[#22,$A] =  dg_CS_OFF[#22,$8]; // CS_RGT Bottom x
dg_CS_OFF[#22,$B] =  dg_CS_OFF[#22,$9]; // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#22,$C] =  (_w>>1)-1; // CS_LFT Top    x
dg_CS_OFF[#22,$D] =  dg_CS_OFF[#22,$9]; // CS_LFT Top    y
dg_CS_OFF[#22,$E] =  dg_CS_OFF[#22,$C]; // CS_LFT Bottom x
dg_CS_OFF[#22,$F] =  dg_CS_OFF[#22,$D]; // CS_LFT Bottom y


ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 23: Pushable(16x48)
_w=$10; _h=$30; _yoff=3; // _yoff=3: spr_Statue_4b height == $2D(45)
// CS_TOP                                   //
dg_CS_OFF[#23,$0] =   1; // CS_TOP Left   x
dg_CS_OFF[#23,$1] =  -1 + _yoff; // CS_TOP Left   y
dg_CS_OFF[#23,$2] =  _w - (dg_CS_OFF[#23,$0]+1); // CS_TOP Right  x
dg_CS_OFF[#23,$3] =  dg_CS_OFF[#23,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#23,$4] =  dg_CS_OFF[#23,$0]; // CS_BTM Left   x
dg_CS_OFF[#23,$5] =  _h; // CS_BTM Left   y
dg_CS_OFF[#23,$6] =  dg_CS_OFF[#23,$2]; // CS_BTM Right  x
dg_CS_OFF[#23,$7] =  dg_CS_OFF[#23,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#23,$8] =  _w; // CS_RGT Top    x
//dg_CS_OFF[#23,$8] -= 3;//testing
dg_CS_OFF[#23,$9] =  7;                // CS_RGT Top    y
dg_CS_OFF[#23,$A] =  dg_CS_OFF[#23,$8]; // CS_RGT Bottom x
dg_CS_OFF[#23,$B] =  _h - (dg_CS_OFF[#23,$9]+1); // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#23,$C] =  -((dg_CS_OFF[#23,$8]-_w)+1); // CS_LFT Top    x
dg_CS_OFF[#23,$D] =  dg_CS_OFF[#23,$9]; // CS_LFT Top    y
dg_CS_OFF[#23,$E] =  dg_CS_OFF[#23,$C]; // CS_LFT Bottom x
dg_CS_OFF[#23,$F] =  dg_CS_OFF[#23,$B]; // CS_LFT Bottom y

ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 24: Pushable(16x40)
_w=$10; _h=$30; _yoff=3; // _yoff=3: sprite height == $25(37)
// CS_TOP                                   //
dg_CS_OFF[#24,$0] =   1; // CS_TOP Left   x
dg_CS_OFF[#24,$1] =  -1 + _yoff; // CS_TOP Left   y
dg_CS_OFF[#24,$2] =  _w - (dg_CS_OFF[#24,$0]+1); // CS_TOP Right  x
dg_CS_OFF[#24,$3] =  dg_CS_OFF[#24,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#24,$4] =  dg_CS_OFF[#24,$0]; // CS_BTM Left   x
dg_CS_OFF[#24,$5] =  _h; // CS_BTM Left   y
dg_CS_OFF[#24,$6] =  dg_CS_OFF[#24,$2]; // CS_BTM Right  x
dg_CS_OFF[#24,$7] =  dg_CS_OFF[#24,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#24,$8] =  _w; // CS_RGT Top    x
dg_CS_OFF[#24,$9] =  7;                // CS_RGT Top    y
dg_CS_OFF[#24,$A] =  dg_CS_OFF[#24,$8]; // CS_RGT Bottom x
dg_CS_OFF[#24,$B] =  _h - (dg_CS_OFF[#24,$9]+1); // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#24,$C] =  -((dg_CS_OFF[#24,$8]-_w)+1); // CS_LFT Top    x
dg_CS_OFF[#24,$D] =  dg_CS_OFF[#24,$9]; // CS_LFT Top    y
dg_CS_OFF[#24,$E] =  dg_CS_OFF[#24,$C]; // CS_LFT Bottom x
dg_CS_OFF[#24,$F] =  dg_CS_OFF[#24,$B]; // CS_LFT Bottom y



// 25: Stallakk(32x32)
ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
_w=sprite_get_width(spr_Placement_16x32); _h=sprite_get_height(spr_Placement_16x32);
//_w=32; _h=32;
// CS_TOP                                   //
dg_CS_OFF[#25,$0] = (_w>>1);            // CS_TOP Left   x
dg_CS_OFF[#25,$1] =  10;                // CS_TOP Left   y
dg_CS_OFF[#25,$2] =  dg_CS_OFF[#25,$0]; // CS_TOP Right  x
dg_CS_OFF[#25,$3] =  dg_CS_OFF[#25,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#25,$4] =  dg_CS_OFF[#25,$0]; // CS_BTM Left   x
dg_CS_OFF[#25,$5] =  _h;                // CS_BTM Left   y
dg_CS_OFF[#25,$6] =  dg_CS_OFF[#25,$4]; // CS_BTM Right  x
dg_CS_OFF[#25,$7] =  dg_CS_OFF[#25,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#25,$8] = (_w>>1)+6;          // CS_RGT Top    x
dg_CS_OFF[#25,$9] =   7;                // CS_RGT Top    y
dg_CS_OFF[#25,$A] =  dg_CS_OFF[#25,$8]; // CS_RGT Bottom x
dg_CS_OFF[#25,$B] =  24;                // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#25,$C] =  (_w>>1)-6;         // CS_LFT Top    x
dg_CS_OFF[#25,$D] =  dg_CS_OFF[#25,$9]; // CS_LFT Top    y
dg_CS_OFF[#25,$E] =  dg_CS_OFF[#25,$C]; // CS_LFT Bottom x
dg_CS_OFF[#25,$F] =  dg_CS_OFF[#25,$B]; // CS_LFT Bottom y



// 26: Ganon-Form1(64x136)
ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
_w=sprite_get_width(g.Ganon1_SPRITE1); _h=sprite_get_height(g.Ganon1_SPRITE1);
// CS_TOP                                   //
dg_CS_OFF[#26,$0] = (_w>>2);            // CS_TOP Left   x
dg_CS_OFF[#26,$1] =  0;                 // CS_TOP Left   y
//dg_CS_OFF[#26,$1] =  10;                // CS_TOP Left   y
dg_CS_OFF[#26,$2] =  _w-(dg_CS_OFF[#26,$0]+1); // CS_TOP Right  x
dg_CS_OFF[#26,$3] =  dg_CS_OFF[#26,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#26,$4] =  dg_CS_OFF[#26,$0]; // CS_BTM Left   x
dg_CS_OFF[#26,$5] =  _h;                // CS_BTM Left   y
dg_CS_OFF[#26,$6] =  dg_CS_OFF[#26,$2]; // CS_BTM Right  x
dg_CS_OFF[#26,$7] =  dg_CS_OFF[#26,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#26,$8] =  _w-1;          // CS_RGT Top    x
dg_CS_OFF[#26,$9] =  _h>>2;                // CS_RGT Top    y
dg_CS_OFF[#26,$A] =  dg_CS_OFF[#26,$8]; // CS_RGT Bottom x
dg_CS_OFF[#26,$B] =  _h-(dg_CS_OFF[#26,$9]+1);                // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#26,$C] =  0;         // CS_LFT Top    x
dg_CS_OFF[#26,$D] =  dg_CS_OFF[#26,$9]; // CS_LFT Top    y
dg_CS_OFF[#26,$E] =  dg_CS_OFF[#26,$C]; // CS_LFT Bottom x
dg_CS_OFF[#26,$F] =  dg_CS_OFF[#26,$B]; // CS_LFT Bottom y



// 27: Ganon-Form2(128x168)
ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
_w=sprite_get_width(g.Ganon2_SPRITE1); _h=sprite_get_height(g.Ganon2_SPRITE1);
// CS_TOP                                   //
dg_CS_OFF[#27,$0] = (_w>>2);            // CS_TOP Left   x
dg_CS_OFF[#27,$1] =  0;                 // CS_TOP Left   y
//dg_CS_OFF[#27,$1] =  10;                // CS_TOP Left   y
dg_CS_OFF[#27,$2] =  _w-(dg_CS_OFF[#27,$0]+1); // CS_TOP Right  x
dg_CS_OFF[#27,$3] =  dg_CS_OFF[#27,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#27,$4] =  dg_CS_OFF[#27,$0]; // CS_BTM Left   x
dg_CS_OFF[#27,$5] =  _h;                // CS_BTM Left   y
dg_CS_OFF[#27,$6] =  dg_CS_OFF[#27,$2]; // CS_BTM Right  x
dg_CS_OFF[#27,$7] =  dg_CS_OFF[#27,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#27,$8] =  _w-1;          // CS_RGT Top    x
dg_CS_OFF[#27,$9] =  _h>>2;                // CS_RGT Top    y
dg_CS_OFF[#27,$A] =  dg_CS_OFF[#27,$8]; // CS_RGT Bottom x
dg_CS_OFF[#27,$B] =  _h-(dg_CS_OFF[#27,$9]+1);                // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#27,$C] =  0;         // CS_LFT Top    x
dg_CS_OFF[#27,$D] =  dg_CS_OFF[#27,$9]; // CS_LFT Top    y
dg_CS_OFF[#27,$E] =  dg_CS_OFF[#27,$C]; // CS_LFT Bottom x
dg_CS_OFF[#27,$F] =  dg_CS_OFF[#27,$B]; // CS_LFT Bottom y



// 28: Ganon-Form3(48x32)
ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
_w=sprite_get_width(g.Ganon3_SPRITE1); _h=sprite_get_height(g.Ganon3_SPRITE1);
// CS_TOP                                   //
dg_CS_OFF[#28,$0] =  _w>>2;             // CS_TOP Left   x
dg_CS_OFF[#28,$1] =  4;                 // CS_TOP Left   y
dg_CS_OFF[#28,$2] =  _w-(dg_CS_OFF[#28,$0]+1); // CS_TOP Right  x
dg_CS_OFF[#28,$3] =  dg_CS_OFF[#28,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#28,$4] =  dg_CS_OFF[#28,$0]; // CS_BTM Left   x
dg_CS_OFF[#28,$5] =  _h;                // CS_BTM Left   y
dg_CS_OFF[#28,$6] =  dg_CS_OFF[#28,$2]; // CS_BTM Right  x
dg_CS_OFF[#28,$7] =  dg_CS_OFF[#28,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#28,$8] =  _w-9;              // CS_RGT Top    x
dg_CS_OFF[#28,$9] =  7;                 // CS_RGT Top    y
dg_CS_OFF[#28,$A] =  dg_CS_OFF[#28,$8]; // CS_RGT Bottom x
dg_CS_OFF[#28,$B] =  _h-10;             // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#28,$C] =  8;                 // CS_LFT Top    x
dg_CS_OFF[#28,$D] =  dg_CS_OFF[#28,$9]; // CS_LFT Top    y
dg_CS_OFF[#28,$E] =  dg_CS_OFF[#28,$C]; // CS_LFT Bottom x
dg_CS_OFF[#28,$F] =  dg_CS_OFF[#28,$B]; // CS_LFT Bottom y



// 29: BossBot (modified)
ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
_w=sprite_get_width(spr_Placement_32x32); _h=sprite_get_height(spr_Placement_32x32);
// CS_TOP                                   //
dg_CS_OFF[#29,$0] =  _w>>2;             // CS_TOP Left   x
dg_CS_OFF[#29,$1] =  4;                 // CS_TOP Left   y
dg_CS_OFF[#29,$2] =  _w-(dg_CS_OFF[#29,$0]+1); // CS_TOP Right  x
dg_CS_OFF[#29,$3] =  dg_CS_OFF[#29,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#29,$4] =  dg_CS_OFF[#29,$0]; // CS_BTM Left   x
dg_CS_OFF[#29,$5] =  _h;                // CS_BTM Left   y
dg_CS_OFF[#29,$6] =  dg_CS_OFF[#29,$2]; // CS_BTM Right  x
dg_CS_OFF[#29,$7] =  dg_CS_OFF[#29,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#29,$8] =  _w-1;              // CS_RGT Top    x
dg_CS_OFF[#29,$9] =  $0A;               // CS_RGT Top    y
dg_CS_OFF[#29,$A] =  dg_CS_OFF[#29,$8]; // CS_RGT Bottom x
dg_CS_OFF[#29,$B] =  _h-$04;            // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#29,$C] = (_w-dg_CS_OFF[#29,$8])-1; // CS_LFT Top    x
dg_CS_OFF[#29,$D] =  dg_CS_OFF[#29,$9]; // CS_LFT Top    y
dg_CS_OFF[#29,$E] =  dg_CS_OFF[#29,$C]; // CS_LFT Bottom x
dg_CS_OFF[#29,$F] =  dg_CS_OFF[#29,$B]; // CS_LFT Bottom y




// 30: 16x32 size GO w/ low CS_TOP
_i=ds_grid_width(dg_CS_OFF);
//ds_grid_resize(  dg_CS_OFF, _i+1, ds_grid_height(dg_CS_OFF));
ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
_w=$10; _h=$20;
// CS_TOP                                   //
dg_CS_OFF[#$1E,$0] =  dg_CS_OFF[#$05,$0]; // CS_TOP Left   x
dg_CS_OFF[#$1E,$1] =  _h-$C;              // CS_TOP Left   y
dg_CS_OFF[#$1E,$2] =  dg_CS_OFF[#$1E,$0]; // CS_TOP Right  x
dg_CS_OFF[#$1E,$3] =  dg_CS_OFF[#$1E,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#$1E,$4] =  dg_CS_OFF[#$1E,$0]; // CS_BTM Left   x
dg_CS_OFF[#$1E,$5] =  dg_CS_OFF[#$05,$5]; // CS_BTM Left   y
dg_CS_OFF[#$1E,$6] =  dg_CS_OFF[#$1E,$4]; // CS_BTM Right  x
dg_CS_OFF[#$1E,$7] =  dg_CS_OFF[#$1E,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#$1E,$8] =  dg_CS_OFF[#$05,$8]; // CS_RGT Top    x
dg_CS_OFF[#$1E,$9] =  dg_CS_OFF[#$05,$9]; // CS_RGT Top    y
dg_CS_OFF[#$1E,$A] =  dg_CS_OFF[#$1E,$8]; // CS_RGT Bottom x
dg_CS_OFF[#$1E,$B] =  dg_CS_OFF[#$05,$B]; // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#$1E,$C] =  dg_CS_OFF[#$05,$C]; // CS_LFT Top    x
dg_CS_OFF[#$1E,$D] =  dg_CS_OFF[#$1E,$9]; // CS_LFT Top    y
dg_CS_OFF[#$1E,$E] =  dg_CS_OFF[#$1E,$C]; // CS_LFT Bottom x
dg_CS_OFF[#$1E,$F] =  dg_CS_OFF[#$1E,$B]; // CS_LFT Bottom y




ds_grid_resize(dg_CS_OFF, ds_grid_width(dg_CS_OFF)+1, ds_grid_height(dg_CS_OFF));
// 31: Pushable(16x32)
_w=$10; _h=$20; _yoff=0; // _yoff=0: sprite height == $20(32)
// CS_TOP                                   //
dg_CS_OFF[#$1F,$0] =   1; // CS_TOP Left   x
dg_CS_OFF[#$1F,$1] =  -1 + _yoff; // CS_TOP Left   y
dg_CS_OFF[#$1F,$2] =  _w - (dg_CS_OFF[#$1F,$0]+1); // CS_TOP Right  x
dg_CS_OFF[#$1F,$3] =  dg_CS_OFF[#$1F,$1]; // CS_TOP Right  y
// CS_BTM                                   //
dg_CS_OFF[#$1F,$4] =  dg_CS_OFF[#$1F,$0]; // CS_BTM Left   x
dg_CS_OFF[#$1F,$5] =  _h; // CS_BTM Left   y
dg_CS_OFF[#$1F,$6] =  dg_CS_OFF[#$1F,$2]; // CS_BTM Right  x
dg_CS_OFF[#$1F,$7] =  dg_CS_OFF[#$1F,$5]; // CS_BTM Right  y
// CS_RGT                                   //
dg_CS_OFF[#$1F,$8] =  _w; // CS_RGT Top    x
dg_CS_OFF[#$1F,$9] =  7;                // CS_RGT Top    y
dg_CS_OFF[#$1F,$A] =  dg_CS_OFF[#$1F,$8]; // CS_RGT Bottom x
dg_CS_OFF[#$1F,$B] =  _h - (dg_CS_OFF[#$1F,$9]+1); // CS_RGT Bottom y
// CS_LFT                                   //
dg_CS_OFF[#$1F,$C] =  -1; // CS_LFT Top    x
dg_CS_OFF[#$1F,$D] =  dg_CS_OFF[#$1F,$9]; // CS_LFT Top    y
dg_CS_OFF[#$1F,$E] =  dg_CS_OFF[#$1F,$C]; // CS_LFT Bottom x
dg_CS_OFF[#$1F,$F] =  dg_CS_OFF[#$1F,$B]; // CS_LFT Bottom y



/*
// CS_TOP                      //
dg_CS_OFF[# ,$0] =  ; // CS_TOP Left   x
dg_CS_OFF[# ,$1] =  ; // CS_TOP Left   y
dg_CS_OFF[# ,$2] =  ; // CS_TOP Right  x
dg_CS_OFF[# ,$3] =  ; // CS_TOP Right  y
// CS_BTM                      //
dg_CS_OFF[# ,$4] =  ; // CS_BTM Left   x
dg_CS_OFF[# ,$5] =  ; // CS_BTM Left   y
dg_CS_OFF[# ,$6] =  ; // CS_BTM Right  x
dg_CS_OFF[# ,$7] =  ; // CS_BTM Right  y
// CS_RGT                      //
dg_CS_OFF[# ,$8] =  ; // CS_RGT Top    x
dg_CS_OFF[# ,$9] =  ; // CS_RGT Top    y
dg_CS_OFF[# ,$A] =  ; // CS_RGT Bottom x
dg_CS_OFF[# ,$B] =  ; // CS_RGT Bottom y
// CS_LFT                      //
dg_CS_OFF[# ,$C] =  ; // CS_LFT Top    x
dg_CS_OFF[# ,$D] =  ; // CS_LFT Top    y
dg_CS_OFF[# ,$E] =  ; // CS_LFT Bottom x
dg_CS_OFF[# ,$F] =  ; // CS_LFT Bottom y
*/




