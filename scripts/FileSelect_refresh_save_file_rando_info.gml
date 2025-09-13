/// FileSelect_refresh_save_file_rando_info(save file num)


var _FILE_NUM = argument[0];


FileSelect_clear_save_file_rando_info(_FILE_NUM);

var _DATAKEY1 = STR_Save+STR_File+hex_str(_FILE_NUM);
SaveFileRandoInfo_dm[?_DATAKEY1+STR_Surface] = 0;

var _file_data = global.dm_save_file_data[?_DATAKEY1+STR_Encoded];
if (is_undefined(_file_data))
{
    var _FILE_NAME = f.dl_file_names[|_FILE_NUM-1];
    var _FILE      = file_text_open_read(working_directory+_FILE_NAME);
    _file_data     = file_text_read_string(_FILE);
                     file_text_close(      _FILE);
}

var _dm_FILE = json_decode(_file_data);
if (_dm_FILE!=-1)
{
    var _QUEST_NUM = val(_dm_FILE[?STR_File+STR_Start+STR_Quest]);
    var _datakey = STR_Quest+hex_str(_QUEST_NUM);
    
    if (val(_dm_FILE[?_datakey+STR_Rando+STR_Active]))
    {
        var              _rando_data = _dm_FILE[?_datakey+STR_Rando+STR_Data];
        if(!is_undefined(_rando_data))
        {
            var _dm_Rando = json_decode(_rando_data);
            if (_dm_Rando!=-1)
            {
                _rando_data = _dm_Rando[?STR_Rando+STR_Settings];
                if(!is_undefined(_rando_data)) SaveFileRandoInfo_dm[?_DATAKEY1+STR_Rando+STR_Data] = _rando_data;
                
                ds_map_destroy(_dm_Rando); _dm_Rando=undefined;
            }
        }
    }
    
    ds_map_destroy(_dm_FILE); _dm_FILE=undefined;
}




