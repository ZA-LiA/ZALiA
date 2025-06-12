/// tile_anim_change_frame(anim num, map key, rm clm, rm row)


var _ANIM_NUM = argument0;
var _datakey  = argument1;
var _CLM      = argument2;
var _ROW      = argument3;


var _dm_frame = json_decode(g.dm_tile[?_datakey]);
if (_dm_frame!=-1)
{
    var _i, _idx, _x,_y;
    var _depth, _rc_off, _tsrc, _solid, _unique, _hide;
    var _clm,_row;
    
    for(_i=0; _i<g.rm_tile_count; _i++)
    {
        _datakey = hex_str(_i);
        
        if (is_undefined(_dm_frame[?_datakey+STR_Depth])) break;
        else _depth =    _dm_frame[?_datakey+STR_Depth];
        
        
        if ( _depth==-1) _depth = g.dg_tile_anim[#_ANIM_NUM,6];
        
        
        _rc_off = val(_dm_frame[?_datakey+STR_rc_offset]);
        _ts     = val(_dm_frame[?_datakey+STR_Tileset]);
        _tsrc   = val(_dm_frame[?_datakey+STR_TSRC]);
        _solid  = val(_dm_frame[?_datakey+STR_Solid]);
        _unique = val(_dm_frame[?_datakey+STR_unique]);
        _hide   = val(_dm_frame[?_datakey+STR_HIDDEN]);
        
            _idx = ds_list_find_index(g.dl_TILE_DEPTHS, _depth);
        if (_idx!=-1) _unique = (_idx<<8) | (_unique&$FF);
        
        _clm = _CLM + ((_rc_off>>0)&$FF);
        _row = _ROW + ((_rc_off>>8)&$FF);
        _x   = _clm<<3;
        _y   = _row<<3;
        
        tile_change_1a(_depth, _x,_y, _ts, _tsrc, _solid,_unique,_hide);
    }
    
    
    ds_map_destroy(_dm_frame); _dm_frame=undefined;
}




