/// g_Room_Start_1(scene is randomized, scene used)

///*
var                                 _arg=0;
var _SCENE_IS_RANDOMIZED = argument[_arg++];
var _SCENE_USED          = argument[_arg++];


ds_grid_clear( dg_spawn_prxm, 0);
ds_grid_resize(dg_spawn_prxm, 0,ds_grid_height(dg_spawn_prxm));

ds_grid_clear( dg_spawn_prio, 0);
ds_grid_resize(dg_spawn_prio, 0,ds_grid_height(dg_spawn_prio));




if(!_SCENE_IS_RANDOMIZED)
{
    var _i, _count0;
    var _dg_encoded = undefined;
    
    _dg_encoded = ds_grid_write(dg_spawn_prio);
    _count0 = val(dm_spawn[?get_spawn_datakey(rm_name,STR_PRIO,-1)]);
    for(_i=0; _i<_count0; _i++) _dg_encoded = g_Room_Start_1a(_dg_encoded, get_spawn_datakey(rm_name,STR_PRIO,_i), _SCENE_IS_RANDOMIZED);
    ds_grid_read(dg_spawn_prio, _dg_encoded);
    
    _dg_encoded = ds_grid_write(dg_spawn_prxm);
    _count0 = val(dm_spawn[?get_spawn_datakey(rm_name,STR_PRXM,-1)]);
    for(_i=0; _i<_count0; _i++) _dg_encoded = g_Room_Start_1a(_dg_encoded, get_spawn_datakey(rm_name,STR_PRXM,_i), _SCENE_IS_RANDOMIZED);
    ds_grid_read(dg_spawn_prxm, _dg_encoded);
}
else
{
    var _dg_encoded = undefined;
    
    _dg_encoded = g_Room_Start_1c(ds_grid_write(dg_spawn_prio),STR_PRIO, rm_name,_SCENE_USED);
    ds_grid_read(dg_spawn_prio, _dg_encoded);
    
    _dg_encoded = g_Room_Start_1c(ds_grid_write(dg_spawn_prxm),STR_PRXM, rm_name,_SCENE_USED);
    ds_grid_read(dg_spawn_prxm, _dg_encoded);
    /*
    var _dl_avail_spawn_dk = ds_list_create();
    
    var _ENEMY_RANDO_METHOD     = val(global.dm_save_file_settings[?STR_Randomize+STR_Enemy+STR_Method]);
    //var _ENEMY_RANDO_DIFFICULTY = val(global.dm_save_file_settings[?STR_Randomize+STR_Enemy+STR_Difficulty],1);
    
    
    // Add any qualifying priority spawns from the rando'd scene to the spawn list
    _dg_encoded = ds_grid_write(dg_spawn_prio);
    _count0 = val(dm_spawn[?get_spawn_datakey(_SCENE_USED,STR_PRIO,-1)]);
    for(_i=0; _i<_count0; _i++)
    {
        _spawn_datakey = get_spawn_datakey(_SCENE_USED,STR_PRIO,_i);
        _obj = val(dm_spawn[?_spawn_datakey+STR_obj_idx]);
        if (g_Room_Start_1b(_obj)) _dg_encoded = g_Room_Start_1a(_dg_encoded, _spawn_datakey, _SCENE_IS_RANDOMIZED);
    }
    ds_grid_read(dg_spawn_prio, _dg_encoded);
    
    
    // Add any qualifying proximity spawns from the rando'd scene to the spawn list
    _dg_encoded = ds_grid_write(dg_spawn_prxm);
    _count0 = val(dm_spawn[?get_spawn_datakey(_SCENE_USED,STR_PRXM,-1)]);
    for(_i=0; _i<_count0; _i++)
    {
        _spawn_datakey = get_spawn_datakey(_SCENE_USED,STR_PRXM,_i);
        _obj = val(dm_spawn[?_spawn_datakey+STR_obj_idx]);
        if (g_Room_Start_1b(_obj)) _dg_encoded = g_Room_Start_1a(_dg_encoded, _spawn_datakey, _SCENE_IS_RANDOMIZED);
        else if (is_ancestor_(_obj,Enemy,Spawner,FiRoA,SpikeTrap)) ds_list_add(_dl_avail_spawn_dk,_spawn_datakey);
    }
    ds_grid_read(dg_spawn_prxm, _dg_encoded);
    
    
    
    
    // Add enemy spawns from the vanilla scene to the spawn list
    _count0 = val(dm_spawn[?get_spawn_datakey(rm_name,STR_PRXM,-1)]);
    _count0 = min(_count0,ds_list_size(_dl_avail_spawn_dk));
    for(_i=0; _i<_count0; _i++)
    {
        _spawn_datakey1 = get_spawn_datakey(rm_name,STR_PRXM,_i);
        _spawn_datakey2 = _dl_avail_spawn_dk[|_i];
        _obj = val(dm_spawn[?_spawn_datakey1+STR_obj_idx]);
        if (_obj 
        &&  is_ancestor_(_obj,Enemy,Spawner,FiRoA,SpikeTrap) )
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
            
            _idx1 = ds_grid_width(dg_spawn_prxm);
            ds_grid_resize(dg_spawn_prxm, _idx1+1, ds_grid_height(dg_spawn_prxm));
                                 _idx=0;
            dg_spawn_prxm[#_idx1,_idx++] = _spawn_datakey1;  // 
            dg_spawn_prxm[#_idx1,_idx++] = _obj;             // 
            dg_spawn_prxm[#_idx1,_idx++] = _obj_name;        // 
            dg_spawn_prxm[#_idx1,_idx++] = _ver;             // 
            //                                          //
            dg_spawn_prxm[#_idx1,_idx++] = _spawn_xl;        // 
            dg_spawn_prxm[#_idx1,_idx++] = _spawn_xl + (_w>>1);        // 
            dg_spawn_prxm[#_idx1,_idx++] = _spawn_yt;        // 
            dg_spawn_prxm[#_idx1,_idx++] = _spawn_yt + (_h>>1);        // 
            //                                          //
            dg_spawn_prxm[#_idx1,_idx++] = _w;               // 
            dg_spawn_prxm[#_idx1,_idx++] = (_w>>1);              // 
            dg_spawn_prxm[#_idx1,_idx++] = _h;               // 
            dg_spawn_prxm[#_idx1,_idx++] = (_h>>1);              // 
            //                                          //
            dg_spawn_prxm[#_idx1,_idx++] = _respawn_type;    // 
            dg_spawn_prxm[#_idx1,_idx++] = val(f.dm_quests[?get_defeated_dk()+_spawn_datakey1]);  // 
            dg_spawn_prxm[#_idx1,_idx++] = _spawn_permission;// 
        }
    }
    
    
    ds_list_destroy(_dl_avail_spawn_dk); _dl_avail_spawn_dk=undefined;
    */
    
    
    
    
    // Add any item spawns from the vanilla scene to the spawn list
    var _ITEM_COUNT_A = val(dm_spawn[?rm_name+STR_Item+STR_Count]);
    if (_ITEM_COUNT_A)
    {
        var _i,_j,_k, _idx,_idx1;
        var _val,_val1,_val2, _count0, _len;
        var _x,_y, _w,_h;
        var _datakey0;
        var _spawn_datakey_a,_spawn_datakey_b;
        var _obj, _ver, _obj_name;
        var _spawn_xl,_spawn_xc, _spawn_yt,_spawn_yc;
        var _respawn_type;
        var _spawn_permission  = 0;
        var _spawn_permission1 = 0;
        var _position_found = false;
        var _scene_item_num, _item_path_name, _path_conditions_id_a,_path_conditions_id_b;
        //var _condition_type_a,_condition_type_b;
        var _item_id   = undefined;
        var _item_type = undefined;
        var _objver1   = undefined;
        var _objver2   = undefined;
        var _SceneRando_DEBUG1 = false;
        
        var _ITEM_COUNT_B = val(dm_spawn[?_SCENE_USED+STR_Item+STR_Count]);
        
        for(_i=1; _i<=_ITEM_COUNT_A; _i++)
        {
            _position_found = false;
            _spawn_datakey_a = dm_spawn[?rm_name+STR_Item+hex_str(_i)+dk_SpawnDatakey];
            if(!is_undefined(_spawn_datakey_a))
            {
                _obj = dm_spawn[?_spawn_datakey_a+STR_obj_idx];
                if(!is_undefined(_obj))
                {
                    _obj_name = object_get_name(_obj);
                    _ver      = val(dm_spawn[?_spawn_datakey_a+STR_Version]);
                    _objver1  = _obj_name+hex_str(_ver);
                    _w        = val(dm_go_prop[?_obj_name+STR_Width], $10);
                    _h        = val(dm_go_prop[?_obj_name+STR_Height],$10);
                    _spawn_xl = 0;
                    _spawn_yt = 0;
                    
                    if (_ITEM_COUNT_B)
                    {   // `_path_conditions_id_a/b` is all the paths and conditions for `_spawn_datakey_a/b`
                        _path_conditions_id_a = dm_spawn[?_spawn_datakey_a+STR_Path+STR_Conditions+STR_ID];
                        if(!is_undefined(_path_conditions_id_a))
                        {
                            for(_j=1; _j<=_ITEM_COUNT_B; _j++)
                            {
                                _spawn_datakey_b = dm_spawn[?_SCENE_USED+STR_Item+hex_str(_j)+dk_SpawnDatakey];
                                if(!is_undefined(_spawn_datakey_b))
                                {
                                    _path_conditions_id_b = dm_spawn[?_spawn_datakey_b+STR_Path+STR_Conditions+STR_ID];
                                    if(!is_undefined(_path_conditions_id_b) 
                                    &&  _path_conditions_id_a==_path_conditions_id_b )
                                    {
                                        _x = dm_spawn[?_spawn_datakey_b+"_x"]; // spawn XL
                                        _y = dm_spawn[?_spawn_datakey_b+"_y"]; // spawn YT
                                        if(!is_undefined(_x) 
                                        && !is_undefined(_y) )
                                        {
                                            _spawn_xl = _x;
                                            _spawn_yt = _y;
                                            _position_found = true;
                                            break;//_j
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    // ** 2025/11/14. For now, I have omitted scenes with multiple items that have conditions because it's too complicated
                    
                    /*
                    //if (global.SceneRando_ItemPositioning_METHOD==2  // 2: Scenes with items that have no conditions to reach them can be rando'd with scenes with no items. A safe position will be given to the item on room start.
                    _scene_item_num = val(dm_spawn[?_spawn_datakey_a+rm_name+STR_Item+STR_Num]);
                    _item_path_name = STR_Item+hex_str(_scene_item_num);
                    _condition_type_a = dm_rm[?rm_name+_item_path_name+STR_Conditions+STR_Type];
                    if(!is_undefined(_condition_type_a))
                    {
                        for(_j=1; _j<=_ITEM_COUNT_B; _j++)
                        {
                            _spawn_datakey_b = dm_spawn[?_SCENE_USED+STR_Item+hex_str(_j)+dk_SpawnDatakey];
                            if(!is_undefined(_spawn_datakey_b))
                            {
                                _scene_item_num = val(dm_spawn[?_spawn_datakey_b+_SCENE_USED+STR_Item+STR_Num]);
                                _item_path_name = STR_Item+hex_str(_scene_item_num);
                                _condition_type_b = dm_rm[?_SCENE_USED+_item_path_name+STR_Conditions+STR_Type];
                                if(!is_undefined(      _condition_type_b) 
                                &&  _condition_type_a==_condition_type_b )
                                {
                                    
                                }
                            }
                        }
                    }
                    */
                    
                    
                    if(!_position_found)
                    {
                        _datakey0 = _SCENE_USED+"_Safe"+STR_Item+STR_Position;
                        var           _POSITION_COUNT = val(global.dm_scene_rando[?_datakey0+STR_Count]);
                        for(_j=1; _j<=_POSITION_COUNT; _j++)
                        {
                            if (_j==_i 
                            ||  _j==_POSITION_COUNT )
                            {
                                _x = global.dm_scene_rando[?_SCENE_USED+"_Safe"+STR_Item+STR_Position+hex_str(_j)+"_XC"];
                                _y = global.dm_scene_rando[?_SCENE_USED+"_Safe"+STR_Item+STR_Position+hex_str(_j)+"_YC"];
                                if(!is_undefined(_x) 
                                && !is_undefined(_y) )
                                {
                                    _spawn_xl = _x - (_w>>1);
                                    _spawn_yt = _y - (_h>>1);
                                }
                                
                                break;//_j
                            }
                        }//_j
                    }
                    /*
                        _condition_type2 = global.dm_scene_rando[?_datakey0+hex_str(_j)+STR_Conditions+STR_Type];
                        _scene_item_num = val(dm_spawn[?_spawn_datakey1+rm_name+STR_Item+STR_Num]);
                        if(!is_undefined(_condition_type2) 
                        &&  _scene_item_num )
                        {
                            _item_path_name = STR_Item+hex_str(_scene_item_num);
                            _condition_type1 = dm_rm[?rm_name+_item_path_name+STR_Conditions+STR_Type];
                            if(!is_undefined(_condition_type1) 
                            &&  _condition_type1==_condition_type2 )
                            {   // TODO: What if there are multiple items and they end up in the same place?
                                //show_debug_message("g_Room_Start_1(). "+"_SCENE_USED '"+_SCENE_USED+"', rm_name '"+rm_name+"', _spawn_datakey1 '"+_spawn_datakey1+"', _obj_name '"+_obj_name+"',"+" _x="+string(_x)+" _y="+string(_y));
                                break;//_j
                            }
                        }
                    */
                    
                    
                    _spawn_xc = _spawn_xl + (_w>>1);
                    _spawn_yc = _spawn_yt + (_h>>1);
                    if (_SceneRando_DEBUG1) show_debug_message("SceneRando Item-C. _SCENE_USED '"+_SCENE_USED+"', rm_name '"+rm_name+"', _spawn_datakey_a '"+_spawn_datakey_a+"', _obj_name '"+_obj_name+"', ");
                    
                    _item_id = dm_spawn[?_spawn_datakey_a+STR_Item+STR_ID+STR_Randomized];
                    if(!is_undefined(_item_id))
                    {
                        _item_type = dm_spawn[?_item_id+STR_Item+STR_Type];
                        if(!is_undefined(_item_type))
                        {
                            _obj = val(dm_ITEM[?_item_type+STR_Object]);
                            _ver = val(dm_spawn[?_item_id+STR_Version],1);
                            _obj_name = object_get_name(_obj);
                            _objver2  = _obj_name+hex_str(_ver);
                            
                            _val = val(dm_go_prop[?_obj_name+STR_Width], $10);
                            _w   = _val;
                            _spawn_xl = _spawn_xc - (_w>>1);
                            
                            _val = val(dm_go_prop[?_obj_name+STR_Height],$10);
                            _spawn_yt = (_spawn_yt+_h) - _val;
                            _h   = _val;
                            _spawn_yc  = _spawn_yt + (_h>>1);
                            if (_SceneRando_DEBUG1) show_debug_message("SceneRando Item-D. _SCENE_USED '"+_SCENE_USED+"', rm_name '"+rm_name+"', _spawn_datakey_a '"+_spawn_datakey_a+"', _obj_name '"+_obj_name+"', _item_id '"+_item_id+"', _item_type '"+_item_type+"'");
                        }
                    }
                    
                    // respawn_type: Value representing if and when GO can respawn.
                    // 0: never, 1: off screen, 2: refresh area, 3: refresh rm, 4: 30 seconds (on or off screen)
                        _respawn_type      = val(dm_go_prop[?_objver1+STR_Respawn]);
                        _spawn_permission1 = val(dm_spawn[?_spawn_datakey_a+STR_Spawn_Permission]);
                    if (_respawn_type==3 
                    &&  _spawn_permission1!=-1 ) // -1 never spawn again
                    {   dm_spawn[?_spawn_datakey_a+STR_Spawn_Permission] = 1;  }
                    _spawn_permission = val(dm_spawn[?_spawn_datakey_a+STR_Spawn_Permission]);
                    
                    
                    _idx1 = ds_grid_width(dg_spawn_prio);
                    ds_grid_resize(dg_spawn_prio, _idx1+1, ds_grid_height(dg_spawn_prio));
                                         _idx=0;
                    dg_spawn_prio[#_idx1,_idx++] = _spawn_datakey_a;  // 
                    dg_spawn_prio[#_idx1,_idx++] = _obj;             // 
                    dg_spawn_prio[#_idx1,_idx++] = _obj_name;        // 
                    dg_spawn_prio[#_idx1,_idx++] = _ver;             // 
                    //                                                  //
                    dg_spawn_prio[#_idx1,_idx++] = _spawn_xl;        // 
                    dg_spawn_prio[#_idx1,_idx++] = _spawn_xc;        // 
                    dg_spawn_prio[#_idx1,_idx++] = _spawn_yt;        // 
                    dg_spawn_prio[#_idx1,_idx++] = _spawn_yc;        // 
                    //                                                  //
                    dg_spawn_prio[#_idx1,_idx++] = _w;               // 
                    dg_spawn_prio[#_idx1,_idx++] = (_w>>1);              // 
                    dg_spawn_prio[#_idx1,_idx++] = _h;               // 
                    dg_spawn_prio[#_idx1,_idx++] = (_h>>1);              // 
                    //                                                  //
                    dg_spawn_prio[#_idx1,_idx++] = _respawn_type;    // 
                    dg_spawn_prio[#_idx1,_idx++] = val(f.dm_quests[?get_defeated_dk()+_spawn_datakey_a]);  // 
                    dg_spawn_prio[#_idx1,_idx++] = _spawn_permission;// 
                }
            }
        }//_i
    }
}
//*/




/*
var                                 _arg = 0;
var _SCENE_IS_RANDOMIZED = argument[_arg++];
var _SCENE_USED          = argument[_arg++];


var _SceneRando_DEBUG1 = false && val(f.dm_rando[?dk_SceneRando+STR_Scene+STR_Randomized+rm_name], rm_name) != rm_name;
var _i,_j,_k, _idx,_idx1;
var _val,_val1,_val2, _count, _len;
var _x,_y, _w,_w_, _h,_h_;
var _datakey0;
var _spawn_datakey,_spawn_datakey1,_spawn_datakey2;
var _obj, _ver, _obj_name;
var _spawn_xl,_spawn_xc, _spawn_yt,_spawn_yc;
var _defeated_count, _respawn_type;
var _spawn_permission  = 0;
var _spawn_permission1 = 0;
var _item_id   = undefined;
var _item_type = undefined;
var _objver1   = undefined;
var _objver2   = undefined;
var _objver3   = undefined;
var _PRXM_COUNT = val(dm_spawn[?get_spawn_datakey(_SCENE_USED,STR_PRXM,-1)]);
var _PRIO_COUNT = val(dm_spawn[?get_spawn_datakey(_SCENE_USED,STR_PRIO,-1)]);


ds_grid_clear( dg_spawn_prxm, 0);
ds_grid_resize(dg_spawn_prxm, 0,ds_grid_height(dg_spawn_prxm));

ds_grid_clear( dg_spawn_prio, 0);
ds_grid_resize(dg_spawn_prio, 0,ds_grid_height(dg_spawn_prio));

var _DATAKEY1 = STR_Randomize+STR_Enemy;
var _ENEMY_RANDO_METHOD     = val(global.dm_save_file_settings[?_DATAKEY1+STR_Method]);
var _ENEMY_RANDO_DIFFICULTY = val(global.dm_save_file_settings[?_DATAKEY1+STR_Difficulty],1);

             _count = max(_PRIO_COUNT,_PRXM_COUNT);
for(_i=0; _i<_count; _i++)
{
    for(_j=0; _j<=1; _j++) // 0: PRIO, 1: PRXM
    {
        switch(_j)
        {
            case 0:{
            if (_i>=_PRIO_COUNT) continue;//_j
            _spawn_datakey = get_spawn_datakey(_SCENE_USED,STR_PRIO,_i);
            break;}
            
            case 1:{
            if (_i>=_PRXM_COUNT) continue;//_j
            _spawn_datakey = get_spawn_datakey(_SCENE_USED,STR_PRXM,_i);
            break;}
        }
        
            _obj  = val(dm_spawn[?_spawn_datakey+STR_obj_idx]);
        if(!_obj)
        {
            continue;//_j
        }
        
        if (is_ancestor(_obj,Item) 
        &&  _SCENE_IS_RANDOMIZED )
        {
            continue;//_j
        }
        
        _obj_name = object_get_name(_obj);
        _ver      = val(dm_spawn[?_spawn_datakey+STR_Version]);
        _objver1  = _obj_name+hex_str(_ver);
        
        _w        = val(dm_go_prop[?_obj_name+STR_Width],  $10);
        _h        = val(dm_go_prop[?_obj_name+STR_Height], $10);
        _w_       = _w>>1;
        _h_       = _h>>1;
        
        _spawn_xl = val(dm_spawn[?_spawn_datakey+"_x"]); // spawn x
        _spawn_yt = val(dm_spawn[?_spawn_datakey+"_y"]); // spawn y
        _spawn_xc = _spawn_xl + _w_;
        _spawn_yc = _spawn_yt + _h_;
        
        _defeated_count = val(f.dm_quests[?get_defeated_dk()+_spawn_datakey]);
        
        // respawn_type: Value representing if and when GO can respawn.
        // 0: never, 1: off screen, 2: refresh area, 3: refresh rm, 4: 30 seconds (on or off screen)
            _respawn_type      = val(dm_go_prop[?_objver1+STR_Respawn]);
            _spawn_permission1 = val(dm_spawn[?_spawn_datakey+STR_Spawn_Permission]);
        if (_respawn_type==3 
        &&  _spawn_permission1!=-1 ) // -1 never spawn again
        {
            dm_spawn[?_spawn_datakey+STR_Spawn_Permission] = 1;
        }
        
        _spawn_permission = val(dm_spawn[?_spawn_datakey+STR_Spawn_Permission]);
        
        
        
        
        // --------------------------------------------------------------
        _item_id = val(g.dm_spawn[?_spawn_datakey+STR_Item+STR_ID+STR_Randomized]);
        if (is_string(_item_id))
        {
            _item_type = val(g.dm_spawn[?_item_id+STR_Item+STR_Type]);
            if (is_string(_item_type))
            {
                _obj = val(g.dm_ITEM[?_item_type+STR_Object]);
                _ver = val(g.dm_spawn[?_item_id+STR_Version], 1);
                _obj_name = object_get_name(_obj);
                _objver2  = _obj_name+hex_str(_ver);
                
                _val = val(dm_go_prop[?_obj_name+STR_Width],  $10);
                _w   = _val;
                _w_  = _w>>1;
                _spawn_xl = _spawn_xc - _w_;
                
                _val = val(dm_go_prop[?_obj_name+STR_Height], $10);
                _spawn_yt = (_spawn_yt+_h) - _val;
                _h   = _val;
                _h_  = _h>>1;
                _spawn_yc  = _spawn_yt + _h_;
            }
        }
        else
        {
            if (global.EnemyRando_enabled 
            &&  _ENEMY_RANDO_METHOD )
            {
                switch(_ENEMY_RANDO_METHOD){
                default:{_objver2 = f.dm_rando[?_DATAKEY1+STR_Spawn+_spawn_datakey+STR_OBJVER+STR_Randomized]; break;}
                case  2:{_objver2 = f.dm_rando[?_DATAKEY1+STR_Type +_objver1      +STR_OBJVER+STR_Randomized]; break;}
                }// _objver2 example: "Snaraa01". obj name + ver
                
                if(!is_undefined(_objver2))
                {
                    _len  = string_length(_objver2);
                    _val1 = string_copy(  _objver2,1,_len-2); // obj name
                    _val2 = g.dm_go_prop[?_val1+STR_Object+STR_Idx]; // obj
                    if(!is_undefined(_val2))
                    {
                        // *** Cutscene_CreateWaterfall_update() checks for any hard skin enemies and if PC can defeat them
                        if (_SCENE_USED!=val(g.dm_rm[?"NabooruQuest_RM_NAME"])  // All enemies must be defeated in this rm
                        || !isVal(_val2,GeldA,GlzmA,LeevA) )         // these enemies draw behind the wall so restrict them for now
                        {
                            if (cam_xl_range() 
                            || !isVal(_val2,SpMaA,SpWoA) ) // Spawner_Mau, Spawner_Wosu, all need camera scroll to work
                            {
                                _obj      = _val2;
                                _obj_name = _val1;
                                _ver      = string_copy(_objver2,_len-1,2);
                                _ver      = str_hex(_ver);
                                
                                _val = val(dm_go_prop[?_obj_name+STR_Width],  $10);
                                _w   = _val;
                                _w_  = _w>>1;
                                _spawn_xl = _spawn_xc - _w_;
                                
                                _val = val(dm_go_prop[?_obj_name+STR_Height], $10);
                                _spawn_yt = (_spawn_yt+_h) - _val;
                                _h   = _val;
                                _h_  = _h>>1;
                                _spawn_yc  = _spawn_yt + _h_;
                                if (_obj==TektA)
                                {   // Temporary fix bc Tektites are falling through bridges
                                    _spawn_yt -= $10;
                                    _spawn_yc  = _spawn_yt + _h_;
                                }
                                
                                
                                
                                dm_spawn[?_spawn_datakey+STR_Spawn_Permission] = _spawn_permission1;
                                
                                    _respawn_type = val(dm_go_prop[?_objver2+STR_Respawn]);
                                if (_respawn_type==3)   dm_spawn[?_spawn_datakey+STR_Spawn_Permission] = 1;
                                
                                _spawn_permission = val(dm_spawn[?_spawn_datakey+STR_Spawn_Permission]);
                            }
                        }
                    }
                }
            }
        }
        
        
        // --------------------------------------------------------------
        if (_j) // PRXM (proximity-to-view spawns)
        {
            _idx1 = ds_grid_width(dg_spawn_prxm);
            ds_grid_resize(dg_spawn_prxm, _idx1+1, ds_grid_height(dg_spawn_prxm));
                                 _idx=0;
            dg_spawn_prxm[#_idx1,_idx++] = _spawn_datakey;   // 
            dg_spawn_prxm[#_idx1,_idx++] = _obj;             // 
            dg_spawn_prxm[#_idx1,_idx++] = _obj_name;        // 
            dg_spawn_prxm[#_idx1,_idx++] = _ver;             // 
            //                                          //
            dg_spawn_prxm[#_idx1,_idx++] = _spawn_xl;        // 
            dg_spawn_prxm[#_idx1,_idx++] = _spawn_xc;        // 
            dg_spawn_prxm[#_idx1,_idx++] = _spawn_yt;        // 
            dg_spawn_prxm[#_idx1,_idx++] = _spawn_yc;        // 
            //                                          //
            dg_spawn_prxm[#_idx1,_idx++] = _w;               // 
            dg_spawn_prxm[#_idx1,_idx++] = _w_;              // 
            dg_spawn_prxm[#_idx1,_idx++] = _h;               // 
            dg_spawn_prxm[#_idx1,_idx++] = _h_;              // 
            //                                          //
            dg_spawn_prxm[#_idx1,_idx++] = _respawn_type;    // 
            dg_spawn_prxm[#_idx1,_idx++] = _defeated_count;  // 
            dg_spawn_prxm[#_idx1,_idx++] = _spawn_permission;// 
        }
        else // PRIO (priority spawns)
        {
            _idx1 = ds_grid_width(dg_spawn_prio);
            ds_grid_resize(dg_spawn_prio, _idx1+1, ds_grid_height(dg_spawn_prio));
                                 _idx=0;
            dg_spawn_prio[#_idx1,_idx++] = _spawn_datakey;   // 
            dg_spawn_prio[#_idx1,_idx++] = _obj;             // 
            dg_spawn_prio[#_idx1,_idx++] = _obj_name;        // 
            dg_spawn_prio[#_idx1,_idx++] = _ver;             // 
            //                                          //
            dg_spawn_prio[#_idx1,_idx++] = _spawn_xl;        // 
            dg_spawn_prio[#_idx1,_idx++] = _spawn_xc;        // 
            dg_spawn_prio[#_idx1,_idx++] = _spawn_yt;        // 
            dg_spawn_prio[#_idx1,_idx++] = _spawn_yc;        // 
            //                                          //
            dg_spawn_prio[#_idx1,_idx++] = _w;               // 
            dg_spawn_prio[#_idx1,_idx++] = _w_;              // 
            dg_spawn_prio[#_idx1,_idx++] = _h;               // 
            dg_spawn_prio[#_idx1,_idx++] = _h_;              // 
            //                                          //
            dg_spawn_prio[#_idx1,_idx++] = _respawn_type;    // 
            dg_spawn_prio[#_idx1,_idx++] = _defeated_count;  // 
            dg_spawn_prio[#_idx1,_idx++] = _spawn_permission;// 
            //show_debug_message(_spawn_datakey+", "+_obj_name+"-"+string(_ver)+", xl $"+hex_str(_spawn_xl)+" yt $"+hex_str(_spawn_yt)+", _w $"+hex_str(_w)+" _h $"+hex_str(_h)+", _respawn_type "+string(_respawn_type)+", _spawn_permission"+string(_spawn_permission));
            if (_SceneRando_DEBUG1 && is_ancestor(_obj,Item)) show_debug_message("SceneRando Item-A. _SCENE_USED '"+_SCENE_USED+"', rm_name '"+rm_name+"', _spawn_datakey '"+_spawn_datakey+"', _obj_name '"+_obj_name+"', ");
        }
    }
}




if (_SCENE_IS_RANDOMIZED)
{
    var _spawn_idx;
    var _condition_type1,_condition_type2, _path_name, _item_path_name, _scene_item_num;
    
    var           _ITEM_COUNT = val(dm_spawn[?rm_name+STR_Item+STR_Count]);
    for(_i=1; _i<=_ITEM_COUNT; _i++)
    {
        _spawn_datakey1 = dm_spawn[?rm_name+STR_Item+hex_str(_i)+dk_SpawnDatakey];
        if(!is_undefined(_spawn_datakey1))
        {
            _obj = dm_spawn[?_spawn_datakey1+STR_obj_idx];
            if(!is_undefined(_obj))
            {
                _spawn_idx = ds_grid_width(dg_spawn_prio);
                ds_grid_resize(dg_spawn_prio, _spawn_idx+1, ds_grid_height(dg_spawn_prio));
                
                _obj_name = object_get_name(_obj);
                _ver      = val(dm_spawn[?_spawn_datakey1+STR_Version]);
                _objver1  = _obj_name+hex_str(_ver);
                _w        = val(dm_go_prop[?_obj_name+STR_Width],  $10);
                _h        = val(dm_go_prop[?_obj_name+STR_Height], $10);
                _w_       = _w>>1;
                _h_       = _h>>1;
                _spawn_xl = 0;
                _spawn_yt = 0;
                
                _datakey0 = _SCENE_USED+"_Safe"+STR_Item+STR_Position;
                var           _POSITION_COUNT = val(global.dm_scene_rando[?_datakey0+STR_Count]);
                for(_j=1; _j<=_POSITION_COUNT; _j++)
                {
                    _x = val(global.dm_scene_rando[?_SCENE_USED+"_Safe"+STR_Item+STR_Position+hex_str(_j)+"_XC"]);
                    _y = val(global.dm_scene_rando[?_SCENE_USED+"_Safe"+STR_Item+STR_Position+hex_str(_j)+"_YC"]);
                    _spawn_xl = _x - _w_;
                    _spawn_yt = _y - _h_;
                    
                    // 2025/11/14. For now, I have omitted scenes with multiple items that have conditions because it's too complicated
                    _condition_type2 = global.dm_scene_rando[?_datakey0+hex_str(_j)+STR_Conditions+STR_Type];
                    _scene_item_num = val(g.dm_spawn[?_spawn_datakey1+rm_name+STR_Item+STR_Num]);
                    if(!is_undefined(_condition_type2) 
                    &&  _scene_item_num )
                    {
                        _item_path_name = STR_Item+hex_str(_scene_item_num);
                        _condition_type1 = g.dm_rm[?rm_name+_item_path_name+STR_Conditions+STR_Type];
                        if(!is_undefined(_condition_type1) 
                        &&  _condition_type1==_condition_type2 )
                        {   // TODO: What if there are multiple items and they end up in the same place?
                            //show_debug_message("g_Room_Start_1(). "+"_SCENE_USED '"+_SCENE_USED+"', rm_name '"+rm_name+"', _spawn_datakey1 '"+_spawn_datakey1+"', _obj_name '"+_obj_name+"',"+" _x="+string(_x)+" _y="+string(_y));
                            break;//_j
                        }
                    }
                }//_j
                
                
                
                
                _spawn_xc = _spawn_xl + _w_;
                _spawn_yc = _spawn_yt + _h_;
                if (_SceneRando_DEBUG1) show_debug_message("SceneRando Item-C. _SCENE_USED '"+_SCENE_USED+"', rm_name '"+rm_name+"', _spawn_datakey1 '"+_spawn_datakey1+"', _obj_name '"+_obj_name+"', ");
                
                _item_id = dm_spawn[?_spawn_datakey1+STR_Item+STR_ID+STR_Randomized];
                if(!is_undefined(_item_id))
                {
                    _item_type = dm_spawn[?_item_id+STR_Item+STR_Type];
                    if(!is_undefined(_item_type))
                    {
                        _obj = val(dm_ITEM[?_item_type+STR_Object]);
                        _ver = val(dm_spawn[?_item_id+STR_Version],1);
                        _obj_name = object_get_name(_obj);
                        _objver2  = _obj_name+hex_str(_ver);
                        
                        _val = val(dm_go_prop[?_obj_name+STR_Width],  $10);
                        _w   = _val;
                        _w_  = _w>>1;
                        _spawn_xl = _spawn_xc - _w_;
                        
                        _val = val(dm_go_prop[?_obj_name+STR_Height], $10);
                        _spawn_yt = (_spawn_yt+_h) - _val;
                        _h   = _val;
                        _h_  = _h>>1;
                        _spawn_yc  = _spawn_yt + _h_;
                        if (_SceneRando_DEBUG1) show_debug_message("SceneRando Item-D. _SCENE_USED '"+_SCENE_USED+"', rm_name '"+rm_name+"', _spawn_datakey1 '"+_spawn_datakey1+"', _obj_name '"+_obj_name+"', _item_id '"+_item_id+"', _item_type '"+_item_type+"'");
                    }
                }
                
                _defeated_count = val(f.dm_quests[?get_defeated_dk()+_spawn_datakey1]);
                
                // respawn_type: Value representing if and when GO can respawn.
                // 0: never, 1: off screen, 2: refresh area, 3: refresh rm, 4: 30 seconds (on or off screen)
                    _respawn_type      = val(dm_go_prop[?_objver1+STR_Respawn]);
                    _spawn_permission1 = val(dm_spawn[?_spawn_datakey1+STR_Spawn_Permission]);
                if (_respawn_type==3 
                &&  _spawn_permission1!=-1 ) // -1 never spawn again
                {   dm_spawn[?_spawn_datakey1+STR_Spawn_Permission] = 1;  }
                
                _spawn_permission = val(dm_spawn[?_spawn_datakey1+STR_Spawn_Permission]);
                
                                          _j=0;
                dg_spawn_prio[#_spawn_idx,_j++] = _spawn_datakey1;  // 
                dg_spawn_prio[#_spawn_idx,_j++] = _obj;             // 
                dg_spawn_prio[#_spawn_idx,_j++] = _obj_name;        // 
                dg_spawn_prio[#_spawn_idx,_j++] = _ver;             // 
                //                                                  //
                dg_spawn_prio[#_spawn_idx,_j++] = _spawn_xl;        // 
                dg_spawn_prio[#_spawn_idx,_j++] = _spawn_xc;        // 
                dg_spawn_prio[#_spawn_idx,_j++] = _spawn_yt;        // 
                dg_spawn_prio[#_spawn_idx,_j++] = _spawn_yc;        // 
                //                                                  //
                dg_spawn_prio[#_spawn_idx,_j++] = _w;               // 
                dg_spawn_prio[#_spawn_idx,_j++] = _w_;              // 
                dg_spawn_prio[#_spawn_idx,_j++] = _h;               // 
                dg_spawn_prio[#_spawn_idx,_j++] = _h_;              // 
                //                                                  //
                dg_spawn_prio[#_spawn_idx,_j++] = _respawn_type;    // 
                dg_spawn_prio[#_spawn_idx,_j++] = _defeated_count;  // 
                dg_spawn_prio[#_spawn_idx,_j++] = _spawn_permission;// 
            }
        }
    }//_i
}
*/
