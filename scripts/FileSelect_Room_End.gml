/// FileSelect_Room_End()

show_debug_message("");
show_debug_message("FileSelect_Room_End()");
show_debug_message("");


//ar_FILE_NAMES               = 0;
//ar_FILE_NAMES_PREFERENCES   = 0;
//stats           = 0;
//ar_spr_statIcon = 0;
//ar_save_names   = 0;
//sprites_fairy   = 0;


if (surface_exists(MAIN_surf))
{   surface_free(  MAIN_surf);  }

if (surface_exists(REGISTER_surf))
{   surface_free(  REGISTER_surf);  }

if (surface_exists(ELIMINATE_surf))
{   surface_free(  ELIMINATE_surf);  }

//if (surface_exists(surf_RANDO))
//{   surface_free(  surf_RANDO);  }

for(var _i=0; _i<SAVE_FILE_MAX; _i++)
{
    if(!is_undefined(  SaveFileRandoInfo_dm[?STR_Save+STR_File+hex_str(_i+1)+STR_Surface]) 
    &&  surface_exists(SaveFileRandoInfo_dm[?STR_Save+STR_File+hex_str(_i+1)+STR_Surface]) )
    {   surface_free(  SaveFileRandoInfo_dm[?STR_Save+STR_File+hex_str(_i+1)+STR_Surface]);  }
}




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




    _exists=variable_instance_exists(id,"dl_sprites_fairy");
if (_exists) _exists = !is_undefined(    dl_sprites_fairy);
if (_exists) _exists = ds_exists(        dl_sprites_fairy,ds_type_list);
if (_exists)           ds_list_destroy(  dl_sprites_fairy);
if (_exists)                             dl_sprites_fairy=undefined;

    _exists=variable_instance_exists(id,"dl_spr_statIcon");
if (_exists) _exists = !is_undefined(    dl_spr_statIcon);
if (_exists) _exists = ds_exists(        dl_spr_statIcon,ds_type_list);
if (_exists)           ds_list_destroy(  dl_spr_statIcon);
if (_exists)                             dl_spr_statIcon=undefined;

    _exists = variable_instance_exists(id,  "dl_sprites");
if (_exists) _exists =      !is_undefined(   dl_sprites);
if (_exists) _exists =       ds_exists(      dl_sprites,ds_type_list);
if (_exists)                 ds_list_destroy(dl_sprites);
if (_exists)                                 dl_sprites=undefined;

    _exists = variable_instance_exists(id,  "dl_save_file_registered");
if (_exists) _exists =      !is_undefined(   dl_save_file_registered);
if (_exists) _exists =       ds_exists(      dl_save_file_registered, ds_type_list);
if (_exists)                 ds_list_destroy(dl_save_file_registered);
if (_exists)                                 dl_save_file_registered=undefined;

    _exists=variable_instance_exists(id,"dl_can_color_file");
if (_exists) _exists = !is_undefined(    dl_can_color_file);
if (_exists) _exists = ds_exists(        dl_can_color_file,ds_type_list);
if (_exists)           ds_list_destroy(  dl_can_color_file);
if (_exists)                             dl_can_color_file=undefined;

    _exists=variable_instance_exists(id,"CharTable_dl");
if (_exists) _exists = !is_undefined(    CharTable_dl);
if (_exists) _exists = ds_exists(        CharTable_dl,ds_type_list);
if (_exists)           ds_list_destroy(  CharTable_dl);
if (_exists)                             CharTable_dl=undefined;




    _exists = variable_instance_exists(id, "dm_Rando");
if (_exists) _exists =      !is_undefined(  dm_Rando);
if (_exists) _exists =       ds_exists(     dm_Rando, ds_type_map);
if (_exists)                 ds_map_destroy(dm_Rando);
if (_exists)                                dm_Rando=undefined;

    _exists = variable_instance_exists(id, "dm_RandoSeeds");
if (_exists) _exists =      !is_undefined(  dm_RandoSeeds);
if (_exists) _exists =       ds_exists(     dm_RandoSeeds, ds_type_map);
if (_exists)                 ds_map_destroy(dm_RandoSeeds);
if (_exists)                                dm_RandoSeeds=undefined;

    _exists = variable_instance_exists(id, "dm_rando_SETTINGS");
if (_exists) _exists =      !is_undefined(  dm_rando_SETTINGS);
if (_exists) _exists =       ds_exists(     dm_rando_SETTINGS, ds_type_map);
if (_exists)                 ds_map_destroy(dm_rando_SETTINGS);
if (_exists)                                dm_rando_SETTINGS=undefined;

    _exists = variable_instance_exists(id, "dm_rando_settings");
