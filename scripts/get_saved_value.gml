/// get_saved_value(file number, data key, value if undefined)

// TODO: Phase out get_save_name() && save_id_created().
// This is meant to replace them.


var                             _arg=0;
var _FILE_NUM = clamp( argument[_arg++], 1,SAVE_FILE_MAX);
var _DATAKEY  = string(argument[_arg++]);
var _DEFAULT  =        argument[_arg++];


var _file_data = global.dm_save_file_data[?STR_Save+STR_File+hex_str(_FILE_NUM)+STR_Encoded];
if (is_undefined(_file_data))
{
    var _FILE_NAME = f.dl_file_names[|_FILE_NUM-1];
    if(!file_exists(_FILE_NAME))
    {
        return _DEFAULT;
    }
    
    var _FILE  = file_text_open_read(working_directory+_FILE_NAME);
    _file_data = file_text_read_string(_FILE);
                 file_text_close(_FILE);
    //_SAVE_DATA = base64_decode(_SAVE_DATA);
}


var _dm_FILE_DATA = json_decode(_file_data);
if (_dm_FILE_DATA!=-1)
{
    // _DATAKEY example:  f.SDNAME_save_name
    var _RETURN = val(_dm_FILE_DATA[?_DATAKEY], _DEFAULT);
    ds_map_destroy(_dm_FILE_DATA); _dm_FILE_DATA=undefined;
    //if (ds_exists(_dm_FILE_DATA,ds_type_map)){ds_map_destroy(_dm_FILE_DATA); _dm_FILE_DATA=undefined;}
    
    return _RETURN;
}




return _DEFAULT;



//global.dm_save_file_data[?STR_Save+STR_File+hex_str(_FILE_NUM)+"_Encoded"] = _SAVE_DATA;

/*
/// get_saved_value(file number, data key, value if undefined)

// TODO: Phase out get_save_name() && save_id_created().
// This is meant to replace them.


var                             _arg=0;
var _FILE_NUM = clamp( argument[_arg++], 1,SAVE_FILE_MAX);
var _DATAKEY  = string(argument[_arg++]);
var _DEFAULT  =        argument[_arg++];


var _FILE_NAME = f.dl_file_names[|_FILE_NUM-1];
if(!file_exists(_FILE_NAME)) return _DEFAULT;

var _FILE      = file_text_open_read(working_directory+_FILE_NAME);
var _FILE_DATA = file_text_read_string(_FILE);
                 file_text_close(_FILE);
//_SAVE_DATA = base64_decode(_SAVE_DATA);
var _dm_FILE_DATA = json_decode(_FILE_DATA);



// _DATAKEY example:  f.SDNAME_save_name
var _RETURN = val(_dm_FILE_DATA[?_DATAKEY],_DEFAULT);


ds_map_destroy(_dm_FILE_DATA); _dm_FILE_DATA=undefined;


return _RETURN;
*/




