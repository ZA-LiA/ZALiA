/// Challenge_SwitchB_end()


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




if (ver==4)
{
    if (surface_exists(Water_surf1)) surface_free(Water_surf1);
    
    var _COUNT0 = val(Water_dm[?STR_Waterfall+STR_Count]);
    if (_COUNT0)
    {
        for(var _i=0; _i<_COUNT0; _i++) // each waterfall
        {
            if(!is_undefined(  Water_dm[?STR_Waterfall+hex_str(_i+1)+STR_Surface]) 
            &&  surface_exists(Water_dm[?STR_Waterfall+hex_str(_i+1)+STR_Surface]) )
            {
                surface_free(  Water_dm[?STR_Waterfall+hex_str(_i+1)+STR_Surface]);
            }
        }
    }
    
    
        _exists=variable_instance_exists(id,"Water_dm");
    if (_exists) _exists = !is_undefined(    Water_dm);
    if (_exists) _exists = ds_exists(        Water_dm,ds_type_map);
    if (_exists)           ds_map_destroy(   Water_dm);
    if (_exists)                             Water_dm=undefined;
}




