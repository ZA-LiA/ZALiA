/// Rando_can_traverse_Bulblin_town()


if (val(dm_save_data[?STR_Town+STR_Rando+STR_Bulblin+"B"], STR_Bulblin)!=STR_Old_Kasuto 
||  Rando_is_attainable(STR_CROSS) )
{
    return true;
}


return false;




