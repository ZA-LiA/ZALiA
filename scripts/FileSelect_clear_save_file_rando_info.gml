/// FileSelect_clear_save_file_rando_info(save file num)


var _FILE_NUM = argument[0];


var _DATAKEY1 = STR_Save+STR_File+hex_str(_FILE_NUM);
var _datakey  = _DATAKEY1+STR_Rando+STR_Data;
if(!is_undefined( SaveFileRandoInfo_dm[?_datakey]))
{   ds_map_delete(SaveFileRandoInfo_dm, _datakey);  }

_datakey = _DATAKEY1+STR_Surface;
if(!is_undefined( SaveFileRandoInfo_dm[?_datakey]))
{
    if (surface_exists(SaveFileRandoInfo_dm[?_datakey]))
    {   surface_free(  SaveFileRandoInfo_dm[?_datakey]);  }
    
    ds_map_delete(SaveFileRandoInfo_dm, _datakey);
}




