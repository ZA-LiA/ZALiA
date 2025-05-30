/// data_spawn_cutscene(object_index, version, x, y, *pal_idx, *data, ..)


var _i, _count;


var _ARGS = argument_count;

var                 _arg=0;
var _OBJ = argument[_arg++];
var _VER = argument[_arg++];
var _X   = argument[_arg++]; // *rm_w & rm_h set in data_rm_1a() before this call
var _Y   = argument[_arg++];

var             _PAL_IDX = -1;
if (_ARGS>_arg) _PAL_IDX = argument[_arg++];



_count = val(g.dm_spawn[?rm_name+STR_CutScene+STR_Count]) + 1;
             g.dm_spawn[?rm_name+STR_CutScene+STR_Count] = _count;
//

var         _SPAWN_DATAKEY = rm_name+STR_CutScene+hex_str(_count);
g.dm_spawn[?_SPAWN_DATAKEY+STR_Object]          = _OBJ;
g.dm_spawn[?_SPAWN_DATAKEY+STR_Version]         = _VER;
g.dm_spawn[?_SPAWN_DATAKEY+"_x"]                = _X;
g.dm_spawn[?_SPAWN_DATAKEY+"_y"]                = _Y;
g.dm_spawn[?_SPAWN_DATAKEY+STR_Palette+STR_Idx] = _PAL_IDX;


var _DK =   _SPAWN_DATAKEY+STR_Data;
_count = 1;
for(_i=_arg; _i<_ARGS; _i++) g.dm_spawn[?_DK+hex_str(_count++)] = argument[_arg++];



return _SPAWN_DATAKEY;




