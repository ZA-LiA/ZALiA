/// tile_data_init_1()

// Background tile animation data


BackgroundTileAnimations_VER = 1;
if(!BackgroundTileAnimations_VER) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


var _i,_j, _a;
var _count,_count1,_count2;
var _num,_num1,_num2;
var _dk, _dk1,_dk2,_dk3,_dk4; // dk: DataKey
var _ts, _ts_name;
var _cue;
var _dl1 = ds_list_create();
var _dl2 = ds_list_create();


// ------------------------------------------------------------------
dm_TILE_ANIM = ds_map_create();

// Tile animations in the current scene.
dl_scene_anims = ds_list_create();



_num=0;
// ------------------------------------------------------------------
// This tileset is just a container for the current 
// graphic of the animation on any given game frame.
// Any tiles you want animated with these same behaviors, 
// must come from a .tsx file with the same name.
// It represents a specific animation that has all the same 
// behaviors; anim frame count, graphic source of each anim frame, 
// duration of each anim frame, etc..
// I named this animation 'Animation0301' because it's the 
// first 3-frame-animation I have created, but animations 
// can named anything.
_ts = ts_Animation0301;
_ts_name = background_get_name(_ts);
dm_TILE_ANIM[?STR_Anim+STR_Count] = ++_num;
dm_TILE_ANIM[?STR_Anim+hex_str(_num)+STR_Tileset+STR_Name] = _ts_name;
dm_TILE_ANIM[?_ts_name+STR_Tileset] = _ts;
dm_TILE_ANIM[?_ts_name+STR_Anim+STR_Num] = _num;
// Number of times anim will play. -1: play forever
dm_TILE_ANIM[?_ts_name+STR_Loop] = -1;
//dm_TILE_ANIM[?_ts_name+STR_Play+STR_Count] = -1;

// This is data for each anim frame of 'Animation0301'.
ds_list_clear(_dl1);
ds_list_clear(_dl2);

ds_list_add(_dl1,$08); // frame duration
ds_list_add(_dl2,ts_Animation030101);

ds_list_add(_dl1,$08); // frame duration
ds_list_add(_dl2,ts_Animation030102);

ds_list_add(_dl1,$08); // frame duration
ds_list_add(_dl2,ts_Animation030103);

_count = ds_list_size(_dl1);
dm_TILE_ANIM[?_ts_name+STR_Frame+STR_Count] = _count;
for(_i=0; _i<_count; _i++)
{
    _dk2=_ts_name+STR_Frame;
    _dk3=_dk2+hex_str(_i+1);
    dm_TILE_ANIM[?_dk3+STR_Tileset]  = _dl2[|_i];
    dm_TILE_ANIM[?_dk3+STR_Duration] = _dl1[|_i];
    
    //_cue = val(dm_TILE_ANIM[?_dk2+hex_str(_i)+STR_Cue]);
    _cue = val(dm_TILE_ANIM[?_ts_name+STR_Duration]);
    dm_TILE_ANIM[?_dk3+STR_Cue] = _cue;
    dm_TILE_ANIM[?_ts_name+STR_Cue+hex_str(_cue)+STR_Frame+STR_Num] = _i+1;
    dm_TILE_ANIM[?_ts_name+STR_Cue+hex_str(_cue)+STR_Frame+STR_Datakey] = _dk3;
    dm_TILE_ANIM[?_ts_name+STR_Duration] = val(dm_TILE_ANIM[?_ts_name+STR_Duration]) + _dl1[|_i];
}





// ------------------------------------------------------------------
_ts = ts_Animation0401;
_ts_name = background_get_name(_ts);
dm_TILE_ANIM[?STR_Anim+STR_Count] = ++_num;
dm_TILE_ANIM[?STR_Anim+hex_str(_num)+STR_Tileset+STR_Name] = _ts_name;
dm_TILE_ANIM[?_ts_name+STR_Tileset] = _ts;
dm_TILE_ANIM[?_ts_name+STR_Anim+STR_Num] = _num;
// Number of times anim will play. -1: play forever
dm_TILE_ANIM[?_ts_name+STR_Loop] = -1;

// This is data for each anim frame of 'Animation0401'.
ds_list_clear(_dl1);
ds_list_clear(_dl2);

ds_list_add(_dl1,$08); // frame duration
ds_list_add(_dl2,ts_Animation030101);

ds_list_add(_dl1,$08); // frame duration
ds_list_add(_dl2,ts_Animation030102);

ds_list_add(_dl1,$08); // frame duration
ds_list_add(_dl2,ts_Animation030103);

ds_list_add(_dl1,$08); // frame duration
ds_list_add(_dl2,ts_Animation030102);

_count = ds_list_size(_dl1);
dm_TILE_ANIM[?_ts_name+STR_Frame+STR_Count] = _count;
for(_i=0; _i<_count; _i++)
{
    _dk2=_ts_name+STR_Frame;
    _dk3=_dk2+hex_str(_i+1);
    dm_TILE_ANIM[?_dk3+STR_Tileset]  = _dl2[|_i];
    dm_TILE_ANIM[?_dk3+STR_Duration] = _dl1[|_i];
    
    //_cue = val(dm_TILE_ANIM[?_dk2+hex_str(_i)+STR_Cue]);
    _cue = val(dm_TILE_ANIM[?_ts_name+STR_Duration]);
    dm_TILE_ANIM[?_dk3+STR_Cue] = _cue;
    dm_TILE_ANIM[?_ts_name+STR_Cue+hex_str(_cue)+STR_Frame+STR_Num] = _i+1;
    dm_TILE_ANIM[?_ts_name+STR_Cue+hex_str(_cue)+STR_Frame+STR_Datakey] = _dk3;
    dm_TILE_ANIM[?_ts_name+STR_Duration] = val(dm_TILE_ANIM[?_ts_name+STR_Duration]) + _dl1[|_i];
}









// ------------------------------------------------------------------
ds_list_destroy(_dl1); _dl1=undefined;
ds_list_destroy(_dl2); _dl2=undefined;




