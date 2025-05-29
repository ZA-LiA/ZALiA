/// spawn_data_set_default()


//sdm("set spawn defaults");
var _i,_j,_k,_m, _num,_val, _count;
var _dk, _rm_name, _spawn_trigger;


for(_i=ds_list_size(g.dl_AREA_NAME)-1; _i>=0; _i--) // Each area
{
    for(_j=0; _j<$100; _j++) // Each room of the area
    {
        _rm_name = g.dl_AREA_NAME[|_i]+hex_str(_j);
        for(_k=0; _k<2; _k++) // PRoXiMity type spawns, then PRIOrity type spawns
        {
            if (_k) _spawn_trigger = STR_PRIO;
            else    _spawn_trigger = STR_PRXM;
                         _count = val(g.dm_spawn[?_rm_name+_spawn_trigger+STR_Count]);
            for(_m=0; _m<_count; _m++) // Each gob/entity of the room
            {
                _dk = _rm_name+_spawn_trigger+hex_str(_m)
                
                //db_spawn_data_set_default_1a(_dk);
                
                g.dm_spawn[?_dk+"_x"] = val(g.dm_spawn_DEFAULT[?_dk+"_x"]);
                g.dm_spawn[?_dk+"_y"] = val(g.dm_spawn_DEFAULT[?_dk+"_y"]);
                //g.dm_spawn[?_dk+"_x"] = val(g.dm_spawn[?_dk+"_x"+STR_Default]);
                //g.dm_spawn[?_dk+"_y"] = val(g.dm_spawn[?_dk+"_y"+STR_Default]);
                
                if (g.dm_spawn[?_dk+STR_Spawn_Permission] != -1)
                {   g.dm_spawn[?_dk+STR_Spawn_Permission]  =  1;  }
            }
        }
        
        
        
                                                 _count = 1;
            _dk = _rm_name+STR_Challenge+hex_str(_count++);
        while(!is_undefined(g.dm_spawn[?_dk+STR_obj_idx]))
        {
            if (is_ancestor(g.dm_spawn[?_dk+STR_obj_idx], TogglingPathDirection))
            {   // 1: Forward, -1: Backward
                g.dm_spawn[?_dk+STR_Direction] = val(g.dm_spawn_DEFAULT[?_dk+STR_Direction]);
                //g.dm_spawn[?_dk+STR_Direction] = val(g.dm_spawn[?_dk+STR_Direction+STR_Default]);
            }
            _dk = _rm_name+STR_Challenge+hex_str(_count++);
        }
    }
}




