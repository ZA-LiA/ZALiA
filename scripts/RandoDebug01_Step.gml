/// RandoDebug01_Step()

/*
if(!instance_exists(FileSelect))
{
    instance_destroy();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
*/


if (cooldown_timer) cooldown_timer--;

if (1&&DEV)
{
    if(!cooldown_timer 
    &&  FileSelect.state==FileSelect.State_RANDO 
    &&  keyboard_check_pressed(vk_f3) )
    {
        var _i,_j,_k, _idx, _val,_val1, _count,_count1,_count2, _data;
        var _DATAKEY1,_datakey1,_datakey2;
        var _rm_name;
        var _seed;
        var _debug_data_count=0;
        var _debug_data=undefined;
        var _scenario="undefined";
        
        var _can_simulate=false;
        
        var _SIMULATION_COUNT=$01;
        if (keyboard_check(vk_control))
        {
            if (keyboard_check(vk_shift)) _SIMULATION_COUNT=$40;
            else                          _SIMULATION_COUNT=$20;
        }
        
        var _CAN_SAVE_DATA=1;
        var _ALLKEY_can_print_stats=0;
        
        if (0)
        {
            _SIMULATION_COUNT=$20;
            _CAN_SAVE_DATA=0;
            _ALLKEY_can_print_stats=1;
        }
        
        var _ALLKEY_location_num, _ALLKEY_rm_name, _ALLKEY_location_description;
        
        
        var              _SETTINGS = undefined;
        with(FileSelect) _SETTINGS = FileSelect_Rando_get_rando_settings();
        if(!is_undefined(_SETTINGS))
        {
            dm_settings=json_decode(_SETTINGS);
            var _QUEST_NUM = dm_settings[?STR_File+STR_Start+STR_Quest];
            
            _ALLKEY_can_print_stats &= !val(dm_settings[?STR_Randomize+STR_Key+STR_Locations]);
            
            
            for(_i=0; _i<_SIMULATION_COUNT; _i++)
            {
                // ==========================================================================
                _can_simulate=false;
                
                if (1)
                {
                    _can_simulate=true;
                    _seed=Rando_get_new_seed();
                }
                else
                {
                    _can_simulate=false;
                    
                    // Just in case Rando_get_new_seed() gives a seed already ran
                    for(_j=0; _j<$100; _j++)
                    {
                        _seed=Rando_get_new_seed();
                        if (ds_list_find_index(dl_seeds,_seed)==-1)
                        {
                            _can_simulate=true;
                            break;//_j
                        }
                    }
                }
                
                // ==========================================================================
                if (_can_simulate)
                {
                    _scenario  = "Seed_$"+hex_str(_seed);
                    _scenario += ", "+STR_Start+STR_Quest       +" "+string(_QUEST_NUM);
                    //_scenario += ", "+STR_Item+STR_Method       +" "+string(val(dm_settings[?STR_Randomize+STR_Item+STR_Method]));
                    _scenario += ", "+STR_Item+STR_Locations    +" "+string(val(dm_settings[?STR_Randomize+STR_Item+STR_Locations]));
                    _scenario += ", "+STR_PBAG+STR_Locations    +" "+string(val(dm_settings[?STR_Randomize+STR_PBAG+STR_Locations]));
                    _scenario += ", "+STR_Key +STR_Locations    +" "+string(val(dm_settings[?STR_Randomize+STR_Key +STR_Locations]));
                    _scenario += ", "+dk_LimitObscure           +" "+string(val(dm_settings[?dk_LimitObscure]));
                    _scenario += ", "+dk_DarkRoom+STR_Difficulty+" "+string(val(dm_settings[?dk_DarkRoom+STR_Difficulty]));
                    _scenario += ", "+STR_Spell+STR_Locations   +" "+string(val(dm_settings[?STR_Randomize+STR_Spell+STR_Locations]));
                    
                    
                    cooldown_timer=cooldown_DURATION1;
                    
                    
                    
                    // ----------------------------------------------------------------
                    var _LOCATIONS=undefined;
                    with(instance_create(0,0,Rando))
                    {
                        dm_save_data  = ds_map_create();
                        
                        DEBUG=true;
                        dm_debug_data = ds_map_create();
                        debug_str = undefined;
                        debug_data_count = 0;
                        
                        exit; // TODO: Rando_generate() doesn't take the _SETTINGS anymore
                        //Rando_generate(_QUEST_NUM, _seed, _SETTINGS);
                        
                        
                        _LOCATIONS=json_encode(dm_LOCATIONS);
                        //if(!ds_map_size(other.dm_LOCATIONS_COPY)) ds_map_copy(other.dm_LOCATIONS_COPY,dm_LOCATIONS);
                        _ALLKEY_location_num = ALLKEY_LOC_NUM;
                        
                        _debug_data_count=debug_data_count;
                        _debug_data=json_encode(dm_debug_data);
                        
                        ds_map_destroy(dm_save_data); dm_save_data=undefined;
                        ds_map_destroy(dm_debug_data); dm_debug_data=undefined;
                        instance_destroy();
                    }
                    
                    
                    if(!is_undefined(_LOCATIONS) 
                    && !ds_map_size(dm_LOCATIONS_COPY) )
                    {
                        dm_LOCATIONS_COPY=json_decode(_LOCATIONS);
                    }
                    
                    
                    
                    
                    // ----------------------------------------------------------------
                    if(!is_undefined(_debug_data))
                    {
                        if (_ALLKEY_can_print_stats)
                        {
                            _count=val(dm_allkey[?"_sim_count"])+1;
                            dm_allkey[?"_sim_count"]=_count;
                            _datakey1="_sim"+hex_str(_count);
                            
                            
                            dm_allkey[?_datakey1+"_seed"]                   = _seed;
                            _count1 =   val(dm_allkey[?"_seed_count_"+hex_str(_seed)])+1;
                                            dm_allkey[?"_seed_count_"+hex_str(_seed)] = _count1;
                            if (_count1==2) dm_allkey[?"_multiple_seeds"] = val(dm_allkey[?"_multiple_seeds"],"") + "_"+hex_str(_seed);
                            
                            
                            dm_allkey[?_datakey1+"_location_num"]                   = _ALLKEY_location_num;
                            _count1 =   val(dm_allkey[?"_location_num_count_"+hex_str(_ALLKEY_location_num)])+1;
                                            dm_allkey[?"_location_num_count_"+hex_str(_ALLKEY_location_num)] = _count1;
                            if (_count1==2) dm_allkey[?"_multiple_location_nums"] = val(dm_allkey[?"_multiple_location_nums"],"") + "_"+hex_str(_ALLKEY_location_num);
                            
                            
                            dm_allkey[?_datakey1+"_rm_name"]              = val(dm_LOCATIONS_COPY[?hex_str(_ALLKEY_location_num)+STR_Rm+STR_Name], "undefined");
                            dm_allkey[?_datakey1+"_location_description"] = val(dm_LOCATIONS_COPY[?hex_str(_ALLKEY_location_num)+STR_Description], "undefined");
                        }
                        
                        
                        
                        var _dm_debug_data=json_decode(_debug_data);
                        
                        ds_list_add(dl_seeds,_seed);
                        simulation_num=ds_list_size(dl_seeds);
                        
                        
                        if (_CAN_SAVE_DATA)
                        {
                            var _FILE=file_text_open_append(working_directory+FILE_NAME);
                            repeat($8) file_text_writeln(_FILE);
                            
                            
                            
                            var _STR1=" ---------------- ";
                            sdm("");sdm("");
                            sdm("// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
                            sdm("// "+_STR1+" Rando Seed Simulation $"+hex_str(simulation_num)+" "+_STR1);
                            sdm("scenario id: '"+_scenario+"'");
                            
                            file_text_write_string(_FILE,"// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
                            file_text_writeln(     _FILE);
                            file_text_write_string(_FILE,"// "+_STR1+" Rando Seed Simulation $"+hex_str(simulation_num)+" "+_STR1);
                            file_text_writeln(     _FILE);
                            file_text_write_string(_FILE,"scenario id: '"+_scenario+"'");
                            file_text_writeln(     _FILE);
                            
                            for(_j=0; _j<_debug_data_count; _j++)
                            {
                                    _val = _dm_debug_data[?STR_Data+'01'+hex_str(_j+1)];
                                if(!is_undefined(_val) 
                                &&  _val!="" 
                                &&  _val!=" " )
                                {
                                    file_text_write_string(_FILE,_val);
                                    file_text_writeln(     _FILE);
                                }
                            }
                            
                            file_text_close(_FILE);
                            ds_map_destroy(_dm_debug_data); _dm_debug_data=undefined;
                            
                            sdm("");
                            sdm("Rando simulation $"+hex_str(simulation_num)+" data saved!");
                            sdm("");sdm("");
                        }
                    }
                }
            }
            
            
            
            
            
            
            
            
            if (_ALLKEY_can_print_stats)
            {
                sdm("");sdm("");sdm("");sdm("");
                _count=val(dm_allkey[?"_sim_count"]);
                sdm("sim count $"+hex_str(_count)); sdm("");
                for(_i=1; _i<=_count; _i++)
                {
                    _datakey1="_sim"+hex_str(_i);
                    _data="";
                    _data+="sim $"+hex_str(_i);
                    _data+=", "+"seed $"+hex_str(val(dm_allkey[?_datakey1+"_seed"]));
                    _data+=". location num $"+hex_str(val(dm_allkey[?_datakey1+"_location_num"]));
                    _data+=", "+"rm: "+string(val(dm_allkey[?_datakey1+"_rm_name"]));
                    _data+=" - "+string(val(dm_allkey[?_datakey1+"_location_description"]));
                    sdm(_data);
                    if!(_i&$7) sdm("");
                    if!(_i&$F) sdm("");
                }
                
                _data=dm_allkey[?"_multiple_seeds"];
                if(!is_undefined(_data))
                {
                    sdm("");sdm("");
                    sdm("_multiple_seeds: "+_data);
                    _count=string_length(_data) div 9;
                    for(_i=0; _i<_count; _i++)
                    {
                        _val=string_copy(_data,(_i*9)+1,9);
                        _val=string_copy(_val,2,8);
                        _val1  = "$"+_val;
                        _val1 += ". "+"COUNT $"+hex_str(val(dm_allkey[?"_seed_count_"+_val]));
                        sdm(_val1);
                    }
                }
                
                _data=dm_allkey[?"_multiple_location_nums"];
                if(!is_undefined(_data))
                {
                    sdm("");sdm("");
                    sdm("_multiple_location_nums: "+_data);
                    _count=string_length(_data) div 3;
                    for(_i=0; _i<_count; _i++)
                    {
                        _val=string_copy(_data,(_i*3)+1,3);
                        _val=string_copy(_val,2,2);
                        _val1  = "$"+_val;
                        _val1 += ": "+"COUNT $"+hex_str(val(dm_allkey[?"_location_num_count_"+_val]));
                        _val1 += ". " +val(dm_LOCATIONS_COPY[?_val+STR_Rm+STR_Name], "undefined");
                        _val1 += " - "+val(dm_LOCATIONS_COPY[?_val+STR_Description], "undefined");
                        sdm(_val1);
                    }
                }
                sdm("");sdm("");sdm("");sdm("");
            }
        }
    }
}




