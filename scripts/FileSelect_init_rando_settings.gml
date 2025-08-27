/// FileSelect_init_rando_settings()


dg_RandoMAIN_Options[#RandoMAIN_ITEMS  ,2] = 0;
dg_RandoMAIN_Options[#RandoMAIN_SPELLS ,2] = 0;
dg_RandoMAIN_Options[#RandoMAIN_ENEMIES,2] = 0;
dg_RandoMAIN_Options[#RandoMAIN_LVLCOST,2] = 0;
dg_RandoMAIN_Options[#RandoMAIN_XP     ,2] = 0;
//dg_RandoMAIN_Options[#RandoMAIN_UP_A_XP_PENALTY,2] = 1;
//dg_RandoMAIN_Options[#RandoMAIN_PALETTE,2] = 0;
dg_RandoMAIN_Options[#RandoMAIN_OTHER  ,2] = 0;
dg_RandoMAIN_Options[#RandoMAIN_SEED   ,2] = 0;
dg_RandoMAIN_Options[#RandoMAIN_BACK   ,2] = 0;
//                                                          //
//                                                          //
//                                                          //
dg_RandoITEM_Options[#RandoITEM_OBSCURE_LOCS,2] = 0;
//dg_RandoITEM_Options[#RandoITEM_METHOD,    2] = 1;
dg_RandoITEM_Options[#RandoITEM_DARKROOM,  2] = 0;
dg_RandoITEM_Options[#RandoITEM_HINTS,     2] = 0;
dg_RandoITEM_Options[#RandoITEM_ZELDA_HINT,2] = ZELDA_HINT_OPTIONS.NONE;
dg_RandoITEM_Options[#RandoITEM_LOCS,      2] = 0;
dg_RandoITEM_Options[#RandoITEM_PBAG,      2] = 0;
dg_RandoITEM_Options[#RandoITEM_KEYS,      2] = 0;
dg_RandoITEM_Options[#RandoITEM_BACK,      2] = 0;
//                                                          //
//                                                          //
//                                                          //
dg_RandoSPELL_Options[#RandoSPELL_LOCS,2] = 0;
dg_RandoSPELL_Options[#RandoSPELL_COST,2] = 0;
dg_RandoSPELL_Options[#RandoSPELL_BACK,2] = 0;
//                                                          //
//                                                          //
//                                                          //
if (RandoDUNGEON_DIFF>=0)
{
    if (dg_RandoDUNGEON_Options[#RandoDUNGEON_DIFF,2]>-1)
    {   dg_RandoDUNGEON_Options[#RandoDUNGEON_DIFF,2] = 1;  }
}
//                                                          //
/*
if (dg_RandoDUNGEON_Options[#RandoDUNGEON_TILESET, 2]>-1)
{   dg_RandoDUNGEON_Options[#RandoDUNGEON_TILESET, 2] = 0;  }
//                                                          //
*/
if (RandoDUNGEON_ROOM>=0)
{
    if (dg_RandoDUNGEON_Options[#RandoDUNGEON_ROOM,2]>-1)
    {   dg_RandoDUNGEON_Options[#RandoDUNGEON_ROOM,2] = 0;  }
}
//                                                          //
if (dg_RandoDUNGEON_Options[#RandoDUNGEON_LOCATION,2]>-1)
{   dg_RandoDUNGEON_Options[#RandoDUNGEON_LOCATION,2] = 0;  }
//                                                          //
if (dg_RandoDUNGEON_Options[#RandoDUNGEON_BOSS,    2]>-1)
{   dg_RandoDUNGEON_Options[#RandoDUNGEON_BOSS,    2] = 0;  }
//                                                          //
if (dg_RandoDUNGEON_Options[#RandoTOWN_LOCATION,   2]>-1)
{   dg_RandoDUNGEON_Options[#RandoTOWN_LOCATION,   2] = 0;  }
//                                                          //
    dg_RandoDUNGEON_Options[#RandoDUNGEON_BACK,    2] = 0;
//                                                          //
//                                                          //
//                                                          //
dg_RandoENEMY_Options[#RandoENEMY_DIFF,    2] = 1;
dg_RandoENEMY_Options[#RandoENEMY_CHAR,    2] = 0;
dg_RandoENEMY_Options[#RandoENEMY_HP,      2] = 0;
dg_RandoENEMY_Options[#RandoENEMY_DAMAGE,  2] = 0;
dg_RandoENEMY_Options[#RandoENEMY_SPAWNERS,2] = 0;
dg_RandoENEMY_Options[#RandoENEMY_ENIGMA,  2] = 0;
dg_RandoENEMY_Options[#RandoENEMY_BACK,    2] = 0;
//                                                          //
//                                                          //
//                                                          //
dg_RandoOTHER_Options[#RandoOTHER_MAIN_WARP_PENALTY,  2] = 1;
dg_RandoOTHER_Options[#RandoOTHER_MAIN_PALETTE,       2] = 0;
dg_RandoOTHER_Options[#RandoOTHER_MAIN_DUNGEON_TS,    2] = 0;
dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor_QUEST,  2] = 1;
dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor_ATTACK, 2] = 1;
dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor_MAGIC,  2] = 1;
dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor_LIFE,   2] = 1;
dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor_ITEMS,  2] = 0;
dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor_SPELLS, 2] = 0;
dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor_REQUIRE,2] = 0;
dg_RandoOTHER_Options[#RandoOTHER_MAIN_cursor_BACK,   2] = 0;


dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_CANDLE, 2] = 0;
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_SHIELD, 2] = 0;
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_BAIT,   2] = 0;
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_RING,   2] = 0;
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_PENDANT,2] = 0;
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_SWORD,  2] = 0;
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_FEATHER,2] = 0;
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_NOTE,   2] = 0;
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAP1,   2] = 0;
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAP2,   2] = 0;
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_DOLLS,  2] = 0;
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_HEART,  2] = f.CONT_MIN_HP;
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAGIC,  2] = f.CONT_MIN_MP;


dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_PROTECT,2] = 0;
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_JUMP,   2] = 0;
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_HEAL,   2] = 0;
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_FAIRY,  2] = 0;
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_FIRE,   2] = 0;
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_REFLECT,2] = 0;
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_ENIGMA, 2] = 0;
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_THUNDER,2] = 0;
//dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_SUMMON, 2] = 0;


dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_CRYSTALS,2] = f.CRYSTAL_MAX;
dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_KAKUSU,  2] = val(g.dm_spawn[?STR_Kakusu+STR_Count]);
//                                                          //
//                                                          //
//                                                          //
dg_RandoSEED_Options[#RandoSEED_EDIT,2] = 1;
dg_RandoSEED_Options[#RandoSEED_NEW, 2] = 1;
dg_RandoSEED_Options[#RandoSEED_BACK,2] = 0;
//                                                          //
//                                                          //
//                                                          //

//                                                          //
//                                                          //
//                                                          //




