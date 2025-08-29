/// Rando_generate_hints()


var _i,_j,_k, _idx, _num, _val, _count,_count1,_count2,_count3;
var _qual;
var _item_id, _loc_num;
var _area,_area1, _rm_name;
var _dialogue=undefined;
var _pos;
var _dk_loc, _dk_spawn;
var _dl_choices=ds_list_create();




//global.RandoHints_enabled = ItemLocations_NPC_GIVE_HINTS || ItemLocations_ZELDA_HINT;
//save_game_pref();




// ------------------------------------------------------------------------------
// ------------------------------------------------------------------------------
// ------------------------------------------------------------------------------
// ------------------------------------------------------------------------------
// ------------------------------------------------------------------------------
// HINTS ------------------------------------------------------------
if (global.RandoHints_VER==1)
{
    random_set_seed(Rando_SEED);
    
    
    var _dm_set_area_counts=ds_map_create();
    var _dl_set=ds_list_create();
    var _dl_area_choices=ds_list_create();
    var _dm_hint_location_requirements=ds_map_create();
    
    var _dl_item_loc_nums=ds_list_create();
    var _dl_HINT_NUMS=ds_list_create();
    var _dl_BOSS_NAMES=ds_list_create();
    ds_list_add(_dl_BOSS_NAMES,"HORSEHEAD","HELMETHEAD","REBONACK","CAROCK","GOOMA","BARBA");
    
    
    // ** `dl_locnum_that_gave_prog` order is the same order items were placed. You can use that to make sure a hint doesn't get locked behind its item
    ds_list_copy(_dl_item_loc_nums,dl_locnum_that_gave_prog);
    if (1)
    {
        var _dl_ITEM_IDS=ds_list_create();
        ds_list_add(_dl_ITEM_IDS,STR_MEAT,STR_SHIELD,STR_RING,STR_PENDANT,STR_SWORD);
        _count=ds_list_size(_dl_ITEM_IDS);
        for(_i=0; _i<_count; _i++)
        {
            _item_id  = _dl_ITEM_IDS[|_i];
            _loc_num  = val(dm_save_data[?_item_id+STR_Location+STR_Num+STR_Randomized]);
            if (_loc_num 
            &&  ds_list_find_index(_dl_item_loc_nums,_loc_num)==-1 )
            {   ds_list_add(       _dl_item_loc_nums,_loc_num);  }
        }
        
        ds_list_destroy(_dl_ITEM_IDS); _dl_ITEM_IDS=undefined;
    }
    
    
    
    ds_list_clear(_dl_HINT_NUMS);
    _count1=val(g.dm_RandoHints[?STR_Hint+STR_Count]);
    for(_i=1; _i<=_count1; _i++) ds_list_add(_dl_HINT_NUMS,_i);
    ds_list_shuffle(_dl_HINT_NUMS);
    
    var          _ITEM_COUNT = ds_list_size(_dl_item_loc_nums);
    for(_i=0; _i<_ITEM_COUNT; _i++)
    {
        _loc_num  = _dl_item_loc_nums[|_i];
        _dk_loc   = STR_Location+hex_str(_loc_num);
        _item_id  = dm_save_data[?_dk_loc+STR_Item+STR_ID+STR_Randomized];
        _dk_spawn = dm_save_data[?_dk_loc+STR_Spawn+STR_Datakey];
        
        if ((ItemLocations_ZELDA_HINT==ZELDA_HINT_OPTIONS.FLUTE  && _item_id==STR_FLUTE) 
        ||  (ItemLocations_ZELDA_HINT==ZELDA_HINT_OPTIONS.ALLKEY && _item_id==STR_ALLKEY) )
        {
            continue;//_i
        }
        /*
        if (ItemLocations_ZELDA_HINT==ZELDA_HINT_OPTIONS.ALLKEY 
        &&  _item_id==STR_ALLKEY )
        {
            continue;//_i
        }
        */
        
        
        
        // -----------------------------------------------------
        ds_list_clear(_dl_choices);
        _j=1;
        while (true)
        {   // different dialogue for a location
            _val = dm_LOCATIONS[?hex_str(_loc_num)+STR_Hint+hex_str(_j++)];
            if (is_undefined(_val)) break;//while (true)
            ds_list_add(_dl_choices,_val);
        }
        
        if (ds_list_size(_dl_choices))
        {
            ds_list_shuffle(_dl_choices);
            _dialogue = _dl_choices[|0];
            
            if (DungeonBoss_WILL_RANDOMIZE 
            &&  ds_list_size(_dl_choices)>1 
            &&  area_is_dungeon(string_copy(_dk_spawn,1,AreaID_LEN)) )
            {
                for(_j=ds_list_size(_dl_BOSS_NAMES)-1; _j>=0; _j--)
                {
                    _val = _dl_BOSS_NAMES[|_j];
                    _pos = string_pos(_val,_dialogue);
                    if (_pos)
                    {
                        _dialogue = _dl_choices[|1];
                        break;//_j
                    }
                }
            }
            
            _pos=string_pos("&",_dialogue);
            if (_pos)
            {
                _val = string_upper(string_letters(_item_id));
                _dialogue = string_delete(_dialogue,_pos,1);
                _dialogue = string_insert(_val,_dialogue,_pos);
                //_dialogue = string_replace(_dialogue,_val,_pos);
            }
            
            
            
            
            // -----------------------------------------------------
            ds_list_clear(_dl_area_choices);
            for(_j=1; _j<=_count1; _j++) // each hint location
            {
                _qual=false;
                _area=g.dm_RandoHints[?hex_str(_j)+STR_Area];
                if(!is_undefined(_area) 
                &&  ds_list_find_index(_dl_set,_j)==-1  // if this hint(_j) has not been set yet
                &&  ds_list_find_index(_dl_area_choices,_area)==-1 )
                {
                    // You should not need the hint's item to get to the hint.
                    // Need a system that builds a list of hint locations you can reach without the hint's item. 
                    // The process would probably similar to `Rando_is_qual_location()`.
                    // So, each hint location needs qualification logic.
                    if (0) // make sure hint location isnt locked behind its item
                    {
                        _rm_name=val(g.dm_RandoHints[?hex_str(_j)+STR_Rm+STR_Name]);
                        switch(_rm_name)
                        {
                            case "_WestA_24":{ // 'THIS IS<KINGS TOMB'
                            //_qual = !isVal(_item_id);
                            break;}
                        }
                    }
                    else
                    {
                        _qual=true;
                    }
                    
                    if (_qual) ds_list_add(_dl_area_choices,_area);
                }
            }
            
            
            
            
            // -----------------------------------------------------
            if (ds_list_size(_dl_area_choices))
            {
                ds_list_shuffle(_dl_area_choices);
                
                _area=0;
                if (1)
                {
                    for(_j=ds_list_size(_dl_area_choices)-1; _j>=0; _j--)
                    {
                        _area1=_dl_area_choices[|_j];
                        if (_area1==STR_Other 
                        ||  val(_dm_set_area_counts[?_area1])<3 ) // limit each area to 3 hints to prevent clumping
                        {
                            _area=_area1;
                            break;//_j
                        }
                    }
                }
                
                if (_area==0) _area=_dl_area_choices[|0];
                
                
                for(_j=0; _j<_count1; _j++) // each hint
                {
                    _num=_dl_HINT_NUMS[|_j];
                    _area1=g.dm_RandoHints[?hex_str(_num)+STR_Area];
                    _val  =g.dm_RandoHints[?hex_str(_num)+STR_Dialogue+STR_Datakey];
                    
                    if (ds_list_find_index(_dl_set,_num)==-1  // if this hint(_j) has not been set yet
                    && !is_undefined(_area1) 
                    &&  _area==_area1 )
                    {
                        if(!is_undefined(_val)) // dialogue datakey
                        {
                            _count3=val(dm_save_data[?STR_Rando+STR_Hint+STR_Count])+1;
                            dm_save_data[?STR_Rando+STR_Hint+STR_Count]=_count3;
                            
                            dm_save_data[?STR_Rando+STR_Hint+hex_str(_count3)+STR_Dialogue+STR_Datakey]=_val;
                            dm_save_data[?STR_Rando+STR_Hint+hex_str(_count3)+STR_Dialogue]=_dialogue;
                            dm_save_data[?STR_Rando+STR_Hint+hex_str(_count3)+STR_Item]=_item_id;
                            dm_save_data[?STR_Rando+STR_Hint+_val+STR_Hint+STR_Num]=_count3;
                            dm_save_data[?STR_Rando+STR_Hint+_val]=_dialogue;
                            
                            ds_list_add(_dl_set,_num);
                            _dm_set_area_counts[?_area] = val(_dm_set_area_counts[?_area])+1;
                            
                            debug_str  = _item_id+string_repeat(" ",string_length(STR_BRACELET)-string_length(_item_id));
                            debug_str += " hint dialogue '"+_dialogue+"' set to datakey "+_val;
                            sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
                            break;//_j
                        }
                    }
                }
            }
        }
    }
    
    
    ds_list_destroy(_dl_item_loc_nums); _dl_item_loc_nums=undefined;
    ds_list_destroy(_dl_HINT_NUMS); _dl_HINT_NUMS=undefined;
    ds_list_destroy(_dl_BOSS_NAMES); _dl_BOSS_NAMES=undefined;
    
    ds_map_destroy(_dm_set_area_counts); _dm_set_area_counts=undefined;
    ds_map_destroy(_dm_hint_location_requirements); _dm_hint_location_requirements=undefined;
    ds_list_destroy(_dl_set); _dl_set=undefined;
    ds_list_destroy(_dl_area_choices); _dl_area_choices=undefined;
}
















