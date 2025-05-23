/// Overworld_Game_End()


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




var _exists=false;


// DS List
    _exists = variable_instance_exists(id,  "dl_biome_enc");
if (_exists) _exists =      !is_undefined(   dl_biome_enc);
if (_exists) _exists =       ds_exists(      dl_biome_enc, ds_type_list);
if (_exists){                ds_list_destroy(dl_biome_enc); dl_biome_enc=undefined;}

    _exists = variable_instance_exists(id,  "dl_biome_enc_spawn_trigger");
if (_exists) _exists =      !is_undefined(   dl_biome_enc_spawn_trigger);
if (_exists) _exists =       ds_exists(      dl_biome_enc_spawn_trigger, ds_type_list);
if (_exists)                 ds_list_destroy(dl_biome_enc_spawn_trigger);
if (_exists)                                 dl_biome_enc_spawn_trigger=undefined;

    _exists = variable_instance_exists(id,  "dl_biome_battle");
if (_exists) _exists =      !is_undefined(   dl_biome_battle);
if (_exists) _exists =       ds_exists(      dl_biome_battle, ds_type_list);
if (_exists)                 ds_list_destroy(dl_biome_battle);
if (_exists)                                 dl_biome_battle=undefined;

    _exists = variable_instance_exists(id,  "dl_enc_spawn_cooldown_dur");
if (_exists) _exists =      !is_undefined(   dl_enc_spawn_cooldown_dur);
if (_exists) _exists =       ds_exists(      dl_enc_spawn_cooldown_dur, ds_type_list);
if (_exists)                 ds_list_destroy(dl_enc_spawn_cooldown_dur);
if (_exists)                                 dl_enc_spawn_cooldown_dur=undefined;

    _exists = variable_instance_exists(id,  "dl_enc_inst_life_dur");
if (_exists) _exists =      !is_undefined(   dl_enc_inst_life_dur);
if (_exists) _exists =       ds_exists(      dl_enc_inst_life_dur, ds_type_list);
if (_exists)                 ds_list_destroy(dl_enc_inst_life_dur);
if (_exists)                                 dl_enc_inst_life_dur=undefined;

    _exists = variable_instance_exists(id,  "dl_BoulderCircle_OWRC");
if (_exists) _exists =      !is_undefined(   dl_BoulderCircle_OWRC);
if (_exists) _exists =       ds_exists(      dl_BoulderCircle_OWRC, ds_type_list);
if (_exists)                 ds_list_destroy(dl_BoulderCircle_OWRC);
if (_exists)                                 dl_BoulderCircle_OWRC=undefined;

    _exists = variable_instance_exists(id,  "dl_WaterSparkle_RC");
if (_exists) _exists =      !is_undefined(   dl_WaterSparkle_RC);
if (_exists) _exists =       ds_exists(      dl_WaterSparkle_RC, ds_type_list);
if (_exists)                 ds_list_destroy(dl_WaterSparkle_RC);
if (_exists)                                 dl_WaterSparkle_RC=undefined;





// DS Map
    _exists = variable_instance_exists(id,  "dm");
if (_exists) _exists =      !is_undefined(   dm);
if (_exists) _exists =       ds_exists(      dm, ds_type_map);
if (_exists)                 ds_map_destroy( dm);
if (_exists)                                 dm=undefined;

    _exists = variable_instance_exists(id,  "dm_enc");
if (_exists) _exists =      !is_undefined(   dm_enc);
if (_exists) _exists =       ds_exists(      dm_enc, ds_type_map);
if (_exists)                 ds_map_destroy( dm_enc);
if (_exists)                                 dm_enc=undefined;

    _exists = variable_instance_exists(id,  "dm_rando_locations");
if (_exists) _exists =      !is_undefined(   dm_rando_locations);
if (_exists) _exists =       ds_exists(      dm_rando_locations,ds_type_map);
if (_exists)                 ds_map_destroy( dm_rando_locations);
if (_exists)                                 dm_rando_locations=undefined;

    _exists = variable_instance_exists(id,  "dm_Rando_TSRC");
if (_exists) _exists =      !is_undefined(   dm_Rando_TSRC);
if (_exists) _exists =       ds_exists(      dm_Rando_TSRC,ds_type_map);
if (_exists)                 ds_map_destroy( dm_Rando_TSRC);
if (_exists)                                 dm_Rando_TSRC=undefined;
/*
    _exists=variable_instance_exists(id,"dm_rando_biome");
if (_exists) _exists = !is_undefined(    dm_rando_biome);
if (_exists) _exists = ds_exists(        dm_rando_biome,ds_type_map);
if (_exists)           ds_map_destroy(   dm_rando_biome);
if (_exists)                             dm_rando_biome=undefined;
*/





