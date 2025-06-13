/// Rando_randomize_dungeon_tilesets()


var _i,_j,_k, _idx, _num, _val,_val1,_val2, _count,_count1,_count2,_count3;
var _datakey, _name, _pos;
var _tsrc, _dungeon_num;


global.RandoDungeonTilesets_enabled = DungeonTileset_WILL_RANDOMIZE;
save_game_pref();


random_set_seed(Rando_SEED);


ds_list_clear(dl_list1);
ds_list_add(  dl_list1,ts_DungeonA01);
ds_list_add(  dl_list1,ts_DungeonB01);
ds_list_add(  dl_list1,ts_DungeonC01);
ds_list_add(  dl_list1,ts_DungeonD01);
ds_list_add(  dl_list1,ts_DungeonE01);
ds_list_add(  dl_list1,ts_DungeonF01);
ds_list_add(  dl_list1,ts_DungeonG01);

ds_list_clear(dl_list2);
ds_list_copy( dl_list2,dl_list1);

ds_list_add(  dl_list2,ts_DungeonAlt01);
ds_list_add(  dl_list2,ts_DungeonAlt02);
ds_list_add(  dl_list2,ts_DungeonAlt03);
ds_list_add(  dl_list2,ts_DungeonAlt04);
ds_list_add(  dl_list2,ts_DungeonAlt05);
ds_list_add(  dl_list2,ts_DungeonAlt06);

ds_list_add(  dl_list2,ts_Cave01);

ds_list_clear(dl_list3);


_datakey = "_User"+STR_Custom+STR_Dungeon+STR_Tileset;
_count = val(g.dm_tileset[?_datakey+STR_Count]);
if (_count)
{
    var _background;
    for(_i=1; _i<=_count; _i++)
    {
        _background = g.dm_tileset[?_datakey+hex_str(_i)+STR_Asset];
        if(!is_undefined(        _background) 
        &&  background_exists(   _background) )
        {
            ds_list_add(dl_list3,_background);
        }
    }
    
    if (ds_list_size(dl_list3))
    {
        if (1) // testing. So that '"_User"+STR_Custom+STR_Dungeon+STR_Tileset' are guaranteed to be used.
        {
            ds_list_shuffle(dl_list2);
            _count1 = ds_list_size(dl_list1)-ds_list_size(dl_list3);
            for(_i=0; _i<_count1; _i++) ds_list_add(dl_list3,dl_list2[|_i]);
            ds_list_copy(dl_list2,dl_list3);
        }
        else
        {
            for(_i=ds_list_size(dl_list3)-1; _i>=0; _i--) ds_list_add(dl_list2,dl_list3[|_i]);
        }
    }
}


ds_list_shuffle(dl_list2);

//_count1 = ds_list_size(dl_list1);
for(_i=ds_list_size(dl_list1)-1; _i>=0; _i--)
{
    _datakey = STR_Rando+STR_Tileset+background_get_name(dl_list1[|_i]);
    dm_save_data[?_datakey] = dl_list2[|_i];
}




if (DEV  // TESTING
|| !irandom($2) )
{
    var _FILE_NAME1 = "other/TilesetData01.txt";
    if (file_exists(_FILE_NAME1))
    {
        var _FILE    = file_text_open_read(_FILE_NAME1);
        //var _FILE    = file_text_open_read(working_directory+_FILE_NAME1);
        var _ENCODED = file_text_read_string(_FILE);
                       file_text_close(      _FILE);
        //
        var _dl_tiles1 = ds_list_create();
        ds_list_read(_dl_tiles1, _ENCODED);
        var _dl_tiles0_SIZE = ds_list_size(_dl_tiles1);
        if (_dl_tiles0_SIZE)
        {
            var _DK1 = STR_TSRC;
            //var _DK1 = "_XY";
            var _dm_randomized_tiles = ds_map_create();
            
            _val1 = choose(STR_Parapa_Palace, STR_Midoro_Palace, STR_Island_Palace, STR_Maze_Island_Palace, STR_Palace_On_The_Sea, STR_Three_Eye_Rock_Palace, STR_Great_Palace);
            _dm_randomized_tiles[?STR_Dungeon+STR_Name] = _val1;
            show_debug_message("");
            show_debug_message("Rando_randomize_dungeon_tilesets(). Rando'd tiles dungeon name: "+_val1);
            show_debug_message("");
            
            var _dl_tiles2 = ds_list_create();
            ds_list_copy(_dl_tiles2, _dl_tiles1);
            ds_list_shuffle(_dl_tiles2);
            for(_i=0; _i<_dl_tiles0_SIZE; _i++)
            {
                _val1 = _dl_tiles1[|_i]; // data example: "ts_DungeonD01_TSRC5D"
                _val2 = _dl_tiles2[|_i];
                _pos = string_pos(_DK1,_val2);
                if (_pos)
                {
                    _name = string_copy(_val2, 1, _pos-1);
                    _dm_randomized_tiles[?_val1+STR_Tileset] = val(g.dm_tileset[?_name],ts_SolidColors01_8x8);
                    
                    _tsrc = string_copy(_val2, _pos+string_length(_DK1), 4);
                    _tsrc = str_hex(_tsrc);
                    _dm_randomized_tiles[?_val1+STR_TSRC] = _tsrc;
                }
            }
            
            dm_save_data[?STR_Randomized+"_Tiles"+"01"] = ds_map_write(_dm_randomized_tiles);
            
            ds_list_destroy(_dl_tiles2); _dl_tiles2=undefined;
            ds_map_destroy(_dm_randomized_tiles); _dm_randomized_tiles=undefined;
        }
        else
        {   // `_dl_tiles1` will be an empty list if `ds_list_read` fails
            show_debug_message("");
            show_debug_message("!!!! WARNING! Rando_randomize_dungeon_tilesets(). `ds_list_read(_dl_tiles1,_ENCODED)` failed !!!!");
            show_debug_message("");
        }
        
        ds_list_destroy(_dl_tiles1); _dl_tiles1=undefined;
    }
    else
    {
        show_debug_message("");
        show_debug_message("!!!! WARNING! Rando_randomize_dungeon_tilesets(). '"+_FILE_NAME1+"' DOES NOT EXIST !!!!");
        show_debug_message("");
    }
}




