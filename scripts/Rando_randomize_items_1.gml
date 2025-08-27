/// Rando_randomize_items_1()


var _i,_j,_k,_m, _idx, _val,_val1,_val2;
var _count,_count1,_count2,_count3;
var _loc_num,_loc_num1,_loc_num2, _loc_cat,_loc_cat1;
var _qual, _qual_loc_count1,_qual_loc_count2;
var _is_item, _is_key, _type;
var _item_id, _item_num, _key_id, _spell_id, _rm_name, _town_name, _dungeon_name, _spell_name;
var _something_was_placed = false;
var _rando_step=0;

var _dl_placed_items = ds_list_create();
var _dl_placed_keys  = ds_list_create();


dl_placed_containers_hp = ds_list_create();
dl_placed_containers_mp = ds_list_create();








if (CONTROL_ALLKEY==2 
&& !KeyLocations_WILL_RANDOMIZE )
{
    ds_list_clear(dl_loc_num_options);
    //ds_list_clear(dl_loc_cats); // Location Categories
    
    for(_i=ds_list_size(dl_locations_remaining)-1; _i>=0; _i--)
    {
        _loc_num =      dl_locations_remaining[|_i];
        _val1 = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_ALLKEY+STR_Rating]);
        _val2 = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Obscure], -1);
        
        _count=0;
        if (_val1 
        &&  _val2!=-1 )
        {
            switch(_val2)
            {
                default:{ // 0,1
                    switch(_val1){
                    case 1:{_count=04; break;}
                    case 2:{_count=12; break;}
                    case 3:{_count=14; break;}
                    case 4:{_count=16; break;}
                    case 5:{_count=18; break;}
                    }
                break;}
                
                case 2:{_count=03; break;}
                case 3:{_count=01; break;}
            }
            
            repeat(_count) ds_list_add(dl_loc_num_options,_loc_num);
        }
    }
    
    
    if (ds_list_size(   dl_loc_num_options))
    {
        ds_list_shuffle(dl_loc_num_options);
        ALLKEY_LOC_NUM =dl_loc_num_options[|0];
        sdm("ALLKEY location chosen: $"+hex_str(ALLKEY_LOC_NUM)+", rm: "+string(val(dm_LOCATIONS[?hex_str(ALLKEY_LOC_NUM)+STR_Rm+STR_Name]))+" - "+string(val(dm_LOCATIONS[?hex_str(ALLKEY_LOC_NUM)+STR_Description]))); sdm("");
    }
}









// ==============================================================================
// ==============================================================================
// ==============================================================================
// PHASE 1 -----------------------------------
// Place as many spells and keys that you can to maximize the number of reachable locations
Rando_sweep_combo(2);

