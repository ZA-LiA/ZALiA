/// g_Room_Start_1c(encoded grid, spawn type, original scene name, rando scene name)


var                          _arg=0;
var _dg_encoded   = argument[_arg++]; // dg_spawn_prio or dg_spawn_prxm encoded
var _SPAWN_TYPE   = argument[_arg++]; // STR_PRIO or STR_PRXM
var _SCENE_NAME_A = argument[_arg++];
var _SCENE_NAME_B = argument[_arg++];

var _i, _idx,_idx1, _val,_val1,_val2, _count0, _len;
var _w,_h;
var _obj, _ver, _obj_name;
var _spawn_datakey,_spawn_datakey1,_spawn_datakey2;
var _spawn_xl,_spawn_xc, _spawn_yt,_spawn_yc;
var _respawn_type;
var _spawn_permission  = 0;
var _spawn_permission1 = 0;
var _objver1 = undefined;
var _objver2 = undefined;
var _dl_avail_spawn_dk = ds_list_create();
var _ENEMY_RANDO_METHOD = val(global.dm_save_file_settings[?STR_Randomize+STR_Enemy+STR_Method]);




_count0 = val(dm_spawn[?get_spawn_datakey(_SCENE_NAME_B,_SPAWN_TYPE,-1)]);
for(_i=0; _i<_count0; _i++)
{
    _spawn_datakey = get_spawn_datakey(_SCENE_NAME_B,_SPAWN_TYPE,_i);
    _obj = val(dm_spawn[?_spawn_datakey+STR_obj_idx]);
         if (g_Room_Start_1b(_obj)) _dg_encoded = g_Room_Start_1a(_dg_encoded, _spawn_datakey, true);
    else if (g_Room_Start_1d(_obj)) ds_list_add(_dl_avail_spawn_dk,_spawn_datakey);
}

var _dg = ds_grid_create(0,0);
ds_grid_read(_dg, _dg_encoded);




// Add enemy spawns from the vanilla scene to the spawn list
_count0 = val(dm_spawn[?get_spawn_datakey(_SCENE_NAME_A,_SPAWN_TYPE,-1)]);
_count0 = min(_count0,ds_list_size(_dl_avail_spawn_dk));
for(_i=0; _i<_count0; _i++)
{
    _spawn_datakey1 = get_spawn_datakey(_SCENE_NAME_A,_SPAWN_TYPE,_i);
    _spawn_datakey2 = _dl_avail_spawn_dk[|_i];
    _obj = val(dm_spawn[?_spawn_datakey1+STR_obj_idx]);
    if (_obj 
    &&  g_Room_Start_1d(_obj) )
    {
        _obj_name = object_get_name(_obj);
        _ver      = val(dm_spawn[?_spawn_datakey1+STR_Version]);
        _objver1  = _obj_name+hex_str(_ver); // _objver example: "Snaraa"+"01" = obj name + ver
        
        if (global.EnemyRando_enabled 
        &&  _ENEMY_RANDO_METHOD )
        {
            switch(_ENEMY_RANDO_METHOD){
            default:{_objver2 = f.dm_rando[?STR_Randomize+STR_Enemy+STR_Spawn+_spawn_datakey1+STR_OBJVER+STR_Randomized]; break;}
            case  2:{_objver2 = f.dm_rando[?STR_Randomize+STR_Enemy+STR_Type +_objver1       +STR_OBJVER+STR_Randomized]; break;}
            }
            
            if(!is_undefined(_objver2))
            {
                _len  = string_length(_objver2);
                _val1 = string_copy(  _objver2,1,_len-2); // obj name
                _val2 = g.dm_go_prop[?_val1+STR_Object+STR_Idx]; // obj
                if(!is_undefined(_val2))
                {
                    _obj = _val2;
                    _ver = str_hex(string_copy(_objver2,_len-1,2));
                    _obj_name = object_get_name(_obj);
                    _objver1  = _obj_name+hex_str(_ver);
                }
            }
        }
        
        _w        = val(dm_go_prop[?_obj_name+STR_Width], $10);
        _h        = val(dm_go_prop[?_obj_name+STR_Height],$10);
        _spawn_xl = val(dm_spawn[?_spawn_datakey2+"_x"]); // spawn x
        _spawn_yt = val(dm_spawn[?_spawn_datakey2+"_y"]); // spawn y
        
        // respawn_type: Value representing if and when GO can respawn.
        // 0: never, 1: off screen, 2: refresh area, 3: refresh rm, 4: 30 seconds (on or off screen)
            _respawn_type      = val(dm_go_prop[?_objver1+STR_Respawn]);
            _spawn_permission1 = val(dm_spawn[?_spawn_datakey1+STR_Spawn_Permission]);
        if (_respawn_type==3 
        &&  _spawn_permission1!=-1 ) // -1 never spawn again
        {
            dm_spawn[?_spawn_datakey1+STR_Spawn_Permission] = 1;
        }
        _spawn_permission = val(dm_spawn[?_spawn_datakey1+STR_Spawn_Permission]);
        
        _idx1 = ds_grid_width(_dg);
        ds_grid_resize(_dg, _idx1+1, ds_grid_height(_dg));
                   _idx=0;
        _dg[#_idx1,_idx++] = _spawn_datakey1;  // 
        _dg[#_idx1,_idx++] = _obj;             // 
        _dg[#_idx1,_idx++] = _obj_name;        // 
        _dg[#_idx1,_idx++] = _ver;             // 
        //                                          //
        _dg[#_idx1,_idx++] = _spawn_xl;        // 
        _dg[#_idx1,_idx++] = _spawn_xl + (_w>>1);        // 
        _dg[#_idx1,_idx++] = _spawn_yt;        // 
        _dg[#_idx1,_idx++] = _spawn_yt + (_h>>1);        // 
        //                                          //
        _dg[#_idx1,_idx++] = _w;               // 
        _dg[#_idx1,_idx++] = (_w>>1);              // 
        _dg[#_idx1,_idx++] = _h;               // 
        _dg[#_idx1,_idx++] = (_h>>1);              // 
        //                                          //
        _dg[#_idx1,_idx++] = _respawn_type;    // 
        _dg[#_idx1,_idx++] = val(f.dm_quests[?get_defeated_dk()+_spawn_datakey1]);  // 
        _dg[#_idx1,_idx++] = _spawn_permission;// 
    }
}


ds_list_destroy(_dl_avail_spawn_dk); _dl_avail_spawn_dk=undefined;




_dg_encoded = ds_grid_write(_dg);
ds_grid_destroy(_dg); _dg=undefined;


return _dg_encoded;




