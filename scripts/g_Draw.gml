/// g_Draw()


// Trying to prevent white flash on fullscreen toggle. Not sure if flash is one frame or several.
//if (fullscreen_toggled) draw_clear(c_black);


var _i,_j, _count1,_count2;


g_create_sprites();


for(_i=ds_list_size(StarSky_dl_surfaces)-1; _i>=0; _i--)
{
    if(!surface_exists(StarSky_dl_surfaces[|_i]))
    {
        var _idx, _x,_y, _color;
        _count1 = ds_grid_height(p.dg_color_seq);
        StarSky_dl_surfaces[|_i] = surface_create($100,$100);
        surface_set_target(StarSky_dl_surfaces[|_i]);
        draw_clear_alpha(c_black,0);
        for(_j=ds_grid_width(dg_StarSky_data)-1; _j>=0; _j--)
        {
            _x    = dg_StarSky_data[#_j,1];
            _y    = dg_StarSky_data[#_j,2];
            _idx  = dg_StarSky_data[#_j,0];
            _idx += _i;
            _idx  = _idx mod _count1;
            _color = p.dg_color_seq[#1,_idx];
            draw_point_colour(_x,_y,_color);
        }
        surface_reset_target();
    }
}




if(!surface_exists(global.Rain1_srf))
{
    var _k, _xl,_yt, _x0,_y0, _w,_h;
    var _ts_xl,_ts_yt;
    var _ts_XL = $0<<3;
        _ts_yt = $C<<3;
    //
    global.Rain1_srf = surface_create(global.Rain1_srf_W,global.Rain1_srf_H);
    surface_set_target(global.Rain1_srf);
    draw_clear_alpha(c_black,0);
    _count1 = global.Rain1_srf_W div global.Rain1_LOOP_SIZE; // number of $20x$20 squares, horizontally
    _count2 = global.Rain1_srf_H div global.Rain1_LOOP_SIZE; // number of $20x$20 squares, vertically
    for(_i=0; _i<_count1; _i++)
    {
        for(_j=0; _j<_count2; _j++)
        {
            _x0 = global.Rain1_LOOP_SIZE * _i;
            _y0 = global.Rain1_LOOP_SIZE * _j;
            for(_k=0; _k<4; _k++)
            {
                _ts_xl = _ts_XL;
                _xl = _x0;
                _yt = _y0;
                if (_k==$1 || _k==$2) _ts_xl += global.Rain1_TILE_SIZE;
                if (_k&$1)            _xl    += global.Rain1_TILE_SIZE;
                if (_k>$1)            _yt    += global.Rain1_TILE_SIZE;
                draw_background_part(global.Rain1_TS, _ts_xl,_ts_yt, global.Rain1_TILE_SIZE,global.Rain1_TILE_SIZE, _xl,_yt);
            }
        }
    }
    surface_reset_target();
}




if (global.Rain_is_active)
{
    pal_swap_set(global.palette_image, global.Rain_pi);
    draw_surface(global.Rain1_srf, global.Rain_xl,global.Rain_yt);
    pal_swap_reset();
}




/* This creates a file with a list of tiles that have at least 1 pixel.
Run this anytime you make a change to one of the below tilesets.
*/
//if (room==rmB_Title && keyboard_check_pressed(vk_f7)) update_non_empty_tiles_data();





/* // Starry sky data
if (keyboard_check_pressed(vk_f7))
{
    var _j,_k, _idx, _color1,_color2, _alpha, _pixel_found;
    var _SPRITE = dl_StarSky_SPR2[|0];
    sdm("var _dg_w;");
    sdm("var _dg_H = $3;");
    sdm("dg_StarSky_data = ds_grid_create(0,_dg_H);");
    sdm("");
    var _W = sprite_get_width( _SPRITE);
    var _H = sprite_get_height(_SPRITE);
    //sdm("_sprxoff $"+hex_str(sprite_get_xoffset(_SPRITE))+", _spryoff $"+hex_str(sprite_get_yoffset(_SPRITE)));
    //sdm("_W $"+hex_str(_W)+", _H $"+hex_str(_H));
    var _surf = surface_create(_W,_H);
    surface_set_target(_surf);
    draw_clear_alpha(c_black,0);
    draw_sprite(_SPRITE,0,sprite_get_xoffset(_SPRITE),sprite_get_yoffset(_SPRITE));
    for(_j=0; _j<_H; _j++)
    {
        _pixel_found = false;
        for(_k=0; _k<_W; _k++)
        {
            _color1 = draw_getpixel_ext(_k,_j);
            _alpha = (_color1>>$18)&$FF;
            if (_alpha)
            {
                _pixel_found = true;
                _color2 = draw_getpixel(_k,_j);
                switch(_color2){
                default:{     _idx=-1; sdm("WARNING, WRONG COLOR $"+hex_str(_color2)); break;}
                case $747474:{_idx=0; break;} // $747474. Grey,  2nd darkest
                case $A80000:{_idx=1; break;} // $A80000. Blue,  darkest
                case $FCBC3C:{_idx=2; break;} // $FCBC3C. Blue,  light
                case $FCFCFC:{_idx=3; break;} // $FCFCFC. White, brightest
                }
                sdm("_dg_w = ds_grid_width(dg_StarSky_data);");
                sdm("ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);");
                sdm("dg_StarSky_data[#_dg_w,0] = "+string(_idx)+";");
                sdm("dg_StarSky_data[#_dg_w,1] = $"+hex_str(_k)+";");
                sdm("dg_StarSky_data[#_dg_w,2] = $"+hex_str(_j)+";");
            }
        }
        
        if (_pixel_found) sdm("");
    }
    surface_reset_target();
    surface_free(_surf);
}
*/




//DungeonLayoutRando_testing();




