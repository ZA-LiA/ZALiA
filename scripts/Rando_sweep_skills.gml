/// Rando_sweep_skills()


var _i, _skill;
var          _COUNT = ds_list_size(dl_SKILLS);
for(_i=0; _i<_COUNT; _i++)
{
    if (ds_list_size(dl_skills_placed)>=_COUNT)
    {
        break;//_i
    }
    
    
    _skill = dl_SKILLS[|_i];
    if (ds_list_find_index(dl_skills_placed,_skill)==-1 
    &&  Rando_is_qual_location(             _skill) )
    {
        ds_list_add(       dl_skills_placed,_skill);
        
        if (DEBUG){
        sdm(""); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
        debug_str = "SKILL  '"+_skill+"'  PLACED!";
        sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
        sdm(""); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";
        }
    }
}




