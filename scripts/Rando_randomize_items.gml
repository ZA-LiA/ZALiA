/// Rando_randomize_items()


//.........................................................
random_set_seed(Rando_SEED);
//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''


var _i,_j,_k,_m, _idx, _val;
var _count,_count1,_count2,_count3;
var _loc_num,_loc_num1,_loc_num2, _loc_cat,_loc_cat1;
var _qual_loc_count1,_qual_loc_count2;
var _is_item, _is_key;
var _item_id, _item_num, _key_id, _spell_id, _rm_name, _town_name, _spell_name;
var _something_was_placed = false;
var _rando_step=0;

placement_num=0;

CONTAINER_METHOD=3;

CONTROL_ALLKEY=2;
ALLKEY_LOC_NUM=0;
if (CONTROL_ALLKEY==1) var _ALLKEY_RANDOM_VALUE=irandom(99);
else                   var _ALLKEY_RANDOM_VALUE=0;

FLUTE_LOC_NUM = 0;

var _dm = ds_map_create();

dl_qualified_locations = ds_list_create();
dl_qualified_locations_old = ds_list_create(); // 
dl_qualified_locations_new = ds_list_create(); // 

dl_loc_cats = ds_list_create(); // Location Categories
dl_loc_num_options = ds_list_create(); // 

dl_prog1 = ds_list_create();
dl_prog2 = ds_list_create();


dm_spell_quest = ds_map_create();
//dm_spell_quest[?STR_Spell+STR_Scene+STR_Name+STR_Rauru] = 


FallingKey_LOC_NUM = val(dm_LOCATIONS[?FallingKey_ITEM_ID+STR_Location+STR_Num], FallingKey_LOC_NUM);
FallingKey_LOC_ID  = val(dm_LOCATIONS[?hex_str(FallingKey_LOC_NUM)+STR_Location+STR_ID], "undefined");
//sdm("FallingKey_LOC_NUM "+hex_str(FallingKey_LOC_NUM)+", FallingKey_RM_NAME: "+FallingKey_RM_NAME+", FallingKey_LOC_ID: "+FallingKey_LOC_ID+", FallingKey_KEY_ID: "+FallingKey_KEY_ID);



// if certain towns have a progression spell, the quest item should be in pool A, otherwise put the item in pool B.
            dl_prog_spells=ds_list_create();
ds_list_add(dl_prog_spells, STR_JUMP,STR_FAIRY,STR_FIRE,STR_REFLECT,STR_ENIGMA,STR_THUNDER);
if (QUEST_NUM==2) ds_list_add(dl_prog_spells, STR_SUMMON);

for(_i=ds_list_size(dl_spell_sequence_spells)-1; _i>=0; _i--)
{
    _spell_name =   dl_spell_sequence_spells[|_i];
    //sdm("seq spell: "+_spell_name);
    if (ds_list_find_index(dl_prog_spells,_spell_name)==-1)
    {   ds_list_add(       dl_prog_spells,_spell_name);  }
}

/* Set 0 before everytime `Rando_is_qual_location` is run, then set it in `Rando_is_qual_location` if a spell was required for that location.
This is to help determine if more magic containers would be needed for progression, or to avoid having to grind for higher magic levels.
Looks like it'll be pretty complicated to rule out every possibility for every check that DOESN'T require a spell. A different solution may be needed.
One solution may be to lower the cost of spells for rando.
*/
required_spell = 0;

