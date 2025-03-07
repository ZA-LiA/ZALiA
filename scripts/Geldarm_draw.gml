/// Geldarm_draw()


if (can_draw_self)
{
    pal_swap_set(p.palette_image, palidx);
    
    var _xoff;
    
    // 0: draw head first (Testing modded sprite for better looking head to segment overlap)
    // 1: draw head last (OG)
    // Head must be drawn last so it's in front for scrunching.
    var _ORDER = abs(scrunch_dir) || 1;
    
    if(!_ORDER)
    {
        _xoff = sway_dir + sign(sway_dir); // 0, +1, -1
        draw_sprite_(HEAD_SPR,0, drawX+_xoff, drawY+HEAD_DRAW_YOFF, -1, xScale);
    }
    
    
    if (canDraw_segments)
    {
        var _i, _y;
        
        var _ds_SEGMENT_Y = ds_stack_create();
            _y = drawY + segmentYOff; // segmentYOff: dist between TOP of each segment
        for(_i=0; _i<SEGMENTS; _i++)
        {
            if (_i < addOneY_cnt) _y++;
            ds_stack_push(_ds_SEGMENT_Y, _y);
            _y += segmentYOff;
        }
        
        
        for(_i=SEGMENTS; _i>0; _i--)
        {
            if (_i==1) _xoff = sway_dir; // 1st segment below head
            else       _xoff = 0;
            
            _y = ds_stack_pop(_ds_SEGMENT_Y);
            draw_sprite_(SEGMENT_SPR,0, drawX+_xoff, _y, -1, xScale);
        }
        
        ds_stack_destroy(_ds_SEGMENT_Y); _ds_SEGMENT_Y=undefined;
    }
    
    
    
    if (_ORDER)
    {
        _xoff = sway_dir + sign(sway_dir); // 0, +1, -1
        draw_sprite_(HEAD_SPR,0, drawX+_xoff, drawY+HEAD_DRAW_YOFF, -1, xScale);
    }
    
    
    
    pal_swap_reset();
}


// scrunch hb
if (g.DevTools_state 
&&  state 
&&  g.can_draw_hb 
&&  is_ancestor(object_index,GeldA) 
&&  canDrawScrunchHB )
{
    draw_rect_(p.C_GRN2, scrunchX1,scrunchY1, SCRUNCH_W,scrunch_h, 1,true);
}




