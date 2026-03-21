/// set_save_props_def()

// If about to register a new save file, make sure props that 
// will be saved are set to default.


with(f)
{
    global.QuestTimer_time = 0;
    quest_num = 1;
    
    death_count = 0; // og sets to 0 on quest 2
    lives = g.STARTING_LIVES;
    
    level_atk = 1;
    level_mag = 1;
    level_lif = 1;
    
    xp        = 0;
    xpNext    = 0;
    xpPending = 0;
    xpDrain   = 0;
    
    
    spells = 0;
    g.CuccoSpell2_Acquired  = 0;
    
    
    skills              = 0;
    Cucco_skills        = 0;
    
    
    crystals            = 0; // 0 PLACED
    
    cont_pieces_hp = CONT_PIECES_HP_DEF;
    cont_pieces_mp = CONT_PIECES_MP_DEF;
    hp = get_stat_max(STR_Heart);
    mp = get_stat_max(STR_Magic);
    
    items               = 0;
    
    kakusu_count        = 0; // How many kakusu have been killed
    ds_map_clear(dm_kakusu);
    
    key_count           = 0;
    ds_map_copy(dm_keys, dm_keys_DEFAULT);
    ds_map_clear(dm_openedLocks);
    
    ds_map_copy(dm_jars, dm_jars_DEFAULT);
    ds_map_copy(dm_PBags, dm_PBags_DEFAULT);
    
    set_life_doll_data_to_default();
    ds_map_copy(dm_1up_doll, dm_1up_doll_DEFAULT);
    
    
    ds_map_clear(dm_explored);
    reen_new_run = REEN_NEW_FILE; // Coming from FileSelect. This will be from saved data
    reen         = reen_new_run;  // The exit to spawn at
    cont_run_town_num = 0;
    
    
    ds_map_clear(g.dm_RandoHintsRecorder);
    
    
    game_completed_count = 0;
    ds_map_clear(dm_challenges);
    ds_map_clear(dm_quests);
    init_save_data1();
}




