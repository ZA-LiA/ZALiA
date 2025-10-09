/// CamZoom_test1()


if (global.CamZoom1_state 
&&  room_is_type("A") )
{
    var _scale = min(floor(display_get_width()/BASE_GAME_RESOLUTION_W),floor(display_get_height()/BASE_GAME_RESOLUTION_H));
    //g.WindowScale_scale, g.WindowScale_MIN, if(!window_get_fullscreen()), window_get_width(), display_get_width()
    var _MIN1 = 4;
    if (_scale<_MIN1 
    ||  g.WindowScale_scale<_MIN1 )
    {
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    
    var _W1 = BASE_GAME_RESOLUTION_W*_scale;
    var _H1 = BASE_GAME_RESOLUTION_H*_scale;
    //var _SCALE0 = 0.9;
    var _SCALE0 = VIEW_H_OG/VIEW_H_WD;
    var _SCALE1 = 1 + (1-_SCALE0);
    var _w = _W1*_SCALE1;
    var _h = _H1*_SCALE1;
    
    global.application_surface_draw_enable_state = false;
    application_surface_draw_enable(global.application_surface_draw_enable_state);
    
    if (surface_get_width(application_surface)<_W1) surface_resize(application_surface, _W1,_H1);
    
    //g.view_at_rm_edge
    //_scale = (global.pc.x-viewXL())/viewW_();
    var _xl = -((_w/2)-(_W1/2));
    _xl += ((viewXC()-global.pc.x)*_scale)*_SCALE1;
    _xl  = clamp(_xl, _W1-_w,0);
    //_xl += (viewXC()-global.pc.x)*_SCALE1;
    //_xl *= _scale;
    //_xl  = -_xl;
    //var _xl = round((_W1/2)-(_w/2));
    var _yt = round(_H1-_h);
    var _SURF1 = surface_create(_W1,_H1);
    //surface_copy(_SURF1, 0,0, application_surface);
    surface_set_target(_SURF1);
    draw_clear_alpha(c_black,0);
    draw_surface_stretched(application_surface, _xl,_yt, _w,_h);
    //draw_surface_stretched(application_surface, round((_W1/2)-(_w/2)),round((_H1/2)-(_h/2)), _w,_h);
    surface_reset_target();
    surface_copy(application_surface, 0,0, _SURF1);
    surface_free(_SURF1);
    
    
    
    
    
    /*
    var _H0 = viewH() * _SCALE0;
    //var _H0 = VIEW_H_WD * _SCALE0;
    var _H0_ = floor(_H0/2) + (frac(_H0/2)!=0);
    var _W0 = viewW() * _SCALE0;
    //var _W0 = VIEW_W_WD * _SCALE0;
    var _W0_ = floor(_W0/2) + (frac(_W0/2)!=0);
    
    
    var _x_origin = g.view_xc_og;
         if (g.view_lock_rm&$2) _x_origin = viewXL();
    else if (g.view_lock_rm&$1) _x_origin = viewXR();
    else
    {
        var _x_min = cam_xl_min();
        if (g.view_xc_og<=_x_min+_W0_ 
        &&  g.view_at_rm_edge&$2 )
        {
            _x_min = viewXL();
        }
        _x_min += _W0_;
        
        var _x_max = cam_xr_max();
        if (g.view_xc_og>=_x_max-_W0_ 
        &&  g.view_at_rm_edge&$1 )
        {
            _x_max = viewXR();
        }
        //if (g.view_at_rm_edge&$1) _x_max = viewXR();
        _x_max -= _W0_;
        _x_origin = clamp(g.view_xc_og, _x_min,_x_max);
    }
    _x_origin -= x;
    
    var _y_origin = g.view_yc_og;
         if (g.view_lock_rm&$4) _y_origin = viewYB();
    else if (g.view_lock_rm&$8) _y_origin = viewYT();
    else
    {
        var _y_min = cam_yt_min();
        if (g.view_yc_og<=_y_min+_H0_ 
        &&  g.view_at_rm_edge&$8 )
        {
            _y_min = viewYT();
        }
        _y_min += _H0_;
        
        var _y_max = cam_yb_max();
        if (g.view_yc_og>=_y_max-_H0_ 
        &&  g.view_at_rm_edge&$4 )
        {
            _y_max = viewYB();
        }
        //if (g.view_at_rm_edge&$4) _y_max = viewYB();
        _y_max -= _H0_;
        _y_origin = clamp(g.view_yc_og, _y_min,_y_max);
    }
    _y_origin -= y;
    */
    
    //if (keyboard_check_pressed(vk_f7)) sdm(", surface_get_width(application_surface) "+string(surface_get_width(application_surface))+", surface_get_height(application_surface) "+string(surface_get_height(application_surface))+", viewW() "+string(viewW())+", viewH() "+string(viewH())+", window_get_width() "+string(window_get_width())+", window_get_height() "+string(window_get_height())+", _SCALE0 "+string(_SCALE0)+", _SCALE1 "+string(_SCALE1)+", _W0 "+string_format(_W0,1,$10)+", _W0_ "+string(_W0_)+", _H0 "+string_format(_H0,1,$10)+", _H0_ "+string(_H0_)+", g.view_lock_rm $"+hex_str(g.view_lock_rm)+", g.view_at_rm_edge $"+hex_str(g.view_at_rm_edge)+", _x_origin "+string(_x_origin)+", _y_origin "+string(_y_origin));
    
    /*
    var _SPRITE = sprite_create_from_surface(application_surface, 0,0, surface_get_width(application_surface),surface_get_height(application_surface), false,false, _x_origin,_y_origin);
    draw_sprite_ext(_SPRITE,0, x+_x_origin,y+_y_origin, _SCALE1,_SCALE1, 0,c_white,1);
    sprite_delete(_SPRITE);
    */
    /*
    var _SPRITE = sprite_create_from_surface(application_surface, 0,0, surface_get_width(application_surface),surface_get_height(application_surface), false,false, _x_origin,_y_origin);
    var _SURF1 = surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
    surface_set_target(_SURF1);
    draw_clear_alpha(c_black,0);
    draw_sprite_ext(_SPRITE,0, _x_origin,_y_origin, _SCALE1,_SCALE1, 0,c_white,1);
    //draw_surface_stretched(application_surface, _xl,_yt, surface_get_width(application_surface)*_SCALE,surface_get_height(application_surface)*_SCALE);
    surface_reset_target();
    //draw_surface(_SURF1, x,y);
    surface_copy(application_surface, 0,0, _SURF1);
    surface_free(_SURF1);
    sprite_delete(_SPRITE);
    */
}




