/// p_Game_End()


show_debug_message("p_Game_End()");


     if (sprite_exists( global.palette_image)) sprite_delete(global.palette_image);
else if (surface_exists(global.palette_image)) surface_free( global.palette_image);

if (surface_exists(val(global.FallScene_dm[?"1"+STR_Image],-1)))
{   surface_free(      global.FallScene_dm[?"1"+STR_Image]);  }

if (surface_exists(val(global.FallScene_dm[?"2"+STR_Image],-1)))
{   surface_free(      global.FallScene_dm[?"2"+STR_Image]);  }






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




    _exists=variable_instance_exists(id,"dl_pal_pc");
if (_exists) _exists = !is_undefined(    dl_pal_pc);
if (_exists) _exists = ds_exists(        dl_pal_pc, ds_type_list);
if (_exists)           ds_list_destroy(  dl_pal_pc);
if (_exists)                             dl_pal_pc=undefined;
/*
    _exists=variable_instance_exists(id,  "dl_pal_rm_drk");
if (_exists) _exists = !is_undefined(   dl_pal_rm_drk);
if (_exists) _exists = ds_exists(      dl_pal_rm_drk, ds_type_list);
if (_exists)           ds_list_destroy(dl_pal_rm_drk);
if (_exists)                                          dl_pal_rm_drk=undefined;
*/
    _exists=variable_instance_exists(id,"dl_COLOR");
if (_exists) _exists = !is_undefined(    dl_COLOR);
if (_exists) _exists = ds_exists(        dl_COLOR,ds_type_list);
if (_exists)           ds_list_destroy(  dl_COLOR);
if (_exists)                             dl_COLOR=undefined;

    _exists=variable_instance_exists(id,"dl_COLORS_USED");
if (_exists) _exists = !is_undefined(    dl_COLORS_USED);
if (_exists) _exists = ds_exists(        dl_COLORS_USED,ds_type_list);
if (_exists)           ds_list_destroy(  dl_COLORS_USED);
if (_exists)                             dl_COLORS_USED=undefined;

    _exists=variable_instance_exists(id,"dl_BASE_COLORS");
if (_exists) _exists = !is_undefined(    dl_BASE_COLORS);
if (_exists) _exists = ds_exists(        dl_BASE_COLORS,ds_type_list);
if (_exists)           ds_list_destroy(  dl_BASE_COLORS);
if (_exists)                             dl_BASE_COLORS=undefined;

             _exists = !is_undefined(  global.dl_COLOR01);
if (_exists) _exists = ds_exists(      global.dl_COLOR01,ds_type_list);
if (_exists)           ds_list_destroy(global.dl_COLOR01);
if (_exists)                           global.dl_COLOR01=undefined;

    _exists=variable_instance_exists(id,"dl_colors_h");
if (_exists) _exists = !is_undefined(    dl_colors_h);
if (_exists) _exists = ds_exists(        dl_colors_h,ds_type_list);
if (_exists)           ds_list_destroy(  dl_colors_h);
if (_exists)                             dl_colors_h=undefined;

    _exists=variable_instance_exists(id,"dl_colors_m");
if (_exists) _exists = !is_undefined(    dl_colors_m);
if (_exists) _exists = ds_exists(        dl_colors_m,ds_type_list);
if (_exists)           ds_list_destroy(  dl_colors_m);
if (_exists)                             dl_colors_m=undefined;

    _exists=variable_instance_exists(id,"dl_colors_s");
if (_exists) _exists = !is_undefined(    dl_colors_s);
if (_exists) _exists = ds_exists(        dl_colors_s,ds_type_list);
if (_exists)           ds_list_destroy(  dl_colors_s);
if (_exists)                             dl_colors_s=undefined;

    _exists=variable_instance_exists(id,"dl_PAL_POS");
if (_exists) _exists = !is_undefined(    dl_PAL_POS);
if (_exists) _exists = ds_exists(        dl_PAL_POS,ds_type_list);
if (_exists)           ds_list_destroy(  dl_PAL_POS);
if (_exists)                             dl_PAL_POS=undefined;
/*
    _exists=variable_instance_exists(id,  "dl_FS_PI");
if (_exists) _exists = !is_undefined(   dl_FS_PI);
if (_exists) _exists = ds_exists(      dl_FS_PI,ds_type_list);
if (_exists)           ds_list_destroy(dl_FS_PI);
if (_exists)                                          dl_FS_PI=undefined;
*/
/*
    _exists=variable_instance_exists(id,"dl_various_pals1");
if (_exists) _exists = !is_undefined(    dl_various_pals1);
if (_exists) _exists = ds_exists(        dl_various_pals1,ds_type_list);
if (_exists)           ds_list_destroy(  dl_various_pals1);
if (_exists)                             dl_various_pals1=undefined;

    _exists=variable_instance_exists(id,"dl_various_pals2");
if (_exists) _exists = !is_undefined(    dl_various_pals2);
if (_exists) _exists = ds_exists(        dl_various_pals2,ds_type_list);
if (_exists)           ds_list_destroy(  dl_various_pals2);
if (_exists)                             dl_various_pals2=undefined;

    _exists=variable_instance_exists(id,"dl_various_pals3");
if (_exists) _exists = !is_undefined(    dl_various_pals3);
if (_exists) _exists = ds_exists(        dl_various_pals3,ds_type_list);
if (_exists)           ds_list_destroy(  dl_various_pals3);
if (_exists)                             dl_various_pals3=undefined;
*/
    _exists=variable_instance_exists(id,"dl_BackgroundFlash_COLORS");
