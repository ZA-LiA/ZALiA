/// SmasherTrap01_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


if (ver==2)
{
    if(!surface_exists(Wall_surf))
    {
        var _i,_j, _ts, _tsrc;
        var _CLMS = ds_grid_width( Wall_dg_tsrc);
        var _ROWS = ds_grid_height(Wall_dg_tsrc);
        
        if (Wall_surf==-1) // First creation of surface
        {   // Remove wall tiles under trap
            var _x,_y;
            for(_i=0; _i<_CLMS; _i++)
            {
                for(_j=0; _j<_ROWS; _j++)
                {
                    _x = spawn_xl + (_i<<3);
                    _y = spawn_yt + (_j<<3);
                    if (_x>=0 
                    &&  _x<g.rm_w 
                    &&  _y>=0 
                    &&  _y<g.rm_h )
                    {
                        tile_layer_delete_at(FGWALL_depth,_x,_y);
                    }
                }
            }
        }
        
        // Create surface
        Wall_surf = surface_create(_CLMS<<3,_ROWS<<3);
        surface_set_target(Wall_surf);
        draw_clear_alpha(c_black,0);
        
        for(_i=0; _i<_CLMS; _i++)
        {
            for(_j=0; _j<_ROWS; _j++)
            {
                _ts   = g.dl_tileset[|(Wall_dg_tsrc[#_i,_j]>>8)&$FF];
                _tsrc =               (Wall_dg_tsrc[#_i,_j]>>0)&$FF; 
                draw_background_part(_ts, ((_tsrc>>0)&$F)<<3, ((_tsrc>>4)&$F)<<3, 8,8, _i<<3,_j<<3);
                //if(!xl && yt==$1A0) show_debug_message("SmasherTrap01_draw(). "+"DEBUG_ID="+string(DEBUG_ID)+" update_idx="+string(update_idx)+" Wall_dg_tsrc_ID="+Wall_dg_tsrc_ID+" Wall_dg_tsrc="+string(Wall_dg_tsrc)+", _i=$"+hex_str(_i)+" _j=$"+hex_str(_j)+", _tsrc=$"+hex_str(_tsrc)+", _ts="+background_get_name(_ts)+", Wall_dg_tsrc[#_i,_j]=$"+hex_str(Wall_dg_tsrc[#_i,_j]));
            }
        }
        
        surface_reset_target();
    }
    
    
    pal_swap_set(global.palette_image, palidx);
    draw_surface(Wall_surf, drawX-ww_, drawY-hh_);
    pal_swap_reset();
}
else
{
    GO_draw_sprite(sprite, palidx);
}



/*
GameObjectB_Draw
GameObject_draw
GameObject_draw_1a
*/
/*
tile_layer_delete_at
tile_layer_find
tile_get_ids_at_depth
var _file_name = get_scene_tile_file_name(_RM_NAME, _QUEST_NUM);
global.dm_tile_layer_data[?'PalcC_002'+STR_Layer+'01'+STR_Name] = 'BG0201, STRUCTURE_FGWALL01_01, PILLAR01';
_name = g.dl_TILE_DEPTH_NAMES[|_idx]; // depth name:  "BG01", "BG02", .. "BG08",   "FG01", "FG02", .. "FG08"
g.dm_tile_file[?_name+STR_Depth+STR_Layer+STR_Name] = _layer_name;
g.dm_tile_file[?_layer_name+STR_Depth] = _depth;
_dk = g.dl_TILE_DEPTH_NAMES[|_i]; // "BG01, BG02, ..."
_depth      = g.dm_TILE_DEPTH[?_dk];
_layer_name = g.dm_tile_file[? _dk+STR_Depth+STR_Layer+STR_Name];
*/
