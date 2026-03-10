/// Rando_can_traverse_Rauru_town()


if (val(dm_save_data[?STR_Town+STR_Rando+STR_Rauru+"B"], STR_Rauru)!=STR_Old_Kasuto 
||  Rando_is_attainable(STR_CROSS) )
{
    return true;
}


return false;




