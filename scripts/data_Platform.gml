/// data_Platform(object_index, version, x, y, *palette idx, *direction, *start location, *path, *hspd, *vspd, *width)


var _ARGS = argument_count;

var                     _arg=0;
var _OBJECT  = argument[_arg++];
var _VERSION = argument[_arg++];
var _XL      = argument[_arg++];
var _YT      = argument[_arg++];

var             _PAL_IDX = -1;
if (_ARGS>_arg) _PAL_IDX = argument[_arg++];

var _SPAWN_DATAKEY = data_spawn_2a(STR_Platform, _OBJECT,_VERSION, _XL,_YT, _PAL_IDX);

// ----------------------------------------------------------------------------------
// 1: Forward, -1: Backward
if (_ARGS>_arg) g.dm_spawn[?_SPAWN_DATAKEY+STR_Direction] = sign_(argument[_arg++]);

// uint. path idx of start location
if (_ARGS>_arg) g.dm_spawn[?_SPAWN_DATAKEY+STR_Start]     =       argument[_arg++]

// string. Every 4 chars is rc of a location along the platform's path.
if (_ARGS>_arg) g.dm_spawn[?_SPAWN_DATAKEY+STR_Path]      =       argument[_arg++]

// HSPD. $10 = 1 pixel per frame
if (_ARGS>_arg) g.dm_spawn[?_SPAWN_DATAKEY+STR_HSPD]      =       argument[_arg++]

// VSPD. $10 = 1 pixel per frame
if (_ARGS>_arg) g.dm_spawn[?_SPAWN_DATAKEY+STR_VSPD]      =       argument[_arg++]

// Different platform width than this object's default
if (_ARGS>_arg) g.dm_spawn[?_SPAWN_DATAKEY+STR_Width]     =       argument[_arg++]



return _SPAWN_DATAKEY;




