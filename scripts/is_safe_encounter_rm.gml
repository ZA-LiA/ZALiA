/// is_safe_encounter_rm()


with(global.OVERWORLD)
{
    var _TSRC  = dg_tsrc[#(pcrc>>0)&$FF, (pcrc>>8)&$FF];
    var _BIOME = Biome_dm[?STR_TSRC+hex_str(_TSRC)+STR_Biome];
    //var _BIOME_NUM = Biome_dm[?_BIOME+STR_Biome+STR_Num];
    if(!is_undefined(_BIOME) 
    && !is_undefined(Biome_dm[?_BIOME+STR_Biome+STR_Num]) 
    && !val(dm_enc[?_BIOME+"_Can"+STR_Spawn+dk_EncounterInstance]) )
    //&&  ds_list_find_index(dl_biome_enc_spawn_trigger,_BIOME)==-1 ) // if the biome does NOT spawn encounter objs
    {
        return true;
    }
}


return false;




/*
/// is_safe_encounter_rm()


with(global.OVERWORLD)
{
    var _TSRC      = dg_tsrc[#(pcrc>>0)&$FF, (pcrc>>8)&$FF];
    var _BIOME     = dm_enc[?hex_str(_TSRC)+STR_Biome];
    var _BIOME_IDX = dm_enc[?hex_str(_TSRC)+STR_Biome+STR_Idx];
    
    if(!is_undefined(_BIOME) 
    && !is_undefined(_BIOME_IDX) 
    &&  ds_list_find_index(dl_biome_enc_spawn_trigger,_BIOME)==-1 ) // if the biome does NOT spawn encounter objs
    {
        return true;
    }
}


return false;
*/
