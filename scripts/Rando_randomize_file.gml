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
    sdm("!!! "+"Rando Failed.  File: "+_FILE_NAME+"  does NOT exist."+" !!!");
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}






var _i,_j,_k, _a, _idx,_num, _count,_count1, _size, _case;
var _val,_val0,_val1,_val2;
var _min,_max;
var _datakey,_datakey1,_datakey2, _spawn_datakey;
var _rm_name,_rm_name1, _item_datakey, _loc_num, _town_name, _spell_name, _description;
var _chance_a,_chance_b;
var _color;
var _objver1,_objver2;

dm_save_data = ds_map_create();

DEBUG = true;
if (DEBUG){
debug_str = undefined;
debug_data_count = 0;
dm_debug_data = ds_map_create();
}


//Rando_SEED = get_saved_value(FILE_NUM, get_file_seed_dk(FILE_NUM,_QUEST_NUM), RUN_RANDOMIZATION_SEED);

dm_save_data[?STR_Rando+STR_Settings] = _RANDO_SETTINGS;




var _dm_SETTINGS = json_decode(_RANDO_SETTINGS);

ContainersHP_START_COUNT = val(_dm_SETTINGS[?STR_File+STR_Start+STR_Container+STR_HP]);
ContainersMP_START_COUNT = val(_dm_SETTINGS[?STR_File+STR_Start+STR_Container+STR_MP]);



                                                        _datakey=dk_LimitObscure;
    ItemLocations_LIMIT_OBSCURE      =val(_dm_SETTINGS[?_datakey]);
if (ItemLocations_LIMIT_OBSCURE)          dm_save_data[?_datakey] = ItemLocations_LIMIT_OBSCURE;

                                                        _datakey=dk_DarkRoom+STR_Difficulty;
    ItemLocations_DARKROOM_DIFFICULTY=val(_dm_SETTINGS[?_datakey]);
if (ItemLocations_DARKROOM_DIFFICULTY)    dm_save_data[?_datakey] = ItemLocations_DARKROOM_DIFFICULTY;

                                                        _datakey=STR_Item+STR_Location+STR_Hint;
    ItemLocations_NPC_GIVE_HINTS     =val(_dm_SETTINGS[?_datakey]);
if (ItemLocations_NPC_GIVE_HINTS)         dm_save_data[?_datakey] = ItemLocations_NPC_GIVE_HINTS;

                                                        _datakey=STR_Zelda+STR_Hint;
    ItemLocations_ZELDA_HINT         =val(_dm_SETTINGS[?_datakey]);
if (ItemLocations_ZELDA_HINT)             dm_save_data[?_datakey] = ItemLocations_ZELDA_HINT;

                                                        _datakey=STR_Randomize+STR_Item+STR_Locations;
    ItemLocations_WILL_RANDOMIZE     =val(_dm_SETTINGS[?_datakey]);
if (ItemLocations_WILL_RANDOMIZE)         dm_save_data[?_datakey] = ItemLocations_WILL_RANDOMIZE;

                                                        _datakey=STR_Randomize+STR_PBAG+STR_Locations;
    ItemLocations_INCLUDE_PBAG       =val(_dm_SETTINGS[?_datakey]);
if (ItemLocations_INCLUDE_PBAG)           dm_save_data[?_datakey] = ItemLocations_INCLUDE_PBAG;

                                                        _datakey=STR_Randomize+STR_Key+STR_Locations;
    KeyLocations_WILL_RANDOMIZE      =val(_dm_SETTINGS[?_datakey]);
if (KeyLocations_WILL_RANDOMIZE)          dm_save_data[?_datakey] = KeyLocations_WILL_RANDOMIZE;





                                                        _datakey=STR_Randomize+STR_Skill+STR_Locations;
    SkillLocations_WILL_RANDOMIZE    =val(_dm_SETTINGS[?_datakey]);
if (SkillLocations_WILL_RANDOMIZE)        dm_save_data[?_datakey] = SkillLocations_WILL_RANDOMIZE;

                                                        _datakey=STR_Randomize+STR_Spell+STR_Locations;
    SpellLocations_WILL_RANDOMIZE    =val(_dm_SETTINGS[?_datakey]);