if (_exists) _exists = !is_undefined(    dl_BackgroundFlash_COLORS);
if (_exists) _exists = ds_exists(        dl_BackgroundFlash_COLORS,ds_type_list);
if (_exists)           ds_list_destroy(  dl_BackgroundFlash_COLORS);
if (_exists)                             dl_BackgroundFlash_COLORS=undefined;





    _exists=variable_instance_exists(id,"dm_pal_data");
if (_exists) _exists = !is_undefined(    dm_pal_data);
if (_exists) _exists = ds_exists(        dm_pal_data,ds_type_map);
if (_exists)           ds_map_destroy(   dm_pal_data);
if (_exists)                             dm_pal_data=undefined;

    _exists=variable_instance_exists(id,"dm_scene_palette");
if (_exists) _exists = !is_undefined(    dm_scene_palette);
if (_exists) _exists = ds_exists(        dm_scene_palette,ds_type_map);
if (_exists)           ds_map_destroy(   dm_scene_palette);
if (_exists)                             dm_scene_palette=undefined;

    _exists=variable_instance_exists(id,"dm_depth_pi");
if (_exists) _exists = !is_undefined(    dm_depth_pi);
if (_exists) _exists = ds_exists(        dm_depth_pi,ds_type_map);
if (_exists)           ds_map_destroy(   dm_depth_pi);
if (_exists)                             dm_depth_pi=undefined;

    _exists=variable_instance_exists(id,"dm_depth_pi2");
if (_exists) _exists = !is_undefined(    dm_depth_pi2);
if (_exists) _exists = ds_exists(        dm_depth_pi2,ds_type_map);
if (_exists)           ds_map_destroy(   dm_depth_pi2);
if (_exists)                             dm_depth_pi2=undefined;

    _exists=variable_instance_exists(id,"dm_COLOR_CHOICES");
if (_exists) _exists = !is_undefined(    dm_COLOR_CHOICES);
if (_exists) _exists = ds_exists(        dm_COLOR_CHOICES,ds_type_map);
if (_exists)           ds_map_destroy(   dm_COLOR_CHOICES);
if (_exists)                             dm_COLOR_CHOICES=undefined;

    _exists=variable_instance_exists(id,"dm_pi");
if (_exists) _exists = !is_undefined(    dm_pi);
if (_exists) _exists = ds_exists(        dm_pi,ds_type_map);
if (_exists)           ds_map_destroy(   dm_pi);
if (_exists)                             dm_pi=undefined;

if (_exists) _exists = !is_undefined( global.FallScene_dm);
if (_exists) _exists = ds_exists(     global.FallScene_dm,ds_type_map);
if (_exists)           ds_map_destroy(global.FallScene_dm);
if (_exists)                          global.FallScene_dm=undefined;








    _exists=variable_instance_exists(id,"dg_color_seq");
if (_exists) _exists = !is_undefined(    dg_color_seq);
if (_exists) _exists = ds_exists(        dg_color_seq,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_color_seq);
if (_exists)                             dg_color_seq=undefined;

    _exists=variable_instance_exists(id,"dg_PI_SEQ");
if (_exists) _exists = !is_undefined(    dg_PI_SEQ);
if (_exists) _exists = ds_exists(        dg_PI_SEQ,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_PI_SEQ);
if (_exists)                             dg_PI_SEQ=undefined;

    _exists=variable_instance_exists(id,"dg_pal_rm_dark");
if (_exists) _exists = !is_undefined(    dg_pal_rm_dark);
if (_exists) _exists = ds_exists(        dg_pal_rm_dark,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_pal_rm_dark);
if (_exists)                             dg_pal_rm_dark=undefined;

    _exists=variable_instance_exists(id,"dg_pal_seq");
if (_exists) _exists = !is_undefined(    dg_pal_seq);
if (_exists) _exists = ds_exists(        dg_pal_seq,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_pal_seq);
if (_exists)                             dg_pal_seq=undefined;

    _exists=variable_instance_exists(id,"dg_depth_pi");
if (_exists) _exists = !is_undefined(    dg_depth_pi);
if (_exists) _exists = ds_exists(        dg_depth_pi,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_depth_pi);
if (_exists)                             dg_depth_pi=undefined;

             _exists = !is_undefined(  global.dg_pi_permuts);
if (_exists) _exists = ds_exists(      global.dg_pi_permuts,ds_type_grid);
if (_exists)           ds_grid_destroy(global.dg_pi_permuts);
if (_exists)                           global.dg_pi_permuts=undefined;




