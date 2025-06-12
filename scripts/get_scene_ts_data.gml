/// get_scene_ts_data()

// THIS ASSUMES `g.dm_tile_file` ALREADY HAS THIS SCENE'S DATA


var _encoded = -1;
var _dl_ts_data = g.dm_tile_file[?"tilesets"];
if(!is_undefined(_dl_ts_data))
{
    var _dl_ts_data_SIZE = ds_list_size(_dl_ts_data);
    if (_dl_ts_data_SIZE)
    {
        var _i,_j, _idx, _num;
        var _char;
        var _ts_name, _ts_asset_idx, _ts_data;
        var _dm_ts_data = 0;
        var _dm_ts_info = ds_map_create();
        
        
        for(_i=0; _i<_dl_ts_data_SIZE; _i++)
        {
            _ts_name    = "";
            _dm_ts_data = _dl_ts_data[|_i];
            _ts_data    = _dm_ts_data[?"source"];
            // _dm_ts_data[?"source"] example: "source":"..\/..\/..\/..\/..\/..\/Tiled\/Tilesets\/Z2_Remake_1a\/ts_Natural_1a_WRB.tsx
            
            if(!is_undefined(_ts_data) 
            && !string_pos("palette",_ts_data) )
            {
                for(_j=string_length(_ts_data); _j>=1; _j--) // go backwards through the string
                {
                        _char = string_char_at(_ts_data,_j);
                    if (_char==".")
                    {   // So far, it's only the file ext(.tsx), next _j starts the tileset name.
                        _ts_name = "";
                        continue;//_j
                    }
                    
                    
                    if (_char=="/")
                    {
                        _ts_asset_idx = val(g.dm_tileset[?_ts_name],ts_SolidColors01_8x8); // asset index
                        //_ts_asset_idx = val(g.dm_tileset[?_ts_name],g.ts_SOLID_COLORS); // asset index
                        
                        _num = val(_dm_ts_info[?STR_Count]) + 1;
                        _dm_ts_info[?STR_Count] = _num;
                        _dm_ts_info[?hex_str(_num)+STR_Datakey] = hex_str(_i);
                        
                        _dm_ts_info[?hex_str(_i)+"_name"]    = _ts_name;
                        _dm_ts_info[?hex_str(_i)+"_idx"]     = _ts_asset_idx;
                        _dm_ts_info[?hex_str(_i)+"firstgid"] = val(_dm_ts_data[?"firstgid"]);
                        _dm_ts_info[?hex_str(_i)+"lastgid"]  = _dm_ts_info[?hex_str(_i)+"firstgid"] + (val(g.dm_tileset[?_ts_name+STR_Tile+STR_Count],$100) - 1);
                        //sdm("get_scene_ts_data(). tileset: "+_ts_name);
                        break;//_j
                    }
                    
                    _ts_name = _char + _ts_name;
                }
            }
            
            //ds_map_clear(_dm_ts_data);
        }
        
        
        
        
        _encoded = json_encode(_dm_ts_info);
        ds_map_destroy(_dm_ts_info); _dm_ts_info=undefined;
    }
}




return _encoded;




/*
/// get_scene_ts_data(encoded ts data list)


var _encoded = argument[0];


var _dl_ts_data = ds_list_create();
ds_list_read(_dl_ts_data, _encoded);
_encoded = -1;


var _dl_ts_data_SIZE = ds_list_size(_dl_ts_data);
if (_dl_ts_data_SIZE)
{
    var _i,_j, _idx;
    var _str, _char;
    var _ts_name, _ts_asset_idx, _ts_data;
    var _dm_ts_data = 0;
    var _dm_ts_info = ds_map_create();
    var _dg_ts_info_H = 4;
    var _dg_ts_info = ds_grid_create(0,_dg_ts_info_H);
    
    
    for(_i=0; _i<_dl_ts_data_SIZE; _i++)
    {
        _ts_name    = "";
        _dm_ts_data = _dl_ts_data[|_i];
        _ts_data    = _dm_ts_data[?"source"];
        // _dm_ts_data[?"source"] example: "source":"..\/..\/..\/..\/..\/..\/Tiled\/Tilesets\/Z2_Remake_1a\/ts_Natural_1a_WRB.tsx
        
        if(!is_undefined(_ts_data) 
        && !string_pos("palette",_ts_data) )
        {
            for(_j=string_length(_ts_data); _j>=1; _j--) // go backwards through the string
            {
                    _char = string_char_at(_ts_data,_j);
                if (_char==".")
                {   // So far, it's only the file ext(.tsx), next _j starts the tileset name.
                    _ts_name = "";
                    continue;//_j
                }
                
                
                if (_char=="/")
                {
                    _dm_ts_info[?hex_str(_i)+"_name"] = _ts_name;
                    _ts_asset_idx = val(g.dm_tileset[?_ts_name],ts_SolidColors01_8x8); // asset index
                    //_ts_asset_idx = val(g.dm_tileset[?_ts_name],g.ts_SOLID_COLORS); // asset index
                    _dm_ts_info[?hex_str(_i)+"_idx"]  = _ts_asset_idx;
                    
                    _idx = ds_grid_width(_dg_ts_info);
                    ds_grid_resize(_dg_ts_info, _idx+1,_dg_ts_info_H);
                    _dg_ts_info[#_idx,0] = _ts_asset_idx;
                    _dg_ts_info[#_idx,1] = _ts_name;
                    _dg_ts_info[#_idx,2] = val(_dm_ts_data[?"firstgid"]);
                    //_tile_w = val(g.dm_tileset[?_ts_name+STR_Tile+STR_Width], 8);
                    //_tile_h = val(g.dm_tileset[?_ts_name+STR_Tile+STR_Height],8);
                    _dg_ts_info[#_idx,3] = _dg_ts_info[#_idx,2] + (val(g.dm_tileset[?_ts_name+STR_Tile+STR_Count],$100) - 1);
                    //sdm("get_scene_ts_data(). tileset: "+_ts_name);
                    break;//_j
                }
                
                _ts_name = _char + _ts_name;
            }
        }
        
        if (ds_exists(_dm_ts_data,ds_type_map)) ds_map_clear(_dm_ts_data);
    }
    
    
    
    
    var _dm = ds_map_create();
    _dm[?"map"]  = ds_map_write(_dm_ts_info);
    _dm[?"grid"] = ds_grid_write(_dg_ts_info);
    _encoded = json_encode(_dm);
    
    ds_map_destroy(_dm); _dm=undefined;
    ds_map_destroy(_dm_ts_info); _dm_ts_info=undefined;
    ds_grid_destroy(_dg_ts_info); _dg_ts_info=undefined;
    if (ds_exists(_dm_ts_data,ds_type_map)){ds_map_destroy(_dm_ts_data); _dm_ts_data=undefined;}
}


ds_list_destroy(_dl_ts_data); _dl_ts_data=undefined;




return _encoded;
*/




