/// data_go_prop1(object_index, GO id, obj full name, placement sprite)


var                       _arg=0;
var _OBJECT    = argument[_arg++];
var _FULL_NAME = argument[_arg++];
var _SPRITE    = argument[_arg++];
var _OBJ_NAME  = object_get_name(_OBJECT);

g.dm_go_prop[?_OBJ_NAME+STR_Object+STR_Idx] = _OBJECT;
g.dm_go_prop[?_OBJ_NAME+dk_FullName]        = _FULL_NAME;
g.dm_go_prop[?_OBJ_NAME+STR_Placement_spr]  = _SPRITE;
g.dm_go_prop[?_OBJ_NAME+STR_Width]          = sprite_get_width( _SPRITE);
g.dm_go_prop[?_OBJ_NAME+STR_Height]         = sprite_get_height(_SPRITE);

return _OBJ_NAME;




