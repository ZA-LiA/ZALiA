/// get_random_color(use game colors, *0 highlight or 1 midtone or 2 shadow)


var _USE_GAME_COLORS = argument[0];

var                   _tone = -1;
if (argument_count>1) _tone = argument[1];
if (is_string(_tone)) _tone = string_upper(_tone);
//else                  _tone = clamp(_tone,-1,2);

if (_tone==-1)
{
    if (_USE_GAME_COLORS) return p.dl_COLORS_USED[|irandom(ds_list_size(p.dl_COLORS_USED)-1)];
}
else
{
         if (_tone==0 || _tone=="H" || _tone=="Y") return get_random_color_highlight(_USE_GAME_COLORS);
    else if (_tone==1 || _tone=="M" || _tone=="M") return get_random_color_midtone(  _USE_GAME_COLORS);
    else if (_tone==2 || _tone=="S" || _tone=="K") return get_random_color_shadow(   _USE_GAME_COLORS);
    else if (_USE_GAME_COLORS)                     return p.dl_COLORS_USED[|irandom(ds_list_size(p.dl_COLORS_USED)-1)];
}


return irandom($FFFFFF);




