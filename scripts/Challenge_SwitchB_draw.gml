/// Challenge_SwitchB_draw()


switch(ver)
{
    case 4:{
    var _COUNT0 = val(Water_dm[?STR_Waterfall+STR_Count]);
    if (_COUNT0)
    {
        var _i, _datakey0;
        var _can_draw = false;
        for(_i=0; _i<_COUNT0; _i++) // each waterfall
        {
            _datakey0 = STR_Waterfall+hex_str(_i+1);
            if (val(Water_dm[?_datakey0+STR_Active]))
            {
                _can_draw = true;
                break;//_i
            }
        }
        
        
        if (_can_draw)
        {
            var _j, _x,_y, _xl0,_yt0, _xl1,_yt1, _xl2,_yt2, _xoff, _w,_h, _clms,_rows, _count;
            var _H1 = $C;
            //var _XOFF0 = g.counter1&$7;
            var _XOFF0 = $3 * sign(g.counter1&$4);
            //var _XOFF0 = $2 * sign(g.counter1&$4);
            var _YOFF0 = $3;
            var _YOFF1 = $8 - ((g.counter1>>0)&$7);
            var _YOFF2 = $2;
            //var _YOFF2 = $4;
            var _x_scale,_y_scale;
            var _surf_w,_surf_h;
            var _tile_id;
            var _DEPTH = val(Water_dm[?STR_Depth]);
            
            
            if(!surface_exists(Water_surf1))
            {
                var _tsrc;
                _surf_w = $2<<3;
                _surf_h = $1<<3;
                Water_surf1 = surface_create(_surf_w,_surf_h);
                surface_set_target(Water_surf1);
                draw_clear_alpha(c_black,0);
                for(_i=0; _i<_surf_w>>3; _i++)
                {
                    for(_j=0; _j<_surf_h>>3; _j++)
                    {
                        //if (_i&$1) _tsrc = Water_TSRC1+$2;
                        //else       _tsrc = Water_TSRC1;
                        //_tsrc = Water_TSRC1;
                        _tsrc = Water_TSRC1+$2;
                        draw_background_part(ts_Natural_1a_WRB, ((_tsrc>>0)&$F)<<3, ((_tsrc>>4)&$F)<<3, 8,8, _i<<3,_j<<3);
                    }
                }
                surface_reset_target();
            }
            
            for(_i=0; _i<_COUNT0; _i++) // each waterfall
            {
                _datakey0 = STR_Waterfall+hex_str(_i+1);
                if (val(Water_dm[?_datakey0+STR_Active]))
                {
                    if (is_undefined(  Water_dm[?_datakey0+STR_Surface]) 
                    || !surface_exists(Water_dm[?_datakey0+STR_Surface]) )
                    {
                        _xl0  = val(Water_dm[?_datakey0+"_XL"]);
                        _yt0  = val(Water_dm[?_datakey0+"_YT"]);
                        _clms = val(Water_dm[?_datakey0+STR_Clms]);
                        _rows = val(Water_dm[?_datakey0+STR_Rows]);
                        if (_clms>0 
                        &&  _rows>0 )
                        {
                            _surf_w =  _clms   <<3;
                            _surf_h = (_rows+1)<<3;
                            Water_dm[?_datakey0+STR_Surface] = surface_create(_surf_w,_surf_h);
                            surface_set_target(Water_dm[?_datakey0+STR_Surface]);
                            draw_clear_alpha(c_black,0);
                            for(_i=0; _i<_surf_w>>3; _i++)
                            {
                                for(_j=0; _j<_surf_h>>3; _j++)
                                {
                                    _x_scale = choose(1,-1);
                                    _y_scale = choose(1,-1);
                                    _x = (_i<<3) + ((!_x_scale)<<3);
                                    _y = (_j<<3) + ((!_y_scale)<<3);
                                    draw_background_part_ext(ts_Natural_1a_WRB, ((Water_TSRC2>>0)&$F)<<3, ((Water_TSRC2>>4)&$F)<<3, 8,8, _x,_y, _x_scale,_y_scale, c_white,1);
                                }
                            }
                            surface_reset_target();
                        }
                    }
                }
            }
            
            
            pal_swap_set(global.palette_image, palidx);
            for(_i=0; _i<_COUNT0; _i++) // each waterfall
            {
                _datakey0 = STR_Waterfall+hex_str(_i+1);
                if (val(Water_dm[?_datakey0+STR_Active]) 
                && !is_undefined(  Water_dm[?_datakey0+STR_Surface]) 
                &&  surface_exists(Water_dm[?_datakey0+STR_Surface]) )
                {
                    _xl0 = val(Water_dm[?_datakey0+"_XL"]);
                    _yt0 = val(Water_dm[?_datakey0+"_YT"]);
                    _xl1 = val(Water_dm[?_datakey0+STR_Current+"_XL"]);
                    _yt1 = val(Water_dm[?_datakey0+STR_Current+"_YT"]);
                    _w   = val(Water_dm[?_datakey0+STR_Current+STR_Width]);
                    _h   = val(Water_dm[?_datakey0+STR_Current+STR_Height]);
                    _surf_w = surface_get_width( Water_dm[?_datakey0+STR_Surface]);
                    _surf_h = surface_get_height(Water_dm[?_datakey0+STR_Surface]);
                    
                    _yt0 += _YOFF0;
                    _yt1 += _YOFF0;
                    if (true)
                    //if (_w>=$4 
                    //&&  _yt1<=_yt0+$8 )
                    {
                        ///*
                        _xoff = _XOFF0 + ((_xl1-_xl0)&$7);
                        _count = (_w>>3) + sign(_w&$7);
                        for(_j=0; _j<_count; _j++)
                        {
                            _x = _xl1 + (_j<<3);
                            draw_surface_part(Water_surf1, _xoff,0, min((_xl1+_w)-_x,8), 8-(_YOFF2-1), _x,_yt1);
                            //draw_surface_part(Water_surf1, _XOFF0,0, min((_xl1+_w)-_x,8), 8-(_YOFF2-1), _x,_yt1);
                        }
                        //*/
                        /*
                        for(_j=0; _j<_surf_w>>3; _j++)
                        {
                            _x = _xl0 + (_j<<3);
                            if (_xl1-_x)
                            {
                                _xoff = _XOFF0 + (_xl1&$7);
                                //_xoff = _XOFF0 + ((_xl1-_x)&$7);
                                _x   += _xl1&$7;
                                draw_surface_part(Water_surf1, _xoff,0, min(_w,8),8-(_YOFF2-1), _x,_yt1);
                            }
                        }
                        */
                    }
                    
                    draw_surface_part(Water_dm[?_datakey0+STR_Surface], (_surf_w-_w)>>1,_YOFF1, _w,_h, _xl1,_yt1+_YOFF2);
                    //draw_surface_part(Water_dm[?_datakey0+STR_Surface], 0,_YOFF1, _surf_w,_surf_h-_YOFF1, _xl1,_yt1+_YOFF2);
                }
            }
            pal_swap_reset();
        }
    }
    break;}//case 4
}//switch(ver)
/*
switch(ver)
{
    case 4:{
    var _COUNT0 = val(STR_Waterfall+STR_Count);
    if (_COUNT0)
    {
        var _i,_j, _x,_y, _xl,_yt, _clms, _datakey0;
        var _tile_id;
        var _H1 = $C;
        var _DEPTH = val(Water_dm[?STR_Depth]);
        //var _YOFF = $4;
        
        if(!surface_exists(Water_surf1))
        {
            var _x_scale,_y_scale;
            Water_surf1 = surface_create(Water_surf1_W,Water_surf1_H);
            surface_set_target(Water_surf1);
            draw_clear_alpha(c_black,0);
            for(_i=0; _i<Water_surf1_W>>3; _i++)
            {
                for(_j=0; _j<Water_surf1_H>>3; _j++)
                {
                    _x_scale = choose(1,-1);
                    _y_scale = choose(1,-1);
                    _x = (_i<<3) + ((!_x_scale)<<3);
                    _y = (_j<<3) + ((!_y_scale)<<3);
                    draw_background_part_ext(ts_Natural_1a_WRB, ((Water_TSRC2>>0)&$F)<<3, ((Water_TSRC2>>4)&$F)<<3, 8,8, _x,_y, _x_scale,_y_scale, c_white,1);
                }
            }
            surface_reset_target();
        }
        
        pal_swap_set(global.palette_image, palidx);
        for(_i=0; _i<_COUNT0; _i++) // each waterfall
        {
            _datakey0 = STR_Waterfall+hex_str(_i+1);
            _xl   = val(Water_dm[?_datakey0+"_XL"]);
            _yt   = val(Water_dm[?_datakey0+"_YT"]);
            _clms = val(Water_dm[?_datakey0+STR_Clms]);
            for(_j=0; _j<_clms; _j++)
            {
                _x = _xl+(_j<<3);
                _y = _yt;
                //_x = _xl+(_i<<3);
                //_y = _yt+(_j<<3);
                draw_surface_part(Water_surf1, 0,Water_surf1_H-_H1-(g.counter1&$7), Water_surf1_W,_H1, _x,_y+$4);
                
                _tile_id = tile_layer_find(_DEPTH,_x,_y);
                if (_tile_id!=-1) tile_delete_(_tile_id);
                draw_background_part(ts_Natural_1a_WRB, ((Water_TSRC1>>0)&$F)<<3, ((Water_TSRC1>>4)&$F)<<3, 8,8, _x,_y);
            }
        }
        pal_swap_reset();
    }
    break;}//case 4
}//switch(ver)
*/




