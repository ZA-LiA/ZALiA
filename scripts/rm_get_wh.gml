/// rm_get_wh(rm name, width 0 OR height 1, *quest num)


var                   _QUEST_NUM = 1;
if (argument_count>2) _QUEST_NUM = clamp(argument[2], 1,2);

//  _file_name example: "PalcA_003"
var _DATAKEY = argument[0]+dk_FileName+STR_Quest+hex_str(_QUEST_NUM);
var _file_name = g.dm_rm[?_DATAKEY];
if (is_undefined(_file_name))
{
    return 0;
}

_file_name = val(f.dm_rando[?_DATAKEY], _file_name);

if(!argument[1])
{   return val(global.dm_scene_wh[?_file_name+STR_Width]);  }
    return val(global.dm_scene_wh[?_file_name+STR_Height]);
//




/*
/// rm_get_wh(rm name, width 0 OR height 1, *quest num)


var                   _QUEST_NUM = 1;
if (argument_count>2) _QUEST_NUM = clamp(argument[2], 1,2);

//  _file_name example: "PalcA_003"
var _DATAKEY = argument[0]+dk_FileName+STR_Quest+hex_str(_QUEST_NUM);
var _file_name = g.dm_rm[?_DATAKEY];
if (is_undefined(_file_name))
{
    return 0;
}

_file_name = val(f.dm_rando[?_DATAKEY], _file_name);

if(!argument[1])
{   return val(g.dm_rm[?STR_Tile+STR_File+_file_name+STR_Width]);  }
    return val(g.dm_rm[?STR_Tile+STR_File+_file_name+STR_Height]);
//
*/
