/// PaletteEditor_Draw()


// ---------------------------------------------------------------------
if (PalView_enabled)
{
    PaletteEditor_draw_PalView();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
// ---------------------------------------------------------------------




if (state!=state_EDIT1A 
&&  state!=state_EDIT1B 
&&  state!=state_BGR_COLOR )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




var _i,_j, _idx, _count, _color;
var _xl,_yt, _w,_w1, _h;


// ---------------------------------------------------------------------
// ---------------------------------------------------------------------
// Editor Palette ------------------------------------------------
if (ColorOutline1_Outline_W 
&& !surface_exists(ColorOutline1_surf) )
{
    _w1 = ColorOutline1_Outline_W;
    ColorOutline1_surf = surface_create(ColorOutline1_W,ColorOutline1_H);
    surface_set_target(ColorOutline1_surf);
    draw_clear_alpha(c_black,0);
    if (_w1>1) draw_rect_(ColorOutline1_COLOR2,        0,       0, ColorOutline1_W,     ColorOutline1_H,     1,true);
    if (_w1>0) draw_rect_(ColorOutline1_COLOR1, (_w1>>1),(_w1>>1), ColorOutline1_W-_w1, ColorOutline1_H-_w1, 1,true);
    surface_reset_target();
}




if (state==state_EDIT1A 
||  state==state_EDIT1B )
{
    var _dk1,_dk2;
    
    // Outline palette
    if (PalEdit_Outline_W)
    {
        if(!surface_exists(PalEdit_Outline_surf))
        {
            _w1 = PalEdit_Outline_W;
            _w  = PalEdit_PALS_W + (_w1<<1);
            _h  = PalEdit_PALS_H + (_w1<<1);
            _yt = 0;
            PalEdit_Outline_surf = surface_create(_w,_h);
            surface_set_target(PalEdit_Outline_surf);
            draw_clear_alpha(c_black,0);
            for(_i=0; _i<PalEdit_group_count; _i++)
            {
                _xl = val(PalEdit_dm[?STR_Group+hex_str(_i+1)+"_XL"]);
                _w  = val(PalEdit_dm[?STR_Group+hex_str(_i+1)+STR_Width]); // width of the color group
                _w += _w1<<1;
                //_h  = _w;
                if (_w1>1) draw_sprite_(spr_1x1_WHT,0, _xl,          _yt,          -1, _w,    _h,     c_white);
                if (_w1>0) draw_sprite_(spr_1x1_WHT,0, _xl+(_w1>>1), _yt+(_w1>>1), -1, _w-_w1,_h-_w1, c_black);
            }
            surface_reset_target();
        }
        
        draw_surface(PalEdit_Outline_surf, PalEdit_xl,PalEdit_yt);
    }
    
    
    // Draw palette colors
    var _ColorOutline1_xl = 0;
    var _ColorOutline1_yt = 0;
    
    for(_i=0; _i<PalEdit_PAL_COUNT; _i++)
    {
        _dk1 = STR_Palette+hex_str(_i+1);
        
        _xl  = PalEdit_xl;
        _xl += PalEdit_Outline_W;
        _xl += val(PalEdit_dm[?_dk1+"_XL"]);
        for(_j=0; _j<global.COLORS_PER_PALETTE; _j++)
        {
            _dk2 = _dk1+STR_Color+hex_str(_j+1);
            
            _yt  = PalEdit_yt;
            _yt += PalEdit_Outline_W;
            _yt += PalEdit_SCALE * _j;
            
            _w = PalEdit_SCALE;
            _h = _w;
            
            // outline
            if (val(PalEdit_dm[?_dk2+"_Editing"]))
            {
                _ColorOutline1_xl = _xl - ColorOutline1_Outline_W;
                _ColorOutline1_yt = _yt - ColorOutline1_Outline_W;
            }
            
            // color square
            _color = p.C_GRN0;
            if (val(PalEdit_dm[?_dk2+"_UseTinted"])) _color = val(PalEdit_dm[?_dk2+"_Tinted"], _color);
            else                                     _color = val(PalEdit_dm[?_dk2], _color);
            draw_sprite_(spr_1x1_WHT,0, _xl,_yt, -1, _w,_h, _color);
        }
    }
    
    
    // Draw this outline here otherwise color squares will partially cover it
    if (_ColorOutline1_xl) draw_surface(ColorOutline1_surf, _ColorOutline1_xl,_ColorOutline1_yt);
}




// Color grid ---------------------------------------------------------
if (state==state_EDIT1B 
||  state==state_BGR_COLOR )
{
    if(!surface_exists(ColorGrid_surf))
    {
        _w1 = ColorGrid_Outline_W;
        ColorGrid_surf = surface_create(ColorGrid_W,ColorGrid_H);
        surface_set_target(ColorGrid_surf);
        draw_clear_alpha(c_black,0);
        if (_w1>1) draw_sprite_(spr_1x1_WHT,0,        0,       0, -1, ColorGrid_W,    ColorGrid_H,     c_white); // outline
        if (_w1>0) draw_sprite_(spr_1x1_WHT,0, (_w1>>1),(_w1>>1), -1, ColorGrid_W-_w1,ColorGrid_H-_w1, c_black); // outline
        _w = ColorGrid_SCALE;
        _h = _w;
        for(_i=0; _i<ColorGrid_ROWS; _i++)
        {
            for(_j=0; _j<ColorGrid_CLMS; _j++)
            {
                _xl = (_w*_j) + _w1;
                _yt = (_h*_i) + _w1;
                _idx = (ColorGrid_CLMS*_i) + _j;
                _color = ColorGrid_dl_colors[|_idx];
                draw_sprite_(spr_1x1_WHT,0, _xl,_yt, -1, _w,_h, _color); // color square
            }
        }
        surface_reset_target();
    }
    
    draw_surface(ColorGrid_surf, ColorGrid_xl,ColorGrid_yt);
}




// Cursor -------------------------------------------------------------
if (Cursor_can_draw)
{
    Cursor_can_draw = false;
    PaletteEditor_draw_cursor(Cursor_xl,Cursor_yt);
}



///*
// INFO: OLD COLOR, NEW COLOR -----------------------------------------
if (state==state_EDIT1A 
||  state==state_EDIT1B 
||  state==state_BGR_COLOR )
{
    var _TEXT_OLD_COLOR = "OLD COLOR ";
    var _TEXT_NEW_COLOR = "NEW COLOR ";
    var _TEXT_SPACING   = "  ";
    var _text = "";
    var _PAD1 = 3;
    var _H1 = Font1_H + (_PAD1<<1);
    var _W2 = PalEdit_SCALE;
    var _H2 = PalEdit_SCALE;
    var _DIST1 = Font1_H * 2; // distance between text lines
    
    var _XL0  = PalEdit_xl;
        _XL0 += _PAD1;
    var _YT0  = max(PalEdit_yt+PalEdit_PALS_H, ColorGrid_yt+ColorGrid_H);
        _YT0 += $4; // pad
        //_YT0 += $8 + _PAD1; // pad
    var _yt1  = _YT0;
    
    
    if (state==state_EDIT1A 
    ||  state==state_EDIT1B )
    {   // Palette Index Name
        _text = val(PalEdit_dm[?STR_Palette+hex_str(PalEdit_Cursor_clm+1)+STR_Name], "?");
        _w1 = (string_length(_text)*Font1_W) + (_PAD1<<1);
        draw_sprite_(spr_1x1_WHT,0, _XL0-_PAD1, _yt1-_PAD1, -1, _w1,_H1, c_black, gui_Background_ALPHA); // dark bgr for info
        draw_text_(_XL0,_yt1, _text, Font1_sprite);
    }
    
    
    // OLD COLOR
    _text = _TEXT_OLD_COLOR+_TEXT_SPACING+color_str(color_old);
    _w1 = (string_length(_text)*Font1_W) + (_PAD1<<1);
    
    _xl  = _XL0;
    _xl += string_length(_TEXT_OLD_COLOR) * Font1_W;
    
    _yt1 += _DIST1;
    _yt  = _yt1 + (Font1_H>>1);
    _yt -= _H2>>1;
    draw_sprite_(spr_1x1_WHT,0, _XL0-_PAD1, _yt1-_PAD1, -1, _w1,_H1, c_black, gui_Background_ALPHA); // dark bgr for info
    draw_surface(ColorOutline1_surf, _xl-PalEdit_Outline_W, _yt-PalEdit_Outline_W); // color square outline
    draw_sprite_(spr_1x1_WHT,0, _xl,_yt, -1, _W2,_H2, color_old);                   // color square
    draw_text_(_XL0,_yt1, _text, Font1_sprite);
    
    // NEW COLOR
    if (state==state_EDIT1B 
    ||  state==state_BGR_COLOR )
    {
        _text = _TEXT_NEW_COLOR+_TEXT_SPACING+color_str(color_new);
        _w1 = (string_length(_text)*Font1_W) + (_PAD1<<1);
        
        _xl  = _XL0;
        _xl += string_length(_TEXT_NEW_COLOR) * Font1_W;
        
        _yt1 += _DIST1;
        _yt   = _yt1 + (Font1_H>>1);
        _yt  -= _H2>>1;
        draw_sprite_(spr_1x1_WHT,0, _XL0-_PAD1, _yt1-_PAD1, -1, _w1,_H1, c_black, gui_Background_ALPHA); // dark bgr for info
        draw_surface(ColorOutline1_surf, _xl-PalEdit_Outline_W, _yt-PalEdit_Outline_W); // color square outline
        draw_sprite_(spr_1x1_WHT,0, _xl,_yt, -1, _W2,_H2, color_new);                   // color square
        draw_text_(_XL0,_yt1, _text, Font1_sprite);
    }
}




// INSTRUCTIONS INFO 1 -------------------------------------------------
if (Info1_can_draw)
{
    var _x,_y, _sprite;
    draw_sprite_(spr_1x1_WHT,0, Info1Area_xl,Info1Area_yt, -1, Info1Area_W,Info1Area_h, Info1Background_COLOR,Info1Background_ALPHA); // dark bgr for info
    for(_i=ds_grid_width(Info1_dg)-1; _i>=0; _i--)
    {
        if (Info1_dg[#_i,$4]) // $4: can draw
        {
            _text = Info1_dg[#_i,$0];
            _xl   = Info1_dg[#_i,$1];
            _yt   = Info1_dg[#_i,$2];
            draw_text_(_xl,_yt, _text, Info1_FONT);
            
            for(_j=$5; _j<Info1_dg_H; _j++) // $5: first index of button sprite data
            {
                _sprite =  Info1_dg[#_i,_j++];
                if(!_sprite) break;//_j
                
                _x = _xl + Info1_dg[#_i,_j++];
                _y = _yt + Info1_dg[#_i,_j];
                draw_sprite_(_sprite,0, _x,_y);
            }
        }
    }
}
//*/




