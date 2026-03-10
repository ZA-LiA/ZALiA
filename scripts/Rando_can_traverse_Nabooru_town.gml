/// Rando_can_traverse_Nabooru_town()


if (val(dm_save_data[?STR_Town+STR_Rando+STR_Nabooru+"B"], STR_Nabooru)!=STR_Old_Kasuto 
||  Rando_is_attainable(STR_CROSS) )
{
    return true;
}


return false;




