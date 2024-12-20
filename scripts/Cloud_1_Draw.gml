/// Cloud_1_Draw()


switch(ver)
{
    // -----------------------------------------------------------------
    case 1:{ // ------------------------------------------------
    var _DEBUG = 0 && !(g.counter1&$3F);
    var _i,_j,_k, _x,_y;
    var _COPY_COUNT  =  COPY_COUNT + 1;
    // var _COPY_COUNT  = COPY_COUNT;
    var _copy_count  = _COPY_COUNT;
    var _PAGES_Y = g.rm_pages_y;
    //if (g.view_lock_rm&$C) _PAGES_Y = 1;
    
    
    if (palidx_permut) pal_swap_set(p.palette_image, get_pi(palidx,palidx_permut));
    else               pal_swap_set(p.palette_image, palidx);
    
    for(_i=0; _i<_PAGES_Y; _i++) // each vertical map page
    {
        for(_j=0; _j<CLOUD_COUNT; _j++) // each cloud
        {
            _copy_count =_COPY_COUNT + (_i&1);
            for(_k=0; _k<_copy_count; _k++) // each copy
            {
                _x  = dg_cloud[#_j,0] + (_k*DIST1); // x left
                _y  = dg_cloud[#_j,1] + (_i<<8);
                
                _x -=  DIST1;
                // To mix it up; clouds in odd vert pages will swap odd and even horz pages
                if (_i&1) _x -= (DIST1>>1);
                
                
                if (_DEBUG) db_Cloud1_1a(_j, _x,_y);
                
                if (rectInView(_x,_y, dg_cloud[#_j,5],dg_cloud[#_j,6]))
                {
                    _x += (dg_cloud[#_j,5]>>1); // draw_x
                    _x += DRAW_XOFF;
                    
                    _y += (dg_cloud[#_j,6]>>1); // draw_y
                    _y += DRAW_YOFF;
                    draw_sprite_(dg_cloud[#_j,4],0, _x,_y);
                    continue;
                }
                
                if (_x > viewXC())
                {
                    // Skip rest of copies bc they would NOT be in view.
                    break; // _k
                }
            }
        }
    }
    pal_swap_reset();
    
    if (_DEBUG) { sdm(""); sdm(""); sdm(""); sdm(""); }
    break;}
    
    
    
    
    
    
    
    // -----------------------------------------------------------------
    case 2:{ // ------------------------------------------------
    
    var _DEBUG = 0 && !(g.counter1&$3F);
    
    var _i,_j,_k, _x,_y, _y_base;
    
    var _COPY_COUNT     =  COPY_COUNT + 1;
    var _copy_count     = _COPY_COUNT;
    
    var _CloudArea_yt   = CloudArea_YT;
    var _DIST1          = CloudArea_H + DIST3;
    var _COUNT1         = CloudArea_YB div _DIST1;
        _COUNT1++;
    //
    var _YOFF           = -(CloudArea_YT&$FF);
    
    
    // while (_CloudArea_yt + (CloudArea_H+DIST3))
    
    
    if (palidx_permut) pal_swap_set(p.palette_image, get_pi(palidx,palidx_permut));
    else               pal_swap_set(p.palette_image, palidx);
    
    for(_i=0; _i<_COUNT1; _i++) // each template set, vertical
    {
        _y_base = CloudArea_YT - (_i*_DIST1); // the top of this set
        for(_j=0; _j<CLOUD_COUNT; _j++) // each cloud template
        {
            _y  = _y_base + (dg_cloud[#_j,1]+_YOFF);
            
            _copy_count =_COPY_COUNT + (_i&1);
            for(_k=0; _k<_copy_count; _k++) // each copy, horizontal
            {
                _x  = dg_cloud[#_j,0] + (_k*DIST1); // x left
                _x -=  DIST1;
                // To mix it up; clouds in odd vert pages will swap odd and even horz pages
                if (_i&1) _x -= (DIST1>>1);
                
                
                if (_DEBUG) db_Cloud1_1a(_j, _x,_y);
                
                if (rectInView(_x,_y, dg_cloud[#_j,5],dg_cloud[#_j,6]))
                {
                    _x += (dg_cloud[#_j,5]>>1); // draw_x
                    _y += (dg_cloud[#_j,6]>>1); // draw_y
                    _y += DRAW_YOFF;
                    draw_sprite_(dg_cloud[#_j,4],0, _x,_y);
                    continue;
                }
                
                if (_x > viewXC())
                {
                    // Skip rest of copies bc they would NOT be in view.
                    break; // _k
                }
            }
        }
    }
    pal_swap_reset();
    
    if (_DEBUG) { sdm(""); sdm(""); sdm(""); sdm(""); }
    break;}
}