if(!Rando_is_qual_location(STR_Mido))
{   // This is about maximizing the number of reachable locations asap to 
    // spread progression items better for more interesting seeds.
    if (DEBUG) repeat(1){sdm(""); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";}
    if (DEBUG){debug_str="+++++  Step $"+hex_str(++_rando_step)+": Placing the fewest items that adds the most progression."; sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=debug_str;}
    //if (DEBUG){debug_str="+++++  Step $"+hex_str(++_rando_step)+": Start by placing one of the items that adds the most progression."; sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=debug_str;}
    
    Rando_randomize_items_1a();
    
    if (DEBUG){
    debug_str  =      "Remaining Locations"+" COUNT $"+hex_str(ds_list_size(dl_locations_remaining));
    debug_str += ", "+"Remaining Items"    +" COUNT $"+hex_str(ds_list_size(dl_prog1)+ds_list_size(dl_ItemPool_C));
    debug_str += ", "+"Remaining Keys"     +" COUNT $"+hex_str(ds_list_size(dl_remaining_keys));
    repeat(1){sdm(""); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";}
    sdm(debug_str);    dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
    repeat(1){sdm(""); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";}
    }
}








// TODO: Check if this seed will actually need these pieces placed early
if (ContainersHP_START_COUNT<f.CONT_MIN_HP 
||  ContainersMP_START_COUNT<f.CONT_MIN_MP )
{
    Rando_randomize_items_2((f.CONT_MIN_HP-ContainersHP_START_COUNT)*f.CONT_PIECE_PER_HP, (f.CONT_MIN_MP-ContainersMP_START_COUNT)*f.CONT_PIECE_PER_MP);
    //for(_i=ds_list_size(dl_items_placed)-1; _i>=0; _i--) _item_id = dl_items_placed[|_i];
}








// ==============================================================================
// PHASE 2 -----------------------------------
// Add the rest of the progression items
if (DEBUG) repeat(1){sdm(""); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";}
if (DEBUG){debug_str="+++++  Step $"+hex_str(++_rando_step)+": Place progression items."; sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=debug_str;}



var _item_id_can_add_progression=false;


var          _MAX_COUNT = ds_list_size(dl_prog1)<<4; // I'm assuming this count is enough iterations
for(_i=0; _i<_MAX_COUNT; _i++)
{
    if (_i 
    && !_something_was_placed )
    {
        break;//_i
    }
    _something_was_placed=false;
    
    
    if(!ds_list_size(dl_prog1) 
    || !ds_list_size(dl_locations_remaining) )
    {
        break;//_i
    }
    
    
    
    
    
    
    ds_list_copy(       dl_prog2,dl_prog1);
    for(_j=ds_list_size(dl_prog2)-1; _j>=0; _j--)
    {
        _item_id =      dl_prog2[|_j];
        
        if (ds_list_find_index(dl_items_placed,_item_id)!=-1)
        {
            continue;//_j
        }
        
        
        
        Rando_set_loc_num_options(_item_id); // populates dl_qualified_locations, dl_qualified_locations_new, dl_loc_cats, dl_loc_num_options
        
        
        _item_id_can_add_progression=false;
        if (ds_list_size(dl_qualified_locations)) // Qualified locations for THIS ITEM ONLY
        {
            _town_name  = val(dm_spell_quest[?_item_id+STR_Town+STR_Name]);
            
            //_spell_name = val(g.dm_Spell[?STR_Town+STR_Spell+_town_name]);
            //_spell_name = val(dm_save_data[?string(_town_name)+STR_Spell],string(_spell_name));
            _spell_name = val(dm_save_data[?string(_town_name)+STR_Spell]);
            
            if (ds_list_find_index(dl_prog_spells,_spell_name)!=-1  // if spell can potentially give progress
            &&  Rando_is_qual_location(val(dm_save_data[?STR_Town+STR_Rando+_town_name+"A"])) ) // if town is reachable
            {   // _item_id is a quest item that gives a progression spell 
                _item_id_can_add_progression=true;
            }
            else
            {
                ds_list_copy(_dl_placed_items, dl_items_placed);
                ds_list_add(dl_items_placed, _item_id);
                
                ds_list_copy(_dl_placed_keys, dl_keys_placed);
                Rando_place_keys(0,false); // Adds keys to dl_keys_placed, but NOT to dm_save_data
                
                for(_k=ds_list_size(dl_locations_remaining)-1; _k>=0; _k--)
                {
                    _loc_num =      dl_locations_remaining[|_k];
                    _loc_id  =  val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Location+STR_ID]);
                    if (ds_list_find_index(dl_qualified_locations,_loc_num)==-1 
                    &&  Rando_is_qual_location(string(_loc_id)) )
                    {
                        _item_id_can_add_progression=true;
                        break;//_k
                    }
                }
                
                ds_list_copy(dl_items_placed, _dl_placed_items);
                ds_list_copy(dl_keys_placed,  _dl_placed_keys);
            }
        }
        
        
        
        
        
        //if (_item_id==STR_TROPHY) sdm(STR_TROPHY+": _item_id_can_add_progression "+string(_item_id_can_add_progression)+", ds_list_size(dl_qualified_locations) $"+hex_str(ds_list_size(dl_qualified_locations)));
        
        if (_item_id_can_add_progression 
        &&  ds_list_size(dl_loc_num_options) )
        {
            ds_list_shuffle(dl_loc_num_options);
            _loc_num =      dl_loc_num_options[|0];
            
            if (Rando_set_data_1a(_loc_num, _item_id)) // returns true if it was able to place the item
            {
                _something_was_placed=true;
                ds_list_add(dl_locnum_that_gave_prog,_loc_num);
                
                    _idx =    ds_list_find_index(dl_prog1,_item_id);
                if (_idx!=-1) ds_list_delete(    dl_prog1,_idx);
                    _idx =    ds_list_find_index(dl_locations_remaining,_loc_num);
                if (_idx!=-1) ds_list_delete(    dl_locations_remaining,_idx);
                
                // With another item placed, place as many spells and keys that you can to maximize the number of reachable locations
                Rando_sweep_combo(2);
                if (CONTAINER_METHOD==2) Rando_place_container_pieces(1,1);
                continue;//_j
            }
        }
    }
}

if (DEBUG) repeat(2){sdm(""); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";}
/*
if (DEBUG){         debug_str  = "_i = $"+hex_str(_i);
if (_i>=_MAX_COUNT) debug_str += ".   *** _i MADE IT TO _MAX_COUNT ***";
sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
}
*/

if (DEBUG){debug_str="All items that could've given progression have been placed.";
sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=debug_str;
debug_str  =      "Remaining Locations"+" COUNT $"+hex_str(ds_list_size(dl_locations_remaining));
debug_str += ", "+"Remaining Items"    +" COUNT $"+hex_str(ds_list_size(dl_prog1)+ds_list_size(dl_ItemPool_C));
debug_str += ", "+"Remaining Keys"     +" COUNT $"+hex_str(ds_list_size(dl_remaining_keys));
//sdm("");        dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
//sdm("");        dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
sdm("");        dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
}









// ------------------------------------------------------
// Since keys can be progression, place all remaining keys
if (DEBUG) repeat(1){sdm(""); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";}
if (DEBUG){debug_str="+++++  Step $"+hex_str(++_rando_step)+": Since keys can be progression, place all remaining keys."; sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=debug_str;}

_count1=ds_list_size(dl_remaining_keys);
Rando_place_keys(_count1,true);

if (DEBUG && ds_list_size(dl_remaining_keys)!=_count1){
debug_str  =      "Remaining Locations"+" COUNT $"+hex_str(ds_list_size(dl_locations_remaining));
debug_str += ", "+"Remaining Items"    +" COUNT $"+hex_str(ds_list_size(dl_prog1)+ds_list_size(dl_ItemPool_C));
debug_str += ", "+"Remaining Keys"     +" COUNT $"+hex_str(ds_list_size(dl_remaining_keys));
//sdm("");        dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
sdm("");        dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
sdm("");        dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
}






// ------------------------------------------------------
if (CONTROL_ALLKEY==1 
&& !KeyLocations_WILL_RANDOMIZE )
{
    _item_id = STR_ALLKEY;
    if (ds_list_find_index(dl_prog1,       _item_id)==-1 
    &&  ds_list_find_index(dl_items_placed,_item_id)==-1 )
    {
        Rando_set_loc_num_options(_item_id);
        if (ds_list_size(   dl_loc_num_options))
        {
            ds_list_shuffle(dl_loc_num_options);
            _loc_num =      dl_loc_num_options[|0];
            
            if (Rando_set_data_1a(_loc_num, _item_id))
            {
                    _idx =    ds_list_find_index(dl_locations_remaining,_loc_num);
                if (_idx!=-1) ds_list_delete(    dl_locations_remaining,_idx);
                
                if (DEBUG){
                _rm_name  = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Rm+STR_Name]);
                _item_num = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Rm+STR_Location+STR_Num]);
                _loc_id   = string(_rm_name)+hex_str(_item_num);
                if(!Rando_is_qual_location(_loc_id,_item_id)) sdm("ALL PROGRESSION ITEMS HAVE BEEN PLACED BUT Rando_is_qual_location() THINKS YOU CANT GET TO:  "+_loc_id+" FOR ITEM "+_item_id);
                }
                
                Rando_sweep_spells();
                Rando_sweep_skills();
                Rando_place_keys(ds_list_size(dl_remaining_keys),true);
            }
        }
    }
}







