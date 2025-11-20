/// g_Room_Start_1(scene is randomized, scene used)


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
var _dl_RandoEnemy_OBJVER1 = ds_list_create();
ds_list_copy(_dl_RandoEnemy_OBJVER1,g.dl_RandoEnemy_OBJVER1);

             _count = max(_PRIO_COUNT,_PRXM_COUNT);
for(_i=0; _i<_count; _i++)
{
    for(_j=0; _j<=1; _j++) // 0: PRIO, 1: PRXM
    {
        switch(_j)
        {
            case 0:{
            if (_i>=_PRIO_COUNT) continue;//_j
            _spawn_datakey1 = get_spawn_datakey(rm_name,    STR_PRIO,_i);
            _spawn_datakey2 = get_spawn_datakey(_SCENE_USED,STR_PRIO,_i);
            break;}
            
            case 1:{
            if (_i>=_PRXM_COUNT) continue;//_j
            _spawn_datakey1 = get_spawn_datakey(rm_name,    STR_PRXM,_i);
            _spawn_datakey2 = get_spawn_datakey(_SCENE_USED,STR_PRXM,_i);
            break;}
        }
        
            _obj  = val(dm_spawn[?_spawn_datakey2+STR_obj_idx]);
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
        _ver      = val(dm_spawn[?_spawn_datakey2+STR_Version]);
        _objver1  = _obj_name+hex_str(_ver);
        
        _w        = val(dm_go_prop[?_obj_name+STR_Width],  $10);
        _h        = val(dm_go_prop[?_obj_name+STR_Height], $10);
        _w_       = _w>>1;
        _h_       = _h>>1;
        
        _spawn_xl = val(dm_spawn[?_spawn_datakey2+"_x"]); // spawn x
        _spawn_yt = val(dm_spawn[?_spawn_datakey2+"_y"]); // spawn y
        _spawn_xc = _spawn_xl + _w_;
        _spawn_yc = _spawn_yt + _h_;
        
        _defeated_count = val(f.dm_quests[?get_defeated_dk()+_spawn_datakey2]);
        
        // respawn_type: Value representing if and when GO can respawn.
        // 0: never, 1: off screen, 2: refresh area, 3: refresh rm, 4: 30 seconds (on or off screen)
            _respawn_type      = val(dm_go_prop[?_objver1+STR_Respawn]);
            _spawn_permission1 = val(dm_spawn[?_spawn_datakey2+STR_Spawn_Permission]);
        if (_respawn_type==3 
        &&  _spawn_permission1!=-1 ) // -1 never spawn again
        {
            dm_spawn[?_spawn_datakey2+STR_Spawn_Permission] = 1;
        }
        
        _spawn_permission = val(dm_spawn[?_spawn_datakey2+STR_Spawn_Permission]);
        
        
        
        
        // --------------------------------------------------------------
        _item_id = val(g.dm_spawn[?_spawn_datakey2+STR_Item+STR_ID+STR_Randomized]);
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
            if ( Rando_enemy 
            &&  _ENEMY_RANDO_METHOD )
            {
                switch(_ENEMY_RANDO_METHOD){
                default:{_objver2 = f.dm_rando[?_DATAKEY1+STR_Spawn+_spawn_datakey2+STR_OBJVER+STR_Randomized]; break;}
                case  2:{_objver2 = f.dm_rando[?_DATAKEY1+STR_Type +_objver1      +STR_OBJVER+STR_Randomized]; break;}
                }// _objver2 example: "Snaraa01". obj name + ver
                
                if(!is_undefined(_objver2))
                {
                    /*
                    if (_SCENE_IS_RANDOMIZED 
                    &&  val(g.dm_RandoEnemy[?_objver2+STR_Difficulty],1)>_ENEMY_RANDO_DIFFICULTY )
                    {
                        _objver3 = f.dm_rando[?_DATAKEY1+STR_Spawn+_spawn_datakey2+STR_OBJVER+STR_Randomized+STR_Scene+STR_Rando];
                        if (is_undefined(_objver3))
                        {
                            ds_list_shuffle(_dl_RandoEnemy_OBJVER1);
                            for(_k=ds_list_size(_dl_RandoEnemy_OBJVER1)-1; _k>=0; _k--)
                            {
                                _objver3 = _dl_RandoEnemy_OBJVER1[|_k];
                                if (val(g.dm_RandoEnemy[?_objver3+STR_Difficulty],1)<=_ENEMY_RANDO_DIFFICULTY)
                                {
                                    _objver2 = _objver3;
                                    f.dm_rando[?_DATAKEY1+STR_Spawn+_spawn_datakey2+STR_OBJVER+STR_Randomized+STR_Scene+STR_Rando] = _objver2;
                                    break;//_k
                                }
                            }
                        }
                    }
                    */
                    
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
                                
                                
                                
                                dm_spawn[?_spawn_datakey2+STR_Spawn_Permission] = _spawn_permission1;
                                
                                    _respawn_type = val(dm_go_prop[?_objver2+STR_Respawn]);
                                if (_respawn_type==3)   dm_spawn[?_spawn_datakey2+STR_Spawn_Permission] = 1;
                                
                                _spawn_permission = val(dm_spawn[?_spawn_datakey2+STR_Spawn_Permission]);
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
            dg_spawn_prxm[#_idx1,_idx++] = _spawn_datakey2;   // 
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
            dg_spawn_prio[#_idx1,_idx++] = _spawn_datakey2;   // 
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
            //show_debug_message(_spawn_datakey2+", "+_obj_name+"-"+string(_ver)+", xl $"+hex_str(_spawn_xl)+" yt $"+hex_str(_spawn_yt)+", _w $"+hex_str(_w)+" _h $"+hex_str(_h)+", _respawn_type "+string(_respawn_type)+", _spawn_permission"+string(_spawn_permission));
            if (_SceneRando_DEBUG1 && is_ancestor(_obj,Item)) show_debug_message("SceneRando Item-A. _SCENE_USED '"+_SCENE_USED+"', rm_name '"+rm_name+"', _spawn_datakey2 '"+_spawn_datakey2+"', _obj_name '"+_obj_name+"', ");
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




ds_list_destroy(_dl_RandoEnemy_OBJVER1); _dl_RandoEnemy_OBJVER1=undefined;








/*
ds_grid_clear( dg_spawn_prxm, 0);
ds_grid_resize(dg_spawn_prxm, _PRXM_COUNT, ds_grid_height(dg_spawn_prxm));

ds_grid_clear( dg_spawn_prio, 0);
ds_grid_resize(dg_spawn_prio, _PRIO_COUNT, ds_grid_height(dg_spawn_prio));

var _DATAKEY1     = STR_Randomize+STR_Enemy;
var _ENEMY_RANDO_METHOD = val(global.dm_save_file_settings[?_DATAKEY1+STR_Method]);

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
        if(!_obj) continue;//_j
        
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
            if (_SCENE_IS_RANDOMIZED) continue;//_j
            
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
            if ( Rando_enemy 
            &&  _ENEMY_RANDO_METHOD )
            {
                switch(_ENEMY_RANDO_METHOD){
                default:{_objver2 = f.dm_rando[?_DATAKEY1+STR_Spawn+_spawn_datakey+STR_OBJVER+STR_Randomized]; break;}
                case  2:{_objver2 = f.dm_rando[?_DATAKEY1+STR_Type +_objver1      +STR_OBJVER+STR_Randomized]; break;}
                }
                
                if(!is_undefined(_objver2))
                {   // _objver2 example: "Snaraa01". obj name + ver
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
            _idx1 = _i;
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
            _idx1 = _i;
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
    var _spawn_idx = -1;
    var _is_replacing_item = false;
    
    var           _ITEM_COUNT = val(dm_spawn[?rm_name+STR_Item+STR_Count]);
    for(_i=1; _i<=_ITEM_COUNT; _i++)
    {
        _is_replacing_item = false;
        _spawn_datakey1 = dm_spawn[?rm_name    +STR_Item+hex_str(_i)+dk_SpawnDatakey];
        _spawn_datakey2 = dm_spawn[?_SCENE_USED+STR_Item+hex_str(_i)+dk_SpawnDatakey];
        if(!is_undefined(_spawn_datakey1))
        {
            _spawn_idx = -1;
            if(!is_undefined(_spawn_datakey2))
            {   // `_SCENE_USED` also has an item
                _is_replacing_item = true;
                for(_j=0; _j<_PRIO_COUNT; _j++)
                {
                    if (_spawn_datakey2==dg_spawn_prio[#_j,0])
                    {
                        _spawn_idx = _j;
                        break;//_j
                    }
                }//_j
            }
            else
            {   // `_SCENE_USED` does not have an item, so a safe position needs to be found to place the item.
                _spawn_idx = ds_grid_width(dg_spawn_prio);
            }
            
            if (_spawn_idx!=-1)
            {
                _obj = dm_spawn[?_spawn_datakey1+STR_obj_idx];
                if(!is_undefined(_obj))
                {
                    if(!_is_replacing_item) ds_grid_resize(dg_spawn_prio, ds_grid_width(dg_spawn_prio)+1, ds_grid_height(dg_spawn_prio));
                    
                    _obj_name = object_get_name(_obj);
                    _ver      = val(dm_spawn[?_spawn_datakey1+STR_Version]);
                    _objver1  = _obj_name+hex_str(_ver);
                    _w        = val(dm_go_prop[?_obj_name+STR_Width],  $10);
                    _h        = val(dm_go_prop[?_obj_name+STR_Height], $10);
                    _w_       = _w>>1;
                    _h_       = _h>>1;
                    _spawn_xl = 0;
                    _spawn_yt = 0;
                    
                    if (_is_replacing_item)
                    {
                        _spawn_xl = dg_spawn_prio[#_spawn_idx,4]; // spawn x
                        _spawn_yt = dg_spawn_prio[#_spawn_idx,6]; // spawn y
                    }
                    else
                    {   // This scene does not have an item, so a safe position needs to be found to place the item.
                        var _condition_type1,_condition_type2, _path_name, _item_path_name, _scene_item_num;
                        _datakey0 = _SCENE_USED+"_Safe"+STR_Item+STR_Position;
                        var           _POSITION_COUNT = val(global.dm_scene_rando[?_datakey0+STR_Count]);
                        for(_j=1; _j<=_POSITION_COUNT; _j++)
                        {
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
                                    _x = val(global.dm_scene_rando[?_SCENE_USED+"_Safe"+STR_Item+STR_Position+hex_str(_j)+"_XC"]);
                                    _y = val(global.dm_scene_rando[?_SCENE_USED+"_Safe"+STR_Item+STR_Position+hex_str(_j)+"_YC"]);
                                    _spawn_xl = _x - _w_;
                                    _spawn_yt = _y - _h_;
                                    break;//_j
                                }
                            }
                        }//_j
                    }
                    
                    
                    
                    
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
        }
    }//_i
}
*/




