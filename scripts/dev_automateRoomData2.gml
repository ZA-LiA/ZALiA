/// dev_automateRoomData2()


var _i,_j, _a,_b,_c, _val, _count;
var _len,_len1,_len2, _line_len;
var _str,_str1,_str2, _char;
var _pos,_pos1,_pos2;
var _datakey,_datakey1,_datakey2;
var _rm_w,_rm_h;
var _area, _rm_name;
var _file, _file_name, _area_file_num_, _file_data, _data;
var _dm_file = 0;
//var _dm_file=ds_map_create();

var _STR1="***********************";
var _STR2="----------------------------";

repeat(1) sdm("");

var          _AREA_COUNT = ds_list_size(g.dl_AREA_NAME);
for(_i=0; _i<_AREA_COUNT; _i++)
{
    _area = g.dl_AREA_NAME[|_i];
    sdm("// "+_STR1+"  "+_area+"  "+_STR1);
    sdm("// -------------------------------------------------------------");
    repeat(2) sdm("");
    
    for(_j=0; _j<$100; _j++)
    {
        _area_file_num_  = string_repeat("0",3-string_length(string(_j)));
        _area_file_num_ += string(_j);
        sdm("//  "+_STR2+"  "+_area_file_num_+"  "+_STR2);
        
        //_file_name example: "PalcA_003"
        _file_name  = string_letters(_area); // get "PalcA" from "_PalcA_"
        _file_name += "_";
        _file_name += _area_file_num_;
        
        //_file example: "rm_tile_data/PalcA/PalcA_003.json"
        _file  = "rm_tile_data";
        _file += "/";
        _file += string_letters(_area); // get "PalcA" from "_PalcA_"
        _file += "/";
        _file += _file_name; // "PalcA_003"
        _file += ".json";
        
        if (file_exists(_file))
        {
                _file =       file_text_open_read(_file);
                _file_data  = "";
            while(           !file_text_eof(   _file)) 
            {   _file_data += file_text_readln(_file);  }
                              file_text_close( _file);
            //
                        _dm_file=json_decode(_file_data);
            _rm_w = val(_dm_file[?"width"]);
            _rm_h = val(_dm_file[?"height"]);
            
            _rm_w = _rm_w<<3;
            _rm_h = _rm_h<<3;
            
            
            sdm("global.dm_scene_wh[?'"+_file_name+"'+STR_Width ] = $"+hex_str(_rm_w)+";");
            sdm("global.dm_scene_wh[?'"+_file_name+"'+STR_Height] = $"+hex_str(_rm_h)+";");
            //sdm("g.dm_rm[?STR_Tile+STR_File+'"+_file_name+"'+STR_Width ] = $"+hex_str(_rm_w>>8)+"<<8; // ");
            //sdm("g.dm_rm[?STR_Tile+STR_File+'"+_file_name+"'+STR_Height] = $"+hex_str(_rm_h>>8)+"<<8; // ");
            
            ds_map_destroy(_dm_file); _dm_file=undefined;
        }
        
        repeat(1) sdm("");
        //if (_j && !(_j&$F)){sdm("");sdm("");}
    }
    
    if (_i<_AREA_COUNT-1){repeat(8) sdm("");}
}


var _exists=variable_instance_exists(id,"_dm_file");
if (_exists) _exists = !is_undefined(    _dm_file);
if (_exists) _exists = ds_exists(        _dm_file,ds_type_map);
if (_exists)           ds_map_destroy(   _dm_file);
if (_exists)                             _dm_file=undefined;
//ds_map_destroy(_dm_file); _dm_file=undefined;




/*
/// dev_automateRoomData2()


var _i,_j, _a,_b,_c, _val, _count;
var _len,_len1,_len2, _line_len;
var _str,_str1,_str2, _char;
var _pos,_pos1,_pos2;
var _datakey,_datakey1,_datakey2;
var _rm_w,_rm_h;
var _area, _rm_name;
var _file, _file_name, _area_file_num_, _file_data, _data;
var _dm_file = 0;
//var _dm_file=ds_map_create();

var _STR1="***********************";
var _STR2="----------------------------";

repeat(1) sdm("");
sdm("with(g)");
sdm("{");

var          _AREA_COUNT = ds_list_size(g.dl_AREA_NAME);
for(_i=0; _i<_AREA_COUNT; _i++)
{
    _area = g.dl_AREA_NAME[|_i];
    sdm("    // "+_STR1+"  "+_area+"  "+_STR1);
    sdm("    // -------------------------------------------------------------");
    repeat(2) sdm("    ");
    
    for(_j=0; _j<$100; _j++)
    {
        _area_file_num_  = string_repeat("0",3-string_length(string(_j)));
        _area_file_num_ += string(_j);
        sdm("    //  "+_STR2+"  "+_area_file_num_+"  "+_STR2);
        
        //_file_name example: "PalcA_003"
        _file_name  = string_letters(_area); // get "PalcA" from "_PalcA_"
        _file_name += "_";
        _file_name += _area_file_num_;
        
        //_file example: "rm_tile_data/PalcA/PalcA_003.json"
        _file  = "rm_tile_data";
        _file += "/";
        _file += string_letters(_area); // get "PalcA" from "_PalcA_"
        _file += "/";
        _file += _file_name; // "PalcA_003"
        _file += ".json";
        
        if (file_exists(_file))
        {
                _file =       file_text_open_read(_file);
                _file_data  = "";
            while(           !file_text_eof(   _file)) 
            {   _file_data += file_text_readln(_file);  }
                              file_text_close( _file);
            //
                        _dm_file=json_decode(_file_data);
            _rm_w = val(_dm_file[?"width"]);
            _rm_h = val(_dm_file[?"height"]);
            
            _rm_w = _rm_w<<3;
            _rm_h = _rm_h<<3;
            
            
            sdm("    dm_rm[?STR_Tile+STR_File+'"+_file_name+"'+STR_Width ] = $"+hex_str(_rm_w)+";");
            sdm("    dm_rm[?STR_Tile+STR_File+'"+_file_name+"'+STR_Height] = $"+hex_str(_rm_h)+";");
            //sdm("g.dm_rm[?STR_Tile+STR_File+'"+_file_name+"'+STR_Width ] = $"+hex_str(_rm_w>>8)+"<<8; // ");
            //sdm("g.dm_rm[?STR_Tile+STR_File+'"+_file_name+"'+STR_Height] = $"+hex_str(_rm_h>>8)+"<<8; // ");
            
            ds_map_destroy(_dm_file); _dm_file=undefined;
        }
        
        repeat(1) sdm("    ");
        //if (_j && !(_j&$F)){sdm("");sdm("");}
    }
    
    if (_i<_AREA_COUNT-1){repeat(8) sdm("    ");}
}

sdm("}");


var _exists=variable_instance_exists(id,"_dm_file");
if (_exists) _exists = !is_undefined(    _dm_file);
if (_exists) _exists = ds_exists(        _dm_file,ds_type_map);
if (_exists)           ds_map_destroy(   _dm_file);
if (_exists)                             _dm_file=undefined;
//ds_map_destroy(_dm_file); _dm_file=undefined;




*/
