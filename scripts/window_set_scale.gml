/// window_set_scale(scale)


var _scale = max(g.WindowScale_MIN, abs(round(argument0)));

// Allow room for Windows border
if (BASE_GAME_RESOLUTION_W*_scale > display_get_width() -g.WINDOW_PAD 
||  BASE_GAME_RESOLUTION_H*_scale > display_get_height()-g.WINDOW_PAD )
{
    _scale = max(g.WindowScale_MIN, _scale-1);
}


if (window_get_scale()!=_scale) // if requested scale != current scale
{
    g.WindowScale_scale = _scale;
    
     // !! DOES NOT TAKE EFFECT UNTIL NEXT FRAME !!
    window_set_size(BASE_GAME_RESOLUTION_W*_scale, BASE_GAME_RESOLUTION_H*_scale);
    return true;
}


return false;




