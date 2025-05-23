/// debug_ow_solids_1a()
// Outputs a visual representation of the ow with a grid of solid values
var i, j;
var _str = "";
var _val = 0;
var _w, _h;
_w = ds_grid_width( global.OVERWORLD.dg_solid);
_h = ds_grid_height(global.OVERWORLD.dg_solid);
_str = "";
// _str += "";
for (i = 0; i < _h; i++)
{
    if (i && !(i & $F))
    {
        _str += string_repeat("-", _w);
        // repeat (_w) _str += "-";
        show_debug_message(_str);
        _str = "";
    }
    
    
    for (j = 0; j < _w; j++)
    {
        // _str += "";
        
        
        _val = global.OVERWORLD.dg_solid[# j, i];
        if (_val) _str += " "+hex_str(_val);
        else      _str += " __";
        if (j && j&$F == $F && j+1 != _w) _str += " |"
        
    }
    
    show_debug_message(_str);
    _str = "";
}

