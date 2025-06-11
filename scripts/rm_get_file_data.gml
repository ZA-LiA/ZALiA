/// rm_get_file_data(rm name, *quest num, *alt file name prefix)


var                     _arg=0;
var _RM_NAME = argument[_arg++];

var                      _QUEST_NUM = 1;
if (argument_count>_arg) _QUEST_NUM = clamp(argument[_arg++], 1,2);


//  _file_name example: "PalcA_003"
var _DATAKEY = _RM_NAME+dk_FileName+STR_Quest+hex_str(_QUEST_NUM);
var _file_name = g.dm_rm[?_DATAKEY];
    _file_name = val(f.dm_rando[?_DATAKEY], _file_name);
//

if (is_undefined(_file_name))
{
    show_debug_message("!!!! WARNING. rm_get_file_data(). '"+_file_name+"' is undefined because `g.dm_rm[?'"+_DATAKEY+"']` is undefined !!!!");
    return undefined;
}


// _file_name example: "rm_tile_data/PalcA/PalcA_003.json"
_file_name = "rm_tile_data/"+string_copy(_file_name,1,5)+"/"+_file_name+".json";
//_file_name += ".json"; // _file_name example: "PalcA_003.json"
if(!file_exists(_file_name))
{
    show_debug_message("!!!! WARNING. rm_get_file_data(). File '"+_file_name+"' does not exist !!!!");
    return undefined;
}




//show_debug_message(_file_name);
var _data  = "";
var _FILE  = file_text_open_read(_file_name);
while(      !file_text_eof(   _FILE)) 
{   _data += file_text_readln(_FILE);  }
             file_text_close( _FILE);
//
return _data;
/*
var _FILE  = "rm_tile_data";
if (argument_count>_arg)
{   _FILE  = argument[_arg++];  }
    _FILE += "/";
    _FILE += string_letters(_file_name); // get "PalcA" from "PalcA_003"
    _FILE += "/";
    _FILE += _file_name;
    _FILE += ".json";
//  _FILE example:  "rm_tile_data/PalcA/PalcA_003.json"
//show_debug_message(_FILE);
if(!file_exists(_FILE)) return undefined;


show_debug_message(_FILE);
       _FILE  = file_text_open_read(_FILE);
var    _data  = "";
while (        !file_text_eof(      _FILE)) 
{      _data += file_text_readln(   _FILE);  }
                file_text_close(    _FILE);
//
return _data;
*/




