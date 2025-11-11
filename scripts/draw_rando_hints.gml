/// draw_rando_hints()


var _i,_j, _val, _num,_num_, _count;
var _text, _type;
var _item, _item_found;
var _pi, _color;


var _FOUND_NUMS = val(g.dm_RandoHintsRecorder[?STR_Found+STR_Hint+STR_Num], "");


_pi = global.PI_GUI2;
var _PI_FOUND1 = add_pi_permut(_pi, "RBWGMKYC", "draw_rando_hints() dark text 1");
var _PI_FOUND2 = _pi;


var _FOUND_COUNT = string_length(_FOUND_NUMS)>>1;

var _HEADER_TEXT = "--- "+"HINTS"+" ---";
//var _HEADER_TEXT = "HINTS";

var _CLMS=g.RandoHintsRecorder_W>>3;
var _XL0 = get_menu_x() - ($01<<3) - g.RandoHintsRecorder_W;
    _XL0 = max(_XL0, viewXL() + ($01<<3));
    _XL0 = (_XL0>>3)<<3;
//var _XL0 = viewXL() + ($06<<3);
var _XL1 = _XL0+($01<<3)+2;
var _xl  = _XL0;

var _YT0 = viewYT() + g.PAUSE_MENU.Y_BASE;
//var _YT0 = viewYT() + ($06<<3); // window yt
var _YT1 = _YT0+($01<<3);       // header yt
var _YT2 = _YT1+$8+3;           // hints yt
var _yt  = _YT0;

var _DIST1 = g.RandoHintsRecorder_Font_CHAR_SIZE+2;

_count = max(_FOUND_COUNT,1);
var _H  = $8<<1; // borders
    _H += $8;    // header text
    _H += $2<<1; // top & bottom padding
    _H += _count*g.RandoHintsRecorder_Font_CHAR_SIZE;
    _H +=(_count-1)*2; // leading
    _H  = ((_H div 8)<<3) + (sign(_H mod 8)<<3); // round up to 8
//
var _ROWS = _H>>3;


draw_sprite_(spr_1x1_WHT,0, _XL0,_YT0, -1, g.RandoHintsRecorder_W,_H, c_black);

_count  = string_length(_HEADER_TEXT);
_count += _count&$1;
for(_i=0;_i<_ROWS;_i++)
{
    for(_j=0;_j<_CLMS;_j++)
    {
            _type  =  !_i || _i==_ROWS-1;
            _type |= (!_j || _j==_CLMS-1) <<1;
        if (_type)
        {
            /*
            if (_i 
            ||  _j<(_CLMS>>1)-(_count>>1) 
            ||  _j>(_CLMS>>1)+(_count>>1) )
            */
            _xl  = _XL0 + (_j<<3);
            _yt  = _YT0 + (_i<<3);
            // tsrc: $20: horizontal, $21: vertical, $22: corner
            draw_background_part_ext_(global.PI_GUI1,ts_Menu01, (_type-1)<<3,$2<<3, 8,8, _xl,_yt, 1,1);
        }
    }
}


_xl  = _XL0 + ((_CLMS<<3)>>1);
_xl -= (string_length(_HEADER_TEXT)<<3)>>1;
_yt  = _YT1;
draw_text_(_xl,_yt, _HEADER_TEXT, global.dl_game_font[|global.game_font_idx], global.PI_GUI1);



if(!_FOUND_COUNT)
{
    _xl  = _XL1;
    _yt  = _YT2;
    draw_text_(_xl,_yt, "NO HINTS FOUND YET!", g.RandoHintsRecorder_Font_SPRITE, global.PI_GUI1);
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}

//C_WHT1 C_BLU2 C_RED3
_xl  = _XL1;
_yt  = _YT2;
for(_i=0; _i<_FOUND_COUNT; _i++)
{
    _num_ = string_copy(_FOUND_NUMS, (_i<<1)+1, 2);
    
    _item = g.dm_RandoHintsRecorder[?STR_Hint+_num_+STR_Item];
    if(!is_undefined(_item))
    {
        _item_found = val(g.dm_RandoHintsRecorder[?STR_Hint+_num_+STR_Item+STR_Found]);
        
        _xl  = _XL1;
        _text = val(g.dm_RandoHintsRecorder[?STR_Hint+_num_+STR_Text+"01"], "UNDEFINED");
        if (_item_found) _color=p.C_GRY3;
        else             _color=p.C_WHT1;
        draw_text_(_xl,_yt, _text, g.RandoHintsRecorder_Font_SPRITE, -1, _color);
        
        _xl += string_length(_text)*g.RandoHintsRecorder_Font_CHAR_SIZE;
        _text = val(g.dm_RandoHintsRecorder[?STR_Hint+_num_+STR_Item], "UNDEFINED");
        _text = string_letters(_text);
        if (_item_found) _color=p.C_GRY2;
        else             _color=p.C_GRN2;
        draw_text_(_xl,_yt, _text, g.RandoHintsRecorder_Font_SPRITE, -1, _color);
        
        _xl += string_length(_text)*g.RandoHintsRecorder_Font_CHAR_SIZE;
        _text = val(g.dm_RandoHintsRecorder[?STR_Hint+_num_+STR_Text+"02"], "UNDEFINED");
        if (_item_found) _color=p.C_GRY3;
        else             _color=p.C_WHT1;
        draw_text_(_xl,_yt, _text, g.RandoHintsRecorder_Font_SPRITE, -1, _color);
        
        _yt += _DIST1;
    }
}




