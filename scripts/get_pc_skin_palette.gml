/// get_pc_skin_palette(skin index, *return if not found)


var _Skin_IDX = argument[0];

var _PALETTE_COUNT = val(global.dm_pi[?"PC"+STR_Count]); // each tunic color/armor

// Give the return a default
if (argument_count>1)
{
    var _return = argument[1];
}
else
{
    var _return = string_copy(p.PAL_SET_PC_1, 1, global.PAL_CHAR_PER_PAL*_PALETTE_COUNT);
    //var _return = string_copy(p.PAL_SET_PC_1, 1, (global.COLORS_PER_PALETTE*_PALETTE_COUNT)<<1);
    if(!is_undefined( p.pal_rm_curr) 
    &&  string_length(p.pal_rm_curr) )
    {
        _return = string_copy(p.pal_rm_curr, get_pal_pos(global.PI_PC1), string_length(_return));
    }
}


// Give the return the palettes for _Skin_IDX
if (_Skin_IDX>=0)
{
    var _Skin_COUNT = val(global.pc.dm_skins[?STR_Set+STR_Count]);
    if (_Skin_COUNT 
    &&  _Skin_IDX<_Skin_COUNT )
    {
        var _DATAKEY = global.pc.dm_skins[?hex_str(_Skin_IDX)+STR_Datakey];
        if(!is_undefined(_DATAKEY))
        {
            var _Skin_palette = p.PAL_SET_PC_1; // default
            //var _Skin_palette = p.PAL_PC_1+p.PAL_PC_2+p.PAL_PC_3; // default
                _Skin_palette = val(global.pc.dm_skins[?string(_DATAKEY)  +STR_Palette], _Skin_palette);
                _Skin_palette = val(global.pc.dm_skins[?hex_str(_Skin_IDX)+STR_Palette], _Skin_palette);
            if (g.RandoPalette_state)
            //&&  val(f.dm_rando[?STR_Randomize+STR_Palette]) )
            {
                var _PC_RANDO_PALETTE = f.dm_rando[?STR_Palette+"_PC"+"01"];
                if(!is_undefined(_PC_RANDO_PALETTE))
                {   // Just need to set the tunic colors to their rando colors in _Skin_palette
                    var _pos = max(1,string_pos("R",global.PAL_BASE_COLOR_ORDER)); // tunic position
                    _pos--; // make it an index
                    _pos *= global.PAL_CHAR_PER_COLOR;
                    _pos++; // ++ because string
                    var _POS = _pos;
                    var _color;
                    for(var _i=0; _i<_PALETTE_COUNT; _i++) // Each armor/tunic level
                    {
                        _pos  = _POS;
                        _pos += global.PAL_CHAR_PER_PAL*_i; // add armor level
                        _color = string_copy(_PC_RANDO_PALETTE, _pos, global.PAL_CHAR_PER_COLOR);
                        _Skin_palette = strReplaceAt(_Skin_palette, _pos, string_length(_color), _color);
                    }
                }
            }
            
            _return = _Skin_palette;
        }
    }
}


return _return; // 3 palettes. The palettes of the 3 armor levels. Example: "F3182A36"+"F3181636"+"F3182236"




