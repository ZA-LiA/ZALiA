/// Rando_prepare_hints()


var _i,_j;
var _dialogue;


random_set_seed(Rando_SEED);

var _dl_BOSS_NAMES = ds_list_create();
ds_list_add(_dl_BOSS_NAMES,"HORSEHEAD","HELMETHEAD","REBONACK","CAROCK","GOOMA","BARBA");

var _dl_dialogue_options = ds_list_create();
for(_i=1; _i<=Location_COUNT; _i++)
{
    ds_list_clear(_dl_dialogue_options);
    _j = 1;
    while (true)
    {
        _dialogue = dm_LOCATIONS[?hex_str(_i)+STR_Hint+hex_str(_j++)];
        if (is_undefined(_dialogue)) break;//while (true)
        
        ds_list_add(_dl_dialogue_options, _dialogue);
    }
    
    if (ds_list_size(_dl_dialogue_options))
    {
        ds_list_shuffle(_dl_dialogue_options);
        _dialogue = _dl_dialogue_options[|0];
        
        if (DungeonBoss_WILL_RANDOMIZE 
        &&  ds_list_size(_dl_dialogue_options)>1 )
        {
            for(_j=ds_list_size(_dl_BOSS_NAMES)-1; _j>=0; _j--)
            {
                if (string_pos(_dl_BOSS_NAMES[|_j],_dialogue))
                {
                    _dialogue = _dl_dialogue_options[|1];
                    break;//_j
                }
            }
        }
        
        dm_LOCATIONS[?hex_str(_i)+dk_ChosenHintDialogue] = _dialogue;
    }
}

ds_list_destroy(_dl_dialogue_options); _dl_dialogue_options=undefined;
ds_list_destroy(_dl_BOSS_NAMES); _dl_BOSS_NAMES=undefined;


dl_hint_loc_nums_shuffled = ds_list_create();
for(_i=val(g.dm_RandoHints[?STR_Hint+STR_Count]); _i>=1; _i--) ds_list_add(dl_hint_loc_nums_shuffled,_i);
ds_list_shuffle(dl_hint_loc_nums_shuffled);


            dl_hint_items = ds_list_create();
ds_list_add(dl_hint_items,STR_CANDLE,STR_GLOVE,STR_RAFT,STR_BOOTS,STR_FLUTE,STR_CROSS,STR_HAMMER,STR_BRACELET,STR_BOOK,STR_RFAIRY,STR_NOTE,STR_ALLKEY);
ds_list_add(dl_hint_items,STR_TROPHY,STR_MIRROR,STR_FLOWER,STR_CHILD,STR_MASK);
ds_list_add(dl_hint_items,STR_MEAT,STR_SHIELD,STR_RING,STR_PENDANT,STR_SWORD);




