/// set_rm_data_1a(rm name, file name part, *quest num)


var _i, _arg;

                          _arg=0;
var   _RM_NAME = argument[_arg++];
var _FILE_NAME = argument[_arg++];
    _FILE_NAME = string_letters(_FILE_NAME)+"_"+string_digits(_FILE_NAME); // "_PalcA_003" --> "PalcA_003"
//
var                      _QUEST_NUM = 1;
if (argument_count>_arg) _QUEST_NUM = clamp(argument[_arg++], 1,2)

// _FILE_NAME example: "PalcA_003"
g.dm_rm[?_RM_NAME+dk_FileName+STR_Quest+hex_str(_QUEST_NUM)] = _FILE_NAME;
ds_list_add(dl_used_tiled_files,_FILE_NAME);


var                     _DATAKEY1=STR_Tile+STR_File+_FILE_NAME;
    rm_w = val(g.dm_rm[?_DATAKEY1+STR_Width]);
    rm_h = val(g.dm_rm[?_DATAKEY1+STR_Height]);
if(!rm_w 
|| !rm_h )
{
    if(!rm_w) rm_w = $04<<8;
    if(!rm_h) rm_h = $01<<8;
    
    var _FILE  = "rm_tile_data";
        _FILE += "/";
        _FILE += string_letters(_FILE_NAME); // get "PalcA" from "PalcA_003"
        _FILE += "/";
        _FILE += _FILE_NAME;
        _FILE += ".json";
    //  _FILE example:  "rm_tile_data/PalcA/PalcA_003.json"
    if (file_exists(_FILE))
    {
        _FILE =    file_text_open_read(_FILE);
        var _DATA = "";
        while(    !file_text_eof(      _FILE)) 
        {   _DATA+=file_text_readln(   _FILE);  }
                   file_text_close(    _FILE);
        //
        var            _dm_FILE_DATA=json_decode(_DATA);
        rm_w =     val(_dm_FILE_DATA[?"width"],  rm_w>>3);
        rm_h =     val(_dm_FILE_DATA[?"height"], rm_h>>3);
        ds_map_destroy(_dm_FILE_DATA); _dm_FILE_DATA=undefined;
        
        rm_w = rm_w<<3;
        rm_h = rm_h<<3;
    }
    else
    {
        sdm("");
        sdm("************************************************************************************************");
        sdm("set_rm_data_1a(): "+"!!! WARNING !!!  "+"Could NOT get tile data for '"+_FILE_NAME+"'"+",  rm: "+_RM_NAME);
        sdm("************************************************************************************************");
        sdm("");
    }
    
    g.dm_rm[?_DATAKEY1+STR_Width]  = rm_w;
    g.dm_rm[?_DATAKEY1+STR_Height] = rm_h;
}


rm_w_ = rm_w>>1;
rm_h_ = rm_h>>1;




