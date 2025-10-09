/// Kakusu009_init2()

// Darunia Basement. 
// Teleports when hit. A block falling on it will kill it.


var _i;


abilities = 0;

body_type = 2; // 1: Opaque, 2: Transparent
eyes_type = 0; // 1: EYES1(OG), 2: EYES2(cyclops)




sequence_idx = 0;

dg_sequence = ds_grid_create(0,3);

var _DATA = undefined;

if(!is_undefined(dk_spawn))
{
    _DATA = g.dm_spawn[?dk_spawn+STR_Data+'01'];
    
    for(_i=$1; _i<=$F; _i++)
    {
        _val=val(g.dm_spawn[?dk_spawn+STR_Data+hex_str(_i)]);
        if (is_string(_val))
        {
                _pos =string_pos(   STR_Locations,_val);
            if (_pos)
            {   _pos+=string_length(STR_Locations);
                _val =string_copy(_val, _pos, string_length(_val)-(_pos-1));
                _DATA=_val;
                break;//_i
            }
        }
    }
}



if(!is_undefined(_DATA))
{
    var _rc = 0;
    var _COUNT = string_length(_DATA)>>2;
    
    ds_grid_resize(dg_sequence, _COUNT,ds_grid_height(dg_sequence));
    
    for(_i=0; _i<_COUNT; _i++)
    {
        _rc = str_hex(string_copy(_DATA, (_i<<2)+1, 4));
        dg_sequence[#_i,1] = ((_rc>>0)&$FF) <<3; // x
        dg_sequence[#_i,2] = ((_rc>>8)&$FF) <<3; // y
    }
}
else
{
    ds_grid_resize(dg_sequence, 1,ds_grid_height(dg_sequence));
    dg_sequence[#0,1] = (g.rm_w_>>3)<<3; // x
    dg_sequence[#0,2] = (g.rm_h_>>3)<<3; // y
}



spawn_xl = dg_sequence[#0,1];
spawn_yt = dg_sequence[#0,2];
set_xy(id, spawn_xl,spawn_yt);




Kakusu_init2();




