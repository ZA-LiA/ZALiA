/// p_init_palette_data()


var _datakey;
var _REINITIALIZING = false; // *** SET true TO RUN THIS IN CASE A SCENE'S PALETTE DATA HAS CHANGED ***


var             _FILE_NAME1 = "PaletteData01.txt"; // use %localappdata% directory so user can save edited palettes
//var             _FILE_NAME1 = 'other/PaletteData01.txt';
if (file_exists(_FILE_NAME1))
{
    var _FILE      = file_text_open_read(working_directory+_FILE_NAME1);
    var _FILE_DATA = file_text_read_string(_FILE);
                     file_text_close(      _FILE);
    dm_scene_palette = json_decode(_FILE_DATA);
}








// ***********************  _Title_  ***********************
//  ----------------------------  000  ----------------------------
_datakey = 'Title_000'+dk_BGR;
if (_REINITIALIZING 
||  is_undefined(dm_scene_palette[?_datakey]) )
{   //                            [                                      BGR1                                      ]  +  [                                      BGR2                                      ]  +  [                                      BGR3                                      ]  +  [                                      BGR4                                      ]
    dm_scene_palette[?_datakey] = build_pal('BCE89E','747474','010101','010101', C_YLW0_, C_MGN0_, C_BLK0_, C_CYN0_)  +  build_pal('EC3820','005000','010101','010101', C_YLW0_, C_MGN0_, C_BLK0_, C_CYN0_)  +  build_pal('FCBC3C','EC3820','A80000','010101', C_YLW0_, C_MGN0_, C_BLK0_, C_CYN0_)  +  build_pal('FCFCFC','3E3E3E','888000','010101', C_YLW0_, C_MGN0_, C_BLK0_, C_CYN0_);
}








// --------------------------------------------------------------------------------------------------------

if (_REINITIALIZING 
|| !file_exists(_FILE_NAME1) )
{
    var _i,_j, _palette1, _area;
    var _file, _file_name, _area_file_num_, _file_data;
    var _SINGLE_SCENE = undefined;
    //_SINGLE_SCENE = Area_TownA+"129"; // use this line only when getting data for a single scene
    
    
    var          _AREA_COUNT = ds_list_size(g.dl_AREA_NAME);
    for(_i=0; _i<_AREA_COUNT; _i++)
    {
        _area = g.dl_AREA_NAME[|_i];
        
        for(_j=0; _j<$100; _j++) // num of possible scenes in this area
        {
            _area_file_num_  = string_repeat("0",3-string_length(string(_j)));
            _area_file_num_ += string(_j);
            
            if(!is_undefined(_SINGLE_SCENE))
            {
                _area_file_num_ = string_copy(_SINGLE_SCENE, string_length(_SINGLE_SCENE)-2, 3);
                _area = string_copy(_SINGLE_SCENE, 1,AreaID_LEN);
            }
            
            _file_name  = string_letters(_area); // get "PalcA" from "_PalcA_"
            _file_name += "_";
            _file_name += _area_file_num_;
            // _file_name example: "PalcA_003"
            
            _file  = "rm_tile_data";
            _file += "/";
            _file += string_letters(_area); // get "PalcA" from "_PalcA_"
            _file += "/";
            _file += _file_name; // "PalcA_003"
            _file += ".json";
            // _file example: "rm_tile_data/PalcA/PalcA_003.json"
            
            if (file_exists(_file))
            {
                    _file =       file_text_open_read(_file);
                    _file_data  = "";
                while(           !file_text_eof(   _file)) 
                {   _file_data += file_text_readln(_file);  }
                                  file_text_close( _file);
                //
                _palette1 = get_palette_via_file_data(_file_data); // just bgr palettes from Tiled file
                if(!is_undefined(_palette1)) dm_scene_palette[?_file_name+dk_BGR] = _palette1;
            }
            
            if(!is_undefined(_SINGLE_SCENE))
            {
                _i = _AREA_COUNT;
                break;//_j
            }
        }
    }
    
    
    
    
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    if (ds_map_size(dm_scene_palette))
    {
        var _ENCODED = json_encode(dm_scene_palette);
        _file = file_text_open_write(working_directory+_FILE_NAME1);
                file_text_write_string(_file, _ENCODED);
                file_text_close(       _file);
    }
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
}




