/// Rando_can_traverse_NewKasuto_town()


if (val(dm_save_data[?STR_Town+STR_Rando+STR_New_Kasuto+"B"], STR_New_Kasuto)!=STR_Old_Kasuto 
||  Rando_is_attainable(STR_CROSS) )
{
    return true;
}


return false;




