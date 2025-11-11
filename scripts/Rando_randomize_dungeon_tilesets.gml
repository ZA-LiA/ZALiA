/// Rando_randomize_dungeon_tilesets()


var _i,_j,_k,_m, _idx, _num, _val,_val1,_val2, _count,_count1,_count2,_count3;
var _clms1,_rows1, _clms2,_rows2;
var _datakey, _name, _pos, _length, _data;
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
ds_list_add(  dl_list2,ts_DungeonAlt07);

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
    dm_save_data_dungeon_tileset[?_datakey] = dl_list2[|_i];
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
            
            dm_save_data_dungeon_tileset[?STR_Randomized+"_Tiles"+"01"] = ds_map_write(_dm_randomized_tiles);
            
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







// random interconnected wall pieces style tileset
// wall graphics style 01
// -----------------------------------------------
//if (global.WallStyle01Tiles_MAIN) // testing
if (global.WallStyle01Tiles_MAIN 
||  global.WallStyle02Tiles_MAIN )
{
    var _p,_q, _datakey1,_datakey2;
    var _file_name, _file_name1, _file, _file_data;
    var _layer_name, _dl_layer_data, _dm_layer_data;
    var _ts_idx, _ts_name, _old_ts_name, _tsrc, _dl_ts_data, _dm_ts_data, _dl_tile, _tile_data;
    var _style_num, _part_num, _variation_num;
    var _wall_type_data_was_set = false;
    var _wall_type;
    var _dk_wall_piece_shape, _dk_wall_piece_section;
    //var _TEXTURE_IDX = 4; // testing
    var _TEXTURE_IDX = irandom(4);
    var _TS_OFFSET = val(global.WallStyle01_dm[?"_Textures"+STR_Offset]) * _TEXTURE_IDX;
    var _wall_styles_datakey1 = dk_WallStyle+"01";
    var _TS_IDX = ds_list_find_index(g.dl_tileset,ts_WallStyle01_01)<<8;
    var _TSRC_DEF = $08;
    var _dg_wall_type = ds_grid_create(0,0);
    var _dg_new_tsrc  = ds_grid_create(0,0);
    var _scene_clms,_scene_rows, _clm,_row, _clm_xl,_clm_xr, _row_yt,_row_yb, _block_clms,_block_rows;
    var _area;
    var _dl_areas = ds_list_create();
    ds_list_add(_dl_areas,Area_PalcA,Area_PalcB,Area_PalcC,Area_PalcD,Area_PalcE,Area_PalcF,Area_PalcG);
    
    var _dl_CORNER_TOPLFT = ds_list_create(); // Wall Corner Top-Left
    ds_list_add(_dl_CORNER_TOPLFT,$00,$04,$4C,$4E,$60,$64);
    
    var _dl_CORNER_TOPRGT = ds_list_create(); // Wall Corner Top-Right
    ds_list_add(_dl_CORNER_TOPRGT,$03,$07,$4D,$4F,$63,$67);
    
    var _dl_CORNER_BTMLFT = ds_list_create(); // Wall Corner Bottom-Left
    ds_list_add(_dl_CORNER_BTMLFT,$30,$34,$70,$74,$7C,$7E);
    
    var _dl_CORNER_BTMRGT = ds_list_create(); // Wall Corner Bottom-Right
    ds_list_add(_dl_CORNER_BTMRGT,$33,$37,$73,$77,$7D,$7F);
    
    var _dl_SIDE_TOP = ds_list_create(); // Wall Top
    ds_list_add(_dl_SIDE_TOP,$01,$02,$05,$06,$40,$41,$61,$62,$65,$66,$68,$69);
    
    var _dl_SIDE_BTM = ds_list_create(); // Wall Bottom
    ds_list_add(_dl_SIDE_BTM,$31,$32,$35,$36,$52,$53,$71,$72,$75,$76,$78,$79);
    
    var _dl_SIDE_LFT = ds_list_create(); // Wall Left
    ds_list_add(_dl_SIDE_LFT,$10,$14,$20,$24,$44,$54,$5C,$5E,$6A,$6C,$6E,$7A);
    
    var _dl_SIDE_RGT = ds_list_create(); // Wall Right
    ds_list_add(_dl_SIDE_RGT,$13,$17,$23,$27,$47,$57,$5D,$5F,$6B,$6D,$6F,$7B);
    
    var _dl_FILL = ds_list_create(); // Fill
    ds_list_add(_dl_FILL,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F);
    ds_list_add(_dl_FILL,$11,$12,$15,$16,$18,$19,$1A,$1B,$1C,$1D,$1E,$1F);
    ds_list_add(_dl_FILL,$21,$22,$25,$26,$28,$29,$2A,$2B,$2C,$2D,$2E,$2F);
    ds_list_add(_dl_FILL,$38,$39,$3A,$3B,$3C,$3D,$3E,$3F);
    ds_list_add(_dl_FILL,$42,$43,$45,$46,$48,$49,$4A,$4B);
    ds_list_add(_dl_FILL,$50,$51,$55,$56,$58,$59,$5A,$5B);
    //ds_list_add(_dl_FILL,$,$,$,$,$,$,$,$,$,$
    
    
    
    
    // ---------------------------------------------------------------------------------
    if (global.WallStyle01Tiles_MAIN 
    //&&  true ) // testing
    &&  irandom(ds_list_size(dl_list2))<ds_list_size(dl_list1) )
    {
        _area = _dl_areas[|irandom(ds_list_size(_dl_areas)-1)];
        ds_list_delete(_dl_areas,ds_list_find_index(_dl_areas,_area));
        //_area = choose(Area_PalcA,Area_PalcB,Area_PalcC,Area_PalcD,Area_PalcE,Area_PalcF,Area_PalcG);
        switch(_area){
        case Area_PalcA:{_old_ts_name=background_get_name(ts_DungeonA01); break;}
        case Area_PalcB:{_old_ts_name=background_get_name(ts_DungeonB01); break;}
        case Area_PalcC:{_old_ts_name=background_get_name(ts_DungeonC01); break;}
        case Area_PalcD:{_old_ts_name=background_get_name(ts_DungeonD01); break;}
        case Area_PalcE:{_old_ts_name=background_get_name(ts_DungeonE01); break;}
        case Area_PalcF:{_old_ts_name=background_get_name(ts_DungeonF01); break;}
        case Area_PalcG:{_old_ts_name=background_get_name(ts_DungeonG01); break;}
        }
        
        _wall_styles_datakey1 = dk_WallStyle+"01";
        show_debug_message("");
        show_debug_message(_wall_styles_datakey1+" Dungeon = "+_area);
        show_debug_message("");
        
        
        
        for(_i=0; _i<$100; _i++) // Each possible file of area
        {
            _wall_type_data_was_set = false;
            ds_grid_resize(_dg_wall_type,0,0);
            ds_grid_clear( _dg_wall_type,0);
            ds_grid_resize(_dg_new_tsrc,0,0);
            ds_grid_clear( _dg_new_tsrc,0);
            
            // file name example:  "rm_tile_data/PalcA/PalcA_003.json"
            _file_name1  = string_lettersdigits(_area);
            _file_name1 += "_";
            _file_name1 += string_repeat("0",_i<100);
            _file_name1 += string_repeat("0",_i<10);
            _file_name1 += string(_i);
            
            
            _data = global.dm_scene_wall_data[?_file_name1+STR_Wall+STR_Part+STR_Data];
            //_data = g.dm_rm[?_file_name1+STR_Wall+STR_Part+STR_Data];
            if(!is_undefined(_data))
            {
                ds_grid_read(_dg_wall_type, _data);
                _wall_type_data_was_set = true;
            }
            else
            {
                _file_name  = "rm_tile_data";
                _file_name += "/";
                _file_name += string_lettersdigits(_area);
                _file_name += "/";
                _file_name += _file_name1;
                _file_name += ".json";
                if(!file_exists(_file_name)) continue;//_i. to next file
                
                _file_data = "";
                _file = file_text_open_read(_file_name);
                while(!file_text_eof(_file)) _file_data += file_text_readln(_file);
                file_text_close(_file);
                
                var _dm_file_data = json_decode(_file_data);
                if (_dm_file_data!=-1)
                {
                    _ts_idx = -1;
                    _ts_name = "";
                    
                    _dl_ts_data = _dm_file_data[?"tilesets"];
                    
                    var          _TILESET_COUNT = ds_list_size(_dl_ts_data);
                    for(_j=0; _j<_TILESET_COUNT; _j++) // Each tileset
                    {
                        _dm_ts_data = _dl_ts_data[|_j];
                        _data       = _dm_ts_data[?"source"];
                        // _dm_ts_data[?"source"] Example: "source":"..\/..\/..\/..\/..\/..\/Tiled\/Tilesets\/Z2_Remake_1a\/ts_Natural_1a_WRB.tsx
                            _pos = string_pos(_old_ts_name,_data);
                        if (_pos)
                        {
                            _ts_idx = _j;
                            _ts_name = string_copy(_data, _pos, string_pos(".tsx",_data)-_pos);
                            break;//_j
                        }
                    }
                    
                    
                    if (_ts_idx!=-1)
                    {
                        _scene_clms = _dm_file_data[?"width"];
                        _scene_rows = _dm_file_data[?"height"];
                        
                        _dl_layer_data = val(_dm_file_data[?"layers"]);
                        
                        
                        ds_grid_resize(_dg_wall_type, _scene_clms,_scene_rows);
                        ds_grid_clear( _dg_wall_type,0);
                        
                        var          _LAYER_COUNT = ds_list_size(_dl_layer_data);
                        for(_j=0; _j<_LAYER_COUNT; _j++) // Each layer
                        {
                            _dm_layer_data = _dl_layer_data[|_j];
                            _layer_name    = _dm_layer_data[?"name"];
                            _layer_name    = string(_layer_name);
                            
                            if (string_pos("FGWALL01_01",_layer_name))
                            {
                                _dl_tile = _dm_layer_data[?"data"];
                                var          _TILE_COUNT = ds_list_size(_dl_tile);
                                for(_k=0; _k<_TILE_COUNT; _k++)
                                {
                                    _clm = _k mod _scene_clms;
                                    _row = _k div _scene_clms;
                                    
                                    _tile_data = _dl_tile[|_k];
                                    if (_tile_data==0) continue; // 0 means no tile
                                    
                                    _tile_data--; // Tiled app adds 1 so it can't be 0
                                    _tile_data &= $3FFFFFFF; // truncate the scale xy data
                                    _tile_data  = abs(_tile_data);
                                    
                                    _tsrc = _tile_data&$FF;
                                    
                                    if ((_tile_data>>8)&$FF==_ts_idx)
                                    {
                                             if (ds_list_find_index(_dl_CORNER_TOPLFT,_tsrc)!=-1) _dg_wall_type[#_clm,_row] = $8|$2;
                                        else if (ds_list_find_index(_dl_CORNER_TOPRGT,_tsrc)!=-1) _dg_wall_type[#_clm,_row] = $8|$1;
                                        else if (ds_list_find_index(_dl_CORNER_BTMLFT,_tsrc)!=-1) _dg_wall_type[#_clm,_row] = $4|$2;
                                        else if (ds_list_find_index(_dl_CORNER_BTMRGT,_tsrc)!=-1) _dg_wall_type[#_clm,_row] = $4|$1;
                                        else if (ds_list_find_index(_dl_SIDE_TOP,     _tsrc)!=-1) _dg_wall_type[#_clm,_row] = $8;
                                        else if (ds_list_find_index(_dl_SIDE_BTM,     _tsrc)!=-1) _dg_wall_type[#_clm,_row] = $4;
                                        else if (ds_list_find_index(_dl_SIDE_LFT,     _tsrc)!=-1) _dg_wall_type[#_clm,_row] = $2;
                                        else if (ds_list_find_index(_dl_SIDE_RGT,     _tsrc)!=-1) _dg_wall_type[#_clm,_row] = $1;
                                        else if (ds_list_find_index(_dl_FILL,         _tsrc)!=-1) _dg_wall_type[#_clm,_row] = $10;
                                        
                                        if(!_wall_type_data_was_set) _wall_type_data_was_set = _dg_wall_type[#_clm,_row]!=0;
                                        if (_wall_type_data_was_set) dm_save_data_dungeon_tileset[?_wall_styles_datakey1+_file_name1+_layer_name] = true;
                                    }
                                }
                            }
                        }
                    }
                    
                    ds_map_destroy(_dm_file_data); _dm_file_data=undefined;
                }
            }
            
            
            
            
            if (_wall_type_data_was_set)
            {
                _scene_clms = ds_grid_width( _dg_wall_type);
                _scene_rows = ds_grid_height(_dg_wall_type);
                ds_grid_resize(_dg_new_tsrc, _scene_clms,_scene_rows);
                ds_grid_clear( _dg_new_tsrc,0);
                
                _clm_xl = val(global.dm_scene_wall_data[?_file_name1+"_FGWALL"+STR_Clm+"_XL"]);
                _clm_xr = val(global.dm_scene_wall_data[?_file_name1+"_FGWALL"+STR_Clm+"_XR"], _scene_clms);
                
                _row_yt = val(global.dm_scene_wall_data[?_file_name1+"_FGWALL"+STR_Row+"_YT"]);
                _row_yb = val(global.dm_scene_wall_data[?_file_name1+"_FGWALL"+STR_Row+"_YB"], _scene_rows);
                //show_debug_message("Rando_randomize_dungeon_tilesets(). "+"WallStyle01. "+_file_name1+", _scene_clms=$"+hex_str(_scene_clms)+" _scene_rows=$"+hex_str(_scene_rows)+", _clm_xl=$"+hex_str(_clm_xl)+" _clm_xr=$"+hex_str(_clm_xr)+" _row_yt=$"+hex_str(_row_yt)+" _row_yb=$"+hex_str(_row_yb));
                
                for(_j=_row_yt; _j<_row_yb; _j++)
                //for(_j=0; _j<_scene_rows; _j++)
                {
                    for(_k=_clm_xl; _k<_clm_xr; _k++)
                    //for(_k=0; _k<_scene_clms; _k++)
                    {
                        _wall_type = _dg_wall_type[#_k,_j];
                        if (_wall_type 
                        && !_dg_new_tsrc[#_k,_j] )
                        {
                            _dk_wall_piece_shape = "S"; // Single
                            if (irandom($F))
                            {
                                if (irandom($1) 
                                &&  _scene_clms >  _k+1 
                                &&  _dg_wall_type[#_k+1,_j] 
                                && !_dg_new_tsrc[# _k+1,_j] )
                                {
                                    _dk_wall_piece_shape = "H"; // Horizontal
                                }
                                else if (_scene_rows >_j+1 
                                &&  _dg_wall_type[#_k,_j+1] 
                                && !_dg_new_tsrc[# _k,_j+1] )
                                {
                                    _dk_wall_piece_shape = "V"; // Vertical
                                }
                            }
                            
                            switch(_dk_wall_piece_shape)
                            {
                                case "S":{ // Single -----------------------------------------------------
                                _val3 = 1;
                                _val2 = 0;
                                break;}//case "S"
                                
                                case "H":{ // Horizontal -----------------------------------------------------
                                _val3 = 2;
                                _val2 = 0;
                                for(_m=_val3; _m<_val3+2; _m++)
                                {
                                    if (_scene_clms <= _k+_m 
                                    || !_dg_wall_type[#_k+_m, _j] 
                                    ||  _dg_new_tsrc[# _k+_m, _j] )
                                    {   break;  }//_m
                                    _val2++;
                                }//_m
                                break;}//case "H"
                                
                                case "V":{ // Vertical -----------------------------------------------------
                                _val3 = 2;
                                _val2 = 0;
                                for(_m=_val3; _m<_val3+2; _m++)
                                {
                                    if (_scene_rows <=    _j+_m 
                                    || !_dg_wall_type[#_k,_j+_m] 
                                    ||  _dg_new_tsrc[# _k,_j+_m] )
                                    {   break;  }//_m
                                    _val2++;
                                }//_m
                                break;}//case "V"
                            }//switch(_dk_wall_piece_shape)
                            
                            _length = _val3 + irandom(_val2); // 1,2,3,4
                            for(_m=0; _m<_length; _m++)
                            {
                                     if (_m==0)         _dk_wall_piece_section = "0"; // Single, Horizontal Left End, or Vertical Top End
                                else if (_m==_length-1) _dk_wall_piece_section = "2"; // Horizontal Right End, or Vertical Bottom End
                                else                    _dk_wall_piece_section = "1"; // Horizontal or Vertical Mid Section
                                
                                _p = 0;
                                _q = 0;
                                switch(_dk_wall_piece_shape){
                                case "H":{_p=_m; break;}
                                case "V":{_q=_m; break;}
                                }
                                _wall_type = _dg_wall_type[#_k+_p, _j+_q];
                                
                                _tsrc  = val(global.WallStyle01_dm[?STR_TSRC+STR_Shape+_dk_wall_piece_shape+STR_Tile+_dk_wall_piece_section+STR_Wall+hex_str(_wall_type)], _TSRC_DEF);
                                _tsrc += _TS_OFFSET;
                                _dg_new_tsrc[#_k+_p, _j+_q] = _TS_IDX | _tsrc;
                            }//_m
                        }
                    }//_k
                }//_j
                
                
                dm_save_data_dungeon_tileset[?_wall_styles_datakey1+_file_name1] = ds_grid_write(_dg_new_tsrc);
            }
        }//_i
    }
    
    
    
    
    // ---------------------------------------------------------------------------------
    if (global.WallStyle02Tiles_MAIN 
    //&&  true ) // testing
    &&  irandom(ds_list_size(dl_list2))<ds_list_size(dl_list1) )
    {
        _area = _dl_areas[|irandom(ds_list_size(_dl_areas)-1)];
        ds_list_delete(_dl_areas,ds_list_find_index(_dl_areas,_area));
        switch(_area){
        case Area_PalcA:{_old_ts_name=background_get_name(ts_DungeonA01); break;}
        case Area_PalcB:{_old_ts_name=background_get_name(ts_DungeonB01); break;}
        case Area_PalcC:{_old_ts_name=background_get_name(ts_DungeonC01); break;}
        case Area_PalcD:{_old_ts_name=background_get_name(ts_DungeonD01); break;}
        case Area_PalcE:{_old_ts_name=background_get_name(ts_DungeonE01); break;}
        case Area_PalcF:{_old_ts_name=background_get_name(ts_DungeonF01); break;}
        case Area_PalcG:{_old_ts_name=background_get_name(ts_DungeonG01); break;}
        }
        
        _wall_styles_datakey1 = dk_WallStyle+"02";
        show_debug_message("");
        show_debug_message(_wall_styles_datakey1+" Dungeon = "+_area);
        show_debug_message("");
        
        
        for(_i=0; _i<$100; _i++) // Each possible file of area
        {
            _wall_type_data_was_set = false;
            
            ds_grid_resize(_dg_wall_type,0,0);
            ds_grid_clear( _dg_wall_type,0);
            ds_grid_resize(_dg_new_tsrc,0,0);
            ds_grid_clear( _dg_new_tsrc,0);
            
            // file name example:  "rm_tile_data/PalcA/PalcA_003.json"
            _file_name1  = string_lettersdigits(_area);
            _file_name1 += "_";
            _file_name1 += string_repeat("0",_i<100);
            _file_name1 += string_repeat("0",_i<10);
            _file_name1 += string(_i);
            
            
            _data = global.dm_scene_wall_data[?_file_name1+STR_Wall+STR_Part+STR_Data];
            //_data = g.dm_rm[?_file_name1+STR_Wall+STR_Part+STR_Data];
            if(!is_undefined(_data))
            {
                ds_grid_read(_dg_wall_type, _data);
                _wall_type_data_was_set = true;
            }
            else
            {
                _file_name  = "rm_tile_data";
                _file_name += "/";
                _file_name += string_lettersdigits(_area);
                _file_name += "/";
                _file_name += _file_name1;
                _file_name += ".json";
                if(!file_exists(_file_name)) continue;//_i. to next file
                
                _file_data = "";
                _file = file_text_open_read(_file_name);
                while(!file_text_eof(_file)) _file_data += file_text_readln(_file);
                file_text_close(_file);
                
                var _dm_file_data = json_decode(_file_data);
                if (_dm_file_data!=-1)
                {
                    _ts_idx = -1;
                    _ts_name = "";
                    
                    _dl_ts_data = _dm_file_data[?"tilesets"];
                    
                    var          _TILESET_COUNT = ds_list_size(_dl_ts_data);
                    for(_j=0; _j<_TILESET_COUNT; _j++) // Each tileset
                    {
                        _dm_ts_data = _dl_ts_data[|_j];
                        _data       = _dm_ts_data[?"source"];
                        // _dm_ts_data[?"source"] Example: "source":"..\/..\/..\/..\/..\/..\/Tiled\/Tilesets\/Z2_Remake_1a\/ts_Natural_1a_WRB.tsx
                            _pos = string_pos(_old_ts_name,_data);
                        if (_pos)
                        {
                            _ts_idx = _j;
                            _ts_name = string_copy(_data, _pos, string_pos(".tsx",_data)-_pos);
                            break;//_j
                        }
                    }//_j
                    
                    if (_ts_idx!=-1)
                    {
                        _scene_clms = _dm_file_data[?"width"];
                        _scene_rows = _dm_file_data[?"height"];
                        
                        _dl_layer_data = val(_dm_file_data[?"layers"]);
                        
                        
                        ds_grid_resize(_dg_wall_type, _scene_clms,_scene_rows);
                        ds_grid_clear( _dg_wall_type,0);
                        
                        var          _LAYER_COUNT = ds_list_size(_dl_layer_data);
                        for(_j=0; _j<_LAYER_COUNT; _j++) // Each layer
                        {
                            _dm_layer_data = _dl_layer_data[|_j];
                            _layer_name    = _dm_layer_data[?"name"];
                            _layer_name    = string(_layer_name);
                            
                            if (string_pos("FGWALL01_01",_layer_name))
                            {
                                _dl_tile = _dm_layer_data[?"data"];
                                var          _TILE_COUNT = ds_list_size(_dl_tile);
                                for(_k=0; _k<_TILE_COUNT; _k++)
                                {
                                    _clm = _k mod _scene_clms;
                                    _row = _k div _scene_clms;
                                    
                                    _tile_data = _dl_tile[|_k];
                                    if (_tile_data==0) continue; // 0 means no tile
                                    
                                    _tile_data--; // Tiled app adds 1 so it can't be 0
                                    _tile_data &= $3FFFFFFF; // truncate the scale xy data
                                    _tile_data  = abs(_tile_data);
                                    
                                    _tsrc = _tile_data&$FF;
                                    
                                    if ((_tile_data>>8)&$FF==_ts_idx)
                                    {
                                             if (ds_list_find_index(_dl_CORNER_TOPLFT,_tsrc)!=-1) _dg_wall_type[#_clm,_row] = $8|$2;
                                        else if (ds_list_find_index(_dl_CORNER_TOPRGT,_tsrc)!=-1) _dg_wall_type[#_clm,_row] = $8|$1;
                                        else if (ds_list_find_index(_dl_CORNER_BTMLFT,_tsrc)!=-1) _dg_wall_type[#_clm,_row] = $4|$2;
                                        else if (ds_list_find_index(_dl_CORNER_BTMRGT,_tsrc)!=-1) _dg_wall_type[#_clm,_row] = $4|$1;
                                        else if (ds_list_find_index(_dl_SIDE_TOP,     _tsrc)!=-1) _dg_wall_type[#_clm,_row] = $8;
                                        else if (ds_list_find_index(_dl_SIDE_BTM,     _tsrc)!=-1) _dg_wall_type[#_clm,_row] = $4;
                                        else if (ds_list_find_index(_dl_SIDE_LFT,     _tsrc)!=-1) _dg_wall_type[#_clm,_row] = $2;
                                        else if (ds_list_find_index(_dl_SIDE_RGT,     _tsrc)!=-1) _dg_wall_type[#_clm,_row] = $1;
                                        else if (ds_list_find_index(_dl_FILL,         _tsrc)!=-1) _dg_wall_type[#_clm,_row] = $10;
                                        
                                        if(!_wall_type_data_was_set) _wall_type_data_was_set = _dg_wall_type[#_clm,_row]!=0;
                                        if (_wall_type_data_was_set) dm_save_data_dungeon_tileset[?_wall_styles_datakey1+_file_name1+_layer_name] = true;
                                    }
                                }//_k
                            }
                        }//_j
                    }
                    
                    ds_map_destroy(_dm_file_data); _dm_file_data=undefined;
                }
            }
            
            
            
            
            if (_wall_type_data_was_set)
            {
                _scene_clms = ds_grid_width( _dg_wall_type);
                _scene_rows = ds_grid_height(_dg_wall_type);
                ds_grid_resize(_dg_new_tsrc, _scene_clms,_scene_rows);
                
                _clm_xl = val(global.dm_scene_wall_data[?_file_name1+"_FGWALL"+STR_Clm+"_XL"]);
                _clm_xr = val(global.dm_scene_wall_data[?_file_name1+"_FGWALL"+STR_Clm+"_XR"], _scene_clms);
                
                _row_yt = val(global.dm_scene_wall_data[?_file_name1+"_FGWALL"+STR_Row+"_YT"]);
                _row_yb = val(global.dm_scene_wall_data[?_file_name1+"_FGWALL"+STR_Row+"_YB"], _scene_rows);
                //show_debug_message("Rando_randomize_dungeon_tilesets(). "+"WallStyle02. "+_file_name1+", _scene_clms=$"+hex_str(_scene_clms)+" _scene_rows=$"+hex_str(_scene_rows)+", _clm_xl=$"+hex_str(_clm_xl)+" _clm_xr=$"+hex_str(_clm_xr)+" _row_yt=$"+hex_str(_row_yt)+" _row_yb=$"+hex_str(_row_yb));
                
                for(_j=_row_yt; _j<_row_yb; _j++)
                //for(_j=0; _j<_scene_rows; _j++)
                {
                    for(_k=_clm_xl; _k<_clm_xr; _k++)
                    //for(_k=0; _k<_scene_clms; _k++)
                    {
                        _wall_type = _dg_wall_type[#_k,_j];
                        if (_wall_type 
                        && !_dg_new_tsrc[#_k,_j] )
                        {
                            _block_clms = irandom(3) + 2;
                            _block_rows = irandom(3) + 2;
                            
                            _clms1 = 0;
                            for(_q=0; _q<_block_clms; _q++)
                            {
                                if (_scene_clms <= _k+_q 
                                || !_dg_wall_type[#_k+_q, _j] 
                                ||  _dg_new_tsrc[# _k+_q, _j] )
                                {
                                    break;//_q
                                }
                                if (_q 
                                &&  _dg_wall_type[#_k+_q, _j]&$2 )
                                {
                                    break;//_q
                                }
                                _clms1 = _q+1;
                            }
                            
                            _rows1 = 0;
                            for(_p=0; _p<_block_rows; _p++)
                            {
                                if (_scene_rows <=              _j+_p 
                                || !_dg_wall_type[#_k+_clms1-1, _j+_p] 
                                ||  _dg_new_tsrc[# _k+_clms1-1, _j+_p] 
                                || !_dg_wall_type[#_k,          _j+_p] 
                                ||  _dg_new_tsrc[# _k,          _j+_p] )
                                {
                                    break;//_p
                                }
                                if (_p)
                                {
                                    if (_dg_wall_type[#_k+_clms1-1, _j+_p]&$8 
                                    ||  _dg_wall_type[#_k,          _j+_p]&$8 )
                                    {
                                        break;//_p
                                    }
                                }
                                _rows1 = _p+1;
                            }
                            
                            
                            
                            
                            _rows2 = 0;
                            for(_p=0; _p<_block_rows; _p++)
                            {
                                if (_scene_rows <=     _j+_p 
                                || !_dg_wall_type[#_k, _j+_p] 
                                ||  _dg_new_tsrc[# _k, _j+_p] )
                                {
                                    break;//_p
                                }
                                if (_p 
                                &&  _dg_wall_type[#_k, _j+_p]&$8 )
                                {
                                    break;//_p
                                }
                                _rows2 = _p+1;
                            }
                            
                            _clms2 = 0;
                            for(_q=0; _q<_block_clms; _q++)
                            {
                                if (_scene_clms <= _k+_q 
                                || !_dg_wall_type[#_k+_q, _j+_rows2-1] 
                                ||  _dg_new_tsrc[# _k+_q, _j+_rows2-1] 
                                || !_dg_wall_type[#_k+_q, _j] 
                                ||  _dg_new_tsrc[# _k+_q, _j] )
                                {
                                    break;//_q
                                }
                                if (_q)
                                {
                                    if (_dg_wall_type[#_k+_q, _j+_rows2-1]&$2 
                                    ||  _dg_wall_type[#_k+_q, _j]&$2 )
                                    {
                                        break;//_q
                                    }
                                }
                                _clms2 = _q+1;
                            }
                            
                            
                            
                            
                            if (_clms1*_rows1>_clms2*_rows2)
                            {
                                _block_clms = _clms1;
                                _block_rows = _rows1;
                            }
                            else
                            {
                                _block_clms = _clms2;
                                _block_rows = _rows2;
                            }
                            
                            
                            _datakey1 = STR_TSRC;
                            if (_block_clms==1 
                            ||  _block_rows==1 )
                            {
                                _datakey1 += "_Thin";
                            }
                            _datakey1 += STR_Part;
                            for(_p=0; _p<_block_rows; _p++)
                            {
                                for(_q=0; _q<_block_clms; _q++)
                                {
                                    if (_block_clms==1 
                                    &&  _block_rows==1 )
                                    {
                                        _part_num = $00;
                                    }
                                    else if (_block_clms==1)
                                    {
                                             if (_p==0)             _part_num = $08; // top
                                        else if (_p==_block_rows-1) _part_num = $04; // bottom
                                        else                        _part_num = $0C; // mid
                                    }
                                    else if (_block_rows==1)
                                    {
                                             if (_q==0)             _part_num = $02; // left
                                        else if (_q==_block_clms-1) _part_num = $01; // right
                                        else                        _part_num = $03; // mid
                                    }
                                    else if (_q==_block_clms-1 && _p==_block_rows-1) _part_num = $05; // corner right-bottom
                                    else if (_q==_block_clms-1 && _p==0)             _part_num = $09; // corner right-top
                                    else if (_q==0             && _p==_block_rows-1) _part_num = $06; // corner left-bottom
                                    else if (_q==0             && _p==0)             _part_num = $0A; // corner left-top
                                    else if (_q==_block_clms-1)                      _part_num = $01; // side right
                                    else if (_q==0)                                  _part_num = $02; // side left
                                    else if (                     _p==_block_rows-1) _part_num = $04; // side bottom
                                    else if (                     _p==0)             _part_num = $08; // side top
                                    else                                             _part_num = $10; // mid/fill
                                    
                                    _datakey2  = _datakey1+hex_str(_part_num);
                                    _datakey2 += STR_Wall+hex_str(_dg_wall_type[#_k+_q, _j+_p]);
                                    _dg_new_tsrc[#_k+_q, _j+_p] = val(global.WallStyle02_dm[?_datakey2]);
                                }//_p
                            }//_q
                        }
                    }//_k
                }//_j
                
                
                dm_save_data_dungeon_tileset[?_wall_styles_datakey1+_file_name1] = ds_grid_write(_dg_new_tsrc);
            }
        }//_i
    }
    
    
    
    
    ds_list_destroy(_dl_areas); _dl_areas=undefined;
    ds_grid_destroy(_dg_wall_type); _dg_wall_type=undefined;
    ds_grid_destroy(_dg_new_tsrc); _dg_new_tsrc=undefined;
    ds_list_destroy(_dl_CORNER_TOPLFT); _dl_CORNER_TOPLFT=undefined;
    ds_list_destroy(_dl_CORNER_TOPRGT); _dl_CORNER_TOPRGT=undefined;
    ds_list_destroy(_dl_CORNER_BTMLFT); _dl_CORNER_BTMLFT=undefined;
    ds_list_destroy(_dl_CORNER_BTMRGT); _dl_CORNER_BTMRGT=undefined;
    ds_list_destroy(_dl_SIDE_TOP); _dl_SIDE_TOP=undefined;
    ds_list_destroy(_dl_SIDE_BTM); _dl_SIDE_BTM=undefined;
    ds_list_destroy(_dl_SIDE_LFT); _dl_SIDE_LFT=undefined;
    ds_list_destroy(_dl_SIDE_RGT); _dl_SIDE_RGT=undefined;
    ds_list_destroy(_dl_FILL); _dl_FILL=undefined;
}
/*
                    if (_wall_type_data_was_set)
                    {
                        ds_grid_resize(_dg_new_tsrc, _scene_clms,_scene_rows);
                        ds_grid_clear( _dg_new_tsrc,0);
                        for(_j=0; _j<_scene_rows; _j++)
                        {
                            for(_k=0; _k<_scene_clms; _k++)
                            {
                                _wall_type = _dg_wall_type[#_k,_j];
                                if (_wall_type 
                                && !_dg_new_tsrc[#_k,_j] )
                                {
                                    _block_clms = 5;
                                    for(_m=1; _m<_block_clms; _m++)
                                    {
                                        if (_scene_clms <= _k+_m 
                                        || !_dg_wall_type[#_k+_m,_j] 
                                        ||  _dg_new_tsrc[# _k+_m,_j] )
                                        {
                                            _block_clms = _m;
                                            break;//_m
                                        }
                                    }//_m
                                    if (_block_clms>2) _block_clms = irandom(_block_clms-2) + 2;
                                    //_block_clms = irandom(_block_clms-1) + 1;
                                    
                                    _block_rows = 5;
                                    for(_m=1; _m<_block_rows; _m++)
                                    {
                                        if (_scene_rows <=    _j+_m 
                                        || !_dg_wall_type[#_k,_j+_m] 
                                        ||  _dg_new_tsrc[# _k,_j+_m] )
                                        {
                                            _block_rows = _m;
                                            break;//_m
                                        }
                                    }//_m
                                    if (_block_rows>2) _block_rows = irandom(_block_rows-2) + 2;
                                    //_block_rows = irandom(_block_rows-1) + 1;
                                    
                                    
                                    _datakey1 = STR_TSRC;
                                    if (_block_clms==1 
                                    ||  _block_rows==1 )
                                    {
                                        _datakey1 += "_Thin";
                                    }
                                    _datakey1 += STR_Style;
                                    _count = val(global.WallStyle02_dm[?_datakey1+STR_Count]);
                                    _style_num = irandom(_count-1) + 1;
                                    _datakey1 += hex_str(_style_num);
                                    for(_p=0; _p<_block_rows; _p++)
                                    {
                                        for(_q=0; _q<_block_clms; _q++)
                                        {
                                            if (_block_clms==1 
                                            &&  _block_rows==1 )
                                            {
                                                _part_num = $00;
                                                //_datakey2 = _datakey1+"00";
                                            }
                                            else if (_block_clms==1)
                                            {
                                                     if (_p==0)             _part_num = $08; // top
                                                else if (_p==_block_rows-1) _part_num = $04; // bottom
                                                else                        _part_num = $0C; // mid
                                            }
                                            else if (_block_rows==1)
                                            {
                                                     if (_q==0)             _part_num = $02; // left
                                                else if (_q==_block_clms-1) _part_num = $01; // right
                                                else                        _part_num = $03; // mid
                                            }
                                            else if (_q==_block_clms-1 && _p==_block_rows-1) _part_num = $05; // corner right-bottom
                                            else if (_q==_block_clms-1 && _p==0)             _part_num = $09; // corner right-top
                                            else if (_q==0             && _p==_block_rows-1) _part_num = $06; // corner left-bottom
                                            else if (_q==0             && _p==0)             _part_num = $0A; // corner left-top
                                            else if (_q==_block_clms-1)                      _part_num = $01; // side right
                                            else if (_q==0)                                  _part_num = $02; // side left
                                            else if (                     _p==_block_rows-1) _part_num = $04; // side bottom
                                            else if (                     _p==0)             _part_num = $08; // side top
                                            else                                             _part_num = $10; // mid/fill
                                            
                                            //global.WallStyle02_dm[?STR_TSRC+STR_Style+hex_str(_i)+STR_Part+"05"+hex_str( ++_j)]
                                            _datakey2 = _datakey1+STR_Part+hex_str(_part_num);
                                            _count = val(global.WallStyle02_dm[?_datakey2+STR_Count]);
                                            _variation_num = irandom(_count-1) + 1;
                                            _val1 =  val(global.WallStyle02_dm[?_datakey2+hex_str(_variation_num)]);
                                            _dg_new_tsrc[#_k+_q, _j+_p] = _val1;
                                        }//_p
                                    }//_q
                                }
                            }//_k
                        }//_j
                    }
*/




