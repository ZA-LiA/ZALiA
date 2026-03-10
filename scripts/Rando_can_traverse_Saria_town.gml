/// Rando_can_traverse_Saria_town()

// in case Saria is Old Kasuto and don't have CROSS


if (val(dm_save_data[?STR_Town+STR_Rando+STR_Saria+"B"], STR_Saria)!=STR_Old_Kasuto 
||  Rando_is_attainable(STR_CROSS) )
{
    return true;
}


return false;


/*
dm_save_data[?STR_Town+STR_Rando+_town_name2+"A"] = _town_name1; // "A": Get what the overworld town is for _town_name2
dm_save_data[?STR_Town+STR_Rando+_town_name1+"B"] = _town_name2; // "B": Get what town inhabits the overworld town of _town_name1
*/




