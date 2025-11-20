/// FileSelect_Rando_get_rando_settings()


var _i, _val;
var _dm_SETTINGS=ds_map_create();


_dm_SETTINGS[?dk_LimitObscure]                        = dg_RandoITEM_Options[#RandoITEM_OBSCURE_LOCS,2];
_dm_SETTINGS[?dk_DarkRoom+STR_Difficulty]             = dg_RandoITEM_Options[#RandoITEM_DARKROOM,2];
_dm_SETTINGS[?STR_Item+STR_Location+STR_Hint]         = dg_RandoITEM_Options[#RandoITEM_HINTS,2];
_dm_SETTINGS[?STR_Zelda+STR_Hint]                     = dg_RandoITEM_Options[#RandoITEM_ZELDA_HINT,2];
_dm_SETTINGS[?STR_Randomize+STR_Item+STR_Locations]   = dg_RandoITEM_Options[#RandoITEM_LOCS,2];
_dm_SETTINGS[?STR_Randomize+STR_PBAG+STR_Locations]   = dg_RandoITEM_Options[#RandoITEM_PBAG,2];
_dm_SETTINGS[?STR_Randomize+STR_Key +STR_Locations]   = dg_RandoITEM_Options[#RandoITEM_KEYS,2];

_dm_SETTINGS[?STR_Randomize+STR_Spell+STR_Locations]  = dg_RandoSPELL_Options[#RandoSPELL_LOCS,2];
_dm_SETTINGS[?STR_Randomize+STR_Spell+STR_Cost]       = dg_RandoSPELL_Options[#RandoSPELL_COST,2];

_dm_SETTINGS[?STR_Randomize+STR_Dungeon+STR_Room]     = false;
_dm_SETTINGS[?STR_Randomize+STR_Dungeon+STR_Room]     = dg_RandoDUNGEON_Options[#RandoDUNGEON_ROOM,2];
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

_dm_SETTINGS[?STR_File+STR_Start+STR_Level+STR_Attack] = dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor_ATTACK,2];
_dm_SETTINGS[?STR_File+STR_Start+STR_Level+STR_Magic]  = dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor_MAGIC, 2];
_dm_SETTINGS[?STR_File+STR_Start+STR_Level+STR_Life]   = dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor_LIFE,  2];


_dm_SETTINGS[?STR_File+STR_Start+STR_CANDLE]  = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_CANDLE,2];
_dm_SETTINGS[?STR_File+STR_Start+STR_FLUTE]   = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_FLUTE,2];
_dm_SETTINGS[?STR_File+STR_Start+STR_MEAT]    = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_BAIT,2];
_dm_SETTINGS[?STR_File+STR_Start+STR_SHIELD]  = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_SHIELD,2];
_dm_SETTINGS[?STR_File+STR_Start+STR_RING]    = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_RING,2];
_dm_SETTINGS[?STR_File+STR_Start+STR_PENDANT] = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_PENDANT,2];
_dm_SETTINGS[?STR_File+STR_Start+STR_SWORD]   = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_SWORD,2];
_dm_SETTINGS[?STR_File+STR_Start+STR_FEATHER] = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_FEATHER,2];
_dm_SETTINGS[?STR_File+STR_Start+STR_NOTE]    = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_NOTE,2];
_dm_SETTINGS[?STR_File+STR_Start+STR_MAP1]    = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAP1,2];
_dm_SETTINGS[?STR_File+STR_Start+STR_MAP2]    = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAP2,2];
var _start_items = 0;
for(_i=0; _i<RandoOTHER_ITEMS_item_cursor_COUNT; _i++)
{
    if (dg_RandoOTHER_ITEMS[#_i,2])
    {
        _val = string(dg_RandoOTHER_ITEMS[#_i,3]);
        _val = val(g.dm_ITEM[?_val+STR_Bit]);
        _start_items |= _val;
    }
}
_dm_SETTINGS[?STR_File+STR_Start+STR_Items] = _start_items;


_dm_SETTINGS[?STR_File+STR_Start+STR_Container+STR_HP] = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_HEART,2];
_dm_SETTINGS[?STR_File+STR_Start+STR_Container+STR_MP] = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAGIC,2];
_dm_SETTINGS[?STR_File+STR_Start+STR_Dolls] = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_DOLLS,2];
//_dm_SETTINGS[?STR_File+STR_Start+STR_Dolls] = clamp(dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_DOLLS,2], 0,val(f.dm_1up_doll[?STR_Count])-(dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor_QUEST,2]==2));

_dm_SETTINGS[?STR_File+STR_Start+STR_PROTECT] = dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_PROTECT,2];
_dm_SETTINGS[?STR_File+STR_Start+STR_JUMP]    = dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_JUMP,   2];
_dm_SETTINGS[?STR_File+STR_Start+STR_HEAL]    = dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_HEAL,   2];
_dm_SETTINGS[?STR_File+STR_Start+STR_FAIRY]   = dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_FAIRY,  2];
_dm_SETTINGS[?STR_File+STR_Start+STR_FIRE]    = dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_FIRE,   2];
_dm_SETTINGS[?STR_File+STR_Start+STR_REFLECT] = dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_REFLECT,2];
_dm_SETTINGS[?STR_File+STR_Start+STR_ENIGMA]  = dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_ENIGMA, 2];
_dm_SETTINGS[?STR_File+STR_Start+STR_THUNDER] = dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_THUNDER,2];
//_dm_SETTINGS[?STR_File+STR_Start+STR_SUMMON]  = dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_SUMMON, 2];

_dm_SETTINGS[?STR_File+STR_Start+STR_STABDOWN] = dg_RandoOTHER_SKILLS[#RandoOTHER_SKILLS_cursor_STABDOWN,2];
_dm_SETTINGS[?STR_File+STR_Start+STR_STABUP]   = dg_RandoOTHER_SKILLS[#RandoOTHER_SKILLS_cursor_STABUP,  2];

_dm_SETTINGS[?STR_Kakusu+STR_Required+STR_Count]  = dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_KAKUSU,  2];
_dm_SETTINGS[?STR_Crystal+STR_Required+STR_Count] = dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_CRYSTALS,2];

_dm_SETTINGS[?dk_ForceQuitPenalty] = dg_RandoOTHER_Options[#RandoOTHER_MAIN_WARP_PENALTY,2];
//_dm_SETTINGS[?STR_Rando+"_UP_A"+STR_XP+"_Penalty"] = dg_RandoOTHER_Options[#RandoOTHER_MAIN_WARP_PENALTY,2];




var _SETTINGS = json_encode(_dm_SETTINGS);
ds_map_destroy(_dm_SETTINGS); _dm_SETTINGS=undefined;


return _SETTINGS;




