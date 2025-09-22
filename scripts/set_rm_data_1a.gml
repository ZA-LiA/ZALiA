/// set_rm_data_1a(rm name, file name part, *quest num)


var _i, _arg;

                           _arg=0;
var _SCENE_NAME = argument[_arg++];
var _FILE_NAME0 = argument[_arg++];
    _FILE_NAME0 = string_letters(_FILE_NAME0)+"_"+string_digits(_FILE_NAME0); // example: "_PalcA_003" --> "PalcA_003"
//
var                      _QUEST_NUM = 1;
if (argument_count>_arg) _QUEST_NUM = clamp(argument[_arg++], 1,2)

// _FILE_NAME0 example: "PalcA_003"
g.dm_rm[?_SCENE_NAME+dk_FileName+STR_Quest+hex_str(_QUEST_NUM)] = _FILE_NAME0;
ds_list_add(dl_used_tiled_files,_FILE_NAME0);




//var                     _DATAKEY1=STR_Tile+STR_File+_FILE_NAME0;
    rm_w = val(global.dm_scene_wh[?_FILE_NAME0+STR_Width]);
    rm_h = val(global.dm_scene_wh[?_FILE_NAME0+STR_Height]);
if(!rm_w 
|| !rm_h 
||  global.SceneRando_ItemPositioning_METHOD==2 )
{
    if(!rm_w) rm_w = $04<<8;
    if(!rm_h) rm_h = $01<<8;
    
    var _dm_file_data = -1;
    //  _FILE_NAME1 example: "rm_tile_data/PalcA/PalcA_003.json"
    var _FILE_NAME1 = "rm_tile_data/"+string_copy(_FILE_NAME0,1,5)+"/"+_FILE_NAME0+".json";
    if (file_exists(_FILE_NAME1))
    {
        var _data  = "";
        var _FILE  = file_text_open_read(_FILE_NAME1);
        while(      !file_text_eof(   _FILE)) 
        {   _data += file_text_readln(_FILE);  }
                     file_text_close( _FILE);
        _dm_file_data = json_decode(_data);
        
        if (_dm_file_data!=-1) // `json_decode` returns -1 if it fails
        {
            rm_w = val(_dm_file_data[?"width"],  rm_w>>3);
            rm_w = rm_w<<3;
            
            rm_h = val(_dm_file_data[?"height"], rm_h>>3);
            rm_h = rm_h<<3;
        }
    }
    
    if(!file_exists(_FILE_NAME1) 
    ||  _dm_file_data==-1 ) // `json_decode` returns -1 if it fails
    {
        show_debug_message("");
        show_debug_message("************************************************************************************************");
        show_debug_message("set_rm_data_1a().  !!!! WARNING !!!!  Could not get tile data for '"+_FILE_NAME1+"',  scene: "+_SCENE_NAME);
        show_debug_message("************************************************************************************************");
        show_debug_message("");
    }
    
    
    
    
    if (_dm_file_data!=-1)
    {
        var _datakey0,_datakey1;
        var _num, _clm,_row;
        var _layer_name;
        var _dl_tile, _tile_idx, _tile_count, _tile_data, _tsrc;
        var _dl_layer_data = val(_dm_file_data[?"layers"]);
        var _dm_layer_data;
        
        var          _LAYER_COUNT = ds_list_size(_dl_layer_data);
        for(_i=0; _i<_LAYER_COUNT; _i++) // Each layer
        {
            _dm_layer_data = _dl_layer_data[|_i];
            _layer_name    = _dm_layer_data[?"name"];
            _layer_name    = string(_layer_name);
            if (string_pos("_Item_Position_Options",_layer_name) 
            ||  string_pos("ItemPositions01",_layer_name) )
            {
                _dl_tile = _dm_layer_data[?"data"];
                _tile_count = ds_list_size(_dl_tile);
                for(_tile_idx=0; _tile_idx<_tile_count; _tile_idx++)
                {
                    _tile_data = _dl_tile[|_tile_idx];
                    if (_tile_data) // 0 means no tile
                    {
                        _tile_data--; // Tiled app adds 1 so it can't be 0
                        _tile_data &= $3FFFFFFF; // truncate the scale xy data
                        _tile_data  = abs(_tile_data);
                        
                        _tsrc = _tile_data&$FF;
                        if (_tsrc==$EE   // $EE: Upper-left tile of RED    heart graphic in `ts_tile_marker_1a_8x8`. Represents a position for an item with no conditions for any path to it.
                        //||  _tsrc==$2E   // $2E: Upper-left tile of ORANGE heart graphic in `ts_tile_marker_1a_8x8`. Represents a position for an item with only the GLOVE item can get to
                        ||  _tsrc==$0E ) // $0E: Upper-left tile of BLUE   heart graphic in `ts_tile_marker_1a_8x8`. Represents a position for an item with only a JUMP spell condition
                        {
                            _clm = _tile_idx mod (rm_w>>3);
                            _row = _tile_idx div (rm_w>>3);
                            _clm++; // center on heart for item's xc
                            _row++; // center on heart for item's yc
                            
                            _datakey0 = _SCENE_NAME+"_Safe"+STR_Item+STR_Position;
                            _datakey1 = _datakey0+STR_Count;
                            _num = val(global.dm_scene_rando[?_datakey1]) + 1;
                            global.dm_scene_rando[?_datakey1] = _num;
                            
                            _datakey1 = _datakey0+hex_str(_num);
                            global.dm_scene_rando[?_datakey1+"_XC"] = _clm<<3;
                            global.dm_scene_rando[?_datakey1+"_YC"] = _row<<3;
                            
                            switch(_tsrc){
                            case $EE:{global.dm_scene_rando[?_datakey1+STR_Conditions+STR_Type]=STR_None; break;}
                            //case $2E:{global.dm_scene_rando[?_datakey1+STR_Conditions+STR_Type]=STR_GLOVE; break;}
                            case $0E:{global.dm_scene_rando[?_datakey1+STR_Conditions+STR_Type]=STR_JUMP; break;}
                            }
                        }
                    }                
                }//_tile_idx
                
                break;//_i
            }
        }//_i
        
        ds_map_destroy(_dm_file_data); _dm_file_data=undefined;
    }
    
    
    global.dm_scene_wh[?_FILE_NAME0+STR_Width]  = rm_w;
    global.dm_scene_wh[?_FILE_NAME0+STR_Height] = rm_h;
}




rm_w_ = rm_w>>1;
rm_h_ = rm_h>>1;




