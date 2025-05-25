/// rm_get_file_data(rm name, *quest num, *alt file name prefix)


var                     _arg=0;
var _RM_NAME = argument[_arg++];

var                      _QUEST_NUM = 1;
if (argument_count>_arg) _QUEST_NUM = clamp(argument[_arg++], 1,2);


//  _file_name example: "PalcA_003"
var _DATAKEY = _RM_NAME+STR_file_name+STR_Quest+hex_str(_QUEST_NUM);
var _file_name = g.dm_rm[?_DATAKEY];
    _file_name = val(f.dm_rando[?_DATAKEY], _file_name);
//

if (is_undefined(_file_name))
{
    return undefined;
}




var _FILE  = "rm_tile_data";
if (argument_count>_arg)
{   _FILE  = argument[_arg++];  }
    _FILE += "/";
    _FILE += string_letters(_file_name); // get "PalcA" from "PalcA_003"
    _FILE += "/";
    _FILE += _file_name;
    _FILE += ".json";
//  _FILE example:  "rm_tile_data/PalcA/PalcA_003.json"
show_debug_message(_FILE);
if(!file_exists(_FILE)) return undefined;



       _FILE  = file_text_open_read(_FILE);
var    _DATA  = "";
while (        !file_text_eof(      _FILE)) 
{      _DATA += file_text_readln(   _FILE);  }
                file_text_close(    _FILE);
//
return _DATA;




