/// Overworld_init_data()

show_debug_message("Overworld_init_data()");


if (OVERWORLD_INIT_METHOD==1)
{
    // Code automation will not happen in Overworld_init_data_1() if OVERWORLD_INIT_METHOD==1
    Overworld_init_data_1();
}
else
{
    var _REINITIALIZING = false; // *** SET true WHEN ANY OF THIS DATA HAS CHANGED ***
    if (_REINITIALIZING)
    {   // This will print the code for Overworld_init_data_2(). Run it whenever a change is made to the overworld.
        Overworld_init_data_1();
    }
    else
    {   // Paste the code printed from Overworld_init_data_1() in Overworld_init_data_2()
        Overworld_init_data_2();
        if (g.anarkhyaOverworld_MAIN) Overworld_init_data_anarkhya();
    }
}




// -------------------------------------------------------------------------
with(g)
{
    var _DEFAULT    = val(other.dm[?MK_OWRC_NPAL1], OWRC_DFL); // 
    OWRC_TOWN_RAUR1 = val(other.dm[?MK_OWRC_TWN_RAUR1], _DEFAULT); // 
    OWRC_TOWN_RUTO1 = val(other.dm[?MK_OWRC_TWN_RUTO1], _DEFAULT); // 
    OWRC_TOWN_SARI1 = val(other.dm[?MK_OWRC_TWN_SARI1], _DEFAULT); // 
    OWRC_TOWN_SARI2 = val(other.dm[?MK_OWRC_TWN_SARI2], _DEFAULT); // 
    OWRC_TOWN_MIDO1 = val(other.dm[?MK_OWRC_TWN_MIDO1], _DEFAULT); // 
    OWRC_TOWN_NABO1 = val(other.dm[?MK_OWRC_TWN_NABO1], _DEFAULT); // 
    OWRC_TOWN_DARU1 = val(other.dm[?MK_OWRC_TWN_DARU1], _DEFAULT); // 
    OWRC_TOWN_NEWK1 = val(other.dm[?MK_OWRC_TWN_NEWK1], _DEFAULT); // 
    OWRC_TOWN_OLDK1 = val(other.dm[?MK_OWRC_TWN_OLDK1], _DEFAULT); // 
    OWRC_TOWN_BULB1 = val(other.dm[?MK_OWRC_TWN_BULB1], _DEFAULT); // 
    //                                                          // 
    OWRC_DNGN_PRPA1 = val(other.dm[?MK_OWRC_PAL_PRPA1], _DEFAULT); // 
    OWRC_DNGN_MDRO1 = val(other.dm[?MK_OWRC_PAL_MDRO1], _DEFAULT); // 
    OWRC_DNGN_ISLD1 = val(other.dm[?MK_OWRC_PAL_ISLD1], _DEFAULT); // 
    OWRC_DNGN_MAZE1 = val(other.dm[?MK_OWRC_PAL_MAZE1], _DEFAULT); // 
    OWRC_DNGN_POTS1 = val(other.dm[?MK_OWRC_PAL_POTS1], _DEFAULT); // 
    OWRC_DNGN_THRE1 = val(other.dm[?MK_OWRC_PAL_THRE1], _DEFAULT); // 
    OWRC_DNGN_GRET1 = val(other.dm[?MK_OWRC_PAL_GRET1], _DEFAULT); // 
    OWRC_DNGN_DRAG1 = val(other.dm[?MK_OWRC_PAL_DRAG1], _DEFAULT);
    
    dm_dungeon[?STR_Dungeon+"01"+STR_OWRC] = OWRC_DNGN_PRPA1;
    dm_dungeon[?STR_Dungeon+"02"+STR_OWRC] = OWRC_DNGN_MDRO1;
    dm_dungeon[?STR_Dungeon+"03"+STR_OWRC] = OWRC_DNGN_ISLD1;
    dm_dungeon[?STR_Dungeon+"04"+STR_OWRC] = OWRC_DNGN_MAZE1;
    dm_dungeon[?STR_Dungeon+"05"+STR_OWRC] = OWRC_DNGN_POTS1;
    dm_dungeon[?STR_Dungeon+"06"+STR_OWRC] = OWRC_DNGN_THRE1;
    dm_dungeon[?STR_Dungeon+"07"+STR_OWRC] = OWRC_DNGN_GRET1;
    //dm_dungeon[?STR_Dungeon+"08"+STR_OWRC] = ;
    
    OWRC_NO_EXIT_DATA = _DEFAULT + $10;
}




