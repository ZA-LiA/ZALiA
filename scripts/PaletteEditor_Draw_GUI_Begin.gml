/// PaletteEditor_Draw_GUI_Begin()


/*
// Color Info
if (state==state_EDIT1A 
||  state==state_EDIT1B 
||  state==state_BGR_COLOR )
{
    var _xl,_yt, _yt1;
    var _w1;
    var _TEXT_OLD_COLOR = "OLD COLOR ";
    var _TEXT_NEW_COLOR = "NEW COLOR ";
    var _TEXT_SPACING   = "  ";
    var _text = "";
    var _PAD1 = 0;
    var _PAD2 = 3;
    //var _PAD1 = Text_W;
    var _H1 = Font1_H + (_PAD2<<1);
    var _W2 = PalEdit_SCALE;
    var _H2 = PalEdit_SCALE;
    var _DIST1 = Font1_H * 2; // distance between text lines
    
    var _XL0  = max(0,PalEdit_xl-viewXL());
        _XL0 += _PAD2;
    var _YT0  = max(PalEdit_yt+PalEdit_PALS_H, ColorGrid_yt+ColorGrid_H);
        _YT0  = max(0,_YT0-viewYT());
        _YT0 += $4; // pad
        //_YT0 += $8 + _PAD2; // pad
    //
    _yt1 = _YT0;
    
    
    if (state==state_EDIT1A 
    ||  state==state_EDIT1B )
    {
        _text = val(PalEdit_dm[?STR_Palette+hex_str(PalEdit_Cursor_clm+1)+STR_Name], "?");
        _w1 = (string_length(_text)*Font1_W) + (_PAD2<<1);
        draw_sprite_(spr_1x1_WHT,0, _XL0-_PAD2, _yt1-_PAD2, -1, _w1,_H1, c_black, gui_Background_ALPHA); // dark bgr for info
        draw_text_(_XL0,_yt1, _text, Font1_sprite);
    }
    
    
    _text = _TEXT_OLD_COLOR+_TEXT_SPACING+color_str(color_old);
    _w1 = (string_length(_text)*Font1_W) + (_PAD2<<1);
    
    _xl  = _XL0;
    _xl += string_length(_TEXT_OLD_COLOR) * Font1_W;
    _xl += _PAD1;
    
    _yt1 += _DIST1;
    _yt  = _yt1 + (Font1_H>>1);
    _yt -= _H2>>1;
    draw_sprite_(spr_1x1_WHT,0, _XL0-_PAD2, _yt1-_PAD2, -1, _w1,_H1, c_black, gui_Background_ALPHA); // dark bgr for info
    draw_surface(ColorOutline1_surf, _xl-PalEdit_Outline_W, _yt-PalEdit_Outline_W); // color square outline
    draw_sprite_(spr_1x1_WHT,0, _xl,_yt, -1, _W2,_H2, color_old);                   // color square
    draw_text_(_XL0,_yt1, _text, Font1_sprite);
    
    if (state==state_EDIT1B 
    ||  state==state_BGR_COLOR )
    {
        _text = _TEXT_NEW_COLOR+_TEXT_SPACING+color_str(color_new);
        _w1 = (string_length(_text)*Font1_W) + (_PAD2<<1);
        
        _xl  = _XL0;
        _xl += string_length(_TEXT_NEW_COLOR) * Font1_W;
        _xl += _PAD1;
        
        _yt1 += _DIST1;
        _yt   = _yt1 + (Font1_H>>1);
        _yt  -= _H2>>1;
        draw_sprite_(spr_1x1_WHT,0, _XL0-_PAD2, _yt1-_PAD2, -1, _w1,_H1, c_black, gui_Background_ALPHA); // dark bgr for info
        draw_surface(ColorOutline1_surf, _xl-PalEdit_Outline_W, _yt-PalEdit_Outline_W); // color square outline
        draw_sprite_(spr_1x1_WHT,0, _xl,_yt, -1, _W2,_H2, color_new);                   // color square
        draw_text_(_XL0,_yt1, _text, Font1_sprite);
    }
    
    
    
    
    if (Info1_can_draw)
    {
        var _i,_j, _x,_y, _sprite;
        draw_sprite_(spr_1x1_WHT,0, Info1Area_xl,Info1Area_yt, -1, Info1Area_W,Info1Area_h, Info1Background_COLOR,Info1Background_ALPHA); // dark bgr for info
        for(_i=ds_grid_width(Info1_dg)-1; _i>=0; _i--)
        {
            if (Info1_dg[#_i,$4]) // $4: can draw
            {
                _text = Info1_dg[#_i,$0];
                _xl   = Info1_dg[#_i,$1];
                _yt   = Info1_dg[#_i,$2];
                _yt  -= viewYT();
                draw_text_(_xl,_yt, _text, Info1_FONT);
                
                for(_j=$5; _j<Info1_dg_H; _j++) // $5: first index of button sprite data
                {
                    _sprite = Info1_dg[#_i,_j++];
                    if(!_sprite) break;//_j
                    
                    _x = _xl + Info1_dg[#_i,_j++];
                    _y = _yt + Info1_dg[#_i,_j];
                    draw_sprite_(_sprite,0, _x,_y);
                }
            }
        }
    }
}
*/




