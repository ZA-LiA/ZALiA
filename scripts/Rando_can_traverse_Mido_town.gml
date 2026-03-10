/// Rando_can_traverse_Mido_town()


if (val(dm_save_data[?STR_Town+STR_Rando+STR_Mido+"B"], STR_Mido)!=STR_Old_Kasuto 
||  Rando_is_attainable(STR_CROSS) )
{
    return true;
}


return false;