// DS Grid
/*
    _exists = variable_instance_exists(id,  "dg_pc_spr");
if (_exists) _exists =      !is_undefined(   dg_pc_spr);
if (_exists) _exists =       ds_exists(      dg_pc_spr, ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_pc_spr);
if (_exists)                                 dg_pc_spr=undefined;
*/
/*
    _exists = variable_instance_exists(id,  "dg_RAFT_SPR");
if (_exists) _exists =      !is_undefined(   dg_RAFT_SPR);
if (_exists) _exists =       ds_exists(      dg_RAFT_SPR, ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_RAFT_SPR);
if (_exists)                                 dg_RAFT_SPR=undefined;
*/
    _exists = variable_instance_exists(id,  "dg_solid");
if (_exists) _exists =      !is_undefined(   dg_solid);
if (_exists) _exists =       ds_exists(      dg_solid, ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_solid);
if (_exists)                                 dg_solid=undefined;

    _exists = variable_instance_exists(id,  "dg_solid_def");
if (_exists) _exists =      !is_undefined(   dg_solid_def);
if (_exists) _exists =       ds_exists(      dg_solid_def, ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_solid_def);
if (_exists)                                 dg_solid_def=undefined;

    _exists = variable_instance_exists(id,  "dg_tsrc_def");
if (_exists) _exists =      !is_undefined(   dg_tsrc_def);
if (_exists) _exists =       ds_exists(      dg_tsrc_def, ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_tsrc_def);
if (_exists)                                 dg_tsrc_def=undefined;

    _exists = variable_instance_exists(id,  "dg_tsrc");
if (_exists) _exists =      !is_undefined(   dg_tsrc);
if (_exists) _exists =       ds_exists(      dg_tsrc, ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_tsrc);
if (_exists)                                 dg_tsrc=undefined;

    _exists = variable_instance_exists(id,  "dg_enc_inst");
if (_exists) _exists =      !is_undefined(   dg_enc_inst);
if (_exists) _exists =       ds_exists(      dg_enc_inst, ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_enc_inst);
if (_exists)                                 dg_enc_inst=undefined;

    _exists = variable_instance_exists(id,  "dg_ENC_SPR");
if (_exists) _exists =      !is_undefined(   dg_ENC_SPR);
if (_exists) _exists =       ds_exists(      dg_ENC_SPR, ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_ENC_SPR);
if (_exists)                                 dg_ENC_SPR=undefined;

    _exists = variable_instance_exists(id,  "dg_enc_obj_id_spawn_data_1");
if (_exists) _exists =      !is_undefined(   dg_enc_obj_id_spawn_data_1);
if (_exists) _exists =       ds_exists(      dg_enc_obj_id_spawn_data_1, ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_enc_obj_id_spawn_data_1);
if (_exists)                                 dg_enc_obj_id_spawn_data_1=undefined;

    _exists = variable_instance_exists(id,  "dg_enc_obj_id_spawn_data_2");
if (_exists) _exists =      !is_undefined(   dg_enc_obj_id_spawn_data_2);
if (_exists) _exists =       ds_exists(      dg_enc_obj_id_spawn_data_2, ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_enc_obj_id_spawn_data_2);
if (_exists)                                 dg_enc_obj_id_spawn_data_2=undefined;

    _exists = variable_instance_exists(id,  "dg_AreaNames_DEF");
if (_exists) _exists =      !is_undefined(   dg_AreaNames_DEF);
if (_exists) _exists =       ds_exists(      dg_AreaNames_DEF, ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_AreaNames_DEF);
if (_exists)                                 dg_AreaNames_DEF=undefined;

    _exists = variable_instance_exists(id,  "dg_AreaNames");
if (_exists) _exists =      !is_undefined(   dg_AreaNames);
if (_exists) _exists =       ds_exists(      dg_AreaNames, ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_AreaNames);
if (_exists)                                 dg_AreaNames=undefined;

    _exists = variable_instance_exists(id,  "TreasureMaps_dg");
if (_exists) _exists =      !is_undefined(   TreasureMaps_dg);
if (_exists) _exists =       ds_exists(      TreasureMaps_dg, ds_type_grid);
if (_exists)                 ds_grid_destroy(TreasureMaps_dg);
if (_exists)                                 TreasureMaps_dg=undefined;

    _exists = variable_instance_exists(id,  "dg_ChangeTiles_Boots");
