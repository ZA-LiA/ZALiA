/// Rando_can_traverse_OldKasuto_town()


if (val(dm_save_data[?STR_Town+STR_Rando+STR_Old_Kasuto+"B"], STR_Old_Kasuto)!=STR_Old_Kasuto 
||  Rando_is_attainable(STR_CROSS) )
{
    return true;
}


return false;




