/// data_spawn_3a(spawn_datakey base, object_index, version, XL, YT, *palette idx)


var _i, _num1,_num2;
var _datakey,_datakey1,_datakey2;

var _ARGS = argument_count;

var                                 _arg=0;
var _SPAWN_DATA          = argument[_arg++]; // rm name + trigger type
var _OBJ                 = argument[_arg++];
var _VER                 = argument[_arg++];
var _X                   = argument[_arg++];
var _Y                   = argument[_arg++];

var             _PAL_IDX = -1;
if (_ARGS>_arg) _PAL_IDX = argument[_arg++];


var _OBJ_NAME = object_get_name(_OBJ);
var _OBJVER   = _OBJ_NAME+hex_str(_VER);
var _RM_NAME  = string_copy(_SPAWN_DATA, 1, RmName_LEN);
var _DUNGEON_NUM = val(g.dm_rm[?_RM_NAME+STR_Dungeon+STR_Num]);


var                              _dk_COUNT  = _SPAWN_DATA+STR_Count;
var _spawn_idx = val(g.dm_spawn[?_dk_COUNT]);
                     g.dm_spawn[?_dk_COUNT] = _spawn_idx+1;
//

             spawn_datakey = _SPAWN_DATA+hex_str(_spawn_idx);
var         _SPAWN_DATAKEY = spawn_datakey;

g.dm_spawn[?_SPAWN_DATAKEY+STR_Obj_Name] = _OBJ_NAME;
g.dm_spawn[?_SPAWN_DATAKEY+STR_obj_idx]  = _OBJ;
g.dm_spawn[?_SPAWN_DATAKEY+STR_Version]  = _VER;
g.dm_spawn[?_SPAWN_DATAKEY+STR_OBJVER]   = _OBJVER;
g.dm_spawn[?_SPAWN_DATAKEY+"_x"] = _X;
g.dm_spawn[?_SPAWN_DATAKEY+"_y"] = _Y;

g.dm_spawn[?_SPAWN_DATAKEY+STR_Rm+STR_Name] = _RM_NAME;
g.dm_spawn[?_SPAWN_DATAKEY+STR_Spawn_Permission] = 1;

if (_PAL_IDX!=-1) g.dm_spawn[?_SPAWN_DATAKEY+STR_pal_idx] = _PAL_IDX;




if (is_undefined(g.dm_spawn[?_SPAWN_DATAKEY+STR_Object+STR_Num]))
{
    _num1=val(g.dm_spawn[?         _OBJ_NAME+STR_Count]) + 1;
              g.dm_spawn[?         _OBJ_NAME+STR_Count] = _num1;
              g.dm_spawn[?         _OBJ_NAME+hex_str(_num1)+STR_Spawn+STR_Datakey] = _SPAWN_DATAKEY;
              g.dm_spawn[?         _OBJ_NAME+hex_str(_num1)+STR_Rm+STR_Name] = _RM_NAME;
              g.dm_spawn[?_SPAWN_DATAKEY+STR_Object+STR_Num] = _num1;
              g.dm_spawn[?_SPAWN_DATAKEY+STR_Spawn+STR_Datakey+"_A"] = _OBJ_NAME+hex_str(_num1);
    //
    _num2=val(g.dm_spawn[?_RM_NAME+_OBJ_NAME+STR_Count]) + 1;
              g.dm_spawn[?_RM_NAME+_OBJ_NAME+STR_Count] = _num2;
              g.dm_spawn[?_RM_NAME+_OBJ_NAME+hex_str(_num2)+STR_Spawn+STR_Datakey] = _SPAWN_DATAKEY;
              g.dm_spawn[?_RM_NAME+_OBJ_NAME+hex_str(_num2)+STR_Object+STR_Num] = _num1;
    //
}





var _IS_TYPE1 = ds_list_find_index(g.dl_RandoEnemy_OBJVER1,_OBJVER)!=-1;
var _IS_TYPE2 = ds_list_find_index(g.dl_RandoEnemy_OBJVER2,_OBJVER)!=-1; // Flying
var _IS_TYPE3 = ds_list_find_index(g.dl_RandoEnemy_OBJVER3,_OBJVER)!=-1; // Spawners
if (_IS_TYPE1 
||  _IS_TYPE2 
||  _IS_TYPE3 )
{
    _datakey  = STR_Randomize+STR_Enemy+STR_Spawn;
    _datakey1 = _datakey+_SPAWN_DATAKEY+STR_Spawn+STR_Num;
    
    if(!val(g.dm_RandoEnemy[?_datakey1])) // if not added yet
    {   // This makes a list of spawns that are qualified to rando the objver
        _datakey2 = _datakey+STR_Count;
        _num1 = val(g.dm_RandoEnemy[?_datakey2]) + 1;
        g.dm_RandoEnemy[?_datakey2] = _num1;
        dm_rando_enemy[? _datakey2] = _num1;
        
        g.dm_RandoEnemy[?_datakey1] = _num1;
        dm_rando_enemy[? _datakey1] = _num1;
        
        
        _datakey2 = _datakey+hex_str(_num1)+STR_Spawn+STR_Datakey;
        g.dm_RandoEnemy[?_datakey2] = _SPAWN_DATAKEY;
        dm_rando_enemy[? _datakey2] = _SPAWN_DATAKEY;
    }
}




return _SPAWN_DATAKEY;




