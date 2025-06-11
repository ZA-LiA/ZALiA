/// file_save(file num, will eliminate)


var                            _arg=0;
var _FILE_NUM       = argument[_arg++];
var _WILL_ELIMINATE = argument[_arg++];

var _file, _data;
var _dm_save_data = ds_map_create();

var _SAVE_IS_CREATED_STATE = !_WILL_ELIMINATE;

var _FILE_NAME = f.dl_file_names[|_FILE_NUM-1];

var                  _SAVE_NAME = f.dl_save_names[|_FILE_NUM-1];
if (_WILL_ELIMINATE) _SAVE_NAME = SAVE_NAME_NULL; // SAVE_NAME_NULL: Indicates save slot is avail for creation.







if (_WILL_ELIMINATE 
|| !file_exists(_FILE_NAME) )
{
    ds_map_clear(_dm_save_data);
    _dm_save_data[?f.SDNAME_save_name] = SAVE_NAME_NULL;
    
    _data = json_encode(_dm_save_data);
    _file = file_text_open_write(working_directory+_FILE_NAME);
            file_text_write_string(_file,_data);
            file_text_close(       _file);
    show_debug_message(_FILE_NAME+" cleared!");
}


if(!_WILL_ELIMINATE)
//&&  file_exists(_FILE_NAME) )
{
    _file = file_text_open_read(working_directory+_FILE_NAME);
    _data = file_text_read_string(_file);
            file_text_close(      _file);
    var _dm = json_decode(_data);
    if (_dm!=-1)
    {
        ds_map_copy(_dm_save_data, _dm);
        ds_map_destroy(_dm); _dm=undefined;
    }
}








_dm_save_data[?"_App_Version"] = "ZALiA version: "+GM_version;
_dm_save_data[?"_DateTimeOfSave"] = date_current_datetime();
//                                                                              // 
_dm_save_data[?f.SDNAME_saveCreated]            = _SAVE_IS_CREATED_STATE;
_dm_save_data[?f.SDNAME_save_name]              = _SAVE_NAME;
//                                                                              // 
//                                                                              // 
_dm_save_data[?f.SDNAME_questNum]               = f.quest_num;
_dm_save_data[?STR_Game+STR_Complete+STR_Count] = f.game_completed_count;
_dm_save_data[?f.SDNAME_deathCount]             = f.death_count;
//                                                                              // 
_dm_save_data[?f.SDNAME_level_atk]              = f.level_atk;
_dm_save_data[?f.SDNAME_level_mag]              = f.level_mag;
_dm_save_data[?f.SDNAME_level_lif]              = f.level_lif;
//                                                                              // 
_dm_save_data[?f.SDNAME_cont_pieces_hp]         = f.cont_pieces_hp;
_dm_save_data[?f.SDNAME_cont_pieces_mp]         = f.cont_pieces_mp;
//                                                                              // 
_dm_save_data[?f.SDNAME_spells]                 = f.spells;
_dm_save_data[?f.SDNAME_items]                  = f.items;
_dm_save_data[?f.SDNAME_skills]                 = f.skills;
_dm_save_data[?STR_Skill+STR_Cucco]             = f.Cucco_skills;
_dm_save_data[?STR_Cucco+STR_Spell+"02"+STR_Acquired] = g.CuccoSpell2_Acquired;
//                                                                              // 
_dm_save_data[?f.SDNAME_crystals]               = f.crystals;
_dm_save_data[?f.SDNAME_kakusu]                 = json_encode(f.dm_kakusu);
_dm_save_data[?f.SDNAME_takenKeys]              = json_encode(f.dm_keys);
_dm_save_data[?f.SDNAME_openedLocks]            = json_encode(f.dm_openedLocks);
_dm_save_data[?STR_PBAG]                        = json_encode(f.dm_PBags);
_dm_save_data[?f.SDNAME_linkDolls]              = json_encode(f.dm_1up_doll);
//                                                                              // 
_dm_save_data[?f.SDNAME_quests]                 = json_encode(f.dm_quests);
_dm_save_data[?f.SDNAME_exploredRooms]          = json_encode(f.dm_explored);
//                                                                              // 
//                                                                              // 
if (val(f.dm_rando[?STR_Randomize+STR_Item+STR_Locations]) 
//&&  val(f.dm_rando[?STR_Item+STR_Location+STR_Hint]) 
&&  ds_map_size(g.dm_RandoHintsRecorder) )
{
    _dm_save_data[?STR_Found+STR_Hint] = json_encode(g.dm_RandoHintsRecorder);
}
//                                                                              // 
//                                                                              // 
//                                                                              // 


if (file_exists(_FILE_NAME))
{
    var _SAVE_DATA = json_encode(_dm_save_data);
    _file = file_text_open_write(working_directory+_FILE_NAME);
            file_text_write_string(_file,_SAVE_DATA);
            file_text_close(       _file);
    //
    global.dm_save_file_data[?STR_Save+STR_File+hex_str(_FILE_NUM)+"_Encoded"] = _SAVE_DATA;
    
    show_debug_message("");
    show_debug_message("Save File  '"+_FILE_NAME+"', Save Name  '"+_SAVE_NAME+"',   saved!");
    show_debug_message("");
}

ds_map_destroy(_dm_save_data); _dm_save_data=undefined;




