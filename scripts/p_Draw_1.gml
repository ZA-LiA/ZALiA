/// p_Draw_1()

//sdm("");sdm("p_Draw_1()");sdm("");




// Falling Scene Images ----------------------------------------------------
if(!surface_exists(val(global.FallScene_dm[?"1"+STR_Image], -1)) 
|| !surface_exists(val(global.FallScene_dm[?"2"+STR_Image], -1)) )
{
    var _i, _x,_y, _w,_h, _w1,_h1;
    var _ts_xl,_ts_yt;
    var _type_; // The type/id of this fall scene. "1": Classic blue vertical fall, "2": Fast travel red horizontal fall
    var _STRIPE_W = val(global.FallScene_dm[?"_Stripe"+STR_Width], 8);
    var _TS = ts_Natural_1a_WRB;
    var _color;
    var _dl_COLORS = ds_list_create();
    ds_list_add(_dl_COLORS, C_WHT0,C_RED0,C_BLU0);
    var _dl_COLORS_SIZE = ds_list_size(_dl_COLORS);
    var _surf = -1;
    
    
    // -----------------------------------------------------------
    // Falling Scene - Vertical Falling (blue stripes)
    _type_ = "1";
    if(!surface_exists(val(global.FallScene_dm[?_type_+STR_Image], -1)))
    {
        _w1 = val(global.FallScene_dm[?_type_+STR_Image+STR_Width]);
        _h1 = val(global.FallScene_dm[?_type_+STR_Image+STR_Height]);
        _surf = surface_create(_w1,_h1);
        surface_set_target(_surf);
        draw_clear_alpha(c_black,0);
        draw_sprite_(spr_1x1_WHT,0, 0,0, -1, _w1,_h1, global.FallScene_BACKGROUND_COLOR);
        
        _ts_xl = $D<<3;
        _ts_yt = $F<<3;
        _w  = viewW();
        _w -= _w div 3;
        _w -= $4<<3; // adjustment
        _x  = (_w1>>1) - (_w>>1);
        for(_i=(_h1 div _STRIPE_W)-1; _i>=0; _i--) // each stripe
        {
            _y = _STRIPE_W * _i;
            _color = _dl_COLORS[|_i mod _dl_COLORS_SIZE];
            draw_sprite_(spr_1x1_WHT,0, _x,_y, -1, _w,_STRIPE_W, _color); // stripe
            draw_background_part_ext(_TS, _ts_xl,_ts_yt, 8,8, _x,   _y, -1,1, _color,1); // dithered end
            draw_background_part_ext(_TS, _ts_xl,_ts_yt, 8,8, _x+_w,_y,  1,1, _color,1); // dithered end
        }
        
        global.FallScene_dm[?_type_+STR_Image] = surface_create(_w1,_h1);
        surface_copy(global.FallScene_dm[?_type_+STR_Image], 0,0, _surf);
        surface_reset_target();
        surface_free(_surf);
    }
    
    
    // -----------------------------------------------------------
    // Falling Scene - Horizontal Falling (red stripes)
    _type_ = "2";
    if(!surface_exists(val(global.FallScene_dm[?_type_+STR_Image], -1)))
    {
        _w1 = val(global.FallScene_dm[?_type_+STR_Image+STR_Width]);
        _h1 = val(global.FallScene_dm[?_type_+STR_Image+STR_Height]);
        _surf = surface_create(_w1,_h1);
        surface_set_target(_surf);
        draw_clear_alpha(c_black,0);
        draw_sprite_(spr_1x1_WHT,0, 0,0, -1, _w1,_h1, global.FallScene_BACKGROUND_COLOR);
        
        _ts_xl = $F<<3;
        _ts_yt = $C<<3;
        _h  = viewH();
        _h -= _h div 3;
        _h -= $4<<3; // adjustment
        _y  = (_h1>>1) - (_h>>1);
        for(_i=(_w1 div _STRIPE_W)-1; _i>=0; _i--) // each stripe
        {
            _x = _STRIPE_W * _i;
            _color = _dl_COLORS[|_i mod _dl_COLORS_SIZE];
            draw_sprite_(spr_1x1_WHT,0, _x,_y, -1, _STRIPE_W,_h, _color); // stripe
            draw_background_part_ext(_TS, _ts_xl,_ts_yt, 8,8, _x,_y-8,    1, 1, _color,1); // dithered end
            draw_background_part_ext(_TS, _ts_xl,_ts_yt, 8,8, _x,_y+_h+8, 1,-1, _color,1); // dithered end
        }
        
        global.FallScene_dm[?_type_+STR_Image] = surface_create(_w1,_h1);
        surface_copy(global.FallScene_dm[?_type_+STR_Image], 0,0, _surf);
        surface_reset_target();
        surface_free(_surf);
    }
    
    
    ds_list_destroy(_dl_COLORS); _dl_COLORS=undefined;
}