/*
/// get_scene_ts_data(encoded map with ts data list)


var _encoded = argument[0];


var _DEFAULT_RETURN = -1;


var _dm = json_decode(_encoded);
if (_dm==-1) return _DEFAULT_RETURN;




_encoded = val(_dm[?"_dl_ts_data"], _DEFAULT_RETURN);
if (_encoded!=_DEFAULT_RETURN)
{
    var _dl_ts_data = ds_list_create();
    ds_list_read(_dl_ts_data, _encoded);
    _encoded = _DEFAULT_RETURN;
    
    
    var _dl_ts_data_SIZE = ds_list_size(_dl_ts_data);
    if(!_dl_ts_data_SIZE)
    {
        var _i,_j, _idx;
        var _str, _char;
        var _ts_name, _ts_asset_idx, _ts_data;
        var _dm_ts_data;
        var _dm_ts_info = ds_map_create();
        var _dg_ts_info_H = 4;
        var _dg_ts_info = ds_grid_create(0,_dg_ts_info_H);
        
        
        for(_i=0; _i<_dl_ts_data_SIZE; _i++)
        {
            _ts_name    = "";
            _dm_ts_data = _dl_ts_data[|_i];
            _ts_data    = _dm_ts_data[?"source"];
            // _dm_ts_data[?"source"] example: "source":"..\/..\/..\/..\/..\/..\/Tiled\/Tilesets\/Z2_Remake_1a\/ts_Natural_1a_WRB.tsx
            
            if(!is_undefined(_ts_data) 
            && !string_pos("palette",_ts_data) )
            {
                for(_j=string_length(_ts_data); _j>=1; _j--) // go backwards through the string
                {
                        _char = string_char_at(_ts_data,_j);
                    if (_char==".")
                    {   // So far, it's only the file ext(.tsx), next _j starts the tileset name.
                        _ts_name = "";
                        continue;//_j
                    }
                    
                    
                    if (_char=="/")
                    {
                        _dm_ts_info[?hex_str(_i)+"_name"] = _ts_name;
                        _ts_asset_idx = val(g.dm_tileset[?_ts_name],ts_SolidColors01_8x8); // asset index
                        //_ts_asset_idx = val(g.dm_tileset[?_ts_name],g.ts_SOLID_COLORS); // asset index
                        _dm_ts_info[?hex_str(_i)+"_idx"]  = _ts_asset_idx;
                        
                        _idx = ds_grid_width(_dg_ts_info);
                        ds_grid_resize(_dg_ts_info, _idx+1,_dg_ts_info_H);
                        _dg_ts_info[#_idx,0] = _ts_asset_idx;
                        _dg_ts_info[#_idx,1] = _ts_name;
                        _dg_ts_info[#_idx,2] = val(_dm_ts_data[?"firstgid"]);
                        //_tile_w = val(g.dm_tileset[?_ts_name+STR_Tile+STR_Width], 8);
                        //_tile_h = val(g.dm_tileset[?_ts_name+STR_Tile+STR_Height],8);
                        _dg_ts_info[#_idx,3] = _dg_ts_info[#_idx,2] + (val(g.dm_tileset[?_ts_name+STR_Tile+STR_Count],$100) - 1);
                        //sdm("get_scene_ts_data(). tileset: "+_ts_name);
                        break;//_j
                    }
                    
                    _ts_name = _char + _ts_name;
                }
            }
            
            if (ds_exists(_dm_ts_data,ds_type_map)) ds_map_clear(_dm_ts_data);
        }
        
        
        
        
        ds_map_clear(_dm);
        _dm[?"map"]  = ds_map_write(_dm_ts_info);
        _dm[?"grid"] = ds_grid_write(_dg_ts_info);
        _encoded = json_encode(_dm);
        
        ds_map_destroy(_dm_ts_info); _dm_ts_info=undefined;
        ds_grid_destroy(_dg_ts_info); _dg_ts_info=undefined;
    }
    
    ds_list_destroy(_dl_ts_data); _dl_ts_data=undefined;
}


ds_map_destroy(_dm); _dm=undefined;




return _encoded;
*/