// ------------------------------------------------------
// Some progression items may have not been able 
// to give any progression with this seed.
if (DEBUG){debug_str="+++++  Step $"+hex_str(++_rando_step)+": Place any potential remaining items that are still in the progression pool."; sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=debug_str;}

_count1=ds_list_size(dl_locations_remaining);
_count2=ds_list_size(dl_prog1);
_count3=ds_list_size(dl_remaining_keys);

ds_list_copy(       dl_list1,dl_prog1);
for(_i=ds_list_size(dl_list1)-1; _i>=0; _i--)
{
    _item_id =      dl_list1[|_i];
    
    if (ds_list_find_index(dl_items_placed,_item_id)==-1)
    {
        Rando_set_loc_num_options(_item_id); // populates dl_qualified_locations, dl_qualified_locations_new, dl_loc_cats, dl_loc_num_options
        
        if (ds_list_size(   dl_loc_num_options))
        {
            ds_list_shuffle(dl_loc_num_options);
            _loc_num =      dl_loc_num_options[|0];
            
            if (Rando_set_data_1a(_loc_num,_item_id)) // if item got placed
            {
                    _idx =    ds_list_find_index(dl_prog1,_item_id);
                if (_idx!=-1) ds_list_delete(    dl_prog1,_idx);
                    _idx =    ds_list_find_index(dl_locations_remaining,_loc_num);
                if (_idx!=-1) ds_list_delete(    dl_locations_remaining,_idx);
                
                if (DEBUG){
                _rm_name  = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Rm+STR_Name]);
                _item_num = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Rm+STR_Location+STR_Num]);
                _loc_id   = string(_rm_name)+hex_str(_item_num);
                if(!Rando_is_qual_location(_loc_id,_item_id)) sdm("Rando_is_qual_location() THINKS YOU CANT GET TO:  "+_loc_id+" FOR ITEM "+_item_id);
                }
                
                // With another item placed, place as many spells and keys that you can to maximize the number of reachable locations
                Rando_sweep_spells();
                Rando_sweep_skills();
                if (CONTAINER_METHOD==2) Rando_place_container_pieces(1,1);
            }
        }
    }
}