// ------------------------------------------------------------------------------
// ------------------------------------------------------------------------------
// ------------------------------------------------------------------------------
// ------------------------------------------------------------------------------
// ------------------------------------------------------------------------------
// ZELDA HINT ---------------------------------------------------------
random_set_seed(Rando_SEED);

_dialogue = undefined;


switch(ItemLocations_ZELDA_HINT)
{   // ------------------------------------------------------------------------------
    case ZELDA_HINT_OPTIONS.FLUTE:{
    _item_id = STR_FLUTE;
    
    if (FLUTE_LOC_NUM)
    {
        ds_list_clear(_dl_choices);
        for(_j=1; _j<=$20; _j++)
        {   // different kinds of hints for an item location
            _val = dm_LOCATIONS[?hex_str(FLUTE_LOC_NUM)+STR_Hint+hex_str(_j)];
            if (is_undefined(_val)) break;//_j
            ds_list_add(_dl_choices,_val);
        }
        
        if (ds_list_size(   _dl_choices))
        {
            ds_list_shuffle(_dl_choices);
            _dialogue =     _dl_choices[|0];
            _pos=string_pos("&",_dialogue);
            if (_pos)
            {
                _val = string_upper(string_letters(_item_id));
                _dialogue = string_delete(_dialogue,_pos,1);
                _dialogue = string_insert(_val,_dialogue,_pos);
            }
        }
    }
    break;}//case ZELDA_HINT_OPTIONS.FLUTE
    
    // ------------------------------------------------------------------------------
    case ZELDA_HINT_OPTIONS.ALLKEY:{
    _item_id = STR_ALLKEY;
    
    if (ALLKEY_LOC_NUM)
    {
        ds_list_clear(_dl_choices);
        for(_j=1; _j<=$20; _j++)
        {   // different kinds of hints for an item location
            _val = dm_LOCATIONS[?hex_str(ALLKEY_LOC_NUM)+STR_Hint+hex_str(_j)];
            if (is_undefined(_val)) break;//_j
            ds_list_add(_dl_choices,_val);
        }
        
        if (ds_list_size(   _dl_choices))
        {
            ds_list_shuffle(_dl_choices);
            _dialogue =     _dl_choices[|0];
            _pos=string_pos("&",_dialogue);
            if (_pos)
            {
                _val = string_upper(string_letters(_item_id));
                _dialogue = string_delete(_dialogue,_pos,1);
                _dialogue = string_insert(_val,_dialogue,_pos);
            }
        }
    }
    break;}//case ZELDA_HINT_OPTIONS.ALLKEY
    
    // ------------------------------------------------------------------------------
    case ZELDA_HINT_OPTIONS.JUMP:{
    _item_id = STR_JUMP;
    //sdm("");sdm("STR_JUMP+STR_Location: "+string(val(dm_save_data[?STR_JUMP+STR_Location])));sdm("");
    switch(val(dm_save_data[?STR_JUMP+STR_Location]))
    {
        case STR_Rauru:{
        _dialogue=choose("THE JUMP<SPELL IS<IN RAURU.", 
                         "JUMP SPELL<IS IN A<FOREST<TOWN.", 
                         "JUMP SPELL<IS IN A<NEARBY<TOWN.");
        break;}
        
        case STR_Ruto:{
        _dialogue=choose("THE JUMP<SPELL IS<IN RUTO.", 
                         "JUMP SPELL<IS IN A<MOUNTAIN<TOWN.", 
                         "YOU NEED<THE TROPHY<FOR THE<JUMP SPELL", 
                         "JUMP SPELL<IS IN A<NEARBY<TOWN.");
        break;}
        
        case STR_Saria:{
        _dialogue=choose("THE JUMP<SPELL IS<IN SARIA.", 
                         "JUMP SPELL<IS IN A<WATER TOWN", 
                         "JUMP SPELL<IS IN A<CURSED<TOWN.", 
                         "YOU NEED<THE MIRROR<FOR THE<JUMP SPELL");
        break;}
        
        case STR_Mido:{
        _dialogue=choose("THE JUMP<SPELL IS<IN MIDO.", 
                         "JUMP SPELL<IS IN A<WATER TOWN", 
                         "YOU NEED<THE FLOWER<FOR THE<JUMP SPELL");
        break;}
        
        case STR_Darunia:{
        _dialogue=choose("THE JUMP<SPELL IS<IN DARUNIA", 
                         "JUMP SPELL<IS IN A<MOUNTAIN<TOWN.", 
                         "JUMP SPELL<IS IN A<CURSED<TOWN.", 
                         "YOU NEED<THE CHILD<FOR THE<JUMP SPELL");
        break;}
        
        case STR_New_Kasuto:{
        _dialogue=choose("THE JUMP<SPELL IS<IN<NEW KASUTO", 
                         "JUMP SPELL<IS IN A<KASUTO<TOWN.", 
                         "YOU NEED<THE HAMMER<FOR THE<JUMP SPELL");
        break;}
        
        case STR_Old_Kasuto:{
        _dialogue=choose("THE JUMP<SPELL IS<IN<OLD KASUTO", 
                         "JUMP SPELL<IS IN A<KASUTO<TOWN.", 
                         "YOU NEED<THE CROSS<FOR THE<JUMP SPELL");
        break;}
    }
    break;}//case ZELDA_HINT_OPTIONS.JUMP
}//switch(ItemLocations_ZELDA_HINT)


if(!is_undefined(_dialogue))
{
    _count3=val(dm_save_data[?STR_Rando+STR_Hint+STR_Count])+1;
    dm_save_data[?STR_Rando+STR_Hint+STR_Count]=_count3;
    
    var _DIALOGUE_DK = STR_Zelda+STR_Hint;
    dm_save_data[?STR_Rando+STR_Hint+hex_str(_count3)+STR_Dialogue+STR_Datakey]=_DIALOGUE_DK;
    dm_save_data[?STR_Rando+STR_Hint+hex_str(_count3)+STR_Dialogue]=_dialogue;
    dm_save_data[?STR_Rando+STR_Hint+hex_str(_count3)+STR_Item]=_item_id;
    dm_save_data[?STR_Rando+STR_Hint+_DIALOGUE_DK+STR_Hint+STR_Num]=_count3;
    dm_save_data[?STR_Rando+STR_Hint+_DIALOGUE_DK]=_dialogue;
    
    dm_save_data[?STR_Zelda+STR_Hint+STR_Dialogue]=_dialogue;
}




ds_list_destroy(_dl_choices); _dl_choices=undefined;




