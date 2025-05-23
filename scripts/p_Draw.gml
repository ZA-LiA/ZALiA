/// p_Draw()


p_Draw_1();




// Change the Room's Palette Colors
// -----------------------------------------------------------------------
palSpr_changeColors();




// -----------------------------------------------------------------------
/* // Keep this code to automate populating `global.dl_COLOR01` in case you change the colors later.
if (keyboard_check_pressed(vk_f7))
{
    var _i,_j, _color, _output, _str;
    var _STR1 = "//                                                                      //";
    var _TS_W = background_get_width( ts_SolidColors01_8x8);
    var _TS_H = background_get_height(ts_SolidColors01_8x8);
    var _CLMS = _TS_W>>3;
    var _ROWS = _TS_H>>3;
    var _ColorGrid_clms = 0;
    var _ColorGrid_rows = 0;
    _surf = surface_create(_TS_W,_TS_H);
    surface_set_target(_surf);
    draw_clear_alpha(c_black,0);
    draw_background(ts_SolidColors01_8x8,0,0);
    sdm("");
    for(_i=0; _i<_ROWS; _i++)
    {
        _str = "ROW $"+hex_str(_i);
        sdm(strReplaceAt(_STR1, 4, string_length(_str), _str));
        for(_j=0; _j<_CLMS; _j++)
        {
            _color = draw_getpixel_ext(_j<<3,_i<<3);
            if!((_color>>$18)&$FF) continue;//_j. if not full alpha
            //if ((_color>>$18)&$FF<$FF) continue;//_j. if not full alpha
            _color &= $FFFFFF; // don't need the 4th byte which is the alpha value ($FF000000)
            if (isVal(_color,C_WHT0,C_RED0,C_BLU0,C_GRN0,C_YLW0,C_MGN0,C_BLK0,C_CYN0)) break;//_j. not in color grid anymore
            if (_j+1>_ColorGrid_clms) _ColorGrid_clms = _j+1;
            if (_i+1>_ColorGrid_rows) _ColorGrid_rows = _i+1;
            _output  = "ds_list_add(global.dl_COLOR01,$"+color_str(_color)+");";
            _output += " // Hue-$";
            _output += hex_str(colour_get_hue(_color));
            _output += ",  Sat-$"+hex_str(colour_get_saturation(_color));
            _output += ",  Bright-$"+hex_str(get_color_brightness(_color));
            sdm(_output);
        }
    }
    sdm(_STR1);
    sdm("ColorGrid_CLMS = $"+hex_str(_ColorGrid_clms)+";");
    sdm("ColorGrid_ROWS = $"+hex_str(_ColorGrid_rows)+";");
    sdm("");
    surface_reset_target();
    surface_free(_surf);
}
*/




