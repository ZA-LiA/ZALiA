/// new_quest_init_puzzles(spell sequences spell count)


var _i, _idx, _val, _count;
var _datakey, _dk,_dk1,_dk2,_dk3,_dk4;
var _arg = 0;
var _DEBUG1=0;
//var _dbstr="";

                                                 _arg=0;
var _SPELL_SEQUENCE_SPELL_COUNT = clamp(argument[_arg++],1,4);








// --------------------------------------------------------------------------------------
// Boulder Circle
var         _dl_order = ds_list_create();
ds_list_add(_dl_order, "NORTH");
ds_list_add(_dl_order, "NORTH EAST");
ds_list_add(_dl_order, "EAST");
ds_list_add(_dl_order, "SOUTH EAST");
ds_list_add(_dl_order, "SOUTH");
ds_list_add(_dl_order, "SOUTH WEST");
ds_list_add(_dl_order, "WEST");
ds_list_add(_dl_order, "NORTH WEST");
var             _dl_rand = ds_list_create();
ds_list_copy(   _dl_rand, _dl_order);
ds_list_shuffle(_dl_rand);

_datakey = STR_Boulder+STR_Circle+STR_Order;

_count = ds_list_size(_dl_rand);
f.dm_quests[?_datakey+STR_Count] = _count;

for(_i=_count-1; _i>=0; _i--)
{
    _dk = _datakey+hex_str(_i+1);
    
    _val = _dl_rand[|_i];
    f.dm_quests[?_dk+STR_Dialogue] = _val;
    
    _idx = ds_list_find_index(_dl_order,_val);
    f.dm_quests[?_dk] = _idx+1;
    
    if(_DEBUG1)show_debug_message(_dk+" num $"+hex_str(_idx+1)+",  "+_dk+STR_Dialogue+": "+string(_val));
    //if(_DEBUG1)sdm(_dk+STR_Dialogue+": "+string(_val)+", num $"+hex_str(_idx+1));
}







// --------------------------------------------------------------------------------------
// Spell Sequences
if(_DEBUG1)show_debug_message("");
generate_spell_sequences(_SPELL_SEQUENCE_SPELL_COUNT);
if(_DEBUG1)show_debug_message("--------------------------------------------------------");






ds_list_destroy(_dl_rand);  _dl_rand=undefined;
ds_list_destroy(_dl_order); _dl_order=undefined;







