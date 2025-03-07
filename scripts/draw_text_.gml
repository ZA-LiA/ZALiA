/// draw_text_(XL, YT, text str, *text spr, *palette idx, *color)


var _i,_j, _sub_image;
var _x,_y;

                                  _i=0;
var _XL   =              argument[_i++];
var _YT   =              argument[_i++];
var _TEXT = string_upper(argument[_i++]);

var                                      _TEXT_SPRITE = spr_Font1;
if (argument_count>_i && argument[_i++]) _TEXT_SPRITE = argument[_i-1];

// Pass -1 to not pal swap (pal swap may have been set outide of draw_text_()
var                    _TEXT_PI = PI_GUI_1;
if (argument_count>_i) _TEXT_PI = argument[_i++];

var _TEXT_COLOR = -1;
if (argument_count>_i)
{
    _TEXT_COLOR = argument[_i++];
    _TEXT_PI = -1;
}


// FONT_LAYOUT = " _/\()*+-.,:'%&!?0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

var _text_sprite = _TEXT_SPRITE;
var _xscale = 1;
var _yscale = 1;

var _char   = "";
var _char_w = sprite_get_width( _text_sprite);
var _char_h = sprite_get_height(_text_sprite);
var _x_off  = 0;
var _y_off  = 0;

if (_TEXT_PI>=0) pal_swap_set(p.palette_image, _TEXT_PI);

var           _LEN = string_length(_TEXT);
for(_i=1; _i<=_LEN; _i++)
{
    _char      = string_char_at(_TEXT,_i);
    _sub_image = string_pos(_char,FONT_LAYOUT)-1;
    
    if (g._YxY_)
    {
        _j = (g._UxU_+_i) mod ds_grid_width(g.dg_YxY_);
        _text_sprite = g.dg_YxY_[#_j,$0];
        _char_w = sprite_get_width( _text_sprite);
        _char_h = sprite_get_height(_text_sprite);
        //_xscale = g.dg_YxY_[#_i-1,$1];
        _yscale = g.dg_YxY_[#_i-1,$2];
    }
    
    
    if (_char!=" ")
    {
        if (_char=="" 
        || !_sub_image )
        {
            _text_sprite = spr_Text_WrongChar;
            _sub_image = 0;
        }
        
        _x = _XL + _x_off;
        if(!_xscale) _x += _char_w;
        
        _y = _YT + _y_off;
        if(!_yscale) _y += _char_h;
        
        if (_TEXT_COLOR>=0) draw_sprite_(_text_sprite,_sub_image, _x,_y, -1, _xscale,_yscale, _TEXT_COLOR);
        else                draw_sprite_(_text_sprite,_sub_image, _x,_y, -1, _xscale,_yscale);
    }
    
        _x_off += _char_w;
    if (_char=="#") // new line?
    {
        _x_off  = 0;
        _y_off += _char_h<<1;
    }
}

if (_TEXT_PI>=0) pal_swap_reset();




