/// init_vars_coll_2a()


canDrawCSHB = true;

/* ci: Colliding Info.  Information about what is colliding at 
    the current moment/program-line.
    Include the usual cs bits.
        $F: 0000 1111
    Include bits for each cs point that's colliding.
        $1000: csRgt1(high), $0100: csRgt2(low)
        $2000: csLft1(high), $0200: csLft2(low)
        $4000: csBtm1(left), $0400: csBtm3(right)
        $8000: csTop1(left), $0800: csTop2(right)
    Include bits for what hitboxes are colliding with each hitbox.
    
    
    Include bits for each cs point that's colliding.
        New macros for each cs point:
        $10: CS_RGT_HGH, $01: CS_RGT_LOW, $11: CS_RGT(HGH & LOW)
        $20: CS_LFT_HGH, $02: CS_LFT_LOW, $22: CS_LFT(HGH & LOW)
        $40: CS_BTM_LFT, $04: CS_BTM_RGT, $44: CS_BTM(LFT & RGT)
        $80: CS_TOP_LFT, $08: CS_TOP_RGT, $88: CS_TOP(LFT & RGT)
    The byte they're included in tells what solid type 
    they're colliding with.
        $0000FF. Solid
        $00FF00. Oneway
        $FF0000. ? Undetermined
    New cs() scripts would handle the checking.
        csB(id). B: Bottom. These would need the instance id.
            if (argument0.ci & ($44 <<$00)) return TID_SOLID1;
            if (argument0.ci & ($44 <<$08)) return TID_ONEWY1;
            if (argument0.ci & ($44 <<$10)) return TID_;
*/

// ci: Colliding Info
// cb: Colliding Bits

// pc: Points Colliding
// scp: Solid Collision Points
// sc: Sides Colliding

// cs: Colliding Sides
cs = 0; // $00A7, 00A8,X

// if cs btm is true due to a solid obj that isn't aligned w/ the grid, 
// adj_clip_floor() will need to know the correct y.
cs_btm_inst = noone;
//solidy_ytoffset = 0;

// CS: Colliding Side Offsets. Clm for g.dg_CS_OFFSETS
// Reserving the clm 0-3 for PC
// 4: 16x16, 5: 16x32, 6: 8x16, 7: 8x8, 8: Pushable
CS_OFF_IDX = 0; // default
cs_off_idx = 0; // current used


var _CS_COORD_DEF = -$100; // for points you don't want colliding, set out of room

// CS_TOP
csTop1X = _CS_COORD_DEF; // Left
csTop1Y = _CS_COORD_DEF; // Left
csTop2X = _CS_COORD_DEF; // Right
csTop2Y = _CS_COORD_DEF; // Right

// CS_BOT
csBtm1X = _CS_COORD_DEF; // Left
csBtm1Y = _CS_COORD_DEF; // Left
csBtm2X = _CS_COORD_DEF; // Right
csBtm2Y = _CS_COORD_DEF; // Right

// CS_RGT
csRgt1X = _CS_COORD_DEF; // Top
csRgt1Y = _CS_COORD_DEF; // Top
csRgt2X = _CS_COORD_DEF; // Bottom
csRgt2Y = _CS_COORD_DEF; // Bottom

// CS_LFT
csLft1X = _CS_COORD_DEF; // Top
csLft1Y = _CS_COORD_DEF; // Top
csLft2X = _CS_COORD_DEF; // Bottom
csLft2Y = _CS_COORD_DEF; // Bottom

// CS point offsets
// CS_TOP
csTop1_xoff = 0; // Left
csTop1_yoff = 0; // Left
csTop2_xoff = 0; // Right
csTop2_yoff = 0; // Right

// CS_BOT
csBtm1_xoff = 0; // Left
csBtm1_yoff = 0; // Left
csBtm2_xoff = 0; // Right
csBtm2_yoff = 0; // Right

// CS_RGT
csRgt1_xoff = 0; // Top
csRgt1_yoff = 0; // Top
csRgt2_xoff = 0; // Bottom
csRgt2_yoff = 0; // Bottom

// CS_LFT
csLft1_xoff = 0; // Top
csLft1_yoff = 0; // Top
csLft2_xoff = 0; // Bottom
csLft2_yoff = 0; // Bottom





// cp: Collision Point (Formally csBtm2(cs mid))
cp1X        = _CS_COORD_DEF; // 
cp1Y        = _CS_COORD_DEF; // 
cp1_xoff    = 0; // 
cp1_yoff    = 0; // 

cp2X        = _CS_COORD_DEF; // 
cp2Y        = _CS_COORD_DEF; // 
cp2_xoff    = 0; // 
cp2_yoff    = 0; // 




