/// data_path_conditions(orgin exit, destination, *conditions, ..)


var _datakey, _val;

var                         _arg=0;
var _ORIGIN_EXIT = argument[_arg++]; // origin exit name
var _DESTINATION = argument[_arg++]; // this could be an exit name, or an item spawn dk, or...

var _SCENE_NAME = string_copy(_ORIGIN_EXIT, 1, RmName_LEN);

var _path_name_origin  = STR_Exit+string_copy(_ORIGIN_EXIT, string_length(_ORIGIN_EXIT)-1, 2);

var _path_name_destin = _DESTINATION;
if (string_pos("PRIO",_DESTINATION) 
||  string_pos("PRXM",_DESTINATION) )
{   // _DESTINATION is an object like an item
    var _SCENE_ITEM_NUM = val(g.dm_spawn[?_DESTINATION+_SCENE_NAME+STR_Item+STR_Num]);
    _path_name_destin = STR_Item+hex_str(_SCENE_ITEM_NUM);
}
else
{   // _DESTINATION is an exit
    _path_name_destin  = STR_Exit+string_copy(_DESTINATION, string_length(_DESTINATION)-1, 2);
}








// -------------------------------------------------------------------------------
var _PATH_NAME = _path_name_origin+_path_name_destin;

var _DATAKEY0 = _SCENE_NAME+STR_Path+STR_Conditions;
var _DATAKEY1 = _DATAKEY0+_PATH_NAME;

var _PATH_NUM = val(g.dm_rm[?_DATAKEY0+STR_Path+STR_Count]) + 1;
var _DATAKEY2 = _DATAKEY0+STR_Path+hex_str(_PATH_NUM);


g.dm_rm[?_DATAKEY0+STR_Path+STR_Count]  = _PATH_NUM;
g.dm_rm[?_DATAKEY1+STR_Path+STR_Num]    = _PATH_NUM;

g.dm_rm[?_DATAKEY2+STR_Path+STR_Name]   = _PATH_NAME;
g.dm_rm[?_DATAKEY2+STR_Origin+STR_Exit] = _ORIGIN_EXIT;
g.dm_rm[?_DATAKEY2+STR_Destination]     = _DESTINATION;


g.dm_rm[?_ORIGIN_EXIT+STR_Path+STR_Count] = val(g.dm_rm[?_ORIGIN_EXIT+STR_Path+STR_Count]) + 1;
if (string_pos(STR_Exit,_path_name_destin)) g.dm_rm[?_ORIGIN_EXIT+STR_Exit+STR_Path+STR_Count] = val(g.dm_rm[?_ORIGIN_EXIT+STR_Exit+STR_Path+STR_Count]) + 1;




var _path_condition_id = STR_Path+":"+_PATH_NAME+"(";

var _conditions = "";
var _condition_num = 0;
for(var _i=_arg; _i<argument_count; _i++)
{
    if (_condition_num) _conditions += "_&&_";
    g.dm_rm[?_DATAKEY1+STR_Condition+STR_Count] = ++_condition_num;
    g.dm_rm[?_DATAKEY1+STR_Condition+hex_str(_condition_num)] = argument[_i];
    _conditions += argument[_i];
}

_path_condition_id += _conditions+")";


if (string_pos(STR_Item,_path_name_destin))
{
    _datakey = _SCENE_NAME+_path_name_destin+STR_Conditions+STR_Total;
    g.dm_rm[?_datakey] = val(g.dm_rm[?_datakey]) + _condition_num;
    
    var _dl_conditions = ds_list_create();
    _datakey = _SCENE_NAME+_path_name_destin+STR_Conditions+STR_List;
    var _DATA = g.dm_rm[?_datakey];
    if(!is_undefined(_DATA)) ds_list_read(_dl_conditions, _DATA);
    
    if (string_length(_conditions)) _val = _conditions;
    else                            _val = STR_None;
    if (ds_list_find_index(_dl_conditions,_val)==-1) ds_list_add(_dl_conditions,_val);
    
    g.dm_rm[?_datakey] = ds_list_write(_dl_conditions);
    ds_list_destroy(_dl_conditions); _dl_conditions=undefined;
}


//if(!is_undefined(g.dm_rm[?_SCENE_NAME+STR_Path+_PATH_NAME+STR_Conditions+STR_ID])) show_debug_message("data_path_conditions().  Scene '"+_SCENE_NAME+"', Path '"+_PATH_NAME+"' already exists");
g.dm_rm[?_SCENE_NAME+STR_Path+_PATH_NAME        +STR_Conditions+STR_ID] = _path_condition_id;
g.dm_rm[?_SCENE_NAME+STR_Path+hex_str(_PATH_NUM)+STR_Conditions+STR_ID] = _path_condition_id;




//if (_path_name_origin==_path_name_destin) show_debug_message("data_path_conditions().  Scene '"+_SCENE_NAME+"', Path '"+_PATH_NAME+"' is the same exit");

//if (is_undefined(g.dm_rm[?_ORIGIN_EXIT+STR_Num])) show_debug_message("data_path_conditions().  Scene '"+_SCENE_NAME+"', Origin Exit '"+_ORIGIN_EXIT+"' does not exist");
//if (string_pos(STR_Exit,_path_name_destin) && is_undefined(g.dm_rm[?_DESTINATION+STR_Num])) show_debug_message("data_path_conditions().  Scene '"+_SCENE_NAME+"', Destination Exit '"+_DESTINATION+"' does not exist");

//if (string_pos(STR_Exit,_path_name_destin) && val(g.dm_rm[?_DATAKEY1+STR_Condition+STR_Count])) show_debug_message(_SCENE_NAME+". "+_path_condition_id);
//if (string_pos(STR_Item,_path_name_destin) && val(g.dm_rm[?_DATAKEY1+STR_Condition+STR_Count])) show_debug_message(string(val(g.dm_rm[?_SCENE_NAME+dk_FileName+STR_Quest+"01"]))+" - "+_SCENE_NAME+". "+_path_condition_id);




