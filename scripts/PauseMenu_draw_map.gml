/// PauseMenu_draw_map()


var _i,_j, _xl,_yt;


if (g.menu_state)
{
    // OW TERRAIN SURF ------------------------------------
    for(_i=ds_grid_width(dg_terrain_surf)-1; _i>=0; _i--)
    {
        if(!surface_exists(dg_terrain_surf[#_i,$0]))
        {
            var _ts, _ts_xl,_ts_yt;
            var _dg_tile_data = ds_grid_create(0,0);
            
            dg_terrain_surf[#_i,$0] = surface_create(TerrainSurf_W,TerrainSurf_H);
            surface_set_target(dg_terrain_surf[#_i,$0]);
            draw_clear_alpha(c_black,0);
            
            ds_grid_read(_dg_tile_data, dg_terrain_surf[#_i,$7]);
            var          _TILE_COUNT = ds_grid_width(_dg_tile_data);
            for(_j=0; _j<_TILE_COUNT; _j++)
            {
                _xl    = _dg_tile_data[#_j,$0];
                _yt    = _dg_tile_data[#_j,$1];
                _ts    = _dg_tile_data[#_j,$2];
                _ts_xl = _dg_tile_data[#_j,$3];
                _ts_yt = _dg_tile_data[#_j,$4];
                draw_background_part(_ts, _ts_xl,_ts_yt, 8,8, _xl,_yt);
                
                _ts    = _dg_tile_data[#_j,$5];
                if (_ts) // if there's a tile for the 2nd layer
                {
                    _ts_xl = _dg_tile_data[#_j,$6];
                    _ts_yt = _dg_tile_data[#_j,$7];
                    draw_background_part(_ts, _ts_xl,_ts_yt, 8,8, _xl,_yt);
                }
            }
            
            surface_reset_target();
            ds_grid_destroy(_dg_tile_data); _dg_tile_data=undefined;
        }
    }
    
    
    // MAP TEARS SURF ---------------------------------------
    if(!surface_exists(MapTears_srf))
    {
        MapTears_srf = surface_create(MapArea_W,MapArea_H);
        surface_set_target(MapTears_srf);
        draw_clear_alpha(c_black,0);
        var _ts_xl,_ts_yt, _tsrc;
        var _COLOR = global.C_ALPHA0; // C_ALPHA0: pal swap will set alpha=0 for any pixels of this color
        var _COUNT1 = ds_grid_width( dg_map_edge);
        var _COUNT2 = ds_grid_height(dg_map_edge);
        for(_i=0; _i<_COUNT1; _i++)
        {
            for(_j=0; _j<_COUNT2; _j++)
            {
                _val = dg_map_edge[#_i,_j];
                if (_val!=-1)
                {
                    _x_scale = sign_(_val==$FE || !(_val&$40)); // -1 if _val!=$FE && _val&$40
                    _y_scale = sign_(_val==$FE || !(_val&$80)); // -1 if _val!=$FE && _val&$80
                    
                    _xl  = _i<<3;
                    _yt  = _j<<3;
                    _xl += (!_x_scale)<<3;
                    _yt += (!_y_scale)<<3;
                    
                    _ts_xl  = ((_val>>0)&$F) <<3;
                    _ts_yt  = ((_val>>4)&$F) <<3;
                    _ts_yt *= _val==$FE;
                    draw_background_part_ext(g.TS_MENU, _ts_xl,_ts_yt, 8,8, _xl,_yt, _x_scale,_y_scale, _COLOR,1);
                }
            }
        }
        surface_reset_target();
    }
}




// -----------------------------------------------------------------------
if(!Window_extra_draw_clms) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if(!paper_drawn_clms) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


// -----------------------------------------------------------------------
var _idx, _val, _clm,_row;
var _x,_y, _x0,_y0, _xl0,_yt0, _w,_h;

var _XL0 = 0;
var _YT0 = 0;




// -----------------------------------------------------------------------
surface_set_target(MenuMap_srf);
draw_clear_alpha(c_black,0);


// MAP PAPER --------------------------
draw_sprite_(spr_1x1_WHT,0, MapPaper_xl,MapPaper_yt, -1, MapPaper_w,MapPaper_h, COLOR_PAPER);


// OW TERRAIN, DUNGEON MAP --------------------------
if(!g.dungeon_num)           PauseMenu_Draw_map_Overworld8x8();
else if (paper_drawn_clms>2) PauseMenu_draw_map_dungeon();


// MAP TEARS --------------------------
if (paper_drawn_clms) draw_surface_part(MapTears_srf, MapTearsSurf_xl,MapTearsSurf_yt, MapPaper_w,MapPaper_h, MapTearsDraw_xl,MapTearsDraw_yt);


surface_reset_target();




// -----------------------------------------------------------------------
pal_swap_set(global.palette_image, PI_MENU1); // this is so `global.C_ALPHA0` pixels(the map tears) draw transparent. doesn't matter which pi
draw_surface(MenuMap_srf, MapArea_xl,MapArea_yt);
pal_swap_reset();




// PC --------------------------------------------------------------
if (MenuMapPC_can_draw)
{
    if (g.dungeon_num)
    {
        draw_sprite_(MenuMapPC_DUNGEON_SPRITE,0, MenuMapPC_x,MenuMapPC_y, global.PI_PC1, global.pc.xScale);
    }
    else
    {
        if (MenuMapPC_use_sprite_sheet) draw_sprite_part_(MenuMapPC_OW_sprite,0, MenuMapPC_sheet_x,MenuMapPC_sheet_y, MenuMapPC_sprite_w,MenuMapPC_sprite_h, MenuMapPC_x,MenuMapPC_y, global.PI_PC1);
        else                            draw_sprite_(MenuMapPC_OW_sprite,MenuMapPC_OW_sprite_image_idx, MenuMapPC_x,MenuMapPC_y, global.PI_PC1);
    }
}




