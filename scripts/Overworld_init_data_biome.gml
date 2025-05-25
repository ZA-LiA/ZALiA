/// Overworld_init_data_biome(biome id, tsrc data, *is rando biome, *rando tsrc special, *rando tsrc primary, *rando tsrc secondary, *rando tsrc tertiary)


var _i, _arg, _tsrc_, _dk;
                          _arg = 0;
var _BIOME     = argument[_arg++];
var _TSRC_DATA = argument[_arg++];


Biome_dm[?STR_Biome+STR_Count] = val(Biome_dm[?STR_Biome+STR_Count]) + 1;
var _BIOME_NUM =                     Biome_dm[?STR_Biome+STR_Count];

Biome_dm[?STR_Biome+hex_str(_BIOME_NUM)] = _BIOME;
Biome_dm[?_BIOME+STR_Biome+STR_Num]      = _BIOME_NUM;


for(_i=(string_length(_TSRC_DATA)>>2)-1; _i>=0; _i--)
{
    _tsrc_ = string_copy(_TSRC_DATA, (_i<<2)+1, 4);
    Biome_dm[?STR_TSRC+_tsrc_+STR_Biome] = _BIOME;
}



_dk = STR_Rando+STR_Biome+_BIOME;
var                      _IS_RANDO_BIOME = false;
if (argument_count>_arg) _IS_RANDO_BIOME = argument[_arg++];
dm_enc[?_dk] =           _IS_RANDO_BIOME;

if (argument_count>_arg && argument[_arg++]>=0) dm_enc[?_dk+STR_TSRC+STR_Special]   = argument[_arg-1];
if (argument_count>_arg && argument[_arg++]>=0) dm_enc[?_dk+STR_TSRC+STR_Primary]   = argument[_arg-1];
if (argument_count>_arg && argument[_arg++]>=0) dm_enc[?_dk+STR_TSRC+STR_Secondary] = argument[_arg-1];
if (argument_count>_arg && argument[_arg++]>=0) dm_enc[?_dk+STR_TSRC+STR_Tertiary]  = argument[_arg-1];




return _BIOME;