/* In `init_data_spells_1a`
var                         _DK = STR_Rando+STR_Cost+STR_Max;
dm_Spell[?hex_str($0)      +_DK] = min(Container_AMT*3, dg_spell_cost[#0,0]);
dm_Spell[?hex_str(SPL_PRTC)+_DK] = min(Container_AMT*3, dg_spell_cost[#bitNum(SPL_PRTC),0]);
dm_Spell[?hex_str(SPL_JUMP)+_DK] = min(Container_AMT*3, dg_spell_cost[#bitNum(SPL_JUMP),0]);
dm_Spell[?hex_str(SPL_LIFE)+_DK] = min(Container_AMT*3, dg_spell_cost[#bitNum(SPL_LIFE),0]);
dm_Spell[?hex_str(SPL_FARY)+_DK] = min(Container_AMT*4, dg_spell_cost[#bitNum(SPL_FARY),0]);
dm_Spell[?hex_str(SPL_FIRE)+_DK] = min(Container_AMT*2, dg_spell_cost[#bitNum(SPL_FIRE),0]);
dm_Spell[?hex_str(SPL_RFLC)+_DK] = min(Container_AMT*3, dg_spell_cost[#bitNum(SPL_RFLC),0]);
dm_Spell[?hex_str(SPL_SPEL)+_DK] = min(Container_AMT*3, dg_spell_cost[#bitNum(SPL_SPEL),0]);
dm_Spell[?hex_str(SPL_THUN)+_DK] = min(Container_AMT*5, dg_spell_cost[#bitNum(SPL_THUN),0]);
dm_Spell[?hex_str(SPL_SUMM)+_DK] = min(Container_AMT*3, dg_spell_cost[#bitNum(SPL_SUMM),0]);
*/

//dm_save_data[?STR_Spell+STR_Cost+hex_str(_i)+hex_str(_j)] = _val;
//dm_save_data[?STR_Spell+STR_Cost+spell num+magic level idx] = _val;

