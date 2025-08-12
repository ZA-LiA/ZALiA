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
if (false  // change to true when reinitializing the data
&&  DEV 
&&  keyboard_check_pressed(vk_f7) )
{
    var _k;
    var _color1;
    var _ts, _ts_name, _ts_w,_ts_h, _tsrc, _tile_w,_tile_h;
    var _DK1 = STR_TSRC;
    //var _DK1 = "_XY";
    var _FILE_NAME0 = "TilesetData01.txt";
    var _surf = 0;
    var _dl_qual_tiles = ds_list_create();
    
    var         _dl_qual_ts = ds_list_create();
    ds_list_add(_dl_qual_ts, ts_Natural_1a_WRB,ts_Natural_2a_WRB,ts_Natural_4a_HMS,ts_Natural02,ts_Natural03);
    ds_list_add(_dl_qual_ts, ts_Man_made_1a_WRB,ts_Man_made_2a_WRB,ts_Man_made_3a_WRB,ts_Man_made_4a_WRB,ts_ManMade05,ts_Man_made_6a_WRB,ts_Man_made_7a_WRB,ts_Man_made_8a_HMS);
    ds_list_add(_dl_qual_ts, ts_DungeonA01,ts_DungeonB01,ts_DungeonC01,ts_DungeonD01,ts_DungeonE01,ts_DungeonF01,ts_DungeonG01,ts_DungeonH01,ts_DungeonAlt01,ts_DungeonAlt02,ts_DungeonAlt03,ts_DungeonAlt04,ts_DungeonAlt05,ts_DungeonAlt06);
    ds_list_add(_dl_qual_ts, ts_Menu01, ts_tile_marker_1a_8x8, ts_Overworld_8x8_01);
    
    var          _TS_COUNT = ds_list_size(_dl_qual_ts);
    for(_i=0; _i<_TS_COUNT; _i++) // each tileset
    {
        _ts = _dl_qual_ts[|_i];
        _ts_name = background_get_name(_ts);
        _ts_w = background_get_width( _ts);
        _ts_h = background_get_height(_ts);
        _tile_w = val(dm_tileset[?_ts_name+STR_Tile+STR_Width],  8);
        _tile_h = val(dm_tileset[?_ts_name+STR_Tile+STR_Height], 8);
        
        _surf = surface_create(_ts_w,_ts_h);
        surface_set_target(_surf);
        draw_clear_alpha(c_black,0);
        draw_background(_ts,0,0);
        
        for(_j=0; _j<_ts_h; _j++) // each row of pixels
        {
            for(_k=0; _k<_ts_w; _k++) // each clm of pixels
            {
                _color1 = draw_getpixel_ext(_k,_j);
                if ((_color1>>$18)&$FF) // if there is alpha
                {
                    _tsrc = (_j<<4) | _k;
                    ds_list_add(_dl_qual_tiles, _ts_name+_DK1+hex_str(_tsrc,4));
                    //ds_list_add(_dl_qual_tiles, _ts_name+_DK1+hex_str(_k div _tile_w)+hex_str(_j div _tile_h));
                    
                    _k = ((_k+_tile_w) div _tile_w) * _tile_w;
                    if (_k>=_ts_w)
                    {
                        _k = 0;
                        _j = ((_j+_tile_h) div _tile_h) * _tile_h;
                    }
                    //_k = (_k+_tile_w) mod _tile_w;
                }
            }
        }
        
        surface_reset_target();
        surface_free(_surf);
    }
    
    
    var _ENCODED = ds_list_write(_dl_qual_tiles);
    var _FILE = file_text_open_write(working_directory+_FILE_NAME0);
                file_text_write_string(_FILE, _ENCODED);
                file_text_close(       _FILE);
    // !!!! MOVE(NOT COPY) THE SAVED DATA FROM %localappdata% TO Included Files !!!!
    repeat(1) show_debug_message("");
    show_debug_message("g_Draw(). Tile data saved to '"+_FILE_NAME0+"'!");
    repeat(1) show_debug_message("");
    show_debug_message("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    show_debug_message("THIS IS A REMINDER TO MOVE(NOT COPY) FILE '"+_FILE_NAME0+"' FROM THE %localappdata% DIRECTORY TO ITS Included Files DIRECTORY!");
    show_debug_message("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    repeat(1) show_debug_message("");
    
    
    if (surface_exists(_surf)) surface_free(_surf);
    ds_list_destroy(_dl_qual_ts); _dl_qual_ts=undefined;
    ds_list_destroy(_dl_qual_tiles); _dl_qual_tiles=undefined;
}





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




