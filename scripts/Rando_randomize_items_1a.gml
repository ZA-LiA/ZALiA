/// Rando_randomize_items_1a()


var _i,_j,_k,_m, _idx, _val,_val1,_val2;
var _count,_count1,_count2;
var _loc_num,_loc_num1,_loc_num2, _loc_cat,_loc_cat1;
var _qual_loc_count1,_qual_loc_count2;
var _is_item, _is_key;
var _item_id, _item_num, _key_id, _spell_id, _rm_name, _town_name, _town_spell, _spell_name;

var _dl_options = ds_list_create();
var _dl_1 = ds_list_create();
var _dl_2 = ds_list_create();
var _dl_town_spell = ds_list_create();
var _dl_town_name  = ds_list_create();

var _dl_QUALIFIED_TOWNS = ds_list_create();
ds_list_add(_dl_QUALIFIED_TOWNS,STR_Ruto,STR_Saria,STR_Mido,STR_Darunia,STR_Old_Kasuto);



// Spell you get from the town in Rauru Woods
_town_name = STR_Rauru;
var _Town1_NAME  = val(dm_save_data[?STR_Town+STR_Rando+_town_name+"B"],_town_name);
var _Town1_SPELL = val(dm_save_data[?_Town1_NAME+STR_Spell], STR_PROTECT);

// Spell you get from the town in Ruto Mtns
_town_name = STR_Ruto;
var _Town2_NAME  = val(dm_save_data[?STR_Town+STR_Rando+_town_name+"B"],_town_name);
var _Town2_SPELL = val(dm_save_data[?_Town2_NAME+STR_Spell], STR_JUMP);

// Spell you get from the town at Saria River
_town_name = STR_Saria;
var _Town3_NAME  = val(dm_save_data[?STR_Town+STR_Rando+_town_name+"B"],_town_name);
var _Town3_SPELL = val(dm_save_data[?_Town3_NAME+STR_Spell], STR_HEAL);








// -------------------------------------------------------------------------------------
// Give a slight chance for a RAFT+HAMMER North Islands route which would open up the East and much of the West
if(!Rando_is_qual_location(STR_Mido) 
&& !Rando_is_qual_location(STR_Saria) 
//&& !Rando_are_attainable(STR_RAFT,STR_HAMMER)  // if can't get at least 1 of these
&& !isVal(_Town1_SPELL,STR_JUMP,STR_FAIRY,STR_FIRE) 
&& !isVal(_Town2_SPELL,STR_JUMP,STR_FAIRY,STR_FIRE) 
&& !isVal(_Town3_SPELL,STR_JUMP,STR_FAIRY,STR_FIRE) )
{
    ds_list_clear(_dl_1);
    if(!Rando_is_attainable(STR_RAFT))   ds_list_add(_dl_1,STR_RAFT);
    if(!Rando_is_attainable(STR_HAMMER)) ds_list_add(_dl_1,STR_HAMMER);
    
    if (ds_list_size(_dl_1) 
    && !irandom($3F) ) // !irandom($3F): 1/64 chance
    {
        for(_i=ds_list_size(_dl_1)-1; _i>=0; _i--)
        {
            _item_id = _dl_1[|_i];
            Rando_randomize_items_1a_1(_item_id);
        }
    }
}