// Player Skins Palettes ------------------------------------------------------------------------
if(!global.App_frame_count)
{
    var _i,_j,_k, _val, _count;
    var _x,_y;
    var _datakey;
    var _palette, _sprite;
    var _surf = -1;
    
    with(global.pc)
    {
        // The palette colors for the custom pc sprites are in the 
        // top left of the $FF(bottom-right) box of the sprite sheet.
        // global.pc.PCSkins_SYS_VER==1: colors are in sub image $3F.
        // The palettes are displayed as 3 rows of 3 4x4 color squares, 
        // with each row separated by 1 pixel.
        var _c_wht = p.C_WHT0_;
        var _c_red = p.C_RED0_;
        var _c_blu = p.C_BLU0_;
        _surf = surface_create(Spritesheet_W,Spritesheet_H);
        surface_set_target(_surf);
        draw_clear_alpha(c_black,0);
        //sdm("");
                     _count = val(dm_skins[?STR_Set+STR_Count]);
        for(_i=0; _i<_count; _i++)
        {
            _datakey =   val(dm_skins[?hex_str(_i)+STR_Datakey], STR_undefined);
            _sprite  =       dm_skins[?_datakey   +STR_Sprite];
            if (is_undefined(dm_skins[?_datakey   +STR_Palette])  // setting the palette in GameObjectA_init() overrides setting it here
            &&  is_undefined(dm_skins[?hex_str(_i)+STR_Palette]) )
            {
                if (val(dm_skins[?hex_str(_i)+"_source_is_file"]))
                {
                    if (is_undefined(_sprite)) continue;//_i
                    draw_sprite_part(_sprite,0, $F*Spritesheet_W,$F*Spritesheet_H, Spritesheet_W,Spritesheet_H, 0,0);
                }
                else
                {
                    draw_sprite_(_sprite,$3F, Spritesheet_W>>1,Spritesheet_H>>1);
                }
                
                
                _palette = "";
                for(_j=0; _j<3; _j++) // each palette
                {
                    _c_wht = p.C_WHT0_;
                    _c_red = p.C_RED0_;
                    _c_blu = p.C_BLU0_;
                    
                    _y = _j*5; // each palette is 5 pixels apart
                    for(_k=0; _k<3; _k++) // each palette color
                    {
                        _x = _k*4;
                        _val = surface_getpixel(_surf, _x,_y); // get the pixel color
                        _val = color_str(_val);
                        switch(_k){
                        case  0:{_c_wht=_val; break;}
                        case  1:{_c_red=_val; break;}
                        case  2:{_c_blu=_val; break;}
                        }
                        //sdm("$"+color_str(_val));
                    }
                    
                    _palette += build_pal(_c_wht,_c_red,_c_blu,p.C_BLK1, p.C_SWDH,-2,-2,-2);
                }
                //sdm("");
                
                dm_skins[?_datakey+STR_Palette] = _palette;
                //skins_palettes_are_set = true;
            }
        }
        
        surface_reset_target();
        surface_free(_surf);
    }
}







// ------------------------------------------------------------------------
if(!global.palette_image_IS_SURFACE 
&& !global.App_frame_count )
{
    var _w1,_h1;
    var _surf = -1;
    
    _w1 = string_length(pal_rm_def) div global.PAL_CHAR_PER_PAL;
    _h1 = global.COLORS_PER_PALETTE;
    _surf = surface_create(_w1,_h1);
    surface_set_target(_surf);
    draw_clear_alpha(c_black,0);
    draw_clear(C_BLK1);
    
    global.palette_image = sprite_create_from_surface(_surf, 0,0, _w1,_h1, 0,0, 0,0);
    
    surface_reset_target();
    surface_free(_surf);
}




