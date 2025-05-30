/// f_Game_End()


//ar_FILE_NAMES = 0;
//ar_save_names = 0;


/*
var _exists = false;


    _exists=variable_instance_exists(id,"dl_");
if (_exists) _exists = !is_undefined(    dl_);
if (_exists) _exists = ds_exists(        dl_,ds_type_list);
if (_exists)           ds_list_destroy(  dl_);
if (_exists)                             dl_=undefined;

    _exists=variable_instance_exists(id,"dm_");
if (_exists) _exists = !is_undefined(    dm_);
if (_exists) _exists = ds_exists(        dm_,ds_type_map);
if (_exists)           ds_map_destroy(   dm_);
if (_exists)                             dm_=undefined;

    _exists=variable_instance_exists(id,"dg_");
if (_exists) _exists = !is_undefined(    dg_);
if (_exists) _exists = ds_exists(        dg_,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_);
if (_exists)                             dg_=undefined;

    _exists=variable_instance_exists(id,"ds_");
if (_exists) _exists = !is_undefined(    ds_);
if (_exists) _exists = ds_exists(        ds_,ds_type_stack);
if (_exists)           ds_stack_destroy( ds_);
if (_exists)                             ds_=undefined;
*/






var _exists = false;



    _exists=variable_instance_exists(id,"dl_save_names");
if (_exists) _exists = !is_undefined(    dl_save_names);
if (_exists) _exists = ds_exists(        dl_save_names,ds_type_list);
if (_exists)           ds_list_destroy(  dl_save_names);
if (_exists)                             dl_save_names=undefined;

    _exists=variable_instance_exists(id,"dl_file_names");
if (_exists) _exists = !is_undefined(    dl_file_names);
if (_exists) _exists = ds_exists(        dl_file_names,ds_type_list);
if (_exists)           ds_list_destroy(  dl_file_names);
if (_exists)                             dl_file_names=undefined;

    _exists = variable_instance_exists(id,  "dl_FILE_NAME_PREFIX");
if (_exists) _exists =      !is_undefined(   dl_FILE_NAME_PREFIX);
if (_exists) _exists =       ds_exists(      dl_FILE_NAME_PREFIX, ds_type_list);
if (_exists)                 ds_list_destroy(dl_FILE_NAME_PREFIX);
if (_exists)                                 dl_FILE_NAME_PREFIX = undefined;
/*
    _exists = variable_instance_exists(id,  "dl_target_games");
if (_exists) _exists =      !is_undefined(   dl_target_games);
if (_exists) _exists =       ds_exists(      dl_target_games, ds_type_list);
if (_exists)                 ds_list_destroy(dl_target_games);
if (_exists)                                 dl_target_games = undefined;
*/




             _exists = variable_instance_exists(id,  "dm_challenges");
if (_exists) _exists =               !is_undefined(   dm_challenges);
if (_exists) _exists =                ds_exists(      dm_challenges, ds_type_map);
if (_exists)                          ds_map_destroy( dm_challenges);
if (_exists)                                          dm_challenges = undefined;
/*
             _exists = variable_instance_exists(id,  "dm_cont");
if (_exists) _exists =               !is_undefined(   dm_cont);
if (_exists) _exists =                ds_exists(      dm_cont, ds_type_map);
if (_exists)                          ds_map_destroy( dm_cont);
if (_exists)                                          dm_cont = undefined;
*/
             _exists = variable_instance_exists(id,  "dm_keys");
if (_exists) _exists =               !is_undefined(   dm_keys);
if (_exists) _exists =                ds_exists(      dm_keys, ds_type_map);
if (_exists)                          ds_map_destroy( dm_keys);
if (_exists)                                          dm_keys = undefined;

    _exists = variable_instance_exists(id, "dm_keys_DEFAULT");
if (_exists) _exists =      !is_undefined(  dm_keys_DEFAULT);
if (_exists) _exists =       ds_exists(     dm_keys_DEFAULT, ds_type_map);
if (_exists)                 ds_map_destroy(dm_keys_DEFAULT);
if (_exists)                                dm_keys_DEFAULT = undefined;

             _exists = variable_instance_exists(id,  "dm_openedLocks");
if (_exists) _exists =               !is_undefined(   dm_openedLocks);
if (_exists) _exists =                ds_exists(      dm_openedLocks, ds_type_map);
if (_exists)                          ds_map_destroy( dm_openedLocks);
if (_exists)                                          dm_openedLocks = undefined;

             _exists = variable_instance_exists(id,  "dm_kakusu");
if (_exists) _exists =               !is_undefined(   dm_kakusu);
if (_exists) _exists =                ds_exists(      dm_kakusu, ds_type_map);
if (_exists)                          ds_map_destroy( dm_kakusu);
if (_exists)                                          dm_kakusu = undefined;

             _exists = variable_instance_exists(id,  "dm_PBags");
