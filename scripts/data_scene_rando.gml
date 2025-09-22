/// data_scene_rando(scene name)


var _i,_j;

var                        _arg=0;
var _SCENE_NAME = argument[_arg++];


var _CAN_HAVE_ITEM        = true;
var _CAN_HAVE_CONT_PIECE  = true;
var _CAN_HAVE_PBAG        = true;
var _CAN_HAVE_KEY         = true;
var _CAN_HAVE_1UP         = true;
var _CAN_HAVE_JAR         = true;
var _CAN_HAVE_LOCKED_DOOR = false;
var _CAN_HAVE_PUSHABLE    = false;
var _CAN_HAVE_KAKUSU      = false;
var _CAN_HAVE_BOSS        = false;
var _CAN_BE_ENCOUNTER     = false;


if (val(g.dm_rm[?_SCENE_NAME+STR_Enc_Type]) 
&& !_CAN_BE_ENCOUNTER )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


for(_i=0; _i<2; _i++)
{
    if(!_i) var _SPAWN_TYPE = STR_PRIO;
    else    var _SPAWN_TYPE = STR_PRXM;
    
    var _SPAWN_COUNT = val(g.dm_spawn[?get_spawn_datakey(_SCENE_NAME,_SPAWN_TYPE,-1)]);
    
    for(var _spawn_idx=0; _spawn_idx<_SPAWN_COUNT; _spawn_idx++)
    {
        var _SPAWN_DK = get_spawn_datakey(_SCENE_NAME,_SPAWN_TYPE,_spawn_idx);
        var _OBJ = g.dm_spawn[?_SPAWN_DK+STR_obj_idx];
        if(!is_undefined(_OBJ))
        {
            var _ITEM_TYPE = g.dm_ITEM[?object_get_name(_OBJ)+STR_Item+STR_Type];
            if(!is_undefined(_ITEM_TYPE))
            {
                switch(_ITEM_TYPE)
                {
                    case STR_HEART:{
                    if (_CAN_HAVE_CONT_PIECE) continue;//_spawn_idx
                    else exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    break;}//case STR_HEART
                    
                    case STR_MAGIC:{
                    if (_CAN_HAVE_CONT_PIECE) continue;//_spawn_idx
                    else exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    break;}//case STR_MAGIC
                    
                    case STR_KEY:{
                    if (_CAN_HAVE_KEY) continue;//_spawn_idx
                    else exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    break;}//case STR_KEY
                    
                    case STR_PBAG:{
                    if (_CAN_HAVE_PBAG) continue;//_spawn_idx
                    else exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    break;}//case STR_PBAG
                    
                    case STR_JAR:{
                    if (_CAN_HAVE_JAR) continue;//_spawn_idx
                    else exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    break;}//case STR_JAR
                }//switch(_ITEM_TYPE)
            }
            else
            {
                if (is_ancestor(_OBJ,LoDoA))
                {
                    if (_CAN_HAVE_LOCKED_DOOR) continue;//_spawn_idx
                    else exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                }
                
                if (is_ancestor(_OBJ,PushA))
                {
                    if (_CAN_HAVE_PUSHABLE) continue;//_spawn_idx
                    else exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                }
                
                if (is_ancestor(_OBJ,Kakusu))
                {
                    if (_CAN_HAVE_KAKUSU) continue;//_spawn_idx
                    else exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                }
                
                if (is_ancestor(_OBJ,Boss))
                {
                    if (_CAN_HAVE_BOSS) continue;//_spawn_idx
                    else exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                }
            }
        }
    }
}








var _data, _datakey0,_datakey1;
var _first = true;
var _exit_name, _exit_num, _exit_type, _exit_id;
var _EXIT_DIR_COUNT = ds_list_size(g.dl_exit_dirs);
var _group_id_exits = "_Exits:";

for(_i=0; _i<_EXIT_DIR_COUNT; _i++) // each exit dir: $00 mid, $10 right, $20 left, $40 down, $80 up
{
    for(_j=0; _j<$10; _j++) // each number ($0-$F) of the exit dir
    {
        _exit_num  = g.dl_exit_dirs[|_i];
        _exit_num |= _j;
        _exit_name = _SCENE_NAME + hex_str(_exit_num);
        _exit_type = g.dm_rm[?_exit_name+STR_Type];
        
        if (is_undefined(_exit_type))
        {   // no more exits for this exit dir _i
            break;//_j
        }
        
        
        if(!_first) _group_id_exits += "-";
        _group_id_exits += STR_Exit+hex_str(_exit_num);
        _group_id_exits += STR_Type+hex_str(_exit_type);
        _group_id_exits += STR_Open+hex_str(g.dm_rm[?_exit_name+STR_Open]);
        
        _first = false;
    }
}








var _conditions, _path_name, _item_path_name;
var _group_id_paths = "_Paths:";
var _dl_conditions = ds_list_create();
_first = true;
_datakey0 = _SCENE_NAME+STR_Path+STR_Conditions;

