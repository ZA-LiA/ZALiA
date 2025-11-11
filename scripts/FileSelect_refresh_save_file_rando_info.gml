/// FileSelect_refresh_save_file_rando_info(save file num)


var _FILE_NUM = argument[0];


FileSelect_clear_save_file_rando_info(_FILE_NUM);

var _DATAKEY0 = STR_Save+STR_File+hex_str(_FILE_NUM);
SaveFileRandoInfo_dm[?_DATAKEY0+STR_Surface] = 0;


var _file_data = global.dm_save_file_data[?_DATAKEY0+STR_Encoded];
if (is_undefined(_file_data))
{
    var _FILE_NAME = f.dl_file_names[|_FILE_NUM-1];
    if (file_exists(_FILE_NAME))
    {
        var _FILE  = file_text_open_read(working_directory+_FILE_NAME);
        _file_data = file_text_read_string(_FILE);
                     file_text_close(      _FILE);
    }
}


if(!is_undefined(_file_data))
{
    var _dm_FILE = json_decode(_file_data);
    if (_dm_FILE!=-1)
    {
        var _dm_save_file_settings_ENCODED = _dm_FILE[?STR_Save+STR_File+STR_Settings];
        if(!is_undefined(_dm_save_file_settings_ENCODED))
        {
            var _dm_save_file_settings = json_decode(_dm_save_file_settings_ENCODED);
            if (_dm_save_file_settings!=-1)
            {
                if (val(_dm_save_file_settings[?STR_Randomize+STR_Item+STR_Locations]) 
                ||  val(_dm_save_file_settings[?STR_Randomize+STR_PBAG+STR_Locations]) 
                ||  val(_dm_save_file_settings[?STR_Randomize+STR_Skill+STR_Locations]) 
                ||  val(_dm_save_file_settings[?STR_Randomize+STR_Spell+STR_Locations]) 
                ||  val(_dm_save_file_settings[?STR_Randomize+STR_Spell+STR_Cost]) 
                ||  val(_dm_save_file_settings[?STR_Randomize+STR_Enemy+STR_Method]) 
                ||  val(_dm_save_file_settings[?STR_Randomize+STR_Enemy+STR_Spawner]) 
                ||  val(_dm_save_file_settings[?STR_Randomize+STR_Enemy+STR_ENIGMA]) 
                ||  val(_dm_save_file_settings[?STR_Randomize+STR_Enemy+STR_HP]) 
                ||  val(_dm_save_file_settings[?STR_Randomize+STR_Enemy+STR_Damage]) 
                ||  val(_dm_save_file_settings[?STR_Randomize+STR_Dungeon+STR_Room]) 
                ||  val(_dm_save_file_settings[?STR_Randomize+STR_Dungeon+STR_Locations]) 
                ||  val(_dm_save_file_settings[?STR_Randomize+STR_Dungeon+STR_Boss]) 
                ||  val(_dm_save_file_settings[?STR_Randomize+STR_Town+STR_Locations]) 
                ||  val(_dm_save_file_settings[?STR_Randomize+STR_Level+STR_Cost]) 
                ||  val(_dm_save_file_settings[?STR_Randomize+STR_XP]) )
                {
                    SaveFileRandoInfo_dm[?_DATAKEY0+STR_Rando+STR_Settings] = _dm_save_file_settings_ENCODED;
                }
                
                ds_map_destroy(_dm_save_file_settings); _dm_save_file_settings=undefined;
            }
        }
        
        ds_map_destroy(_dm_FILE); _dm_FILE=undefined;
    }
}




SaveFileRandoInfo_dm[?_DATAKEY0+STR_Seed+STR_Quest+"01"] = FileSelect_get_file_seed(_FILE_NUM,1);
SaveFileRandoInfo_dm[?_DATAKEY0+STR_Seed+STR_Quest+"02"] = FileSelect_get_file_seed(_FILE_NUM,2);