// -------------------------------------------------------------------------------------
if(!Rando_is_qual_location(STR_Mido) 
&& !Rando_is_qual_location(STR_Saria) )
{
    // 00000000000000000000000000000000000000000000000000000000000000000000000000
    // 000: Pick what will get you out of beginning area
    
    //val(g.dm_rm[?STR_Spell+STR_Scene+STR_Name+STR_Ruto],Area_TownA+'61')
    ds_list_clear(_dl_options);
    switch(global.Rando_RauruPass_VER)
    {
        case 1:{
        ds_list_add(_dl_options,STR_GLOVE);    // Rauru Pass Cave
        ds_list_add(_dl_options,STR_BRACELET); // Rauru Pass Cave
        ds_list_add(_dl_options,STR_HAMMER);   // Rauru Pass
        break;}
        
        case 2:{
        ds_list_add(_dl_options,STR_GLOVE);    // Rauru Pass Cave
        ds_list_add(_dl_options,STR_BRACELET); // Rauru Pass Cave
        ds_list_add(_dl_options,STR_FLUTE);    // Rauru Pass River Devil
        break;}
        
        case 3:{
        ds_list_add(_dl_options,STR_GLOVE);    // Rauru Pass
        ds_list_add(_dl_options,STR_BRACELET); // Rauru Pass
        break;}
    }
    
    ds_list_clear(_dl_town_name);
    ds_list_add(  _dl_town_name,_Town1_NAME,_Town2_NAME);
    
    ds_list_clear(_dl_town_spell);
    ds_list_add(  _dl_town_spell,_Town1_SPELL,_Town2_SPELL);
    
    
    for(_i=ds_list_size(_dl_town_name)-1; _i>=0; _i--)
    {
        _town_name  = _dl_town_name[|_i];
        _town_spell = _dl_town_spell[|_i];
        if (isVal(_town_spell,STR_JUMP,STR_FIRE)  // JUMP Caves or Fire-Vines Cave
        &&  ds_list_find_index(_dl_QUALIFIED_TOWNS,_town_name)!=-1 )
        {
            if (_town_spell!=STR_JUMP 
            ||  ItemLocations_DARKROOM_DIFFICULTY>=1 )
            {
                switch(_town_name){
                case STR_Ruto:      {ds_list_add(_dl_options,STR_TROPHY); break;}
                case STR_Saria:     {ds_list_add(_dl_options,STR_MIRROR); break;}
                case STR_Mido:      {ds_list_add(_dl_options,STR_FLOWER); break;}
                case STR_Darunia:   {ds_list_add(_dl_options,STR_CHILD);  break;}
                case STR_Old_Kasuto:{ds_list_add(_dl_options,STR_CROSS);  break;}
                }
            }
        }
    }
    
    
    if (ds_list_size(_dl_options))
    {
        ds_list_shuffle(_dl_options);
        _item_id =      _dl_options[|0];
        Rando_randomize_items_1a_1(_item_id);
    }
    // 00000000000000000000000000000000000000000000000000000000000000000000000000
}








