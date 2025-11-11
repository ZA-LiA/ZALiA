/// Rando_randomize_file(save file num, quest num, seed, encoded rando settings)


var                            _arg=0;
      FILE_NUM      = argument[_arg++];
var _QUEST_NUM      = argument[_arg++];
     Rando_SEED     = argument[_arg++];
var _RANDO_SETTINGS = argument[_arg++]; // encoded rando settings


var _FILE_NAME = f.dl_file_names[|FILE_NUM-1];
var _SAVE_NAME = f.dl_save_names[|FILE_NUM-1];


if(!file_exists(_FILE_NAME))
{
    show_debug_message("");
    show_debug_message("!!! "+"Rando Failed.  File: "+_FILE_NAME+"  does NOT exist."+" !!!");
    show_debug_message("");
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}








var _i, _val, _datakey;
var _file, _file_data;


DEBUG = true;
if (DEBUG){
debug_str = undefined;
debug_data_count = 0;
dm_debug_data = ds_map_create();
}


//Rando_SEED = get_saved_value(FILE_NUM, get_file_seed_dk(FILE_NUM,_QUEST_NUM), RUN_RANDOMIZATION_SEED);


dm_save_data = ds_map_create();
dm_save_data_dungeon_tileset = ds_map_create();


var _dm_SETTINGS = json_decode(_RANDO_SETTINGS);
if (_dm_SETTINGS==-1) _dm_SETTINGS = ds_map_create(); // So the code below doesn't error when trying to get map data


ItemLocations_LIMIT_OBSCURE      =val(_dm_SETTINGS[?dk_LimitObscure]);
ItemLocations_DARKROOM_DIFFICULTY=val(_dm_SETTINGS[?dk_DarkRoom+STR_Difficulty]);
ItemLocations_NPC_GIVE_HINTS     =val(_dm_SETTINGS[?STR_Item+STR_Location+STR_Hint]);
ItemLocations_ZELDA_HINT         =val(_dm_SETTINGS[?STR_Zelda+STR_Hint]);
ItemLocations_WILL_RANDOMIZE     =val(_dm_SETTINGS[?STR_Randomize+STR_Item+STR_Locations]);
ItemLocations_INCLUDE_PBAG       =val(_dm_SETTINGS[?STR_Randomize+STR_PBAG+STR_Locations]);
KeyLocations_WILL_RANDOMIZE      =val(_dm_SETTINGS[?STR_Randomize+STR_Key+STR_Locations]);

SkillLocations_WILL_RANDOMIZE    =val(_dm_SETTINGS[?STR_Randomize+STR_Skill+STR_Locations]);
SpellLocations_WILL_RANDOMIZE    =val(_dm_SETTINGS[?STR_Randomize+STR_Spell+STR_Locations]);
SpellCosts_WILL_RANDOMIZE        =val(_dm_SETTINGS[?STR_Randomize+STR_Spell+STR_Cost]);

Enemy_DIFFICULTY          = clamp(val(_dm_SETTINGS[?STR_Randomize+STR_Enemy+STR_Difficulty]), 1,g.RandoEnemy_difficulty_MAX);
EnemyChars_WILL_RANDOMIZE        =val(_dm_SETTINGS[?STR_Randomize+STR_Enemy+STR_Method]);
EnemySpawners_WILL_RANDOMIZE     =val(_dm_SETTINGS[?STR_Randomize+STR_Enemy+STR_Spawner]);
EnemyENIGMA_WILL_RANDOMIZE       =val(_dm_SETTINGS[?STR_Randomize+STR_Enemy+STR_ENIGMA]);
EnemyHP_WILL_RANDOMIZE           =val(_dm_SETTINGS[?STR_Randomize+STR_Enemy+STR_HP]);
EnemyDamage_WILL_RANDOMIZE       =val(_dm_SETTINGS[?STR_Randomize+STR_Enemy+STR_Damage]);

DungeonRooms_WILL_RANDOMIZE      =val(_dm_SETTINGS[?STR_Randomize+STR_Dungeon+STR_Room]);
DungeonLocations_WILL_RANDOMIZE  =val(_dm_SETTINGS[?STR_Randomize+STR_Dungeon+STR_Locations]);
DungeonBoss_WILL_RANDOMIZE       =val(_dm_SETTINGS[?STR_Randomize+STR_Dungeon+STR_Boss]);

TownLocations_WILL_RANDOMIZE     =val(_dm_SETTINGS[?STR_Randomize+STR_Town+STR_Locations]);