/*
/// p_Draw_1()

//show_debug_message("p_Draw_1()");


var _C1 = 0;


if(!global.App_frame_count)
{
    if(!fall_scene_1_spr 
    || !sprite_exists(fall_scene_1_spr) )
    {
        _C1 |= $1;
    }
    
    if(!fall_scene_2_spr 
    || !sprite_exists(fall_scene_2_spr) )
    {
        _C1 |= $2;
    }
}


// player skins palettes
//if(!global.pc.skins_palettes_are_set)
if(!global.App_frame_count)
{
    _C1 |= $4;
}


if (global.palette_image_IS_SURFACE)
{
    if(!global.palette_image 
    || !surface_exists(global.palette_image) )
    {
        _C1 |= $8;
    }
}
else if(!global.App_frame_count)
{
    if(!global.palette_image 
    || !sprite_exists(global.palette_image) )
    {
        _C1 |= $8;
    }
}




if (_C1)
{
    var _i, _x,_y;
    var _w,_h, _w1,_h1;
    var _ts_xl,_ts_yt;
    var _surf = 0;
}
else
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




if (_C1&$3)
{
    var _BACKGROUND_COLOR = C_BLK1;
    var _color;
    var _TS = ts_Natural_1a_WRB;
    var _Stripe_W = FallScene_STRIPE_W;
    var _dl_COLORS = ds_list_create();
    ds_list_add(_dl_COLORS, C_WHT0,C_RED0,C_BLU0);
    var _dl_COLORS_SIZE = ds_list_size(_dl_COLORS);
    
    
    // -----------------------------------------------------------
    // Falling Scene - Vertical Falling (blue stripes)
    if (_C1&$1)
    {
        _w1  = viewW();
        _h1  =     (viewH() div _Stripe_W) * _Stripe_W;
        _h1 += sign(viewH() mod _Stripe_W) * _Stripe_W;
        _surf = surface_create(_w1,_h1);
        surface_set_target(_surf);
        draw_sprite_(spr_1x1_WHT,0, 0,0, -1, _w1,_h1, _BACKGROUND_COLOR);
        
        _ts_xl = $D<<3;
        _ts_yt = $F<<3;
        _w  = viewW();
        _w -= _w div 3;
        _w -= $4<<3; // adjustment
        _x  = (_w1>>1) - (_w>>1);
        for(_i=(_h1 div _Stripe_W)-1; _i>=0; _i--) // each stripe
        {
            _y = _Stripe_W*_i;
            _color = _dl_COLORS[|_i mod _dl_COLORS_SIZE];
            draw_sprite_(spr_1x1_WHT,0, _x,_y, -1, _w,_Stripe_W, _color); // stripe
            draw_background_part_ext(_TS, _ts_xl,_ts_yt, 8,8, _x,   _y, -1,1, _color,1); // dithered end
            draw_background_part_ext(_TS, _ts_xl,_ts_yt, 8,8, _x+_w,_y,  1,1, _color,1); // dithered end
        }
        
        fall_scene_1_spr = sprite_create_from_surface(_surf, 0,0,_w1,_h1, 0,0, 0,0);
        surface_reset_target();
        surface_free(_surf);
    }
    
    // -----------------------------------------------------------
    // Falling Scene - Horizontal Falling (red stripes)
    if (_C1&$2)
    {
        _w1  =     (viewW() div _Stripe_W) * _Stripe_W;
        _w1 += sign(viewW() mod _Stripe_W) * _Stripe_W;
        _h1  = viewH();
        _surf = surface_create(_w1,_h1);
        surface_set_target(_surf);
        draw_sprite_(spr_1x1_WHT,0, 0,0, -1, _w1,_h1, _BACKGROUND_COLOR);
        
        _ts_xl = $F<<3;
        _ts_yt = $C<<3;
        _h  = viewH();
        _h -= _h div 3;
        _h -= $4<<3; // adjustment
        _y  = (_h1>>1) - (_h>>1);
        for(_i=(_w1 div _Stripe_W)-1; _i>=0; _i--) // each stripe
        {
            _x = _Stripe_W*_i;
            _color = _dl_COLORS[|_i mod _dl_COLORS_SIZE];
            draw_sprite_(spr_1x1_WHT,0, _x,_y, -1, _Stripe_W,_h, _color); // stripe
            draw_background_part_ext(_TS, _ts_xl,_ts_yt, 8,8, _x,_y-8,    1, 1, _color,1); // dithered end
            draw_background_part_ext(_TS, _ts_xl,_ts_yt, 8,8, _x,_y+_h+8, 1,-1, _color,1); // dithered end
        }
        
        fall_scene_2_spr = sprite_create_from_surface(_surf, 0,0,_w1,_h1, 0,0, 0,0);
        surface_reset_target();
        surface_free(_surf);
    }
    
    
    ds_list_destroy(_dl_COLORS); _dl_COLORS=undefined;
}








// ------------------------------------------------------------------------
if (_C1&$4)
{
    with(global.pc)
    {
        // PC SpriteSheet Colors
        // The palette colors for the custom pc sprites are in the 
        // top left of the $FF(bottom-right) box of the sprite sheet.
        // global.pc.PCSkins_SYS_VER==1: colors are in sub image $3F.
        // The palettes are displayed as 3 rows of 3 4x4 squares, 
        // with each row separated by 1 pixel.
        var _j,_k, _idx, _val, _count;
        var _datakey;
        var _sprite, _palette,_palette1;
        var _c_wht = p.C_WHT0_;
        var _c_red = p.C_RED0_;
        var _c_blu = p.C_BLU0_;
        _surf = surface_create(Spritesheet_W,Spritesheet_H);
        surface_set_target(_surf);
        
        //sdm("");
                     _count = val(dm_skins[?STR_Set+STR_Count]);
        for(_i=0; _i<_count; _i++)
        {
            _datakey =   val(dm_skins[?hex_str(_i)+STR_Datakey], STR_undefined);
            _sprite  =       dm_skins[?_datakey   +STR_Sprite];
            if (is_undefined(dm_skins[?_datakey   +STR_Palette])  // setting the palette in GameObjectA_init() overrides setting it here
            &&  is_undefined(dm_skins[?hex_str(_i)+STR_Palette]) )
            {
                if (val(dm_skins[?hex_str(_i)+"_source_is_file"]))
                {
                    if (is_undefined(_sprite)) continue;//_i
                    draw_sprite_part(_sprite,0, $F*Spritesheet_W,$F*Spritesheet_H, Spritesheet_W,Spritesheet_H, 0,0);
                }
                else
                {
                    draw_sprite_(_sprite,$3F, Spritesheet_W>>1,Spritesheet_H>>1);
                }
                
                
                _palette = "";
                for(_j=0; _j<3; _j++) // each palette
                {
                    _c_wht = p.C_WHT0_;
                    _c_red = p.C_RED0_;
                    _c_blu = p.C_BLU0_;
                    
                    _y=_j*5; // each palette is 5 pixels apart
                    for(_k=0; _k<3; _k++) // each palette color
                    {
                        _x=_k*4;
                        _val = surface_getpixel(_surf,_x,_y); // get the pixel color
                        _val = color_str(_val);
                        switch(_k){
                        case  0:{_c_wht=_val; break;}
                        case  1:{_c_red=_val; break;}
                        case  2:{_c_blu=_val; break;}
                        }
                        //sdm("$"+color_str(_val));
                    }
                    
                    _palette += build_pal(_c_wht,_c_red,_c_blu,p.C_BLK1, p.C_SWDH,-2,-2,-2);
                }
                //sdm("");
                
                dm_skins[?_datakey+STR_Palette] = _palette;
                //skins_palettes_are_set = true;
            }
        }
        
        surface_reset_target();
        surface_free(_surf);
    }
}







// ------------------------------------------------------------------------
if (_C1&$8)
{
    _w1 = string_length(pal_rm_def) div global.PAL_CHAR_PER_PAL;
    //_w1 = string_length(pal_rm_curr) div global.PAL_CHAR_PER_PAL;
    _h1 = global.COLORS_PER_PALETTE;
    _surf = surface_create(_w1,_h1);
    surface_set_target(_surf);
    draw_clear(p.C_BLK1);
    //draw_sprite_(spr_1x1_WHT,0, 0,0, -1, _w1,_h1, p.C_BLK1);
    //draw_sprite_(spr_1x1_WHT,0, 0,0, -1, _w1,_h1, c_black);
    
    if (global.palette_image_IS_SURFACE)
    {
        global.palette_image = surface_create(_w1,_h1);
        surface_copy(global.palette_image, 0,0, _surf);
    }
    else
    {
        global.palette_image = sprite_create_from_surface(_surf, 0,0, _w1,_h1, 0,0, 0,0);
    }
    
    surface_reset_target();
    surface_free(_surf);
    
    if (global.App_frame_count)
    {
        pal_rm_new  = pal_rm_curr;
        pal_rm_curr = "";
        palSpr_changeColors();
    }
}
*/




