/// Rando_can_traverse_Ruto_town()


if (val(dm_save_data[?STR_Town+STR_Rando+STR_Ruto+"B"], STR_Ruto)!=STR_Old_Kasuto 
||  Rando_is_attainable(STR_CROSS) )
{
    return true;
}


return false;




