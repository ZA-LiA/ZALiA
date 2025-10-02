/// init_RisingBubble()


GO_sprite_init(spr_Rising_Bubble_01);
GO_init_palidx(global.PI_MOB_RED);
GO_depth_init(g.dl_TILE_DEPTHS[|(ds_list_size(g.dl_TILE_DEPTHS))-1] - 1); // Set in front of water & fg terrain
//GO_depth_init(DEPTH_FG1_P3 - 1); // Set in front of water & fg terrain

// setXY(id, xx, (g.camYT-8) + g.VIEW_H);
HSPD1       = $04; // 
hspd_base   = HSPD1;
hspd        = hspd_base;    // $04 or $FC during update
vspd        = $E4;
facing_dir   = 1;
counter     = 0; // 044C[pIndex]


despawn_offscreen_hor = false;




