/// OptionsMenu_Draw_Other(YT)


var _YT0 = argument[0];

var _i, _count;
var _x,_y, _xl,_yt, _yt1;
var _DIST1 = $6; // line spacing
var _dk, _pi;
var _text, _font, _font_w,_font_h;
var _STR_UNDEFINED = "UNDEFINED";
var _DK0 = "Other";


_yt1  = _YT0;
_yt1 += _DIST1; // line spacing

_font   = FONT2;
_font_w = sprite_get_width( _font);
_font_h = sprite_get_height(_font);




var          _COUNT0 = val(dm_options[?_DK0+STR_Count]);
for(_i=0; _i<_COUNT0; _i++)
{
    if(!OptionsMenu_option_is_avail(menu_state_OTHER,_i))
    {
        continue;//_i
    }
    
    
    switch(_i){
    case Other_BACK:{_yt1+=$6; break;} // extra spacing
    }
    
    
    if (_yt1+_font_h >= MenuWindow_yb)
    {
        break;//_i
    }
    
    
    _text = val(dm_options[?_DK0+hex_str(_i)+STR_Option+STR_Text]);
    _xl = TextArea1_xl;
    _yt = _yt1;
    if (_i==Other_cursor) _pi = PI_MENU1;
    else                  _pi = PI_MENU2;
    draw_text_(_xl,_yt, _text, _font, _pi);
    
    
    _pi = PI_MENU1;
    _text = 0;
    _dk = _DK0+hex_str(_i)+STR_State;
    switch(_i)
    {   // --------------------------------------------------------------------
        case Other_FLASHING:{
        _xl  = drawX + MenuWindow_w; // window xr
        _xl -= 8; // window border
        _xl -= 4; // pad
        
        if(!p.BackgroundFlash_setting)
        {
            //_text = "NO FLASH";
            //_text = "NO COLOR";
            _text = "NONE";
            //_text = "OFF";
            _xl -= string_length(_text) * _font_w;
            _yt  = _yt1;       // text yt
            draw_text_(_xl,_yt, _text, _font, PI_MENU1);
        }
        else
        {
            _xl -= BackgroundFlash_W;
            
            _yt  = _yt1;       // text yt
            _yt += _font_h>>1; // text yc
            _yt -= BackgroundFlash_H>>1; // color box yt
            if (p.BackgroundFlash_setting==1) _color = p.dg_color_seq[#0,g.counter0&$3];
            else                              _color = p.dl_BackgroundFlash_COLORS[|p.BackgroundFlash_setting];
            draw_sprite_(spr_1x1_WHT,0, _xl,_yt, -1, BackgroundFlash_W,BackgroundFlash_H, _color);
        }
        break;}//case Other_FLASHING
        
        // --------------------------------------------------------------------
        case Other_DIALOGUE_SPEED:{
        _text = string(g.mod_DLG_SPEED+1);
        if (_i==Other_cursor) _pi = PI_MENU1;
        else                  _pi = PI_MENU2;
        break;}//case Other_DIALOGUE_SPEED
        
        // --------------------------------------------------------------------
        case Other_HIDDEN_OW_EXITS:{
        _text = val(dm_options[?_dk+hex_str(g.HiddenExitIndicator_enabled)+STR_Text],_STR_UNDEFINED);
             if (_i==Other_cursor)              _pi = PI_MENU1;
        else if(!g.HiddenExitIndicator_enabled) _pi = PI_DARK1;
        else                                    _pi = PI_MENU2;
        break;}
        
        // --------------------------------------------------------------------
        case Other_HUD:{
        _text = val(dm_options[?_dk+hex_str(global.HUD_state)           +STR_Text],_STR_UNDEFINED);
        if (_i==Other_cursor) _pi = PI_MENU1;
        else                  _pi = PI_MENU2;
        break;}
        
        // --------------------------------------------------------------------
        case Other_TORCH_LIGHTING:{
        _text = val(dm_options[?_dk+hex_str(g.torch_lighting_method)    +STR_Text],_STR_UNDEFINED);
        if (_i==Other_cursor) _pi = PI_MENU1;
        else                  _pi = PI_MENU2;
        break;}
        /*
        // --------------------------------------------------------------------
        case Other_RENDER_DELAY:{
        _text = val(dm_options[?_dk+hex_str(global.RenderFrameDelay_state)+STR_Text],_STR_UNDEFINED);
        if(!global.RenderFrameDelay_state) _pi = PI_DARK1;
        else if (_i==Other_cursor)         _pi = PI_MENU1;
        else                               _pi = PI_MENU2;
        break;}
        */
        // --------------------------------------------------------------------
        case Other_SCREEN_SHAKE:{
        _text = val(dm_options[?_dk+hex_str(g.ScreenShake_user_pref)    +STR_Text],_STR_UNDEFINED);
             if (_i==Other_cursor)        _pi = PI_MENU1;
        else if(!g.ScreenShake_user_pref) _pi = PI_DARK1;
        else                              _pi = PI_MENU2;
        break;}
        
        // --------------------------------------------------------------------
        case Other_BLACK_BGR:{
        _text = val(dm_options[?_dk+hex_str(g.all_bg_black_only)        +STR_Text],_STR_UNDEFINED);
             if (_i==Other_cursor)    _pi = PI_MENU1;
        else if(!g.all_bg_black_only) _pi = PI_DARK1;
        else                          _pi = PI_MENU2;
        break;}
        
        // --------------------------------------------------------------------
        case Other_STAB_FRENZY:{
        _text = val(dm_options[?_dk+hex_str(g.mod_StabFrenzy)           +STR_Text],_STR_UNDEFINED);
             if (_i==Other_cursor) _pi = PI_MENU1;
        else if(!g.mod_StabFrenzy) _pi = PI_DARK1;
        else                       _pi = PI_MENU2;
        break;}
        
        // --------------------------------------------------------------------
        case Other_ANARKHYA_OW:{
        _text = val(dm_options[?_dk+hex_str(g.anarkhyaOverworld_enabled)+STR_Text],_STR_UNDEFINED);
             if (_i==Other_cursor)            _pi = PI_MENU1;
        else if(!g.anarkhyaOverworld_enabled) _pi = PI_DARK1;
        else                                  _pi = PI_MENU2;
        break;}
        
        // --------------------------------------------------------------------
        case Other_HALLOWEEN1:{
        _text = val(dm_options[?_dk+hex_str(global.Halloween1_enabled)  +STR_Text],_STR_UNDEFINED);
             if (_i==Other_cursor)          _pi = PI_MENU1;
        else if(!global.Halloween1_enabled) _pi = PI_DARK1;
        else                                _pi = PI_MENU2;
        break;}
        
        // --------------------------------------------------------------------
        case Other_DOUBLE_JUMP:{
        _text = val(dm_options[?_dk+hex_str(g.DoubleJump_state)+STR_Text],_STR_UNDEFINED);
             if (_i==Other_cursor)   _pi = PI_MENU1;
        else if(!g.DoubleJump_state) _pi = PI_DARK1;
        else                         _pi = PI_MENU2;
        break;}
        /*
        // --------------------------------------------------------------------
        case Other_SHOW_ACTIVE_SPELLS:{
        _text = val(dm_options[?_dk+hex_str(g.mod_IndicateSpellActive)  +STR_Text],_STR_UNDEFINED);
             if (_i==Other_cursor)          _pi = PI_MENU1;
        else if(!g.mod_IndicateSpellActive) _pi = PI_DARK1;
        else                                _pi = PI_MENU2;
        break;}
        */
    }//switch(_i)
    
    if (_text!=0)
    {
        _xl  = TextArea2_xr;
        _xl -= string_length(_text)*_font_w;
        _yt = _yt1;
        draw_text_(_xl,_yt, _text, _font, _pi);
    }
    
    
    if (_i==Other_cursor)
    {
        _x = Cursor_xl + (Cursor_W>>1);
        _y = _yt1 + (_font_h>>1); // text yc
        draw_sprite_(Cursor_SPRITE,0, _x,_y, PI_MENU1);
    }
    
    
    _yt1 += _font_h; // text yb
    _yt1 += _DIST1;  // line spacing
}








// OPTION INFO -----------------------------------------------------------
_yt1 = Info_yt;
if (_yt1+Info_FONT_H < MenuWindow_yb)
{
    _dk = _DK0+hex_str(Other_cursor)+STR_Description;
    _count = val(dm_options[?_dk+STR_Count]);
    if (_count)
    {
        _xl = TextArea1_xl;
        _yt = _yt1;
        pal_swap_set(global.palette_image, PI_MENU1);
        for(_i=0; _i<_count; _i++)
        {
            if (_yt1+Info_FONT_H >= MenuWindow_yb)
            {
                break;//_i
            }
            
            _text = val(dm_options[?_dk+hex_str(_i)]);
            if(!is_string(_text))
            {
                break;//_i
            }
            
            _yt = _yt1;
            _yt1  = draw_text_plus(_xl,Info_xr, _yt, _text, Info_FONT);
            _yt1 += Info_PAD1; // line spacing
        }
        pal_swap_reset();
    }
}





