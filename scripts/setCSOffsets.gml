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


if (id==global.pc)
{   // Same values for fairy.
                            cp1_xoff =  7;
         if (pc_is_cucco()) cp1_yoff = hh;
    else if (pc_is_fairy()) cp1_yoff = 23; // MOD
    else                    cp1_yoff = hh;
    
    // Top center x collision point
    cp2_xoff = cp1_xoff;
    cp2_yoff = 0;
}