// Just in case some things didn't make it
Rando_sweep_spells();
Rando_sweep_skills();
Rando_place_keys(ds_list_size(dl_remaining_keys),true);


if (DEBUG && (_count1!=ds_list_size(dl_locations_remaining) || _count2!=ds_list_size(dl_prog1) || _count3!=ds_list_size(dl_remaining_keys))){
debug_str  =      "Remaining Locations"+" COUNT $"+hex_str(ds_list_size(dl_locations_remaining));
debug_str += ", "+"Remaining Items"    +" COUNT $"+hex_str(ds_list_size(dl_prog1)+ds_list_size(dl_ItemPool_C));
debug_str += ", "+"Remaining Keys"     +" COUNT $"+hex_str(ds_list_size(dl_remaining_keys));
//sdm("");        dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
sdm("");        dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
sdm("");        dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
}





// ------------------------------------------------------
//if (DEBUG){sdm("");sdm("");}
// Some progression items may have not been able 
// to give any progression with this seed.
// Those items will be moved the the non-progression items pool
//if (DEBUG){debug_str="+++++  Step $"+hex_str(++_rando_step)+": Add any potential remaining items in the progression pool to the non-progression pool."; sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=debug_str;}

if (ds_list_size(dl_prog1))
{
    for(_i=ds_list_size(dl_prog1)-1; _i>=0; _i--)
    {
        _item_id =      dl_prog1[|_i];
        if (ds_list_find_index(dl_items_placed,_item_id)==-1 
        &&  ds_list_find_index(dl_ItemPool_C,  _item_id)==-1 )
        {
            ds_list_add(       dl_ItemPool_C,  _item_id);
        }
    }
    
    ds_list_shuffle(dl_ItemPool_C);
}




