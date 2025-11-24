/// g_Room_Start_1a(encoded grid, spawn datakey, scene is randomized)


var                                 _arg=0;
var _dg_encoded          = argument[_arg++];
var _SPAWN_DATAKEY       = argument[_arg++];
var _SCENE_IS_RANDOMIZED = argument[_arg++];


var _obj = val(dm_spawn[?_SPAWN_DATAKEY+STR_obj_idx]);
if(!_obj)
{
    return _dg_encoded;
}


var _idx,_idx1, _val,_val1,_val2, _len;
var _w,_w_, _h,_h_;
var _ver, _obj_name;
var _spawn_xl,_spawn_xc, _spawn_yt,_spawn_yc;
var _defeated_count, _respawn_type;
var _spawn_permission  = 0;
var _spawn_permission1 = 0;
var _item_id   = undefined;
var _item_type = undefined;
var _objver1   = undefined;
var _objver2   = undefined;


var _dg = ds_grid_create(0,0);
ds_grid_read(_dg, _dg_encoded);


_obj_name = object_get_name(_obj);
_ver      = val(dm_spawn[?_SPAWN_DATAKEY+STR_Version]);
_objver1  = _obj_name+hex_str(_ver);

_w        = val(dm_go_prop[?_obj_name+STR_Width], $10);
_h        = val(dm_go_prop[?_obj_name+STR_Height],$10);
_w_       = _w>>1;
_h_       = _h>>1;

_spawn_xl = val(dm_spawn[?_SPAWN_DATAKEY+"_x"]); // spawn XL
_spawn_yt = val(dm_spawn[?_SPAWN_DATAKEY+"_y"]); // spawn YT
_spawn_xc = _spawn_xl + _w_;
_spawn_yc = _spawn_yt + _h_;

_defeated_count = val(f.dm_quests[?get_defeated_dk()+_SPAWN_DATAKEY]);

// respawn_type: Value representing if and when GO can respawn.
// 0: never, 1: off screen, 2: refresh area, 3: refresh rm, 4: 30 seconds (on or off screen)
    _respawn_type      = val(dm_go_prop[?_objver1+STR_Respawn]);
    _spawn_permission1 = val(dm_spawn[?_SPAWN_DATAKEY+STR_Spawn_Permission]);
if (_respawn_type==3 
&&  _spawn_permission1!=-1 ) // -1 never spawn again
{
    dm_spawn[?_SPAWN_DATAKEY+STR_Spawn_Permission] = 1;
}

_spawn_permission = val(dm_spawn[?_SPAWN_DATAKEY+STR_Spawn_Permission]);




