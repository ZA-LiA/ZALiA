/// dev_list_tile_liquid_layers()


//if (keyboard_check_pressed(vk_f7))
var _i,_j,_k,_m, _idx, _count, _area, _scene_name;
var _file, _file_name,_file_name1, _file_data;
var _layer_count, _layer_name, _dl_layer_data, _dm_layer_data;
var _scene_liquid_layer_count = 0;
var _dm_file_data = undefined;
//var _dm_file_data = 0;




repeat(2) sdm("");

var          _COUNT1 = ds_list_size(g.dl_AREA_NAME);
for(_i=0; _i<_COUNT1; _i++) // Each area
{
    _area = g.dl_AREA_NAME[|_i];
    //if(!string_pos("Palc",_area)) continue;//_i
    
    for(_j=0; _j<$100; _j++) // Each possible file of area
    {   // file name example:  "rm_tile_data/PalcA/PalcA_003.json"
        _file_name1  = string_lettersdigits(_area);
        _file_name1 += "_";
        _file_name1 += string_repeat("0",_j<100);
        _file_name1 += string_repeat("0",_j<10);
        _file_name1 += string(_j);
        
        _file_name  = "rm_tile_data";
        _file_name += "/";
        _file_name += string_lettersdigits(_area);
        _file_name += "/";
        _file_name += _file_name1;
        _file_name += ".json";
        if(!file_exists(_file_name)) continue;//_j. to next file
        
        _file_data = "";
        _file = file_text_open_read(_file_name);
        while(!file_text_eof(_file)) _file_data += file_text_readln(_file);
        file_text_close(_file);
        _dm_file_data = json_decode(_file_data);
        if (_dm_file_data!=-1)
        {
            _scene_liquid_layer_count = 0;
            
            _dl_layer_data = val(_dm_file_data[?"layers"]);
            _layer_count = ds_list_size(_dl_layer_data);
            for(_k=0; _k<_layer_count; _k++) // Each layer
            {
                _dm_layer_data = _dl_layer_data[|_k];
                _layer_name    = _dm_layer_data[?"name"];
                _layer_name    = string(_layer_name);
                if(!string_pos("LIQUID_",_layer_name)) continue;//_k
                
                _scene_liquid_layer_count++;
                sdm(_file_name1+". "+_layer_name);
            }
            
            ds_map_destroy(_dm_file_data); _dm_file_data=undefined;
        }
    }
    
    //if (_scene_liquid_layer_count){repeat(1) sdm("");}
    repeat(2) sdm("");
}

repeat(2) sdm("");


//if (ds_exists(_dm_file_data,ds_type_map)){ds_map_destroy(_dm_file_data); _dm_file_data=undefined;}




