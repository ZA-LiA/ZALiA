/// OptionsMenu_Game_End()


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




    _exists=variable_instance_exists(id,"dl_tsrc_data");
if (_exists) _exists = !is_undefined(    dl_tsrc_data);
if (_exists) _exists = ds_exists(        dl_tsrc_data,ds_type_list);
if (_exists)           ds_list_destroy(  dl_tsrc_data);
if (_exists)                             dl_tsrc_data=undefined;




    _exists=variable_instance_exists(id,"dm_options");
if (_exists) _exists = !is_undefined(    dm_options);
if (_exists) _exists = ds_exists(        dm_options,ds_type_map);
if (_exists)           ds_map_destroy(   dm_options);
if (_exists)                             dm_options=undefined;

    _exists=variable_instance_exists(id,"dm_AudioCustom");
if (_exists) _exists = !is_undefined(    dm_AudioCustom);
if (_exists) _exists = ds_exists(        dm_AudioCustom,ds_type_map);
if (_exists)           ds_map_destroy(   dm_AudioCustom);
if (_exists)                             dm_AudioCustom=undefined;




    _exists=variable_instance_exists(id,"MainOptions_dg");
if (_exists) _exists = !is_undefined(    MainOptions_dg);
if (_exists) _exists = ds_exists(        MainOptions_dg,ds_type_grid);
if (_exists)           ds_grid_destroy(  MainOptions_dg);
if (_exists)                             MainOptions_dg=undefined;

    _exists=variable_instance_exists(id,"dg_InputConfigOptions");
if (_exists) _exists = !is_undefined(    dg_InputConfigOptions);
if (_exists) _exists = ds_exists(        dg_InputConfigOptions,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_InputConfigOptions);
if (_exists)                             dg_InputConfigOptions=undefined;

    _exists=variable_instance_exists(id,"DevTools_dg");
if (_exists) _exists = !is_undefined(    DevTools_dg);
if (_exists) _exists = ds_exists(        DevTools_dg,ds_type_grid);
if (_exists)           ds_grid_destroy(  DevTools_dg);
if (_exists)                             DevTools_dg=undefined;
/*
    _exists=variable_instance_exists(id,"dg_RandoOptions");
if (_exists) _exists = !is_undefined(    dg_RandoOptions);
if (_exists) _exists = ds_exists(        dg_RandoOptions,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_RandoOptions);
if (_exists)                             dg_RandoOptions=undefined;
*/
    _exists=variable_instance_exists(id,"Other_dg");
if (_exists) _exists = !is_undefined(    Other_dg);
if (_exists) _exists = ds_exists(        Other_dg,ds_type_grid);
if (_exists)           ds_grid_destroy(  Other_dg);
if (_exists)                             Other_dg=undefined;




