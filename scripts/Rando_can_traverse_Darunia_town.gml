/// Rando_can_traverse_Darunia_town()


if (val(dm_save_data[?STR_Town+STR_Rando+STR_Darunia+"B"], STR_Darunia)!=STR_Old_Kasuto 
||  Rando_is_attainable(STR_CROSS) )
{
    return true;
}


return false;




