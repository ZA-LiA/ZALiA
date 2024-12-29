/// Tyell_draw()


if(!can_draw_self)                      exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if (anim_frame>=ds_grid_width(dg_anim)) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if(!dg_anim[#anim_frame,$01])           exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


if (use_tiles)
{
    var _i;
    var _TS   = dg_anim[#anim_frame,$01];
    var _TSRC = dg_anim[#anim_frame,$02];
    var _ts_x = 0;
    var _ts_y = 0;
    var _x    = 0;
    var _y    = 0;
    
    pal_swap_set(p.palette_image, palidx);
    for(_i=0; _i<4; _i++)
    {
        _ts_x = ( ( _TSRC>>((_i<<3)+$0) )&$F) <<3;
        _ts_y = ( ( _TSRC>>((_i<<3)+$4) )&$F) <<3;
        _x    = drawX - (!(_i&$1) <<3);
        _y    = drawY - ( (_i<$2) <<3);
        draw_background_part(_TS, _ts_x,_ts_y, 8,8, _x,_y);
    }
    pal_swap_reset();
}
else
{

}




