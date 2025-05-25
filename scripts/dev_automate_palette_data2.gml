/// dev_automate_palette_data2()


var _i,_j,_k,_m, _a,_b,_c, _val, _count;
var _len,_len1,_len2, _line_len;
var _str,_str1,_str2,_str3, _char;
var _pos,_pos1,_pos2;
var _datakey,_datakey1,_datakey2;
var _rm_w,_rm_h;
var _palette1,_palette2, _palette_count;
var _color1;
var _area, _rm_name;
var _file, _file_name, _area_file_num_, _file_data, _data;
var _layer_name, _data_system_ver;
var _dm_file = ds_map_create();
var _dm_layer, _dl_layer;
var _STR1="***********************";
var _STR2="----------------------------";
var _STR3="//                         [                                      BGR1                                      ]  +  [                                      BGR2                                      ]  +  [                                      BGR3                                      ]  +  [                                      BGR4                                      ]";

var _dl_areas = ds_list_create();
//ds_list_add(_dl_areas,Area_WestA,Area_EastA,Area_DthMt,Area_MazIs); // general areas
//ds_list_add(_dl_areas,Area_TownA,Area_TownB); // all towns
//ds_list_add(_dl_areas,Area_PalcA,Area_PalcB,Area_PalcC,Area_PalcD,Area_PalcE,Area_PalcF,Area_PalcG,Area_PalcH); // all dungeons
ds_list_copy(_dl_areas,g.dl_AREA_NAME); // all areas

var _SINGLE_SCENE = undefined;
//_SINGLE_SCENE = Area_TownA+"129"; // use this line only for getting data for a single scene


repeat(1) sdm("");

//sdm("var _SET1 = global.PAL_COL_SET_A;");
repeat(4) sdm("");

var          _AREA_COUNT = ds_list_size(_dl_areas);
for(_i=0; _i<_AREA_COUNT; _i++)
{
    _area = _dl_areas[|_i];
    sdm(_STR3);
    sdm("// "+_STR1+"  "+_area+"  "+_STR1);
    
    for(_j=0; _j<$100; _j++) // num of possible scenes in this area
    {
        _area_file_num_  = string_repeat("0",3-string_length(string(_j)));
        _area_file_num_ += string(_j);
        sdm("//  "+_STR2+"  "+_area_file_num_+"  "+_STR2);
        
        //_file_name example: "PalcA_003"
        if(!is_undefined(_SINGLE_SCENE))
        {
            _area_file_num_ = string_copy(_SINGLE_SCENE, string_length(_SINGLE_SCENE)-2, 3);
            _area = string_copy(_SINGLE_SCENE, 1,AreaID_LEN);
            //_area_file_num_ = "100";
            //_area = Area_EastA;
        }
        
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
            _dm_file = json_decode(_file_data);
            _data_system_ver = 3;
            _dl_layer = _dm_file[?"layers"];
            if(!is_undefined(_dl_layer))
            {
                _count = ds_list_size(_dl_layer);
                for(_k=0; _k<_count; _k++) // each layer
                {
                    _dm_layer = _dl_layer[|_k];
                    _layer_name = val(_dm_layer[?"name"], "");
                    if (string_pos("tile_data_system", _layer_name))
                    {
                        _data_system_ver = str_hex(string_copy(_layer_name, string_pos("v.", _layer_name)+2, 2));
                        break;//_k
                    }
                }
            }
            
            
            _palette1 = get_palette_via_file_data(_file_data); // just bgr palettes from Tiled file
            if(!is_undefined(_palette1))
            {
                _str = "_dm[?'"+_file_name+"'] = ";
                _palette_count = string_length(_palette1) div global.PAL_CHAR_PER_PAL;
                //sdm("_data_system_ver "+string(_data_system_ver)+", _palette_count $"+hex_str(_palette_count));
                
                for(_k=0; _k<_palette_count; _k++) // each palette
                {
                    _palette2 = string_copy(_palette1, (global.PAL_CHAR_PER_PAL*_k)+1, global.PAL_CHAR_PER_PAL);
                    //sdm("_palette2: "+_palette2);
                    _str2 = "build_pal(";
                    for(_m=0; _m<global.COLORS_PER_PALETTE; _m++) // each color of this palette
                    {
                        _str3 = "";
                        //if (_data_system_ver>=4 ||  _m )
                        _color1 = string_copy(_palette2, (global.PAL_CHAR_PER_COLOR*_m)+1, global.PAL_CHAR_PER_COLOR);
                        if (_color1!=C_BLK0_ 
                        ||  string_char_at(global.PAL_BASE_COLOR_ORDER,_m+1)=="K" )
                        {
                            switch(_color1){
                            case C_WHT0_:{_str3=" C_WHT0_"; break;}
                            case C_RED0_:{_str3=" C_RED0_"; break;}
                            case C_BLU0_:{_str3=" C_BLU0_"; break;}
                            case C_GRN0_:{_str3=" C_GRN0_"; break;}
                            case C_YLW0_:{_str3=" C_YLW0_"; break;}
                            case C_MGN0_:{_str3=" C_MGN0_"; break;}
                            case C_BLK0_:{_str3=" C_BLK0_"; break;}
                            case C_CYN0_:{_str3=" C_CYN0_"; break;}
                            }
                        }
                        
                        if (string_length(_str3)) _str2 += _str3;
                        else                      _str2 += "'"+_color1+"'";
                        
                        if (_m<global.COLORS_PER_PALETTE-1) _str2 += ",";
                        //if (_m<global.COLORS_PER_PALETTE-1) _str2 += "+";
                        //if (_data_system_ver<4 ||  _m<global.COLORS_PER_PALETTE-1 ) _str2 += "+";
                    }
                    
                    //if (_data_system_ver<4) _str2 += "_SET1";
                    
                    _str += _str2;
                    _str += ")";
                    if (_k<_palette_count-1) _str += "  +  ";
                }
                _str += ";";
                sdm(_str);
                //sdm("p.dm_scene_palette[?'"+_file_name+"'] = '"+_palette1+"';");
            }
            //sdm("g.dm_rm[?STR_Tile+STR_File+'"+_file_name+"'+STR_Width ] = $"+hex_str(_rm_w>>8)+"<<8; // ");
        }
        
        //sdm("");
        //if (_j && !(_j&$F)){sdm("");sdm("");}
        if(!is_undefined(_SINGLE_SCENE)) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    
    repeat(8) sdm("");
}
//dm_scene_palette[?'WestA_000'] = build_pal('FCFCFC'+'BCBCBC'+'747474'+C_BLK0_ +C_YLW0_ +C_MGN0_ +C_BLK0_ +C_CYN0_   +  'FC88CC'+'9C0044'+C_BLK0_ +C_BLK0_ +C_YLW0_ +C_MGN0_ +C_BLK0_ +C_CYN0_   +  'B0BCFC'+'0028D8'+'00087C'+C_BLK0_ +C_YLW0_ +C_MGN0_ +C_BLK0_ +C_CYN0_   +  'FCFCFC'+'D8E800'+'5C3C18'+C_BLK0_ +C_YLW0_ +C_MGN0_ +C_BLK0_ +C_CYN0_ ;


ds_map_destroy(_dm_file); _dm_file=undefined;
ds_list_destroy(_dl_areas); _dl_areas=undefined;