LevelCosts_WILL_RANDOMIZE        =val(_dm_SETTINGS[?STR_Randomize+STR_Level+STR_Cost]);
XP_WILL_RANDOMIZE                =val(_dm_SETTINGS[?STR_Randomize+STR_XP]);

Scenes_WILL_RANDOMIZE            =val(_dm_SETTINGS[?STR_Randomize+STR_Scene]);
OverworldBiomes_WILL_RANDOMIZE   =val(_dm_SETTINGS[?STR_Randomize+STR_Overworld+STR_Biome]);
Palette_WILL_RANDOMIZE           =val(_dm_SETTINGS[?STR_Randomize+STR_Palette]);
DungeonTileset_WILL_RANDOMIZE    =val(_dm_SETTINGS[?STR_Randomize+STR_Dungeon+STR_Tileset]);


Attack_LEVEL = val(_dm_SETTINGS[?STR_File+STR_Start+STR_Level+STR_Attack], 1);
Magic_LEVEL  = val(_dm_SETTINGS[?STR_File+STR_Start+STR_Level+STR_Magic],  1);
Life_LEVEL   = val(_dm_SETTINGS[?STR_File+STR_Start+STR_Level+STR_Life],   1);

ContainersHP_START_COUNT = val(_dm_SETTINGS[?STR_File+STR_Start+STR_Container+STR_HP], f.CONT_MIN_HP);
ContainersMP_START_COUNT = val(_dm_SETTINGS[?STR_File+STR_Start+STR_Container+STR_MP], f.CONT_MIN_MP);


ds_map_destroy(_dm_SETTINGS); _dm_SETTINGS=undefined;








//==========================================================================
Rando_generate(_QUEST_NUM, Rando_SEED);
//==========================================================================








// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SAVE THE DATA --------------------------------------------------
// ===============================================================================
var _dm_save_data = ds_map_create();
var _RANDO_DATA_FILE_NAME = f.dl_FILE_NAME_PREFIX[|FILE_NUM-1]+STR_Rando+STR_Data+".txt";
if (file_exists(_RANDO_DATA_FILE_NAME))
{
    _file =      file_text_open_read(working_directory+_RANDO_DATA_FILE_NAME);
    _file_data = file_text_read_string(_file);
                 file_text_close(_file);
    var _dm_rando_full = json_decode(_file_data);
    if (_dm_rando_full!=-1)
    {
        ds_map_copy(_dm_save_data, _dm_rando_full);
        ds_map_destroy(_dm_rando_full); _dm_rando_full=undefined;
    }
}

_datakey = STR_Quest+hex_str(_QUEST_NUM);
_dm_save_data[?_datakey+STR_Rando+STR_Data] = json_encode(dm_save_data);
_dm_save_data[?_datakey+STR_Rando+STR_Debug+STR_Data] = json_encode(dm_debug_data);

_file = file_text_open_write(working_directory+_RANDO_DATA_FILE_NAME);
        file_text_write_string(_file, json_encode(_dm_save_data));
        file_text_close(_file);
//




var _DUNGEON_TILESET_FILE_NAME = f.dl_FILE_NAME_PREFIX[|FILE_NUM-1]+dk_RandoDungeonTilesetData+".txt";
_file = file_text_open_write(working_directory+_DUNGEON_TILESET_FILE_NAME);
        file_text_write_string(_file, json_encode(dm_save_data_dungeon_tileset));
        file_text_close(_file);
//




// ===============================================================================
var _RANDO_SPOILER_FILE_NAME = f.dl_FILE_NAME_PREFIX[|FILE_NUM-1]+STR_Rando+"_Spoiler"+".txt";
_file = file_text_open_write(working_directory+_RANDO_SPOILER_FILE_NAME);
for(_i=0; _i<debug_data_count; _i++)
{
        _val = dm_debug_data[?STR_Data+'01'+hex_str(_i+1)];
    if(!is_undefined(_val) 
    &&  _val!="" 
    &&  _val!=" " )
    {
        file_text_write_string(_file,_val);
        file_text_writeln(     _file);
    }
}
file_text_close(_file);


show_debug_message("");
show_debug_message("Save File  '"+_FILE_NAME+"', Save Name  '"+_SAVE_NAME+"',  rando data saved!");
show_debug_message("");
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++








ds_map_destroy(_dm_save_data);_dm_save_data=undefined;
ds_map_destroy( dm_save_data); dm_save_data=undefined;
ds_map_destroy(dm_save_data_dungeon_tileset); dm_save_data_dungeon_tileset=undefined;
if(DEBUG){ds_map_destroy(dm_debug_data);dm_debug_data=undefined;}




