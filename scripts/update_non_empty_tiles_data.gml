/// update_non_empty_tiles_data()


/* This creates a file with a list of tiles that have at least 1 pixel.
Run this anytime you make a change to one of the below tilesets.
*/
var _i,_j,_k;
var _color1;
var _ts, _ts_name, _ts_w,_ts_h, _tsrc, _tile_w,_tile_h;
var _DK1 = STR_TSRC;
//var _DK1 = "_XY";
var _FILE_NAME0 = "TilesetData01.txt";
var _surf = 0;
var _dl_qual_tiles = ds_list_create();

var         _dl_qual_ts = ds_list_create();
ds_list_add(_dl_qual_ts, ts_Natural_1a_WRB,ts_Natural_2a_WRB,ts_Natural_4a_HMS,ts_Natural02,ts_Natural03);
ds_list_add(_dl_qual_ts, ts_Man_made_1a_WRB,ts_Man_made_2a_WRB,ts_Man_made_3a_WRB,ts_Man_made_4a_WRB,ts_ManMade05,ts_Man_made_6a_WRB,ts_Man_made_7a_WRB,ts_Man_made_8a_HMS,ts_WallStyle01_01);
ds_list_add(_dl_qual_ts, ts_DungeonA01,ts_DungeonB01,ts_DungeonC01,ts_DungeonD01,ts_DungeonE01,ts_DungeonF01,ts_DungeonG01,ts_DungeonH01,ts_DungeonAlt01,ts_DungeonAlt02,ts_DungeonAlt03,ts_DungeonAlt04,ts_DungeonAlt05,ts_DungeonAlt06,ts_DungeonAlt07,ts_DungeonAlt08);
ds_list_add(_dl_qual_ts, ts_Menu01, ts_tile_marker_1a_8x8, ts_Overworld_8x8_01);

var          _TS_COUNT = ds_list_size(_dl_qual_ts);
for(_i=0; _i<_TS_COUNT; _i++) // each tileset
{
    _ts = _dl_qual_ts[|_i];
    _ts_name = background_get_name(_ts);
    _ts_w = background_get_width( _ts);
    _ts_h = background_get_height(_ts);
    _tile_w = val(g.dm_tileset[?_ts_name+STR_Tile+STR_Width],  8);
    _tile_h = val(g.dm_tileset[?_ts_name+STR_Tile+STR_Height], 8);
    
    _surf = surface_create(_ts_w,_ts_h);
    surface_set_target(_surf);
    draw_clear_alpha(c_black,0);
    draw_background(_ts,0,0);
    
    for(_j=0; _j<_ts_h; _j++) // each row of pixels
    {
        for(_k=0; _k<_ts_w; _k++) // each clm of pixels
        {
            _color1 = draw_getpixel_ext(_k,_j);
            if ((_color1>>$18)&$FF) // if there is alpha
            {
                _tsrc = (_j<<4) | _k;
                ds_list_add(_dl_qual_tiles, _ts_name+_DK1+hex_str(_tsrc,4));
                //ds_list_add(_dl_qual_tiles, _ts_name+_DK1+hex_str(_k div _tile_w)+hex_str(_j div _tile_h));
                
                _k = ((_k+_tile_w) div _tile_w) * _tile_w;
                if (_k>=_ts_w)
                {
                    _k = 0;
                    _j = ((_j+_tile_h) div _tile_h) * _tile_h;
                }
                //_k = (_k+_tile_w) mod _tile_w;
            }
        }
    }
    
    surface_reset_target();
    surface_free(_surf);
}


var _ENCODED = ds_list_write(_dl_qual_tiles);
var _FILE = file_text_open_write(working_directory+_FILE_NAME0);
            file_text_write_string(_FILE, _ENCODED);
            file_text_close(       _FILE);
// !!!! MOVE(NOT COPY) THE SAVED DATA FROM %localappdata% TO Included Files !!!!
repeat(1) show_debug_message("");
show_debug_message("g_Draw(). Tile data saved to '"+_FILE_NAME0+"'!");
repeat(1) show_debug_message("");
show_debug_message("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
show_debug_message("THIS IS A REMINDER TO MOVE(NOT COPY) FILE '"+_FILE_NAME0+"' FROM THE %localappdata% DIRECTORY TO ITS Included Files DIRECTORY!");
show_debug_message("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
repeat(1) show_debug_message("");


if (surface_exists(_surf)) surface_free(_surf);
ds_list_destroy(_dl_qual_ts); _dl_qual_ts=undefined;
ds_list_destroy(_dl_qual_tiles); _dl_qual_tiles=undefined;




