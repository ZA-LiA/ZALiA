/// Overworld_init_data_encounter1(biome, *has enc scene, *can spawn enc inst, *spawn cooldown, *enc inst duration, *spawn chance data)


var                   _arg = 0;
var _BIOME = argument[_arg++];


dm_enc[?_BIOME+"_Has"+STR_Encounter+STR_Scene]        = argument_count>_arg && argument[_arg++];
dm_enc[?_BIOME+"_Can"+STR_Spawn+dk_EncounterInstance] = argument_count>_arg && argument[_arg++];


if (argument_count>_arg) dm_enc[?_BIOME+STR_Spawn+STR_Cooldown]            = argument[_arg++];
if (argument_count>_arg) dm_enc[?_BIOME+dk_EncounterInstance+STR_Duration] = argument[_arg++];


if (argument_count>_arg)
{
    var _i, _val;
    var _CHAR_COUNT = 2;
    var _DATA = argument[_arg++];
    var _COUNT = string_length(_DATA) div _CHAR_COUNT;
    for(_i=0; _i<_COUNT; _i++)
    {
        _val = string_copy(_DATA, (_CHAR_COUNT*_i)+1, _CHAR_COUNT);
        _val = str_hex(_val);
        dm_enc[?_BIOME+STR_Spawn+STR_Chance+hex_str(_i+1)] = _val;
    }
}