if (_exists) _exists =               !is_undefined(   dm_PBags);
if (_exists) _exists =                ds_exists(      dm_PBags, ds_type_map);
if (_exists)                          ds_map_destroy( dm_PBags);
if (_exists)                                          dm_PBags = undefined;

             _exists = variable_instance_exists(id,  "dm_PBags_DEFAULT");
if (_exists) _exists =               !is_undefined(   dm_PBags_DEFAULT);
if (_exists) _exists =                ds_exists(      dm_PBags_DEFAULT, ds_type_map);
if (_exists)                          ds_map_destroy( dm_PBags_DEFAULT);
if (_exists)                                          dm_PBags_DEFAULT = undefined;
/*
             _exists = variable_instance_exists(id,  "dm_takenPBags");
if (_exists) _exists =               !is_undefined(   dm_takenPBags);
if (_exists) _exists =                ds_exists(      dm_takenPBags, ds_type_map);
if (_exists)                          ds_map_destroy( dm_takenPBags);
if (_exists)                                          dm_takenPBags = undefined;
*/
             _exists = variable_instance_exists(id,  "dm_1up_doll");
if (_exists) _exists =               !is_undefined(   dm_1up_doll);
if (_exists) _exists =                ds_exists(      dm_1up_doll, ds_type_map);
if (_exists)                          ds_map_destroy( dm_1up_doll);
if (_exists)                                          dm_1up_doll = undefined;

             _exists = variable_instance_exists(id,  "dm_1up_doll_DEFAULT");
if (_exists) _exists =               !is_undefined(   dm_1up_doll_DEFAULT);
if (_exists) _exists =                ds_exists(      dm_1up_doll_DEFAULT, ds_type_map);
if (_exists)                          ds_map_destroy( dm_1up_doll_DEFAULT);
if (_exists)                                          dm_1up_doll_DEFAULT = undefined;

             _exists = variable_instance_exists(id,  "dm_explored");
if (_exists) _exists =               !is_undefined(   dm_explored);
if (_exists) _exists =                ds_exists(      dm_explored, ds_type_map);
if (_exists)                          ds_map_destroy( dm_explored);
if (_exists)                                          dm_explored = undefined;

             _exists = variable_instance_exists(id,  "dm_jars");
if (_exists) _exists =               !is_undefined(   dm_jars);
if (_exists) _exists =                ds_exists(      dm_jars, ds_type_map);
if (_exists)                          ds_map_destroy( dm_jars);
if (_exists)                                          dm_jars = undefined;

             _exists = variable_instance_exists(id,  "dm_quests");
if (_exists) _exists =               !is_undefined(   dm_quests);
if (_exists) _exists =                ds_exists(      dm_quests, ds_type_map);
if (_exists)                          ds_map_destroy( dm_quests);
if (_exists)                                          dm_quests = undefined;

    _exists = variable_instance_exists(id, "dm_rando");
if (_exists) _exists =      !is_undefined(  dm_rando);
if (_exists) _exists =       ds_exists(     dm_rando, ds_type_map);
if (_exists)                 ds_map_destroy(dm_rando);
if (_exists)                                dm_rando = undefined;
/*
             _exists = variable_instance_exists(id,  "dm_rando_data");
if (_exists) _exists =               !is_undefined(   dm_rando_data);
if (_exists) _exists =                ds_exists(      dm_rando_data, ds_type_map);
if (_exists)                          ds_map_destroy( dm_rando_data);
if (_exists)                                          dm_rando_data = undefined;
*/

    _exists = variable_instance_exists(id, "dm_jars_DEFAULT");
if (_exists) _exists =      !is_undefined(  dm_jars_DEFAULT);
if (_exists) _exists =       ds_exists(     dm_jars_DEFAULT, ds_type_map);
if (_exists)                 ds_map_destroy(dm_jars_DEFAULT);
if (_exists)                                dm_jars_DEFAULT = undefined;

/*
    _exists = variable_instance_exists(id, "dm_target_game");
if (_exists) _exists =      !is_undefined(  dm_target_game);
if (_exists) _exists =       ds_exists(     dm_target_game, ds_type_map);
if (_exists)                 ds_map_destroy(dm_target_game);
if (_exists)                                dm_target_game = undefined;
*/

if (ds_exists( global.dm_save_file_data,ds_type_map)){
ds_map_destroy(global.dm_save_file_data);
               global.dm_save_file_data=undefined;
}








    _exists = variable_instance_exists(id,  "dg_xp_next");
if (_exists) _exists =      !is_undefined(   dg_xp_next);
if (_exists) _exists =       ds_exists(      dg_xp_next, ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_xp_next);
if (_exists)                                 dg_xp_next = undefined;

    _exists = variable_instance_exists(id,  "dg_xp_next_DEFAULT");
if (_exists) _exists =      !is_undefined(   dg_xp_next_DEFAULT);
if (_exists) _exists =       ds_exists(      dg_xp_next_DEFAULT, ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_xp_next_DEFAULT);
if (_exists)                                 dg_xp_next_DEFAULT = undefined;











