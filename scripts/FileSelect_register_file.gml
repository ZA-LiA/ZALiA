/// FileSelect_register_file(file num)


var _FILE_NUM  = argument0;
var _FILE_NAME = f.dl_file_names[|_FILE_NUM-1];


var _i,_j, _val;
var _datakey;

var _SAVE_NAME = f.dl_save_names[|_FILE_NUM-1];

var _RANDO_ON = FileSelect_Rando_is_on(-1);


_val = 1;
if (_RANDO_ON)
{
    _val = dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor_QUEST,2];
}
else
{
    if (string_pos("ZELDA",_SAVE_NAME) 
    &&  string_count(" ",_SAVE_NAME)==string_length(_SAVE_NAME)-5 )
    {
        _val = 2;
    }
}

var _QUEST_NUM = _val;


init_new_save_file(_FILE_NUM, _QUEST_NUM);


f.cont_run_town_num = 0;
set_saved_value(_FILE_NUM, STR_Save+STR_Town+STR_Num, f.cont_run_town_num);


//=====================================================================
if (file_exists(_FILE_NAME))
{
    var _FILE      = file_text_open_read(working_directory+_FILE_NAME);
    var _FILE_DATA = file_text_read_string(_FILE);
                     file_text_close(      _FILE);
    var _dm_save_data = json_decode(_FILE_DATA);
    if (_dm_save_data!=-1)
    {
        // Delete any possible rando data on the save file
        ds_map_delete(_dm_save_data,STR_Rando+STR_Active);
        ds_map_delete(_dm_save_data,STR_Rando+STR_Data);
        ds_map_delete(_dm_save_data,STR_Rando+STR_Debug+STR_Data);
        //ds_map_delete(_dm_save_data,STR_Rando+STR_Seed);
        
        
        
        //_dm_save_data[?STR_Save+STR_Town+STR_Num] = _CONTINUE_TOWN_NUM;
        
        if (_RANDO_ON)
        {
            _dm_save_data[?f.SDNAME_questNum]            = _QUEST_NUM;
            _dm_save_data[?STR_File+STR_Start+STR_Quest] = _QUEST_NUM;
            //_dm_save_data[?STR_Rando+STR_Active] = true;
            
            
            var _LEVEL_ATK = dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor_ATTACK,2];
            var _LEVEL_MAG = dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor_MAGIC, 2];
            var _LEVEL_LIF = dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor_LIFE,  2];
            
            _dm_save_data[?f.SDNAME_level_atk]                      = _LEVEL_ATK;
            _dm_save_data[?f.SDNAME_level_mag]                      = _LEVEL_MAG;
            _dm_save_data[?f.SDNAME_level_lif]                      = _LEVEL_LIF;
            
            _dm_save_data[?STR_File+STR_Start+STR_Level+STR_Attack] = _LEVEL_ATK;
            _dm_save_data[?STR_File+STR_Start+STR_Level+STR_Magic]  = _LEVEL_MAG;
            _dm_save_data[?STR_File+STR_Start+STR_Level+STR_Life]   = _LEVEL_LIF;
            
            
            _dm_save_data[?STR_Rando+"_UP_A"+STR_XP+"_Penalty"] = dg_RandoOTHER_Options[#RandoOTHER_MAIN_WARP_PENALTY,2];
            //_dm_save_data[?STR_Rando+"_UP_A"+STR_XP+"_Penalty"] = dg_RandoMAIN_Options[#RandoMAIN_UP_A_XP_PENALTY,2];
            
            
            
            
            
            
            
            
            
            
            _datakey = f.SDNAME_items;
            var _START_ITEMS = val(_dm_save_data[?_datakey]);
            for(_i=0; _i<RandoOTHER_ITEMS_item_cursor_COUNT; _i++)
            {
                if (dg_RandoOTHER_ITEMS[#_i,2])
                {
                    _val = string(dg_RandoOTHER_ITEMS[#_i,3]);
                    _val = val(g.dm_ITEM[?_val+STR_Bit]);
                    _START_ITEMS |= _val;
                }
            }
            
            _dm_save_data[?_datakey] = _START_ITEMS;
            _dm_save_data[?STR_File+STR_Start+STR_Items] = _START_ITEMS;
            
            
            
            
            
            
            
            var _START_CONT_HP = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_HEART,2];
            _val="";
            for(_i=1; _i<=_START_CONT_HP; _i++)
            {
                for(_j=1; _j<=f.CONT_PIECE_PER_HP; _j++)
                {
                    _val += hex_str(_i)+hex_str(_j);
                }
            }
            _dm_save_data[?f.SDNAME_cont_pieces_hp] = _val;
            _dm_save_data[?STR_File+STR_Start+STR_Container+STR_HP] = _START_CONT_HP;
            
            
            var _START_CONT_MP = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAGIC,2];
            _val="";
            for(_i=1; _i<=_START_CONT_MP; _i++)
            {
                for(_j=1; _j<=f.CONT_PIECE_PER_MP; _j++)
                {
                    _val += hex_str(_i)+hex_str(_j);
                }
            }
            _dm_save_data[?f.SDNAME_cont_pieces_mp] = _val;
            _dm_save_data[?STR_File+STR_Start+STR_Container+STR_MP] = _START_CONT_MP;
            /*
            var _START_CONT_HP = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_HEART,2];
            if (_START_CONT_HP>cont_cnt_hp())
            {
                _val="";
                for(_i=1; _i<=_START_CONT_HP; _i++)
                {
                    for(_j=1; _j<=f.CONT_PIECE_PER_HP; _j++)
                    {
                        _val += hex_str(_i)+hex_str(_j);
                    }
                }
                
                _dm_save_data[?f.SDNAME_cont_pieces_hp] = _val;
            }
            _dm_save_data[?STR_File+STR_Start+STR_Container+STR_HP] = _START_CONT_HP;
            
            
            var _START_CONT_MP = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAGIC,2];
            if (_START_CONT_MP>cont_cnt_mp())
            {
                _val="";
                for(_i=1; _i<=_START_CONT_MP; _i++)
                {
                    for(_j=1; _j<=f.CONT_PIECE_PER_MP; _j++)
                    {
                        _val += hex_str(_i)+hex_str(_j);
                    }
                }
                
                _dm_save_data[?f.SDNAME_cont_pieces_mp] = _val;
            }
            _dm_save_data[?STR_File+STR_Start+STR_Container+STR_MP] = _START_CONT_MP;
            */
            
            
            
            
            
            
            
            
            
            _datakey = f.SDNAME_spells;
            var _START_SPELLS = val(_dm_save_data[?_datakey]);
            if (dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_PROTECT,2]) _START_SPELLS |= SPL_PRTC;
            if (dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_JUMP,   2]) _START_SPELLS |= SPL_JUMP;
            if (dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_HEAL,   2]) _START_SPELLS |= SPL_LIFE;
            if (dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_FAIRY,  2]) _START_SPELLS |= SPL_FARY;
            if (dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_FIRE,   2]) _START_SPELLS |= SPL_FIRE;
            if (dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_REFLECT,2]) _START_SPELLS |= SPL_RFLC;
            if (dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_ENIGMA, 2]) _START_SPELLS |= SPL_SPEL;
            if (dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_THUNDER,2]) _START_SPELLS |= SPL_THUN;
            //if (dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_SUMMON, 2]) _START_SPELLS |= SPL_SUMM;
            _dm_save_data[?_datakey] = _START_SPELLS;
            _dm_save_data[?STR_File+STR_Start+STR_Spells] = _START_SPELLS;
            
            
            
            
            
            
            
            
            var _DOLL_COUNT = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_DOLLS,2];
                _DOLL_COUNT = clamp(_DOLL_COUNT, 0,val(f.dm_1up_doll[?STR_Count])-(_QUEST_NUM==2));
                //_DOLL_COUNT = clamp(_DOLL_COUNT, 0,g.LifeDoll_MAX-(_QUEST_NUM==2));
            if (_DOLL_COUNT)
            {
                var _item_id;
                for(_i=1; _i<=_DOLL_COUNT; _i++)
                {
                    _item_id = f.dm_1up_doll[?hex_str(_i)+STR_Item+STR_ID];
                    if(!is_undefined(_item_id)) f.dm_1up_doll[?_item_id+STR_Acquired] = true;
                }
                
                _val = json_encode(f.dm_1up_doll);
                _dm_save_data[?f.SDNAME_linkDolls] = _val;
            }
            _dm_save_data[?STR_File+STR_Start+STR_Dolls] = _DOLL_COUNT;
            
            
            var _KAKUSU_MAX = val(g.dm_spawn[?STR_Kakusu+STR_Count]);
            _val = dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_KAKUSU,2];
            if (_KAKUSU_MAX-_val) _dm_save_data[?STR_Kakusu+STR_Required+STR_Count] = _val;
            
            _val = dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_CRYSTALS,2];
            if (f.CRYSTAL_MAX-_val) _dm_save_data[?STR_Crystal+STR_Required+STR_Count] = _val;
        }
        
        
        
        
        
        
        
        var _SAVE_DATA = json_encode(_dm_save_data);
        _FILE = file_text_open_write(working_directory+_FILE_NAME);
                file_text_write_string(_FILE, _SAVE_DATA);
                file_text_close(_FILE);
        //
        ds_map_destroy(_dm_save_data); _dm_save_data=undefined;
    }
    
    
    
    
    
    
    
    
    var _SEED = FileSelect_get_file_seed(_FILE_NUM,_QUEST_NUM);
    var _settings = "";
    if (_RANDO_ON)
    {
        _settings = FileSelect_Rando_get_rando_settings();
        var _dm_SETTINGS = json_decode(_settings);
        if (_dm_SETTINGS!=-1)
        {
            _dm_SETTINGS[?STR_File      +STR_Start+STR_Level+STR_Attack] = _LEVEL_ATK;
            _dm_SETTINGS[?STR_Quest+"01"+STR_Start+STR_Level+STR_Attack] = _LEVEL_ATK;
            _dm_SETTINGS[?STR_Quest+"02"+STR_Start+STR_Level+STR_Attack] = _LEVEL_ATK;
            
            _dm_SETTINGS[?STR_File      +STR_Start+STR_Level+STR_Magic]  = _LEVEL_MAG;
            _dm_SETTINGS[?STR_Quest+"01"+STR_Start+STR_Level+STR_Magic]  = _LEVEL_MAG;
            _dm_SETTINGS[?STR_Quest+"02"+STR_Start+STR_Level+STR_Magic]  = _LEVEL_MAG;
            
            _dm_SETTINGS[?STR_File      +STR_Start+STR_Level+STR_Life]   = _LEVEL_LIF;
            _dm_SETTINGS[?STR_Quest+"01"+STR_Start+STR_Level+STR_Life]   = _LEVEL_LIF;
            _dm_SETTINGS[?STR_Quest+"02"+STR_Start+STR_Level+STR_Life]   = _LEVEL_LIF;
            
            
            _dm_SETTINGS[?STR_File      +STR_Start+STR_Item] = _START_ITEMS;
            _dm_SETTINGS[?STR_Quest+"01"+STR_Start+STR_Item] = _START_ITEMS;
            _dm_SETTINGS[?STR_Quest+"02"+STR_Start+STR_Item] = _START_ITEMS;
            
            
            _dm_SETTINGS[?STR_File      +STR_Start+STR_Container+STR_HEART] = _START_CONT_HP;
            _dm_SETTINGS[?STR_Quest+"01"+STR_Start+STR_Container+STR_HEART] = _START_CONT_HP;
            _dm_SETTINGS[?STR_Quest+"02"+STR_Start+STR_Container+STR_HEART] = _START_CONT_HP;
            
            _dm_SETTINGS[?STR_File      +STR_Start+STR_Container+STR_MAGIC] = _START_CONT_MP;
            _dm_SETTINGS[?STR_Quest+"01"+STR_Start+STR_Container+STR_MAGIC] = _START_CONT_MP;
            _dm_SETTINGS[?STR_Quest+"02"+STR_Start+STR_Container+STR_MAGIC] = _START_CONT_MP;
            
            
            _dm_SETTINGS[?STR_File      +STR_Start+STR_Spells] = _START_SPELLS;
            _dm_SETTINGS[?STR_Quest+"01"+STR_Start+STR_Spells] = _START_SPELLS;
            _dm_SETTINGS[?STR_Quest+"02"+STR_Start+STR_Spells] = _START_SPELLS;
            
            
            _dm_SETTINGS[?"_UP_A"+STR_XP+"_Penalty"] = dg_RandoOTHER_Options[#RandoOTHER_MAIN_WARP_PENALTY,2];
            
            
            _settings = json_encode(_dm_SETTINGS);
            ds_map_destroy(_dm_SETTINGS); _dm_SETTINGS=undefined;
        }
    }
    
    
    // Putting this outside of `if (_RANDO_ON)` so stuff like palette rando, dungeon tileset rando will still run
    with(instance_create(0,0,Rando))
    {
        Rando_randomize_file(_FILE_NUM, _QUEST_NUM, _SEED, _settings);
        instance_destroy();
    }
}




