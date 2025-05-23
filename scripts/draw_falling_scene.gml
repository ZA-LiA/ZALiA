/// draw_falling_scene()


var _x,_y, _pi;
var _FALL_DIR   = val(global.FallScene_dm[?STR_Current+STR_Fall+STR_Direction]); // $1: RIGHT, $2: LEFT, $4: DOWN, $8: UP
var _FALL_SPEED = val(global.FallScene_dm[?STR_Current+STR_Fall+STR_Speed], sign_(_FALL_DIR&($1|$4)));
var _FALL_X     = val(global.FallScene_dm[?STR_Current+"_x"]);
var _FALL_Y     = val(global.FallScene_dm[?STR_Current+"_y"]);


if (surface_exists(val(global.FallScene_dm[?STR_Current+STR_Image],-1)))
{
    var _W = val(global.FallScene_dm[?STR_Current+STR_Image+STR_Width]);
    var _H = val(global.FallScene_dm[?STR_Current+STR_Image+STR_Height]);
    _x = viewXC() - (_W>>1);
    _y = viewYC() - (_H>>1);
    _pi = val(global.FallScene_dm[?STR_Current+dk_PI], global.PI_BGR1);
    pal_swap_set(global.palette_image, _pi);
    draw_surface(global.FallScene_dm[?STR_Current+STR_Image], _x,_y);
    pal_swap_reset();
}




// Draw PC and PC-Shadow ----------------------------------------------
if ((_FALL_DIR&$4 && _FALL_Y>viewYT()+val(global.FallScene_dm[?STR_Base+"_Y"]))   // most likely
||  (_FALL_DIR&$1 && _FALL_X>viewXL()+val(global.FallScene_dm[?STR_Base+"_X"])) 
||  (_FALL_DIR&$2 && _FALL_X<viewXR()-val(global.FallScene_dm[?STR_Base+"_X"])) 
||  (_FALL_DIR&$8 && _FALL_Y<viewYB()-val(global.FallScene_dm[?STR_Base+"_Y"])) ) // least likely
{
    var _x_scale;
    _pi = global.PI_PC1;
    _x = _FALL_X;
    _y = _FALL_Y;
    
    if (_FALL_DIR&($4|$8)) // if vertical fall. $4: DOWN, $8: UP
    {
        if (g.room_type=="A") _x_scale = g.pc.xScale;
        else                  _x_scale = 1;
    }
    else if (_FALL_DIR&($1|$2)) // if horizontal fall. $1: RIGHT, $2: LEFT
    {
        _x_scale = -sign_(_FALL_SPEED);
    }
    
    
    if (pc_is_cucco())
    {
        _y += 8;
        draw_sprite_(g.pc.CuccoFallScene_SPRITE_BODY,0, _x+4,_y-5, -1, _x_scale,1, p.C_BLK1); // shadow
        draw_sprite_(g.pc.CuccoFallScene_SPRITE_LEGS,0, _x+4,_y-5, -1, _x_scale,1, p.C_BLK1); // shadow
        draw_sprite_(g.pc.CuccoFallScene_SPRITE_WING,0, _x+4,_y-5, -1, _x_scale,1, p.C_BLK1); // shadow
        
        switch(sign(g.spells_active&SPL_PRTC)+sign(f.items&ITM_RING)){
        default:{_pi=global.PI_CUCCO1; break;}
        case  1:{_pi=global.PI_CUCCO2; break;}
        case  2:{_pi=global.PI_CUCCO3; break;}
        }
        pal_swap_set(global.palette_image, _pi);
        draw_sprite_(g.pc.CuccoFallScene_SPRITE_BODY,0, _x,  _y,   -1, _x_scale); // 
        draw_sprite_(g.pc.CuccoFallScene_SPRITE_LEGS,0, _x,  _y,   -1, _x_scale); // 
        draw_sprite_(g.pc.CuccoFallScene_SPRITE_WING,0, _x,  _y,   -1, _x_scale); // 
        pal_swap_reset();
        
        _x += (_x_scale*2) - !_x_scale;
        _y -= 5;
        draw_sprite_(spr_1x1_WHT,0, _x,_y, -1, 1,1, g.pc.Cucco_eye_color);
        // For whatever reason, draw_point_colour() isn't drawing here or doesn't scale the point with the app's scale
        //draw_point_colour(_x,_y, g.pc.Cucco_eye_color);
    }
    else
    {
        switch(sign(g.spells_active&SPL_PRTC)+sign(f.items&ITM_RING)){
        default:{_pi=global.PI_PC1; break;}
        case  1:{_pi=global.PI_PC2; break;}
        case  2:{_pi=global.PI_PC3; break;}
        }
        draw_pc_skin(_x+8,_y-9, _x_scale,1, g.pc.behavior_DAMAGE, false, -1,-1,  -1, p.C_BLK1);
        draw_pc_skin(_x,  _y,   _x_scale,1, g.pc.behavior_DAMAGE, false, -1,-1, _pi);
    }
}

if (_FALL_DIR&($1|$2)) global.FallScene_dm[?STR_Current+"_x"] = val(global.FallScene_dm[?STR_Current+"_x"]) + _FALL_SPEED;
if (_FALL_DIR&($4|$8)) global.FallScene_dm[?STR_Current+"_y"] = val(global.FallScene_dm[?STR_Current+"_y"]) + _FALL_SPEED;