if (SpellLocations_WILL_RANDOMIZE)        dm_save_data[?_datakey] = SpellLocations_WILL_RANDOMIZE;

                                                        _datakey=STR_Randomize+STR_Spell+STR_Cost;
    SpellCosts_WILL_RANDOMIZE        =val(_dm_SETTINGS[?_datakey]);
if (SpellCosts_WILL_RANDOMIZE)            dm_save_data[?_datakey] = SpellCosts_WILL_RANDOMIZE;





                                                        _datakey=STR_Randomize+STR_Enemy+STR_Difficulty;
    Enemy_DIFFICULTY          = clamp(val(_dm_SETTINGS[?_datakey]), 1,g.RandoEnemy_difficulty_MAX);
if (Enemy_DIFFICULTY)                     dm_save_data[?_datakey] = Enemy_DIFFICULTY;

                                                        _datakey=STR_Randomize+STR_Enemy+STR_Method;
    EnemyChars_WILL_RANDOMIZE        =val(_dm_SETTINGS[?_datakey]);
if (EnemyChars_WILL_RANDOMIZE)            dm_save_data[?_datakey] = EnemyChars_WILL_RANDOMIZE;

                                                        _datakey=STR_Randomize+STR_Enemy+STR_Spawner;
    EnemySpawners_WILL_RANDOMIZE     =val(_dm_SETTINGS[?_datakey]);
if (EnemySpawners_WILL_RANDOMIZE)         dm_save_data[?_datakey] = EnemySpawners_WILL_RANDOMIZE;

                                                        _datakey=STR_Randomize+STR_Enemy+STR_ENIGMA;
    EnemyENIGMA_WILL_RANDOMIZE       =val(_dm_SETTINGS[?_datakey]);
if (EnemyENIGMA_WILL_RANDOMIZE)           dm_save_data[?_datakey] = EnemyENIGMA_WILL_RANDOMIZE;

                                                        _datakey=STR_Randomize+STR_Enemy+STR_HP;
    EnemyHP_WILL_RANDOMIZE           =val(_dm_SETTINGS[?_datakey]);
if (EnemyHP_WILL_RANDOMIZE)               dm_save_data[?_datakey] = EnemyHP_WILL_RANDOMIZE;

                                                        _datakey=STR_Randomize+STR_Enemy+STR_Damage;
    EnemyDamage_WILL_RANDOMIZE       =val(_dm_SETTINGS[?_datakey]);
if (EnemyDamage_WILL_RANDOMIZE)           dm_save_data[?_datakey] = EnemyDamage_WILL_RANDOMIZE;






                                                        _datakey=STR_Randomize+STR_Dungeon+STR_Room;
    DungeonRooms_WILL_RANDOMIZE      =val(_dm_SETTINGS[?_datakey]);
if (DungeonRooms_WILL_RANDOMIZE)          dm_save_data[?_datakey] = DungeonRooms_WILL_RANDOMIZE;

                                                        _datakey=STR_Randomize+STR_Dungeon+STR_Locations;
    DungeonLocations_WILL_RANDOMIZE  =val(_dm_SETTINGS[?_datakey]);
if (DungeonLocations_WILL_RANDOMIZE)      dm_save_data[?_datakey] = DungeonLocations_WILL_RANDOMIZE;

                                                        _datakey=STR_Randomize+STR_Dungeon+STR_Boss;
    DungeonBoss_WILL_RANDOMIZE       =val(_dm_SETTINGS[?_datakey]);
if (DungeonBoss_WILL_RANDOMIZE)           dm_save_data[?_datakey] = DungeonBoss_WILL_RANDOMIZE;




                                                        _datakey=STR_Randomize+STR_Town+STR_Locations;
    TownLocations_WILL_RANDOMIZE     =val(_dm_SETTINGS[?_datakey]);
if (TownLocations_WILL_RANDOMIZE)         dm_save_data[?_datakey] = TownLocations_WILL_RANDOMIZE;






                                                        _datakey=STR_Randomize+STR_Level+STR_Cost;
    LevelCosts_WILL_RANDOMIZE        =val(_dm_SETTINGS[?_datakey]);
