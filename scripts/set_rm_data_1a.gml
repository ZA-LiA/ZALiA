/// set_rm_data_1a(rm name, file name part, *quest num)


var _i, _arg;

                           _arg=0;
var _SCENE_NAME = argument[_arg++];
var _FILE_NAME0 = argument[_arg++];
    _FILE_NAME0 = string_letters(_FILE_NAME0)+"_"+string_digits(_FILE_NAME0); // example: "_PalcA_003" --> "PalcA_003"
//
var                      _QUEST_NUM = 1;
if (argument_count>_arg) _QUEST_NUM = clamp(argument[_arg++], 1,2)


var _AREA = string_copy(_SCENE_NAME,1,AreaID_LEN);


// _FILE_NAME0 example: "PalcA_003"
g.dm_rm[?_SCENE_NAME+dk_FileName+STR_Quest+hex_str(_QUEST_NUM)] = _FILE_NAME0;
ds_list_add(dl_used_tiled_files,_FILE_NAME0);




//var                     _DATAKEY1=STR_Tile+STR_File+_FILE_NAME0;
    rm_w = val(global.dm_scene_wh[?_FILE_NAME0+STR_Width]);
    rm_h = val(global.dm_scene_wh[?_FILE_NAME0+STR_Height]);
if(!rm_w 
|| !rm_h 
||  (global.SceneRando_ItemPositioning_METHOD==2 && !QUICK_REINITIALIZE) )
{
    var _data;
    
    
    if(!rm_w) rm_w = $04<<8;
    if(!rm_h) rm_h = $01<<8;
    
    var _dm_file_data = -1;
    //  _FILE_NAME1 example: "rm_tile_data/PalcA/PalcA_003.json"
    var _FILE_NAME1 = "rm_tile_data/"+string_copy(_FILE_NAME0,1,5)+"/"+_FILE_NAME0+".json";
    if (file_exists(_FILE_NAME1))
    {
        _data  = "";
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
        var _j;
        var _datakey0,_datakey1;
        var _num, _clm,_row, _scene_clms,_scene_rows;
        var _pos;
        var _layer_name;
        var _ts_name, _dl_ts_data, _dm_ts_data;
        var _dl_tile, _tile_idx, _tile_count, _tile_data, _tsrc;
        var _dl_layer_data = val(_dm_file_data[?"layers"]);
        var _dm_layer_data;
        var _wall_ts_name, _wall_ts_idx;
        var _wall_part_data_was_set = false;
        var _dg_wall_part_data = ds_grid_create(0,0);
        
        var _dl_CORNER_TOPLFT = ds_list_create(); // Wall Corner Top-Left
        ds_list_add(_dl_CORNER_TOPLFT,$00,$04,$4C,$4E,$60,$64);
        
        var _dl_CORNER_TOPRGT = ds_list_create(); // Wall Corner Top-Right
        ds_list_add(_dl_CORNER_TOPRGT,$03,$07,$4D,$4F,$63,$67);
        
        var _dl_CORNER_BTMLFT = ds_list_create(); // Wall Corner Bottom-Left
        ds_list_add(_dl_CORNER_BTMLFT,$30,$34,$70,$74,$7C,$7E);
        
        var _dl_CORNER_BTMRGT = ds_list_create(); // Wall Corner Bottom-Right
        ds_list_add(_dl_CORNER_BTMRGT,$33,$37,$73,$77,$7D,$7F);
        
        var _dl_SIDE_TOP = ds_list_create(); // Wall Top
        ds_list_add(_dl_SIDE_TOP,$01,$02,$05,$06,$40,$41,$61,$62,$65,$66,$68,$69);
        
        var _dl_SIDE_BTM = ds_list_create(); // Wall Bottom
        ds_list_add(_dl_SIDE_BTM,$31,$32,$35,$36,$52,$53,$71,$72,$75,$76,$78,$79);
        
        var _dl_SIDE_LFT = ds_list_create(); // Wall Left
        ds_list_add(_dl_SIDE_LFT,$10,$14,$20,$24,$44,$54,$5C,$5E,$6A,$6C,$6E,$7A);
        
        var _dl_SIDE_RGT = ds_list_create(); // Wall Right
        ds_list_add(_dl_SIDE_RGT,$13,$17,$23,$27,$47,$57,$5D,$5F,$6B,$6D,$6F,$7B);
        
        var _dl_FILL = ds_list_create(); // Fill
        ds_list_add(_dl_FILL,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F);
        ds_list_add(_dl_FILL,$11,$12,$15,$16,$18,$19,$1A,$1B,$1C,$1D,$1E,$1F);
        ds_list_add(_dl_FILL,$21,$22,$25,$26,$28,$29,$2A,$2B,$2C,$2D,$2E,$2F);
        ds_list_add(_dl_FILL,$38,$39,$3A,$3B,$3C,$3D,$3E,$3F);
        ds_list_add(_dl_FILL,$42,$43,$45,$46,$48,$49,$4A,$4B);
        ds_list_add(_dl_FILL,$50,$51,$55,$56,$58,$59,$5A,$5B);
        //ds_list_add(_dl_FILL,$,$,$,$,$,$,$,$,$,$
        
        
        _scene_clms = _dm_file_data[?"width"];
        _scene_rows = _dm_file_data[?"height"];
        
        
        _wall_ts_idx = -1;
        _ts_name = "";
        _wall_ts_name = "";
        
        switch(_AREA){
        case Area_PalcA:{_wall_ts_name=background_get_name(ts_DungeonA01); break;}
        case Area_PalcB:{_wall_ts_name=background_get_name(ts_DungeonB01); break;}
        case Area_PalcC:{_wall_ts_name=background_get_name(ts_DungeonC01); break;}
        case Area_PalcD:{_wall_ts_name=background_get_name(ts_DungeonD01); break;}
        case Area_PalcE:{_wall_ts_name=background_get_name(ts_DungeonE01); break;}
        case Area_PalcF:{_wall_ts_name=background_get_name(ts_DungeonF01); break;}
        case Area_PalcG:{_wall_ts_name=background_get_name(ts_DungeonG01); break;}
        }
        
        _dl_ts_data = _dm_file_data[?"tilesets"];
        
        var          _TILESET_COUNT = ds_list_size(_dl_ts_data);
        for(_i=0; _i<_TILESET_COUNT; _i++) // Each tileset
        {
            _dm_ts_data = _dl_ts_data[|_i];
            _data       = _dm_ts_data[?"source"];
            // _dm_ts_data[?"source"] Example: "source":"..\/..\/..\/..\/..\/..\/Tiled\/Tilesets\/Z2_Remake_1a\/ts_Natural_1a_WRB.tsx
                _pos = string_pos(_wall_ts_name,_data);
            if (_pos)
            {
                _wall_ts_idx = _i;
                _ts_name = string_copy(_data, _pos, string_pos(".tsx",_data)-_pos);
                break;//_i
            }
        }
        
        
        
        var          _LAYER_COUNT = ds_list_size(_dl_layer_data);
        for(_i=0; _i<_LAYER_COUNT; _i++) // Each layer
        {
            _dm_layer_data = _dl_layer_data[|_i];
            _layer_name    = _dm_layer_data[?"name"];
            _layer_name    = string(_layer_name);
            
            
            if (string_pos("FGWALL01_01",_layer_name))
            {
                if (_wall_ts_idx!=-1)
                {
                    if(!ds_grid_width( _dg_wall_part_data))
                    {
                        ds_grid_resize(_dg_wall_part_data, _scene_clms,_scene_rows);
                        ds_grid_clear( _dg_wall_part_data,0);
                    }
                    
                    
                    _dl_tile = _dm_layer_data[?"data"];
                                 _tile_count = ds_list_size(_dl_tile);
                    for(_j=0; _j<_tile_count; _j++)
                    {
                        _clm = _j mod _scene_clms;
                        _row = _j div _scene_clms;
                        
                        _tile_data = _dl_tile[|_j];
                        if (_tile_data==0) continue; // 0 means no tile
                        
                        _tile_data--; // Tiled app adds 1 so it can't be 0
                        _tile_data &= $3FFFFFFF; // truncate the scale xy data
                        _tile_data  = abs(_tile_data);
                        
                        _tsrc = _tile_data&$FF;
                        
                        if ((_tile_data>>8)&$FF==_wall_ts_idx)
                        {
                                 if (ds_list_find_index(_dl_CORNER_TOPLFT,_tsrc)!=-1) _dg_wall_part_data[#_clm,_row] = $8|$2;
                            else if (ds_list_find_index(_dl_CORNER_TOPRGT,_tsrc)!=-1) _dg_wall_part_data[#_clm,_row] = $8|$1;
                            else if (ds_list_find_index(_dl_CORNER_BTMLFT,_tsrc)!=-1) _dg_wall_part_data[#_clm,_row] = $4|$2;
                            else if (ds_list_find_index(_dl_CORNER_BTMRGT,_tsrc)!=-1) _dg_wall_part_data[#_clm,_row] = $4|$1;
                            else if (ds_list_find_index(_dl_SIDE_TOP,     _tsrc)!=-1) _dg_wall_part_data[#_clm,_row] = $8;
                            else if (ds_list_find_index(_dl_SIDE_BTM,     _tsrc)!=-1) _dg_wall_part_data[#_clm,_row] = $4;
                            else if (ds_list_find_index(_dl_SIDE_LFT,     _tsrc)!=-1) _dg_wall_part_data[#_clm,_row] = $2;
                            else if (ds_list_find_index(_dl_SIDE_RGT,     _tsrc)!=-1) _dg_wall_part_data[#_clm,_row] = $1;
                            else if (ds_list_find_index(_dl_FILL,         _tsrc)!=-1) _dg_wall_part_data[#_clm,_row] = $10;
                            
                            
                            if(!_wall_part_data_was_set) _wall_part_data_was_set = _dg_wall_part_data[#_clm,_row]!=0;
                            if (_wall_part_data_was_set)
                            {
                                global.dm_scene_wall_data[?dk_WallStyle+"01"+_FILE_NAME0+_layer_name] = true;
                                global.dm_scene_wall_data[?dk_WallStyle+"02"+_FILE_NAME0+_layer_name] = true;
                            }
                            
                            
                            _datakey0 = _FILE_NAME0+"_FGWALL";
                            if (is_undefined(global.dm_scene_wall_data[?_datakey0+STR_Clm+"_XL"]))
                            {                global.dm_scene_wall_data[?_datakey0+STR_Clm+"_XL"] = _clm;  }
                            else             global.dm_scene_wall_data[?_datakey0+STR_Clm+"_XL"] = min(global.dm_scene_wall_data[?_datakey0+STR_Clm+"_XL"], _clm);
                            global.dm_scene_wall_data[?_datakey0+STR_Clm+"_XR"] = max(val(global.dm_scene_wall_data[?_datakey0+STR_Clm+"_XR"]), _clm+1);
                            
                            if (is_undefined(global.dm_scene_wall_data[?_datakey0+STR_Row+"_YT"]))
                            {                global.dm_scene_wall_data[?_datakey0+STR_Row+"_YT"] = _row;  }
                            else             global.dm_scene_wall_data[?_datakey0+STR_Row+"_YT"] = min(global.dm_scene_wall_data[?_datakey0+STR_Row+"_YT"], _row);
                            global.dm_scene_wall_data[?_datakey0+STR_Row+"_YB"] = max(val(global.dm_scene_wall_data[?_datakey0+STR_Row+"_YB"]), _row+1);
                        }
                    }//_j
                }
            }
            else
            {
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
                    
                    //break;//_i
                }
            }
        }//_i
        
        
        
        
        if (_wall_part_data_was_set) global.dm_scene_wall_data[?_FILE_NAME0+STR_Wall+STR_Part+STR_Data] = ds_grid_write(_dg_wall_part_data);
        
        
        
        
        ds_map_destroy(_dm_file_data); _dm_file_data=undefined;
        ds_grid_destroy(_dg_wall_part_data); _dg_wall_part_data=undefined;
        
        ds_list_destroy(_dl_CORNER_TOPLFT); _dl_CORNER_TOPLFT=undefined;
        ds_list_destroy(_dl_CORNER_TOPRGT); _dl_CORNER_TOPRGT=undefined;
        ds_list_destroy(_dl_CORNER_BTMLFT); _dl_CORNER_BTMLFT=undefined;
        ds_list_destroy(_dl_CORNER_BTMRGT); _dl_CORNER_BTMRGT=undefined;
        ds_list_destroy(_dl_SIDE_TOP); _dl_SIDE_TOP=undefined;
        ds_list_destroy(_dl_SIDE_BTM); _dl_SIDE_BTM=undefined;
        ds_list_destroy(_dl_SIDE_LFT); _dl_SIDE_LFT=undefined;
        ds_list_destroy(_dl_SIDE_RGT); _dl_SIDE_RGT=undefined;
        ds_list_destroy(_dl_FILL); _dl_FILL=undefined;
    }
    
    
    global.dm_scene_wh[?_FILE_NAME0+STR_Width]  = rm_w;
    global.dm_scene_wh[?_FILE_NAME0+STR_Height] = rm_h;
}




rm_w_ = rm_w>>1;
rm_h_ = rm_h>>1;




