/// Rando_set_data_1a(loc num, item id)


var _i, _a, _idx, _val, _num, _count;
var _obj, _ver;
var _datakey;
var _loc_num, _loc_id;

                               _a=0;
var _LOC_NUM =        argument[_a++];
var _ITEM_ID = string(argument[_a++]);

var                                      _ITEM_TYPE=_ITEM_ID;
     if (string_pos(STR_HEART,_ITEM_ID)) _ITEM_TYPE=STR_HEART;
else if (string_pos(STR_MAGIC,_ITEM_ID)) _ITEM_TYPE=STR_MAGIC;
else if (string_pos(STR_1UP,  _ITEM_ID)) _ITEM_TYPE=STR_1UP;
else if (string_pos(STR_PBAG, _ITEM_ID)) _ITEM_TYPE=STR_PBAG;
else if (string_pos(STR_KEY,  _ITEM_ID)) _ITEM_TYPE=STR_KEY;


var _is_already_placed=false;

var _IS_SPELL = Rando_is_spell(_ITEM_ID);
if (_IS_SPELL)
{
    if (ds_list_find_index(dl_spells_placed,_ITEM_ID)==-1)
    {   ds_list_add(       dl_spells_placed,_ITEM_ID);  }
    else _is_already_placed=true;
}
else if (string_pos(STR_KEY,_ITEM_ID))
{
    if (ds_list_find_index(dl_keys_placed,_ITEM_ID)==-1)
    {   ds_list_add(       dl_keys_placed,_ITEM_ID);  }
    else _is_already_placed=true;
}
else
{
    if (ds_list_find_index(dl_items_placed,_ITEM_ID)==-1)
    {   ds_list_add(       dl_items_placed,_ITEM_ID);  }
    else _is_already_placed=true;
    
    if(!_is_already_placed)
    {
        switch(_ITEM_ID)
        {
            case STR_FLUTE:{
            FLUTE_LOC_NUM=_LOC_NUM;
            break;}//case STR_FLUTE
            
            case STR_ALLKEY:{
            if (CONTROL_ALLKEY==1) ALLKEY_LOC_NUM=_LOC_NUM;
            //sdm("ALLKEY location num: $"+hex_str(_LOC_NUM));
            break;}//case STR_ALLKEY
        }//switch(_ITEM_ID)
    }
}

if (_is_already_placed)
{
    sdm("*** "+_ITEM_ID+" HAS ALREADY BEEN PLACED!! ***");
    return false;
}





if (_ITEM_TYPE==STR_HEART)
{
    if (ds_list_find_index(dl_placed_containers_hp,_ITEM_ID)==-1)
    {   ds_list_add(       dl_placed_containers_hp,_ITEM_ID);  }
}

if (_ITEM_TYPE==STR_MAGIC)
{
    if (ds_list_find_index(dl_placed_containers_mp,_ITEM_ID)==-1)
    {   ds_list_add(       dl_placed_containers_mp,_ITEM_ID);  }
}








var _DATAKEY = STR_Location+hex_str(_LOC_NUM);


var _SPAWN_DATAKEY = val(dm_LOCATIONS[?hex_str(_LOC_NUM)+STR_Spawn+STR_Datakey], "undefined");
var _RM_NAME       = val(dm_LOCATIONS[?hex_str(_LOC_NUM)+STR_Rm+STR_Name],       "undefined");


dm_save_data[?      _DATAKEY+STR_Spawn+STR_Datakey]          = _SPAWN_DATAKEY;
dm_save_data[?      _DATAKEY+STR_Item+STR_ID+STR_Randomized] = _ITEM_ID;
dm_save_data[?_SPAWN_DATAKEY+STR_Item+STR_ID+STR_Randomized] = _ITEM_ID;
dm_save_data[?_ITEM_ID+STR_Location+STR_Num +STR_Randomized] = _LOC_NUM;








if (_IS_SPELL)
{
    var _TOWN_NAME = val(g.dm_rm[?_RM_NAME+STR_Town+STR_Name]);
    if (ds_list_find_index(dl_TOWN_NAMES,_TOWN_NAME)!=-1)
    {
        dm_save_data[?_DATAKEY+STR_Spell]         = val(dm_save_data[?_TOWN_NAME+STR_Spell], "undefined");
        dm_save_data[?_ITEM_ID+STR_Location]      = _TOWN_NAME;
        
        dm_save_data[?_ITEM_ID+STR_Town+STR_Name] = _TOWN_NAME;
        dm_save_data[?_DATAKEY+STR_Town+STR_Name] = _TOWN_NAME;
    }
    
    debug_str = "SPELL  "+_ITEM_ID+"  PLACED!";
    sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
    return true;
}




placement_num++;




var _OBJ_NAME = val(g.dm_ITEM[?_ITEM_TYPE+STR_Object+STR_Name], "NONE");
var _OBJ      = val(g.dm_ITEM[?_ITEM_TYPE+STR_Object], noone);
var _ITEM_BIT = val(g.dm_ITEM[?_ITEM_TYPE+STR_Bit]);