if (DEBUG){
debug_str  =      "Remaining Locations"+" COUNT $"+hex_str(ds_list_size(dl_locations_remaining));
debug_str += ", "+"Remaining Items"    +" COUNT $"+hex_str(ds_list_size(dl_prog1)+ds_list_size(dl_ItemPool_C));
debug_str += ", "+"Remaining Keys"     +" COUNT $"+hex_str(ds_list_size(dl_remaining_keys));
//sdm("");        dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
sdm("");        dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
sdm("");        dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
}









// ==============================================================================
// PHASE 3 -----------------------------------
// The remaining items, which give NO progression
if (DEBUG){debug_str="+++++  Step $"+hex_str(++_rando_step)+": Place ALL remaining items."; sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=debug_str;}
var _dl_remaining_items=ds_list_create();



_count1=ds_list_size(dl_locations_remaining);
_count2=ds_list_size(dl_prog1)+ds_list_size(dl_ItemPool_C);
_count3=ds_list_size(dl_remaining_keys);


// It seems like it's a common occurance to not find 
// many container pieces until you're well into the 
// seed. This can lead to scenarios where you either 
// need to be an expert player or you have to suffer 
// lengthy grinding to get strong enough.
// This is an attempt to fix that.
// I'm not sure if adding all the container pieces 
// before everything else will help.
if (isVal(CONTAINER_METHOD,3))
{   // Place pieces equal to X number of containers in beginning areas
    Rando_randomize_items_2(f.CONT_PIECE_PER_HP*2, f.CONT_PIECE_PER_MP*2);
}
//Rando_place_container_pieces(1,1);
//ds_list_size(dl_placed_containers_hp)


// Place the remaining containers
if (isVal(CONTAINER_METHOD,1,2,3))
{
           ds_list_copy(_dl_remaining_items,dl_ItemPool_C);
    for(_i=ds_list_size(_dl_remaining_items)-1; _i>=0; _i--)
    {
        if(!ds_list_size(dl_locations_remaining))
        {
            break;//_i
        }
        
        _item_id = _dl_remaining_items[|_i];
        if (string_pos(STR_HEART,_item_id) 
        ||  string_pos(STR_MAGIC,_item_id) )
        {
            ds_list_clear(dl_loc_num_options);
            for(_j=ds_list_size(dl_locations_remaining)-1; _j>=0; _j--)
            {
                _loc_num =      dl_locations_remaining[|_j];
                _loc_id  = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Location+STR_ID]);
                if (Rando_is_qual_location(string(_loc_id), _item_id))
                {
                    //LocCatID_West01,LocCatID_West02,LocCatID_DMtn01,LocCatID_NIsl01,LocCatID_Town01,LocCatID_Nabo01,LocCatID_Daru01,LocCatID_Kasu01,LocCatID_Maze01
                    _val = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Obscure], -1);
                    if (_val==0) _count=3; // give better chance of non-obscure locations being picked
                    //if (_val==0) _count=2; // give better chance of non-obscure locations being picked
                    else         _count=1;
                    repeat(_count) ds_list_add(dl_loc_num_options,_loc_num);
                }
            }
            
            
            if (ds_list_size(   dl_loc_num_options))
            {
                ds_list_shuffle(dl_loc_num_options);
                _loc_num =      dl_loc_num_options[|0];
                
                if (Rando_set_data_1a(_loc_num, _item_id))
                {
                        _idx =    ds_list_find_index(dl_locations_remaining,_loc_num);
                    if (_idx!=-1) ds_list_delete(    dl_locations_remaining,_idx);
                        _idx =    ds_list_find_index(dl_ItemPool_C,_item_id);
                    if (_idx!=-1) ds_list_delete(    dl_ItemPool_C,_idx);
                    
                    if (DEBUG){
                    _rm_name  = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Rm+STR_Name]);
                    _item_num = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Rm+STR_Location+STR_Num]);
                    _loc_id   = string(_rm_name)+hex_str(_item_num);
                    if(!Rando_is_qual_location(_loc_id,_item_id)) sdm("ALL PROGRESSION ITEMS HAVE BEEN PLACED BUT Rando_is_qual_location() THINKS YOU CANT GET TO:  "+_loc_id+" FOR ITEM "+_item_id);
                    }
                }
            }
        }
    }
}







