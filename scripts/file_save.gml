/// file_save(file num, will eliminate)


/*
if (DEV)
{
    var _START_TIME = current_time;
    repeat(1) show_debug_message("");
    show_debug_message("file_save() START");
}
*/


var                            _arg=0;
var _FILE_NUM       = argument[_arg++];
var _WILL_ELIMINATE = argument[_arg++];

var _i, _file, _data;
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
            file_text_close(_file);
    show_debug_message("");
    show_debug_message(_FILE_NAME+" cleared!");
    show_debug_message("");
    
    
    var _DUNGEON_TILESET_FILE_NAME = f.dl_FILE_NAME_PREFIX[|_FILE_NUM-1]+dk_RandoDungeonTilesetData+".txt";
    _data = "";
    _file = file_text_open_write(working_directory+_DUNGEON_TILESET_FILE_NAME);
            file_text_write_string(_file,_data);
            file_text_close(_file);
    show_debug_message("");
    show_debug_message(_DUNGEON_TILESET_FILE_NAME+" cleared!");
    show_debug_message("");
    
    
    ds_map_clear(g.dm_RandoHintsRecorder);
    var _RANDO_DATA_FILE_NAME = f.dl_FILE_NAME_PREFIX[|_FILE_NUM-1]+STR_Rando+STR_Data+".txt";
    _data = "";
    _file = file_text_open_write(working_directory+_RANDO_DATA_FILE_NAME);
            file_text_write_string(_file,_data);
            file_text_close(_file);
    show_debug_message("");
    show_debug_message(_RANDO_DATA_FILE_NAME+" cleared!");
    show_debug_message("");
    
    
    var _RANDO_SPOILER_FILE_NAME = f.dl_FILE_NAME_PREFIX[|_FILE_NUM-1]+STR_Rando+"_Spoiler"+".txt";
    _data = "";
    _file = file_text_open_write(working_directory+_RANDO_SPOILER_FILE_NAME);
            file_text_write_string(_file,_data);
            file_text_close(_file);
    show_debug_message("");
    show_debug_message(_RANDO_SPOILER_FILE_NAME+" cleared!");
    show_debug_message("");
}


if(!_WILL_ELIMINATE)
{
    _file = file_text_open_read(working_directory+_FILE_NAME);
    _data = file_text_read_string(_file);
            file_text_close(_file);
    var _dm = json_decode(_data);
    if (_dm!=-1)
    {
        ds_map_copy(_dm_save_data, _dm);
        ds_map_destroy(_dm); _dm=undefined;
        //show_debug_message("file_save(). "+"_dm_save_data size="+string(ds_map_size(_dm_save_data)));
    }
}








_dm_save_data[?"_DateTimeOfSave"] = date_current_datetime();
_dm_save_data[?STR_Quest+hex_str(f.quest_num)+STR_Duration] = global.QuestTimer_time;

_dm_save_data[?f.SDNAME_saveCreated]            = _SAVE_IS_CREATED_STATE;
_dm_save_data[?f.SDNAME_save_name]              = _SAVE_NAME;

_dm_save_data[?f.SDNAME_questNum]               = f.quest_num;
_dm_save_data[?STR_Game+STR_Complete+STR_Count] = f.game_completed_count;
_dm_save_data[?f.SDNAME_deathCount]             = f.death_count;

_dm_save_data[?f.SDNAME_level_atk]              = f.level_atk;
_dm_save_data[?f.SDNAME_level_mag]              = f.level_mag;
_dm_save_data[?f.SDNAME_level_lif]              = f.level_lif;

_dm_save_data[?f.SDNAME_cont_pieces_hp]         = f.cont_pieces_hp;
_dm_save_data[?f.SDNAME_cont_pieces_mp]         = f.cont_pieces_mp;

_dm_save_data[?f.SDNAME_spells]                 = f.spells;
_dm_save_data[?f.SDNAME_items]                  = f.items;
_dm_save_data[?f.SDNAME_skills]                 = f.skills;
_dm_save_data[?STR_Skill+STR_Cucco]             = f.Cucco_skills;
_dm_save_data[?STR_Cucco+STR_Spell+"02"+STR_Acquired] = g.CuccoSpell2_Acquired;

_dm_save_data[?f.SDNAME_crystals]               = f.crystals;
_dm_save_data[?f.SDNAME_kakusu]                 = json_encode(f.dm_kakusu);
_dm_save_data[?f.SDNAME_takenKeys]              = json_encode(f.dm_keys);
_dm_save_data[?f.SDNAME_openedLocks]            = json_encode(f.dm_openedLocks);
_dm_save_data[?STR_PBAG]                        = json_encode(f.dm_PBags);
_dm_save_data[?f.SDNAME_linkDolls]              = json_encode(f.dm_1up_doll);

_dm_save_data[?f.SDNAME_quests]                 = json_encode(f.dm_quests);
_dm_save_data[?f.SDNAME_exploredRooms]          = json_encode(f.dm_explored);