// --------------------------------------------------------------
if(!_SCENE_IS_RANDOMIZED)
{
    _item_id = val(dm_spawn[?_SPAWN_DATAKEY+STR_Item+STR_ID+STR_Randomized]);
    if (is_string(_item_id))
    {
        _item_type = val(dm_spawn[?_item_id+STR_Item+STR_Type]);
        if (is_string(_item_type))
        {
            _obj = val(dm_ITEM[?_item_type+STR_Object]);
            _ver = val(dm_spawn[?_item_id+STR_Version], 1);
            _obj_name = object_get_name(_obj);
            _objver2  = _obj_name+hex_str(_ver);
            
            _val = val(dm_go_prop[?_obj_name+STR_Width], $10);
            _w   = _val;
            _w_  = _w>>1;
            _spawn_xl = _spawn_xc - _w_;
            
            _val = val(dm_go_prop[?_obj_name+STR_Height],$10);
            _spawn_yt = (_spawn_yt+_h) - _val;
            _h   = _val;
            _h_  = _h>>1;
            _spawn_yc  = _spawn_yt + _h_;
        }
    }
    else
    {
        if (global.EnemyRando_enabled 
        &&  val(global.dm_save_file_settings[?STR_Randomize+STR_Enemy+STR_Method]) )
        {
            switch(val(global.dm_save_file_settings[?STR_Randomize+STR_Enemy+STR_Method])){
            default:{_objver2 = f.dm_rando[?STR_Randomize+STR_Enemy+STR_Spawn+_SPAWN_DATAKEY+STR_OBJVER+STR_Randomized]; break;}
            case  2:{_objver2 = f.dm_rando[?STR_Randomize+STR_Enemy+STR_Type +_objver1      +STR_OBJVER+STR_Randomized]; break;}
            }// _objver2 example: "Snaraa01". obj name + ver
            
            if(!is_undefined(_objver2))
            {
                _len  = string_length(_objver2);
                _val1 = string_copy(  _objver2,1,_len-2); // obj name
                _val2 = dm_go_prop[?_val1+STR_Object+STR_Idx]; // obj
                if(!is_undefined(_val2))
                {
                    if (global.SceneRando_enabled) var _SCENE_USED = val(f.dm_rando[?dk_SceneRando+STR_Scene+STR_Randomized+rm_name], rm_name);
                    else                           var _SCENE_USED = rm_name;
                    
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
                            
                            _val = val(dm_go_prop[?_obj_name+STR_Width], $10);
                            _w   = _val;
                            _w_  = _w>>1;
                            _spawn_xl = _spawn_xc - _w_;
                            
                            _val = val(dm_go_prop[?_obj_name+STR_Height],$10);
                            _spawn_yt = (_spawn_yt+_h) - _val;
                            _h   = _val;
                            _h_  = _h>>1;
                            _spawn_yc  = _spawn_yt + _h_;
                            if (_obj==TektA)
                            {   // Temporary fix bc Tektites are falling through bridges
                                _spawn_yt -= $10;
                                _spawn_yc  = _spawn_yt + _h_;
                            }
                            
                            
                            
                            dm_spawn[?_SPAWN_DATAKEY+STR_Spawn_Permission] = _spawn_permission1;
                            
                                _respawn_type = val(dm_go_prop[?_objver2+STR_Respawn]);
                            if (_respawn_type==3)   dm_spawn[?_SPAWN_DATAKEY+STR_Spawn_Permission] = 1;
                            
                            _spawn_permission = val(dm_spawn[?_SPAWN_DATAKEY+STR_Spawn_Permission]);
                        }
                    }
                }
            }
        }
    }
}


// --------------------------------------------------------------
_idx1 = ds_grid_width(_dg);
ds_grid_resize(_dg, _idx1+1, ds_grid_height(_dg));
           _idx=0;
_dg[#_idx1,_idx++] = _SPAWN_DATAKEY;   // 
_dg[#_idx1,_idx++] = _obj;             // 
_dg[#_idx1,_idx++] = _obj_name;        // 
_dg[#_idx1,_idx++] = _ver;             // 
//                                          //
_dg[#_idx1,_idx++] = _spawn_xl;        // 
_dg[#_idx1,_idx++] = _spawn_xc;        // 
_dg[#_idx1,_idx++] = _spawn_yt;        // 
_dg[#_idx1,_idx++] = _spawn_yc;        // 
//                                          //
_dg[#_idx1,_idx++] = _w;               // 
_dg[#_idx1,_idx++] = _w_;              // 
_dg[#_idx1,_idx++] = _h;               // 
_dg[#_idx1,_idx++] = _h_;              // 
//                                          //
_dg[#_idx1,_idx++] = _respawn_type;    // 
_dg[#_idx1,_idx++] = _defeated_count;  // 
_dg[#_idx1,_idx++] = _spawn_permission;// 
//show_debug_message(_SPAWN_DATAKEY+", "+_obj_name+"-"+string(_ver)+", xl $"+hex_str(_spawn_xl)+" yt $"+hex_str(_spawn_yt)+", _w $"+hex_str(_w)+" _h $"+hex_str(_h)+", _respawn_type "+string(_respawn_type)+", _spawn_permission"+string(_spawn_permission));




_dg_encoded = ds_grid_write(_dg);
ds_grid_destroy(_dg); _dg=undefined;


return _dg_encoded;