if (LevelCosts_WILL_RANDOMIZE)            dm_save_data[?_datakey] = LevelCosts_WILL_RANDOMIZE;

                                                        _datakey=STR_Randomize+STR_XP;
    XP_WILL_RANDOMIZE                =val(_dm_SETTINGS[?_datakey]);
if (XP_WILL_RANDOMIZE)                    dm_save_data[?_datakey] = XP_WILL_RANDOMIZE;

                                                        _datakey=STR_Randomize+STR_Palette;
    Palette_WILL_RANDOMIZE           =val(_dm_SETTINGS[?_datakey]);
if (Palette_WILL_RANDOMIZE)               dm_save_data[?_datakey] = Palette_WILL_RANDOMIZE;

                                                        _datakey=STR_Randomize+STR_Dungeon+STR_Tileset;
    DungeonTileset_WILL_RANDOMIZE    =val(_dm_SETTINGS[?_datakey]);
if (DungeonTileset_WILL_RANDOMIZE)        dm_save_data[?_datakey] = DungeonTileset_WILL_RANDOMIZE;



                                                       _datakey=STR_Randomize+STR_Overworld+STR_Biome;
    OverworldBiomes_WILL_RANDOMIZE  =val(_dm_SETTINGS[?_datakey]);
if (OverworldBiomes_WILL_RANDOMIZE)      dm_save_data[?_datakey] = OverworldBiomes_WILL_RANDOMIZE;


                                                       _datakey=STR_Randomize+STR_Scene;
    Scenes_WILL_RANDOMIZE           =val(_dm_SETTINGS[?_datakey]);
if (Scenes_WILL_RANDOMIZE)               dm_save_data[?_datakey] = Scenes_WILL_RANDOMIZE;




Attack_LEVEL = val(_dm_SETTINGS[?STR_Quest+hex_str(_QUEST_NUM)+STR_Start+STR_Level+STR_Attack], 1);
Magic_LEVEL  = val(_dm_SETTINGS[?STR_Quest+hex_str(_QUEST_NUM)+STR_Start+STR_Level+STR_Magic],  1);
Life_LEVEL   = val(_dm_SETTINGS[?STR_Quest+hex_str(_QUEST_NUM)+STR_Start+STR_Level+STR_Life],   1);


ds_map_destroy(_dm_SETTINGS); _dm_SETTINGS=undefined;








//==========================================================================
Rando_generate(_QUEST_NUM, Rando_SEED);
//Rando_generate(_QUEST_NUM, Rando_SEED, _RANDO_SETTINGS);
//==========================================================================








// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SAVE THE DATA --------------------------------------------------
var _file      = file_text_open_read(working_directory+_FILE_NAME);
var _file_data = file_text_read_string(_file);
                 file_text_close(      _file);
var _dm_save_data = json_decode(_file_data);


var _is_active  = ItemLocations_WILL_RANDOMIZE!=0;
    _is_active |= SpellLocations_WILL_RANDOMIZE!=0;
    _is_active |= DungeonLocations_WILL_RANDOMIZE!=0;
    _is_active |= EnemyChars_WILL_RANDOMIZE!=0;
    _is_active |= LevelCosts_WILL_RANDOMIZE!=0;
    _is_active |= XP_WILL_RANDOMIZE!=0;
    _is_active |= SpellLocations_WILL_RANDOMIZE!=0;
//
               _datakey=STR_Quest+hex_str(_QUEST_NUM);
_dm_save_data[?_datakey+STR_Rando+STR_Active] = _is_active;
_dm_save_data[?         STR_Rando+STR_Active] = _is_active;


var _RANDO_DATA = json_encode(dm_save_data);
_dm_save_data[?_datakey+STR_Rando+STR_Data] = _RANDO_DATA;


