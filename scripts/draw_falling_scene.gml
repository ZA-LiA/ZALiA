/// draw_falling_scene()


var _x,_y, _pi;


if (surface_exists(val(global.FallScene_dm[?STR_Current+STR_Image],-1)))
{
    _x  = viewXC();
    _x -= val(global.FallScene_dm[?STR_Current+STR_Image+STR_Width]) >>1;
    
    _y  = viewYC();
    _y -= val(global.FallScene_dm[?STR_Current+STR_Image+STR_Height])>>1;
    
    _pi = val(global.FallScene_dm[?STR_Current+dk_PI], global.PI_BGR1);
    pal_swap_set(global.palette_image, _pi);
    draw_surface(global.FallScene_dm[?STR_Current+STR_Image], _x,_y);
    pal_swap_reset();
}




// Draw PC and PC-Shadow ----------------------------------------------
if (val(global.FallScene_dm[?STR_PC+dk_can_draw]))
{
        global.FallScene_dm[?STR_PC+dk_can_draw] = false;
    //
    var _X_SCALE = val(global.FallScene_dm[?STR_Current+STR_ScaleX], -1);
    _x  = val(global.FallScene_dm[?STR_Current+"_x"]);
    _y  = val(global.FallScene_dm[?STR_Current+"_y"]);
    _pi = val(global.FallScene_dm[?STR_PC+dk_PI], global.PI_PC1);
    
    if (pc_is_cucco())
    {
        _y += 8;
        draw_sprite_(g.pc.CuccoFallScene_SPRITE_BODY,0, _x+4,_y-5, -1, _X_SCALE,1, p.C_BLK1); // shadow
        draw_sprite_(g.pc.CuccoFallScene_SPRITE_LEGS,0, _x+4,_y-5, -1, _X_SCALE,1, p.C_BLK1); // shadow
        draw_sprite_(g.pc.CuccoFallScene_SPRITE_WING,0, _x+4,_y-5, -1, _X_SCALE,1, p.C_BLK1); // shadow
        
        pal_swap_set(global.palette_image, _pi);
        draw_sprite_(g.pc.CuccoFallScene_SPRITE_BODY,0, _x,  _y,   -1, _X_SCALE); // 
        draw_sprite_(g.pc.CuccoFallScene_SPRITE_LEGS,0, _x,  _y,   -1, _X_SCALE); // 
        draw_sprite_(g.pc.CuccoFallScene_SPRITE_WING,0, _x,  _y,   -1, _X_SCALE); // 
        pal_swap_reset();
        
        _x += (_X_SCALE*2) - !_X_SCALE;
        _y -= 5;
        draw_sprite_(spr_1x1_WHT,0, _x,_y, -1, 1,1, g.pc.Cucco_eye_color);
        // For whatever reason, draw_point_colour() isn't drawing here or doesn't scale the point with the app's scale
        //draw_point_colour(_x,_y, g.pc.Cucco_eye_color);
    }
    else
    {
        draw_pc_skin(_x+8,_y-9, _X_SCALE,1, g.pc.behavior_DAMAGE, false, -1,-1,  -1, p.C_BLK1);
        draw_pc_skin(_x,  _y,   _X_SCALE,1, g.pc.behavior_DAMAGE, false, -1,-1, _pi);
    }
}