if(!Rando_is_qual_location(STR_Mido) 
&&  Rando_is_qual_location(STR_Saria) )
{
    // 1111111111111111111111111111111111111111111111111111111111111111111111111
    // 111: Here decides what route to take; Mido Boulder Pass, Fire-Vines Cave, Saria Bridge by NOTE or JUMP+FAIRY
    
    ds_list_clear(_dl_town_name);
    ds_list_add(  _dl_town_name,_Town1_NAME,_Town2_NAME,_Town3_NAME);
    
    ds_list_clear(_dl_town_spell);
    ds_list_add(  _dl_town_spell,_Town1_SPELL,_Town2_SPELL,_Town3_SPELL);
    
    
    ds_list_clear(_dl_options);
    ds_list_add(_dl_options,STR_HAMMER); // Mido Boulder Pass
    ds_list_add(_dl_options,STR_NOTE);   // Saria Bridge by NOTE
    
    // Fire-Vines Cave route already got a chance in the above code.
    // I'm not sure if it should get another chance.
    // Maybe it should only if _Town3_SPELL is FIRE..
    if (_Town3_SPELL==STR_FIRE)
    //_idx = ds_list_find_index(_dl_town_spell,STR_FIRE);
    //if (_idx!=-1) // Fire-Vines Cave
    {
        _town_name = _Town3_NAME;
        //_town_name = _dl_town_name[|_idx];
        switch(_town_name){
        case STR_Ruto:      {ds_list_add(_dl_options,STR_TROPHY); break;}
        case STR_Saria:     {ds_list_add(_dl_options,STR_MIRROR); break;}
        case STR_Mido:      {ds_list_add(_dl_options,STR_FLOWER); break;}
        case STR_Darunia:   {ds_list_add(_dl_options,STR_CHILD);  break;}
        case STR_Old_Kasuto:{ds_list_add(_dl_options,STR_CROSS);  break;}
        }
    }
    
    
    ds_list_clear(_dl_1);
    if(!Rando_are_attainable(STR_JUMP,STR_FAIRY)) // Saria Bridge
    {
        for(_i=ds_list_size(_dl_town_name)-1; _i>=0; _i--)
        {
            _town_name  = _dl_town_name[|_i];
            _town_spell = _dl_town_spell[|_i];
            if (isVal(_town_spell,STR_JUMP,STR_FAIRY))
            {
                switch(_town_name){
                case STR_Ruto:      {if(!Rando_is_attainable(STR_TROPHY)) ds_list_add(_dl_1,STR_TROPHY); break;}
                case STR_Saria:     {if(!Rando_is_attainable(STR_MIRROR)) ds_list_add(_dl_1,STR_MIRROR); break;}
                case STR_Mido:      {if(!Rando_is_attainable(STR_FLOWER)) ds_list_add(_dl_1,STR_FLOWER); break;}
                case STR_Darunia:   {if(!Rando_is_attainable(STR_CHILD))  ds_list_add(_dl_1,STR_CHILD);  break;}
                case STR_Old_Kasuto:{if(!Rando_is_attainable(STR_CROSS))  ds_list_add(_dl_1,STR_CROSS);  break;}
                }
            }
        }
    }
    
    if (ds_list_size(_dl_1)==2 
    ||  Rando_are_attainable(STR_JUMP,STR_FAIRY) ) // Saria Bridge
    {
        ds_list_add(_dl_options,STR_JUMP+STR_FAIRY); // Route: Saria Bridge with STR_JUMP+STR_FAIRY
    }
    
    
    
    
    if (ds_list_size(_dl_options))
    {
        ds_list_shuffle(_dl_options);
        _item_id =      _dl_options[|0];
        
        if (isVal(_item_id,STR_NOTE,STR_JUMP+STR_FAIRY)) // Saria Bridge
        {   // Route: Over Saria Bridge and through Death Mtn
            if (ItemLocations_DARKROOM_DIFFICULTY<2 
            && !Rando_is_attainable(STR_CANDLE,STR_FIRE) )
            {
                _item_id = STR_CANDLE;
                Rando_randomize_items_1a_1(_item_id);
            }
            
            if (_item_id==STR_JUMP+STR_FAIRY)
            {
                for(_i=ds_list_size(_dl_1)-1; _i>=0; _i--)
                {
                    _item_id = _dl_1[|_i];
                    Rando_randomize_items_1a_1(_item_id);
                }
            }
            else
            {
                _item_id = STR_NOTE;
                Rando_randomize_items_1a_1(_item_id);
            }
        }
        else
        {
            Rando_randomize_items_1a_1(_item_id);
        }
    }
    // 1111111111111111111111111111111111111111111111111111111111111111111111111
}







if (Rando_is_qual_location(STR_Mido))
{
    // 2222222222222222222222222222222222222222222222222222222222222222222222222
    // 222: Now that you can get to the raft launch, place the RAFT
    
    if(!Rando_is_attainable(STR_RAFT))
    {
        //Rando_can_traverse_DeathMtn()
        //if (ItemLocations_DARKROOM_DIFFICULTY<2 
        //&& !Rando_is_attainable(STR_CANDLE,STR_FIRE) )
        
        _item_id = STR_RAFT;
        Rando_randomize_items_1a_1(_item_id);
    }
    // 2222222222222222222222222222222222222222222222222222222222222222222222222
}




//if (CONTAINER_METHOD==3) Rando_place_container_pieces(1,1);
//ds_list_size(dl_placed_containers_hp)






ds_list_destroy(_dl_options); _dl_options=undefined;
ds_list_destroy(_dl_1); _dl_1=undefined;
ds_list_destroy(_dl_2); _dl_2=undefined;
ds_list_destroy(_dl_town_name); _dl_town_name=undefined;
ds_list_destroy(_dl_town_spell); _dl_town_spell=undefined;
ds_list_destroy(_dl_QUALIFIED_TOWNS); _dl_QUALIFIED_TOWNS=undefined;




