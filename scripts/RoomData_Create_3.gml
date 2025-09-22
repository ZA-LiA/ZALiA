/// RoomData_Create_3()


if(!file_exists(FILE_NAME1))
{
    show_debug_message("!!!! WARNING! RoomData_Create_3(). file '"+FILE_NAME1+"' does not exist !!!!");
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




var _FILE    = file_text_open_read(FILE_NAME1);
var _ENCODED = file_text_read_string(_FILE);
               file_text_close(      _FILE);
var _dm_file_data = json_decode(_ENCODED);
if (_dm_file_data==-1) // `json_decode` returns -1 if it fails
{
    show_debug_message("!!!! WARNING! RoomData_Create_3(). `_dm_file_data` failed to get data from file '"+FILE_NAME1+"' !!!!");
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// ---------------------------------------------------------------------
var _val, _dk;
var _dm = ds_map_create();




_val = _dm_file_data[?STR_Tile+STR_File+"_Dimensions"];
if(!is_undefined(_val))
{
    ds_map_read(global.dm_scene_wh, _val);
}





_val = _dm_file_data[?"scene_data"];
if(!is_undefined(_val))
{
    ds_map_read(g.dm_rm, _val);
}


_val = _dm_file_data[?"spawn_data"];
if(!is_undefined(_val))
{
    ds_map_read(g.dm_spawn, _val);
    ds_map_copy(g.dm_spawn_DEFAULT, g.dm_spawn);
}




_val = _dm_file_data[?"dungeon_data"];
if(!is_undefined(_val))
{
    ds_map_read(g.dm_dungeon, _val);
}


_val = _dm_file_data[?"town_data"];
if(!is_undefined(_val))
{
    ds_map_read(g.dm_town, _val);
}




_val = _dm_file_data[?"pbags_data"];
if(!is_undefined(_val))
{
    ds_map_read(f.dm_PBags, _val);
    ds_map_copy(f.dm_PBags_DEFAULT, f.dm_PBags);
}


_val = _dm_file_data[?"1up_data"];
if(!is_undefined(_val))
{
    ds_map_read(f.dm_1up_doll, _val);
    ds_map_copy(f.dm_1up_doll_DEFAULT, f.dm_1up_doll);
    //g.LifeDoll_MAX = val(f.dm_1up_doll[?STR_Count]);
    /*
    var _count = 0;
    var _item_id = f.dm_1up_doll[?hex_str(_count+1)+STR_Item+STR_ID];
    while(!is_undefined(_item_id))
    {
        _count++;
        _item_id = f.dm_1up_doll[?hex_str(_count+1)+STR_Item+STR_ID];
    }
    
    g.LifeDoll_MAX = _count;
    */
}

_val = _dm_file_data[?"keys_data"];
if(!is_undefined(_val))
{
    ds_map_read(f.dm_keys, _val);
    ds_map_copy(f.dm_keys_DEFAULT, f.dm_keys);
}

_val = _dm_file_data[?"jars_data"];
if(!is_undefined(_val))
{
    ds_map_read(f.dm_jars, _val);
    ds_map_copy(f.dm_jars_DEFAULT, f.dm_jars);
}




_val = _dm_file_data[?"scene_rando_data"];
if(!is_undefined(_val))
{
    ds_map_read(global.dm_scene_rando, _val);
}








_val = _dm_file_data[?"palette_data"];
if(!is_undefined(_val))
{
    ds_map_read(_dm, _val);
    
    _dk = ds_map_find_first(_dm);
    while(!is_undefined(_dk))
    {
        p.dm_scene_palette[?_dk] = _dm[?_dk];
        _dk = ds_map_find_next(_dm, _dk);
    }
}




_val = _dm_file_data[?"audio_data"];
if(!is_undefined(_val))
{
    ds_map_read(_dm, _val);
    
    _dk = ds_map_find_first(_dm);
    while(!is_undefined(_dk))
    {
        Audio.dm[?_dk] = _dm[?_dk];
        _dk = ds_map_find_next(_dm, _dk);
    }
}




_val = _dm_file_data[?"rando_hint_data"];
if(!is_undefined(_val))
{
    ds_map_read(_dm, _val);
    
    _dk = ds_map_find_first(_dm);
    while(!is_undefined(_dk))
    {
        g.dm_RandoHints[?_dk] = _dm[?_dk];
        _dk = ds_map_find_next(_dm, _dk);
    }
}





_val = _dm_file_data[?"rando_enemy_data"];
if(!is_undefined(_val))
{
    ds_map_read(_dm, _val);
    
    _dk = ds_map_find_first(_dm);
    while(!is_undefined(_dk))
    {
        g.dm_RandoEnemy[?_dk] = _dm[?_dk];
        _dk = ds_map_find_next(_dm, _dk);
    }
}








_val = _dm_file_data[?"dg_dngn_map_1"];
if(!is_undefined(_val))
{
    ds_grid_read(g.PAUSE_MENU.dg_dngn_map_1, _val);
    ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_1_DEFAULT, g.PAUSE_MENU.dg_dngn_map_1);
}


_val = _dm_file_data[?"dg_dngn_map_2"];
if(!is_undefined(_val))
{
    ds_grid_read(g.PAUSE_MENU.dg_dngn_map_2, _val);
    ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_2_DEFAULT, g.PAUSE_MENU.dg_dngn_map_2);
}


_val = _dm_file_data[?"dg_dngn_map_3"];
if(!is_undefined(_val))
{
    ds_grid_read(g.PAUSE_MENU.dg_dngn_map_3, _val);
    ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_3_DEFAULT, g.PAUSE_MENU.dg_dngn_map_3);
}


_val = _dm_file_data[?"dg_dngn_map_4"];
if(!is_undefined(_val))
{
    ds_grid_read(g.PAUSE_MENU.dg_dngn_map_4, _val);
    ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_4_DEFAULT, g.PAUSE_MENU.dg_dngn_map_4);
}


_val = _dm_file_data[?"dg_dngn_map_5"];
if(!is_undefined(_val))
{
    ds_grid_read(g.PAUSE_MENU.dg_dngn_map_5, _val);
    ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_5_DEFAULT, g.PAUSE_MENU.dg_dngn_map_5);
}


_val = _dm_file_data[?"dg_dngn_map_6"];
if(!is_undefined(_val))
{
    ds_grid_read(g.PAUSE_MENU.dg_dngn_map_6, _val);
    ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_6_DEFAULT, g.PAUSE_MENU.dg_dngn_map_6);
}


_val = _dm_file_data[?"dg_dngn_map_7"];
if(!is_undefined(_val))
{
    ds_grid_read(g.PAUSE_MENU.dg_dngn_map_7, _val);
    ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_7_DEFAULT, g.PAUSE_MENU.dg_dngn_map_7);
}


_val = _dm_file_data[?"dg_dngn_map_8"];
if(!is_undefined(_val))
{
    ds_grid_read(g.PAUSE_MENU.dg_dngn_map_8, _val);
    ds_grid_copy(g.PAUSE_MENU.dg_dngn_map_8_DEFAULT, g.PAUSE_MENU.dg_dngn_map_8);
}





_val = _dm_file_data[?"dl_MapItem_ITEM_IDS"];
if(!is_undefined(_val))
{
    ds_list_read(g.dl_MapItem_ITEM_IDS, _val);
}




ds_map_destroy(_dm); _dm=undefined;
ds_map_destroy(_dm_file_data); _dm_file_data=undefined;