var _PATH_COUNT = val(g.dm_rm[?_datakey0+STR_Path+STR_Count]);
if (_PATH_COUNT)
{
    for(_i=1; _i<=_PATH_COUNT; _i++) // each path of the scene
    {
        _conditions = g.dm_rm[?_SCENE_NAME+STR_Path+hex_str(_i)+STR_Conditions+STR_ID];
        if(!is_undefined(_conditions))
        {
            _path_name = string(val(g.dm_rm[?_datakey0+STR_Path+hex_str(_i)+STR_Path+STR_Name]));
            if (global.SceneRando_ItemPositioning_METHOD==2  // 2: Scenes with items that have no conditions to reach them can be rando'd with scenes with no items. A safe position will be given to the item on room start.
            &&  string_pos(STR_Item,_path_name) ) // This `_i` is a path to an item
            {
                _item_path_name = string_copy(_path_name, string_pos(STR_Item,_path_name), string_length(STR_Item)+2);
                _data = g.dm_rm[?_SCENE_NAME+_item_path_name+STR_Conditions+STR_List];
                if(!is_undefined(_data))
                {
                    ds_list_read(_dl_conditions,_data);
                    if (ds_list_size(_dl_conditions)==1)
                    {
                        g.dm_rm[?_SCENE_NAME+_item_path_name+STR_Conditions+STR_Type] = _dl_conditions[|0];
                        
                        if (_dl_conditions[|0]==STR_None)
                        //||  _dl_conditions[|0]==STR_GLOVE 
                        //||  _dl_conditions[|0]==STR_JUMP )
                        {
                            continue;//_i. All paths to this item either have no conditions or all the same conditions
                        }
                    }
                }
            }
            
            if(!_first) _group_id_paths += "-";
            _group_id_paths += _conditions;
            _first = false;
        }
    }//_i
}
//g.dm_rm[?_SCENE_NAME+STR_Path+STR_Conditions+_PATH_NAME+STR_Destination] // get item spawn dk






var _GROUP_ID = _group_id_exits + "---" + _group_id_paths;
global.dm_scene_rando[?_SCENE_NAME+STR_Group+STR_ID] = _GROUP_ID;

global.dm_scene_rando[?STR_Scene+STR_Count] = val(global.dm_scene_rando[?STR_Scene+STR_Count]) + 1;
var _SCENE_NUM                              = val(global.dm_scene_rando[?STR_Scene+STR_Count]);
global.dm_scene_rando[?_SCENE_NAME+STR_Scene+STR_Num] = _SCENE_NUM;
global.dm_scene_rando[?STR_Scene+hex_str(_SCENE_NUM)+STR_Scene+STR_Name] = _SCENE_NAME;



var _dl_group_ids = ds_list_create();

_datakey0 = STR_Group+STR_ID+STR_List;
_data = global.dm_scene_rando[?_datakey0];
if(!is_undefined(_data)) ds_list_read(_dl_group_ids, _data);
if (ds_list_find_index(_dl_group_ids,_GROUP_ID)==-1) ds_list_add(_dl_group_ids, _GROUP_ID);
global.dm_scene_rando[?_datakey0] = ds_list_write(_dl_group_ids);

global.dm_scene_rando[?STR_Group+STR_Count] = ds_list_size(_dl_group_ids);


var _GROUP_ID_IDX = ds_list_find_index(_dl_group_ids,_GROUP_ID);
global.dm_scene_rando[?_SCENE_NAME+STR_Group+STR_ID+STR_Index] = _GROUP_ID_IDX;
ds_list_destroy(_dl_group_ids); _dl_group_ids=undefined;




var _dl_group_scenes = ds_list_create();

_datakey0 = STR_Group+STR_ID+STR_Index+hex_str(_GROUP_ID_IDX)+STR_Scene+STR_List;
_data = global.dm_scene_rando[?_datakey0];
if(!is_undefined(_data)) ds_list_read(_dl_group_scenes, _data);
ds_list_add(_dl_group_scenes, _SCENE_NAME);
global.dm_scene_rando[?_datakey0] = ds_list_write(_dl_group_scenes);
ds_list_destroy(_dl_group_scenes); _dl_group_scenes=undefined;








/*
_datakey0 = _SCENE_NAME+STR_Path+STR_Conditions;
for(_i=1; _i<=_PATH_COUNT; _i++) // each path of the scene
{
    _conditions = g.dm_rm[?_SCENE_NAME+STR_Path+hex_str(_i)+STR_Conditions+STR_ID];
    if(!is_undefined(_conditions))
    {
        _path_name = string(val(g.dm_rm[?_datakey0+STR_Path+hex_str(_i)+STR_Path+STR_Name]));
        if (string_pos(STR_Item,_path_name)) // This `_i` is a path to an item
        {
            _datakey1 = string_copy(_path_name, string_pos(STR_Item,_path_name), string_length(STR_Item)+2);
            _datakey1 = _SCENE_NAME+_datakey1+STR_Conditions+STR_List;
            _data = g.dm_rm[?_datakey1];
            if(!is_undefined(_data))
            {
                ds_list_read(_dl_conditions,_data);
                if (ds_list_size(_dl_conditions)==1 
                &&  _dl_conditions[|0]!=STR_None )
                //&&  _dl_conditions[|0]==STR_JUMP )
                {
                    show_debug_message(string(val(g.dm_rm[?_SCENE_NAME+dk_FileName+STR_Quest+"01"]))+" - "+_SCENE_NAME+". "+_conditions);
                    continue;//_i. All paths to this item either have no conditions or all the same conditions
                }
            }
        }
    }
}//_i
*/




ds_list_destroy(_dl_conditions); _dl_conditions=undefined;




