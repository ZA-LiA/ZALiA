/// data_rando_scene01(exit data, scene name)


var _i, _a;
var _num, _num1,_num2;
var _count, _count1,_count2,_count3,_count4;
var _val, _val1,_val2,_val3,_val4;
var _spawn_dk, _obj, _obj_name, _ver, _objver1, _item_type, _item_id, _is_item;
var _has_item = false;
var _dk, _dk1,_dk2,_dk3,_dk4;
var _dl1 = ds_list_create();
ds_list_add(_dl1,STR_CANDLE,STR_GLOVE,STR_CROSS,STR_BRACELET,STR_MASK,STR_ALLKEY,STR_BOOK);
ds_list_add(_dl1,STR_JUMP,STR_FAIRY,STR_FIRE,STR_REFLECT,STR_ENIGMA,STR_THUNDER,STR_SUMMON);
ds_list_add(_dl1,STR_STABDOWN,STR_STABUP);

                           _a=0;
var _EXIT_DATA  = argument[_a++];
var _SCENE_NAME = argument[_a++];


if (string_pos(Area_MazIs,_SCENE_NAME) 
&&  str_hex(string_copy(_SCENE_NAME, RmName_LEN-1, 2))>=$40 )
{   // Uncomment this to NOT use the extra Scene Rando scenes
    //exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


var                    _conditions = undefined;
if (argument_count>_a) _conditions = argument[_a++];
if(!is_undefined(_conditions))
{
    _val = "";
    _count1 = ds_list_size(_dl1);
    for(_i=0; _i<_count1; _i++)
    {
        _val1 = _dl1[|_i];
        if (string_pos(_val1,_conditions)) _val += _val1;
    }
    
    if (string_length(_val)) _conditions = _val;
}


var _CAN_HAVE_ITEM = false;
var _CAN_HAVE_CONT_PIECE = false;
var _CAN_HAVE_PBAG = false;
var _CAN_HAVE_KEY = false;
var _CAN_HAVE_1UP = false;
var _CAN_HAVE_JAR = false;
var _CAN_HAVE_KAKUSU = false;
var _CAN_HAVE_LOCKED_DOOR = false;

//var _PRXM_COUNT = val(g.dm_spawn[?get_spawn_datakey(_SCENE_NAME,STR_PRXM,-1)]);
var _PRIO_COUNT = val(g.dm_spawn[?get_spawn_datakey(_SCENE_NAME,STR_PRIO,-1)]);

for(_i=0; _i<_PRIO_COUNT; _i++)
{
    _spawn_dk = get_spawn_datakey(_SCENE_NAME,STR_PRIO,_i);
    _obj = g.dm_spawn[?_spawn_dk+STR_obj_idx];
    if(!is_undefined(_obj))
    {
        _obj_name = object_get_name(_obj);
        _ver      = val(g.dm_spawn[?_spawn_dk+STR_Version]);
        _objver1  = _obj_name+hex_str(_ver);
        
        _item_type = val(g.dm_ITEM[?_obj_name+STR_Item+STR_Type]);
        _is_item   = is_string(_item_type);
        _item_id   =    string(_item_type);
        
        if (_is_item)
        {
            if (_item_type==STR_JAR) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            _has_item = true;
            /*
            switch(_item_type)
            {
                case STR_HEART:{
                if (_CAN_HAVE_CONT_PIECE) continue;//_i
                else exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                break;}//case STR_HEART
                
                case STR_MAGIC:{
                if (_CAN_HAVE_CONT_PIECE) continue;//_i
                else exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                break;}//case STR_MAGIC
                
                case STR_KEY:{
                if (_CAN_HAVE_KEY) continue;//_i
                else exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                break;}//case STR_KEY
                
                case STR_PBAG:{
                if (_CAN_HAVE_PBAG) continue;//_i
                else exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                break;}//case STR_PBAG
                
                case STR_JAR:{
                if (_CAN_HAVE_JAR) continue;//_i
                else exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                break;}//case STR_JAR
            }//switch(_item_type)
            */
        }
        else
        {
            if (is_ancestor(_obj,Kakusu))
            {
                if (_CAN_HAVE_KAKUSU) continue;//_i
                else exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            }
            
            if (is_ancestor(_obj,LoDoA))
            {
                if (_CAN_HAVE_LOCKED_DOOR) continue;//_i
                else exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            }
        }
    }
}


_val = _EXIT_DATA;
if (_has_item) _val += STR_Item;
if(!is_undefined(_conditions)) _val += _conditions;
var _RANDO_SCENE_TYPE = _val;



_dk1 = _RANDO_SCENE_TYPE+STR_Count;
global.dm_scene_rando[?_dk1] = val(global.dm_scene_rando[?_dk1])+1;
_num1 =                        val(global.dm_scene_rando[?_dk1]);

_dk2 = dk_SceneRando+STR_Scene+STR_Type;

if (_num1==1) // if this scene is the first of its `_RANDO_SCENE_TYPE`
{
    _dk3 = _dk2+STR_Count;
    global.dm_scene_rando[?_dk3] = val(global.dm_scene_rando[?_dk3])+1;
    _num2 =                        val(global.dm_scene_rando[?_dk3]);
    global.dm_scene_rando[?_dk2+hex_str(_num2)] = _RANDO_SCENE_TYPE;
}


global.dm_scene_rando[?_dk2+_SCENE_NAME] = _RANDO_SCENE_TYPE;

_dk1 = _RANDO_SCENE_TYPE+"-"+hex_str(_num1);
global.dm_scene_rando[?_dk1+STR_Scene] = _SCENE_NAME;



/* // debug
_count3 = 0;
for(_i=0; _i<_PRIO_COUNT; _i++)
{
    _spawn_dk = get_spawn_datakey(_SCENE_NAME,STR_PRIO,_i);
    _obj = g.dm_spawn[?_spawn_dk+STR_obj_idx];
    if(!is_undefined(_obj))
    {
        _obj_name = object_get_name(_obj);
        _ver      = val(g.dm_spawn[?_spawn_dk+STR_Version]);
        _objver1  = _obj_name+hex_str(_ver);
        
        _item_type = val(g.dm_ITEM[?_obj_name+STR_Item+STR_Type]);
        _is_item   = is_string(_item_type);
        _item_id   =    string(_item_type);
        
        if (_is_item)
        //&&  _item_type!=STR_JAR )
        {
            sdm("SceneRando. "+_SCENE_NAME+", "+_dk1+". Item: "+string(_item_type));
            _count3++;
        }
    }
}

if (_count3>1) sdm("");
*/




ds_list_destroy(_dl1); _dl1=undefined;