if (DEBUG){
var _CAN_PRINT=false;
if(!isVal(_ITEM_TYPE,STR_PBAG,STR_KEY) 
||  (_ITEM_TYPE==STR_PBAG && 0) 
||  (_ITEM_TYPE==STR_KEY  && KeyLocations_WILL_RANDOMIZE) )
{
    _CAN_PRINT=true;
}
debug_str  = "$"+hex_str(placement_num)+". ";
debug_str += "loc_num $"+hex_str(_LOC_NUM)+": ";
debug_str += _ITEM_ID;
//debug_str += ".  item id: "+_ITEM_ID;
debug_str += string_repeat(" ", max(0,$A-string_length(_ITEM_ID)));
debug_str += ".  ";
debug_str += _RM_NAME;
debug_str += " - "+val(dm_LOCATIONS[?hex_str(_LOC_NUM)+STR_Description], "location?");
if (_CAN_PRINT) sdm(debug_str);
dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
_count = ds_list_size(dl_items_placed)+ds_list_size(dl_keys_placed);
    if (_count && !(_count&$3))
    {
        if (_CAN_PRINT) sdm("");
        dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
    }
}











if (CONTROL_ALLKEY==2 
&&  ALLKEY_LOC_NUM 
&& !KeyLocations_WILL_RANDOMIZE 
&&  _ITEM_ID!=STR_ALLKEY 
&&  ds_list_find_index(dl_items_placed,STR_ALLKEY)==-1 )
{
    _loc_num = ALLKEY_LOC_NUM;
    _loc_id  = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Location+STR_ID], "undefined");
    if (Rando_is_qual_location(_loc_id) 
    &&  Rando_set_data_1a(_loc_num, STR_ALLKEY) )
    {
            _idx =    ds_list_find_index(dl_locations_remaining,_loc_num);
        if (_idx!=-1) ds_list_delete(    dl_locations_remaining,_idx);
    }
}



if (KeyLocations_WILL_RANDOMIZE 
&&  _ITEM_ID!=STR_ALLKEY 
&&  ds_list_find_index(dl_items_placed,STR_ALLKEY)==-1 )
{
    _loc_num = val(dm_LOCATIONS[?STR_ALLKEY+STR_Location+STR_Num]);
    _loc_id  = val(dm_LOCATIONS[?hex_str(_loc_num)+STR_Location+STR_ID], "undefined");
    if (Rando_is_qual_location(_loc_id)) Rando_set_data_1a(_loc_num, STR_ALLKEY);
}



if (KeyLocations_WILL_RANDOMIZE 
&& !FallingKey_item_placed 
&&  FallingKey_LOC_NUM!=_LOC_NUM 
&&  FallingKey_ITEM_ID!=_ITEM_ID )
{
    var _FallingKey_item_id = undefined;
    
    if (ItemLocations_INCLUDE_PBAG 
    &&  irandom(1) )
    {
        for(_i=ds_list_size(dl_ItemPool_C)-1; _i>=0; _i--)
        {
            if (ds_list_find_index(dl_PBAGS,dl_ItemPool_C[|_i])!=-1)
            {
                _FallingKey_item_id =       dl_ItemPool_C[|_i];
                break;//_i
            }
        }
    }
    
    if (is_undefined(_FallingKey_item_id) 
    &&  ds_list_size(dl_remaining_keys) )
    {   // *** dl_remaining_keys has already been shuffled
        _FallingKey_item_id = dl_remaining_keys[|0];
    }
    
    if (is_undefined(_FallingKey_item_id) 
    && !is_undefined( FallingKey_ITEM_ID) 
    &&  ds_list_size(      dl_remaining_keys) 
    &&  ds_list_find_index(dl_remaining_keys,FallingKey_ITEM_ID)!=-1  )
    {                _FallingKey_item_id =   FallingKey_ITEM_ID;  }
    
    
    if(!is_undefined(_FallingKey_item_id) 
    &&  Rando_is_qual_location(FallingKey_LOC_ID,  _FallingKey_item_id) 
    &&  Rando_set_data_1a(     FallingKey_LOC_NUM, _FallingKey_item_id) )
    {
        FallingKey_item_placed=true;
            _idx =    ds_list_find_index(dl_ItemPool_C,_FallingKey_item_id);
        if (_idx!=-1) ds_list_delete(    dl_ItemPool_C,_idx);
            _idx =    ds_list_find_index(dl_remaining_keys,_FallingKey_item_id);
        if (_idx!=-1) ds_list_delete(    dl_remaining_keys,_idx);
    }
}







if (ds_list_find_index(dl_ItemPool_A,_ITEM_ID)!=-1)
{
    ds_list_copy(dl_qualified_locations_old,dl_qualified_locations);
}







return true;




