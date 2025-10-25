/// SmasherTrap01_end()


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




if (Trigger_type==2)
{
    if (surface_exists(Trigger_surf)) surface_free(Trigger_surf);
    
    
        _exists=variable_instance_exists(id,"Trigger_dg_tsrc");
    if (_exists) _exists = !is_undefined(    Trigger_dg_tsrc);
    if (_exists) _exists = ds_exists(        Trigger_dg_tsrc,ds_type_grid);
    if (_exists)           ds_grid_destroy(  Trigger_dg_tsrc);
    if (_exists)                             Trigger_dg_tsrc=undefined;
}




if (ver==2)
{
    if (surface_exists(Wall_surf)) surface_free(Wall_surf);
    
    
        _exists=variable_instance_exists(id,"Wall_dg_tsrc");
    if (_exists) _exists = !is_undefined(    Wall_dg_tsrc);
    if (_exists) _exists = ds_exists(        Wall_dg_tsrc,ds_type_grid);
    if (_exists)           ds_grid_destroy(  Wall_dg_tsrc);
    if (_exists)                             Wall_dg_tsrc=undefined;
}





