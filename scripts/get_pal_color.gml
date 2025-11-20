/// get_pal_color(palette data, pal idx of palette data, color base char)


var _PALETTE    = argument[0];
var _PI         = argument[1];
var _COLOR_CHAR = string(argument[2]);

var _pos  = string_pos(_COLOR_CHAR, global.PAL_BASE_COLOR_ORDER);
    _pos  = max(0,_pos-1);
    _pos *= global.PAL_CHAR_PER_COLOR;
    _pos  = get_pal_pos(_PI) + _pos;
//
var    _color = string_copy(_PALETTE, _pos, global.PAL_CHAR_PER_COLOR);
       _color = str_hex(_color);
return _color;




/*
/// get_pal_color(palette data, pal idx of palette data, color base char)


// make argument2 the index of the color within a palette
argument2  = string_pos(string(argument2), global.PAL_BASE_COLOR_ORDER);
argument2  = max(0,argument2-1);
argument2 *= global.PAL_CHAR_PER_COLOR;
// make argument1 the string position of color needed
argument1  = get_pal_pos(argument1);
argument1 += argument2;

return str_hex(string_copy(argument0, argument1, global.PAL_CHAR_PER_COLOR));
*/




