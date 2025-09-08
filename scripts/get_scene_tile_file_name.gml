/// get_scene_tile_file_name(scene name, quest num)


var                        _arg=0;
var _SCENE_NAME = argument[_arg++];
var _QUEST_NUM  = argument[_arg++];


//  _file_name example: "PalcA_003"
var _DATAKEY = _SCENE_NAME+dk_FileName+STR_Quest+hex_str(_QUEST_NUM);
var _file_name = g.dm_rm[?_DATAKEY];
    _file_name = val(f.dm_rando[?_DATAKEY], _file_name);
//


return _file_name;




