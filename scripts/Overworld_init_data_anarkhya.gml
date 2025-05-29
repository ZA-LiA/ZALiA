/// Overworld_init_data_anarkhya()


var _i,_j, _idx;
var _count_j;
var _str_j;
var _clm,_row, _ow_clm,_ow_row, _owrc;
var _ts_idx=0;
var _tile_data;
var _layer_name;

var _dm_file_data = ds_map_create();
var _dl_layer_data = ds_list_create();
var _dm_layer_data = ds_map_create();
var _dl_data = ds_list_create();

//var _dl_debug1 = ds_list_create();




var _file_name = "anarkhya_OvrwA_00.json";
var _file = file_text_open_read("ow_tile_data/"+_file_name);

var _str  = "";
while (    !file_text_eof(   _file))
{   _str += file_text_readln(_file);  }
            file_text_close( _file);
//
_dm_file_data = json_decode(_str);



// -------------------------------------------------------------------
ds_grid_resize(dg_anarkhya_tsrc_def,    OW_CLMS, OW_ROWS);
ds_grid_clear (dg_anarkhya_tsrc_def,    0);

ds_grid_resize(dg_anarkhya_tsrc,        OW_CLMS, OW_ROWS);
ds_grid_clear (dg_anarkhya_tsrc,        0);

ds_grid_resize(dg_anarkhya_tsrc_detail_def, OW_CLMS, OW_ROWS);
ds_grid_clear (dg_anarkhya_tsrc_detail_def, 0);

ds_grid_resize(dg_anarkhya_tsrc_detail,     OW_CLMS, OW_ROWS);
ds_grid_clear (dg_anarkhya_tsrc_detail,     0);


_dl_layer_data = _dm_file_data[?"layers"];



var _dl_tsidx = ds_list_create();


var          _layer_count = ds_list_size(_dl_layer_data);
for(_i=0; _i<_layer_count; _i++) // each layer
{
    _dm_layer_data = _dl_layer_data[|_i];
    _layer_name    = _dm_layer_data[?"name"];
    
    _dl_data = _dm_layer_data[?"data"];
    
    
    
    // ---------------------------------------------------------------------------
                 _count_j = ds_list_size(_dl_data);
    for(_j=0; _j<_count_j; _j++) // each tile or obj of this layer
    {
        _str_j = hex_str(_j);
        _ow_clm = _j mod OW_CLMS;
        _ow_row = _j div OW_CLMS;
        _owrc = (_ow_row<<8) | _ow_clm;
        
        
            _tile_data = _dl_data[|_j];
        if (_tile_data!=0)
        {
            if (string_pos("BOOTS",_layer_name))
            {
                _idx = ds_grid_width(dg_anarkhya_tsrc_boots);
                ds_grid_resize(dg_anarkhya_tsrc_boots, _idx+1, ds_grid_height(dg_anarkhya_tsrc_boots));
                dg_anarkhya_tsrc_boots[#_idx,0] = _owrc;
                dg_anarkhya_tsrc_boots[#_idx,1] = _tile_data;
            }
            else if (string_pos("DETAIL",_layer_name))
            {
                dg_anarkhya_tsrc_detail_def[#_ow_clm,_ow_row] = _tile_data;
            }
            else
            {
                dg_anarkhya_tsrc_def[#_ow_clm,_ow_row] = _tile_data;
            }
            
            //if ((string_pos("MAIN",_layer_name)||string_pos("DETAIL",_layer_name)) && ds_list_find_index(_dl_debug1, (_tile_data>>8)&$FF)==-1 && inRange(_tile_data&$FF,513,1024)) ds_list_add(_dl_debug1, "$"+hex_str((_tile_data>>8)&$FF)+"-$"+hex_str(_ow_clm)+hex_str(_ow_row));
            //if (ds_list_find_index(_dl_debug1, (_tile_data>>8)&$FF)==-1) ds_list_add(_dl_debug1, (_tile_data>>8)&$FF);
        }
    }
}


for(_i=ds_grid_width(dg_boulders)-1; _i>=0; _i--)
{
    _owrc = dg_boulders[#_i,0];
    _clm = (_owrc>>0)&$FF;
    _row = (_owrc>>8)&$FF;
    dg_anarkhya_tsrc_detail_def[#_clm,_row] = anarkhya_TSRC_BOULDER;
}


ds_grid_copy(dg_anarkhya_tsrc,        dg_anarkhya_tsrc_def);
ds_grid_copy(dg_anarkhya_tsrc_detail, dg_anarkhya_tsrc_detail_def);




ds_list_destroy(_dl_tsidx); _dl_tsidx=undefined;
ds_map_destroy(_dm_file_data); _dm_file_data=undefined;
ds_list_destroy(_dl_layer_data); _dl_layer_data=undefined;
ds_map_destroy(_dm_layer_data); _dm_layer_data=undefined;
ds_list_destroy(_dl_data); _dl_data=undefined;


//for(_i=ds_list_size(_dl_debug1)-1; _i>=0; _i--) sdm("$"+hex_str(_dl_debug1[|_i]));
//ds_list_destroy(_dl_debug1); _dl_debug1=undefined;




