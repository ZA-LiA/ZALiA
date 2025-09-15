/// get_random_palette1(palette count, *use game colors)


var _PALETTE_COUNT = max(1,argument[0]);

var                   _USE_GAME_COLORS = true;
if (argument_count>1) _USE_GAME_COLORS = argument[1];

var _i,_j;
var _color_char;
var _palette = "";

for(_i=0; _i<_PALETTE_COUNT; _i++)
{
    for(_j=0; _j<global.COLORS_PER_PALETTE; _j++)
    {
        _color_char = string_char_at(global.PAL_BASE_COLOR_ORDER, _j+1);
        
             if (_color_char=="W" || _color_char=="Y") _palette += color_str(get_random_color(_USE_GAME_COLORS,"H"));
        else if (_color_char=="R" || _color_char=="M") _palette += color_str(get_random_color(_USE_GAME_COLORS,"M"));
        else if (_color_char=="B" || _color_char=="K") _palette += color_str(get_random_color(_USE_GAME_COLORS,"S"));
        else if (_color_char=="G" || _color_char=="C") _palette += color_str(get_random_color(_USE_GAME_COLORS,"S"));
        else                                           _palette += color_str(get_random_color(_USE_GAME_COLORS));
    }
}


return _palette;




