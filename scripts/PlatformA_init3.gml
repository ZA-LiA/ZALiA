/// PlatformA_init3()


switch(ver)
{
    case 1:{
    // CS_TOP                      //
    csTop1_xoff = 4;                // CS_TOP Left   x
    csTop1_yoff = -1;               // CS_TOP Left   y
    csTop2_xoff = ww-csTop1_xoff-1; // CS_TOP Right  x
    csTop2_yoff = csTop1_yoff;      // CS_TOP Right  y
    // CS_BOT                      //
    csBtm1_xoff = csTop1_xoff;      // CS_BOT Left   x
    csBtm1_yoff = hh-csTop1_yoff-1; // CS_BOT Left   y
    csBtm2_xoff = csTop2_xoff;      // CS_BOT Right  x
    csBtm2_yoff = csBtm1_yoff;      // CS_BOT Right  y
    // CS_LFT                      //
    csLft1_xoff = -1;               // CS_LFT Top    x
    csLft1_yoff = 2;      // CS_LFT Top    y
    csLft2_xoff = csLft1_xoff;      // CS_LFT Bottom x
    csLft2_yoff = csRgt2_yoff;      // CS_LFT Bottom y
    // CS_RGT                      //
    csRgt1_xoff = ww-csLft1_xoff-1; // CS_RGT Top    x
    csRgt1_yoff = csLft1_yoff;      // CS_RGT Top    y
    csRgt2_xoff = csRgt1_xoff;      // CS_RGT Bottom x
    csRgt2_yoff = hh-csRgt1_yoff-1; // CS_RGT Bottom y
    break;}
    
    
    
    
    case 2:{ // CIRCULAR MOVEMENT
    
    break;}
}

/*
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


/// setCSOffsets()
// CS_TOP                      //
csTop1_xoff = g.dg_CS_OFF[#  cs_off_idx,  0]; // CS_TOP Left   x
csTop1_yoff = g.dg_CS_OFF[#  cs_off_idx,  1]; // CS_TOP Left   y
csTop2_xoff = g.dg_CS_OFF[#  cs_off_idx,  2]; // CS_TOP Right  x
csTop2_yoff = g.dg_CS_OFF[#  cs_off_idx,  3]; // CS_TOP Right  y
// CS_BOT                      //
csBtm1_xoff = g.dg_CS_OFF[#  cs_off_idx,  4]; // CS_BOT Left   x
csBtm1_yoff = g.dg_CS_OFF[#  cs_off_idx,  5]; // CS_BOT Left   y
csBtm2_xoff = g.dg_CS_OFF[#  cs_off_idx,  6]; // CS_BOT Right  x
csBtm2_yoff = g.dg_CS_OFF[#  cs_off_idx,  7]; // CS_BOT Right  y
// CS_RGT                      //
csRgt1_xoff = g.dg_CS_OFF[#  cs_off_idx,  8]; // CS_RGT Top    x
csRgt1_yoff = g.dg_CS_OFF[#  cs_off_idx,  9]; // CS_RGT Top    y
csRgt2_xoff = g.dg_CS_OFF[#  cs_off_idx, 10]; // CS_RGT Bottom x
csRgt2_yoff = g.dg_CS_OFF[#  cs_off_idx, 11]; // CS_RGT Bottom y
// CS_LFT                      //
csLft1_xoff = g.dg_CS_OFF[#  cs_off_idx, 12]; // CS_LFT Top    x
csLft1_yoff = g.dg_CS_OFF[#  cs_off_idx, 13]; // CS_LFT Top    y
csLft2_xoff = g.dg_CS_OFF[#  cs_off_idx, 14]; // CS_LFT Bottom x
csLft2_yoff = g.dg_CS_OFF[#  cs_off_idx, 15]; // CS_LFT Bottom y
*/




