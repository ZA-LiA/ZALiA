/// data_dungeon_2(start exit name)


data_dungeon_2a(argument0, -1);


var                _OFF_X = 0;
if (map_clm_lft<0) _OFF_X = -map_clm_lft;
var                _OFF_Y = 0;
if (map_row_top<0) _OFF_Y = -map_row_top;

if (_OFF_X 
||  _OFF_Y )
{
    with(g.PAUSE_MENU)
    {
        for(var _i=ds_grid_width(dg_dngn_map)-1; _i>=0; _i--)
        {
            dg_dngn_map[#_i,0] += _OFF_X;
            dg_dngn_map[#_i,1] += _OFF_Y;
        }
    }
}




/*
// if (area == Area_PalcA)
// if (area == Area_PalcB)
// if (area == Area_PalcC)
// if (area == Area_PalcD)
// if (area == Area_PalcE)
if (area == Area_PalcF)
// if (area == Area_PalcG)
{
    sdm(""); sdm(""); sdm(""); sdm("");
    var _IDX = 5; // 5 rm_name, 6 rm page, 7 explored
    var _rm  = "a";
    var _str = "";
    for(_i=ds_grid_width(g.PAUSE_MENU.dg_dngn_map)-1; _i>=0; _i--)
    {
        if (_rm != g.PAUSE_MENU.dg_dngn_map[#_i,_IDX])
        {
            _rm  = g.PAUSE_MENU.dg_dngn_map[#_i,_IDX];
            sdm("");
        }
        
        _str =                       g.PAUSE_MENU.dg_dngn_map[# _i,_IDX];    // rm_name
        _str += " page $"  + hex_str(g.PAUSE_MENU.dg_dngn_map[# _i,_IDX+1]); // rm page
        _str += ", clm $"  + hex_str(g.PAUSE_MENU.dg_dngn_map[# _i,0]);
        _str +=  " row $"  + hex_str(g.PAUSE_MENU.dg_dngn_map[# _i,1]);
        _str += ", tsrc $" + hex_str(g.PAUSE_MENU.dg_dngn_map[# _i,2]);
        
        _str += ", xscale ";
        if (g.PAUSE_MENU.dg_dngn_map[# _i,3]) _str += " ";
        _str += string(g.PAUSE_MENU.dg_dngn_map[# _i,3]);
        
        _str += ", yscale ";
        if (g.PAUSE_MENU.dg_dngn_map[# _i,4]) _str += " ";
        _str += string(g.PAUSE_MENU.dg_dngn_map[# _i,4]);
        
        sdm(_str);
    }
}
*/




/*
var _str  =   "map_clm_lft $" + hex_str(map_clm_lft);
    _str += ", map_clm_rgt $" + hex_str(map_clm_rgt);
    _str += ", map_row_btm $" + hex_str(map_row_btm);
    _str += ", map_row_top $" + hex_str(map_row_top);
    _str += ", dngn_map_tile_cnt $" + hex_str(dngn_map_tile_cnt);
sdm(_str);
*/




