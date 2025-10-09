/// preview_scene()

// Trying to set up a system to flip through previews of rooms


if (RoomPreview_VER 
&&  g.room_type=="A" 
&&  _CAN_UPDATE_FRAME )
{
    if (keyboard_check(RoomPreview_KEY1))
    {
        if (RoomPreview_rm_name != g.rm_name)
        {
            RoomPreview_rm_name  = g.rm_name;
            if (surface_exists(RoomPreview_surf))
            {   surface_free(  RoomPreview_surf);  }
        }
        
        
        RoomPreview_w = room_width;
        RoomPreview_h = room_height;
        //RoomPreview_h = $1<<8;
        //if!(g.view_lock_rm&$C) RoomPreview_h = g.rm_h;
        
        
        if(!surface_exists(RoomPreview_surf))
        {
            var _XL4 = RoomPreview_XL;
            var _YT4 = RoomPreview_YT;
            var _W4  = RoomPreview_w;
            var _H4  = RoomPreview_h;
            
            //var _XL3 = 0;
            //var _YT3 = 0;
            var _W3 = surface_get_width( application_surface);
            var _H3 = surface_get_height(application_surface);
            
            // Because surface_resize() takes an extra frame
            if (_W3==_W4 
            &&  _H3==_H4 )
            {
                RoomPreview_surf=surface_create(_W4,_H4);
                
                // backup all property values
                var _XL1 = view_xview[0];
                var _YT1 = view_yview[0];
                var _W1  = view_wview[0];
                var _H1  = view_hview[0];
                
                var _XL2 = window_get_x();
                var _YT2 = window_get_y();
                var _W2  = window_get_width();
                var _H2  = window_get_height();
                
                
                
                // set new property values
                view_xview[0]=_XL4;
                view_yview[0]=_YT4;
                view_wview[0]=_W4;
                view_hview[0]=_H4;
                //window_set_rectangle(_XL4,_YT4, _W4,_H4);
                //surface_resize(application_surface, _W4,_H4);
                //var _sprite = sprite_create_from_surface(application_surface, _XL4,_YT4, _W4,_H4, false,false, 0,0);
                
                
                // make a copy
                surface_copy(RoomPreview_surf,_XL4,_YT4, application_surface);
                
                
                // reset everything
                //set_view_xy_on_pc();
                //view_xview[0]=_XL1;
                //view_yview[0]=_YT1;
                //view_wview[0]=_W1;
                //view_hview[0]=_H1;
                //view_wview[0]=VIEW_W_WD;
                //view_hview[0]=VIEW_H_WD;
                var _X = clamp(global.pc.x-VIEW_W_WD_,cam_xl_min(),cam_xl_max());
                var _Y = clamp(global.pc.y-VIEW_H_WD_,cam_yt_min(),cam_yt_max());
                //window_set_rectangle(_X,_Y, VIEW_W_WD,VIEW_H_WD);
                //set_view_xy_on_pc();
                //window_set_rectangle(_XL2,_YT2, _W2,_H2);
                //surface_resize(application_surface, ww,hh);
            }
            else
            {
                //view_xview[0]=_XL4;
                //view_yview[0]=_YT4;
                //view_wview[0]=_W4;
                //view_hview[0]=_H4;
                //window_set_rectangle(_XL4,_YT4, _W4,_H4);
                surface_resize(application_surface, _W4,_H4);
            }
        }
        
        
        if (surface_exists(RoomPreview_surf))
        {
            var _SHIFT=3;
            var _W=surface_get_width( RoomPreview_surf)>>_SHIFT;
            var _H=surface_get_height(RoomPreview_surf)>>_SHIFT;
            draw_surface_stretched(   RoomPreview_surf,viewXL()+$18,$18, _W,_H);
        }
    }
    else
    {
        if (keyboard_check_released(RoomPreview_KEY1))
        {
            var _X = clamp(global.pc.x-VIEW_W_WD_,0,room_width -VIEW_W_WD);
            var _Y = clamp(global.pc.y-VIEW_H_WD_,0,room_height-VIEW_H_WD-8);
            //var _X = clamp(global.pc.x-VIEW_W_WD_,cam_xl_min(),cam_xl_max());
            //var _Y = clamp(global.pc.y-VIEW_H_WD_,cam_yt_min(),cam_yt_max());
            view_xview[0]=_X;
            view_yview[0]=_Y;
            view_wview[0]=VIEW_W_WD;
            view_hview[0]=VIEW_H_WD;
            
            set_view_xy_on_pc();
            
            if (surface_get_width( application_surface) != ww 
            ||  surface_get_height(application_surface) != hh )
            {
                surface_resize(    application_surface, ww,hh);
            }
        }
    }
}