/*
show_debug_message("file_save(). "+"f.dm_kakusu size="+string(ds_map_size(f.dm_kakusu)));
show_debug_message("file_save(). "+"f.dm_keys size="+string(ds_map_size(f.dm_keys)));
show_debug_message("file_save(). "+"f.dm_openedLocks size="+string(ds_map_size(f.dm_openedLocks)));
show_debug_message("file_save(). "+"f.dm_PBags size="+string(ds_map_size(f.dm_PBags)));
show_debug_message("file_save(). "+"f.dm_1up_doll size="+string(ds_map_size(f.dm_1up_doll)));
show_debug_message("file_save(). "+"f.dm_quests size="+string(ds_map_size(f.dm_quests)));
show_debug_message("file_save(). "+"f.dm_explored size="+string(ds_map_size(f.dm_explored)));

show_debug_message("file_save(). "+"_dm_save_data size="+string(ds_map_size(_dm_save_data)));
*/








if (file_exists(_FILE_NAME))
{
    var _SAVE_DATA = json_encode(_dm_save_data);
    _file = file_text_open_write(working_directory+_FILE_NAME);
            file_text_write_string(_file,_SAVE_DATA);
            file_text_close(_file);
    //
    global.dm_save_file_data[?STR_Save+STR_File+hex_str(_FILE_NUM)+STR_Encoded] = _SAVE_DATA;
    ds_map_copy(global.dm_save_file, _dm_save_data);
    
    show_debug_message("");
    show_debug_message("Save File  '"+_FILE_NAME+"', Save Name  '"+_SAVE_NAME+"',   saved!");
    show_debug_message("");
}








if(!_WILL_ELIMINATE 
&&  val(global.dm_save_file_settings[?STR_Randomize+STR_Item+STR_Locations]) )
{
    if (ds_map_size(g.dm_RandoHintsRecorder))
    {
        var _RANDO_DATA_FILE_NAME = f.dl_FILE_NAME_PREFIX[|_FILE_NUM-1]+STR_Rando+STR_Data+".txt";
        if (file_exists(_RANDO_DATA_FILE_NAME))
        {
            _file =      file_text_open_read(working_directory+_RANDO_DATA_FILE_NAME);
            _file_data = file_text_read_string(_file);
                         file_text_close(_file);
            var _dm_rando_full = json_decode(_file_data);
            if (_dm_rando_full!=-1)
            {
                ds_map_copy(f.dm_rando_full, _dm_rando_full);
                
                f.dm_rando_full[?STR_Found+STR_Hint] = json_encode(g.dm_RandoHintsRecorder);
                _file = file_text_open_write(working_directory+_RANDO_DATA_FILE_NAME);
                        file_text_write_string(_file, json_encode(f.dm_rando_full));
                        file_text_close(_file);
                //
                ds_map_destroy(_dm_rando_full); _dm_rando_full=undefined;
            }
        }
    }
    
    
    var _RANDO_SPOILER_FILE_NAME = f.dl_FILE_NAME_PREFIX[|_FILE_NUM-1]+STR_Rando+"_Spoiler"+".txt";
    if (file_exists(_RANDO_SPOILER_FILE_NAME))
    {
        var _line, _pos1,_pos2, _item_id;
        var _POS_KEY1 = "#(";
        var _POS_KEY2 = ")#";
        var _STR_ACQUIRED = "*ACQUIRED*";
        var _dl_text_lines = ds_list_create();
        
        _file = file_text_open_read(working_directory+_RANDO_SPOILER_FILE_NAME);
        while(!file_text_eof(_file))
        {
            _line = file_text_readln(_file);
            // Item Data Line Example: "$04. loc_num $2C: #(_CANDLE)#   .  _TownA_5F - Bagu Item location (NOTE)"
            if (string_pos("loc_num",_line)       // this is an item location line
            && !string_pos(_STR_ACQUIRED,_line) ) // it's not recorded as acquired yet
            {
                _pos1 = string_pos(_POS_KEY1,_line) + string_length(_POS_KEY1);
                _pos2 = string_pos(_POS_KEY2,_line);
                _item_id = string_copy(_line, _pos1, _pos2-_pos1);
                if (item_acquired(_item_id)) _line = string_insert(_STR_ACQUIRED+" ", _line, 1);
                //if (item_acquired(_item_id)) _line = string_insert(_STR_ACQUIRED, _line, _pos2+string_length(_POS_KEY2)+2);
            }
            
            ds_list_add(_dl_text_lines,_line);
        }
        file_text_close(_file);
        
        
        _file = file_text_open_write(working_directory+_RANDO_SPOILER_FILE_NAME);
        var          _LINE_COUNT = ds_list_size(_dl_text_lines);
        for(_i=0; _i<_LINE_COUNT; _i++) file_text_write_string(_file,_dl_text_lines[|_i]);
        file_text_close(_file);
        
        ds_list_destroy(_dl_text_lines); _dl_text_lines=undefined;
    }
}




ds_map_destroy(_dm_save_data); _dm_save_data=undefined;





/*
if (DEV)
{
    show_debug_message("file_save() END. "+string(current_time-_START_TIME));
    repeat(1) show_debug_message("");
}
*/




