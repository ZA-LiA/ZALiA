/// get_life_doll_count()


var _i, _item_id;
var _count = 0;

//show_debug_message("get_life_doll_count(). val(f.dm_1up_doll[?STR_Count])="+string(val(f.dm_1up_doll[?STR_Count])));
for(_i=val(f.dm_1up_doll[?STR_Count]); _i>=1; _i--)
//for(_i=1; _i<=g.LifeDoll_MAX; _i++)
{
    _item_id = f.dm_1up_doll[?hex_str(_i)+STR_Item+STR_ID];
    if(!is_undefined(_item_id)) _count += val(f.dm_1up_doll[?_item_id+STR_Acquired]);
    //show_debug_message("get_life_doll_count(). is_undefined(f.dm_1up_doll[?'"+hex_str(_i)+"'+STR_Item+STR_ID])="+string(is_undefined(_item_id))+", _count="+string(_count));
}


return _count;




