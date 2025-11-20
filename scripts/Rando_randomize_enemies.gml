/// Rando_randomize_enemies()


var _i,_j,_k, _idx, _num, _min, _max, _val,_val0,_val1,_val2,_val3,_val4, _count,_count1,_count2,_count3;
var _datakey,_datakey1, _dk,_dk1,_dk2,_dk3;
var _objver1,_objver2;
var _difficulty, _scene_name;


if (EnemyChars_WILL_RANDOMIZE)
{
    g.Rando_enemy = true;
    save_game_pref();
    
    
    //if (DEBUG){sdm(" "); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=" ";}
    random_set_seed(Rando_SEED);
    
    
    
    ds_list_clear(dl_list1);
    ds_list_clear(dl_list2);
    
    _datakey = STR_Randomize+STR_Enemy;
    
    dm_save_data[?_datakey+STR_Method]     = EnemyChars_WILL_RANDOMIZE;
    dm_save_data[?_datakey+STR_Difficulty] = Enemy_DIFFICULTY;
    
    
    
    switch(EnemyChars_WILL_RANDOMIZE)
    {   // ====================================================================
        case 1:{ // SPAWNS --------------------------------------------
        _datakey1 = _datakey+STR_Spawn;
        
            _count = val(g.dm_RandoEnemy[?_datakey1+STR_Count]);
        if (_count<2) break;
        
        
        var _DEBUG1=0;
        if (_DEBUG1){
        var _dl1=ds_list_create();
        var _dl2=ds_list_create();
        var _dl3=ds_list_create();
        }
        var _spawn_datakey1,_spawn_datakey2;
        var _dl_SPAWN_DATAKEY_A1=ds_list_create();
        var _dl_SPAWN_DATAKEY_A2=ds_list_create();
        var _dl_SPAWN_DATAKEY_A3=ds_list_create();
        var _dl_SPAWN_DATAKEY_b1=ds_list_create();
        var _dl_SPAWN_DATAKEY_b2=ds_list_create();
        
        for(_i=0; _i<_count; _i++)
        {   //_datakey1 = STR_Randomize+STR_Enemy+STR_Spawn;
            _spawn_datakey1 = val(g.dm_RandoEnemy[?_datakey1+hex_str(_i+1)+STR_Spawn+STR_Datakey]);
            _spawn_datakey1 = string( _spawn_datakey1);
            _objver1    = g.dm_spawn[?_spawn_datakey1+STR_OBJVER];
            _scene_name = g.dm_spawn[?_spawn_datakey1+STR_Rm+STR_Name];
            if(!is_undefined(_objver1) 
            &&  is_string(   _objver1) 
            && !is_undefined(_scene_name) 
            &&  is_string(   _scene_name) )
            {
                if (        string_copy(_scene_name,1,AreaID_LEN)!=Area_MazIs 
                ||  str_hex(string_copy(_scene_name,AreaID_LEN+2,2))<$40 )
                {
                        _difficulty = val(g.dm_RandoEnemy[?_objver1+STR_Difficulty],1);
                    if (_difficulty<=Enemy_DIFFICULTY)
                    {   //RandoEnemy_difficulty_MAX
                        if (ds_list_find_index(g.dl_RandoEnemy_OBJVER1,_objver1)!=-1) // 
                        {   ds_list_add(_dl_SPAWN_DATAKEY_A1,_spawn_datakey1); continue;  }
                        
                        if (ds_list_find_index(g.dl_RandoEnemy_OBJVER2,_objver1)!=-1) // Flying enemies
                        {   ds_list_add(_dl_SPAWN_DATAKEY_A2,_spawn_datakey1); continue;  }
                        
                        if (ds_list_find_index(g.dl_RandoEnemy_OBJVER3,_objver1)!=-1) // Spawners
                        {   ds_list_add(_dl_SPAWN_DATAKEY_A3,_spawn_datakey1); continue;  }
                    }
                }
            }
        }
        
        
        for(_i=1; _i<=3; _i++)
        {
            switch(_i){
            case 1:{ds_list_copy(_dl_SPAWN_DATAKEY_b1,_dl_SPAWN_DATAKEY_A1); break;}
            case 2:{ds_list_copy(_dl_SPAWN_DATAKEY_b1,_dl_SPAWN_DATAKEY_A2); break;} // Flying enemies
            case 3:{ds_list_copy(_dl_SPAWN_DATAKEY_b1,_dl_SPAWN_DATAKEY_A3); break;} // Spawners
            }
            
            if (_dl_SPAWN_DATAKEY_b1[|0]==_dl_SPAWN_DATAKEY_A3[|0]  // if it's a spawner
            && !EnemySpawners_WILL_RANDOMIZE )                      // if NOT randomizing spawners
            {
                continue;
            }
            
            
            ds_list_copy(   _dl_SPAWN_DATAKEY_b2,_dl_SPAWN_DATAKEY_b1);
            ds_list_shuffle(_dl_SPAWN_DATAKEY_b2);
                         _count = ds_list_size(_dl_SPAWN_DATAKEY_b2);
            for(_j=0; _j<_count; _j++)
            {
                _spawn_datakey1 = string(_dl_SPAWN_DATAKEY_b1[|_j]); // original
                _spawn_datakey2 = string(_dl_SPAWN_DATAKEY_b2[|_j]); // shuffled
                _objver1 = g.dm_spawn[?_spawn_datakey1+STR_OBJVER];
                _objver2 = g.dm_spawn[?_spawn_datakey2+STR_OBJVER];
                if(!is_undefined(_objver1) 
                &&  is_string(   _objver1) 
                && !is_undefined(_objver2) 
                &&  is_string(   _objver2) )
                {
                    dm_save_data[?_datakey1+_spawn_datakey1+STR_Spawn+STR_Datakey+STR_Randomized] = _spawn_datakey2;
                    dm_save_data[?_datakey1+_spawn_datakey1+STR_OBJVER+STR_Randomized] = _objver2;
                    //dm_save_data[?_datakey1+_spawn_datakey2+STR_OBJVER+STR_Randomized] = _objver1; // This is overwriting data and causing too many or too little of an objver
                    if (_DEBUG1){
                    ds_list_add(_dl1,_spawn_datakey1);
                    ds_list_add(_dl2,_objver1);
                    }
                }
            }
        }
        
        ds_list_destroy(_dl_SPAWN_DATAKEY_A1); _dl_SPAWN_DATAKEY_A1=undefined;
        ds_list_destroy(_dl_SPAWN_DATAKEY_A2); _dl_SPAWN_DATAKEY_A2=undefined;
        ds_list_destroy(_dl_SPAWN_DATAKEY_A3); _dl_SPAWN_DATAKEY_A3=undefined;
        ds_list_destroy(_dl_SPAWN_DATAKEY_b1); _dl_SPAWN_DATAKEY_b1=undefined;
        ds_list_destroy(_dl_SPAWN_DATAKEY_b2); _dl_SPAWN_DATAKEY_b2=undefined;
        
        if (_DEBUG1){
        ds_list_sort(_dl2,true);
        sdm("");
        for(_i=ds_list_size(_dl1)-1; _i>=0; _i--) ds_list_add(_dl3,dm_save_data[?_datakey1+_dl1[|_i]+STR_OBJVER+STR_Randomized]);
        ds_list_sort(_dl3,true);
        _val=_dl2[|0];
        _count=ds_list_size(_dl2);
        for(_i=0; _i<_count; _i++){
        if(_val!=_dl2[|_i]){_val=_dl2[|_i]; sdm("");}
        sdm(_dl2[|_i]+"  -  "+_dl3[|_i]);
        }
        sdm("");
        
        ds_list_destroy(_dl1); _dl1=undefined;
        ds_list_destroy(_dl2); _dl2=undefined;
        ds_list_destroy(_dl3); _dl3=undefined;
        }
        break;}//case 1:
        
        
        
        
        
        // ====================================================================
        case 2:{ // TYPES ---------------------------------------------
        _datakey1 = _datakey+STR_Type;
        
        for(_i=1; _i<=3; _i++)
        {
            ds_list_clear(dl_list1);
            
            switch(_i){
            default:{ds_list_copy(dl_list2,g.dl_RandoEnemy_OBJVER1); break;}
            case  2:{ds_list_copy(dl_list2,g.dl_RandoEnemy_OBJVER2); break;} // Flying
            case  3:{ds_list_copy(dl_list2,g.dl_RandoEnemy_OBJVER3); break;} // Spawners
            }
            
            if (dl_list2[|0]==g.dl_RandoEnemy_OBJVER3[|0] 
            && !EnemySpawners_WILL_RANDOMIZE )
            {
                continue;
            }
            
                         _count=ds_list_size(dl_list2);
            for(_j=0; _j<_count; _j++)
            {
                _objver1=dl_list2[|_j];
                if(!is_undefined(_objver1) 
                &&  is_string(   _objver1) )
                {
                        _difficulty = val(g.dm_RandoEnemy[?_objver1+STR_Difficulty],1);
                    if (_difficulty<=Enemy_DIFFICULTY 
                    &&  ds_list_find_index(dl_list1,_objver1)==-1 )
                    {   ds_list_add(       dl_list1,_objver1);  }
                }
            }
            
            if (ds_list_size(dl_list1)>=2)
            {
                ds_list_copy(       dl_list2,dl_list1);
                ds_list_shuffle(    dl_list2);
                for(_j=ds_list_size(dl_list2)-1; _j>=0; _j--)
                {
                    _objver1 =      dl_list1[|_j];
                    _objver2 =      dl_list2[|_j];
                    if(!is_undefined(_objver1) 
                    &&  is_string(   _objver1) 
                    && !is_undefined(_objver2) 
                    &&  is_string(   _objver2) )
                    {   //            _datakey = STR_Randomize+STR_Enemy
                        dm_save_data[?_datakey+STR_Type+_objver1+STR_OBJVER+STR_Randomized] = _objver2;
                        dm_save_data[?_datakey+STR_Type+_objver2+STR_OBJVER+STR_Randomized] = _objver1;
                    }
                }
            }
        }
        break;}//case 2:
    }//switch(EnemyChars_WILL_RANDOMIZE)
}