// Place any remaining items
       ds_list_copy(_dl_remaining_items,dl_ItemPool_C);
for(_i=ds_list_size(_dl_remaining_items)-1; _i>=0; _i--)
{
    if(!ds_list_size(dl_locations_remaining))
    {
        break;//_i
    }
    
    _loc_num = dl_locations_remaining[|0];
    _item_id = _dl_remaining_items[|_i];
    
    if (Rando_set_data_1a(_loc_num, _item_id))
    {
            _idx =    ds_list_find_index(dl_locations_remaining,_loc_num);
        if (_idx!=-1) ds_list_delete(    dl_locations_remaining,_idx);
            _idx =    ds_list_find_index(dl_ItemPool_C,_item_id);
        if (_idx!=-1) ds_list_delete(    dl_ItemPool_C,_idx);
        
        if (DEBUG){
        _rm_name  = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Rm+STR_Name]);
        _item_num = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Rm+STR_Location+STR_Num]);
        _loc_id   = string(_rm_name)+hex_str(_item_num);
        if(!Rando_is_qual_location(_loc_id,_item_id)) sdm("ALL PROGRESSION ITEMS HAVE BEEN PLACED BUT Rando_is_qual_location() THINKS YOU CANT GET TO:  "+_loc_id+" FOR ITEM "+_item_id);
        }
        
        //Rando_sweep_spells();
        //Rando_sweep_skills();
        //Rando_place_keys(ds_list_size(dl_remaining_keys),true);
    }
}



if (DEBUG && (_count1!=ds_list_size(dl_locations_remaining) || _count2!=ds_list_size(dl_prog1)+ds_list_size(dl_ItemPool_C) || _count3!=ds_list_size(dl_remaining_keys))){
//if (DEBUG){
debug_str="All items should now be placed."; sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=debug_str;
debug_str  =      "Remaining Locations"+" COUNT $"+hex_str(ds_list_size(dl_locations_remaining));
debug_str += ", "+"Remaining Items"    +" COUNT $"+hex_str(ds_list_size(dl_prog1)+ds_list_size(dl_ItemPool_C));
debug_str += ", "+"Remaining Keys"     +" COUNT $"+hex_str(ds_list_size(dl_remaining_keys));
//sdm("");        dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
sdm("");        dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
sdm("");        dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
}