/* Proposed required container count for item rando
   old - new
JUMP
  1. 3 - 3
  2. 3 - 2
  3. 2 - 2
  4. 2 - 2
  5. 2 - 1
  6. 1

FAIRY
  1. 5 - 4
  2. 5 - 3
  3. 4 - 3
  4. 4 - 2
  5. 3 - 2
  6. 3 - 2
  7. 3 - 2
  8. 3 - 2
  9. 2 - 2

FIRE
  1. 8 - 4
  2. 5 - 3
  3. 4 - 2
  4. 2 - 2
  5. 1 - 
  6. 1 - 

REFLECT
  1. 8 - 4
  2. 8 - 3
  3. 5 - 3
  4. 3 - 2
  5. 3 - 2
  6. 2 - 2
  7. 2 - 1
  8. 1

ENIGMA
  1. 8 - 4
  2. 7 - 3
  3. 6 - 3
  4. 5 - 2
  5. 3 - 2
  6. 2 - 2
  7. 2 - 1
  8. 1

THUNDER
  1. 8 - 5
  2. 8 - 4
  3. 8 - 4
  4. 8 - 3
  5. 8 - 3
  6. 8 - 3
  7. 7 - 3
  8. 4 - 2
  9. 3 - 2
*/
if (0)
{
    for(_i=ds_grid_width(g.dg_spell_cost)-1; _i>=1; _i--) // Each spell
    {
        var _SPELL_BIT = $1<<(_i-1);
        for(_j=0; _j<=8; _j++) // Each magic level
        {
            var _cost_old = g.dg_spell_cost[#_SPELL_BIT,_j];
                _cost_old = val(dm_save_data[?STR_Spell+STR_Cost+hex_str(_i)+hex_str(_j)], _cost_old);
            var _cost_new = _cost_old;
            switch(_SPELL_BIT)
            {
                case SPL_JUMP:{
                switch(_j){
                case 0:{_cost_new=min(Container_AMT*3,_cost_old); break;}
                case 1:{_cost_new=min(Container_AMT*2,_cost_old); break;}
                case 2:{_cost_new=min(Container_AMT*2,_cost_old); break;}
                case 3:{_cost_new=min(Container_AMT*2,_cost_old); break;}
                case 4:{_cost_new=min(Container_AMT*1,_cost_old); break;}
                }
                break;}
                
                case SPL_FARY:{
                switch(_j){
                case 0:{_cost_new=min(Container_AMT*4,_cost_old); break;}
                case 1:{_cost_new=min(Container_AMT*3,_cost_old); break;}
                case 2:{_cost_new=min(Container_AMT*3,_cost_old); break;}
                case 3:{_cost_new=min(Container_AMT*2,_cost_old); break;}
                case 4:{_cost_new=min(Container_AMT*2,_cost_old); break;}
                case 5:{_cost_new=min(Container_AMT*2,_cost_old); break;}
                case 6:{_cost_new=min(Container_AMT*2,_cost_old); break;}
                case 7:{_cost_new=min(Container_AMT*2,_cost_old); break;}
                case 8:{_cost_new=min(Container_AMT*2,_cost_old); break;}
                }
                break;}
                
                case SPL_FIRE:{
                switch(_j){
                case 0:{_cost_new=min(Container_AMT*4,_cost_old); break;}
                case 1:{_cost_new=min(Container_AMT*3,_cost_old); break;}
                case 2:{_cost_new=min(Container_AMT*2,_cost_old); break;}
                case 3:{_cost_new=min(Container_AMT*2,_cost_old); break;}
                }
                break;}
                
                case SPL_SPEL:{
                switch(_j){
                case 0:{_cost_new=min(Container_AMT*4,_cost_old); break;}
                case 1:{_cost_new=min(Container_AMT*3,_cost_old); break;}
                case 2:{_cost_new=min(Container_AMT*3,_cost_old); break;}
                case 3:{_cost_new=min(Container_AMT*2,_cost_old); break;}
                case 4:{_cost_new=min(Container_AMT*2,_cost_old); break;}
                case 5:{_cost_new=min(Container_AMT*2,_cost_old); break;}
                case 5:{_cost_new=min(Container_AMT*1,_cost_old); break;}
                }
                break;}
                
                case SPL_RFLC:{
                switch(_j){
                case 0:{_cost_new=min(Container_AMT*4,_cost_old); break;}
                case 1:{_cost_new=min(Container_AMT*3,_cost_old); break;}
                case 2:{_cost_new=min(Container_AMT*3,_cost_old); break;}
                case 3:{_cost_new=min(Container_AMT*2,_cost_old); break;}
                case 4:{_cost_new=min(Container_AMT*2,_cost_old); break;}
                case 5:{_cost_new=min(Container_AMT*2,_cost_old); break;}
                case 6:{_cost_new=min(Container_AMT*1,_cost_old); break;}
                }
                break;}
                
                case SPL_THUN:{
                switch(_j){
                case 0:{_cost_new=min(Container_AMT*5,_cost_old); break;}
                case 1:{_cost_new=min(Container_AMT*4,_cost_old); break;}
                case 2:{_cost_new=min(Container_AMT*4,_cost_old); break;}
                case 3:{_cost_new=min(Container_AMT*3,_cost_old); break;}
                case 4:{_cost_new=min(Container_AMT*3,_cost_old); break;}
                case 5:{_cost_new=min(Container_AMT*3,_cost_old); break;}
                case 6:{_cost_new=min(Container_AMT*3,_cost_old); break;}
                case 7:{_cost_new=min(Container_AMT*2,_cost_old); break;}
                case 8:{_cost_new=min(Container_AMT*2,_cost_old); break;}
                }
                break;}
            }
            
            dm_save_data[?STR_Spell+STR_Cost+hex_str(_i)+hex_str(_j)] = _cost_new;
        }
    }
}




//sdm("ItemLocations_RANDO_METHOD: "+string(ItemLocations_RANDO_METHOD));



dl_remaining_keys = ds_list_create();
ds_list_copy(dl_remaining_keys,dl_KEYS);
if (KeyLocations_WILL_RANDOMIZE)
{
    ds_list_shuffle(dl_remaining_keys);
}








// ItemPool_A: Progression items
            dl_ItemPool_A = ds_list_create();
ds_list_add(dl_ItemPool_A, STR_CANDLE);
ds_list_add(dl_ItemPool_A, STR_GLOVE);
ds_list_add(dl_ItemPool_A, STR_RAFT);
ds_list_add(dl_ItemPool_A, STR_BOOTS);
ds_list_add(dl_ItemPool_A, STR_FLUTE);
ds_list_add(dl_ItemPool_A, STR_CROSS);
ds_list_add(dl_ItemPool_A, STR_HAMMER);
ds_list_add(dl_ItemPool_A, STR_BRACELET);
ds_list_add(dl_ItemPool_A, STR_BOOK);
ds_list_add(dl_ItemPool_A, STR_RFAIRY); // The Mido fairy gives a reward if you have Rescue Fairy.
//                                                      //
ds_list_add(dl_ItemPool_A, STR_NOTE);

if(!KeyLocations_WILL_RANDOMIZE)
{
    switch(CONTROL_ALLKEY){
    case 0:{                            ds_list_add(dl_ItemPool_A, STR_ALLKEY); break;}
    case 1:{if (_ALLKEY_RANDOM_VALUE<2) ds_list_add(dl_ItemPool_A, STR_ALLKEY); break;}
    }
}


                          _item_id=STR_TROPHY;
dm_spell_quest[?          _item_id+STR_Town+STR_Name] = STR_Ruto;
ds_list_add(dl_ItemPool_A,_item_id);
//                                                                  //
                          _item_id=STR_MIRROR;
dm_spell_quest[?          _item_id+STR_Town+STR_Name] = STR_Saria;
ds_list_add(dl_ItemPool_A,_item_id);
//                                                                  //
                          _item_id=STR_FLOWER;
dm_spell_quest[?          _item_id+STR_Town+STR_Name] = STR_Mido;
ds_list_add(dl_ItemPool_A,_item_id);
//                                                                  //
                          _item_id=STR_CHILD;
dm_spell_quest[?          _item_id+STR_Town+STR_Name] = STR_Darunia;
ds_list_add(dl_ItemPool_A,_item_id);
//                                                                  //
if (QUEST_NUM==2)
{                             _item_id=STR_MASK;
    dm_spell_quest[?          _item_id+STR_Town+STR_Name] = STR_Bulblin;
    ds_list_add(dl_ItemPool_A,_item_id);
}
//                                                                  //
//                                                      //
//                                                      //
//                                                      //
//                                                      //
//                                                      //
//                                                      //
            dl_ItemPool_B = ds_list_create();
ds_list_add(dl_ItemPool_B, STR_MEAT);
ds_list_add(dl_ItemPool_B, STR_SHIELD);
ds_list_add(dl_ItemPool_B, STR_RING);
ds_list_add(dl_ItemPool_B, STR_PENDANT);
ds_list_add(dl_ItemPool_B, STR_SWORD);
ds_list_add(dl_ItemPool_B, STR_MAP1);
ds_list_add(dl_ItemPool_B, STR_MAP2);
if (QUEST_NUM==2 && INCLUDE_BOTTLE_LOCATION) ds_list_add(dl_ItemPool_B, STR_BOTTLE);
                                           _a=$01;
ds_list_add(dl_ItemPool_B, STR_1UP+hex_str(_a++));
ds_list_add(dl_ItemPool_B, STR_1UP+hex_str(_a++));
ds_list_add(dl_ItemPool_B, STR_1UP+hex_str(_a++));
if (QUEST_NUM==1) ds_list_add(dl_ItemPool_B, STR_1UP+hex_str(_a++));
//sdm("ds_list_size(dl_ItemPool_B): $"+hex_str(ds_list_size(dl_ItemPool_B)));
//                                                      //
//                                                      //
for(_i=f.CONT_MIN_HP+1; _i<=f.CONT_MAX_HP; _i++)
{
    for(_j=1; _j<=f.CONT_PIECE_PER_HP; _j++)
    {
        ds_list_add(dl_ItemPool_B, STR_HEART+hex_str(_i)+hex_str(_j));
    }
}
//sdm("ds_list_size(dl_ItemPool_B): $"+hex_str(ds_list_size(dl_ItemPool_B)));
//                                                      //
for(_i=f.CONT_MIN_MP+1; _i<=f.CONT_MAX_MP; _i++)
{
    for(_j=1; _j<=f.CONT_PIECE_PER_MP; _j++)
    {
        ds_list_add(dl_ItemPool_B, STR_MAGIC+hex_str(_i)+hex_str(_j));
    }
}
//sdm("ds_list_size(dl_ItemPool_B): $"+hex_str(ds_list_size(dl_ItemPool_B)));
//                                                      //
//                                                      //
if (ItemLocations_INCLUDE_PBAG)
{
                 _count = ds_list_size(dl_PBAGS);
    for(_i=0; _i<_count; _i++) ds_list_add(dl_ItemPool_B,dl_PBAGS[|_i]);
}
//sdm("ds_list_size(dl_ItemPool_B): $"+hex_str(ds_list_size(dl_ItemPool_B)));










// -----------------------------------------------------------
                dl_ItemPool_C = ds_list_create();
ds_list_copy(   dl_ItemPool_C, dl_ItemPool_B);
ds_list_shuffle(dl_ItemPool_C);


ds_list_copy(   dl_prog1, dl_ItemPool_A);
ds_list_shuffle(dl_prog1);





if (CONTROL_ALLKEY==1 
&& !KeyLocations_WILL_RANDOMIZE 
&&  ds_list_find_index(dl_ItemPool_A,STR_ALLKEY)==-1 )
{
    if (_ALLKEY_RANDOM_VALUE<8)
    {
        ds_list_add(dl_ItemPool_A,STR_ALLKEY);
        
        _count  = ds_list_size(dl_prog1);
        _count1 = _count div 3;
        _idx    = _count-2;
        _idx   -= _count1;
        _idx=irandom_range(_idx, _idx+_count1);
        ds_list_insert(dl_prog1, _idx, STR_ALLKEY);
    }
}
//if (DEBUG){debug_str="Item pools set."; sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=debug_str;}














// -----------------------------------------------------------
// A location that doesn't require anything else to obtain the item at it once in its room
SafeLocation_LOC_NUM = -1;
/* // *** I don't think this is actually necessary..
if (ds_list_size(    dl_SAFE_LOCATION_NUMS)){
    ds_list_shuffle( dl_SAFE_LOCATION_NUMS);
SafeLocation_LOC_NUM=dl_SAFE_LOCATION_NUMS[|0];
}*/



// -----------------------------------------------------------
ds_list_clear(dl_locations_remaining);

for(_i=ds_list_size(dl_item_location_NUMS)-1; _i>=0; _i--)
{
        _loc_num =  dl_item_location_NUMS[|_i];
    if (_loc_num!=SafeLocation_LOC_NUM)
    {
        if(!KeyLocations_WILL_RANDOMIZE 
        ||  _loc_num != val(dm_LOCATIONS[?STR_ALLKEY+STR_Location+STR_Num]) )
        {
            ds_list_add(dl_locations_remaining, _loc_num);
        }
    }
}

if (ItemLocations_INCLUDE_PBAG)
{
    for(_i=ds_list_size(dl_pbag_location_NUMS)-1; _i>=0; _i--)
    {
            _loc_num =  dl_pbag_location_NUMS[|_i];
        if (_loc_num!=SafeLocation_LOC_NUM)
        {   ds_list_add(dl_locations_remaining, _loc_num);  }
    }
}

if (KeyLocations_WILL_RANDOMIZE)
{
    for(_i=ds_list_size(dl_key_location_NUMS)-1; _i>=0; _i--)
    {
            _loc_num =  dl_key_location_NUMS[|_i];
        if (_loc_num!=  FallingKey_LOC_NUM 
        &&  _loc_num!=SafeLocation_LOC_NUM )
        {   ds_list_add(dl_locations_remaining, _loc_num);  }
    }
}


ds_list_shuffle(dl_locations_remaining);

//if (DEBUG){debug_str="dl_locations_remaining set."; sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=debug_str;}







// -----------------------------------------------------------
if (DEBUG){
repeat(2){sdm(""); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";}
debug_str = "--- ITEM LOCATION RANDO ---";
sdm(debug_str);    dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;

debug_str  =      "Remaining Locations"+" COUNT $"+hex_str(ds_list_size(dl_locations_remaining));
debug_str += ", "+"Remaining Items"    +" COUNT $"+hex_str(ds_list_size(dl_prog1)+ds_list_size(dl_ItemPool_C));
debug_str += ", "+"Remaining Keys"     +" COUNT $"+hex_str(ds_list_size(dl_remaining_keys));
repeat(1){sdm(""); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";}
sdm(debug_str);    dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
repeat(2){sdm(""); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";}
}




// -----------------------------------------------------------
if(!ds_list_size(dl_locations_remaining))
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}

if(0){
_count=ds_list_size(dl_prog1);
for(_i=0; _i<_count; _i++) sdm("dl_prog1[|$"+hex_str(_i)+"] = "+dl_prog1[|_i]);
sdm("");
}






Rando_randomize_items_1();
//if (isVal(ItemLocations_RANDO_METHOD,1,2)) Rando_randomize_items_1();
//else                                       Rando_randomize_items_2();








// Scene outside of Fire-Vines Cave
dm_save_data[?Area_WestA+"40"+dk_FileName+STR_Quest+hex_str(QUEST_NUM)] = "WestA_"+"002";









// ----------------------------------------------------------------------
// ----------------------------------------------------------------------
// Randomize MAP sellers prices
random_set_seed(Rando_SEED);

if (DEBUG){sdm(""); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]="";}

var _pbag_price_min = 0;
var _pbag_price_max = 0;
var _total=0;
var _item_id2 = undefined;
var _version = 1;
var _objver1 = undefined;
var _val1,_val2,_val3;
var _min,_max;
var _datakey = undefined;
var _item_type = undefined;
var _location_num_ = 0;

_count=val(dm_LOCATIONS[?STR_Total+STR_Location+STR_Count]);
for(_i=1; _i<=_count; _i++)
{
    _location_num_ = hex_str(_i);
    _item_type = dm_LOCATIONS[?_location_num_+STR_Item+STR_Type];
    if(!is_undefined(_item_type))
    {
        if (_item_type==STR_MAP1 
        ||  _item_type==STR_MAP2 )
        {
            _item_id = dm_save_data[?STR_Location+_location_num_+STR_Item+STR_ID+STR_Randomized];
            if(!is_undefined(_item_id))
            {
                var                                      _TYPE=1; // keys, progression items, support items, 
                     if (string_pos(STR_PBAG, _item_id)) _TYPE=2;
                else if (string_pos(STR_HEART,_item_id)) _TYPE=3;
                else if (string_pos(STR_MAGIC,_item_id)) _TYPE=3;
                else if (string_pos(STR_1UP,  _item_id)) _TYPE=3;
                
                switch(_TYPE)
                {   // ----------------------------------------------------------------
                    default:{ // _TYPE==1. keys, progression items, support items, 
                    _max = 2000;
                    _min = 300;
                    
                    // So the player doesn't get stuck grinding for xp to get past the first area.
                    if (TownLocations_WILL_RANDOMIZE)
                    {   // TODO: Be more specific and check if the player will need the item to get past the first area.
                        if (val(dm_save_data[?STR_Town+STR_Rando+STR_Rauru+"B"])==STR_Nabooru 
                        ||  val(dm_save_data[?STR_Town+STR_Rando+STR_Rauru+"B"])==STR_New_Kasuto 
                        ||  val(dm_save_data[?STR_Town+STR_Rando+STR_Ruto +"B"])==STR_Nabooru 
                        ||  val(dm_save_data[?STR_Town+STR_Rando+STR_Ruto +"B"])==STR_New_Kasuto )
                        {
                            if (string_pos(STR_KEY,_item_id) 
                            ||  ds_list_find_index(dl_ItemPool_A,_item_id)!=-1 )
                            {
                                _max = 800;
                            }
                        }
                    }
                    break;}
                    
                    
                    
                    // ----------------------------------------------------------------
                    case 2:{ // PBags
                    if(!_pbag_price_max)
                    {
                        _count2=0;
                        
                                     _count1 = ds_list_size(dl_PBAGS);
                        for(_j=0; _j<_count1; _j++)
                        {
                            _item_id2 = string(dl_PBAGS[|_j]);
                            _version  = val(g.dm_spawn[?_item_id2+STR_Version]);
                            _objver1  = object_get_name(ItmE0) + hex_str(_version);
                            _idx = val(g.dm_go_prop[?_objver1+STR_XP], -1);
                            if (_idx+1)
                            {
                                _val2 = g.dl_XP[|_idx];
                                if (XP_WILL_RANDOMIZE) _val2 = val(dm_save_data[?STR_XP+hex_str(_idx)], _val2);
                                if (_val2)
                                {
                                    _total += _val2;
                                    _count2++;
                                }
                            }
                        }
                        
                        if (_total 
                        &&  _total>=_count2 )
                        {
                            _val3 = round(_total/_count2);
                            if (_val3)
                            {
                                _val2 = 100;
                                _val3 = max(_val2+50, _val3);
                                _pbag_price_max = _val3+_val2;
                                _pbag_price_min = _val3-_val2;
                            }
                        }
                    }
                    
                    
                    if (_pbag_price_max)
                    {
                        _max = _pbag_price_max;
                        _min = _pbag_price_min;
                    }
                    else
                    {
                        _max = 550;
                        _min = 350;
                    }
                    break;}
                    
                    
                    
                    // ----------------------------------------------------------------
                    case 3:{ // Container Pieces, 1UP, 
                    _max = 4000;
                    _min = 300;
                    break;}
                }
                
                
                
                
                _min = max(1,_min);
                _max = max(_min+100,_max);
                _val = irandom(_max-_min) + _min;
                _val = clamp(_val, _min,_max);
                
                _datakey = STR_Map+string(1+(_item_type==STR_MAP2));
                dm_save_data[?_datakey+STR_Cost] = _val;
                
                if (DEBUG){debug_str = _datakey+", _min: "+string(_min)+", _max: "+string(_max)+", _val: "+string(_val)+", _item_id: "+_item_id+", _TYPE: "+string(_TYPE);
                sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
                }
            }
        }
    }
}




















// ==============================================================================
ds_map_destroy(_dm); _dm=undefined;

ds_list_destroy(dl_remaining_keys); dl_remaining_keys=undefined;
ds_list_destroy(dl_qualified_locations); dl_qualified_locations=undefined;
ds_list_destroy(dl_qualified_locations_old); dl_qualified_locations_old=undefined;
ds_list_destroy(dl_qualified_locations_new); dl_qualified_locations_new=undefined;

ds_list_destroy(dl_prog1); dl_prog1=undefined;
ds_list_destroy(dl_prog2); dl_prog2=undefined;

ds_list_destroy(dl_prog_spells); dl_prog_spells=undefined;
ds_map_destroy(dm_spell_quest); dm_spell_quest=undefined;

ds_list_destroy(dl_loc_cats); dl_loc_cats=undefined;
ds_list_destroy(dl_loc_num_options); dl_loc_num_options=undefined;