if (EnemyHP_WILL_RANDOMIZE)
{
    //if (DEBUG){sdm(" "); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=" ";}
    
    random_set_seed(Rando_SEED);
    
    _datakey = STR_Enemy+STR_HP;
    
                 _count=ds_list_size(g.dl_HP);
    for(_i=0; _i<_count; _i++)
    {
            _val  = g.dl_HP[|_i];
        if (_val)
        {
            _val0 = max(round(_val*.25), 1);
            _max  = _val + _val0;
            _min  = _val - _val0;
            _val  = _min + irandom(_max-_min);
            _val  = max(_val,1);
        }
        
        dm_save_data[?_datakey+hex_str(_i)] = _val;
    }
}









if (EnemyDamage_WILL_RANDOMIZE)
{
    //if (DEBUG){sdm(" "); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=" ";}
    
    random_set_seed(Rando_SEED);
    
    _datakey = STR_Enemy+STR_Damage;
    
    var _EnemyDamage_level_COUNT=ds_grid_height(g.dg_enemy_damage);
    for(_i=ds_grid_width(g.dg_enemy_damage)-1; _i>=0; _i--) // LIFE Level
    {
        for(_j=_EnemyDamage_level_COUNT-1; _j>=0; _j--) // Enemy Damage Level
        {
                _val  = g.dg_enemy_damage[#_i,_j];
            if (_val)
            {
                _val0 = max(round(_val*.1), 1);
                _max  = _val + _val0;
                _min  = _val - _val0;
                _val  = _min + irandom(_max-_min);
                _val  = max(_val,1);
            }
            
            dm_save_data[?_datakey+hex_str(_i)+hex_str(_j)] = _val;
        }
    }
}