if (_exists) _exists =      !is_undefined(  dm_rando_settings);
if (_exists) _exists =       ds_exists(     dm_rando_settings, ds_type_map);
if (_exists)                 ds_map_destroy(dm_rando_settings);
if (_exists)                                dm_rando_settings=undefined;

    _exists=variable_instance_exists(id,"SaveFileRandoInfo_dm");
if (_exists) _exists = !is_undefined(    SaveFileRandoInfo_dm);
if (_exists) _exists = ds_exists(        SaveFileRandoInfo_dm,ds_type_map);
if (_exists)           ds_map_destroy(   SaveFileRandoInfo_dm);
if (_exists)                             SaveFileRandoInfo_dm=undefined;





    _exists=variable_instance_exists(id,"dg_stats");
if (_exists) _exists = !is_undefined(    dg_stats);
if (_exists) _exists = ds_exists(        dg_stats,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_stats);
if (_exists)                             dg_stats=undefined;

    _exists = variable_instance_exists(id,  "dg_RandoMAIN_Options");
if (_exists) _exists =      !is_undefined(   dg_RandoMAIN_Options);
if (_exists) _exists =       ds_exists(      dg_RandoMAIN_Options,ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_RandoMAIN_Options);
if (_exists)                                 dg_RandoMAIN_Options=undefined;


    _exists = variable_instance_exists(id,  "dg_RandoITEM_Options");
if (_exists) _exists =      !is_undefined(   dg_RandoITEM_Options);
if (_exists) _exists =       ds_exists(      dg_RandoITEM_Options,ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_RandoITEM_Options);
if (_exists)                                 dg_RandoITEM_Options=undefined;


    _exists = variable_instance_exists(id,  "dg_RandoSPELL_Options");
if (_exists) _exists =      !is_undefined(   dg_RandoSPELL_Options);
if (_exists) _exists =       ds_exists(      dg_RandoSPELL_Options,ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_RandoSPELL_Options);
if (_exists)                                 dg_RandoSPELL_Options=undefined;


    _exists = variable_instance_exists(id,  "dg_RandoENEMY_Options");
if (_exists) _exists =      !is_undefined(   dg_RandoENEMY_Options);
if (_exists) _exists =       ds_exists(      dg_RandoENEMY_Options,ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_RandoENEMY_Options);
if (_exists)                                 dg_RandoENEMY_Options=undefined;


    _exists = variable_instance_exists(id,  "dg_RandoOTHER_Options");
if (_exists) _exists =      !is_undefined(   dg_RandoOTHER_Options);
if (_exists) _exists =       ds_exists(      dg_RandoOTHER_Options,ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_RandoOTHER_Options);
if (_exists)                                 dg_RandoOTHER_Options=undefined;




    _exists = variable_instance_exists(id,  "dg_RandoOTHER_Options");
if (_exists) _exists =      !is_undefined(   dg_RandoOTHER_Options);
if (_exists) _exists =       ds_exists(      dg_RandoOTHER_Options,ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_RandoOTHER_Options);
if (_exists)                                 dg_RandoOTHER_Options=undefined;

    _exists = variable_instance_exists(id,  "dg_RandoOTHER_ITEMS");
if (_exists) _exists =      !is_undefined(   dg_RandoOTHER_ITEMS);
if (_exists) _exists =       ds_exists(      dg_RandoOTHER_ITEMS,ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_RandoOTHER_ITEMS);
if (_exists)                                 dg_RandoOTHER_ITEMS=undefined;

    _exists = variable_instance_exists(id,  "dg_RandoOTHER_SPELLS");
if (_exists) _exists =      !is_undefined(   dg_RandoOTHER_SPELLS);
if (_exists) _exists =       ds_exists(      dg_RandoOTHER_SPELLS,ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_RandoOTHER_SPELLS);
if (_exists)                                 dg_RandoOTHER_SPELLS=undefined;

    _exists = variable_instance_exists(id,  "dg_RandoOTHER_REQUIRE");
if (_exists) _exists =      !is_undefined(   dg_RandoOTHER_REQUIRE);
if (_exists) _exists =       ds_exists(      dg_RandoOTHER_REQUIRE,ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_RandoOTHER_REQUIRE);
if (_exists)                                 dg_RandoOTHER_REQUIRE=undefined;




