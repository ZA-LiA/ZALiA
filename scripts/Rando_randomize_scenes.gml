/// Rando_randomize_scenes()


var _i,_j, _count;
var _data;
var _scene_name1,_scene_name2;


global.SceneRando_enabled = Scenes_WILL_RANDOMIZE;
save_game_pref();


random_set_seed(Rando_SEED);




var _dl_group_scenes1 = ds_list_create();
var _dl_group_scenes2 = ds_list_create();

var          _GROUP_COUNT = val(global.dm_scene_rando[?STR_Group+STR_Count]);
for(_i=0; _i<_GROUP_COUNT; _i++)
{
    ds_list_clear(_dl_group_scenes1);
    _data = global.dm_scene_rando[?STR_Group+STR_ID+STR_Index+hex_str(_i)+STR_Scene+STR_List];
    if(!is_undefined(_data))
    {
        ds_list_read(_dl_group_scenes1, _data);
        _count = ds_list_size(_dl_group_scenes1);
        if (_count>1)
        {
            ds_list_copy(   _dl_group_scenes2, _dl_group_scenes1);
            ds_list_shuffle(_dl_group_scenes2);
            for(_j=0; _j<_count; _j++)
            {
                _scene_name1 = _dl_group_scenes1[|_j];
                _scene_name2 = _dl_group_scenes2[|_j];
                dm_save_data[?dk_SceneRando+STR_Scene+STR_Randomized+_scene_name1] = _scene_name2;
                //if (isVal(_scene_name2,Area_MazIs+"8E",Area_MazIs+"8F",Area_MazIs+"9F")) show_debug_message("Rando_randomize_scenes(). "+_scene_name2+" is in "+_scene_name1);
            }
        }
    }
}


ds_list_destroy(_dl_group_scenes1); _dl_group_scenes1=undefined;
ds_list_destroy(_dl_group_scenes2); _dl_group_scenes2=undefined;




