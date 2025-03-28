/// LevelUpMenu_Draw()


var _i,_j, _x,_y;


if(!global.App_frame_count 
|| !surface_exists(srf_FRAME) )
{
    var _tsrc, _ts_x,_ts_y;
    
    if(!surface_exists(srf_FRAME)) srf_FRAME = surface_create(CLMS<<3, ROWS<<3);
    
    surface_set_target(srf_FRAME);
    
    for(_i=0; _i<ROWS; _i++) // each row
    {
        for(_j=0; _j<CLMS; _j++) // each clm
        {
                _tsrc = string_char_at(ar_TSRC_DATA[_i], _j+1);
            if (_tsrc=="0" 
            ||  _tsrc=="1" 
            ||  _tsrc=="2" )
            {
                _tsrc = g.dl_MenuFrame_TSRC[|real(_tsrc)];
                _ts_x = ((_tsrc>>0)&$F)<<3;
                _ts_y = ((_tsrc>>4)&$F)<<3;
                _x = _j<<3;
                _y = _i<<3;
                draw_background_part(g.TS_MENU, _ts_x,_ts_y, 8,8, _x,_y);
            }
        }
    }
    
    surface_reset_target();
}








if(!canDrawSections) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if(!cnt_draw_rows)   exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
var _idx, _count, _row;


draw_sprite_(spr_1x1_WHT,0, drawX,drawY, -1, CLMS<<3, cnt_draw_rows<<3, background_colour);




// -------------------------------------------------------------------------
pal_swap_set(p.palette_image, PI_DEF);
// -------------------------------------------------------------------------




// -------------------------------------------------------------------------
if (surface_exists(srf_FRAME))
{
    if (cnt_draw_rows<ROWS)
    {    draw_surface_part(srf_FRAME, 0,0, CLMS<<3,cnt_draw_rows<<3, drawX,drawY);  }
    else draw_surface(     srf_FRAME, drawX,drawY);
}




// -------------------------------------------------------------------------
// ARROW SPRITE
if (cnt_draw_rows > dg_DATA[#g.level_up_idx,IDX_TEXT_ROW])
{
    _x = drawX + (( dg_DATA[#g.level_up_idx,IDX_TEXT_CLM]-1)<<3);
    _y = drawY + (  dg_DATA[#g.level_up_idx,IDX_TEXT_ROW]   <<3);
    draw_sprite_(ARROW_SPR,0, _x,_y);
}




// ----------------------------------------------------------------------------
// ICON SPRITES
for(_i=0; _i<3; _i++)
{
    _row = dg_DATA[#_i,IDX_LVLS_ROW] + LVL_SECTION_ROWS - 1;
    
    if (cnt_draw_rows<=_row 
    ||  (g.level_up_idx==_i && !canDrawStatIcon) )
    {
        continue;//_i
    }
    
    
    switch(_i){
    case STAT_ATK:{_count=f.level_atk; break;}
    case STAT_MAG:{_count=f.level_mag; break;}
    case STAT_LIF:{_count=f.level_lif; break;}
    }
    _x  = drawX + (CLM_LVL_ICON<<3);
    _y  = drawY + (_row<<3);
    _y += 1; // mod 2022/05/27. Padding against bottom of "WILL GO UP" text
    for(_j=0; _j<_count; _j++)
    {
        draw_spr_aligned(dg_DATA[#_i,IDX_ICON_SPR], _x+(_j<<3),_y, -1,-1);
    }
    
    /*
    if (g.level_up_idx==_i 
    &&  _count>=STAT_LEVEL_MAX )
    {// Draw 1up +1 instead of "WILL GO UP"
        _x  = drawX + (CLM_LVL_TEXT<<3);
        _y -= 9;
        _x += 4;
        _y += 8;
        //spr_Lives_icon
        draw_sprite_(spr_Lives_icon,0,  _x,_y, PI_PC_1);
        _x += 8;
        draw_sprite_(spr_plus_symbol,0, _x,_y, PI_DEF);
        _x += 8;
        draw_text_(_x,_y, "1");
    }
    */
}




// ----------------------------------------------------------------------------
// TEXT
for(_i=ds_grid_width(dg_DATA)-1; _i>=0; _i--)
{
    if (_i==WILL_GO_UP_IDX 
    ||  _i==WILL_GO_UP_IDX+1 
    ||  cnt_draw_rows<=dg_DATA[#_i,IDX_TEXT_ROW] )
    {
        continue;//_i
    }
    
    
    _x = drawX + (dg_DATA[#_i,IDX_TEXT_CLM]<<3);
    _y = drawY + (dg_DATA[#_i,IDX_TEXT_ROW]<<3);
    draw_text_(_x,_y, dg_DATA[#_i,IDX_TEXT]);
}




// ----------------------------------------------------------------------------
// TEXT: "WILL", "GO UP"
if (g.level_up_idx==STAT_ATK 
||  g.level_up_idx==STAT_MAG 
||  g.level_up_idx==STAT_LIF )
{   // This only draws "WILL GO UP" for the cursor's stat.
    // I beleive OG draws "WILL GO UP" for any stat that qualifies to level up.
    if (dg_DATA[#g.level_up_idx,IDX_CAN_LVL])
    {
        _idx = WILL_GO_UP_IDX;
        _row = dg_DATA[#_idx,IDX_TEXT_ROW] + (LVL_SECTION_ROWS*g.level_up_idx);
        
        for(_i=0; _i<2; _i++)
        {
            _row += _i;
            if (cnt_draw_rows>_row)
            {
                _idx += _i;
                _x = drawX + (dg_DATA[#_idx,IDX_TEXT_CLM]<<3);
                _y = drawY + (_row                       <<3);
                draw_text_(_x,_y, dg_DATA[#_idx,IDX_TEXT]);
            }
        }
    }
}




// ----------------------------------------------------------------------------
// TEXT: LEVEL UP COST
for(_i=0; _i<3; _i++)
{
    if (cnt_draw_rows>dg_DATA[#_i,IDX_TEXT_ROW]+1)
    {
        _x = drawX + (CLM_XP<<3);
        _y = drawY + ((dg_DATA[#_i,IDX_TEXT_ROW]+1)<<3);
        draw_text_(_x,_y, string(statXPNext[_i]));
    }
}




// ----------------------------------------------------------------------------
pal_swap_reset();
// ----------------------------------------------------------------------------








// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
canDrawSections = 0;
cnt_draw_rows   = 0;




