/// color_tiles()


if (is_undefined( pal_rm_def))  // if there's NO pal for this rm/room
//|| !sprite_exists(palette_image) )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


if (global.palette_image_IS_SURFACE)
{    if(!surface_exists(palette_image)) exit;  } // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
else if(!sprite_exists( palette_image)) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




var _i, _idx;
var _depth, _pi, _PI_SET;

if (rm_pal_qual_lit()) _PI_SET = PI_LIT1;
else                   _PI_SET = PI_DRK1;

for(_i=ds_list_size(g.dl_pal_swap_depths)-1; _i>=0; _i--)
{   // Note: All depths(tile layers) could use any mix of pi(Palette Index).
    _depth =        g.dl_pal_swap_depths[|_i];
    _idx = ds_list_find_index(g.dl_TILE_DEPTHS,_depth);
    
    _pi  = dg_depth_pi[#_idx,1];
    _pi += _PI_SET;
    // 3: permut: permutation
    if (dg_depth_pi[#_idx,3]) _pi = get_pi(_pi, dg_depth_pi[#_idx,3]);
    
    pal_swap_set_tiles(palette_image,_pi, _depth,_depth);
}

// $0302-0314. $0C bytes, 3 or palettes




