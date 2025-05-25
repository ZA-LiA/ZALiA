/// Rando_randomize_overworld_biomes()


var _i, _val,_val1,_val2,_val3,_val4;
var _dk1;


global.can_rando_ow_tsrc = OverworldBiomes_WILL_RANDOMIZE;
save_game_pref();


random_set_seed(Rando_SEED);

var _dm_RANDO_OW_TSRC=ds_map_create();
var _dl_RANDO_BIOME_A=ds_list_create();
var _dl_RANDO_BIOME_B=ds_list_create();
_dk1 = STR_Rando+STR_Biome;

with(global.OVERWORLD)
{
    var           _COUNT1 = val(Biome_dm[?STR_Biome+STR_Count]);
    for(_i=1; _i<=_COUNT1; _i++) // Each biome
    //for(_i=ds_list_size(dl_biome_enc)-1; _i>=0; _i--)
    {
        _val1 = val(Biome_dm[?STR_Biome+hex_str(_i)]);
        //_val1 = dl_biome_enc[|_i]; // biome
        if (val(dm_enc[?_dk1+string(_val1)]))
        {
            ds_list_add(_dl_RANDO_BIOME_A,_val1);
        }
    }
    
    ds_list_copy(   _dl_RANDO_BIOME_B,_dl_RANDO_BIOME_A);
    ds_list_shuffle(_dl_RANDO_BIOME_B);
    
    for(_i=ds_list_size(_dl_RANDO_BIOME_A)-1; _i>=0; _i--)
    {
        _val1 = _dl_RANDO_BIOME_A[|_i];
        _val2 = _dl_RANDO_BIOME_B[|_i];
        _val4 = dm_enc[?_dk1+_val2+STR_TSRC+STR_Primary];
        if(!is_undefined(_val4))
        {
            _val3 = dm_enc[?_dk1+_val1+STR_TSRC+STR_Primary];
            if(!is_undefined(_val3)) _dm_RANDO_OW_TSRC[?hex_str(_val3)] = val(dm_enc[?_dk1+_val2+STR_TSRC+STR_Primary],   _val4);
            
            _val3 = dm_enc[?_dk1+_val1+STR_TSRC+STR_Secondary];
            if(!is_undefined(_val3)) _dm_RANDO_OW_TSRC[?hex_str(_val3)] = val(dm_enc[?_dk1+_val2+STR_TSRC+STR_Secondary], _val4);
            
            _val3 = dm_enc[?_dk1+_val1+STR_TSRC+STR_Tertiary];
            if(!is_undefined(_val3)) _dm_RANDO_OW_TSRC[?hex_str(_val3)] = val(dm_enc[?_dk1+_val2+STR_TSRC+STR_Tertiary],  _val4);
            
            _val3 = dm_enc[?_dk1+_val1+STR_TSRC+STR_Special];
            if(!is_undefined(_val3)) _dm_RANDO_OW_TSRC[?hex_str(_val3)] = val(dm_enc[?_dk1+_val2+STR_TSRC+STR_Special],   _val4);
        }
    }
}

_val = json_encode(_dm_RANDO_OW_TSRC);
dm_save_data[?STR_Overworld+STR_TSRC+STR_Randomized] = _val;


ds_map_destroy(_dm_RANDO_OW_TSRC); _dm_RANDO_OW_TSRC=undefined;
ds_list_destroy(_dl_RANDO_BIOME_A); _dl_RANDO_BIOME_A=undefined;
ds_list_destroy(_dl_RANDO_BIOME_B); _dl_RANDO_BIOME_B=undefined;




