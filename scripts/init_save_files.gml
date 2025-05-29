/// init_save_files()

// First time running app. Create files.


var _i, _file_num, _file_name, _file_id;

var _dm_save_data = ds_map_create();
    _dm_save_data[?f.SDNAME_save_name] = SAVE_NAME_NULL;
var _save_data = json_encode(_dm_save_data);
ds_map_destroy(_dm_save_data); _dm_save_data = undefined;


for(_i=0; _i<SAVE_FILE_MAX; _i++)
{
    _file_num  = _i+1;
    _file_name = f.dl_file_names[|_i];
    
    if (file_exists(_file_name)) continue;
    
    
    _file_id = file_text_open_write(working_directory+_file_name);
    file_text_write_string(_file_id, _save_data);
    file_text_close(_file_id);
    
    set_save_props_def();
    file_save(_file_num,true);
    
    show_debug_message(_file_name+" created!");
}




