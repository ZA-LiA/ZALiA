/// PauseMenu_Draw_map_Overworld8x8()


if (surface_exists(dg_terrain_surf[#current_terrain_surf_idx,$0]))
{
    var _SURF    = dg_terrain_surf[#current_terrain_surf_idx,$0];
    var _XL      = dg_terrain_surf[#current_terrain_surf_idx,$1];
    var _YT      = dg_terrain_surf[#current_terrain_surf_idx,$2];
    var _W       = dg_terrain_surf[#current_terrain_surf_idx,$3];
    var _H       = dg_terrain_surf[#current_terrain_surf_idx,$4];
    var _SURF_XL = dg_terrain_surf[#current_terrain_surf_idx,$5];
    var _SURF_YT = dg_terrain_surf[#current_terrain_surf_idx,$6];
    draw_surface_part(_SURF, _SURF_XL,_SURF_YT, _W,_H, _XL,_YT);
}
//dg_terrain_surf[#anim frame,$0] // $0: surface image
//dg_terrain_surf[#anim frame,$1] // $1: draw xl
//dg_terrain_surf[#anim frame,$2] // $2: draw yt
//dg_terrain_surf[#anim frame,$3] // $3: current frame's surface part width
//dg_terrain_surf[#anim frame,$4] // $4: current frame's surface part height
//dg_terrain_surf[#anim frame,$5] // $5: current frame's surface part xl (relative to surface left edge)
//dg_terrain_surf[#anim frame,$6] // $6: current frame's surface part yt (relative to surface top  edge)
//dg_terrain_surf[#anim frame,$7] // $7: encoded grid of terrain tile data for this anim frame surface
//draw_surface_part(surf id, surface xl,surface yt, part width,part height, draw xl,draw yt)


//draw_line_colour(terrain_tile_xl_base,viewYT(),terrain_tile_xl_base,viewYB(), c_green,c_green);
//draw_line_colour(terrain_draw_area_xl,viewYT(),terrain_draw_area_xl,viewYB(), c_fuchsia,c_fuchsia);




