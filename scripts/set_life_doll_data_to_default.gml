/// set_life_doll_data_to_default()


var _i, _item_id;


for(_i=val(f.dm_1up_doll[?STR_Count]); _i>=1; _i--)
//for(_i=1; _i<=g.LifeDoll_MAX; _i++)
{
    _item_id = f.dm_1up_doll[?hex_str(_i)+STR_Item+STR_ID];
    if(!is_undefined(_item_id)) f.dm_1up_doll[?_item_id+STR_Acquired] = false;
}




