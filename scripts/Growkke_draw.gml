/// Growkke_draw()


if(!can_draw_self)       exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if(!Segment_CanDraw_cnt) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



var _i, _x,_y;



pal_swap_set(p.palette_image, palidx);

_y = GROUND_Y - 4 + draw_yoff;
for(_i=ds_grid_width(dg_segments)-1; _i>=0; _i--)
{
    if(!dg_segments[#_i,IDX_STATE]) continue;
    
    
    _x = drawX;
    draw_sprite_(dg_segments[#_i,IDX_SPR],0, _x,_y, -1, dg_segments[#_i,IDX_XSCALE]);
    _y -= 8;
}

pal_swap_reset();




