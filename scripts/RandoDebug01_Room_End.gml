/// RandoDebug01_Room_End()


show_debug_message("");
show_debug_message("RandoDebug01_Room_End()");
show_debug_message("");

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




    _exists = variable_instance_exists(id,  "dl_seeds");
if (_exists) _exists =      !is_undefined(   dl_seeds);
if (_exists) _exists =       ds_exists(      dl_seeds,ds_type_list);
if (_exists)                 ds_list_destroy(dl_seeds);
if (_exists)                                 dl_seeds=undefined;
/*
    _exists = variable_instance_exists(id,  "dl_ALLKEY_locations");
if (_exists) _exists =      !is_undefined(   dl_ALLKEY_locations);
if (_exists) _exists =       ds_exists(      dl_ALLKEY_locations,ds_type_list);
if (_exists)                 ds_list_destroy(dl_ALLKEY_locations);
if (_exists)                                 dl_ALLKEY_locations=undefined;
*/


/*
    _exists = variable_instance_exists(id, "dm_simulations");
if (_exists) _exists =      !is_undefined(  dm_simulations);
if (_exists) _exists =       ds_exists(     dm_simulations, ds_type_map);
if (_exists)                 ds_map_destroy(dm_simulations);
if (_exists)                                dm_simulations = undefined;
*/
    _exists = variable_instance_exists(id, "dm_settings");
if (_exists) _exists =      !is_undefined(  dm_settings);
if (_exists) _exists =       ds_exists(     dm_settings,ds_type_map);
if (_exists)                 ds_map_destroy(dm_settings);
if (_exists)                                dm_settings=undefined;

    _exists = variable_instance_exists(id, "dm_allkey");
if (_exists) _exists =      !is_undefined(  dm_allkey);
if (_exists) _exists =       ds_exists(     dm_allkey,ds_type_map);
if (_exists)                 ds_map_destroy(dm_allkey);
if (_exists)                                dm_allkey=undefined;

    _exists = variable_instance_exists(id, "dm_LOCATIONS_COPY");
if (_exists) _exists =      !is_undefined(  dm_LOCATIONS_COPY);
if (_exists) _exists =       ds_exists(     dm_LOCATIONS_COPY,ds_type_map);
if (_exists)                 ds_map_destroy(dm_LOCATIONS_COPY);
if (_exists)                                dm_LOCATIONS_COPY=undefined;

/*
    _exists = variable_instance_exists(id, "dm_save_data");
if (_exists) _exists =      !is_undefined(  dm_save_data);
if (_exists) _exists =       ds_exists(     dm_save_data, ds_type_map);
if (_exists)                 ds_map_destroy(dm_save_data);
if (_exists)                                dm_save_data = undefined;

    _exists = variable_instance_exists(id, "dm_debug_data");
if (_exists) _exists =      !is_undefined(  dm_debug_data);
if (_exists) _exists =       ds_exists(     dm_debug_data, ds_type_map);
if (_exists)                 ds_map_destroy(dm_debug_data);
if (_exists)                                dm_debug_data = undefined;
*/








