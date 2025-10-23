/// p_init_palette_data()


var _file, _file_data;
var _REINITIALIZING = true; // *** SET true TO RUN THIS IN CASE A SCENE'S PALETTE DATA HAS CHANGED ***
var _FILE_NAME0 = "PaletteData01.txt"; // use %localappdata% directory so user can save edited palettes
//var _FILE_NAME0 = 'other/PaletteData01.txt';




if(!_REINITIALIZING 
&&  file_exists(_FILE_NAME0) 
&&  global.LAST_APP_SESSION_APP_VER==GM_version ) // because PaletteData01.txt is stored in %localappdata%, it needs to be updated at runtime
{
    _file      = file_text_open_read(working_directory+_FILE_NAME0);
    _file_data = file_text_read_string(_file);
                 file_text_close(      _file);
    var _dm = json_decode(_file_data);
    if (_dm!=-1)
    {
        ds_map_copy(dm_scene_palette, _dm);
        ds_map_destroy(_dm); _dm=undefined;
    }
    //dm_scene_palette = json_decode(_file_data);
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// --------------------------------------------------------------------------------
var _i,_j, _val, _area, _palette1;
var _file_name,_file_name1, _area_file_num_;
var _SINGLE_SCENE = undefined;
//_SINGLE_SCENE = Area_TownA+"129"; // use this line only when getting data for a single scene

var _dl_area = ds_list_create();
ds_list_copy(_dl_area, g.dl_AREA_NAME);
if (ds_list_find_index(_dl_area,Area_Title)==-1) ds_list_insert(_dl_area, 0, Area_Title);

_val = build_pal(C_RED3,C_GRY4,C_BLK1,C_BLK1,-2,-2,-2,-2);
_palette1 = "";
repeat(val(global.dm_pi[?"BGR"+STR_Count])) _palette1 += _val;
var _DEFAULT_PAL = _palette1;


var          _AREA_COUNT = ds_list_size(_dl_area);
for(_i=0; _i<_AREA_COUNT; _i++)
{
    _area = _dl_area[|_i];
    
    for(_j=0; _j<$100; _j++) // num of possible scenes in this area
    {
        _area_file_num_  = string_repeat("0",3-string_length(string(_j)));
        _area_file_num_ += string(_j);
        
        if(!is_undefined(_SINGLE_SCENE))
        {
            _area_file_num_ = string_copy(_SINGLE_SCENE, string_length(_SINGLE_SCENE)-2, 3);
            _area = string_copy(_SINGLE_SCENE, 1,AreaID_LEN);
        }
        
        // `_file_name` example: "PalcA_003"
        _file_name  = string_letters(_area); // get "PalcA" from "_PalcA_"
        _file_name += "_";
        _file_name += _area_file_num_;
        
        // `_file_name1` example: "rm_tile_data/PalcA/PalcA_003.json"
        _file_name1 = "rm_tile_data/"+string_copy(_file_name,1,5)+"/"+_file_name+".json";
        /*
        // `_file_name1` example: "PalcA_003.json"
        _file_name1 = _file_name+".json";
        */
        
        if (file_exists(_file_name1))
        {
                _file_data  = "";
                _file       = file_text_open_read(_file_name1);
            while(           !file_text_eof(   _file)) 
            {   _file_data += file_text_readln(_file);  }
                              file_text_close( _file);
            //
            _palette1 = get_palette_via_file_data(_file_data); // just bgr palettes from Tiled file
            //_palette1 = get_palette_via_file_data(_file_data, _file_name); // just bgr palettes from Tiled file
            if (is_undefined(_palette1)) _palette1 = _DEFAULT_PAL;
            dm_scene_palette[?_file_name+dk_BGR] = _palette1;
        }
        /*
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
            if (is_undefined(_palette1)) _palette1 = _DEFAULT_PAL;
            dm_scene_palette[?_file_name+dk_BGR] = _palette1;
        }
        */
        
        if(!is_undefined(_SINGLE_SCENE))
        {
            _i = _AREA_COUNT;
            break;//_j
        }
    }
}




// -------------------------------------------------------------------
if (ds_map_size(dm_scene_palette))
{
    _file_data = json_encode(dm_scene_palette);
    _file = file_text_open_write(working_directory+_FILE_NAME0);
            file_text_write_string(_file, _file_data);
            file_text_close(       _file);
}
// -------------------------------------------------------------------


ds_list_destroy(_dl_area); _dl_area=undefined;




