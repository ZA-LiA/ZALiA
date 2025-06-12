/// TitleScreen_Room_End()

show_debug_message("TitleScreen_Room_End()");


var _i, _exists;


if (surface_exists(Story_srf)) surface_free(Story_srf);


for(_i=ds_list_size(   dl_STAR_SKY)-1; _i>=0; _i--)
{
    if (surface_exists(dl_STAR_SKY[|_i]))
    {   surface_free(  dl_STAR_SKY[|_i]);  }
}


for(_i=ds_grid_width(  dg_terrain)-1; _i>=0; _i--)
{
    if (surface_exists(dg_terrain[#_i,0]))
    {   surface_free(  dg_terrain[#_i,0]);  }
}



    _exists = variable_instance_exists(id,  "dl_STAR_SKY");
if (_exists) _exists =      !is_undefined(   dl_STAR_SKY);
if (_exists) _exists =       ds_exists(      dl_STAR_SKY, ds_type_list);
if (_exists)                 ds_list_destroy(dl_STAR_SKY);
if (_exists)                                 dl_STAR_SKY = undefined;


    _exists = variable_instance_exists(id,  "dg_terrain");
if (_exists) _exists =      !is_undefined(   dg_terrain);
if (_exists) _exists =       ds_exists(      dg_terrain, ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_terrain);
if (_exists)                                 dg_terrain = undefined;


    _exists = variable_instance_exists(id,  "dg_SeaSparkle");
if (_exists) _exists =      !is_undefined(   dg_SeaSparkle);
if (_exists) _exists =       ds_exists(      dg_SeaSparkle, ds_type_grid);
if (_exists)                 ds_grid_destroy(dg_SeaSparkle);
if (_exists)                                 dg_SeaSparkle = undefined;




