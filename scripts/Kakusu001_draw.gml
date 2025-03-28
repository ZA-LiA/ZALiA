/// Kakusu001_draw()


if (sub_state==SUB_STATE_CHLG_1A 
||  sub_state==SUB_STATE_CHLG_1B )
{
    var _i;
    var _idx = 0;
    
    var    _FIRST = ds_grid_width(dg_platform)-Platform_COUNT;
    for(_i=_FIRST; _i<Platform_COUNT+_FIRST; _i++)
    {
        _idx = _i;
        if(!dg_platform[#_i,0]) break;
    }
    
    var _x = dg_platform[#_idx,1]<<3;
    var _y = dg_platform[#_idx,2]<<3;
    if(!rectInView(_x,_y, $10,$10)) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    
    // Creates the surfaces/sprites if they don't exist.
    Kakusu001_draw_1(_idx);
    
    
    
    depth = PLATFORM_DEPTH;
    
    // Cover any bg graphic behind pillar head so you can't see any bg graphic behind it.
    draw_sprite_(spr_1x1_WHT,0, _x,_y, -1, $10,$10, p.dl_COLOR[|p.background_color_index]);
    
    
    var  _pi  = PLATFORM_PI;
    if (rm_pal_qual_lit())
    {    _pi += p.PI_LIT1;  }
    else _pi += p.PI_DRK1;
         _pi  = get_pi(_pi);
    if (USE_SURF)
    {
        pal_swap_set(p.palette_image, _pi);
        draw_surface(dg_platform[#_idx,SURF_IDX], _x,_y);
        pal_swap_reset();
    }
    else
    {
        draw_sprite_(dg_platform[#_idx,SPR_IDX],0, _x,_y, _pi);
    }
    
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



depth = depth_def;
Kakusu_draw();




