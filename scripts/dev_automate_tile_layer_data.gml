/// dev_automate_tile_layer_data()


var _i,_j,_k,_m, _idx, _count,_count1,_count2, _area, _scene_name;
var _datakey,_datakey1,_datakey2;
var _str,_str1,_str2, _pos, _output;
var _file, _file_name,_file_name1;
var _file_data = undefined;
//var _file_data = ds_map_create();
var _layer_count, _layer_name, _layer, _dl_layer_data, _dm_layer_data;
var _area_file_num_;
var _STR1="***********************";
var _STR2="----------------------------";



repeat(2) sdm("");

var          _AREA_COUNT = ds_list_size(g.dl_AREA_NAME);
for(_i=0; _i<_AREA_COUNT; _i++) // Each area
{
    _area = g.dl_AREA_NAME[|_i];
    sdm("// "+_STR1+"  "+_area+"  "+_STR1);
    
    for(_j=0; _j<$100; _j++) // Each possible file of area
    {   // file name example:  "rm_tile_data/PalcA/PalcA_003.json"
        //_scene_name = _area+hex_str(_j);
        
        _area_file_num_  = string_repeat("0",3-string_length(string(_j)));
        _area_file_num_ += string(_j);
        sdm("//  "+_STR2+"  "+_area_file_num_+"  "+_STR2);
        
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
        //_file_name += string_lettersdigits(_area);
        //_file_name += "_";
        //_file_name += string_repeat("0",_j<100);
        //_file_name += string_repeat("0",_j<10);
        //_file_name += string(_j);
        _file_name += ".json";
        if (file_exists(_file_name))
        {
            _file_data = "";
            _file = file_text_open_read(_file_name);
            while(!file_text_eof(_file)) _file_data += file_text_readln(_file);
            file_text_close(_file);
            _file_data = json_decode(_file_data);
            if (_file_data!=-1)
            {
                _datakey1  = "'"+_file_name1+"'";
                _datakey1 += "+STR_Layer";
                _count1 = 0;
                _dl_layer_data = val(_file_data[?"layers"]);
                _layer_count = ds_list_size(_dl_layer_data);
                for(_k=_layer_count-1; _k>=0; _k--) // Each layer
                {
                    _dm_layer_data = _dl_layer_data[|_k];
                    _layer_name    = _dm_layer_data[?"name"];
                    _layer_name    = string(_layer_name);
                    
                    if (string_pos("BG",_layer_name) 
                    ||  string_pos("FG",_layer_name) )
                    {
                        if (string_pos("BG",_layer_name))
                        {    _layer = string_copy(_layer_name, string_pos("BG",_layer_name), 4);  }
                        else _layer = string_copy(_layer_name, string_pos("FG",_layer_name), 4);
                        
                        _count1++;
                        _output  = "_dm[?"+_datakey1;
                        _output += "+'"+hex_str(_count1)+"'";
                        _output += "+STR_Name";
                        _output += "] = ";
                        _output += "'"+_layer_name+"'";
                        _output += ";";
                        sdm(_output);
                    }
                }
                
                if (_count1)
                {
                    _output = "_dm[?"+_datakey1+"+STR_Count] = $"+hex_str(_count1)+";";
                    //sdm(_output);
                }
                
                ds_map_destroy(_file_data); _file_data=undefined;
            }
        }
    }
    
    
    repeat(8) sdm(""); // after each area
}

repeat(2) sdm("");


//if (ds_exists(_file_data,ds_type_map)){ds_map_destroy(_file_data); _file_data=undefined;}