// ItemLocations_WILL_RANDOMIZE SkillLocations_WILL_RANDOMIZE SpellLocations_WILL_RANDOMIZE SpellCosts_WILL_RANDOMIZE 
// EnemyChars_WILL_RANDOMIZE EnemyHP_WILL_RANDOMIZE EnemyDamage_WILL_RANDOMIZE 
// DungeonRooms_WILL_RANDOMIZE DungeonLocations_WILL_RANDOMIZE DungeonBoss_WILL_RANDOMIZE TownLocations_WILL_RANDOMIZE 
/*
if (argument[0]<0 
||  argument[0]==RandoMAIN_ITEMS )
{
    if (dg_RandoITEM_Options[#RandoITEM_LOCS,2])
    {
        return true;
    }
    
    if (argument[0]==RandoMAIN_ITEMS)
    {
        return false;
    }
}




if (argument[0]<0 
||  argument[0]==RandoMAIN_SPELLS )
{
    for(_i=0; _i<RandoSPELL_COUNT-1; _i++)
    {
        if (dg_RandoSPELL_Options[#_i,2] 
        &&  _i != RandoSPELL_BACK )
        {
            return true;
        }
    }
    
    if (argument[0]==RandoMAIN_SPELLS)
    {
        return false;
    }
}




if (argument[0]<0 
||  argument[0]==RandoMAIN_DUNGEONS )
{
    for(_i=0; _i<RandoDUNGEON_COUNT-1; _i++)
    {
        if (_i!=RandoDUNGEON_LOCATION 
        ||  dg_RandoITEM_Options[#RandoITEM_LOCS,2] )
        {
            if (dg_RandoDUNGEON_Options[#_i,2] 
            &&  _i != RandoDUNGEON_BACK )
            {
                return true;
            }
        }
    }
    
    if (argument[0]==RandoMAIN_DUNGEONS)
    {
        return false;
    }
}




if (argument[0]<0 
||  argument[0]==RandoMAIN_ENEMIES )
{
    for(_i=0; _i<RandoENEMY_COUNT-1; _i++)
    {
        if (dg_RandoENEMY_Options[#_i,2] 
        &&  _i != RandoENEMY_DIFF 
        &&  _i != RandoENEMY_BACK )
        {
            return true;
        }
    }

    
    if (argument[0]==RandoMAIN_ENEMIES)
    {
        return false;
    }
}




if (argument[0]<0 
||  argument[0]==RandoMAIN_LVLCOST )
{
    if (dg_RandoMAIN_Options[#RandoMAIN_LVLCOST,2]) return true;
    if (argument[0]==RandoMAIN_LVLCOST) return false;
}




if (argument[0]<0 
||  argument[0]==RandoMAIN_XP )
{
    if (dg_RandoMAIN_Options[#RandoMAIN_XP,2]) return true;
    if (argument[0]==RandoMAIN_XP) return false;
}




if (argument[0]<0 
||  argument[0]==RandoMAIN_OTHER )
{
    if (dg_RandoOTHER_Options[#RandoOTHER_MAIN_PALETTE,2])    return true;
    //if (dg_RandoOTHER_Options[#RandoOTHER_MAIN_DUNGEON_TS,2]) return true;
    if (argument[0]==RandoMAIN_OTHER) return false;
}
*/







/*if (DEBUG){ dm_debug_data[?STR_Data+'01'+STR_Count] = debug_data_count;
var _DEBUG_DATA=json_encode(dm_debug_data);
_dm_save_data[?_datakey+STR_Rando+STR_Debug+STR_Data] = _DEBUG_DATA;
}*/




_file_data = json_encode(_dm_save_data);
_file = file_text_open_write(working_directory+_FILE_NAME);
        file_text_write_string(_file, _file_data);
        file_text_close(       _file);
//



// ===============================================================================
var _RANDO_DATA_FILE_NAME = f.dl_FILE_NAME_PREFIX[|FILE_NUM-1]+STR_Rando+STR_Data+".txt";
_file = file_text_open_write(working_directory+_RANDO_DATA_FILE_NAME);
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
// ===============================================================================














if (DEV){sdm("");
var _str  = "Save File  ";
    _str += "'"+_FILE_NAME +"'" + ", Save Name  ";
    _str += "'"+_SAVE_NAME+"'" + ",  rando data saved!";
sdm(_str); sdm("");
}
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++






ds_map_destroy(_dm_save_data);_dm_save_data=undefined;
ds_map_destroy( dm_save_data); dm_save_data=undefined;
if(DEBUG){ds_map_destroy(dm_debug_data);dm_debug_data=undefined;}




