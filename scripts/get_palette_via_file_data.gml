/// get_palette_via_file_data(encoded file data, *scene name, *quest num)


var                    _arg = -1;
var _data = argument[++_arg]; // pass 0 to have this open the file for the data

var _palette1 = undefined;


if(!is_string(_data))
{
    if (argument_count>_arg+1 && is_string(argument[++_arg])) var _SCENE_NAME = argument[_arg];
    else                                                      var _SCENE_NAME = g.rm_name;
    
    if (argument_count>_arg+1) var _QUEST_NUM = argument[++_arg];
    else                       var _QUEST_NUM = g.file_data_quest_num;
    
    _data = rm_get_file_data(_SCENE_NAME, _QUEST_NUM);
    if (is_undefined(_data))
    {
        return _palette1;
    }
}




var _palette2 = undefined;


var _dm_FILE = json_decode(_data);
if (_dm_FILE!=-1)
{
    var _dl_layer = _dm_FILE[?"layers"];
    if(!is_undefined(_dl_layer))
    {
        var _i,_j,_k, _idx, _count,_count1,_count2;
        var _clms;
        var _tsrc = 0;
        var _data_system_ver = 3;
        var _layer_name;
        var _LAYER_COUNT = ds_list_size(_dl_layer);
        var _dm_layer;
        var _color, _base_color_char;
        var _c_wht, _c_red, _c_blu, _c_grn, _c_ylw, _c_mgn, _c_blk, _c_cyn;
        
        
        
        
        for(_i=0; _i<_LAYER_COUNT; _i++) // each layer
        {
            _dm_layer = _dl_layer[|_i];
            _layer_name = val(_dm_layer[?"name"], "");
            
            if (string_pos("tile_data_system", _layer_name))
            {
                _data_system_ver = str_hex(string_copy(_layer_name, string_pos("v.", _layer_name)+2, 2));
                //if (_data_system_ver==4){var _FILE_NAME = argument[1]; sdm("tile_data_system 4:  "+_FILE_NAME);}
                break;//_i
            }
        }
        
        
        
        
        for(_i=0; _i<_LAYER_COUNT; _i++) // each layer
        {
            _dm_layer = _dl_layer[|_i];
            _layer_name = _dm_layer[?"name"];
            if(!is_undefined(        _layer_name) 
            &&  string_pos("palette",_layer_name) )
            {
                var _dl_tile = _dm_layer[?"data"];
                _clms = _dm_FILE[?"width"];
                
                if(!is_undefined(_dl_tile) 
                && !is_undefined(_clms) )
                {
                    _idx  = 0;
                    _tsrc = 0;
                    
                    _palette1 = "";
                    _palette2 = "";
                    
                    _count = val(global.dm_pi[?"BGR"+STR_Count]);
                    for(_j=0; _j<_count; _j++) // each palette (clm)
                    {
                        _c_wht = p.C_WHT0;
                        _c_red = p.C_RED0;
                        _c_blu = p.C_BLU0;
                        _c_grn = p.C_GRN0;
                        _c_ylw = p.C_YLW0;
                        _c_mgn = p.C_MGN0;
                        _c_blk = p.C_BLK0;
                        _c_cyn = p.C_CYN0;
                        
                        for(_k=0; _k<global.COLORS_PER_PALETTE; _k++) // each color (row)
                        {
                            _base_color_char = string_char_at(global.PAL_BASE_COLOR_ORDER,_k+1);
                            
                            _idx = (_clms*_k) + _j;
                            _idx++; // +1 to skip base color column
                            if (_data_system_ver<4)
                            {
                                _idx++; // +1 to skip gui colors column
                                _idx += _clms; // first row is GRN0 and is always black
                            }
                            
                            _tsrc = _dl_tile[|_idx];
                            if (_tsrc!=0) // 0 means no tile here
                            {
                                _tsrc--;
                                _tsrc  = abs(_tsrc&$3FFFFFFF); // just incase x or y flipped
                                _tsrc &= $FF;
                                if (_data_system_ver>=4)
                                //if (string_pos("palette v2",_layer_name))
                                {
                                    _idx  = (_tsrc>>4)&$F;
                                    _idx *= p.ColorGrid_CLMS;
                                    _idx += _tsrc&$F;
                                    _color = color_str(global.dl_COLOR01[|_idx]);
                                }
                                else
                                {
                                    _color = color_str(p.dl_COLOR[|_tsrc]);
                                }
                            }
                            else
                            {
                                if (_base_color_char=="G") _color = p.C_BLK1;
                                else                       _color = get_pal_color(p.PAL_BASE,0,_base_color_char);
                            }
                            
                            switch(_base_color_char){
                            case "W":{_c_wht=_color; break;}
                            case "R":{_c_red=_color; break;}
                            case "B":{_c_blu=_color; break;}
                            case "G":{_c_grn=_color; break;}
                            case "Y":{_c_ylw=_color; break;}
                            case "M":{_c_mgn=_color; break;}
                            case "K":{_c_blk=_color; break;}
                            case "C":{_c_cyn=_color; break;}
                            }
                        }
                        
                        
                        _palette1  = build_pal(_c_wht, _c_red, _c_blu, _c_grn, _c_ylw, _c_mgn, _c_blk, _c_cyn);
                        _palette2 += _palette1;
                        //sdm("_c_wht "+color_str(_c_wht)+", _c_red "+color_str(_c_red)+", _c_blu "+color_str(_c_blu)+", _c_grn "+color_str(_c_grn)+", _c_ylw "+color_str(_c_ylw)+", _c_mgn "+color_str(_c_mgn)+", _c_blk "+color_str(_c_blk)+", _c_cyn "+color_str(_c_cyn));
                        //sdm("_palette1: "+_palette1);
                    }
                }
            }
            
            
            if(!is_undefined(_palette2))
            {
                break;//_i
            }
        }
    }
    
    
    ds_map_destroy(_dm_FILE); _dm_FILE=undefined;
}




return _palette2;




