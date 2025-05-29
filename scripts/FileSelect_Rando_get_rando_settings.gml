/// FileSelect_Rando_get_rando_settings()


var _dm_SETTINGS=ds_map_create();
_dm_SETTINGS[?dk_LimitObscure]                        = dg_RandoITEM_Options[#RandoITEM_OBSCURE_LOCS,2];
_dm_SETTINGS[?dk_DarkRoom+STR_Difficulty]           = dg_RandoITEM_Options[#RandoITEM_DARKROOM,2];
_dm_SETTINGS[?STR_Item+STR_Location+STR_Hint]         = dg_RandoITEM_Options[#RandoITEM_HINTS,2];
_dm_SETTINGS[?STR_Zelda+STR_Hint]                     = dg_RandoITEM_Options[#RandoITEM_ZELDA_HINT,2];
_dm_SETTINGS[?STR_Randomize+STR_Item+STR_Locations]   = dg_RandoITEM_Options[#RandoITEM_LOCS,2];
_dm_SETTINGS[?STR_Randomize+STR_PBAG+STR_Locations]   = dg_RandoITEM_Options[#RandoITEM_PBAG,2];
_dm_SETTINGS[?STR_Randomize+STR_Key +STR_Locations]   = dg_RandoITEM_Options[#RandoITEM_KEYS,2];

_dm_SETTINGS[?STR_Randomize+STR_Spell+STR_Locations]  = dg_RandoSPELL_Options[#RandoSPELL_LOCS,2];
_dm_SETTINGS[?STR_Randomize+STR_Spell+STR_Cost]       = dg_RandoSPELL_Options[#RandoSPELL_COST,2];

_dm_SETTINGS[?STR_Randomize+STR_Dungeon+STR_Room]     = false;
//_dm_SETTINGS[?STR_Randomize+STR_Dungeon+STR_Room]     = dg_RandoDUNGEON_Options[#RandoDUNGEON_ROOM,2];
_dm_SETTINGS[?STR_Randomize+STR_Dungeon+STR_Locations]= dg_RandoDUNGEON_Options[#RandoDUNGEON_LOCATION,2];
_dm_SETTINGS[?STR_Randomize+STR_Dungeon+STR_Boss]     = dg_RandoDUNGEON_Options[#RandoDUNGEON_BOSS,2];
_dm_SETTINGS[?STR_Randomize+STR_Town+STR_Locations]   = dg_RandoDUNGEON_Options[#RandoTOWN_LOCATION,2];

_dm_SETTINGS[?STR_Randomize+STR_Enemy+STR_Difficulty] = dg_RandoENEMY_Options[#RandoENEMY_DIFF,2];
_dm_SETTINGS[?STR_Randomize+STR_Enemy+STR_Method]     = dg_RandoENEMY_Options[#RandoENEMY_CHAR,2];
_dm_SETTINGS[?STR_Randomize+STR_Enemy+STR_Spawner]    = dg_RandoENEMY_Options[#RandoENEMY_SPAWNERS,2];
_dm_SETTINGS[?STR_Randomize+STR_Enemy+STR_ENIGMA]     = dg_RandoENEMY_Options[#RandoENEMY_ENIGMA,2];
_dm_SETTINGS[?STR_Randomize+STR_Enemy+STR_HP]         = dg_RandoENEMY_Options[#RandoENEMY_HP,2];
_dm_SETTINGS[?STR_Randomize+STR_Enemy+STR_Damage]     = dg_RandoENEMY_Options[#RandoENEMY_DAMAGE,2];

_dm_SETTINGS[?STR_Randomize+STR_Level+STR_Cost]       = dg_RandoMAIN_Options[#RandoMAIN_LVLCOST,2];
_dm_SETTINGS[?STR_Randomize+STR_XP]                   = dg_RandoMAIN_Options[#RandoMAIN_XP,2];
_dm_SETTINGS[?STR_Randomize+STR_Palette]              = dg_RandoOTHER_Options[#RandoOTHER_MAIN_PALETTE,2];
_dm_SETTINGS[?STR_Randomize+STR_Dungeon+STR_Tileset]  = dg_RandoOTHER_Options[#RandoOTHER_MAIN_DUNGEON_TS,2];


_dm_SETTINGS[?STR_File+STR_Start+STR_Quest]           = dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor_QUEST,2];




var _SETTINGS = json_encode(_dm_SETTINGS);
ds_map_destroy(_dm_SETTINGS); _dm_SETTINGS=undefined;


return _SETTINGS;




