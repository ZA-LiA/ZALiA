/// g_Room_Start_2(scene is randomized, scene used)

// SCENE BRIGHTNESS ----------------------------------------


var                                 _arg = 0;
var _SCENE_IS_RANDOMIZED = argument[_arg++];
var _SCENE_USED          = argument[_arg++];


var _i,_j, _idx0,_idx1, _val,_val1,_val2, _count1,_count2;
var _spawn_count, _spawn_datakey, _obj, _obj_name, _ver, _objver1, _defeated_count, _respawn_type, _spawn_permission;
var _xl,_yt, _spawn_xl,_spawn_yt, _w,_h, _w_,_h_;
var _RESPAWN_TYPE = 3; // 0: never, 1: off screen, 2: refresh area, 3: refresh rm, 4: 30 seconds (on or off screen)
var _EXIT_NAME1 = _SCENE_USED+strR(f.reen,RmName_LEN+1);
var _GRID_H = ds_grid_height(dg_spawn_prio);
var _DIST1 = $6<<3;
var _DIST2 = $1C;
var _DIST3 = $20;


set_rm_brightness(0);

if (mod_RM_BRIGHTNESS_SYS)
{
    if (mod_RM_BRIGHTNESS_SYS==2 
    &&  f.items&ITM_CAND )
    {
        set_rm_brightness(rm_brightness+1);
    }
    
    
    if (is_undefined(dm_rm[?rm_name+dk_DarkRoom]) 
    ||  dm_rm[?rm_name+dk_DarkRoom]==-1 )
    {
        set_rm_brightness(RM_BRIGHTNESS_MAX);
    }
    
    
    if (rm_brightness<RM_BRIGHTNESS_MAX)
    {
        if(!_SCENE_IS_RANDOMIZED)
        {
                   _spawn_count = ds_grid_width(dg_spawn_prio);
            for(_i=_spawn_count-1; _i>=0; _i--)
            {
                _spawn_datakey    = dg_spawn_prio[#_i,$0];
                _obj              = dg_spawn_prio[#_i,$1];
                _obj_name         = dg_spawn_prio[#_i,$2];
                _ver              = dg_spawn_prio[#_i,$3];
                _spawn_permission = dg_spawn_prio[#_i,$E];
                //if (is_ancestor(_obj,Torch)) show_debug_message(_spawn_datakey+", _spawn_permission "+string(_spawn_permission)+":"+string(dm_spawn[?_spawn_datakey+STR_Spawn_Permission]));
                if (is_undefined(_spawn_datakey) 
                || !_spawn_permission )
                {
                    continue;//_i
                }
                
                // ------------------------------------------------
                _val = dm_spawn[?_spawn_datakey+STR_Qualified+STR_Quest+STR_Nums];
                if (is_undefined(_val)  // This inst is qualified for any quest if there's no data ???
                || !is_string(   _val)  // Should this be: (!is_string(_val) && _val==f.quest_num) ??
                ||  string_pos(hex_str(f.quest_num),_val) )
                {
                    _objver1 = _obj_name + hex_str(_ver);
                    _val1 = val(dm_go_prop[?_objver1+STR_Brightness]); // brightness specific to this object
                    _val2 = dm_spawn[?_spawn_datakey+STR_Brightness];  // brightness specific to this spawn location
                    _val  = val(_val2,_val1); // if _val2 is undefined, use _val1
                    if (_val)
                    {
                        if(!is_ancestor(_obj,Torch) 
                        ||  val(dm_spawn[?_spawn_datakey+STR_Lit]) ) // Torch spawn locations must specify if they're already lit
                        {
                            set_rm_brightness(rm_brightness+_val);
                            
                            // TODO: More things need to be checked first? This instance may not spawn due to various reasons like respawn limits.
                            if (rm_brightness>=RM_BRIGHTNESS_MAX)
                            {
                                break;//_i
                            }
                        }
                    }
                }
            }//_i
        }
        else // Randomized scene -----------------------------------------------------
        {
            // Rebuild `dg_spawn_prio` with torches from `rm_name` instead of `_SCENE_USED`
            var _dg_spawn = ds_grid_create(0,_GRID_H);
            var _unlit_torch_count = 0;
            _count2 = 0;
            
                         _spawn_count = val(dm_spawn[?get_spawn_datakey(rm_name,STR_PRIO,-1)]);
            for(_i=0; _i<_spawn_count; _i++)
            {
                _spawn_datakey = get_spawn_datakey(rm_name,STR_PRIO,_i);
                _obj = dm_spawn[?_spawn_datakey+STR_obj_idx];
                if(!is_undefined(_obj) 
                &&  is_ancestor(_obj,Torch) )
                {
                    _obj_name = object_get_name(_obj);
                    _ver      = val(dm_spawn[?_spawn_datakey+STR_Version],1);
                    _objver1  = _obj_name+hex_str(_ver);
                    
                    _w        = val(dm_go_prop[?_obj_name+STR_Width],  $08);
                    _h        = val(dm_go_prop[?_obj_name+STR_Height], $10);
                    _w_       = _w>>1;
                    _h_       = _h>>1;
                    
                    _spawn_xl = val(dm_spawn[?_spawn_datakey+"_x"]); // spawn x
                    _spawn_xl = clamp(_spawn_xl, _DIST1, rm_w-_DIST1-_w);
                    
                    _spawn_yt = val(dm_spawn[?_spawn_datakey+"_y"]); // spawn y
                    _spawn_yt = clamp(_spawn_yt, $2<<3, rm_h-($6<<3)-_h);
                    
                    // Trying to set it close to where global.pc spawns
                    _spawn_xl = val(dm_rm[?_EXIT_NAME1+STR_Spawn_x]) <<3;
                    _spawn_yt = val(dm_rm[?_EXIT_NAME1+STR_Spawn_y]) <<3;
                    switch(exit_enter.side){
                    case $0:{_spawn_xl-=$0C   +(_DIST2*_count2); _spawn_yt+=$08; break;}
                    case $1:{_spawn_xl-=_DIST1+(_DIST2*_count2); _spawn_yt+=$08; break;}
                    case $2:{_spawn_xl+=_DIST1+(_DIST2*_count2); _spawn_yt+=$08; break;}
                    case $4:{_spawn_xl+=$04;                     _spawn_yt-=_DIST3*_count2; break;}
                    case $8:{_spawn_xl+=$04;                     _spawn_yt+=_DIST3*_count2; break;}
                    }
                    _count2++;
                    
                    
                    _defeated_count = val(f.dm_quests[?get_defeated_dk()+_spawn_datakey]);
                    
                    // respawn_type: Value representing if and when GO can respawn.
                    // 0: never, 1: off screen, 2: refresh area, 3: refresh rm, 4: 30 seconds (on or off screen)
                        _respawn_type     = val(dm_go_prop[?_objver1+STR_Respawn]);
                        _spawn_permission = val(dm_spawn[?_spawn_datakey+STR_Spawn_Permission]);
                    if (_respawn_type==3 
                    &&  _spawn_permission!=-1 ) // -1 never spawn again
                    {
                        dm_spawn[?_spawn_datakey+STR_Spawn_Permission] = 1;
                    }
                    
                    _spawn_permission = val(dm_spawn[?_spawn_datakey+STR_Spawn_Permission]);
                    
                    
                    if (val(dm_spawn[?_spawn_datakey+STR_Lit])  // if the torch is lit upon spawn
                    ||  _unlit_torch_count<RM_BRIGHTNESS_MAX-rm_brightness )
                    {
                        
                        _idx0 = ds_grid_width(_dg_spawn);
                        ds_grid_resize(_dg_spawn, _idx0+1,_GRID_H);
                                           _idx1=-1;
                        _dg_spawn[#_idx0,++_idx1] = _spawn_datakey;    // 
                        _dg_spawn[#_idx0,++_idx1] = _obj;              // 
                        _dg_spawn[#_idx0,++_idx1] = _obj_name;         // 
                        _dg_spawn[#_idx0,++_idx1] = _ver;              // 
                        //                                              //
                        _dg_spawn[#_idx0,++_idx1] = _spawn_xl;         // 
                        _dg_spawn[#_idx0,++_idx1] = _spawn_xl + _w_;   // 
                        _dg_spawn[#_idx0,++_idx1] = _spawn_yt;         // 
                        _dg_spawn[#_idx0,++_idx1] = _spawn_yt + _h_;   // 
                        //                                              //
                        _dg_spawn[#_idx0,++_idx1] = _w;                // 
                        _dg_spawn[#_idx0,++_idx1] = _w_;               // 
                        _dg_spawn[#_idx0,++_idx1] = _h;                // 
                        _dg_spawn[#_idx0,++_idx1] = _h_;               // 
                        //                                              //
                        _dg_spawn[#_idx0,++_idx1] = _respawn_type;     // 
                        _dg_spawn[#_idx0,++_idx1] = _defeated_count;   // 
                        _dg_spawn[#_idx0,++_idx1] = _spawn_permission; // 
                        
                        if (val(dm_spawn[?_spawn_datakey+STR_Lit])) set_rm_brightness(rm_brightness+1);
                        else                                        _unlit_torch_count++;
                    }
                    
                    if (rm_brightness>=RM_BRIGHTNESS_MAX)
                    {
                        break;//_i
                    }
                }
            }//_i
            
                         _spawn_count = ds_grid_width(dg_spawn_prio);
            for(_i=0; _i<_spawn_count; _i++)
            {
                _obj = dg_spawn_prio[#_i,$1];
                if(!is_ancestor(_obj,Torch))
                {
                    _idx0 = ds_grid_width(_dg_spawn);
                    ds_grid_resize(_dg_spawn, _idx0+1,_GRID_H);
                    for(_j=0; _j<_GRID_H; _j++) _dg_spawn[#_idx0,_j] = dg_spawn_prio[#_i,_j];
                }
            }//_i
            
            ds_grid_copy(dg_spawn_prio, _dg_spawn);
            ds_grid_destroy(_dg_spawn); _dg_spawn=undefined;
        }
    }
}
else
{   // OG ---------------------
    if (dungeon_num 
    ||  f.items&ITM_CAND )
    {
        set_rm_brightness(RM_BRIGHTNESS_MAX); // fully lit
    }
}




if(!rm_brightness)
{
    // The following scenes are special because ZALiA considers them traversable without light
    if (rm_name==Area_WestA+"07"  // Cave connecting Rauru Forest and Parapa Desert
    ||  rm_name==Area_WestA+"2D"  // Cave south of North Castle with 1st magic container
    ||  rm_name==Area_EastA+"08"  // Cave connecting Nabooru and Darunia Forest
    ||  rm_name==Area_PalcA+"03"  // Parapa Palace 1st key
    ||  rm_name==Area_PalcA+"07"  // Parapa Palace Path to key for CANDLE
    ||  rm_name==Area_PalcA+"08"  // Parapa Palace CANDLE scene
    ||  rm_name==Area_PalcA+"0A" )// Parapa Palace Path to CANDLE
    {
        if (_SCENE_IS_RANDOMIZED 
        ||  (global.EnemyRando_enabled && val(global.dm_save_file_settings[?STR_Randomize+STR_Enemy+STR_Method])) )
        {
                         _spawn_count = ds_grid_width(dg_spawn_prio);
            for(_i=0; _i<_spawn_count; _i++)
            {
                _spawn_datakey = dg_spawn_prio[#_i,$0];
                _obj           = dg_spawn_prio[#_i,$1];
                if (is_ancestor(_obj,Torch) 
                && !val(dm_spawn[?_spawn_datakey+STR_Lit]) ) // Torch spawn locations must specify if they're already lit
                {
                    dm_spawn[?_spawn_datakey+STR_Lit] = true;
                    dg_spawn_prio[#_i,$E] = 1; // spawn permission
                    set_rm_brightness(rm_brightness+1);
                    if (rm_brightness>=RM_BRIGHTNESS_MAX)
                    {
                        break;//_i
                    }
                }
            }
            
            
            if(!rm_brightness)
            {
                _obj = TorchA;
                _obj_name = object_get_name(_obj);
                _ver = 1;
                _w  = val(dm_go_prop[?_obj_name+STR_Width],  $08);
                _h  = val(dm_go_prop[?_obj_name+STR_Height], $10);
                _w_ = _w>>1;
                _h_ = _h>>1;
                
                _count2 = 0;
                _spawn_count = val(dm_spawn[?get_spawn_datakey(rm_name,STR_PRIO,-1)]);
                             _count1 = RM_BRIGHTNESS_MAX - rm_brightness;
                for(_i=0; _i<_count1; _i++)
                {
                    _idx0 = ds_grid_width(dg_spawn_prio);
                    ds_grid_resize(dg_spawn_prio, _idx0+1,_GRID_H);
                    
                    _spawn_datakey = rm_name+STR_PRIO+hex_str(_spawn_count+_i);
                    dm_spawn[?_spawn_datakey+STR_Spawn_Permission] = 1;
                    dm_spawn[?_spawn_datakey+STR_Lit] = true;
                    
                    // Trying to set it close to where global.pc spawns
                    _spawn_xl = val(dm_rm[?_EXIT_NAME1+STR_Spawn_x]) <<3;
                    _spawn_yt = val(dm_rm[?_EXIT_NAME1+STR_Spawn_y]) <<3;
                    switch(exit_enter.side){
                    case $0:{_spawn_xl-=$0C   +(_DIST2*_count2); _spawn_yt+=$08; break;}
                    case $1:{_spawn_xl-=_DIST1+(_DIST2*_count2); _spawn_yt+=$08; break;}
                    case $2:{_spawn_xl+=_DIST1+(_DIST2*_count2); _spawn_yt+=$08; break;}
                    case $4:{_spawn_xl+=$04;                     _spawn_yt-=_DIST3*_count2; break;}
                    case $8:{_spawn_xl+=$04;                     _spawn_yt+=_DIST3*_count2; break;}
                    }
                    _count2++;
                    
                                           _idx1=-1;
                    dg_spawn_prio[#_idx0,++_idx1] = _spawn_datakey;  // 
                    dg_spawn_prio[#_idx0,++_idx1] = _obj;            // 
                    dg_spawn_prio[#_idx0,++_idx1] = _obj_name;       // 
                    dg_spawn_prio[#_idx0,++_idx1] = _ver;            // 
                    //                                                  //
                    dg_spawn_prio[#_idx0,++_idx1] = _spawn_xl;       // 
                    dg_spawn_prio[#_idx0,++_idx1] = _spawn_xl + _w_; // 
                    dg_spawn_prio[#_idx0,++_idx1] = _spawn_yt;       // 
                    dg_spawn_prio[#_idx0,++_idx1] = _spawn_yt + _h_; // 
                    //                                                  //
                    dg_spawn_prio[#_idx0,++_idx1] = _w;              // 
                    dg_spawn_prio[#_idx0,++_idx1] = _w_;             // 
                    dg_spawn_prio[#_idx0,++_idx1] = _h;              // 
                    dg_spawn_prio[#_idx0,++_idx1] = _h_;             // 
                    //                                                  //
                    dg_spawn_prio[#_idx0,++_idx1] = _RESPAWN_TYPE; // respawn type
                    dg_spawn_prio[#_idx0,++_idx1] = 0; // defeated count
                    dg_spawn_prio[#_idx0,++_idx1] = 1; // spawn permission
                }
            }
        }
    }
}




// Make sure there are at least torches to light if this is a randomized scene
if(!rm_brightness 
&&  _SCENE_IS_RANDOMIZED )
{
    var _scene_has_torches = false;
                 _spawn_count = ds_grid_width(dg_spawn_prio);
    for(_i=0; _i<_spawn_count; _i++)
    {
        if (is_ancestor(dg_spawn_prio[#_i,$1],Torch))
        {
            _scene_has_torches = true;
            break;//_i
        }
    }
    
    if(!_scene_has_torches)
    {
        _obj = TorchA;
        _obj_name = object_get_name(_obj);
        _ver = 1;
        _w  = val(dm_go_prop[?_obj_name+STR_Width],  $08);
        _h  = val(dm_go_prop[?_obj_name+STR_Height], $10);
        _w_ = _w>>1;
        _h_ = _h>>1;
        
        _count2 = 0;
        _spawn_count = val(dm_spawn[?get_spawn_datakey(rm_name,STR_PRIO,-1)]);
                     _count1 = RM_BRIGHTNESS_MAX - rm_brightness;
        for(_i=0; _i<_count1; _i++)
        {
            _idx0 = ds_grid_width(dg_spawn_prio);
            ds_grid_resize(dg_spawn_prio, _idx0+1,_GRID_H);
            
            _spawn_datakey = rm_name+STR_PRIO+hex_str(_spawn_count+_i);
            dm_spawn[?_spawn_datakey+STR_Spawn_Permission] = 1;
            
            // Trying to set it close to where global.pc spawns
            _spawn_xl = val(dm_rm[?_EXIT_NAME1+STR_Spawn_x]) <<3;
            _spawn_yt = val(dm_rm[?_EXIT_NAME1+STR_Spawn_y]) <<3;
            switch(exit_enter.side){
            case $0:{_spawn_xl-=$0C   +(_DIST2*_count2); _spawn_yt+=$08; break;}
            case $1:{_spawn_xl-=_DIST1+(_DIST2*_count2); _spawn_yt+=$08; break;}
            case $2:{_spawn_xl+=_DIST1+(_DIST2*_count2); _spawn_yt+=$08; break;}
            case $4:{_spawn_xl+=$04;                     _spawn_yt-=_DIST3*_count2; break;}
            case $8:{_spawn_xl+=$04;                     _spawn_yt+=_DIST3*_count2; break;}
            }
            _count2++;
            
                                   _idx1=-1;
            dg_spawn_prio[#_idx0,++_idx1] = _spawn_datakey;  // 
            dg_spawn_prio[#_idx0,++_idx1] = _obj;            // 
            dg_spawn_prio[#_idx0,++_idx1] = _obj_name;       // 
            dg_spawn_prio[#_idx0,++_idx1] = _ver;            // 
            //                                                  //
            dg_spawn_prio[#_idx0,++_idx1] = _spawn_xl;       // 
            dg_spawn_prio[#_idx0,++_idx1] = _spawn_xl + _w_; // 
            dg_spawn_prio[#_idx0,++_idx1] = _spawn_yt;       // 
            dg_spawn_prio[#_idx0,++_idx1] = _spawn_yt + _h_; // 
            //                                                  //
            dg_spawn_prio[#_idx0,++_idx1] = _w;              // 
            dg_spawn_prio[#_idx0,++_idx1] = _w_;             // 
            dg_spawn_prio[#_idx0,++_idx1] = _h;              // 
            dg_spawn_prio[#_idx0,++_idx1] = _h_;             // 
            //                                                  //
            dg_spawn_prio[#_idx0,++_idx1] = _RESPAWN_TYPE; // respawn type
            dg_spawn_prio[#_idx0,++_idx1] = 0; // defeated count
            dg_spawn_prio[#_idx0,++_idx1] = 1; // spawn permission
            //show_debug_message("g_Room_Start_2(). "+"Spawn added: "+_obj_name+", "+_spawn_datakey+", _spawn_xl=$"+hex_str(_spawn_xl)+" _spawn_yt=$"+hex_str(_spawn_yt));
        }
    }
}




/*
var                                 _arg = 0;
var _SCENE_IS_RANDOMIZED = argument[_arg++];
var _SCENE_USED          = argument[_arg++];


var _i, _idx, _val,_val1,_val2;


set_rm_brightness(0);

if (mod_RM_BRIGHTNESS_SYS)
{
    if (mod_RM_BRIGHTNESS_SYS==2 
    &&  f.items&ITM_CAND )
    {   set_rm_brightness(rm_brightness+1);  }
    
    
    _val = dm_rm[?rm_name+dk_DarkRoom];
    if (is_undefined(_val) 
    ||  _val==-1 )
    {
        set_rm_brightness(RM_BRIGHTNESS_MAX);
    }
    
    
    if (rm_brightness<RM_BRIGHTNESS_MAX)
    {
        var _spawn_datakey, _obj, _obj_name, _ver, _objver1, _spawn_permission, _exit_name;
        var _xl,_yt;
        var _used_scene_has_torches = false;
        
        var    _PRIO_COUNT = val(g.dm_spawn[?get_spawn_datakey(_SCENE_USED,STR_PRIO,-1)]);
        for(_i=_PRIO_COUNT-1; _i>=0; _i--)
        {
            _spawn_datakey    = dg_spawn_prio[#_i,$0];
            _obj              = dg_spawn_prio[#_i,$1];
            _obj_name         = dg_spawn_prio[#_i,$2];
            _ver              = dg_spawn_prio[#_i,$3];
            _spawn_permission = dg_spawn_prio[#_i,$E];
            //if (is_ancestor(_obj,Torch)) show_debug_message(_spawn_datakey+", _spawn_permission "+string(_spawn_permission)+":"+string(dm_spawn[?_spawn_datakey+STR_Spawn_Permission]));
            if (is_undefined(_spawn_datakey) 
            || !_spawn_permission )
            {
                continue;//_i
            }
            
            // ------------------------------------------------
            _val = dm_spawn[?_spawn_datakey+STR_Qualified+STR_Quest+STR_Nums];
            if (is_undefined(_val)  // This inst is qualified for any quest if there's no data ???
            || !is_string(   _val)  // Should this be: (!is_string(_val) && _val==f.quest_num) ??
            ||  string_pos(hex_str(f.quest_num),_val) )
            {
                _objver1 = _obj_name+hex_str(_ver);
                _val1 = val(dm_go_prop[?_objver1+STR_Brightness]); // brightness specific to this object
                _val2 = dm_spawn[?_spawn_datakey+STR_Brightness];  // brightness specific to this spawn location
                _val  = val(_val2,_val1); // if _val2 is undefined, use _val1
                if (_val)
                {
                    if(!_used_scene_has_torches 
                    &&  is_ancestor(_obj,Torch) )
                    {
                        _used_scene_has_torches = true;
                    }
                    
                    if(!is_ancestor(_obj,Torch) 
                    ||  val(dm_spawn[?_spawn_datakey+STR_Lit]) ) // Torch spawn locations must specify if they're already lit
                    {
                        set_rm_brightness(rm_brightness+_val);
                        // TODO: More things need to be checked first? This instance may 
                        // not spawn due to various reasons like respawn limits.
                        
                        if (rm_brightness>=RM_BRIGHTNESS_MAX)
                        {
                            break;//_i
                        }
                    }
                }
            }
        }//for(_i=_PRIO_COUNT-1; _i>=0; _i--)
        
        
        if (_SCENE_IS_RANDOMIZED 
        &&  rm_brightness<RM_BRIGHTNESS_MAX )
        {
            
            if (true) // Just in case `_SCENE_USED`'s torches are tough to get to, the following will spawn `rm_name`'s torches near `f.reen`
            //if(!_used_scene_has_torches)
            {
                // Check if the vanilla scene has torches and use them
                var _extra_torches_count = 0;
                
                var    _PRIO_COUNT0 = val(dm_spawn[?get_spawn_datakey(rm_name,STR_PRIO,-1)]);
                for(_i=_PRIO_COUNT0-1; _i>=0; _i--)
                {
                    _spawn_datakey = get_spawn_datakey(rm_name,STR_PRIO,_i);
                    _obj =     dm_spawn[?_spawn_datakey+STR_obj_idx];
                    _ver =     dm_spawn[?_spawn_datakey+STR_Version];
                    _val = val(dm_spawn[?_spawn_datakey+STR_Qualified+STR_Quest+STR_Nums], "0102");
                    _spawn_permission = val(dm_spawn[?_spawn_datakey+STR_Spawn_Permission]);
                    if(!is_undefined(_obj) 
                    && !is_undefined(_ver) 
                    &&  is_ancestor(_obj,Torch) 
                    &&  string_pos(hex_str(f.quest_num),hex_str(_val)) 
                    &&  _spawn_permission )
                    {
                        _extra_torches_count++;
                        
                        _obj_name = object_get_name(_obj);
                        _objver1  = _obj_name+hex_str(_ver);
                        _val1 = val(dm_go_prop[?_objver1+STR_Brightness]); // brightness specific to this object
                        _val2 = dm_spawn[?_spawn_datakey+STR_Brightness];  // brightness specific to this spawn location
                        _val  = val(_val2,_val1); // if _val2 is undefined, use _val1
                        
                        // if the randomized scene doesn't have torches but the vanilla scene does, spawn some torches
                        _idx = ds_grid_width(dg_spawn_prio);
                        ds_grid_resize(dg_spawn_prio, _idx+1, ds_grid_height(dg_spawn_prio));
                        dg_spawn_prio[#_idx,$0] = _spawn_datakey;
                        dg_spawn_prio[#_idx,$1] = _obj;
                        dg_spawn_prio[#_idx,$2] = _obj_name;
                        dg_spawn_prio[#_idx,$3] = _ver;
                        
                        dg_spawn_prio[#_idx,$8] = val(dm_go_prop[?_obj_name+STR_Width],  $10);
                        dg_spawn_prio[#_idx,$9] = val(dm_go_prop[?_obj_name+STR_Height], $10);
                        dg_spawn_prio[#_idx,$A] = dg_spawn_prio[#_idx,$8]>>1;
                        dg_spawn_prio[#_idx,$B] = dg_spawn_prio[#_idx,$9]>>1;
                        
                        dg_spawn_prio[#_idx,$C] = val(dm_go_prop[?_objver1+STR_Respawn]);
                        dg_spawn_prio[#_idx,$D] = val(f.dm_quests[?get_defeated_dk()+_spawn_datakey]);
                        dg_spawn_prio[#_idx,$E] = _spawn_permission;
                        
                        // Trying to set it close to where global.pc spawns
                        _exit_name = _SCENE_USED+strR(f.reen,RmName_LEN+1);
                        _xl = val(dm_rm[?_exit_name+STR_Spawn_x]) <<3;
                        _yt = val(dm_rm[?_exit_name+STR_Spawn_y]) <<3;
                        switch(exit_enter.side){
                        case $0:{_xl-=$0C*_extra_torches_count; _yt+=$08; break;}
                        case $1:{_xl-=$1C*_extra_torches_count; _yt+=$08; break;}
                        case $2:{_xl+=$1C*_extra_torches_count; _yt+=$08; break;}
                        case $4:{_xl+=$04;                      _yt-=$20*_extra_torches_count; break;}
                        case $8:{_xl+=$04;                      _yt+=$20*_extra_torches_count; break;}
                        }
                        
                        dg_spawn_prio[#_idx,$4] = _xl;
                        dg_spawn_prio[#_idx,$5] = _xl+dg_spawn_prio[#_idx,$8];
                        dg_spawn_prio[#_idx,$6] = _yt;
                        dg_spawn_prio[#_idx,$7] = _yt+dg_spawn_prio[#_idx,$9];
                        
                        if (val(dm_spawn[?_spawn_datakey+STR_Lit])) // if the torch is lit upon spawn
                        {
                            set_rm_brightness(rm_brightness+_val);
                        }
                        
                        if (rm_brightness>=RM_BRIGHTNESS_MAX 
                        ||  rm_brightness+_extra_torches_count>=RM_BRIGHTNESS_MAX )
                        {
                            break;//_i
                        }
                    }
                }
            }
        }
    }
}
else
{   // OG ---------------------
    if (dungeon_num 
    ||  f.items&ITM_CAND )
    {
        set_rm_brightness(RM_BRIGHTNESS_MAX); // fully lit
    }
}
*/




