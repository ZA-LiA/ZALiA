// PauseMenu_GameEnd()


if (variable_instance_exists(id,"MenuFrame_srf_SPELL") && surface_exists(MenuFrame_srf_SPELL)) surface_free(MenuFrame_srf_SPELL);
if (variable_instance_exists(id,"MenuFrame_srf_ITEM")  && surface_exists(MenuFrame_srf_ITEM))  surface_free(MenuFrame_srf_ITEM);
if (variable_instance_exists(id,"MenuFrame_srf_MAP")   && surface_exists(MenuFrame_srf_MAP))   surface_free(MenuFrame_srf_MAP);
if (variable_instance_exists(id,"MapTears_srf")        && surface_exists(MapTears_srf))        surface_free(MapTears_srf);
if (variable_instance_exists(id,"MenuMap_srf")         && surface_exists(MenuMap_srf))         surface_free(MenuMap_srf);

for(var _i=ds_grid_width(dg_terrain_surf)-1; _i>=0; _i--)
{
    if (surface_exists(  dg_terrain_surf[#_i,$0]))
    {   surface_free(    dg_terrain_surf[#_i,$0]);  }
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




    _exists=variable_instance_exists(id,"dl_spell_str");
if (_exists) _exists = !is_undefined(    dl_spell_str);
if (_exists) _exists = ds_exists(        dl_spell_str,ds_type_list);
if (_exists)           ds_list_destroy(  dl_spell_str);
if (_exists)                             dl_spell_str=undefined;

    _exists=variable_instance_exists(id,"dl_map_anim_data");
if (_exists) _exists = !is_undefined(    dl_map_anim_data);
if (_exists) _exists = ds_exists(        dl_map_anim_data,ds_type_list);
if (_exists)           ds_list_destroy(  dl_map_anim_data);
if (_exists)                             dl_map_anim_data=undefined;




    _exists=variable_instance_exists(id,"dm_terrain");
if (_exists) _exists = !is_undefined(    dm_terrain);
if (_exists) _exists = ds_exists(        dm_terrain,ds_type_map);
if (_exists)           ds_map_destroy(   dm_terrain);
if (_exists)                             dm_terrain=undefined;

/*
    _exists = variable_instance_exists(id,  "dm_DungeonMap");
if (_exists) _exists =      !is_undefined(   dm_DungeonMap);
if (_exists) _exists =       ds_exists(      dm_DungeonMap, ds_type_map);
if (_exists)                 ds_map_destroy( dm_DungeonMap);
if (_exists)                                 dm_DungeonMap = undefined;
*/




    _exists=variable_instance_exists(id,"dg_win_tdata_spl");
if (_exists) _exists = !is_undefined(    dg_win_tdata_spl);
if (_exists) _exists = ds_exists(        dg_win_tdata_spl,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_win_tdata_spl);
if (_exists)                             dg_win_tdata_spl=undefined;

    _exists=variable_instance_exists(id,"dg_win_tdata_itm");
if (_exists) _exists = !is_undefined(    dg_win_tdata_itm);
if (_exists) _exists = ds_exists(        dg_win_tdata_itm,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_win_tdata_itm);
if (_exists)                             dg_win_tdata_itm=undefined;

    _exists=variable_instance_exists(id,"dg_win_tdata_map");
if (_exists) _exists = !is_undefined(    dg_win_tdata_map);
if (_exists) _exists = ds_exists(        dg_win_tdata_map,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_win_tdata_map);
if (_exists)                             dg_win_tdata_map=undefined;

             _exists = variable_instance_exists(id,  "dg_map_edge");
if (_exists) _exists =               !is_undefined(   dg_map_edge);
if (_exists) _exists =                ds_exists(      dg_map_edge, ds_type_grid);
if (_exists)                          ds_grid_destroy(dg_map_edge);
if (_exists)                                          dg_map_edge = undefined;

             _exists = variable_instance_exists(id,  "dg_dngn_map");
if (_exists) _exists =               !is_undefined(   dg_dngn_map);
if (_exists) _exists =                ds_exists(      dg_dngn_map, ds_type_grid);
if (_exists)                          ds_grid_destroy(dg_dngn_map);
if (_exists)                                          dg_dngn_map = undefined;

             _exists = variable_instance_exists(id,  "dg_dngn_map_1");
if (_exists) _exists =               !is_undefined(   dg_dngn_map_1);
if (_exists) _exists =                ds_exists(      dg_dngn_map_1, ds_type_grid);
if (_exists)                          ds_grid_destroy(dg_dngn_map_1);
if (_exists)                                          dg_dngn_map_1 = undefined;

             _exists = variable_instance_exists(id,  "dg_dngn_map_2");
if (_exists) _exists =               !is_undefined(   dg_dngn_map_2);
if (_exists) _exists =                ds_exists(      dg_dngn_map_2, ds_type_grid);
if (_exists)                          ds_grid_destroy(dg_dngn_map_2);
if (_exists)                                          dg_dngn_map_2 = undefined;

             _exists = variable_instance_exists(id,  "dg_dngn_map_3");
if (_exists) _exists =               !is_undefined(   dg_dngn_map_3);
if (_exists) _exists =                ds_exists(      dg_dngn_map_3, ds_type_grid);
if (_exists)                          ds_grid_destroy(dg_dngn_map_3);
if (_exists)                                          dg_dngn_map_3 = undefined;

             _exists = variable_instance_exists(id,  "dg_dngn_map_4");
if (_exists) _exists =               !is_undefined(   dg_dngn_map_4);
if (_exists) _exists =                ds_exists(      dg_dngn_map_4, ds_type_grid);
if (_exists)                          ds_grid_destroy(dg_dngn_map_4);
if (_exists)                                          dg_dngn_map_4 = undefined;

             _exists = variable_instance_exists(id,  "dg_dngn_map_5");
if (_exists) _exists =               !is_undefined(   dg_dngn_map_5);
if (_exists) _exists =                ds_exists(      dg_dngn_map_5, ds_type_grid);
if (_exists)                          ds_grid_destroy(dg_dngn_map_5);
if (_exists)                                          dg_dngn_map_5 = undefined;

             _exists = variable_instance_exists(id,  "dg_dngn_map_6");
if (_exists) _exists =               !is_undefined(   dg_dngn_map_6);
if (_exists) _exists =                ds_exists(      dg_dngn_map_6, ds_type_grid);
if (_exists)                          ds_grid_destroy(dg_dngn_map_6);
if (_exists)                                          dg_dngn_map_6 = undefined;

             _exists = variable_instance_exists(id,  "dg_dngn_map_7");
if (_exists) _exists =               !is_undefined(   dg_dngn_map_7);
if (_exists) _exists =                ds_exists(      dg_dngn_map_7, ds_type_grid);
if (_exists)                          ds_grid_destroy(dg_dngn_map_7);
if (_exists)                                          dg_dngn_map_7 = undefined;

             _exists = variable_instance_exists(id,  "dg_dngn_map_8");
if (_exists) _exists =               !is_undefined(   dg_dngn_map_8);
if (_exists) _exists =                ds_exists(      dg_dngn_map_8, ds_type_grid);
if (_exists)                          ds_grid_destroy(dg_dngn_map_8);
if (_exists)                                          dg_dngn_map_8 = undefined;



    _exists=variable_instance_exists(id,"dg_dngn_map_1_DEFAULT");
if (_exists) _exists = !is_undefined(    dg_dngn_map_1_DEFAULT);
if (_exists) _exists = ds_exists(        dg_dngn_map_1_DEFAULT,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_dngn_map_1_DEFAULT);
if (_exists)                             dg_dngn_map_1_DEFAULT=undefined;

    _exists=variable_instance_exists(id,"dg_dngn_map_2_DEFAULT");
if (_exists) _exists = !is_undefined(    dg_dngn_map_2_DEFAULT);
if (_exists) _exists = ds_exists(        dg_dngn_map_2_DEFAULT,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_dngn_map_2_DEFAULT);
if (_exists)                             dg_dngn_map_2_DEFAULT=undefined;

    _exists=variable_instance_exists(id,"dg_dngn_map_3_DEFAULT");
if (_exists) _exists = !is_undefined(    dg_dngn_map_3_DEFAULT);
if (_exists) _exists = ds_exists(        dg_dngn_map_3_DEFAULT,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_dngn_map_3_DEFAULT);
if (_exists)                             dg_dngn_map_3_DEFAULT=undefined;

    _exists=variable_instance_exists(id,"dg_dngn_map_4_DEFAULT");
if (_exists) _exists = !is_undefined(    dg_dngn_map_4_DEFAULT);
if (_exists) _exists = ds_exists(        dg_dngn_map_4_DEFAULT,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_dngn_map_4_DEFAULT);
if (_exists)                             dg_dngn_map_4_DEFAULT=undefined;

    _exists=variable_instance_exists(id,"dg_dngn_map_5_DEFAULT");
if (_exists) _exists = !is_undefined(    dg_dngn_map_5_DEFAULT);
if (_exists) _exists = ds_exists(        dg_dngn_map_5_DEFAULT,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_dngn_map_5_DEFAULT);
if (_exists)                             dg_dngn_map_5_DEFAULT=undefined;

    _exists=variable_instance_exists(id,"dg_dngn_map_6_DEFAULT");
if (_exists) _exists = !is_undefined(    dg_dngn_map_6_DEFAULT);
if (_exists) _exists = ds_exists(        dg_dngn_map_6_DEFAULT,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_dngn_map_6_DEFAULT);
if (_exists)                             dg_dngn_map_6_DEFAULT=undefined;

    _exists=variable_instance_exists(id,"dg_dngn_map_7_DEFAULT");
if (_exists) _exists = !is_undefined(    dg_dngn_map_7_DEFAULT);
if (_exists) _exists = ds_exists(        dg_dngn_map_7_DEFAULT,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_dngn_map_7_DEFAULT);
if (_exists)                             dg_dngn_map_7_DEFAULT=undefined;

    _exists=variable_instance_exists(id,"dg_dngn_map_8_DEFAULT");
if (_exists) _exists = !is_undefined(    dg_dngn_map_8_DEFAULT);
if (_exists) _exists = ds_exists(        dg_dngn_map_8_DEFAULT,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_dngn_map_8_DEFAULT);
if (_exists)                             dg_dngn_map_8_DEFAULT=undefined;

    _exists=variable_instance_exists(id,"dg_icons1");
if (_exists) _exists = !is_undefined(    dg_icons1);
if (_exists) _exists = ds_exists(        dg_icons1,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_icons1);
if (_exists)                             dg_icons1=undefined;

    _exists=variable_instance_exists(id,"dg_terrain_surf");
if (_exists) _exists = !is_undefined(    dg_terrain_surf);
if (_exists) _exists = ds_exists(        dg_terrain_surf,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_terrain_surf);
if (_exists)                             dg_terrain_surf=undefined;