if (_exists) _exists =      !is_undefined(   dg_ChangeTiles_Boots);
if (_exists) _exists =       ds_exists(      dg_ChangeTiles_Boots, ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_ChangeTiles_Boots);
if (_exists)                                 dg_ChangeTiles_Boots=undefined;

    _exists = variable_instance_exists(id,  "HiddenExitIndicator_dg");
if (_exists) _exists =      !is_undefined(   HiddenExitIndicator_dg);
if (_exists) _exists =       ds_exists(      HiddenExitIndicator_dg,ds_type_grid);
if (_exists)                 ds_grid_destroy(HiddenExitIndicator_dg);
if (_exists)                                 HiddenExitIndicator_dg=undefined;

    _exists = variable_instance_exists(id,  "Warp_dg_DESTINATIONS");
if (_exists) _exists =      !is_undefined(   Warp_dg_DESTINATIONS);
if (_exists) _exists =       ds_exists(      Warp_dg_DESTINATIONS,ds_type_grid);
if (_exists)                 ds_grid_destroy(Warp_dg_DESTINATIONS);
if (_exists)                                 Warp_dg_DESTINATIONS=undefined;

    _exists = variable_instance_exists(id,  "dg_boulders");
if (_exists) _exists =      !is_undefined(   dg_boulders);
if (_exists) _exists =       ds_exists(      dg_boulders,ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_boulders);
if (_exists)                                 dg_boulders=undefined;

    _exists = variable_instance_exists(id,  "dg_WaterSparkle");
if (_exists) _exists =      !is_undefined(   dg_WaterSparkle);
if (_exists) _exists =       ds_exists(      dg_WaterSparkle,ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_WaterSparkle);
if (_exists)                                 dg_WaterSparkle=undefined;

    _exists = variable_instance_exists(id,  "dg_BTI");
if (_exists) _exists =      !is_undefined(   dg_BTI);
if (_exists) _exists =       ds_exists(      dg_BTI,ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_BTI);
if (_exists)                                 dg_BTI=undefined;






if (g.anarkhyaOverworld_MAIN)
{
    /*
        _exists = variable_instance_exists(id,  "dl_anarkhya_ts");
    if (_exists) _exists =      !is_undefined(   dl_anarkhya_ts);
    if (_exists) _exists =       ds_exists(      dl_anarkhya_ts,ds_type_list);
    if (_exists)                 ds_list_destroy(dl_anarkhya_ts);
    if (_exists)                                 dl_anarkhya_ts=undefined;
    */
        _exists = variable_instance_exists(id,  "dg_anarkhya_tsrc_def");
    if (_exists) _exists =      !is_undefined(   dg_anarkhya_tsrc_def);
    if (_exists) _exists =       ds_exists(      dg_anarkhya_tsrc_def,ds_type_grid);
    if (_exists)                 ds_grid_destroy(dg_anarkhya_tsrc_def);
    if (_exists)                                 dg_anarkhya_tsrc_def=undefined;
    
        _exists = variable_instance_exists(id,  "dg_anarkhya_tsrc");
    if (_exists) _exists =      !is_undefined(   dg_anarkhya_tsrc);
    if (_exists) _exists =       ds_exists(      dg_anarkhya_tsrc,ds_type_grid);
    if (_exists)                 ds_grid_destroy(dg_anarkhya_tsrc);
    if (_exists)                                 dg_anarkhya_tsrc=undefined;
    
        _exists = variable_instance_exists(id,  "dg_anarkhya_tsrc_boots");
    if (_exists) _exists =      !is_undefined(   dg_anarkhya_tsrc_boots);
    if (_exists) _exists =       ds_exists(      dg_anarkhya_tsrc_boots,ds_type_grid);
    if (_exists)                 ds_grid_destroy(dg_anarkhya_tsrc_boots);
    if (_exists)                                 dg_anarkhya_tsrc_boots=undefined;
    /*
        _exists = variable_instance_exists(id,  "dg_anarkhya_tsrc_newkasuto");
    if (_exists) _exists =      !is_undefined(   dg_anarkhya_tsrc_newkasuto);
    if (_exists) _exists =       ds_exists(      dg_anarkhya_tsrc_newkasuto,ds_type_grid);
    if (_exists)                 ds_grid_destroy(dg_anarkhya_tsrc_newkasuto);
    if (_exists)                                 dg_anarkhya_tsrc_newkasuto=undefined;
    */
}