/*
/// file_save(file num, will eliminate)


var                            _arg=0;
var _FILE_NUM       = argument[_arg++];
var _WILL_ELIMINATE = argument[_arg++];

var _file, _data;
var _dm_save_data = ds_map_create();

var _SAVE_IS_CREATED_STATE = !_WILL_ELIMINATE;

var _FILE_NAME = f.dl_file_names[|_FILE_NUM-1];

var                  _SAVE_NAME = f.dl_save_names[|_FILE_NUM-1];
if (_WILL_ELIMINATE) _SAVE_NAME = SAVE_NAME_NULL; // SAVE_NAME_NULL: Indicates save slot is avail for creation.







if (_WILL_ELIMINATE 
|| !file_exists(_FILE_NAME) )
{
    ds_map_clear(_dm_save_data);
    _dm_save_data[?f.SDNAME_save_name] = SAVE_NAME_NULL;
    
    _data = json_encode(_dm_save_data);
    _file = file_text_open_write(working_directory+_FILE_NAME);
            file_text_write_string(_file,_data);
            file_text_close(       _file);
    show_debug_message(_FILE_NAME+" cleared!");
}


if(!_WILL_ELIMINATE)
//&&  file_exists(_FILE_NAME) )
{
    _file = file_text_open_read(working_directory+_FILE_NAME);
    _data = file_text_read_string(_file);
            file_text_close(      _file);
    //
    ds_map_clear(_dm_save_data);
    _dm_save_data = json_decode(_data);
}



_dm_save_data[?"_App_Version"] = "ZALiA version: "+GM_version;
_dm_save_data[?"_DateTimeOfSave"] = date_current_datetime();
//                                                                              // 
_dm_save_data[?f.SDNAME_saveCreated]            = _SAVE_IS_CREATED_STATE;
_dm_save_data[?f.SDNAME_save_name]              = _SAVE_NAME;
//                                                                              // 
//                                                                              // 
_dm_save_data[?f.SDNAME_questNum]               = f.quest_num;
_dm_save_data[?STR_Game+STR_Complete+STR_Count] = f.game_completed_count;
_dm_save_data[?f.SDNAME_deathCount]             = f.death_count;
//                                                                              // 
_dm_save_data[?f.SDNAME_level_atk]              = f.level_atk;
_dm_save_data[?f.SDNAME_level_mag]              = f.level_mag;
_dm_save_data[?f.SDNAME_level_lif]              = f.level_lif;
//                                                                              // 
_dm_save_data[?f.SDNAME_cont_pieces_hp]         = f.cont_pieces_hp;
_dm_save_data[?f.SDNAME_cont_pieces_mp]         = f.cont_pieces_mp;
//                                                                              // 
_dm_save_data[?f.SDNAME_spells]                 = f.spells;
_dm_save_data[?f.SDNAME_items]                  = f.items;
_dm_save_data[?f.SDNAME_skills]                 = f.skills;
_dm_save_data[?STR_Skill+STR_Cucco]             = f.Cucco_skills;
_dm_save_data[?STR_Cucco+STR_Spell+"02"+STR_Acquired] = g.CuccoSpell2_Acquired;
//                                                                              // 
_dm_save_data[?f.SDNAME_crystals]               = f.crystals;
_dm_save_data[?f.SDNAME_kakusu]                 = json_encode(f.dm_kakusu);
_dm_save_data[?f.SDNAME_takenKeys]              = json_encode(f.dm_keys);
_dm_save_data[?f.SDNAME_openedLocks]            = json_encode(f.dm_openedLocks);
_dm_save_data[?STR_PBAG]                        = json_encode(f.dm_PBags);
_dm_save_data[?f.SDNAME_linkDolls]              = json_encode(f.dm_1up_doll);
//                                                                              // 
_dm_save_data[?f.SDNAME_quests]                 = json_encode(f.dm_quests);
_dm_save_data[?f.SDNAME_exploredRooms]          = json_encode(f.dm_explored);
//                                                                              // 
//                                                                              // 
if (val(f.dm_rando[?STR_Randomize+STR_Item+STR_Locations]) 
//&&  val(f.dm_rando[?STR_Item+STR_Location+STR_Hint]) 
&&  ds_map_size(g.dm_RandoHintsRecorder) )
{
    _dm_save_data[?STR_Found+STR_Hint] = json_encode(g.dm_RandoHintsRecorder);
}
//                                                                              // 
//                                                                              // 
//                                                                              // 


if (file_exists(_FILE_NAME))
{
    var _SAVE_DATA = json_encode(_dm_save_data);
    
    _file = file_text_open_write(working_directory+_FILE_NAME);
            file_text_write_string(_file,_SAVE_DATA);
            file_text_close(       _file);
    //
    global.dm_save_file_data[?STR_Save+STR_File+hex_str(_FILE_NUM)+"_Encoded"] = _SAVE_DATA;
    
    if (DEV){sdm("");
        var _str  = "Save File  ";
            _str += "'"+_FILE_NAME +"'" + ", Save Name  ";
            _str += "'"+_SAVE_NAME+"'" + ",   saved!";
        sdm(_str); sdm("");
    }
}

ds_map_destroy(_dm_save_data); _dm_save_data=undefined;
*/




