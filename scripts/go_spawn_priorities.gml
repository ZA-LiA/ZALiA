/// go_spawn_priorities()


var _i, _val, _count,_count1,_count2;
var _xl,_yt;
var _str, _datakey1, _dk_spawn,_dk_spawn1,_dk_spawn2;
var _obj,_obj1,_obj2, _ver, _obj_name, _objver, _obj_prefix;
var _item_id, _item_type;
var _scene_name, _qual;
var _RM_SPAWN_COUNT_PRIO = ds_grid_width(g.dg_spawn_prio);
var _SceneRando_scene = val(f.dm_rando[?dk_SceneRando+STR_Scene+STR_Randomized+g.rm_name], g.rm_name);





//  --------------------------------------------------------------------------
//  ------------  Items  --------------------------------------------
for(_i=0; _i<_RM_SPAWN_COUNT_PRIO; _i++)
{
    _dk_spawn = g.dg_spawn_prio[#_i,0];
    _obj      = g.dm_spawn[?_dk_spawn+STR_obj_idx];
    //sdm("_i $"+hex_str(_i)+", _dk_spawn "+string(_dk_spawn)+", obj "+obj_name(_obj)+" - "+obj_name(g.dg_spawn_prio[#_i,1]));
    
    
    if (is_undefined(_obj) 
    || !is_ancestor( _obj,Item) )
    {
        continue;//_i
    }
    
    
    
    _item_id = undefined;
    
    
    _obj = g.dg_spawn_prio[#_i,1];
    _ver = g.dg_spawn_prio[#_i,3];
    _xl  = g.dg_spawn_prio[#_i,4];
    _yt  = g.dg_spawn_prio[#_i,6];
    
    
    _obj_name   = object_get_name(_obj);
    _objver     = _obj_name+hex_str(_ver);
    _obj_prefix = string_copy(_obj_name, 1, string_length(_obj_name)-1);
    
    
    _item_id = g.dm_spawn[?_dk_spawn+STR_Item+STR_ID+STR_Randomized];
    if (is_undefined(_item_id))
    {
        _item_id = g.dm_spawn[?_dk_spawn+STR_Item+STR_ID];
        if (is_undefined(_item_id)) continue;//_i
    }
    
    
    _item_type = g.dm_spawn[?_dk_spawn+STR_Item+STR_Type];
    if (is_undefined(_item_type))
    {
        _item_type = g.dm_ITEM[?_obj_name+STR_Item+STR_Type];
        if (is_undefined(_item_type)) continue;//_i
    }
    
    
    //sdm("_item_id: "+_item_id+", item_acquired(_item_id): "+string(item_acquired(_item_id))+", f.cont_pieces_mp: "+f.cont_pieces_mp);
    if(!item_acquired(_item_id))
    {
        with(GameObject_create(_xl,_yt, _obj,_ver, _dk_spawn))
        {
            vspd = 1;
            if(!is_undefined(_item_id))
            {
                ITEM_ID = _item_id;
                show_debug_message("go_spawn_priorities(). Item `"+object_get_name(object_index)+"` spawned. ITEM_ID: "+ITEM_ID+", _item_id: "+_item_id);
            }
        }
        
        //if (_SceneRando_scene!=g.rm_name) sdm("SceneRando Item-E. _SceneRando_scene '"+_SceneRando_scene+"', g.rm_name '"+g.rm_name+"', _dk_spawn '"+_dk_spawn+"', _obj_name '"+_obj_name+"', _item_id '"+_item_id+"', _item_type '"+_item_type+"'");
    }
}


















//  -------------------------------------------------------------------------
//  -------------------------------------------------------------------------
//  -------------------------------------------------------------------------
//  -------------------------------------------------------------------------
//  -------------------------------------------------------------------------

//  ---------------------  PRIO GOB1&2  -------------------------
for(_i=0; _i<_RM_SPAWN_COUNT_PRIO; _i++)
{
    _dk_spawn = g.dg_spawn_prio[#_i,0];
    
    //if(!g.dg_spawn_prio[#_i,$E]) // $E: spawn permission
    if(!val(g.dm_spawn[?_dk_spawn+STR_Spawn_Permission]))
    {   // already used/opened/defeated..
        continue;//_i
    }
    
    //if (rm_get_encounter_types(g.rm_name)){ _str  = "_dk_spawn: "+_dk_spawn;
    //_str += "val(g.dm_spawn[?_dk_spawn+STR_Enc_Strong]): "+string(val(g.dm_spawn[?_dk_spawn+STR_Enc_Strong]));
    //_str += ", g.encounter_type: $"+hex_str(g.encounter_type)+", g.ENC_STRG: "+string(g.ENC_STRG);
    //sdm(""); sdm(_str); }
    
    if (rm_get_encounter_types(g.rm_name) 
    &&  sign(g.encounter_type&g.ENC_STRG) != sign(val(g.dm_spawn[?_dk_spawn+STR_Strong+STR_Encounter])) )
    {
        continue;//_i
    }
    
    
    _obj = g.dg_spawn_prio[#_i,1];
    _ver = g.dg_spawn_prio[#_i,3];
    _xl  = g.dg_spawn_prio[#_i,4];
    _yt  = g.dg_spawn_prio[#_i,6];
    
    
    if (is_ancestor_(_obj,Item,PushA))
    {
        continue;//_i
    }
    
    // if has been defeated and respawn type is NEVER
    if (update_go_spawn_1d(_obj,_ver, _dk_spawn))
    {
        continue;//_i
    }
    
    
    
    
    with(GameObject_create(_xl,_yt, _obj,_ver, _dk_spawn))
    {
        // ------------------------------------------
    }
    
    
    
    if(!is_undefined(g.dm_spawn[?_dk_spawn+STR_Spawn_Permission]))
    {                g.dm_spawn[?_dk_spawn+STR_Spawn_Permission] = 0;  }
}









_obj      = PushA;
_obj_name = object_get_name(_obj);
_count = val(g.dm_spawn[?_obj_name+STR_Count]);
for(_i=1; _i<=_count; _i++)
{
    _datakey1 = _obj_name+hex_str(_i);
    _dk_spawn = g.dm_spawn[?_datakey1+STR_Spawn+STR_Datakey];
    if(!is_undefined(_dk_spawn))
    {
        if(!val(g.dm_spawn[?_dk_spawn+STR_Spawn_Permission]))
        {   // already used/opened/defeated..
            continue;//_i
        }
        
        _qual=false;
        _scene_name = val(g.dm_spawn[?_datakey1+STR_Rm+STR_Name]);
        _val = f.dm_quests[?_dk_spawn+STR_Rm];
        if (g.rm_name==_scene_name)
        {
            if (is_undefined(_val) 
            ||  g.rm_name == _val )
            {
                _qual=true;
            }
        }
        else
        {
            if(!is_undefined(_val) 
            &&  g.rm_name == _val )
            {
                _qual=true;
            }
        }
        
        
        if (_qual)
        {
            _xl  = val(g.dm_spawn[? _dk_spawn+"_x"]);
            _xl  = val(f.dm_quests[?_dk_spawn+"_XL"], _xl);
            _xl  = (_xl>>3)<<3;
            
            _yt  = val(g.dm_spawn[? _dk_spawn+"_y"]);
            _yt  = val(f.dm_quests[?_dk_spawn+"_YT"], _yt);
            
            _ver = val(g.dm_spawn[? _dk_spawn+STR_Version],1);
            
            with(GameObject_create(_xl,_yt, _obj,_ver, _dk_spawn))
            {
                // ------------------------------------------
            }
            
            
            
            if(!is_undefined(g.dm_spawn[?_dk_spawn+STR_Spawn_Permission]))
            {                g.dm_spawn[?_dk_spawn+STR_Spawn_Permission] = 0;  }
        }
    }
}













// FAIRY ENCOUNTER -------------------------------------------------------
if (g.encounter_type&g.ENC_FARY)
{
    _xl = g.rm_w_-4;
    _yt = g.rm_row0<<3;
    _yt = get_ground_y(g.rm_w_,_yt, 1, (g.rm_row0+$12)<<3);
    
    with(GameObject_create(_xl,_yt, ReFaA,1))
    {
        set_xy(id, g.rm_w_,y);
    }
}













//  ------------  Platforms  ---------------------------
                                           _count=1;
_dk_spawn = g.rm_name+STR_Platform+hex_str(_count++);
while(!is_undefined(g.dm_spawn[?_dk_spawn+STR_obj_idx]))
{
    _obj = g.dm_spawn[?_dk_spawn+STR_obj_idx];
    _ver = g.dm_spawn[?_dk_spawn+STR_version];
    _xl  = g.dm_spawn[?_dk_spawn+"_x"];
    _yt  = g.dm_spawn[?_dk_spawn+"_y"];
    
    with(GameObject_create(_xl,_yt, _obj,_ver, _dk_spawn))
    {
        // ------------------------------------------
    }
    
    _dk_spawn = g.rm_name+STR_Platform+hex_str(_count++);
}












//  ------------  Challenge  ---------------------------
_count2=1;
_dk_spawn2 = g.rm_name+STR_Challenge+hex_str(_count2++);
_obj2      = g.dm_spawn[?_dk_spawn2+STR_obj_idx];
while(!is_undefined(_obj2))
{
    _ver = g.dm_spawn[?_dk_spawn2+STR_version];
    _xl  = g.dm_spawn[?_dk_spawn2+"_x"];
    _yt  = g.dm_spawn[?_dk_spawn2+"_y"];
    
    _dk_spawn = _dk_spawn2;
    _obj = _obj2;
    if (global.SceneRando_enabled 
    &&  _SceneRando_scene!=g.rm_name )
    {   // Currently, this assumes each scene only has 1 Challenge object which is the same challenge requirements
        _count1=1;
        _dk_spawn1 = _SceneRando_scene+STR_Challenge+hex_str(_count1++);
        _obj1      = g.dm_spawn[?_dk_spawn1+STR_obj_idx];
        while(!is_undefined(_obj1))
        {
            if (is_ancestor(_obj1,_obj2))
            {
                _dk_spawn = _dk_spawn1;
                _obj = _obj1;
                _ver = val(g.dm_spawn[?_dk_spawn1+STR_version],_ver);
                _xl  = val(g.dm_spawn[?_dk_spawn1+"_x"],_xl);
                _yt  = val(g.dm_spawn[?_dk_spawn1+"_y"],_yt);
                break;//while(!is_undefined(_obj1))
            }
            
            _dk_spawn1 = g.rm_name+STR_Challenge+hex_str(_count1++);
            _obj1      = g.dm_spawn[?_dk_spawn1+STR_obj_idx];
        }
    }
    
    with(GameObject_create(_xl,_yt, _obj,_ver, _dk_spawn))
    {
        // ------------------------------------------
    }
    
    _dk_spawn2 = g.rm_name+STR_Challenge+hex_str(_count2++);
    _obj2      = g.dm_spawn[?_dk_spawn2+STR_obj_idx];
}