/*
// -----------------------------------------------------------------
// There SHOULD be 1 item remaining for SafeLocation_LOC_NUM
if (ds_list_size(   dl_ItemPool_C))
{
    _item_id =      dl_ItemPool_C[|0];
    _loc_num = SafeLocation_LOC_NUM;
    
    if (Rando_set_data_1a(_loc_num, _item_id))
    {
            _idx =    ds_list_find_index(dl_ItemPool_C,_item_id);
        if (_idx!=-1) ds_list_delete(    dl_ItemPool_C,_idx);
        
        Rando_sweep_spells();
        Rando_sweep_skills();
        Rando_place_keys(ds_list_size(dl_remaining_keys),true);
        
        if (DEBUG){
        debug_str = _item_id+" placed at SafeLocation_LOC_NUM $"+hex_str(SafeLocation_LOC_NUM);
        sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
        _rm_name  = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Rm+STR_Name], "undefined");
        _item_num = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Rm+STR_Location+STR_Num]);
        _loc_id   = _rm_name+hex_str(_item_num);
        if(!Rando_is_qual_location(_loc_id,_item_id)) sdm("ALL PROGRESSION ITEMS HAVE BEEN PLACED BUT Rando_is_qual_location() THINKS YOU CANT GET TO:  "+_loc_id+" FOR ITEM "+_item_id);
        }
    }
}
*/






_count1=ds_list_size(dl_locations_remaining);
_count2=ds_list_size(dl_prog1)+ds_list_size(dl_ItemPool_C);
_count3=ds_list_size(dl_remaining_keys);

Rando_sweep_spells();
Rando_sweep_skills();
Rando_place_keys(ds_list_size(dl_remaining_keys),true);

//
if (DEBUG && (_count1!=ds_list_size(dl_locations_remaining) || _count2!=ds_list_size(dl_prog1)+ds_list_size(dl_ItemPool_C) || _count3!=ds_list_size(dl_remaining_keys))){
debug_str  =      "Remaining Locations"+" COUNT $"+hex_str(ds_list_size(dl_locations_remaining));
debug_str += ", "+"Remaining Items"    +" COUNT $"+hex_str(ds_list_size(dl_prog1)+ds_list_size(dl_ItemPool_C));
debug_str += ", "+"Remaining Keys"     +" COUNT $"+hex_str(ds_list_size(dl_remaining_keys));
//sdm("");        dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
sdm("");        dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
sdm("");        dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
}










// ==============================================================================
if (DEBUG)
{
    sdm(""); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
    _count=ds_list_size(dl_ItemPool_C);
    debug_str = "Remaining Items COUNT $"+hex_str(_count);
    sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
    
    for(_i=0; _i<_count; _i++){
        debug_str  = "item "+dl_ItemPool_C[|_i]+"  did NOT get placed!";
        sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
    }
    
    
    
    
    //sdm(""); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
    _count=ds_list_size(dl_locations_remaining);
    debug_str = "Remaining Locations COUNT $"+hex_str(_count);
    sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
    
    for(_i=0; _i<_count; _i++){
        _loc_num = dl_locations_remaining[|_i];
        _rm_name  = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Rm+STR_Name]);
        _item_num = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Rm+STR_Location+STR_Num]);
        _loc_id   = string(_rm_name)+hex_str(_item_num);
        
        debug_str  = "loc_num $"+hex_str(_loc_num)+", loc_id "+_loc_id+"  did NOT get used!";
        debug_str += "  - "+val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Description], "location?");
        sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
    }
    
    
    //sdm(""); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
    
    
    
    
    _count=ds_list_size(dl_remaining_keys);
    debug_str = "Remaining Keys COUNT $"+hex_str(_count);
    sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
    
    for(_i=0; _i<_count; _i++){
        debug_str  = "key "+dl_remaining_keys[|_i]+"  did NOT get placed!";
        sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
    }
    
    
    sdm(""); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
}













ds_list_destroy(dl_placed_containers_hp); dl_placed_containers_hp=undefined;
ds_list_destroy(dl_placed_containers_mp); dl_placed_containers_mp=undefined;

ds_list_destroy(_dl_placed_items); _dl_placed_items=undefined;
ds_list_destroy(_dl_placed_keys); _dl_placed_keys=undefined;
ds_list_destroy(_dl_remaining_items); _dl_remaining_items=undefined;




